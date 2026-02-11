# =========================================
# FILE: astroprocessor/app/routers/place_resolve.py
# (НОВЫЙ ФАЙЛ: стабильный /v1/place/resolve)
# =========================================
from __future__ import annotations

from fastapi import APIRouter, Depends, Query
from sqlalchemy.ext.asyncio import AsyncSession

from app.db import get_knowledge_session
from app.schemas.place_out import PlaceResolvedOut
from app.services.geocode import resolve_place

router = APIRouter(prefix="/v1/place", tags=["place"])


@router.get("/resolve", response_model=PlaceResolvedOut)
async def place_resolve(
    q: str = Query(..., min_length=2, description="Название места: город/страна и т.д."),
    locale: str = Query(default="ru"),
    session: AsyncSession = Depends(get_knowledge_session),
) -> PlaceResolvedOut:
    p = await resolve_place(query=q, locale=locale, session=session)
    return PlaceResolvedOut.from_domain(p)