from __future__ import annotations

import json
import uuid
from typing import Any, Optional

from sqlalchemy import text
from sqlalchemy.ext.asyncio import AsyncSession


def _json_dumps(v: Any) -> str:
    if v is None:
        return "{}"
    if isinstance(v, str):
        return v
    return json.dumps(v, ensure_ascii=False, sort_keys=True)


def _json_loads(v: Any) -> dict[str, Any]:
    if not v:
        return {}
    if isinstance(v, dict):
        return v
    try:
        return json.loads(v)
    except Exception:
        return {}


class ChatRepo:
    async def ensure_user(self, s: AsyncSession, *, user_id: str) -> None:
        # user_profile_json is NOT NULL in current chat.db schema -> default "{}"
        await s.execute(
            text(
                """
                INSERT INTO users (user_id, user_profile_json, created_at, updated_at)
                VALUES (:user_id, :profile, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP)
                ON CONFLICT(user_id) DO NOTHING
                """
            ),
            {"user_id": user_id, "profile": "{}"},
        )
        await s.commit()

    async def get_user_profile(self, s: AsyncSession, *, user_id: str) -> Optional[str]:
        row = (
            await s.execute(
                text("SELECT user_profile_json FROM users WHERE user_id = :uid"),
                {"uid": user_id},
            )
        ).first()
        return row[0] if row else None

    async def set_user_profile(self, s: AsyncSession, *, user_id: str, user_profile_json: Any) -> None:
        await s.execute(
            text(
                """
                INSERT INTO users (user_id, user_profile_json, created_at, updated_at)
                VALUES (:uid, :p, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP)
                ON CONFLICT(user_id) DO UPDATE SET
                  user_profile_json = excluded.user_profile_json,
                  updated_at = CURRENT_TIMESTAMP
                """
            ),
            {"uid": user_id, "p": _json_dumps(user_profile_json)},
        )
        await s.commit()

    async def create_chat(
        self,
        s: AsyncSession,
        *,
        user_id: str,
        active_topic: str,
        natal_context_json: Any,
    ) -> str:
        chat_id = str(uuid.uuid4())
        await s.execute(
            text(
                """
                INSERT INTO chats (chat_id, user_id, active_topic, natal_context_json, created_at, updated_at)
                VALUES (:chat_id, :user_id, :active_topic, :natal_context_json, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP)
                """
            ),
            {
                "chat_id": chat_id,
                "user_id": user_id,
                "active_topic": active_topic,
                "natal_context_json": _json_dumps(natal_context_json),
            },
        )
        await s.commit()
        return chat_id

    async def get_chat(self, s: AsyncSession, *, chat_id: str) -> Optional[dict[str, Any]]:
        row = (
            await s.execute(
                text(
                    """
                    SELECT chat_id, user_id, active_topic, natal_context_json
                    FROM chats
                    WHERE chat_id = :cid
                    """
                ),
                {"cid": chat_id},
            )
        ).first()
        if not row:
            return None

        return {
            "chat_id": row[0],
            "user_id": row[1],
            "active_topic": row[2],
            "natal_context_json": _json_loads(row[3]),
        }

    async def add_message(self, s: AsyncSession, *, chat_id: str, role: str, content: str) -> None:
        await s.execute(
            text(
                """
                INSERT INTO chat_messages (chat_id, role, content, created_at)
                VALUES (:chat_id, :role, :content, CURRENT_TIMESTAMP)
                """
            ),
            {"chat_id": chat_id, "role": role, "content": content},
        )
        await s.commit()