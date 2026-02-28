# ============================================================
# File: astroprocessor/app/routers/natal.py
# ============================================================
from __future__ import annotations

from fastapi import APIRouter, Depends, Query, Request
from sqlalchemy.ext.asyncio import AsyncSession

from app.db import get_knowledge_session, get_session
from app.schemas.natal import InterpretRequest
from app.schemas.natal_out import NatalInterpretResponse
from app.schemas.place_out import PlaceResolvedOut
from app.services.chart_service import ChartService

router = APIRouter(prefix="/v1/natal", tags=["natal"])

_chart_service = ChartService()


@router.post("/interpret", response_model=NatalInterpretResponse)
async def natal_interpret(
    request: Request,
    req: InterpretRequest,
    locale: str = Query("ru", min_length=2, max_length=32),
    topic_category: str | None = Query(None),
    session: AsyncSession = Depends(get_session),
    knowledge_session: AsyncSession = Depends(get_knowledge_session),
) -> NatalInterpretResponse:
    # topic_category можно прокинуть из query, но приоритет у body
    if req.topic_category is None and topic_category:
        req = req.model_copy(update={"topic_category": topic_category})

    payload = await _chart_service.interpret_natal_api(
        request_id=getattr(request.state, "request_id", ""),
        req=req,
        locale=locale,
        session=session,
        knowledge_session=knowledge_session,
    )

    place = payload.get("place")
    place_out = PlaceResolvedOut(**place) if isinstance(place, dict) else None

    return NatalInterpretResponse(
        request_id=payload.get("request_id") or getattr(request.state, "request_id", ""),
        ok=bool(payload.get("ok", True)),
        topic_category=payload.get("topic_category"),
        coverage=payload.get("coverage", "empty"),
        text=payload.get("text") or "",
        # ✅ критично для smoke-тестов
        natal_data=payload.get("natal_data") or {},
        knowledge_blocks=payload.get("knowledge_blocks") or [],
        place=place_out,
        raw_blocks=payload.get("raw_blocks") or [],
        meta=payload.get("meta") or {},
        error=payload.get("error"),
    )
