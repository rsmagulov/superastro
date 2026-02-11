from pydantic import BaseModel
from pydantic_settings import BaseSettings, SettingsConfigDict


class Settings(BaseSettings):
    # ВАЖНО: extra="ignore" — игнорируем чужие переменные из общего .env
    model_config = SettingsConfigDict(
        env_file=".env",
        env_file_encoding="utf-8",
        extra="ignore",
    )

    astro_db_path: str = "./astro.db"
    knowledge_db_path: str = "./data/knowledge.db"
    ephemeris_path: str | None = None  # путь к Swiss Ephemeris, optional
    se_ephe_path: str = "./se"
    model_config = SettingsConfigDict(env_prefix="ASTRO_", extra="ignore")
    nominatim_user_agent: str = "SuperAstro_AI_bot/1.0"
    debug_meta: bool = True
    trace_meta: bool = True



settings = Settings()
