# app/db.py
from __future__ import annotations

from pathlib import Path
from typing import AsyncIterator

from sqlalchemy import text
from sqlalchemy.ext.asyncio import AsyncSession, async_sessionmaker, create_async_engine
from sqlalchemy.orm import DeclarativeBase

from .settings import settings

ASTROPROCESSOR_ROOT = Path(__file__).resolve().parents[1]  # .../astroprocessor


def _resolve_db_path(path_str: str) -> str:
    p = Path(path_str)
    if p.is_absolute():
        return str(p)
    return str((ASTROPROCESSOR_ROOT / p).resolve())


def _make_sqlite_url(abs_path: str) -> str:
    # abs_path must be absolute to avoid CWD surprises in pytest.
    return f"sqlite+aiosqlite:///{abs_path}"


def _ensure_parent_dir(abs_path: str) -> None:
    p = Path(abs_path)
    parent = p.parent
    if not parent.exists():
        parent.mkdir(parents=True, exist_ok=True)


# -------------------------
# Resolved paths (DO NOT depend on CWD)
# -------------------------
_ASTRO_DB_PATH = _resolve_db_path(settings.astro_db_path)
_KNOWLEDGE_DB_PATH = _resolve_db_path(settings.knowledge_db_path)
_STAGING_DB_PATH = _resolve_db_path(settings.staging_db_path)


_ensure_parent_dir(_ASTRO_DB_PATH)
_ensure_parent_dir(_KNOWLEDGE_DB_PATH)
_ensure_parent_dir(_STAGING_DB_PATH)

ASTRO_DB_PATH = _ASTRO_DB_PATH
KNOWLEDGE_DB_PATH = _KNOWLEDGE_DB_PATH
STAGING_DB_PATH = _STAGING_DB_PATH

# -------------------------
# Astro DB (основная БД: геокэш, etc.)
# -------------------------
astro_engine = create_async_engine(_make_sqlite_url(_ASTRO_DB_PATH), echo=False, future=True)
AstroSessionLocal = async_sessionmaker(astro_engine, class_=AsyncSession, expire_on_commit=False)


class Base(DeclarativeBase):
    pass


# -------------------------
# Knowledge DB (БЗ: knowledge.db)
# -------------------------
knowledge_engine = create_async_engine(_make_sqlite_url(_KNOWLEDGE_DB_PATH), echo=False, future=True)
KnowledgeSessionLocal = async_sessionmaker(knowledge_engine, class_=AsyncSession, expire_on_commit=False)

# -------------------------
# Staging DB (Knowledge Builder staging.db)
# -------------------------
staging_engine = create_async_engine(_make_sqlite_url(_STAGING_DB_PATH), echo=False, future=True)
StagingSessionLocal = async_sessionmaker(staging_engine, class_=AsyncSession, expire_on_commit=False)


async def get_staging_session() -> AsyncIterator[AsyncSession]:
    # staging schema создаётся/мигрируется CLI; здесь просто даём сессию
    async with StagingSessionLocal() as session:
        yield session

async def _ensure_sources_table_on_engine() -> None:
    async with knowledge_engine.begin() as conn:
        await conn.execute(
            text(
                """
                CREATE TABLE IF NOT EXISTS sources (
                    id INTEGER PRIMARY KEY AUTOINCREMENT,
                    title TEXT NOT NULL,
                    author TEXT,
                    school TEXT,
                    source_type TEXT NOT NULL,
                    language TEXT NOT NULL,
                    priority INTEGER NOT NULL DEFAULT 100,
                    is_enabled INTEGER NOT NULL DEFAULT 1,
                    created_at TEXT DEFAULT (datetime('now')),
                    updated_at TEXT DEFAULT (datetime('now'))
                )
                """
            )
        )
        await conn.execute(text("CREATE INDEX IF NOT EXISTS ix_sources_is_enabled ON sources(is_enabled)"))
        await conn.execute(text("CREATE INDEX IF NOT EXISTS ix_sources_priority ON sources(priority)"))


async def _ensure_knowledge_items_table_on_engine() -> None:
    """
    Runtime/tests expect knowledge_items:
      SELECT ... FROM knowledge_items WHERE locale=? AND is_active=1 ...
    """
    async with knowledge_engine.begin() as conn:
        await conn.execute(
            text(
                """
                CREATE TABLE IF NOT EXISTS knowledge_items (
                    id INTEGER PRIMARY KEY AUTOINCREMENT,
                    key TEXT NOT NULL,
                    topic_category TEXT NOT NULL DEFAULT '',
                    locale TEXT NOT NULL DEFAULT 'ru-RU',
                    priority INTEGER NOT NULL DEFAULT 100,
                    created_at TEXT DEFAULT (datetime('now')),
                    is_active INTEGER NOT NULL DEFAULT 1,
                    text TEXT NOT NULL,
                    meta_json TEXT NOT NULL DEFAULT '{}',
                    updated_at TEXT DEFAULT (datetime('now'))
                )
                """
            )
        )
        await conn.execute(
            text(
                "CREATE INDEX IF NOT EXISTS ix_knowledge_items_active "
                "ON knowledge_items(locale, topic_category, key, is_active)"
            )
        )
        await conn.execute(
            text(
                "CREATE INDEX IF NOT EXISTS ix_knowledge_items_priority "
                "ON knowledge_items(topic_category, key, priority)"
            )
        )


async def _ensure_kb_meta_table_on_engine() -> None:
    async with knowledge_engine.begin() as conn:
        await conn.execute(
            text(
                """
                CREATE TABLE IF NOT EXISTS kb_meta (
                    key TEXT PRIMARY KEY,
                    value TEXT NOT NULL
                )
                """
            )
        )


async def _ensure_knowledge_system_tables() -> None:
    # Keep it idempotent; safe to call per-request as a fallback.
    await _ensure_sources_table_on_engine()
    await _ensure_knowledge_items_table_on_engine()
    await _ensure_kb_meta_table_on_engine()


async def init_db() -> None:
    # Импортируем модели, чтобы Base.metadata увидела таблицы astro-db
    from . import models  # noqa: F401

    async with astro_engine.begin() as conn:
        await conn.run_sync(Base.metadata.create_all)

    # Knowledge DB: гарантируем системные таблицы для рантайма/админки/тестов
    await _ensure_knowledge_system_tables()


async def get_session() -> AsyncIterator[AsyncSession]:
    async with AstroSessionLocal() as session:
        yield session


async def get_knowledge_session() -> AsyncIterator[AsyncSession]:
    # Страховка: DDL идемпотентный. Убирает flaky при pytest/разных CWD.
    await _ensure_knowledge_system_tables()
    async with KnowledgeSessionLocal() as session:
        yield session
