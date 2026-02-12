# astroprocessor/app/settings.py
from __future__ import annotations

from pydantic import Field

from pydantic_settings import BaseSettings, SettingsConfigDict

from typing import Any


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
    knowledge_build_version: str | None = Field(default=None)  # <-- ADDED

    button_topic_map: dict[str, list[str]] = Field(
        default_factory=lambda: {
            "btn_core_pack": ["personality_core", "career"],
            "btn_career": ["career"],
            "btn_psychology": ["psychology"],
        }
    )

    astro_db_path: str = "./astro.db"
    knowledge_db_path: str = "./data/knowledge.db"

    ephemeris_path: str | None = None  # опционально
    se_ephe_path: str = "./se"

    nominatim_user_agent: str = "SuperAstro_AI_bot/1.0"

    debug_meta: bool = True
    trace_meta: bool = True

    button_catalog: dict[str, dict[str, Any]] = Field(default_factory=dict)

    structured_errors: bool = Field(default=True)

settings = Settings()
