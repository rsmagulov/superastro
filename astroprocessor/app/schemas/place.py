# ============================================================
# File: astroprocessor/app/schemas/place.py
# ============================================================
from __future__ import annotations

from dataclasses import dataclass

from pydantic import BaseModel, Field


class PlaceResolveRequest(BaseModel):
    query: str = Field(..., min_length=2, max_length=512)
    locale: str = Field(default="ru", min_length=2, max_length=32)


class PlaceResolveResponse(BaseModel):
    request_id: str
    ok: bool
    query: str
    display_name: str | None = None
    lat: float | None = None
    lon: float | None = None
    country_code: str | None = None
    timezone: str | None = None
    source: str | None = None
    error: str | None = None


@dataclass(frozen=True)
class PlaceResolved:
    """
    Унифицированный результат (доменный) для астрологических расчётов.

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