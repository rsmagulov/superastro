from __future__ import annotations
import hashlib
import json
from typing import Any, Optional

from fastapi import APIRouter, Depends, HTTPException, Query, Request, Response
from sqlalchemy import text as sql_text
from sqlalchemy.ext.asyncio import AsyncSession
from sqlalchemy.sql import bindparam
from pathlib import Path

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

def _sorted_button_ids(buttons: dict[str, ButtonDefV2]) -> list[str]:
    return sorted(buttons.keys(), key=lambda bid: (buttons[bid].order, bid))

def _build_debug_payload(
    *,
    topics: list[str],
    cores_by_topic: dict[str, dict[str, Any]],
    debug: int,
    max_blocks: int = 12,
    max_keys_per_block: int = 12,
    max_hits: int = 200,
    max_filtered_sample: int = 200,
) -> dict[str, Any]:
    """
    debug=1 -> counts only
    debug=2 -> include samples:
      - global knowledge_blocks_sample (one topic)
      - per-topic knowledge_blocks_sample (each topic)
      - per-topic hits_sample / used_blocks_sample
      - per-topic filtered_out_by_budget_sample (hits trimmed by budget)

    Added counters:
      - hits_sign_present_count / used_sign_present_count
      - hits_planet_groups_count / used_planet_groups_count
      - hits_natal_generic_count / used_natal_generic_count
    """
    out: dict[str, Any] = {"debug": int(debug), "topics": {}}

    any_core = next((cores_by_topic.get(t) for t in topics if isinstance(cores_by_topic.get(t), dict)), None) or {}
    kb_dump = any_core.get("knowledge_blocks") or []
    out["blocks_total"] = len(kb_dump)

    if int(debug) >= 2 and isinstance(kb_dump, list) and kb_dump:
        sampled = kb_dump[: max(1, int(max_blocks))]
        out["knowledge_blocks_sample"] = [
            {
                "id": b.get("id"),
                "candidate_keys": list(b.get("candidate_keys") or [])[: max(1, int(max_keys_per_block))],
                "meta": b.get("meta"),
            }
            for b in sampled
        ]

    def _is_sign_present_key(k: Any) -> bool:
        ks = str(k or "")
        return ks.startswith("natal.sign.") and ks.endswith(".present")

    def _is_planet_group_key(k: Any) -> bool:
        ks = str(k or "")
        return ks.startswith("natal.planets.group.")

    def _is_natal_generic_key(k: Any) -> bool:
        return str(k or "") == "natal.generic"

    for t in topics:
        core = cores_by_topic.get(str(t), {}) or {}
        trace = core.get("trace") or {}

        hits = trace.get("hits") or []  # pre-budget
        raw_blocks_used = core.get("raw_blocks") or []  # post-budget
        kb = core.get("knowledge_blocks") or []

        found = len(hits)
        used = len(raw_blocks_used)
        blocks_total = len(kb) if isinstance(kb, list) else 0

        used_block_ids = {str(b.get("block_id")) for b in raw_blocks_used if isinstance(b, dict)}
        filtered_hits = [
            h
            for h in hits
            if str((h or {}).get("block_id"))
            and str((h or {}).get("block_id")) not in used_block_ids
        ]

        # HIT counters
        hits_sign_present_count = sum(1 for h in hits if _is_sign_present_key((h or {}).get("key")))
        hits_planet_groups_count = sum(1 for h in hits if _is_planet_group_key((h or {}).get("key")))
        hits_natal_generic_count = sum(1 for h in hits if _is_natal_generic_key((h or {}).get("key")))

        # USED counters
        used_sign_present_count = sum(1 for b in raw_blocks_used if _is_sign_present_key((b or {}).get("key")))
        used_planet_groups_count = sum(1 for b in raw_blocks_used if _is_planet_group_key((b or {}).get("key")))
        used_natal_generic_count = sum(1 for b in raw_blocks_used if _is_natal_generic_key((b or {}).get("key")))

        topic_dbg: dict[str, Any] = {
            "blocks_total": blocks_total,
            "hits_found": found,
            "blocks_used": used,
            "filtered_out_by_budget": len(filtered_hits),
            "misses_no_hit": max(0, blocks_total - found),
            "hits_sign_present_count": hits_sign_present_count,
            "hits_planet_groups_count": hits_planet_groups_count,
            "hits_natal_generic_count": hits_natal_generic_count,
            "used_sign_present_count": used_sign_present_count,
            "used_planet_groups_count": used_planet_groups_count,
            "used_natal_generic_count": used_natal_generic_count,
        }

        if int(debug) >= 2 and isinstance(kb, list) and kb:
            sampled = kb[: max(1, int(max_blocks))]
            topic_dbg["knowledge_blocks_sample"] = [
                {
                    "id": b.get("id"),
                    "candidate_keys": list(b.get("candidate_keys") or [])[: max(1, int(max_keys_per_block))],
                    "meta": b.get("meta"),
                }
                for b in sampled
            ]
            topic_dbg["hits_sample"] = hits[: max(1, int(max_hits))]
            topic_dbg["used_blocks_sample"] = raw_blocks_used[: max(1, int(max_hits))]

            topic_dbg["filtered_out_by_budget_sample"] = [
                {
                    "block_id": fh.get("block_id"),
                    "key": fh.get("key"),
                    "knowledge_item_id": fh.get("knowledge_item_id"),
                    "priority": fh.get("priority"),
                    "created_at": fh.get("created_at"),
                }
                for fh in filtered_hits[: max(1, int(max_filtered_sample))]
                if isinstance(fh, dict)
            ]

        out["topics"][str(t)] = topic_dbg

    return out

