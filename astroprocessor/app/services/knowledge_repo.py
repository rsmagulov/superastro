# ============================================================
# File: astroprocessor/app/services/knowledge_repo.py  (REPLACE)
# ============================================================
from __future__ import annotations

from dataclasses import dataclass
from typing import Mapping, Sequence

from sqlalchemy import bindparam, text
from sqlalchemy.ext.asyncio import AsyncSession


@dataclass(frozen=True)
class KnowledgeHit:
    id: int
    key: str
    priority: int
    created_at: str | None
    is_active: bool
    text: str
    topic_category: str


class KnowledgeRepo:
    """
    Read-only knowledge access layer.

    Batch strategies:
    - single topic + many blocks (1 query per topic)
    - many topics + many blocks (1 query per request)  <-- NEW
    """

    async def pick_first_match(
        self,
        session: AsyncSession,
        *,
        candidate_keys: Sequence[str],
        topic_category: str,
        locale: str,
    ) -> KnowledgeHit | None:
        hits = await self.pick_first_matches_for_blocks(
            session,
            blocks=[("single", candidate_keys)],
            topic_category=topic_category,
            locale=locale,
        )
        return hits.get("single")

    async def pick_first_matches_for_blocks(
        self,
        session: AsyncSession,
        *,
        blocks: Sequence[tuple[str, Sequence[str]]],
        topic_category: str,
        locale: str,
    ) -> dict[str, KnowledgeHit | None]:
        """
        1 query per topic.
        Returns mapping: block_id -> hit
        """
        out = await self.pick_first_matches_for_blocks_multi_topic(
            session,
            blocks=blocks,
            topic_categories=[topic_category],
            locale=locale,
        )
        return out.get(topic_category, {block_id: None for block_id, _ in blocks})

    async def pick_first_matches_for_blocks_multi_topic(
        self,
        session: AsyncSession,
        *,
        blocks: Sequence[tuple[str, Sequence[str]]],
        topic_categories: Sequence[str],
        locale: str,
    ) -> dict[str, dict[str, KnowledgeHit | None]]:
        """
        1 query for all topics + all keys.

        Returns:
            {
              "<topic_category>": {"<block_id>": KnowledgeHit|None, ...},
              ...
            }
        """
        # Normalize topics
        topics: list[str] = []
        seen_topics: set[str] = set()
        for t in topic_categories:
            if not t or t in seen_topics:
                continue
            seen_topics.add(t)
            topics.append(str(t))

        # Normalize keys
        all_keys: list[str] = []
        seen_keys: set[str] = set()
        for _, keys in blocks:
            for k in keys:
                if not k or k in seen_keys:
                    continue
                seen_keys.add(k)
                all_keys.append(str(k))

        # Fast paths
        if not topics:
            return {}
        if not all_keys:
            return {t: {block_id: None for block_id, _ in blocks} for t in topics}

        stmt = text(
            """
            SELECT
                id,
                key,
                topic_category,
                priority,
                created_at,
                is_active,
                text
            FROM knowledge_items
            WHERE
                (locale = :locale OR locale LIKE :locale || '-%')
                AND is_active = 1
                AND topic_category IN :topics
                AND key IN :keys

            ORDER BY topic_category ASC, key ASC, priority DESC, id DESC
            """
        ).bindparams(
            bindparam("topics", expanding=True),
            bindparam("keys", expanding=True),
        )

        res = await session.execute(
            stmt,
            {"locale": locale, "topics": topics, "keys": all_keys},
        )
        rows = res.fetchall()

        # Best hit per (topic, key). Because ORDER BY has priority/id desc,
        # the first encountered per pair is the best.
        best_by_topic_key: dict[tuple[str, str], KnowledgeHit] = {}
        for r in rows:
            t = str(r.topic_category)
            k = str(r.key)
            pair = (t, k)
            if pair in best_by_topic_key:
                continue
            best_by_topic_key[pair] = KnowledgeHit(
                id=int(r.id),
                key=k,
                topic_category=t,
                priority=int(r.priority) if r.priority is not None else 0,
                created_at=str(r.created_at) if r.created_at is not None else None,
                is_active=bool(r.is_active),
                text=str(r.text or ""),
            )

        # Resolve per topic + block by candidate_keys order
        out: dict[str, dict[str, KnowledgeHit | None]] = {
            t: {block_id: None for block_id, _ in blocks} for t in topics
        }

        for t in topics:
            per_block = out[t]
            for block_id, candidate_keys in blocks:
                hit = None
                for k in candidate_keys:
                    hit = best_by_topic_key.get((t, str(k)))
                    if hit is not None:
                        break
                per_block[block_id] = hit

        return out