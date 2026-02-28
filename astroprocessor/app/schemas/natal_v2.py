# ============================================================
# File: astroprocessor/app/schemas/natal_v2.py
# ============================================================
from __future__ import annotations

from typing import Any, Optional

from pydantic import BaseModel, Field

from app.schemas.natal import BirthPayload
from app.schemas.place_out import PlaceResolvedOut


class NatalV2Request(BaseModel):
    name: str
    birth: BirthPayload


class NatalV2Response(BaseModel):
    request_id: str
    ok: bool = True

    natal_data: dict[str, Any] = Field(default_factory=dict)
    place: Optional[PlaceResolvedOut] = None

    meta: dict[str, Any] = Field(default_factory=dict)
    error: Optional[str] = None