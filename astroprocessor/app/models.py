from __future__ import annotations

from sqlalchemy import JSON, DateTime, Index, Integer, String
from sqlalchemy.orm import Mapped, mapped_column

from .db import Base


class GeocodeCache(Base):
    __tablename__ = "geocode_cache"

    id: Mapped[int] = mapped_column(Integer, primary_key=True, autoincrement=True)

    # Нормализованный запрос (см. normalize_query)
    query_norm: Mapped[str] = mapped_column(String(512), nullable=False)

    # Локаль/язык ответа (для Nominatim Accept-Language)
    locale: Mapped[str] = mapped_column(String(32), nullable=False, default="ru-RU")

    # Сырой запрос, как ввёл пользователь (для дебага)
    query_raw: Mapped[str] = mapped_column(String(512), nullable=False)

    # Результат (lat/lon/tz/display_name/...)
    payload: Mapped[dict] = mapped_column(JSON, nullable=False)

    created_at: Mapped[str] = mapped_column(DateTime, nullable=False)
    expires_at: Mapped[str] = mapped_column(DateTime, nullable=False)


Index("ix_geocode_cache_query_locale", GeocodeCache.query_norm, GeocodeCache.locale)
