# astroprocessor/app/llm/saiga_engine.py
from __future__ import annotations

import asyncio
import os
from dataclasses import dataclass
from typing import Any, Dict, Optional, Sequence, TYPE_CHECKING

if TYPE_CHECKING:
    import torch  # only for type checkers


@dataclass
class SaigaGenConfig:
    max_new_tokens: int = 900
    temperature: float = 0.3
    top_p: float = 0.85
    repetition_penalty: float = 1.05

def is_ready(self) -> bool:
    return bool(self._ready and self._model is not None and self._tokenizer is not None)

def _sanitize_torch_logging_env() -> None:
    """
    Uvicorn loads .env before importing the app; some TORCH_* vars may break torch 2.6 logging init.
    We remove them right before importing torch.
    """
    for k in (
        "TORCH_LOGS",
        "TORCH_LOGS_FORMAT",
        "TORCHINDUCTOR_LOG_LEVEL",
        "TORCH_COMPILE_DEBUG",
        "TORCHDYNAMO_VERBOSE",
    ):
        os.environ.pop(k, None)

    # keep unset (don't set to ""), safest for this torch logging crash scenario
    os.environ.pop("TORCH_LOGS", None)

    os.environ.setdefault("OMP_NUM_THREADS", "1")
    os.environ.setdefault("MKL_NUM_THREADS", "1")
    os.environ.setdefault("TOKENIZERS_PARALLELISM", "false")
    os.environ.setdefault("MALLOC_ARENA_MAX", "1")
    os.environ.setdefault(
        "PYTORCH_CUDA_ALLOC_CONF",
        "expandable_segments:True,max_split_size_mb:128",
    )

def _apply_bnb_meta_state_dict_patch() -> None:
    """
    accelerate dispatch checks `len(module.state_dict()) > 0`.
    bitsandbytes 4bit modules can crash on meta tensors inside state_dict():
      RuntimeError: Tensor.item() cannot be called on meta tensors

    Workaround: for bnb modules, return a tiny dummy dict on that specific error.
    """
    import torch

    orig = getattr(torch.nn.Module, "state_dict", None)
    if orig is None:
        return
    if getattr(orig, "_superastro_bnb_meta_patch", False):
        return

    def patched_state_dict(self, *args, **kwargs):  # type: ignore[no-redef]
        try:
            return orig(self, *args, **kwargs)
        except RuntimeError as e:
            msg = str(e)
            is_bnb = self.__class__.__module__.startswith("bitsandbytes")
            if is_bnb and "meta tensors" in msg and "item()" in msg:
                return {"_bnb_meta_dummy": torch.tensor(0)}
            raise

    patched_state_dict._superastro_bnb_meta_patch = True  # type: ignore[attr-defined]
    torch.nn.Module.state_dict = patched_state_dict  # type: ignore[assignment]

class SaigaEngine:
    """
    Single-process engine: model is loaded once; generation is serialized by asyncio.Lock.
    """

    def __init__(
        self,
        *,
        model_dir: str,
        adapter_dir: Optional[str] = None,
        cpu_offload: bool = True,
        gpu_mem_gb: float = 4.5,
        gen: Optional[SaigaGenConfig] = None,
    ) -> None:
        self.model_dir = model_dir
        self.adapter_dir = adapter_dir
        self.cpu_offload = cpu_offload
        self.gpu_mem_gb = gpu_mem_gb
        self.gen = gen or SaigaGenConfig()

        self._lock = asyncio.Lock()
        self._tokenizer: Any = None
        self._model: Any = None
        self._ready = False

    def load(self) -> None:
        _sanitize_torch_logging_env()

        import torch
        from transformers import AutoModelForCausalLM, AutoTokenizer, BitsAndBytesConfig

        try:
            torch.set_num_threads(1)
        except Exception:
            pass

        compute_dtype = torch.float16 if torch.cuda.is_available() else torch.float32

        bnb = BitsAndBytesConfig(
            load_in_4bit=True,
            bnb_4bit_use_double_quant=True,
            bnb_4bit_quant_type="nf4",
            bnb_4bit_compute_dtype=compute_dtype,
            llm_int8_enable_fp32_cpu_offload=bool(self.cpu_offload),
        )

        tok = AutoTokenizer.from_pretrained(self.model_dir, use_fast=True)
        if tok.pad_token is None:
            tok.pad_token = tok.eos_token

        kwargs: Dict[str, Any] = dict(
            quantization_config=bnb,
            torch_dtype=compute_dtype,
            low_cpu_mem_usage=True,
        )

        if torch.cuda.is_available() and not self.cpu_offload:
            # ✅ GPU-only: no offload, no meta tensors
            kwargs["device_map"] = {"": 0}
        else:
            # оставь как у тебя было для cpu_offload=True (если он нужен потом)
            os.makedirs("./offload_llm", exist_ok=True)
            safe_gb = max(1.0, float(self.gpu_mem_gb) - 0.5)
            kwargs.update(
                dict(
                    device_map="auto",
                    offload_folder="./offload_llm",
                    offload_state_dict=True,
                    max_memory={0: f"{safe_gb}GiB", "cpu": "32GiB"},
                )
            )

        _apply_bnb_meta_state_dict_patch()
        # ✅ load base WITH device_map/offload (no dispatch_model call!)
        model = AutoModelForCausalLM.from_pretrained(
            self.model_dir,
            attn_implementation="sdpa",
            **kwargs,
        )
        model.eval()
        model.config.use_cache = True
               
        self._tokenizer = tok
        self._model = model
        self._ready = True

    def _encode_chat(self, messages: Sequence[Dict[str, Any]]):
        enc = self._tokenizer.apply_chat_template(
            messages, add_generation_prompt=True, return_tensors="pt"
        )
        # Avoid torch.Tensor reference (keeps Pylance happy without global torch import)
        if hasattr(enc, "shape"):
            return enc, None
        return enc["input_ids"], enc.get("attention_mask")

    def _generate_sync(self, messages: Sequence[Dict[str, Any]]) -> str:
        import torch

        tok = self._tokenizer
        model = self._model

        input_ids, attn = self._encode_chat(messages)
        input_ids = input_ids.to(model.device)
        if attn is not None:
            attn = attn.to(model.device)

        with torch.inference_mode():
            out = model.generate(
                input_ids=input_ids,
                attention_mask=attn,
                max_new_tokens=self.gen.max_new_tokens,
                do_sample=True,
                temperature=self.gen.temperature,
                top_p=self.gen.top_p,
                repetition_penalty=self.gen.repetition_penalty,
                eos_token_id=tok.eos_token_id,
                pad_token_id=tok.pad_token_id,
            )

        gen_tokens = out[0][input_ids.shape[-1] :]
        return tok.decode(gen_tokens, skip_special_tokens=True).strip()

    async def generate_chat(self, messages: Sequence[Dict[str, Any]]) -> str:
        if not self._ready or self._model is None or self._tokenizer is None:
            raise RuntimeError("llm_not_ready")
        async with self._lock:
            return await asyncio.to_thread(self._generate_sync, list(messages))