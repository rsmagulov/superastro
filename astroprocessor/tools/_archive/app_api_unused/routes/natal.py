from __future__ import annotations

from fastapi import APIRouter, Depends
from sqlalchemy.ext.asyncio import AsyncSession

from astroprocessor.app.schemas.natal import NatalRequest
from astroprocessor.app.astrology.kerykeion_adapter import BirthData, PlaceResolved
from astroprocessor.app.services.chart_service import ChartService
from astroprocessor.app.db import get_knowledge_session

router = APIRouter()


@router.post("/v1/natal/interpret")
async def natal_interpret(req: NatalRequest, session: AsyncSession = Depends(get_knowledge_session)):
    # 1) Геокодинг (пока заглушка — потом подключишь свой geocode сервис)
    place = PlaceResolved(
        query=req.birth.place_query,
        display_name="Алматы, Казахстан",
        lat=43.2363924,
        lon=76.9457275,
        tz_str="Asia/Almaty",
        country_code="kz",
    )

    # 2) BirthData
    birth = BirthData(
        year=req.birth.date.year,
        month=req.birth.date.month,
        day=req.birth.date.day,
        hour=req.birth.time.hour if req.birth.time else 12,
        minute=req.birth.time.minute if req.birth.time else 0,
        time_unknown=req.birth.unknown_time,
    )

    svc = ChartService(ephemeris_path=None)

    result = await svc.interpret_natal(
        session=session,
        user_name=req.name,
        birth=birth,
        place=place,
        topic_category=req.topic_category,
        locale=getattr(req, "locale", "ru"),
        tone_namespace="natal",
        max_blocks=50,
        max_chars=30_000,
    )

    return {
        "text": result["final_text"],
        "meta": {
            "raw": {"blocks": result["raw_blocks"]},
            "final": result["final_meta"],
            "trace": result["trace"],  # NEW
            "place": {
                "display_name": place.display_name,
                "lat": place.lat,
                "lon": place.lon,
                "country_code": place.country_code,
                "timezone": place.tz_str,
                "source": "nominatim",
            },
        },
        "natal_data": result["natal_data"],
        "knowledge_blocks": result["knowledge_blocks"],
    }
