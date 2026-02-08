from __future__ import annotations

from sqlalchemy.ext.asyncio import create_async_engine, async_sessionmaker, AsyncSession
from .settings import settings
from sqlalchemy.orm import DeclarativeBase

from .settings import settings
from pathlib import Path
from sqlalchemy.ext.asyncio import (
    AsyncSession,
    async_sessionmaker,
    create_async_engine,
)
def _make_db_url(path: str) -> str:
    # SQLite async URL
    # path может быть относительным, SQLite это допускает
    return f"sqlite+aiosqlite:///{path}"


engine = create_async_engine(_make_db_url(settings.astro_db_path), echo=False)

AsyncSessionLocal = async_sessionmaker(engine, expire_on_commit=False, class_=AsyncSession)


class Base(DeclarativeBase):
    pass


async def init_db() -> None:
    # Импортируем модели, чтобы SQLAlchemy увидел таблицы
    from . import models  # noqa: F401

    async with engine.begin() as conn:
        await conn.run_sync(Base.metadata.create_all)


async def get_session() -> AsyncSession:
    async with AsyncSessionLocal() as session:
        yield session

# -------------------------
# Пути
# -------------------------

BASE_DIR = Path(__file__).resolve().parent.parent
DATA_DIR = BASE_DIR / "data"
DATA_DIR.mkdir(exist_ok=True)

KNOWLEDGE_DB_PATH = DATA_DIR / "knowledge.db"
KNOWLEDGE_DB_URL = f"sqlite+aiosqlite:///{KNOWLEDGE_DB_PATH.as_posix()}"

# -------------------------
# Engine + session
# -------------------------

knowledge_engine = create_async_engine(
    KNOWLEDGE_DB_URL,
    echo=False,
    future=True,
)

KnowledgeSessionLocal = async_sessionmaker(
    bind=knowledge_engine,
    class_=AsyncSession,
    expire_on_commit=False,
)

async def get_knowledge_session() -> AsyncSession:
    async with KnowledgeSessionLocal() as session:
        yield session