# astroprocessor/app/routers/public_v2.py
# REPLACE the whole function: async def _debug_keydiff_for_topics(...)
# NOTE: keydiff must mirror KnowledgeRepo resolution:
# topic-specific OR global (topic_category ''/NULL). Otherwise debug reports false "missing_nonempty".
async def _debug_keydiff_for_topics(
    *,
    knowledge_session: AsyncSession,
    topics: list[str],
    locale: str,
    knowledge_blocks_dump: list[dict[str, Any]],
    max_blocks: int = 12,
    max_keys_total: int = 600,
    max_sample: int = 60,
) -> dict[str, Any]:
    """
    Для debug=2:

    Считает coverage так же, как реально работает KnowledgeRepo:
    ключ считается "покрытым", если существует active+nonempty запись
    либо в topic-specific (topic_category == topic),
    либо в global (topic_category == '' OR NULL).

    candidate_keys_missing_any:
      ключа нет ни в topic-specific, ни в global.

    candidate_keys_no_active_nonempty:
      ключ есть (topic/global), но нигде нет active+nonempty текста.
    """

    sampled_blocks = knowledge_blocks_dump[: max(1, int(max_blocks))]
    keys: list[str] = []
    seen: set[str] = set()

    for b in sampled_blocks:
        for k in (b.get("candidate_keys") or [])[:50]:
            ks = str(k)
            if not ks or ks in seen:
                continue
            seen.add(ks)
            keys.append(ks)
            if len(keys) >= int(max_keys_total):
                break
        if len(keys) >= int(max_keys_total):
            break

    if not keys or not topics:
        return {
            "candidate_keys_total_unique": len(keys),
            "topics": {},
            "limits": {
                "max_blocks": int(max_blocks),
                "max_keys_total": int(max_keys_total),
                "max_sample": int(max_sample),
            },
        }

    stmt = sql_text(
        """
        SELECT
          COALESCE(topic_category, '') AS topic,
          key AS key,
          COUNT(*) AS rows_total,
          SUM(
            CASE
              WHEN is_active = 1 AND text IS NOT NULL AND LENGTH(TRIM(text)) > 0 THEN 1
              ELSE 0
            END
          ) AS rows_active_nonempty
        FROM knowledge_items
        WHERE
          key IN :keys
          AND (locale = :locale OR locale LIKE :locale || '-%')
          AND (topic_category IN :topics OR topic_category = '' OR topic_category IS NULL)
        GROUP BY COALESCE(topic_category, ''), key
        """
    ).bindparams(
        bindparam("topics", expanding=True),
        bindparam("keys", expanding=True),
    )

    rows = (
        await knowledge_session.execute(
            stmt, {"topics": topics, "keys": keys, "locale": locale}
        )
    ).mappings().all()

    # Build maps:
    # - per-topic stats
    # - global stats (topic_category ''/NULL normalized to '')
    present_by_topic: dict[str, dict[str, dict[str, int]]] = {t: {} for t in topics}
    present_global: dict[str, dict[str, int]] = {}

    for r in rows:
        t = str(r["topic"] or "").strip()
        k = str(r["key"] or "").strip()
        stats = {
            "rows_total": int(r["rows_total"] or 0),
            "rows_active_nonempty": int(r["rows_active_nonempty"] or 0),
        }

        if t == "":
            present_global[k] = stats
        elif t in present_by_topic:
            present_by_topic[t][k] = stats

    def _has_any(topic: str, key: str) -> bool:
        return key in present_by_topic.get(topic, {}) or key in present_global

    def _has_active_nonempty(topic: str, key: str) -> bool:
        t_stats = present_by_topic.get(topic, {}).get(key)
        if t_stats and int(t_stats.get("rows_active_nonempty", 0)) > 0:
            return True
        g_stats = present_global.get(key)
        return bool(g_stats and int(g_stats.get("rows_active_nonempty", 0)) > 0)

    out_topics: dict[str, Any] = {}
    for t in topics:
        missing_any = [k for k in keys if not _has_any(t, k)]
        no_active_nonempty = [k for k in keys if _has_any(t, k) and not _has_active_nonempty(t, k)]

        out_topics[t] = {
            "candidate_keys_total_unique": len(keys),
            "candidate_keys_missing_any_count": len(missing_any),
            "candidate_keys_missing_any_sample": missing_any[: int(max_sample)],
            "candidate_keys_no_active_nonempty_count": len(no_active_nonempty),
            "candidate_keys_no_active_nonempty_sample": no_active_nonempty[: int(max_sample)],
        }

    return {
        "candidate_keys_total_unique": len(keys),
        "topics": out_topics,
        "limits": {
            "max_blocks": int(max_blocks),
            "max_keys_total": int(max_keys_total),
            "max_sample": int(max_sample),
        },
    }


