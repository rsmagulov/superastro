# app/main.py
from __future__ import annotations

import os
from datetime import datetime
from typing import Any, Literal, Optional

from fastapi import Depends, FastAPI, Query
from fastapi.responses import JSONResponse
from pydantic import BaseModel, Field
from sqlalchemy.exc import OperationalError
from sqlalchemy.ext.asyncio import AsyncSession

from .db import get_knowledge_session, get_session, init_db
from .services.geocode import resolve_place
from .settings import settings

from app.astro.kerykeion_adapter import BirthData, KerykeionAdapter, PlaceResolved
from app.astro.key_builder import KeyBlock, build_knowledge_key_blocks
from app.astro.natal_normalizer import normalize_for_keybuilder
from app.schemas.natal import TopicCategory
from app.services.chunks_repo import ChunksRepo
from app.services.fallback_composer import compose_fallback_text_v1
from app.services.knowledge_repo import KnowledgeRepo
from app.services.search_intent_builder import SearchIntentBuilder
from app.routers.admin_knowledge import router as admin_knowledge_router
from app.routers.admin_knowledge_items import router as admin_knowledge_items_router

class UTF8JSONResponse(JSONResponse):
    """JSONResponse that explicitly declares UTF-8 in Content-Type."""
    media_type = "application/json; charset=utf-8"


app = FastAPI(
    title="SuperAstro Astroprocessor",
    version="1.0.0",
    default_response_class=UTF8JSONResponse,
)

app.include_router(admin_knowledge_router)
app.include_router(admin_knowledge_items_router)

@app.on_event("startup")
async def on_startup() -> None:
    await init_db()
    if not os.path.exists(settings.knowledge_db_path):
        print(f"[WARN] Knowledge DB file not found: {settings.knowledge_db_path}")


# -------------------- Health --------------------


class HealthResponse(BaseModel):
    ok: bool = True
    service: str = "astroprocessor"
    se_ephe_path: str
    knowledge_db_path: str
    astro_db_path: str


@app.get("/health", response_model=HealthResponse)
async def health() -> HealthResponse:
    return HealthResponse(
        se_ephe_path=settings.se_ephe_path,
        knowledge_db_path=settings.knowledge_db_path,
        astro_db_path=settings.astro_db_path,
    )


# -------------------- Place resolve --------------------


class PlaceResolveRequest(BaseModel):
    query: str = Field(..., min_length=2, max_length=512)
    locale: str = "ru-RU"


class PlaceResolveResponse(BaseModel):
    ok: bool
    query: str
    locale: str
    display_name: str | None = None
    lat: float | None = None
    lon: float | None = None
    country_code: str | None = None
    timezone: str | None = None
    source: str | None = None
    error: str | None = None


@app.post("/v1/place/resolve", response_model=PlaceResolveResponse)
async def place_resolve(
    req: PlaceResolveRequest,
    session: AsyncSession = Depends(get_session),
) -> PlaceResolveResponse:
    place = await resolve_place(req.query, req.locale, session)
    return PlaceResolveResponse(
        ok=place.ok,
        query=req.query,
        locale=req.locale,
        display_name=place.display_name,
        lat=place.lat,
        lon=place.lon,
        country_code=place.country_code,
        timezone=place.timezone,
        source=place.source,
        error=place.error,
    )


# -------------------- Interpret --------------------


class BirthInput(BaseModel):
    date: str = Field(..., description="DD.MM.YYYY or YYYY-MM-DD")
    time: str | None = Field(None, description="HH:MM or null if unknown")
    place_query: str = Field(..., description="City, Country (free text)")
    gender: Literal["male", "female"]


class InterpretRequest(BaseModel):
    user_id: int | None = None
    birth: BirthInput
    topic_category: TopicCategory | None = None
    locale: str = "ru-RU"


class InterpretResponse(BaseModel):
    ok: bool
    topic_category: TopicCategory | None
    coverage: Literal["ok", "low_coverage", "empty"]
    text: str
    meta: dict[str, Any] = Field(default_factory=dict)


def _parse_birth_date(s: str) -> datetime:
    s = s.strip()
    for fmt in ("%d.%m.%Y", "%Y-%m-%d"):
        try:
            return datetime.strptime(s, fmt)
        except ValueError:
            continue
    raise ValueError("birth.date must be DD.MM.YYYY or YYYY-MM-DD")


