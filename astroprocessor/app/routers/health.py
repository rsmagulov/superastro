# app/routers/health.py
from __future__ import annotations

from fastapi import APIRouter
from pydantic import BaseModel

from app.settings import settings

router = APIRouter(tags=["health"])


class HealthResponse(BaseModel):
    ok: bool = True
    service: str = "astroprocessor"
    se_ephe_path: str
    knowledge_db_path: str
    astro_db_path: str


@router.get("/health", response_model=HealthResponse)
async def health() -> HealthResponse:
    return HealthResponse(
        se_ephe_path=settings.se_ephe_path,
        knowledge_db_path=settings.knowledge_db_path,
        astro_db_path=settings.astro_db_path,
    )