async def _fetch_knowledge_texts_by_ids(
    session: AsyncSession,
    ids: list[int],
) -> dict[int, str]:
    if not ids:
        return {}

    uniq: list[int] = []
    seen: set[int] = set()
    for x in ids:
        try:
            i = int(x)
        except Exception:
            continue
        if i > 0 and i not in seen:
            seen.add(i)
            uniq.append(i)

    if not uniq:
        return {}

    params = {f"id{i}": uniq[i] for i in range(len(uniq))}
    in_clause = ", ".join([f":id{i}" for i in range(len(uniq))])

    # Try text first; if schema differs, fallback to content.
    try:
        res = await session.execute(
            sql_text(f"SELECT id, text FROM knowledge_items WHERE id IN ({in_clause})"),
            params,
        )
        rows = res.fetchall()
        out: dict[int, str] = {int(r[0]): str(r[1] or "") for r in rows}
        return out
    except Exception:
        res = await session.execute(
            sql_text(f"SELECT id, content FROM knowledge_items WHERE id IN ({in_clause})"),
            params,
        )
        rows = res.fetchall()
        out: dict[int, str] = {int(r[0]): str(r[1] or "") for r in rows}
        return out




def _parse_ids_param(ids: list[str] | None) -> list[str]:
    """
    Supports both:
      - ?ids=btn_a&ids=btn_b  -> ["btn_a","btn_b"]
      - ?ids=btn_a,btn_b      -> ["btn_a","btn_b"]
      - mixed                -> flattened
    Keeps order, strips whitespace, drops empties.
    """
    if not ids:
        return []
    out: list[str] = []
    for item in ids:
        for part in str(item).split(","):
            p = part.strip()
            if p:
                out.append(p)
    return out

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

