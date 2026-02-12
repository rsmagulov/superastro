# astroprocessor/app/schemas/place_out.py
from __future__ import annotations

from typing import Optional

from pydantic import BaseModel


class PlaceResolvedOut(BaseModel):
    ok: bool = True
    query: str
    display_name: Optional[str] = None
    lat: Optional[float] = None
    lon: Optional[float] = None
    country_code: Optional[str] = None
    timezone: Optional[str] = None
    source: Optional[str] = None
    error: Optional[str] = None
