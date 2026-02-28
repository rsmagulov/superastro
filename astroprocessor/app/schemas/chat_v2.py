from __future__ import annotations

from typing import Any, Optional

from pydantic import BaseModel, Field

from app.schemas.natal import BirthPayload


class ChatStartRequest(BaseModel):
    """
    Iteration-2: chat/start builds natal_data itself from birth payload.

    If user_id is omitted, a stable 'anon' user is used.
    """
    user_id: Optional[str] = None
    name: str
    birth: BirthPayload
    active_topic: Optional[str] = "general"
    locale: Optional[str] = "ru-RU"


class ChatStartResponse(BaseModel):
    ok: bool = True
    request_id: str
    chat_id: str
    user_id: str
    active_topic: Optional[str] = None
    natal_context: dict[str, Any] = Field(default_factory=dict)


class ChatMessageRequest(BaseModel):
    chat_id: str
    message: str


class ChatMessageResponse(BaseModel):
    ok: bool = True
    request_id: str
    chat_id: str
    answer: str