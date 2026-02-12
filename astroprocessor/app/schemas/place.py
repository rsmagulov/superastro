# ============================================================
# File: astroprocessor/app/schemas/place.py
# ============================================================
from __future__ import annotations

from dataclasses import dataclass
from typing import Optional

from pydantic import BaseModel


class PlaceResolveRequest(BaseModel):
    query: str
    locale: str = "ru"


class PlaceResolveResponse(BaseModel):
    """
    Контракт /v1/place/resolve — соответствует тестам (query_raw, tz_str, без request_id).
    """
    ok: bool

    query_raw: str
    query_norm: str
    locale: str

    display_name: Optional[str] = None
    lat: Optional[float] = None
    lon: Optional[float] = None
    country_code: Optional[str] = None
    tz_str: Optional[str] = None

    source: Optional[str] = None
    error: Optional[str] = None


@dataclass(frozen=True)
class PlaceResolved:
    """
    Унифицированный результат resolve_place() для всего проекта.

    Важно:
    - tz_str: строка таймзоны (например "Asia/Almaty"), так её ожидает Kerykeion.
    - ok=False => остальное может быть None.
    """

    ok: bool
    query_raw: str
    query_norm: str
    locale: str

    display_name: str | None = None
    lat: float | None = None
    lon: float | None = None
    country_code: str | None = None
    tz_str: str | None = None

    source: str | None = None  # "cache" | "nominatim"
    error: str | None = None

    def require_ready(self) -> None:
        if not self.ok:
            raise ValueError(self.error or "place_not_resolved")
        if self.lat is None or self.lon is None:
            raise ValueError("place_missing_lat_lon")
        if not self.tz_str:
            raise ValueError("place_missing_tz")