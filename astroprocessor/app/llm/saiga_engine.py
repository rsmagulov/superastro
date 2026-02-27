import asyncio
from dataclasses import dataclass
from typing import Optional, Sequence, Dict, Any, Tuple

import torch
from transformers import AutoModelForCausalLM, AutoTokenizer, BitsAndBytesConfig


@dataclass
class SaigaGenConfig:
    max_new_tokens: int = 900
    temperature: float = 0.6
    top_p: float = 0.9
    repetition_penalty: float = 1.05


class SaigaEngine:
    """
    Thread-safe-ish single-process engine:
    - loads model once
    - serializes generate() with an asyncio lock (GPU model is not safe for parallel calls)
    """

    def __init__(
        self,
        *,
        model_dir: str,
        adapter_dir: Optional[str] = None,
        cpu_offload: bool = True,
        gpu_mem_gb: float = 10.5,
        gen: Optional[SaigaGenConfig] = None,
    ) -> None:
        self.model_dir = model_dir
        self.adapter_dir = adapter_dir
        self.cpu_offload = cpu_offload
        self.gpu_mem_gb = gpu_mem_gb
        self.gen = gen or SaigaGenConfig()

        self._lock = asyncio.Lock()
        self._tokenizer = None
        self._model = None

    def load(self) -> None:
        compute_dtype = torch.float16 if torch.cuda.is_available() else torch.float32
        bnb = BitsAndBytesConfig(
            load_in_4bit=True,
            bnb_4bit_use_double_quant=True,
            bnb_4bit_quant_type="nf4",
            bnb_4bit_compute_dtype=compute_dtype,
        )

        tok = AutoTokenizer.from_pretrained(self.model_dir, use_fast=True)
        if tok.pad_token is None:
            tok.pad_token = tok.eos_token

        kwargs: Dict[str, Any] = dict(
            device_map="auto",
            quantization_config=bnb,
            dtype=compute_dtype,
            low_cpu_mem_usage=True,
        )

        if self.cpu_offload and torch.cuda.is_available():
            kwargs["offload_folder"] = "./offload_llm"
            kwargs["max_memory"] = {0: f"{self.gpu_mem_gb}GiB", "cpu": "32GiB"}

        model = AutoModelForCausalLM.from_pretrained(self.model_dir, **kwargs)
        model.eval()

        if self.adapter_dir:
            from peft import PeftModel
            model = PeftModel.from_pretrained(model, self.adapter_dir)
            model.eval()

        self._tokenizer = tok
        self._model = model

    def _encode_chat(self, messages):
        enc = self._tokenizer.apply_chat_template(
            messages, add_generation_prompt=True, return_tensors="pt"
        )
        if isinstance(enc, torch.Tensor):
            return enc, None
        return enc["input_ids"], enc.get("attention_mask")

    def _generate_sync(self, messages) -> str:
        tok = self._tokenizer
        model = self._model

        input_ids, attn = self._encode_chat(messages)
        input_ids = input_ids.to(model.device)
        if attn is not None:
            attn = attn.to(model.device)

        with torch.no_grad():
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

    async def generate(self, *, system: str, user: str) -> str:
        if self._model is None or self._tokenizer is None:
            self.load()

        messages = [
            {"role": "system", "content": system},
            {"role": "user", "content": user},
        ]

        async with self._lock:
            return await asyncio.to_thread(self._generate_sync, messages)