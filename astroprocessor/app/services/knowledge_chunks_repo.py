# app/services/knowledge_chunks_repo.py
from __future__ import annotations

from dataclasses import dataclass
from typing import Any, Optional

from sqlalchemy import text
from sqlalchemy.ext.asyncio import AsyncSession


@dataclass(frozen=True)
class ChunkHit:
    chunk_id: int
    doc_id: int
    source_path: str
    title: Optional[str]
    author: Optional[str]
    topic_domain: str
    tags_json: str
    created_at: Optional[str]
    text: str
    score: float


class KnowledgeChunksRepo:
    async def search(
        self,
        session: AsyncSession,
        *,
        query_text: str,
        lang: str,
        domain: Optional[str] = None,
        limit: int = 5,
    ) -> list[ChunkHit]:
        # BM25: меньше = лучше. Мы инвертируем в score для удобства.
        sql = text(
            """
            SELECT
                kc.id,
                kc.doc_id,
                kd.source_path,
                kd.title,
                kd.author,
                kc.topic_domain,
                kc.tags_json,
                kc.created_at,
                kc.text,
                bm25(kf) as bm
            FROM knowledge_chunks_fts kf
            JOIN knowledge_chunks kc ON kc.id = kf.rowid
            JOIN knowledge_docs kd ON kd.id = kc.doc_id
            WHERE
                kd.lang = :lang
                AND kf MATCH :q
                AND (:domain IS NULL OR kc.topic_domain = :domain)
            ORDER BY bm ASC, kc.id DESC
            LIMIT :limit
            """
        )

        params: dict[str, Any] = {
            "lang": lang,
            "q": query_text,
            "domain": domain,
            "limit": limit,
        }

        res = await session.execute(sql, params)
        rows = res.fetchall()
        hits: list[ChunkHit] = []
        for r in rows:
            bm = float(r[9]) if r[9] is not None else 0.0
            score = 1.0 / (1.0 + max(bm, 0.0))
            hits.append(
                ChunkHit(
                    chunk_id=int(r[0]),
                    doc_id=int(r[1]),
                    source_path=str(r[2]),
                    title=str(r[3]) if r[3] is not None else None,
                    author=str(r[4]) if r[4] is not None else None,
                    topic_domain=str(r[5]),
                    tags_json=str(r[6]),
                    created_at=str(r[7]) if r[7] is not None else None,
                    text=str(r[8]),
                    score=score,
                )
            )
        return hits