def _iso(dt: Any) -> Optional[str]:
    if dt is None:
        return None
    if isinstance(dt, datetime):
        return dt.replace(microsecond=0).isoformat()
    s = str(dt).strip()
    # sqlite часто отдаёт "YYYY-MM-DD HH:MM:SS"
    if len(s) >= 19 and s[10] == " ":
        s = s[:19].replace(" ", "T", 1)
    return s


def _make_snippet(text: str, limit: int = 450) -> str:
    t = (text or "").strip()
    if len(t) <= limit:
        return t
    return t[:limit].rstrip() + "…"


def _topic_to_domain(topic_category: Optional[TopicCategory]) -> str:
    # пока только natal
    return "natal"


def expected_ids(blocks: list[KeyBlock], *, unknown_time: bool) -> set[str]:
    """
    E = planet cores + asc_core (+ mc_core only if known time).
    aspects and other extras are NOT part of E.
    """
    ids_present = {b.id for b in (blocks or [])}

    planet_cores = {
        b.id
        for b in (blocks or [])
        if b.id.endswith("_core") and isinstance(b.meta, dict) and ("planet" in b.meta)
    }

    expected = set(planet_cores)

    if "asc_core" in ids_present:
        expected.add("asc_core")
    if (not unknown_time) and ("mc_core" in ids_present):
        expected.add("mc_core")

    return expected


def _attach_debug(meta: dict[str, Any], debug: dict[str, Any], *, debug_on: bool) -> None:
    if settings.debug_meta and debug_on:
        meta["debug"] = debug


def _pick_fts_lang(req_locale: str) -> str:
    """
    Сейчас FTS-слой B заполнен только ru-RU документами (knowledge_docs.lang = 'ru-RU').
    Поэтому всегда ищем по ru-RU, чтобы locale miss не убивал fallback.
    Позже можно сделать маппинг/фоллбек по наличию lang в knowledge_docs.
    """
    return "ru-RU"

class KeysEV1Response(BaseModel):
    ok: bool = True
    unknown_time: bool
    expected_ids: list[str]
    selection: list[dict[str, Any]]
    ev1_candidate_keys: dict[str, list[str]]  # block_id -> keys

@app.post("/v1/keys/ev1", response_model=KeysEV1Response)
async def keys_ev1(
    req: InterpretRequest,
    session: AsyncSession = Depends(get_session),
) -> KeysEV1Response:
    # 1) place resolve
    place = await resolve_place(req.birth.place_query, req.locale, session)
    if not place.ok:
        return KeysEV1Response(ok=False, unknown_time=True, expected_ids=[], selection=[], ev1_candidate_keys={})

    # 2) parse birth
    dt = _parse_birth_date(req.birth.date)
    year, month, day = dt.year, dt.month, dt.day

    if req.birth.time:
        tm = datetime.strptime(req.birth.time, "%H:%M").time()
        hour, minute = tm.hour, tm.minute
        time_unknown = False
    else:
        hour, minute = 12, 0
        time_unknown = True

    birth = BirthData(year=year, month=month, day=day, hour=hour, minute=minute, time_unknown=time_unknown)

    tz_str = str(place.timezone) if place.timezone else ""
    if not tz_str:
        return KeysEV1Response(ok=False, unknown_time=time_unknown, expected_ids=[], selection=[], ev1_candidate_keys={})

    place_resolved = PlaceResolved(
        query=req.birth.place_query,
        display_name=place.display_name,
        lat=float(place.lat),
        lon=float(place.lon),
        tz_str=tz_str,
        country_code=place.country_code,
    )

    # 3) kerykeion
    adapter = KerykeionAdapter(ephemeris_path=settings.se_ephe_path)
    if birth.time_unknown:
        h, m = adapter.pick_time_for_unknown_birthtime(
            name="User",
            year=birth.year,
            month=birth.month,
            day=birth.day,
            place=place_resolved,
        )
        birth = BirthData(year=birth.year, month=birth.month, day=birth.day, hour=h, minute=m, time_unknown=True)

    subject = adapter.build_subject(
        name="User",
        birth=birth,
        place=place_resolved,
        houses_system_identifier="A" if birth.time_unknown else "P",
    )
    natal_data_raw = adapter.natal_chart_data(subject)

    # 4) keybuilder
    key_input = normalize_for_keybuilder(natal_data_raw, unknown_time=birth.time_unknown)
    blocks_all = build_knowledge_key_blocks(key_input, tone_namespace="natal")
    blocks = [b for b in blocks_all if b.id != "generic"]

    selection = [{"id": b.id, "candidate_keys": b.candidate_keys, "meta": b.meta} for b in blocks]
    exp = expected_ids(blocks, unknown_time=birth.time_unknown)

    ev1_keys: dict[str, list[str]] = {}
    for b in blocks:
        if b.id in exp:
            ev1_keys[b.id] = list(b.candidate_keys)

    return KeysEV1Response(
        ok=True,
        unknown_time=birth.time_unknown,
        expected_ids=sorted(list(exp)),
        selection=selection,
        ev1_candidate_keys=ev1_keys,
    )