def _error_etag_unknown_ids(*, ids_list: list[str], unknown_ids: list[str], enabled_only: bool, strict: bool) -> str:
    payload = json.dumps(
        {"ids": ids_list, "unknown_ids": unknown_ids, "enabled_only": enabled_only, "strict": strict},
        ensure_ascii=False,
        sort_keys=True,
        separators=(",", ":"),
    )
    return hashlib.sha256(payload.encode("utf-8")).hexdigest()[:16]

def _dedupe_keep_order(items: list[str]) -> list[str]:
    seen: set[str] = set()
    out: list[str] = []
    for x in items:
        if x in seen:
            continue
        seen.add(x)
        out.append(x)
    return out

def _count_unique_candidate_keys_from_kb_dump(
    knowledge_blocks_dump: list[dict[str, Any]],
    *,
    max_blocks: int = 200,
    max_keys_total: int = 2000,
) -> int:
    """Count unique candidate_keys inside a knowledge_blocks dump.

    SQL-free: считаем строго по dump’у knowledge_blocks этой темы.
    """
    seen: set[str] = set()
    blocks = knowledge_blocks_dump or []
    if not isinstance(blocks, list):
        return 0

    for b in blocks[: max(0, int(max_blocks))]:
        if not isinstance(b, dict):
            continue
        for k in (b.get("candidate_keys") or []):
            ks = str(k).strip()
            if not ks:
                continue
            seen.add(ks)
            if len(seen) >= int(max_keys_total):
                return len(seen)

    return len(seen)



