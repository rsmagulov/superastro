# ============================================================
# File: astroprocessor/app/routers/public_v2.py
# ============================================================
from __future__ import annotations

import hashlib
import json
import re
from pathlib import Path
from typing import Any

from fastapi import APIRouter, Depends, HTTPException, Query, Request, Response
from sqlalchemy import text as sql_text
from sqlalchemy.ext.asyncio import AsyncSession
from sqlalchemy.sql import bindparam

from app.db import get_knowledge_session, get_session
from app.schemas.public_v2 import (
    ButtonDefV2,
    ButtonsV2Response,
    InterpretV2Request,
    InterpretV2Response,
    NatalV2Request,
    NatalV2Response,
    TopicResultV2,
)
from app.services.chart_service import ChartService
from app.services.coverage_rules import aggregate_coverage_v2, topic_coverage_v2
from app.services.geocode import resolve_place
from app.settings import settings

router = APIRouter(prefix="/v2", tags=["public_v2"])
_chart_service = ChartService()
SAFE_LIMIT = 3500

_WS_RE = re.compile(r"\s+", flags=re.UNICODE)


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


def _dedupe_keep_order(items: list[str]) -> list[str]:
    seen: set[str] = set()
    out: list[str] = []

    for it in items:
        if not isinstance(it, str):
            continue

        raw = it.strip()
        if not raw:
            continue

        norm = raw.replace("\u00A0", " ")
        norm = _WS_RE.sub(" ", norm).strip()
        if not norm or norm in seen:
            continue

        seen.add(norm)
        out.append(raw)

    return out


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


def _sorted_button_ids(buttons: dict[str, ButtonDefV2]) -> list[str]:
    return sorted(buttons.keys(), key=lambda bid: (buttons[bid].order, bid))


def _parse_ids_sources(ids: list[str] | None, ids_csv: str | None) -> list[str]:
    raw: list[str] = []
    if ids:
        for item in ids:
            for part in str(item).split(","):
                p = part.strip()
                if p:
                    raw.append(p)
    if ids_csv:
        for part in str(ids_csv).split(","):
            p = part.strip()
            if p:
                raw.append(p)
    return _dedupe_keep_order(raw)


def _error_etag(
    *,
    error_code: str,
    ids_list: list[str],
    unknown_ids: list[str],
    enabled_only: bool,
    strict: bool,
) -> str:
    payload = json.dumps(
        {
            "error": error_code,
            "ids": ids_list,
            "unknown_ids": unknown_ids,
            "enabled_only": enabled_only,
            "strict": strict,
        },
        ensure_ascii=False,
        sort_keys=True,
        separators=(",", ":"),
    )
    return hashlib.sha256(payload.encode("utf-8")).hexdigest()[:16]


@router.get("/buttons", response_model=ButtonsV2Response)
async def buttons_v2(
    request: Request,
    response: Response,
    enabled_only: int = Query(0, ge=0, le=1),
    ids: list[str] | None = Query(None),
    ids_csv: str | None = Query(None, min_length=1, max_length=2000),
    strict: int = Query(1, ge=0, le=1),
) -> Any:
    if ids and ids_csv:
        raise HTTPException(
            status_code=422,
            detail={
                "code": "use_only_one_of_ids_or_ids_csv",
                "message": "Provide either 'ids' (repeatable) or 'ids_csv' (comma-separated), not both.",
                "meta": {"enabled_only": bool(enabled_only), "strict": bool(strict)},
            },
        )

    all_buttons = _button_defs()
    ids_list = _parse_ids_sources(ids, ids_csv)

    unknown: list[str] = []
    buttons: dict[str, ButtonDefV2]

    if ids_list:
        wanted = set(ids_list)
        unknown = sorted(wanted - set(all_buttons.keys()))

        if unknown and strict == 1:
            etag = _error_etag(
                error_code="unknown_button_id",
                ids_list=ids_list,
                unknown_ids=unknown,
                enabled_only=bool(enabled_only),
                strict=True,
            )
            response.headers["ETag"] = etag
            inm = request.headers.get("if-none-match")
            if inm and inm.strip() == etag:
                return Response(status_code=304, headers={"ETag": etag})

            return ButtonsV2Response(
                ok=False,
                buttons={},
                meta={
                    "build_version": _effective_build_version(),
                    "etag": etag,
                    "enabled_only": bool(enabled_only),
                    "sorted_ids": [],
                    "ids": ids_list,
                    "unknown_ids": unknown,
                    "strict": True,
                },
                error="unknown_button_id",
            )

        buttons = {k: v for k, v in all_buttons.items() if k in wanted}
        if not buttons:
            etag = _error_etag(
                error_code="no_known_button_ids",
                ids_list=ids_list,
                unknown_ids=unknown or sorted(wanted),
                enabled_only=bool(enabled_only),
                strict=False,
            )
            response.headers["ETag"] = etag
            inm = request.headers.get("if-none-match")
            if inm and inm.strip() == etag:
                return Response(status_code=304, headers={"ETag": etag})

            return ButtonsV2Response(
                ok=False,
                buttons={},
                meta={
                    "build_version": _effective_build_version(),
                    "etag": etag,
                    "enabled_only": bool(enabled_only),
                    "sorted_ids": [],
                    "ids": ids_list,
                    "unknown_ids": unknown or sorted(wanted),
                    "strict": False,
                },
                error="no_known_button_ids",
            )
    else:
        buttons = dict(all_buttons)

    if enabled_only == 1:
        buttons = {k: v for k, v in buttons.items() if v.is_enabled}

    sorted_ids = _sorted_button_ids(buttons)
    etag = _buttons_etag(buttons)

    inm = request.headers.get("if-none-match")
    response.headers["ETag"] = etag
    if inm and inm.strip() == etag:
        return Response(status_code=304, headers={"ETag": etag})

    meta: dict[str, Any] = {
        "build_version": _effective_build_version(),
        "etag": etag,
        "enabled_only": bool(enabled_only),
        "sorted_ids": sorted_ids,
        "ids": ids_list,
        "strict": bool(strict),
    }
    if ids_list and unknown:
        meta["unknown_ids"] = unknown

    return ButtonsV2Response(ok=True, buttons=buttons, meta=meta, error=None)


