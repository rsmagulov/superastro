from __future__ import annotations

from typing import Any

from fastapi import APIRouter, Depends, HTTPException, Query, Request
from sqlalchemy.ext.asyncio import AsyncSession

from app.db import get_knowledge_session
from app.schemas.natal import NatalRequest
from app.services.geocode import resolve_place

from app.astro.kerykeion_adapter import KerykeionAdapter
from app.astro.key_builder import build_knowledge_key_blocks
from app.astro.natal_normalizer import normalize_for_keybuilder
from app.settings import settings

router = APIRouter(prefix="/v1/keys", tags=["keys"])


@router.post("/ev1")
async def keys_ev1(
    req: NatalRequest,
    request: Request,
    locale: str = Query(default="ru"),
    topic_category: str = Query(default="personality_core"),  # пока для совместимости
    session: AsyncSession = Depends(get_knowledge_session),
) -> dict[str, Any]:
    request_id = request.state.request_id

    # 1) resolve place
    place = await resolve_place(
        query=req.birth.place_query,
        locale=locale,
        session=session,
    )
    if not place.ok:
        raise HTTPException(
            status_code=400,
            detail={
                "request_id": request_id,
                "error": place.error,
                "source": place.source,
            },
        )

    # 2) birth -> domain (dataclass for Kerykeion)
    try:
        birth = req.birth.to_birth_input().to_domain()
    except ValueError as e:
        raise HTTPException(
            status_code=422,
            detail={"request_id": request_id, "error": str(e)},
        )

    # 3) kerykeion calc -> natal raw
    adapter = KerykeionAdapter(ephemeris_path=settings.ephemeris_path)

    # house system: когда время неизвестно — используем "A", иначе "P"
    houses_id = "A" if birth.time_unknown else "P"

    if birth.time_unknown:
        h, m = adapter.pick_time_for_unknown_birthtime(
            name=req.name,
            year=birth.year,
            month=birth.month,
            day=birth.day,
            place=place,
        )
        birth = birth.__class__(
            year=birth.year,
            month=birth.month,
            day=birth.day,
            hour=h,
            minute=m,
            time_unknown=True,
        )

    subject = adapter.build_subject(
        name=req.name,
        birth=birth,
        place=place,
        houses_system_identifier=houses_id,
    )
    natal_raw = adapter.natal_chart_data(subject)

    # 4) normalize + keybuilder
    key_input = normalize_for_keybuilder(natal_raw, unknown_time=birth.time_unknown)
    blocks = build_knowledge_key_blocks(key_input, tone_namespace="natal")
    blocks = [b for b in blocks if b.id != "generic"]

    selection = [
        {"id": b.id, "candidate_keys": list(b.candidate_keys), "meta": b.meta}
        for b in blocks
    ]

    return {
        "request_id": request_id,
        "ok": True,
        "unknown_time": bool(birth.time_unknown),
        "place": {
            "display_name": place.display_name,
            "lat": place.lat,
            "lon": place.lon,
            "country_code": place.country_code,
            "tz_str": place.tz_str,
            "source": place.source,
        },
        "selection": selection,
    }
