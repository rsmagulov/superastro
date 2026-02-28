from __future__ import annotations

import json
from typing import Any

from fastapi import APIRouter, Depends, HTTPException, Query, Request
from sqlalchemy.ext.asyncio import AsyncSession

from app.db import get_chat_session, get_session
from app.llm.saiga_engine import SaigaEngine
from app.schemas.chat_v2 import (
    ChatMessageRequest,
    ChatMessageResponse,
    ChatStartRequest,
    ChatStartResponse,
)
from app.services.chat_repo import ChatRepo
from app.services.chart_service import ChartService
from app.services.geocode import resolve_place
from app.services.natal_context_v1 import build_natal_context_v1

router = APIRouter(prefix="/v2/chat", tags=["chat_v2"])

_chart = ChartService()
_repo = ChatRepo()
_llm = SaigaEngine()


def _system_prompt(*, natal_context: dict[str, Any], user_profile_json: str | None) -> str:
    profile_part = ""
    if user_profile_json:
        profile_part = f"\n\nUSER_PROFILE_JSON:\n{user_profile_json}"
    else:
        profile_part = "\n\nUSER_PROFILE_JSON: (absent)"

    return (
        "Ты — астрологический ассистент SuperAstro.\n"
        "Отвечай ТОЛЬКО на основе фактов из NATAL_CONTEXT_JSON.\n"
        "USER_PROFILE_JSON может отсутствовать — это НЕ причина отказываться отвечать.\n"
        "Запрещено использовать внешние знания о натальной карте, если этого нет в NATAL_CONTEXT_JSON.\n"
        "Если данных для ответа не хватает — перечисли, каких именно полей не хватает.\n"
        "Не делай общих советов и не выдумывай положения планет/домов/аспектов.\n\n"
        "Если в NATAL_CONTEXT_JSON нет houses или houses пустой — запрещено упоминать дома (1/2/…/10 дом).\n"
        "Каждое утверждение должно ссылаться на конкретное поле NATAL_CONTEXT_JSON (пример: planets.sun.sign, aspects_sorted[0].p1/aspect/orb, angles.asc.sign). Если поля нет — нельзя утверждать это; вместо этого скажи “в контексте нет поля X”.\n"
        "Если в NATAL_CONTEXT_JSON нет sign/degree/house для объекта — запрещено называть знак/градус/дом.\n"
        f"NATAL_CONTEXT_JSON:\n{json.dumps(natal_context, ensure_ascii=False, sort_keys=True)}"
        f"{profile_part}"
    )


@router.post("/start", response_model=ChatStartResponse)
async def chat_start(
    request: Request,
    req: ChatStartRequest,
    locale_q: str = Query(None, description="optional override locale"),
    session: AsyncSession = Depends(get_session),          # astro.db (places)
    chat_session: AsyncSession = Depends(get_chat_session) # chat.db
) -> ChatStartResponse:
    request_id = getattr(request.state, "request_id", "")
    user_id = (req.user_id or "anon").strip() or "anon"
    locale = (locale_q or req.locale or "ru-RU").strip() or "ru-RU"
    active_topic = (req.active_topic or "general").strip() or "general"

    await _repo.ensure_user(chat_session, user_id=user_id)

    place = await resolve_place(req.birth.place_query, locale, session)
    if not getattr(place, "ok", True) or not getattr(place, "tz_str", None):
        raise HTTPException(status_code=422, detail=f"place_not_resolved: {getattr(place, 'error', None) or 'unknown'}")

    birth = req.birth.to_birth_input().to_domain()
    natal_data = await _chart.build_natal(user_name=req.name, birth=birth, place=place)

    natal_context = build_natal_context_v1(natal_data)

    chat_id = await _repo.create_chat(
        chat_session,
        user_id=user_id,
        active_topic=active_topic,
        natal_context_json=natal_context,
    )

    return ChatStartResponse(
        ok=True,
        request_id=request_id,
        chat_id=chat_id,
        user_id=user_id,
        active_topic=active_topic,
        natal_context={"__probe": natal_context.get("__probe", {})},
    )


@router.post("", response_model=ChatMessageResponse)
async def chat_message(
    request: Request,
    req: ChatMessageRequest,
    chat_session: AsyncSession = Depends(get_chat_session),
) -> ChatMessageResponse:
    request_id = getattr(request.state, "request_id", "")

    chat = await _repo.get_chat(chat_session, chat_id=req.chat_id)
    if not chat:
        raise HTTPException(status_code=404, detail="chat_not_found")

    natal_context = chat.get("natal_context_json") or {}
    user_id = chat.get("user_id") or "anon"

    await _repo.add_message(chat_session, chat_id=req.chat_id, role="user", content=req.message)

    user_profile_json = await _repo.get_user_profile(chat_session, user_id=user_id)

    system = _system_prompt(natal_context=natal_context, user_profile_json=user_profile_json)

    import asyncio
    answer = await asyncio.to_thread(_llm.generate, system_prompt=system, user_prompt=req.message)

    await _repo.add_message(chat_session, chat_id=req.chat_id, role="assistant", content=answer)

    return ChatMessageResponse(
        ok=True,
        request_id=request_id,
        chat_id=req.chat_id,
        answer=answer,
    )