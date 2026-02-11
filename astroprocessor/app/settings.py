# astroprocessor/app/settings.py
from __future__ import annotations

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

    astro_db_path: str = "./astro.db"
    knowledge_db_path: str = "./data/knowledge.db"

    ephemeris_path: str | None = None  # опционально
    se_ephe_path: str = "./se"

    nominatim_user_agent: str = "SuperAstro_AI_bot/1.0"

    debug_meta: bool = True
    trace_meta: bool = True


settings = Settings()