@app.post("/v1/natal/interpret", response_model=InterpretResponse)
async def natal_interpret(
    req: InterpretRequest,
    debug_on: bool = Query(False, alias="debug"),
    force_fallback: bool = Query(False, alias="force_fallback"),
    use_fallback_text: bool = Query(False, alias="use_fallback_text"),
    session: AsyncSession = Depends(get_session),
    knowledge_session: AsyncSession = Depends(get_knowledge_session),
    content_locale = "ru-RU"  # пока только русский
) -> InterpretResponse:
    topic_category: Optional[TopicCategory] = req.topic_category

    debug: dict[str, Any] = {}
    meta: dict[str, Any] = {}

    selection: list[dict[str, Any]] = []
    fallback: dict[str, Any] | None = None

    # -------- 1) place resolve --------
    place = await resolve_place(req.birth.place_query, req.locale, session)
    if not place.ok:
        meta.update({"place_error": place.error, "source": place.source})
        _attach_debug(meta, debug, debug_on=debug_on)
        return InterpretResponse(
            ok=False,
            topic_category=topic_category,
            coverage="empty",
            text=(
                "❌ Не удалось распознать место рождения.\n\n"
                "Попробуйте формат: Город, Страна (напр. Almaty, Kazakhstan)."
            ),
            meta=meta,
        )

    # -------- 2) parse birth --------
    try:
        dt = _parse_birth_date(req.birth.date)
    except ValueError as e:
        meta.update({"field": "birth.date", "error": str(e)})
        _attach_debug(meta, debug, debug_on=debug_on)
        return InterpretResponse(
            ok=False,
            topic_category=topic_category,
            coverage="empty",
            text=f"❌ Некорректная дата рождения: {e}",
            meta=meta,
        )

    year, month, day = dt.year, dt.month, dt.day

    if req.birth.time:
        try:
            tm = datetime.strptime(req.birth.time, "%H:%M").time()
        except ValueError:
            meta.update({"field": "birth.time"})
            _attach_debug(meta, debug, debug_on=debug_on)
            return InterpretResponse(
                ok=False,
                topic_category=topic_category,
                coverage="empty",
                text="❌ Некорректное время рождения. Ожидаю HH:MM (например 07:30) или null.",
                meta=meta,
            )
        hour, minute = tm.hour, tm.minute
        time_unknown = False
    else:
        hour, minute = 12, 0
        time_unknown = True

    birth = BirthData(
        year=year,
        month=month,
        day=day,
        hour=hour,
        minute=minute,
        time_unknown=time_unknown,
    )

    # guard timezone
    tz_str = str(place.timezone) if place.timezone else ""
    if not tz_str:
        meta.update({"place_error": "timezone_not_resolved", "source": place.source})
        _attach_debug(meta, debug, debug_on=debug_on)
        return InterpretResponse(
            ok=False,
            topic_category=topic_category,
            coverage="empty",
            text="❌ Не удалось определить таймзону места рождения. Попробуйте уточнить место (город + страна).",
            meta=meta,
        )

    place_resolved = PlaceResolved(
        query=req.birth.place_query,
        display_name=place.display_name,
        lat=float(place.lat),
        lon=float(place.lon),
        tz_str=tz_str,
        country_code=place.country_code,
    )

    # -------- 3) kerykeion calc --------
    adapter = KerykeionAdapter(ephemeris_path=settings.se_ephe_path)

    if birth.time_unknown:
        h, m = adapter.pick_time_for_unknown_birthtime(
            name="User",
            year=birth.year,
            month=birth.month,
            day=birth.day,
            place=place_resolved,
        )
        birth = BirthData(
            year=birth.year,
            month=birth.month,
            day=birth.day,
            hour=h,
            minute=m,
            time_unknown=True,
        )

    try:
        subject = adapter.build_subject(
            name="User",
            birth=birth,
            place=place_resolved,
            houses_system_identifier="A" if birth.time_unknown else "P",
        )
    except Exception as e:
        debug["kerykeion_error"] = f"{type(e).__name__}: {e}"
        _attach_debug(meta, debug, debug_on=debug_on)
        return InterpretResponse(
            ok=False,
            topic_category=topic_category,
            coverage="empty",
            text="❌ Ошибка построения натальной карты (Kerykeion). См. meta.debug.kerykeion_error.",
            meta=meta,
        )

    natal_data_raw = adapter.natal_chart_data(subject)

    if settings.debug_meta and debug_on:
        subj = natal_data_raw.get("subject") or {}
        debug["unknown_time"] = birth.time_unknown
        debug["houses_system"] = "A" if birth.time_unknown else "P"
        debug["natal_data_raw_keys"] = list(natal_data_raw.keys())[:60]
        debug["raw_subject_type"] = str(type(subj))
        if isinstance(subj, dict):
            debug["raw_subject_keys"] = list(subj.keys())[:80]
            debug["raw_subject_sun"] = repr(subj.get("sun"))[:800]
            debug["raw_subject_ascendant"] = repr(subj.get("ascendant"))[:800]
            debug["raw_subject_medium_coeli"] = repr(subj.get("medium_coeli"))[:800]
        else:
            debug["raw_subject_repr"] = repr(subj)[:800]

    # -------- 4) normalize + keybuilder --------
    blocks: list[KeyBlock] = []
    try:
        key_input = normalize_for_keybuilder(natal_data_raw, unknown_time=birth.time_unknown)

        if settings.debug_meta and debug_on:
            debug["key_input_sample"] = {
                "sun": (key_input.get("planets") or {}).get("sun"),
                "angles": key_input.get("angles"),
            }

        blocks_all = build_knowledge_key_blocks(key_input, tone_namespace="natal")
        blocks = [b for b in blocks_all if b.id != "generic"]
        selection = [{"id": b.id, "candidate_keys": b.candidate_keys, "meta": b.meta} for b in blocks]
    except Exception as e:
        debug["knowledge_blocks_error"] = f"{type(e).__name__}: {e}"
        blocks = []
        selection = []

    if not blocks:
        meta.update(
            {
                "place": {
                    "display_name": place.display_name,
                    "lat": place.lat,
                    "lon": place.lon,
                    "country_code": place.country_code,
                    "timezone": place.timezone,
                    "source": place.source,
                },
            }
        )
        if settings.trace_meta:
            meta["trace"] = {"selection": selection, "hits": []}
        _attach_debug(meta, debug, debug_on=debug_on)
        return InterpretResponse(
            ok=True,
            topic_category=topic_category,
            coverage="empty",
            text=(
                "Не удалось построить ключи интерпретации "
                "(ошибка нормализации или KeyBuilder). См. meta.debug.knowledge_blocks_error."
            ),
            meta=meta,
        )

    # -------- 5) knowledge_items lookup (layer A) --------
    repo = KnowledgeRepo()
    raw_blocks: list[dict[str, Any]] = []
    trace_hits: list[dict[str, Any]] = []

    try:
        for b in blocks:
            hit = await repo.pick_first_match(
                knowledge_session,
                candidate_keys=b.candidate_keys,
                topic_category=topic_category,
                locale=content_locale,
            )
            if not hit:
                continue

            created_at_iso = _iso(getattr(hit, "created_at", None))

            raw_blocks.append(
                {
                    "block_id": b.id,
                    "key": hit.key,
                    "knowledge_item_id": hit.id,
                    "priority": hit.priority,
                    "created_at": created_at_iso,
                    "text": hit.text,
                }
            )
            trace_hits.append(
                {
                    "block_id": b.id,
                    "key": hit.key,
                    "knowledge_item_id": hit.id,
                    "priority": hit.priority,
                    "created_at": created_at_iso,
                }
            )
    except OperationalError as e:
        debug["knowledge_db_error"] = f"{type(e).__name__}: {e}"
        _attach_debug(meta, debug, debug_on=debug_on)
        return InterpretResponse(
            ok=False,
            topic_category=topic_category,
            coverage="empty",
            text="❌ Ошибка доступа к базе знаний. См. meta.debug.knowledge_db_error.",
            meta=meta,
        )

    # -------- coverage + final text (E-based) --------
    expected = expected_ids(blocks, unknown_time=birth.time_unknown)
    hit_ids = {rb["block_id"] for rb in raw_blocks}
    hits_expected = len(hit_ids & expected)
    expected_total = len(expected)

    final_meta: dict[str, Any] = {
        "source": "raw.blocks",
        "mode": "concat_v0",
        "blocks_used": len(raw_blocks),
        "coverage_v": "E_v1",
        "expected_total": expected_total,
        "hits_expected": hits_expected,
    }

    if hits_expected == 0:
        coverage: Literal["ok", "low_coverage", "empty"] = "empty"
        final_text = (
            "Пока нет интерпретаций в базе знаний для этих ключей.\n"
            "Следующий шаг: добавить записи в knowledge_items для базовых ключей "
            "(например, natal.planet.sun.sign.any, natal.angle.asc.sign.any и т.д.)."
        )
        final_meta["mode"] = "empty"
    else:
        ratio = hits_expected / max(expected_total, 1)
        coverage = "low_coverage" if ratio < 0.6 else "ok"
        final_text = "\n\n".join(b["text"] for b in raw_blocks)

    # outputs of fallback stage (needed outside the if)
    fts_hits: list[Any] = []
    fts_query_used: str = ""
    fts_mode: str | None = None  # "strict" | "soft" | None

    # -------- 6) fallback to layer B (FTS) when coverage is weak --------
    if coverage in ("empty", "low_coverage") or force_fallback:
        topic_domain = _topic_to_domain(topic_category)
        intent_builder = SearchIntentBuilder()

        intent_result = None
        fts_lang = _pick_fts_lang(req.locale)

        try:
            # ВАЖНО: сейчас FTS-документы только ru-RU, поэтому строим intent на ru-RU.
            intent_result = intent_builder.build(
                topic_category=topic_category,
                locale=fts_lang,
                tone_namespace="natal",
                selection=selection,
                topic_domain=topic_domain,
            )
            fts_query_used = (intent_result.intent.query or "").strip()
        except Exception as e:
            debug["intent_error"] = f"{type(e).__name__}: {e}"
            intent_result = None
            fts_query_used = ""

        if fts_query_used:
            chunks_repo = ChunksRepo()
            try:
                fts_hits = await chunks_repo.search_fts(
                    knowledge_session,
                    query=fts_query_used,
                    lang=fts_lang,
                    topic_domain=topic_domain,
                    limit=6,
                )
                fts_mode = "strict"
            except OperationalError as e:
                debug["fts_error"] = f"{type(e).__name__}: {e}"
                fts_hits = []
            except Exception as e:
                debug["fts_error"] = f"{type(e).__name__}: {e}"
                fts_hits = []

            # try soft if strict returned nothing
            if (not fts_hits) and intent_result is not None:
                query_soft = getattr(intent_result.intent, "query_soft", None)
                query_soft = (query_soft or "").strip()
                if query_soft:
                    try:
                        fts_hits = await chunks_repo.search_fts(
                            knowledge_session,
                            query=query_soft,
                            lang=fts_lang,
                            topic_domain=topic_domain,
                            limit=6,
                        )
                        fts_query_used = query_soft
                        fts_mode = "soft"
                    except OperationalError as e:
                        debug["fts_error_soft"] = f"{type(e).__name__}: {e}"
                    except Exception as e:
                        debug["fts_error_soft"] = f"{type(e).__name__}: {e}"

        # debug markers after strict/soft
        if settings.debug_meta and debug_on:
            debug["use_fallback_text"] = use_fallback_text
            debug["coverage_before_fallback_text"] = coverage
            debug["fts_hits_len"] = len(fts_hits or [])
            debug["fts_query_used"] = fts_query_used
            debug["fts_mode_used"] = fts_mode
            debug["req_locale"] = req.locale
            debug["fts_lang_used"] = fts_lang
            debug.setdefault("fallback_text_applied", False)
            debug.setdefault("fallback_text_reason", "not_applied")

        if intent_result is not None:
            fallback = {
                "mode": "fts_chunks_v1",
                "hits_count": len(fts_hits or []),
                "intent": {
                    "domain": intent_result.intent.domain,
                    "locale": intent_result.intent.locale,
                    "anchors": intent_result.intent.anchors,
                    "tokens": [
                        {"text": t.text, "kind": t.kind, "weight": t.weight, "source": t.source}
                        for t in intent_result.intent.tokens
                    ],
                    "query": fts_query_used,
                },
                "trace": {
                    "candidate_keys_used": intent_result.trace.candidate_keys_used,
                    "rules_fired": intent_result.trace.rules_fired,
                },
                "hits": [
                    {
                        "chunk_id": h.chunk_id,
                        "doc_id": h.doc_id,
                        "chunk_index": h.chunk_index,
                        "topic_domain": h.topic_domain,
                        "score": h.score,
                        "source_path": h.source_path,
                        "title": h.title,
                        "author": h.author,
                        "created_at": _iso(h.created_at),
                        "snippet": _make_snippet(h.text),
                    }
                    for h in (fts_hits or [])
                ],
            }

        # -------- 6.4) Fallback Composer v1: влияет на text только по флагу --------
        if use_fallback_text and coverage in ("empty", "low_coverage"):
            if fts_hits:
                # хотим примерно 1800 символов суммарно:
                # composer режет ПО-ХИТУ, поэтому распределяем бюджет
                max_hits = 3
                per_hit_chars = 600  # 3 * 600 ~= 1800

                try:
                    dedupe_mode: str = "soft"  # "strict" | "soft" | "off"
                    res = compose_fallback_text_v1(
                        fts_hits,
                        max_hits=max_hits,
                        per_hit_chars=per_hit_chars,
                        dedupe_mode=dedupe_mode,
                    )
                    composed_text = (res.text or "").strip()

                    composed_meta = {
                        "total_hits": int(res.total),
                        "used_hits": int(res.used),
                        "max_hits": int(max_hits),
                        "per_hit_chars": int(per_hit_chars),
                        "dedupe_mode": dedupe_mode,
                    }

                    if composed_text:
                        final_text = composed_text
                        final_meta["source"] = "fallback.chunks"
                        final_meta["mode"] = "fallback_compose_v1"
                        final_meta["fallback"] = composed_meta

                        if settings.debug_meta and debug_on:
                            debug["fallback_text_applied"] = True
                            debug["fallback_text_reason"] = "applied"
                            debug["fallback_text_used_chunks"] = int(res.used)
                    else:
                        if settings.debug_meta and debug_on:
                            debug["fallback_text_applied"] = False
                            debug["fallback_text_reason"] = "composer_returned_empty"
                except Exception as e:
                    # не валим весь запрос из-за composer-а
                    if settings.debug_meta and debug_on:
                        debug["fallback_text_applied"] = False
                        debug["fallback_text_reason"] = "composer_error"
                        debug["fallback_text_error"] = f"{type(e).__name__}: {e}"
            else:
                if settings.debug_meta and debug_on:
                    debug["fallback_text_applied"] = False
                    debug["fallback_text_reason"] = "no_fts_hits"
        else:
            if settings.debug_meta and debug_on:
                debug.setdefault("fallback_text_applied", False)
                if coverage == "ok":
                    debug.setdefault("fallback_text_reason", "coverage_ok_no_override")
                else:
                    debug.setdefault("fallback_text_reason", "not_requested")

    # -------- meta packing --------
    meta.update(
        {
            "place": {
                "display_name": place.display_name,
                "lat": place.lat,
                "lon": place.lon,
                "country_code": place.country_code,
                "timezone": place.timezone,
                "source": place.source,
            },
            "raw": {"blocks": raw_blocks},
            "final": final_meta,
            "fallback": fallback,  # None или dict
        }
    )

    meta["locale"] = {
    "requested": req.locale,
    "effective": content_locale,
    "note": "Only ru-RU content is supported currently",
    }


    if settings.trace_meta:
        meta["trace"] = {"selection": selection, "hits": trace_hits}

    if settings.debug_meta and debug_on:
        debug["topic_category"] = topic_category
        try:
            topic_domain = _topic_to_domain(topic_category)
            fts_lang_preview = _pick_fts_lang(req.locale)
            intent_preview = SearchIntentBuilder().build(
                topic_category=topic_category,
                locale=fts_lang_preview,
                tone_namespace="natal",
                selection=selection,
                topic_domain=topic_domain,
            )
            debug["intent_preview"] = {
                "requested_locale": req.locale,
                "fts_lang_used": fts_lang_preview,
                "query": intent_preview.intent.query,
                "query_soft": intent_preview.intent.query_soft,
                "tokens": [{"kind": t.kind, "text": t.text, "source": t.source} for t in intent_preview.intent.tokens],
            }
        except Exception as e:
            debug["intent_preview_error"] = f"{type(e).__name__}: {e}"

        _attach_debug(meta, debug, debug_on=debug_on)

    return InterpretResponse(
        ok=True,
        topic_category=topic_category,
        coverage=coverage,
        text=final_text,
        meta=meta,
    )
