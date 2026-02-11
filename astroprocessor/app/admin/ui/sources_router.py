# app/admin/ui/sources_router.py
from __future__ import annotations

from fastapi import APIRouter, Depends, Form
from fastapi.responses import HTMLResponse
from sqlalchemy import text
from sqlalchemy.ext.asyncio import AsyncSession

from app.db import get_knowledge_session

router = APIRouter(prefix="/sources", tags=["admin-ui"])


async def _ensure_sources_table(session: AsyncSession) -> None:
    await session.execute(
        text(
            """
            CREATE TABLE IF NOT EXISTS sources (
                id INTEGER PRIMARY KEY AUTOINCREMENT,
                title TEXT NOT NULL,
                author TEXT,
                school TEXT,
                source_type TEXT,
                language TEXT,
                priority INTEGER NOT NULL DEFAULT 0,
                is_enabled INTEGER NOT NULL DEFAULT 1
            )
            """
        )
    )
    await session.commit()


@router.get("")  # <-- ВАЖНО: НЕ "/sources"
async def sources_page(session: AsyncSession = Depends(get_knowledge_session)) -> HTMLResponse:
    await _ensure_sources_table(session)
    return HTMLResponse("<html><body><h1>Sources</h1></body></html>", status_code=200)


@router.post("/import")  # <-- ВАЖНО: НЕ "/sources/import"
async def import_source(
    session: AsyncSession = Depends(get_knowledge_session),
    title: str = Form(...),
    author: str = Form(""),
    school: str = Form(""),
    source_type: str = Form(""),
    language: str = Form("ru"),
    priority: str = Form("0"),
    is_enabled: str = Form("1"),
) -> HTMLResponse:
    await _ensure_sources_table(session)
    await session.execute(
        text(
            """
            INSERT INTO sources (title, author, school, source_type, language, priority, is_enabled)
            VALUES (:title, :author, :school, :source_type, :language, :priority, :is_enabled)
            """
        ),
        {
            "title": title,
            "author": author,
            "school": school,
            "source_type": source_type,
            "language": language,
            "priority": int(priority),
            "is_enabled": int(is_enabled),
        },
    )
    await session.commit()

    resp = HTMLResponse("<div>ok</div>", status_code=200)
    resp.headers["HX-Trigger"] = "sourcesChanged"
    return resp


@router.get("/{source_id}")
async def source_card(source_id: int) -> HTMLResponse:
    return HTMLResponse("Not Found", status_code=404)
