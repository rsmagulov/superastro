# astroprocessor/app/settings.py
from __future__ import annotations

from typing import Any

from pydantic import Field
from pydantic_settings import BaseSettings, SettingsConfigDict


class Settings(BaseSettings):
    """
    Настройки astroprocessor.

    ENV:
      - берём из .env (если есть)
      - префикс ASTRO_
      - лишние переменные игнорируем (extra="ignore")
    """

    model_config = SettingsConfigDict(
        env_prefix="ASTRO_",
        env_file=".env",
        env_file_encoding="utf-8",
        extra="ignore",
    )

    build_version: str = Field(default="dev")
    knowledge_build_version: str | None = Field(default=None)

    button_topic_map: dict[str, list[str]] = Field(
        default_factory=lambda: {
            "btn_core_pack": ["personality_core", "career"],
            "btn_career": ["career"],
            "btn_psychology": ["psychology"],
        }
    )

    astro_db_path: str = "./astro.db"
    knowledge_db_path: str = "./data/knowledge.db"
    staging_db_path: str = "./data/staging/staging.db"

    # NEW: chat db (server-side chat state)
    chat_db_path: str = "./data/chat.db"

    ephemeris_path: str | None = None  # опционально
    se_ephe_path: str = "./se"

    nominatim_user_agent: str = "SuperAstro_AI_bot/1.0"

    debug_meta: bool = True
    trace_meta: bool = True

    button_catalog: dict[str, dict[str, Any]] = Field(default_factory=dict)

    structured_errors: bool = Field(default=True)

    # -------------------------
    # LLM (in-process SaigaEngine)
    # -------------------------
    llm_enabled: bool = Field(default=False)  # ASTRO_LLM_ENABLED=true
    llm_max_new_tokens: int = Field(default=900)
    llm_temperature: float = Field(default=0.6)
    llm_top_p: float = Field(default=0.9)
    llm_repetition_penalty: float = Field(default=1.05)

    # -------------------------
    # Saiga (subprocess inference)
    # -------------------------
    saiga_server_url: str = "http://127.0.0.1:8002"
    saiga_python_path: str = "/home/ruslan/Documents/LLM/saiga_env/bin/python"
    saiga_infer_path: str = "/home/ruslan/Documents/LLM/infer_saiga.py"
    saiga_model_dir: str = "/home/ruslan/Documents/LLM/models/saiga_llama3_8b"
    saiga_adapter_dir: str | None = None

    saiga_cpu_offload: bool = True
    saiga_gpu_mem_gb: float = 10.5
    saiga_offload_dir: str = "/home/ruslan/Documents/LLM/offload"
    

settings = Settings()