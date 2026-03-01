from __future__ import annotations

from typing import Any, Optional

from pydantic import BaseModel, Field

from app.schemas.natal import BirthPayload, TopicCategory


class ChatStartRequest(BaseModel):
    user_id: Optional[str] = None
    button_id: Optional[str] = None
    topic_categories: list[TopicCategory] = Field(default_factory=list)

    name: str
    birth: BirthPayload


class ChatStartResponse(BaseModel):
    request_id: str
    ok: bool = True
    chat_id: str
    meta: dict[str, Any] = Field(default_factory=dict)
    error: Optional[str] = None


class ChatMessageRequest(BaseModel):
    chat_id: str
    message: str
    topic: Optional[str] = None


class ChatMessageResponse(BaseModel):
    request_id: str
    ok: bool = True
    reply: str
    meta: dict[str, Any] = Field(default_factory=dict)
    error: Optional[str] = None