# astroprocessor/tests/test_seed_topic_generic_all_topics.py
from __future__ import annotations

from pathlib import Path

import pytest
from sqlalchemy import text

from app.services.knowledge_repo import KnowledgeRepo

TOPICS = [
    "personality_core",
    "psychology",
    "talents",
    "strengths_weaknesses",
    "purpose_path",
    "career",
    "money",
    "love_intimacy",
    "partnership_marriage",
    "karmic_tasks",
    "past_lives_symbolic",
    "emotional_world",
    "how_others_see_me",
    "self_esteem",
    "creativity",
    "ancestral_topics",
]


def _read_seed_sql() -> str:
    root = Path(__file__).resolve().parents[1]
    p = root / "tools" / "seed" / "seed_topic_generic_all_topics.sql"
    return p.read_text(encoding="utf-8")


async def _exec_sql_script(conn, script: str) -> None:
    cleaned: list[str] = []
    for line in script.splitlines():
        s = line.strip()
        if not s or s.startswith("--"):
            continue
        cleaned.append(line)
    buf = "\n".join(cleaned)

    # run statement-by-statement (SQLite)
    stmts = [s.strip() for s in buf.split(";") if s.strip()]
    for stmt in stmts:
        await conn.execute(text(stmt))


@pytest.mark.asyncio
async def test_seed_inserts_topic_generics_and_global_generics(test_engine):
    sql = _read_seed_sql()

    async with test_engine.begin() as conn:
        await _exec_sql_script(conn, sql)

        for topic in TOPICS:
            r = await conn.execute(
                text(
                    """
                    SELECT key, priority, is_active, meta_json
                    FROM knowledge_items
                    WHERE topic_category = :tc AND locale='ru-RU' AND key = :k
                    """
                ),
                {"tc": topic, "k": f"natal.{topic}.generic"},
            )
            row = r.first()
            assert row is not None
            assert int(row.is_active) == 1
            assert int(row.priority) >= 80
            assert row.meta_json is not None

            r2 = await conn.execute(
                text(
                    """
                    SELECT key, priority, is_active, meta_json
                    FROM knowledge_items
                    WHERE topic_category = :tc AND locale='ru-RU' AND key = 'natal.generic'
                    """
                ),
                {"tc": topic},
            )
            row2 = r2.first()
            assert row2 is not None
            assert int(row2.is_active) == 1
            assert int(row2.priority) == 50
            assert row2.meta_json is not None


@pytest.mark.asyncio
async def test_repo_prefers_topic_generic_over_global_generic(test_sessionmaker):
    repo = KnowledgeRepo()

    async with test_sessionmaker() as session:
        await session.execute(
            text(
                """
                DELETE FROM knowledge_items
                WHERE topic_category='career' AND locale='ru-RU'
                  AND key IN ('natal.career.generic','natal.generic')
                """
            )
        )
        await session.execute(
            text(
                """
                INSERT INTO knowledge_items (key, topic_category, locale, text, priority, is_active, created_at, meta_json)
                VALUES
                ('natal.generic','career','ru-RU','global',50,1,CAST(strftime('%s','now') AS TEXT),'{}'),
                ('natal.career.generic','career','ru-RU','topic',80,1,CAST(strftime('%s','now') AS TEXT),'{}')
                """
            )
        )
        await session.commit()

        hit = await repo.pick_first_match(
            session,
            candidate_keys=["natal.career.generic", "natal.generic"],
            topic_category="career",
            locale="ru-RU",
        )
        assert hit is not None
        assert hit.key == "natal.career.generic"
        assert hit.text == "topic"


@pytest.mark.asyncio
async def test_seed_lowers_overpowered_global_generic_priority(test_engine):
    sql = _read_seed_sql()

    async with test_engine.begin() as conn:
        await conn.execute(
            text(
                """
                DELETE FROM knowledge_items
                WHERE topic_category='money' AND locale='ru-RU' AND key='natal.generic'
                """
            )
        )
        await conn.execute(
            text(
                """
                INSERT INTO knowledge_items (key, topic_category, locale, text, priority, is_active, created_at, meta_json)
                VALUES ('natal.generic','money','ru-RU','bad',200,1,CAST(strftime('%s','now') AS TEXT),'{}')
                """
            )
        )

        await _exec_sql_script(conn, sql)

        r = await conn.execute(
            text(
                """
                SELECT priority FROM knowledge_items
                WHERE topic_category='money' AND locale='ru-RU' AND key='natal.generic'
                ORDER BY id DESC LIMIT 1
                """
            )
        )
        row = r.first()
        assert row is not None
        assert int(row.priority) == 50
