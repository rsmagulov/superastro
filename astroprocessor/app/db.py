# app/db.py
from __future__ import annotations

from pathlib import Path
from typing import AsyncIterator

from sqlalchemy import text
from sqlalchemy.ext.asyncio import AsyncSession, async_sessionmaker, create_async_engine
from sqlalchemy.orm import DeclarativeBase

from .settings import settings


def _make_sqlite_url(path: str) -> str:
    return f"sqlite+aiosqlite:///{path}"


def _ensure_parent_dir(path_str: str) -> None:
    p = Path(path_str)
    # Если путь относительный — создаём директорию относительно cwd проекта
    parent = p.parent
    if str(parent) and not parent.exists():
        parent.mkdir(parents=True, exist_ok=True)


# -------------------------
# Astro DB (основная БД: геокэш, etc.)
# -------------------------

_ensure_parent_dir(settings.astro_db_path)
astro_engine = create_async_engine(_make_sqlite_url(settings.astro_db_path), echo=False, future=True)
AstroSessionLocal = async_sessionmaker(astro_engine, class_=AsyncSession, expire_on_commit=False)


class Base(DeclarativeBase):
    pass


# -------------------------
# Knowledge DB (БЗ: knowledge.db)
# -------------------------

_ensure_parent_dir(settings.knowledge_db_path)
knowledge_engine = create_async_engine(_make_sqlite_url(settings.knowledge_db_path), echo=False, future=True)
KnowledgeSessionLocal = async_sessionmaker(knowledge_engine, class_=AsyncSession, expire_on_commit=False)


async def _ensure_sources_table_on_engine() -> None:
    # Делаем DDL через engine.begin(), чтобы не ломать транзакции сессии
    async with knowledge_engine.begin() as conn:
        await conn.execute(text("""
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
        """))
        await conn.execute(text("""
            CREATE INDEX IF NOT EXISTS ix_sources_is_enabled ON sources(is_enabled)
        """))
        await conn.execute(text("""
            CREATE INDEX IF NOT EXISTS ix_sources_priority ON sources(priority)
        """))


async def init_db() -> None:
    # Импортируем модели, чтобы Base.metadata увидела таблицы astro-db
    from . import models  # noqa: F401

    async with astro_engine.begin() as conn:
        await conn.run_sync(Base.metadata.create_all)

    # Knowledge DB: гарантируем системные таблицы для админки
    await _ensure_sources_table_on_engine()


async def get_session() -> AsyncIterator[AsyncSession]:
    async with AstroSessionLocal() as session:
        yield session


async def get_knowledge_session() -> AsyncIterator[AsyncSession]:
    # На старте приложения init_db() это уже сделает,
    # но оставляем страховку: DDL идемпотентный
    await _ensure_sources_table_on_engine()
    async with KnowledgeSessionLocal() as session:
        yield session
