from __future__ import annotations

import asyncio
import sqlite3
from dataclasses import dataclass
from pathlib import Path
from typing import Any

import pytest
from sqlalchemy.ext.asyncio import AsyncSession, create_async_engine
from sqlalchemy import text as sql_text

from app.services.knowledge_repo import KnowledgeRepo


@pytest.mark.asyncio
async def test_repo_does_not_pick_empty_text(tmp_path: Path):
    db = tmp_path / "k.db"
    con = sqlite3.connect(db)
    cur = con.cursor()

    cur.execute(
        """
        CREATE TABLE knowledge_items (
          id INTEGER PRIMARY KEY AUTOINCREMENT,
          topic_category TEXT NOT NULL,
          locale TEXT NOT NULL,
          key TEXT NOT NULL,
          priority INTEGER NOT NULL DEFAULT 0,
          text TEXT,
          is_active INTEGER NOT NULL DEFAULT 1,
          created_at INTEGER NOT NULL DEFAULT 0
        );
        """
    )

    # same key, higher priority but empty text -> must be ignored
    cur.execute(
        """
        INSERT INTO knowledge_items(topic_category, locale, key, priority, text, is_active, created_at)
        VALUES ('personality_core','ru-RU','natal.generic', 200, '', 1, 1)
        """
    )
    cur.execute(
        """
        INSERT INTO knowledge_items(topic_category, locale, key, priority, text, is_active, created_at)
        VALUES ('personality_core','ru-RU','natal.generic', 50, 'NONEMPTY', 1, 2)
        """
    )
    con.commit()
    con.close()

    engine = create_async_engine(f"sqlite+aiosqlite:///{db}")
    repo = KnowledgeRepo()

    async with engine.begin() as conn:
        await conn.execute(sql_text("PRAGMA foreign_keys=ON;"))

    async with AsyncSession(engine) as session:
        hits = await repo.pick_first_matches_for_blocks_multi_topic(
            session,
            blocks=[("generic", ["natal.generic"])],
            topic_categories=["personality_core"],
            locale="ru",
        )

    hit = hits["personality_core"]["generic"]
    assert hit.key == "natal.generic"
    assert hit.text == "NONEMPTY"
