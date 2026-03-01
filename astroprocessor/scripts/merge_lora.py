#!/usr/bin/env python3
"""
Merge PEFT LoRA adapter into base model and save merged weights.

Run from superastro .venv:
  python scripts/merge_lora.py \
    --base /home/ruslan/Documents/LLM/models/saiga_llama3_8b \
    --adapter /home/ruslan/Documents/LLM/outputs/saiga_astrology_qlora \
    --out /home/ruslan/Documents/LLM/models/saiga_llama3_8b_merged
"""
from __future__ import annotations

import argparse
import os
from pathlib import Path

import torch
from transformers import AutoModelForCausalLM, AutoTokenizer
from peft import PeftModel


def parse_args() -> argparse.Namespace:
    p = argparse.ArgumentParser()
    p.add_argument("--base", required=True)
    p.add_argument("--adapter", required=True)
    p.add_argument("--out", required=True)
    return p.parse_args()


def main() -> None:
    args = parse_args()
    out_dir = Path(args.out)
    out_dir.mkdir(parents=True, exist_ok=True)

    tok = AutoTokenizer.from_pretrained(args.base, use_fast=True)
    if tok.pad_token is None:
        tok.pad_token = tok.eos_token

    # load on CPU to avoid VRAM spikes
    base = AutoModelForCausalLM.from_pretrained(
        args.base,
        torch_dtype=torch.float16,
        low_cpu_mem_usage=True,
        device_map="cpu",
    )
    base.eval()

    model = PeftModel.from_pretrained(base, args.adapter, is_trainable=False)
    model.eval()

    merged = model.merge_and_unload()
    merged.eval()

    tok.save_pretrained(out_dir)
    merged.save_pretrained(out_dir, safe_serialization=True)
    print("Merged model saved to:", out_dir)


if __name__ == "__main__":
    # avoid torch logging env surprises
    for k in ("TORCH_LOGS", "TORCH_LOGS_FORMAT", "TORCHINDUCTOR_LOG_LEVEL"):
        os.environ.pop(k, None)
    main()