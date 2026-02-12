# ============================================================
# File: astroprocessor/app/routers/public_v2.py  (PATCH)
# 1) BUTTON_TOPIC_MAP -> settings.button_topic_map
# 2) endpoint GET /v2/buttons
# ============================================================
from __future__ import annotations

from typing import Any

from fastapi import APIRouter, Depends, HTTPException, Query, Request
from sqlalchemy.ext.asyncio import AsyncSession

from app.db import get_knowledge_session, get_session
from app.schemas.public_v2 import ButtonsV2Response, InterpretV2Request, InterpretV2Response, TopicResultV2
from app.services.chart_service import ChartService
from app.services.coverage_rules import aggregate_coverage_v2, topic_coverage_v2
from app.services.geocode import resolve_place
from app.settings import settings

router = APIRouter(prefix="/v2", tags=["public_v2"])

_chart_service = ChartService()
SAFE_LIMIT = 3500


def _get_button_topic_map() -> dict[str, list[str]]:
    """
    Source of truth: settings.button_topic_map.
    Guaranteed to be a dict, but keep defensive fallback.
    """
    m = getattr(settings, "button_topic_map", None)
    if isinstance(m, dict):
        return m
    return {}


def _resolve_topics(req: InterpretV2Request) -> list[str]:
    if req.topic_categories:
        return [str(t) for t in req.topic_categories]

    if req.button_id:
        mapped = _get_button_topic_map().get(req.button_id)
        if mapped:
            return list(mapped)

    return ["personality_core"]


def _split_to_messages(text: str, limit: int = SAFE_LIMIT) -> list[str]:
    text = (text or "").strip()
    if not text:
        return []

    parts: list[str] = []
    buf: list[str] = []

    for para in text.split("\n\n"):
        p = para.strip()
        if not p:
            continue

        candidate = (("\n\n".join(buf) + "\n\n" + p) if buf else p)
        if len(candidate) <= limit:
            buf = candidate.split("\n\n")
            continue

        if buf:
            parts.append("\n\n".join(buf).strip())
            buf = []

        if len(p) <= limit:
            buf = [p]
        else:
            for i in range(0, len(p), limit):
                parts.append(p[i : i + limit].strip())

    if buf:
        parts.append("\n\n".join(buf).strip())

    return [m for m in parts if m]


def _build_meta(*, place: dict[str, Any], locale: str, topics: list[str], button_id: str | None) -> dict[str, Any]:
    build_version = (
        getattr(settings, "knowledge_build_version", None)
        or getattr(settings, "build_version", None)
        or "dev"
    )
    return {
        "build_version": build_version,
        "locale": locale,
        "button_id": button_id,
        "topics": topics,
        "geocode": {
            "source": place.get("source"),
            "timezone": place.get("timezone"),
        },
    }


@router.get("/buttons", response_model=ButtonsV2Response)
async def buttons_v2() -> ButtonsV2Response:
    """
    Bot sync endpoint: available button_id -> topic_categories.
    """
    return ButtonsV2Response(ok=True, buttons=_get_button_topic_map())


@router.post("/interpret", response_model=InterpretV2Response)
async def interpret_v2(
    request: Request,
    req: InterpretV2Request,
    locale: str = Query("ru", min_length=2, max_length=32),
    session: AsyncSession = Depends(get_session),
    knowledge_session: AsyncSession = Depends(get_knowledge_session),
) -> InterpretV2Response:
    if locale != "ru":
        raise HTTPException(status_code=422, detail="only_ru_locale_supported")

    request_id = getattr(request.state, "request_id", "")
    topics = _resolve_topics(req)

    place = await resolve_place(req.birth.place_query, locale, session)
    place_payload = {
        "ok": bool(place.ok),
        "query": req.birth.place_query,
        "display_name": place.display_name,
        "lat": place.lat,
        "lon": place.lon,
        "country_code": place.country_code,
        "timezone": place.tz_str,
        "source": place.source,
        "error": place.error,
    }

    meta = _build_meta(place=place_payload, locale=locale, topics=topics, button_id=req.button_id)

    if not place.ok or not place.tz_str:
        return InterpretV2Response(
            request_id=request_id,
            ok=False,
            coverage="missing",
            messages=[],
            topics=[],
            meta=meta,
            error=place.error or "place_not_resolved",
        )

    birth = req.birth.to_birth_input().to_domain()
    natal_data = await _chart_service.build_natal(user_name=req.name, birth=birth, place=place)
    blocks = _chart_service.build_knowledge_blocks(natal_data=natal_data, tone_namespace="natal")

    cores_by_topic = await _chart_service.interpret_topics_with_blocks_batch(
        session=knowledge_session,
        knowledge_blocks=blocks,
        topic_categories=topics,
        locale=locale,
    )

    topic_results: list[TopicResultV2] = []
    all_messages: list[str] = []
    coverages: list[str] = []

    for t in topics:
        core = cores_by_topic.get(str(t), {})
        raw_blocks = core.get("raw_blocks") or []
        text = core.get("final_text") or ""
        messages = _split_to_messages(text)

        cov = topic_coverage_v2(ok=True, raw_blocks_used=len(raw_blocks))
        coverages.append(cov)

        all_messages.append(f"🧩 {t}")
        if messages:
            all_messages.extend(messages)
        else:
            all_messages.append("Пока недостаточно материалов по этой теме в базе знаний.")

        topic_results.append(
            TopicResultV2(
                topic_category=t,
                coverage=cov,
                messages=messages,
            )
        )

    overall = aggregate_coverage_v2(coverages)

    return InterpretV2Response(
        request_id=request_id,
        ok=True,
        coverage=overall,
        messages=all_messages,
        topics=topic_results,
        meta=meta,
        error=None,
    )
