# astroprocessor/tests/test_e2e_v2_debug2_hits_include_planet_groups_present.py
from __future__ import annotations

import json
import sqlite3
from pathlib import Path
from typing import AsyncIterator

import pytest
from fastapi.testclient import TestClient
from sqlalchemy.ext.asyncio import AsyncSession, async_sessionmaker, create_async_engine

from app.db import get_knowledge_session
from app.main import app


def _create_kb_db(path: Path) -> None:
    path.parent.mkdir(parents=True, exist_ok=True)
    conn = sqlite3.connect(str(path))
    try:
        conn.execute(
            """
            CREATE TABLE IF NOT EXISTS knowledge_items (
                id INTEGER PRIMARY KEY AUTOINCREMENT,
                key TEXT NOT NULL,
                topic_category TEXT NULL,
                locale TEXT NOT NULL,
                text TEXT NOT NULL,
                priority INTEGER NOT NULL DEFAULT 100,
                created_at TEXT NOT NULL DEFAULT (datetime('now')),
                is_active INTEGER NOT NULL DEFAULT 1,
                meta_json TEXT NULL
            );
            """
        )
        conn.commit()
    finally:
        conn.close()


def _seed_kb_min_for_groups(path: Path) -> None:
    conn = sqlite3.connect(str(path))
    try:
        rows = [
            # generics (so pipeline always has fallback text)
            ("natal.generic", "", "ru-RU", "GLOBAL GENERIC", 10, 1),
            ("natal.love_intimacy.generic", "love_intimacy", "ru-RU", "TOPIC GENERIC love_intimacy", 20, 1),
            # planet-groups present (GLOBAL)
            ("natal.planets.group.luminaries.present", "", "ru-RU", "luminaries present", 110, 1),
            ("natal.planets.group.inner.present", "", "ru-RU", "inner present", 110, 1),
            ("natal.planets.group.social.present", "", "ru-RU", "social present", 110, 1),
            ("natal.planets.group.outer.present", "", "ru-RU", "outer present", 110, 1),
        ]
        conn.executemany(
            """
            INSERT INTO knowledge_items (key, topic_category, locale, text, priority, is_active)
            VALUES (?, ?, ?, ?, ?, ?)
            """,
            rows,
        )
        conn.commit()
    finally:
        conn.close()


def _stub_natal_data() -> dict:
    # enough structure for key_builder (planets/angles/houses/aspects tolerated)
    return {
        "subject": {"unknown_time": False},
        "planets": {
            "sun": {"sign": "capricorn", "house": 1},
            "moon": {"sign": "pisces", "house": 3},
            "mercury": {"sign": "aries", "house": 2},
            "venus": {"sign": "taurus", "house": 4},
            "mars": {"sign": "gemini", "house": 5},
            "jupiter": {"sign": "cancer", "house": 7},
            "saturn": {"sign": "leo", "house": 8},
            "uranus": {"sign": "virgo", "house": 9},
            "neptune": {"sign": "libra", "house": 10},
            "pluto": {"sign": "scorpio", "house": 11},
        },
        "angles": {
            "asc": {"sign": "capricorn"},
            "mc": {"sign": "aries"},
            "dsc": {"sign": "cancer"},
            "ic": {"sign": "libra"},
        },
        "houses": {str(i): {"sign": s} for i, s in enumerate(
            ["capricorn", "aquarius", "pisces", "aries", "taurus", "gemini",
             "cancer", "leo", "virgo", "libra", "scorpio", "sagittarius"], start=1
        )},
        # aspects can be empty; fallback aspect algo exists in project
        "aspects": [],
    }


@pytest.mark.parametrize("topic", ["love_intimacy"])
def test_e2e_debug2_hits_include_planet_groups_present(tmp_path: Path, monkeypatch, topic: str) -> None:
    import app.routers.public_v2 as public_v2

    kb_path = tmp_path / "kb_groups.db"
    _create_kb_db(kb_path)
    _seed_kb_min_for_groups(kb_path)

    engine = create_async_engine(f"sqlite+aiosqlite:///{kb_path}", future=True)
    SessionLocal = async_sessionmaker(engine, class_=AsyncSession, expire_on_commit=False)

    async def override_get_knowledge_session() -> AsyncIterator[AsyncSession]:
        async with SessionLocal() as s:
            yield s

    async def fake_resolve_place(query: str, locale: str, session):
        class P:
            ok = True
            display_name = "Almaty"
            lat = 43.238949
            lon = 76.889709
            country_code = "kz"
            tz_str = "Asia/Almaty"
            source = "test_stub"
            error = None

            def require_ready(self): ...
        return P()

    async def fake_build_natal(*, user_name: str, birth, place):
        return _stub_natal_data()

    monkeypatch.setattr(public_v2, "resolve_place", fake_resolve_place)
    monkeypatch.setattr(public_v2._chart_service, "build_natal", fake_build_natal)

    app.dependency_overrides[get_knowledge_session] = override_get_knowledge_session
    try:
        client = TestClient(app)
        payload = {
            "name": "E2E groups",
            "birth": {
                "date": "1990-01-01",
                "time": "12:30:00",
                "place_query": "Almaty",
                "gender": "m",
                "unknown_time": False,
            },
            "topic_categories": [topic],
        }

        r = client.post(
            "/v2/interpret",
            params={"locale": "ru", "debug": 2},
            content=json.dumps(payload).encode("utf-8"),
            headers={"content-type": "application/json"},
        )
        assert r.status_code == 200, r.text
        data = r.json()

        hits = (((data.get("meta") or {}).get("debug") or {}).get("topics") or {}).get(topic, {}).get("hits_sample") or []
        keys = [h.get("key") for h in hits if isinstance(h, dict)]

        assert any(isinstance(k, str) and k.startswith("natal.planets.group.") and k.endswith(".present") for k in keys), (
            f"Expected natal.planets.group.*.present in hits_sample, got keys={keys}"
        )
    finally:
        app.dependency_overrides.pop(get_knowledge_session, None)