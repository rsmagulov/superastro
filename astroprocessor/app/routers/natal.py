# =========================================
# FILE: astroprocessor/app/routers/natal.py
# (Если файла нет — создай. Если есть — замени содержимое/внеси правки по сути)
# =========================================
from __future__ import annotations

from fastapi import APIRouter, Depends, HTTPException, Query
from sqlalchemy.ext.asyncio import AsyncSession

from app.db import get_knowledge_session
from app.schemas.natal import NatalRequest
from app.schemas.natal_out import NatalInterpretOut
from app.services.chart_service import ChartService
from app.services.geocode import resolve_place
from app.settings import settings
from app.schemas.place_out import PlaceResolvedOut
from uuid import uuid4



router = APIRouter(prefix="/v1/natal", tags=["natal"])

_chart_service = ChartService(ephemeris_path=settings.ephemeris_path)


@router.post("/interpret", response_model=NatalInterpretOut)
async def natal_interpret(
    req: NatalRequest,
    locale: str = Query(default="ru"),
    topic_category: str = Query(default="personality_core"),
    session: AsyncSession = Depends(get_knowledge_session),
) -> NatalInterpretOut:
    request_id = uuid4()

    # 1) resolve place
    place_domain = await resolve_place(
        query=req.birth.place_query,
        locale=locale,
        session=session,
    )
    if not place_domain.ok:
        raise HTTPException(
            status_code=400,
            detail={
                "request_id": str(request_id),
                "error": place_domain.error,
                "source": place_domain.source,
            },
        )

    place_out = PlaceResolvedOut.from_domain(place_domain)

    # 2) convert birth
    try:
        birth_domain = req.birth.to_birth_input().to_domain()
    except ValueError as e:
        raise HTTPException(
            status_code=422,
            detail={"request_id": str(request_id), "error": str(e)},
        )

    # 3) interpret
    payload = await _chart_service.interpret_natal(
        session=session,
        user_name=req.name,
        birth=birth_domain,
        place=place_domain,
        topic_category=req.topic_category or topic_category,
        locale=locale,
        tone_namespace="natal",
    )

    return NatalInterpretOut.from_service(
        request_id=request_id,
        place=place_out,
        payload=payload,
    )
