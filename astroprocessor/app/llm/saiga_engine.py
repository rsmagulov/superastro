from __future__ import annotations

import sys
import subprocess
import requests
from dataclasses import dataclass

from app.settings import settings


@dataclass(frozen=True)
class SaigaConfig:
    infer_path: str
    model_dir: str
    adapter_dir: str | None
    cpu_offload: bool
    gpu_mem_gb: float
    offload_dir: str


class SaigaEngine:
    def __init__(self, cfg: SaigaConfig | None = None) -> None:
        self.cfg = cfg or SaigaConfig(
            infer_path=settings.saiga_infer_path,
            model_dir=settings.saiga_model_dir,
            adapter_dir=settings.saiga_adapter_dir,
            cpu_offload=settings.saiga_cpu_offload,
            gpu_mem_gb=settings.saiga_gpu_mem_gb,
            offload_dir=settings.saiga_offload_dir,
        )

    def generate(self, *, system_prompt: str, user_prompt: str) -> str:
        url = getattr(settings, "saiga_server_url", "http://127.0.0.1:8002").rstrip("/")
        endpoint = f"{url}/generate"

        payload = {
            "system": system_prompt,
            "user": user_prompt,
            "max_new_tokens": 600,
            "temperature": 0.7,
            "top_p": 0.9,
            "repetition_penalty": 1.05,
        }

        try:
            r = requests.post(endpoint, json=payload, timeout=600)
        except requests.RequestException as e:
            raise RuntimeError(f"Saiga server request failed: {e}") from e

        if r.status_code != 200:
            raise RuntimeError(f"Saiga server error {r.status_code}: {r.text[:2000]}")

        data = r.json()
        return str(data.get("answer", "")).strip()