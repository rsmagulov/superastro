# ============================================================
# File: astroprocessor/app/routers/public_v2.py  (PATCH)
# - If-None-Match / ETag / 304
# - richer /v2/buttons (label/order/icon/is_enabled)
# ============================================================
from __future__ import annotations

import hashlib
import json
from typing import Any

from fastapi import APIRouter, Depends, HTTPException, Query, Request, Response
from sqlalchemy.ext.asyncio import AsyncSession

from app.db import get_knowledge_session, get_session
from app.schemas.public_v2 import (
    ButtonDefV2,
    ButtonsV2Response,
    InterpretV2Request,
    InterpretV2Response,
    TopicResultV2,
)
from app.services.chart_service import ChartService
from app.services.coverage_rules import aggregate_coverage_v2, topic_coverage_v2
from app.services.geocode import resolve_place
from app.settings import settings

router = APIRouter(prefix="/v2", tags=["public_v2"])
_chart_service = ChartService()
SAFE_LIMIT = 3500


def _effective_build_version() -> str:
    return settings.knowledge_build_version or settings.build_version


def _button_topic_map() -> dict[str, list[str]]:
    m = getattr(settings, "button_topic_map", None)
    if not isinstance(m, dict):
        return {}
    out: dict[str, list[str]] = {}
    for k, v in m.items():
        if not isinstance(k, str):
            continue
        if isinstance(v, (list, tuple)):
            out[k] = [str(x) for x in v]
    return out


def _button_catalog() -> dict[str, dict[str, Any]]:
    c = getattr(settings, "button_catalog", None)
    if not isinstance(c, dict):
        return {}
    out: dict[str, dict[str, Any]] = {}
    for k, v in c.items():
        if isinstance(k, str) and isinstance(v, dict):
            out[k] = dict(v)
    return out


def _button_defs() -> dict[str, ButtonDefV2]:
    topics_map = _button_topic_map()
    catalog = _button_catalog()

    defs: dict[str, ButtonDefV2] = {}
    for button_id, topics in topics_map.items():
        meta = catalog.get(button_id, {})
        defs[button_id] = ButtonDefV2(
            topics=topics,
            label=str(meta.get("label") or button_id),
            order=int(meta.get("order") or 0),
            icon=(str(meta["icon"]) if meta.get("icon") is not None else None),
            is_enabled=bool(meta.get("is_enabled", True)),
        )
    return defs


def _buttons_etag(buttons: dict[str, ButtonDefV2]) -> str:
    # ETag only depends on buttons content, not build_version.
    raw = {
        bid: {
            "topics": b.topics,
            "label": b.label,
            "order": b.order,
            "icon": b.icon,
            "is_enabled": b.is_enabled,
        }
        for bid, b in buttons.items()
    }
    payload = json.dumps(raw, ensure_ascii=False, sort_keys=True, separators=(",", ":"))
    return hashlib.sha256(payload.encode("utf-8")).hexdigest()[:16]


def _resolve_topics(req: InterpretV2Request) -> list[str]:
    if req.topic_categories:
        return [str(t) for t in req.topic_categories]

    if req.button_id:
        mapped = _button_topic_map().get(req.button_id)
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
    return {
        "build_version": _effective_build_version(),
        "locale": locale,
        "button_id": button_id,
        "topics": topics,
        "geocode": {"source": place.get("source"), "timezone": place.get("timezone")},
    }


@router.get("/buttons", response_model=ButtonsV2Response)
async def buttons_v2(request: Request, response: Response) -> Any:
    buttons = _button_defs()              # dict[str, ButtonDefV2]
    etag = _buttons_etag(buttons)

    inm = request.headers.get("if-none-match")
    response.headers["ETag"] = etag

    if inm and inm.strip() == etag:
        return Response(status_code=304, headers={"ETag": etag})

    return ButtonsV2Response(
        ok=True,
        buttons=buttons,
        meta={"build_version": _effective_build_version(), "etag": etag},
    )


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

        topic_results.append(TopicResultV2(topic_category=t, coverage=cov, messages=messages))

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
