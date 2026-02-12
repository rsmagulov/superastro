from __future__ import annotations

from dataclasses import dataclass
from datetime import datetime
from typing import Optional, Sequence, Union

from sqlalchemy import text
from sqlalchemy.ext.asyncio import AsyncSession


@dataclass(frozen=True)
class KnowledgeHit:
    id: int
    key: str
    text: str
    priority: int
    created_at: Optional[Union[str, datetime]]
    is_active: bool


class KnowledgeRepo:
    async def pick_first_match(
        self,
        session: AsyncSession,
        *,
        candidate_keys: Sequence[str],
        topic_category: Optional[str],
        locale: str,
    ) -> Optional[KnowledgeHit]:
        if not candidate_keys:
            return None

        order_cases = " ".join(
            [f"WHEN :k{i} THEN {i}" for i in range(len(candidate_keys))]
        )
        keys_in = ",".join([f":k{i}" for i in range(len(candidate_keys))])

        params: dict[str, object] = {"locale": locale}
        for i, k in enumerate(candidate_keys):
            params[f"k{i}"] = k

        if topic_category is None:
            topic_where = "topic_category IS NULL"
            topic_rank_order = ""  # важно: нет :topic_category
        else:
            topic_where = "(topic_category = :topic_category OR topic_category IS NULL)"
            params["topic_category"] = topic_category
            topic_rank_order = (
                "CASE WHEN topic_category = :topic_category THEN 0 ELSE 1 END ASC,"
            )

        order_topic = ""
        if topic_category is not None:
            order_topic = (
                "CASE WHEN topic_category = :topic_category THEN 0 ELSE 1 END ASC,"
            )

        sql = text(f"""
            SELECT id, key, text, priority, created_at, is_active
            FROM knowledge_items
            WHERE
                locale = :locale
                AND {topic_where}
                AND is_active = 1
                AND key IN ({keys_in})
            ORDER BY
                CASE key {order_cases} ELSE 999 END ASC,
                {order_topic}
                priority DESC,
                COALESCE(created_at, '') DESC,
                id DESC
            LIMIT 1
        """)

        res = await session.execute(sql, params)
        row = res.first()
        if not row:
            return None

        return KnowledgeHit(
            id=int(row[0]),
            key=str(row[1]),
            text=str(row[2]),
            priority=int(row[3] if row[3] is not None else 0),
            created_at=row[4] if row[4] is not None else None,
            is_active=bool(row[5]),
        )
