# ============================================================
# File: astroprocessor/app/routers/place_resolve.py
# ============================================================
from __future__ import annotations

from fastapi import APIRouter, Depends, Query, Request
from sqlalchemy.ext.asyncio import AsyncSession

from app.db import get_session
from app.schemas.place import PlaceResolveResponse
from app.schemas.place_out import PlaceResolvedOut
from app.services.geocode import resolve_place

router = APIRouter(prefix="/v1/place", tags=["place"])


@router.get("/resolve", response_model=PlaceResolveResponse)
async def place_resolve(
    request: Request,
    q: str = Query(..., min_length=2, max_length=512),
    locale: str = Query("ru", min_length=2, max_length=32),
    session: AsyncSession = Depends(get_session),
) -> dict:
    place = await resolve_place(q, locale, session)

    body = PlaceResolvedOut(
        ok=place.ok,
        query=q,
        display_name=place.display_name,
        lat=place.lat,
        lon=place.lon,
        country_code=place.country_code,
        timezone=place.tz_str,
        source=place.source,
        error=place.error,
    ).model_dump()

    return {
        "request_id": getattr(request.state, "request_id", ""),
        **body,
    }
