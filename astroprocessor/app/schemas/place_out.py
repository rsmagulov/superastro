# =========================================
# FILE: astroprocessor/app/schemas/place_out.py
# =========================================
from __future__ import annotations

from pydantic import BaseModel

from .place import PlaceResolved


class PlaceResolvedOut(BaseModel):
    ok: bool

    query_raw: str
    query_norm: str
    locale: str

    display_name: str | None = None
    lat: float | None = None
    lon: float | None = None
    country_code: str | None = None
    tz_str: str | None = None

    source: str | None = None
    error: str | None = None

    @classmethod
    def from_domain(cls, p: PlaceResolved) -> "PlaceResolvedOut":
        return cls(
            ok=p.ok,
            query_raw=p.query_raw,
            query_norm=p.query_norm,
            locale=p.locale,
            display_name=p.display_name,
            lat=p.lat,
            lon=p.lon,
            country_code=p.country_code,
            tz_str=p.tz_str,
            source=p.source,
            error=p.error,
        )
