from __future__ import annotations

import json
import uuid
from dataclasses import dataclass
from typing import Any, Optional

from sqlalchemy import text
from sqlalchemy.ext.asyncio import AsyncSession


@dataclass(frozen=True)
class ChatRow:
    chat_id: str
    user_id: Optional[str]
    active_topic: Optional[str]
    natal_context_json: str


class ChatRepo:
    async def ensure_user(self, session: AsyncSession, *, user_id: str) -> None:
        await session.execute(
            text(
                """
                INSERT OR IGNORE INTO users(user_id, user_profile_json)
                VALUES (:user_id, '{}')
                """
            ),
            {"user_id": user_id},
        )
        await session.commit()

    async def get_user_profile(self, session: AsyncSession, *, user_id: str) -> dict[str, Any]:
        res = await session.execute(
            text("SELECT user_profile_json FROM users WHERE user_id=:user_id"),
            {"user_id": user_id},
        )
        row = res.first()
        if not row or not row[0]:
            return {}
        try:
            return json.loads(row[0])
        except Exception:
            return {}

    async def set_user_profile(self, session: AsyncSession, *, user_id: str, profile: dict[str, Any]) -> None:
        await self.ensure_user(session, user_id=user_id)
        await session.execute(
            text(
                """
                UPDATE users
                SET user_profile_json=:j, updated_at=datetime('now')
                WHERE user_id=:user_id
                """
            ),
            {"user_id": user_id, "j": json.dumps(profile, ensure_ascii=False)},
        )
        await session.commit()

    async def create_chat(
        self,
        session: AsyncSession,
        *,
        natal_context_json: str,
        user_id: Optional[str] = None,
        active_topic: Optional[str] = None,
    ) -> str:
        chat_id = str(uuid.uuid4())
        await session.execute(
            text(
                """
                INSERT INTO chats(chat_id, user_id, active_topic, natal_context_json)
                VALUES (:chat_id, :user_id, :active_topic, :natal_context_json)
                """
            ),
            {
                "chat_id": chat_id,
                "user_id": user_id,
                "active_topic": active_topic,
                "natal_context_json": natal_context_json,
            },
        )
        await session.commit()
        return chat_id

    async def get_chat(self, session: AsyncSession, *, chat_id: str) -> ChatRow | None:
        res = await session.execute(
            text(
                """
                SELECT chat_id, user_id, active_topic, natal_context_json
                FROM chats
                WHERE chat_id=:chat_id
                """
            ),
            {"chat_id": chat_id},
        )
        row = res.first()
        if not row:
            return None
        return ChatRow(
            chat_id=str(row[0]),
            user_id=(str(row[1]) if row[1] is not None else None),
            active_topic=(str(row[2]) if row[2] is not None else None),
            natal_context_json=str(row[3] or "{}"),
        )

    async def set_chat_topic(self, session: AsyncSession, *, chat_id: str, topic: Optional[str]) -> None:
        await session.execute(
            text("UPDATE chats SET active_topic=:t, updated_at=datetime('now') WHERE chat_id=:chat_id"),
            {"chat_id": chat_id, "t": topic},
        )
        await session.commit()

    async def add_message(self, session: AsyncSession, *, chat_id: str, role: str, content: str) -> None:
        await session.execute(
            text(
                """
                INSERT INTO chat_messages(chat_id, role, content)
                VALUES (:chat_id, :role, :content)
                """
            ),
            {"chat_id": chat_id, "role": role, "content": content},
        )
        await session.commit()

    async def get_messages(self, session: AsyncSession, *, chat_id: str, limit: int = 24) -> list[dict[str, str]]:
        res = await session.execute(
            text(
                """
                SELECT role, content
                FROM chat_messages
                WHERE chat_id=:chat_id
                ORDER BY id ASC
                """
            ),
            {"chat_id": chat_id},
        )
        rows = [{"role": str(r[0]), "content": str(r[1])} for r in res.fetchall()]
        if limit > 0 and len(rows) > limit:
            return rows[-limit:]
        return rows