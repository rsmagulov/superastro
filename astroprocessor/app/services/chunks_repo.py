from __future__ import annotations

from dataclasses import dataclass
from typing import Any, Optional

from sqlalchemy import text
from sqlalchemy.ext.asyncio import AsyncSession


@dataclass(frozen=True)
class ChunkHit:
    chunk_id: int
    doc_id: int
    chunk_index: int
    topic_domain: str
    text: str
    score: float
    source_path: str
    title: Optional[str]
    author: Optional[str]
    lang: str
    created_at: Optional[str]


class ChunksRepo:
    async def search_fts(
        self,
        session: AsyncSession,
        *,
        query: str,
        lang: str = "ru-RU",
        topic_domain: Optional[str] = None,
        limit: int = 20,
    ) -> list[ChunkHit]:
        """
        SQLite FTS5:
        - knowledge_chunks_fts(rowid, text)
        - knowledge_chunks(id, doc_id, chunk_index, topic_domain, text, created_at, ...)
        - knowledge_docs(id, source_path, title, author, lang, ...)
        """
        query = (query or "").strip()
        if not query:
            return []

        # bm25() меньше = лучше (в FTS5 так принято)
        domain_clause = ""
        params: dict[str, Any] = {"q": query, "lang": lang, "lim": int(limit)}

        if topic_domain:
            domain_clause = "AND kc.topic_domain = :domain"
            params["domain"] = topic_domain

        sql = text(f"""
            SELECT
                kc.id            AS chunk_id,
                kc.doc_id        AS doc_id,
                kc.chunk_index   AS chunk_index,
                kc.topic_domain  AS topic_domain,
                kc.text          AS text,
                bm25(knowledge_chunks_fts) AS score,
                kd.source_path   AS source_path,
                kd.title         AS title,
                kd.author        AS author,
                kd.lang          AS lang,
                kc.created_at    AS created_at
            FROM knowledge_chunks_fts
            JOIN knowledge_chunks kc ON kc.id = knowledge_chunks_fts.rowid
            JOIN knowledge_docs   kd ON kd.id = kc.doc_id
            WHERE
                knowledge_chunks_fts MATCH :q
                AND kd.lang = :lang
                {domain_clause}
            ORDER BY score ASC, kc.id DESC
            LIMIT :lim
        """)
        res = await session.execute(sql, params)
        rows = res.fetchall()
        out: list[ChunkHit] = []
        for r in rows:
            out.append(
                ChunkHit(
                    chunk_id=int(r.chunk_id),
                    doc_id=int(r.doc_id),
                    chunk_index=int(r.chunk_index),
                    topic_domain=str(r.topic_domain),
                    text=str(r.text),
                    score=float(r.score),
                    source_path=str(r.source_path),
                    title=str(r.title) if r.title is not None else None,
                    author=str(r.author) if r.author is not None else None,
                    lang=str(r.lang),
                    created_at=str(r.created_at) if r.created_at is not None else None,
                )
            )
        return out
