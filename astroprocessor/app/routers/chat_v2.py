from __future__ import annotations

import json
from typing import Optional, Literal

from fastapi import APIRouter, Depends, HTTPException, Query, Request
from sqlalchemy.ext.asyncio import AsyncSession

from app.db import get_chat_session, get_session
from app.schemas.chat_v2 import ChatMessageRequest, ChatMessageResponse, ChatStartRequest, ChatStartResponse
from app.services.chart_service import ChartService
from app.services.chat_repo import ChatRepo
from app.services.geocode import resolve_place
from app.services.natal_context import dumps_natal_context_v1
from app.settings import settings
from dataclasses import asdict
from app.services.signals_builder import build_signals, build_signals_structured

router = APIRouter(prefix="/v2", tags=["chat_v2"])
_chart_service = ChartService()
_repo = ChatRepo()


def _resolve_topics(button_id: Optional[str], topic_categories: list[str]) -> list[str]:
    out: list[str] = []
    if topic_categories:
        out.extend([str(x) for x in topic_categories])
    if button_id:
        m = getattr(settings, "button_topic_map", {}) or {}
        out.extend([str(x) for x in (m.get(button_id) or [])])

    seen = set()
    ded = []
    for t in out:
        if t not in seen:
            seen.add(t)
            ded.append(t)
    return ded

@router.get("/health/llm")
async def llm_health(request: Request):
    return {
        "llm_configured": getattr(request.app.state, "llm", None) is not None,
        "llm_loading": bool(getattr(request.app.state, "llm_loading", False)),
        "llm_ready": bool(getattr(request.app.state, "llm_ready", False)),
    }

@router.get("/chat/signals")
async def chat_signals(
    request: Request,
    chat_id: str = Query(...),
    topic: Optional[str] = Query(default=None),
    format: Literal["compact", "full"] = Query(default="compact"),
    chat_session: AsyncSession = Depends(get_chat_session),
):
    chat = await _repo.get_chat(chat_session, chat_id=chat_id)
    if chat is None:
        raise HTTPException(status_code=404, detail="chat_not_found")

    try:
        natal_ctx = json.loads(chat.natal_context_json)
    except Exception:
        natal_ctx = {}

    active_topic = topic if topic is not None else chat.active_topic

    if format == "compact":
        signals = build_signals(natal_ctx, topic=active_topic, max_items=12, max_aspects=8)
        return {
            "request_id": getattr(request.state, "request_id", ""),
            "ok": True,
            "chat_id": chat_id,
            "topic": active_topic,
            "signals": signals,
        }

    resp = build_signals_structured(natal_ctx, topic=active_topic, max_items=12, max_aspects=8)
    return {
        "request_id": getattr(request.state, "request_id", ""),
        "ok": True,
        "chat_id": chat_id,
        "topic": active_topic,
        "data": asdict(resp),
    }   

@router.post("/chat/start", response_model=ChatStartResponse)
async def chat_start(
    request: Request,
    req: ChatStartRequest,
    locale: str = Query(default="ru"),
    session: AsyncSession = Depends(get_session),
    chat_session: AsyncSession = Depends(get_chat_session),
) -> ChatStartResponse:
    if locale != "ru":
        raise HTTPException(status_code=422, detail="only_ru_locale_supported")

    place = await resolve_place(req.birth.place_query, locale, session)
    if not place.ok or not place.tz_str:
        return ChatStartResponse(
            request_id=getattr(request.state, "request_id", ""),
            ok=False,
            chat_id="",
            meta={"place_ok": bool(place.ok), "place_error": place.error},
            error=place.error or "place_not_resolved",
        )

    birth = req.birth.to_birth_input().to_domain()
    natal_data = await _chart_service.build_natal(user_name=req.name, birth=birth, place=place)
    natal_context_json = dumps_natal_context_v1(natal_data)

    topics = _resolve_topics(req.button_id, req.topic_categories)
    active_topic = topics[0] if topics else None

    if req.user_id:
        await _repo.ensure_user(chat_session, user_id=req.user_id)

    chat_id = await _repo.create_chat(
        chat_session,
        natal_context_json=natal_context_json,
        user_id=req.user_id,
        active_topic=active_topic,
    )

    return ChatStartResponse(
        request_id=getattr(request.state, "request_id", ""),
        ok=True,
        chat_id=chat_id,
        meta={"active_topic": active_topic, "topics": topics},
        error=None,
    )


@router.post("/chat", response_model=ChatMessageResponse)
async def chat_message(
    request: Request,
    req: ChatMessageRequest,
    chat_session: AsyncSession = Depends(get_chat_session),
) -> ChatMessageResponse:
    llm_engine = getattr(request.app.state, "llm", None)
    if llm_engine is None:
        raise HTTPException(status_code=503, detail="llm_not_configured")
    
    if getattr(request.app.state, "llm_loading", False) or not getattr(request.app.state, "llm_ready", False):
        raise HTTPException(status_code=503, detail="llm_loading")

    if hasattr(llm_engine, "is_ready") and not llm_engine.is_ready():
        raise HTTPException(status_code=503, detail="llm_loading")

    chat = await _repo.get_chat(chat_session, chat_id=req.chat_id)
    if chat is None:
        raise HTTPException(status_code=404, detail="chat_not_found")

    topic = req.topic if req.topic is not None else chat.active_topic
    if req.topic is not None:
        await _repo.set_chat_topic(chat_session, chat_id=chat.chat_id, topic=req.topic)

    try:
        natal_ctx = json.loads(chat.natal_context_json)
    except Exception:
        natal_ctx = {}

    user_profile = {}
    if chat.user_id:
        user_profile = await _repo.get_user_profile(chat_session, user_id=chat.user_id)

    history = await _repo.get_messages(chat_session, chat_id=chat.chat_id, limit=12)
    history_plus = [*history, {"role": "user", "content": req.message}]

    try:
        reply = await _chart_service.chat_with_natal_v2(
            natal_data=natal_ctx,
            topics=[topic] if topic else [],
            messages=history_plus,
            llm_engine=llm_engine,
            user_profile=user_profile,
        )
    except RuntimeError as e:
        if str(e) == "llm_not_ready":
            raise HTTPException(status_code=503, detail="llm_loading")
        raise

    await _repo.add_message(chat_session, chat_id=chat.chat_id, role="user", content=req.message)
    await _repo.add_message(chat_session, chat_id=chat.chat_id, role="assistant", content=reply)

    return ChatMessageResponse(
        request_id=getattr(request.state, "request_id", ""),
        ok=True,
        reply=reply,
        meta={"active_topic": topic, "user_id": chat.user_id},
        error=None,
    )