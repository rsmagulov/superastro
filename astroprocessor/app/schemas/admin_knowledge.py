from __future__ import annotations

from datetime import datetime
from typing import Any, Dict, List, Optional

from pydantic import BaseModel, Field


class KnowledgeItemOut(BaseModel):
    id: int
    key: str
    topic_category: Optional[str] = None
    locale: str
    text: str
    priority: int = 100
    created_at: Optional[str] = None  # хранится TEXT в SQLite
    is_active: bool
    meta_json: str = "{}"
    meta: Dict[str, Any] = Field(default_factory=dict)


class KnowledgeItemCreate(BaseModel):
    key: str = Field(min_length=1)
    topic_category: Optional[str] = None
    locale: str = Field(min_length=1)
    text: str = Field(min_length=1)
    priority: int = 100
    is_active: bool = True
    meta_json: str = "{}"
    meta: Optional[Dict[str, Any]] = None


class KnowledgeItemPatch(BaseModel):
    key: Optional[str] = None
    topic_category: Optional[Optional[str]] = None  # allow set null explicitly
    locale: Optional[str] = None
    text: Optional[str] = None
    priority: Optional[int] = None
    is_active: Optional[bool] = None
    meta_json: Optional[str] = None
    meta: Optional[Dict[str, Any]] = None


class KnowledgeItemListOut(BaseModel):
    items: list[KnowledgeItemOut]
    total: int
    limit: int
    offset: int


class BulkFillDefaultMetaRequest(BaseModel):
    only_active: bool = True
    only_empty_meta: bool = True
    default_tone: str = "нейтральный"
    default_abstraction_level: str = "психологический"


class BulkFilter(BaseModel):
    q: Optional[str] = None
    locale: Optional[str] = None
    topic_category: Optional[str] = None  # "__NULL__" для NULL
    is_active: Optional[bool] = None
    ids: Optional[List[int]] = None  # если UI выделил строки — работаем по ним


class BulkSetToneRequest(BaseModel):
    filter: BulkFilter = Field(default_factory=BulkFilter)
    tone: str


class BulkSetAbstractionRequest(BaseModel):
    filter: BulkFilter = Field(default_factory=BulkFilter)
    abstraction_level: str


class BulkTagRequest(BaseModel):
    filter: BulkFilter = Field(default_factory=BulkFilter)
    tag: str


class BulkSetActiveRequest(BaseModel):
    filter: BulkFilter = Field(default_factory=BulkFilter)
    is_active: bool
