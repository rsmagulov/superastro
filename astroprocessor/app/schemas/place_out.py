# ============================================================
# File: astroprocessor/app/schemas/place_out.py
# ============================================================
from __future__ import annotations

from typing import Optional

from pydantic import AliasChoices, BaseModel, Field

from app.schemas.place import PlaceResolved


class PlaceResolvedOut(BaseModel):
    ok: bool = True
    query: str
    display_name: Optional[str] = None
    lat: Optional[float] = None
    lon: Optional[float] = None
    country_code: Optional[str] = None
    timezone: Optional[str] = Field(
        default=None,
        validation_alias=AliasChoices("timezone", "tz_str"),
    )
    source: Optional[str] = None
    error: Optional[str] = None

    @classmethod
    def from_domain(cls, *, place: PlaceResolved, query: str) -> "PlaceResolvedOut":
        return cls(
            ok=bool(place.ok),
            query=query,
            display_name=place.display_name,
            lat=place.lat,
            lon=place.lon,
            country_code=place.country_code,
            timezone=place.tz_str,
            source=place.source,
            error=place.error,
        )

    @classmethod
    def dump_from_domain(cls, *, place: PlaceResolved, query: str) -> dict:
        return cls.from_domain(place=place, query=query).model_dump()