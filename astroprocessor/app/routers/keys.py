# ============================================================
# File: astroprocessor/app/routers/keys.py
# ============================================================
from __future__ import annotations

from typing import Any

from fastapi import APIRouter, Depends, Request
from sqlalchemy.ext.asyncio import AsyncSession

from app.astro.kerykeion_adapter import KerykeionAdapter, PlaceResolved
from app.astro.key_builder import build_knowledge_key_blocks
from app.astro.natal_normalizer import normalize_for_keybuilder
from app.db import get_session
from app.schemas.natal import InterpretRequest
from app.services.geocode import resolve_place
from app.settings import settings

router = APIRouter(prefix="/v1/keys", tags=["keys"])


@router.post("/ev1", response_model=dict)
async def keys_ev1(
    request: Request,
    req: InterpretRequest,
    session: AsyncSession = Depends(get_session),
) -> dict:
    # 1) resolve place
    place = await resolve_place(req.birth.place_query, "ru", session)
    if not place.ok or not place.timezone:
        return {
            "request_id": getattr(request.state, "request_id", ""),
            "ok": False,
            "error": place.error or "place_not_resolved",
            "selection": [],
            "ev1_candidate_keys": {},
        }

    place_resolved = PlaceResolved(
        query=req.birth.place_query,
        display_name=place.display_name,
        lat=float(place.lat),
        lon=float(place.lon),
        tz_str=str(place.timezone),
        country_code=place.country_code,
    )

    # 2) birth
    birth = req.birth.to_birth_input().to_domain()

    adapter = KerykeionAdapter(ephemeris_path=settings.se_ephe_path)

    if birth.time_unknown:
        h, m = adapter.pick_time_for_unknown_birthtime(
            name=req.name,
            year=birth.year,
            month=birth.month,
            day=birth.day,
            place=place_resolved,
        )
        birth = birth.model_copy(update={"hour": h, "minute": m, "time_unknown": True})

    subject = adapter.build_subject(
        name=req.name,
        birth=birth,
        place=place_resolved,
        houses_system_identifier="A" if birth.time_unknown else "P",
    )
    natal_data_raw = adapter.natal_chart_data(subject)

    key_input = normalize_for_keybuilder(natal_data_raw, unknown_time=birth.time_unknown)
    blocks_all = build_knowledge_key_blocks(key_input, tone_namespace="natal")
    blocks = [b for b in blocks_all if b.id != "generic"]

    selection: list[dict[str, Any]] = [
        {"id": b.id, "candidate_keys": list(b.candidate_keys), "meta": b.meta} for b in blocks
    ]

    # “EV1” — это ключи базовых блоков (core)
    ev1_candidate_keys: dict[str, list[str]] = {}
    for b in blocks:
        if b.id.endswith("_core") or b.id in ("asc_core", "mc_core"):
            if birth.time_unknown and b.id == "mc_core":
                continue
            ev1_candidate_keys[b.id] = list(b.candidate_keys)

    return {
        "request_id": getattr(request.state, "request_id", ""),
        "ok": True,
        "unknown_time": bool(birth.time_unknown),
        "selection": selection,
        "ev1_candidate_keys": ev1_candidate_keys,
    }
