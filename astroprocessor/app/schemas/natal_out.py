# =========================================
# FILE: astroprocessor/app/schemas/natal_out.py
# (ОБНОВИТЬ ФАЙЛ)
# =========================================
from __future__ import annotations

from typing import Any, Dict, List, Optional
from uuid import UUID

from pydantic import BaseModel, Field

from .place_out import PlaceResolvedOut


class KnowledgeBlockOut(BaseModel):
    id: str
    candidate_keys: List[str]
    meta: Dict[str, Any]


class RawBlockOut(BaseModel):
    block_id: str
    knowledge_item_id: int
    key: str
    priority: int
    created_at: Optional[str] = None
    is_active: bool
    text: str
    tags: List[Any] = []
    weight: float


class TraceOut(BaseModel):
    selection: List[Dict[str, Any]] = []
    hits: List[Dict[str, Any]] = []


class NatalInterpretOut(BaseModel):
    """
    Строгий контракт ответа /v1/natal/interpret.
    """

    request_id: UUID
    place: PlaceResolvedOut

    natal_data: Dict[str, Any]
    knowledge_blocks: list[KnowledgeBlockOut] = Field(default_factory=list)
    final_text: str
    raw_blocks: list[RawBlockOut] = Field(default_factory=list)
    final_meta: dict = Field(default_factory=dict)
    trace: TraceOut = Field(default_factory=TraceOut)

    @classmethod
    def from_service(
        cls,
        *,
        request_id: UUID,
        place: PlaceResolvedOut,
        payload: Dict[str, Any],
    ) -> "NatalInterpretOut":
        return cls(
            request_id=request_id,
            place=place,
            natal_data=payload.get("natal_data") or {},
            knowledge_blocks=payload.get("knowledge_blocks") or [],
            final_text=payload.get("final_text") or "",
            raw_blocks=payload.get("raw_blocks") or [],
            final_meta=payload.get("final_meta") or {},
            trace=payload.get("trace") or {"selection": [], "hits": []},
        )
