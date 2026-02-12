# astroprocessor/app/schemas/natal_out.py
from __future__ import annotations

from typing import Any, Literal, Optional

from pydantic import BaseModel, Field

from .natal import TopicCategory
from .place_out import PlaceResolvedOut


class RawBlockOut(BaseModel):
    block_id: str
    key: str
    knowledge_item_id: int
    priority: int
    created_at: Optional[str] = None
    text: str


class NatalInterpretResponse(BaseModel):
    request_id: str
    ok: bool = True

    topic_category: Optional[TopicCategory] = None
    coverage: Literal["ok", "low_coverage", "empty"] = "empty"
    text: str = ""

    # удобно для дебага/админки
    place: Optional[PlaceResolvedOut] = None
    raw_blocks: list[RawBlockOut] = Field(default_factory=list)
    meta: dict[str, Any] = Field(default_factory=dict)

    error: Optional[str] = None