def _parse_ids_sources(ids: list[str] | None, ids_csv: str | None) -> list[str]:
    """
    Supports:
      - ?ids=btn_a&ids=btn_b (repeatable)
      - ?ids_csv=btn_a,btn_b (separate CSV)
      - both at once -> merged, then deduped, order preserved (ids first, then ids_csv)
    Returns a deduped list.
    """
    raw: list[str] = []

    if ids:
        for item in ids:
            s = str(item)
            for part in s.split(","):  # still tolerate accidental commas in ids=
                p = part.strip()
                if p:
                    raw.append(p)

    if ids_csv:
        for part in str(ids_csv).split(","):
            p = part.strip()
            if p:
                raw.append(p)

    return _dedupe_keep_order(raw)

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

    # NEW: deduped ids list (source of truth for meta.ids)
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
        "ids": ids_list,          # ✅ always deduped
        "strict": bool(strict),
    }
    if ids_list and unknown:
        meta["unknown_ids"] = unknown

    return ButtonsV2Response(ok=True, buttons=buttons, meta=meta, error=None)


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

    if int(debug) > 0:
        dbg = _build_debug_payload(
            topics=[str(t) for t in topics],
            cores_by_topic=cores_by_topic,
            debug=int(debug),
            max_hits=int(max_blocks),
        )

    # debug=2: keydiff must be topic-aware (use each topic's own knowledge_blocks)
    if int(debug) >= 2:
        keydiff_topics: dict[str, Any] = {}
        max_unique = 0

        for t in [str(x) for x in topics]:
            core = cores_by_topic.get(t, {}) or {}
            kb_dump = core.get("knowledge_blocks") or []
            kd = await _debug_keydiff_for_topics(
                knowledge_session=knowledge_session,
                topics=[t],                 # IMPORTANT: per-topic query
                locale=locale,
                knowledge_blocks_dump=kb_dump,
                max_blocks=int(max_blocks),
            )
            # _debug_keydiff_for_topics returns {candidate_keys_total_unique, topics:{t:{...}}, limits:{...}}
            # unwrap per topic for compactness
            topic_kd = (kd.get("topics") or {}).get(t, {})
            keydiff_topics[t] = topic_kd
            max_unique = max(max_unique, int(topic_kd.get("candidate_keys_total_unique") or 0))

        dbg["keydiff"] = {
           "candidate_keys_total_unique_max": max_unique,
           "topics": keydiff_topics,
           "limits": {"note": "computed per-topic from each core.knowledge_blocks"},
        }


        meta["debug"] = dbg


    topic_results: list[TopicResultV2] = []
    all_messages: list[str] = []
    coverages: list[str] = []

    # Preload texts for fallback when final_text is empty but raw blocks exist.
    fallback_ids: list[int] = []
    for t in topics:
        core = cores_by_topic.get(str(t), {}) or {}
        text = (core.get("final_text") or "").strip()
        if text:
            continue
        raw_blocks = core.get("raw_blocks") or []
        for b in raw_blocks:
            if isinstance(b, dict) and b.get("knowledge_item_id"):
                try:
                    fallback_ids.append(int(b["knowledge_item_id"]))
                except Exception:
                    pass

    fallback_texts_by_id = await _fetch_knowledge_texts_by_ids(knowledge_session, fallback_ids)
    if int(debug) > 0:
        dbg_rt = meta.setdefault("debug_runtime", {})
        dbg_rt["fallback_ids_total"] = len(fallback_ids)
        dbg_rt["fallback_ids_unique"] = len(set(fallback_ids))
        dbg_rt["fallback_rows_returned"] = len(fallback_texts_by_id)
        dbg_rt["knowledge_db_path"] = str(Path(settings.knowledge_db_path).resolve())
        # show id=61 if present (your case)
        if 61 in fallback_texts_by_id:
            dbg_rt["id61_text_len"] = len((fallback_texts_by_id.get(61) or "").strip())
        else:
            dbg_rt["id61_text_len"] = None
    


    for t in topics:
        core = cores_by_topic.get(str(t), {}) or {}
        raw_blocks = core.get("raw_blocks") or []

        text = (core.get("final_text") or "").strip()
        if int(debug) > 0:
            kb_dump_topic = core.get("knowledge_blocks") or []
            topic_rt = meta.setdefault("debug_runtime", {}).setdefault("topics", {}).setdefault(str(t), {})
            topic_rt.update(
                {
                    "final_text_len": len(text),
                    "raw_blocks_count": len(raw_blocks),
                    "knowledge_blocks_count": len(kb_dump_topic) if isinstance(kb_dump_topic, list) else 0,
                    # IMPORTANT: unique по ВСЕМ blocks данной темы, без сэмплинга
                    "candidate_keys_total_unique": _count_unique_candidate_keys_from_kb_dump(
                        kb_dump_topic,
                        max_blocks=200,
                        max_keys_total=5000,
                    ),
                }
            )



        
        # Fallback: if renderer didn't produce final_text but we did select blocks,
        # stitch together the actual knowledge_items.text by knowledge_item_id.
        if (not text) and raw_blocks:
            parts: list[str] = []
            for b in raw_blocks:
                if not isinstance(b, dict):
                    continue
                kid = b.get("knowledge_item_id")
                if not kid:
                    continue
                try:
                    kid_int = int(kid)
                except Exception:
                    continue
                bt = (fallback_texts_by_id.get(kid_int) or "").strip()
                if bt:
                    parts.append(bt)
            text = "\n\n".join(parts).strip()
        if int(debug) > 0:
            meta["debug_runtime"]["topics"][str(t)]["after_fallback_text_len"] = len((text or "").strip())

        messages = _split_to_messages(text)
        if int(debug) > 0:
            meta["debug_runtime"]["topics"][str(t)]["messages_count"] = len(messages)

        cov = topic_coverage_v2(ok=True, raw_blocks_used=len(raw_blocks))
        coverages.append(cov)

        # If low but we actually have content, add a soft notice (not a replacement).
        if cov == "low" and messages:
            messages.append("ℹ️ Материалов пока немного — ответ будет расширяться по мере наполнения базы знаний.")

        all_messages.append(f"🧩 {t}")
        if messages:
            all_messages.extend(messages)
        else:
            all_messages.append("Пока недостаточно материалов по этой теме в базе знаний.")

        topic_results.append(TopicResultV2(topic_category=t, coverage=cov, messages=messages))

    overall = aggregate_coverage_v2(coverages)
    natal_data_public = natal_data if int(debug) >= 2 else None
    return InterpretV2Response(
        request_id=request_id,
        ok=True,
        coverage=overall,
        messages=all_messages,
        topics=topic_results,
        natal_data=natal_data_public,
        meta=meta,
        error=None,
    )