@router.post("/natal", response_model=NatalV2Response)
async def natal_v2(
    request: Request,
    req: NatalV2Request,
    locale: str = Query("ru-RU", min_length=2, max_length=32),
    session: AsyncSession = Depends(get_session),
) -> NatalV2Response:
    request_id = getattr(request.state, "request_id", "")

    place = await resolve_place(req.birth.place_query, locale, session)
    birth = req.birth.to_birth_input().to_domain()
    natal_data = await _chart_service.build_natal(user_name=req.name, birth=birth, place=place)

    place_dict = {
        "ok": bool(getattr(place, "ok", True)),
        "query": req.birth.place_query,
        "display_name": getattr(place, "display_name", None),
        "lat": getattr(place, "lat", None),
        "lon": getattr(place, "lon", None),
        "country_code": getattr(place, "country_code", None),
        "timezone": getattr(place, "tz_str", None),
    }

    return NatalV2Response(
        request_id=request_id,
        ok=True,
        natal_data=natal_data or {},
        place=place_dict,
        meta={"locale": locale},
        error=None,
    )


# NOTE: Below is your existing interpret_v2 logic; keep it as-is in your repo.
# If you had extra debug helpers in your current file, re-add them below unchanged.

@router.post("/interpret", response_model=InterpretV2Response)
async def interpret_v2(
    request: Request,
    req: InterpretV2Request,
    locale: str = Query("ru", min_length=2, max_length=32),
    debug: int = Query(0, ge=0, le=2, description="0=off, 1=counts, 2=samples"),
    max_blocks: int = Query(50, ge=1, le=200, description="Max KB blocks per topic"),
    max_chars: int = Query(30_000, ge=1_000, le=200_000, description="Max total chars per topic"),
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
    meta["requested_locale"] = locale
    meta["knowledge_locale_strategy"] = "locale = :locale OR locale LIKE :locale || '-%'"

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

    cores_by_topic = await _chart_service.interpret_topics_v2(
        knowledge_session=knowledge_session,
        natal_data=natal_data,
        topic_categories=topics,
        locale=locale,
        tone_namespace="natal",
        max_blocks=int(max_blocks),
        max_chars=int(max_chars),
    )

    topic_results: list[TopicResultV2] = []
    all_messages: list[str] = []
    coverages: list[str] = []

    for t in topics:
        core = cores_by_topic.get(str(t), {}) or {}
        raw_blocks = core.get("raw_blocks") or []
        text = (core.get("final_text") or "").strip()

        paras = [p.strip() for p in (text or "").split("\n\n") if p.strip()]
        paras = _dedupe_keep_order(paras)
        text = "\n\n".join(paras).strip()

        messages = _split_to_messages(text)
        cov = topic_coverage_v2(ok=True, raw_blocks_used=len(raw_blocks))
        coverages.append(cov)

        if cov == "low" and messages:
            messages.append("ℹ️ Материалов пока немного — ответ будет расширяться по мере наполнения базы знаний.")

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
        natal_data=natal_data if int(debug) >= 2 else None,
        meta=meta,
        error=None,
    )