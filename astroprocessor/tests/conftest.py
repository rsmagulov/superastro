# tests/conftest.py
import sys
import asyncio
import json
from pathlib import Path

import pytest
import httpx
from fastapi import FastAPI
from sqlalchemy import text
from sqlalchemy.ext.asyncio import create_async_engine, async_sessionmaker, AsyncSession

# --- sys.path, чтобы import app.* работал из tests/ ---
ROOT = Path(__file__).resolve().parents[1]  # .../astroprocessor
if str(ROOT) not in sys.path:
    sys.path.insert(0, str(ROOT))

from app.db import get_knowledge_session
from app.admin.ui.router import router as admin_router
from app.knowledge.meta_schema import ALLOWED_ABSTRACTION_LEVELS, ALLOWED_TONES


def _pick_first(value, default: str) -> str:
    """
    ALLOWED_* могут быть list/tuple/set.
    Берём первый элемент детерминированно.
    """
    if not value:
        return default
    if isinstance(value, (set, frozenset)):
        seq = sorted(value)
    else:
        seq = list(value)
    return str(seq[0]) if seq else default


@pytest.fixture(scope="session")
def event_loop():
    loop = asyncio.get_event_loop_policy().new_event_loop()
    yield loop
    loop.close()


@pytest.fixture()
async def test_engine(tmp_path: Path):
    db_path = tmp_path / "test_knowledge.db"
    engine = create_async_engine(f"sqlite+aiosqlite:///{db_path}", future=True)

    tone_ok = _pick_first(ALLOWED_TONES, "neutral")
    abs_ok = _pick_first(ALLOWED_ABSTRACTION_LEVELS, "поведенческий")

    async with engine.begin() as conn:
        # knowledge_items
        await conn.execute(
            text(
                """
                CREATE TABLE knowledge_items (
                    id INTEGER PRIMARY KEY AUTOINCREMENT,
                    key TEXT NOT NULL,
                    topic_category TEXT NULL,
                    locale TEXT NOT NULL,
                    text TEXT NOT NULL,
                    priority INTEGER NOT NULL DEFAULT 100,
                    created_at TEXT NOT NULL DEFAULT (datetime('now')),
                    is_active INTEGER NOT NULL DEFAULT 0,
                    meta_json TEXT NULL
                );
                """
            )
        )

        # sources
        await conn.execute(
            text(
                """
                CREATE TABLE sources (
                    id INTEGER PRIMARY KEY AUTOINCREMENT,
                    title TEXT NOT NULL,
                    author TEXT,
                    school TEXT,
                    source_type TEXT,
                    language TEXT,
                    priority INTEGER NOT NULL DEFAULT 0,
                    is_enabled INTEGER NOT NULL DEFAULT 1
                );
                """
            )
        )

        # Seed data под ожидания тестов
        items = [
            (1, "natal.planet.sun.sign.any", None, "ru-RU", "t1", 100, 0, None),
            (
                2,
                "natal.planet.moon.sign.any",
                "personality_core",
                "ru-RU",
                "t2",
                100,
                0,
                json.dumps({"tone": tone_ok, "abstraction_level": abs_ok, "tags": []}, ensure_ascii=False),
            ),
            (
                3,
                "natal.planet.mars.sign.any",
                "purpose_path",
                "ru-RU",
                "t3",
                100,
                0,
                json.dumps({"tone": tone_ok, "abstraction_level": "", "tags": []}, ensure_ascii=False),
            ),
            (
                4,
                "natal.planet.sun.sign.any",
                "personality_core",
                "en-US",
                "t4",
                100,
                1,
                json.dumps({"tone": tone_ok, "abstraction_level": abs_ok, "tags": []}, ensure_ascii=False),
            ),
        ]

        for row in items:
            await conn.execute(
                text(
                    """
                    INSERT INTO knowledge_items (id, key, topic_category, locale, text, priority, is_active, meta_json)
                    VALUES (:id, :key, :tc, :locale, :txt, :prio, :ia, :mj)
                    """
                ),
                {
                    "id": row[0],
                    "key": row[1],
                    "tc": row[2],
                    "locale": row[3],
                    "txt": row[4],
                    "prio": row[5],
                    "ia": row[6],
                    "mj": row[7],
                },
            )

    try:
        yield engine
    finally:
        await engine.dispose()


@pytest.fixture()
def test_sessionmaker(test_engine):
    return async_sessionmaker(test_engine, class_=AsyncSession, expire_on_commit=False)


@pytest.fixture()
def app(test_sessionmaker):
    app = FastAPI()

    # тесты ходят на /admin/ui/*
    app.include_router(admin_router, prefix="/admin/ui")

    async def _override_get_knowledge_session():
        async with test_sessionmaker() as session:
            yield session

    app.dependency_overrides[get_knowledge_session] = _override_get_knowledge_session
    return app


@pytest.fixture()
async def client(app):
    transport = httpx.ASGITransport(app=app)
    async with httpx.AsyncClient(transport=transport, base_url="http://test") as ac:
        yield ac
