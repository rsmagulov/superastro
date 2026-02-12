# ============================================================
# File: astroprocessor/app/schemas/public_v2.py  (REPLACE)
# ============================================================
from __future__ import annotations

from typing import Any, Literal, Optional

from pydantic import BaseModel, Field

from app.schemas.natal import BirthPayload, TopicCategory

CoverageV2 = Literal["high", "low", "missing"]


class InterpretV2Request(BaseModel):
    button_id: Optional[str] = None
    topic_categories: list[TopicCategory] = Field(default_factory=list)

    name: str
    birth: BirthPayload


class TopicResultV2(BaseModel):
    topic_category: TopicCategory
    coverage: CoverageV2 = "missing"
    messages: list[str] = Field(default_factory=list)


class InterpretV2Response(BaseModel):
    request_id: str
    ok: bool = True
    coverage: CoverageV2 = "missing"

    messages: list[str] = Field(default_factory=list)
    topics: list[TopicResultV2] = Field(default_factory=list)

    meta: dict[str, Any] = Field(default_factory=dict)
    error: Optional[str] = None


class ButtonsV2Response(BaseModel):
    ok: bool = True
    buttons: dict[str, list[TopicCategory]] = Field(default_factory=dict)
