# ============================================================
# File: astroprocessor/app/schemas/place_out.py
# ============================================================
from __future__ import annotations

from typing import Optional

from pydantic import AliasChoices, BaseModel, Field


class PlaceResolvedOut(BaseModel):
    ok: bool = True
    query: str
    display_name: Optional[str] = None
    lat: Optional[float] = None
    lon: Optional[float] = None
    country_code: Optional[str] = None

    # Важно: наружу отдаём "timezone", но принимаем и "tz_str" (доменный формат)
    timezone: Optional[str] = Field(
        default=None,
        validation_alias=AliasChoices("timezone", "tz_str"),
    )

    source: Optional[str] = None
    error: Optional[str] = None