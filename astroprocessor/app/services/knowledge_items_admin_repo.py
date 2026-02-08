from __future__ import annotations
import json
from dataclasses import dataclass
from typing import Any, Optional

from fastapi import params
from requests import session
from sqlalchemy import text
from sqlalchemy.ext.asyncio import AsyncSession

def _build_where_and_params(
    *,
    q: Optional[str],
    locale: Optional[str],
    topic_category: Optional[str],
    is_active: Optional[bool],
    ids: Optional[list[int]],
) -> tuple[str, dict[str, Any]]:
    where = ["1=1"]
    params: dict[str, Any] = {}

    if q:
        where.append("(key LIKE :q OR text LIKE :q)")
        params["q"] = f"%{q}%"

    if locale:
        where.append("locale = :locale")
        params["locale"] = locale

    if topic_category is not None:
        if topic_category == "__NULL__":
            where.append("topic_category IS NULL")
        else:
            where.append("topic_category = :topic_category")
            params["topic_category"] = topic_category

    if is_active is not None:
        where.append("is_active = :is_active")
        params["is_active"] = 1 if is_active else 0

    # ids: делаем через json_each(:ids_json), чтобы не городить IN (:a,:b,:c)
    if ids:
        where.append("id IN (SELECT value FROM json_each(:ids_json))")
        params["ids_json"] = json.dumps(ids)

    return " AND ".join(where), params

@dataclass(frozen=True)
class KnowledgeItemRow:
    id: int
    key: str
    topic_category: Optional[str]
    locale: str
    text: str
    priority: int
    created_at: Optional[str]
    is_active: int
    meta_json: str


class KnowledgeItemsAdminRepo:
    async def list_items(
        self,
        session: AsyncSession,
        *,
        q: Optional[str] = None,
        locale: Optional[str] = None,
        topic_category: Optional[str] = None,
        is_active: Optional[bool] = None,
        limit: int = 50,
        offset: int = 0,
    ) -> tuple[list[KnowledgeItemRow], int]:
        where = ["1=1"]
        params: dict[str, Any] = {"limit": limit, "offset": offset}

        if q:
            where.append("(key LIKE :q OR text LIKE :q)")
            params["q"] = f"%{q}%"

        if locale:
            where.append("locale = :locale")
            params["locale"] = locale

        if topic_category is not None:
            if topic_category == "__NULL__":
                where.append("topic_category IS NULL")
            else:
                where.append("topic_category = :topic_category")
                params["topic_category"] = topic_category

        if is_active is not None:
            where.append("is_active = :is_active")
            params["is_active"] = 1 if is_active else 0

        where_sql = " AND ".join(where)

        count_sql = text(f"SELECT COUNT(*) FROM knowledge_items WHERE {where_sql}")
        total = int((await session.execute(count_sql, params)).scalar_one())

        sql = text(f"""
            SELECT id, key, topic_category, locale, text, priority, created_at, is_active, meta_json
            FROM knowledge_items
            WHERE {where_sql}
            ORDER BY COALESCE(created_at,'') DESC, id DESC
            LIMIT :limit OFFSET :offset
        """)

        rows = (await session.execute(sql, params)).fetchall()
        items: list[KnowledgeItemRow] = []
        for r in rows:
            items.append(
                KnowledgeItemRow(
                    id=int(r[0]),
                    key=str(r[1]),
                    topic_category=str(r[2]) if r[2] is not None else None,
                    locale=str(r[3]),
                    text=str(r[4]),
                    priority=int(r[5] if r[5] is not None else 100),
                    created_at=str(r[6]) if r[6] is not None else None,
                    is_active=int(r[7]),
                    meta_json=str(r[8]) if r[8] is not None else "{}",
                )
            )
        return items, total

    async def get_item(self, session: AsyncSession, *, item_id: int) -> Optional[KnowledgeItemRow]:
        sql = text("""
            SELECT id, key, topic_category, locale, text, priority, created_at, is_active, meta_json
            FROM knowledge_items
            WHERE id = :id
            LIMIT 1
        """)
        row = (await session.execute(sql, {"id": item_id})).first()
        if not row:
            return None
        return KnowledgeItemRow(
            id=int(row[0]),
            key=str(row[1]),
            topic_category=str(row[2]) if row[2] is not None else None,
            locale=str(row[3]),
            text=str(row[4]),
            priority=int(row[5] if row[5] is not None else 100),
            created_at=str(row[6]) if row[6] is not None else None,
            is_active=int(row[7]),
            meta_json=str(row[8]) if row[8] is not None else "{}",
        )

    async def create_item(self, session: AsyncSession, *, data: dict[str, Any]) -> int:
        sql = text("""
            INSERT INTO knowledge_items (key, topic_category, locale, text, priority, is_active, meta_json)
            VALUES (:key, :topic_category, :locale, :text, :priority, :is_active, :meta_json)
        """)
        params = {
            "key": data["key"],
            "topic_category": data.get("topic_category"),
            "locale": data["locale"],
            "text": data["text"],
            "priority": int(data.get("priority", 100)),
            "is_active": 1 if data.get("is_active", True) else 0,
            "meta_json": data.get("meta_json") or "{}",
        }
        res = await session.execute(sql, params)
        # SQLite: last_insert_rowid
        item_id = int((await session.execute(text("SELECT last_insert_rowid()"))).scalar_one())
        return item_id

    async def patch_item(self, session: AsyncSession, *, item_id: int, patch: dict[str, Any]) -> bool:
        # динамический UPDATE
        allowed = {"key", "topic_category", "locale", "text", "priority", "is_active", "meta_json"}
        sets = []
        params: dict[str, Any] = {"id": item_id}

        for k, v in patch.items():
            if k not in allowed:
                continue
            if k == "is_active":
                v = 1 if bool(v) else 0
            sets.append(f"{k} = :{k}")
            params[k] = v

        if not sets:
            return True

        sql = text(f"UPDATE knowledge_items SET {', '.join(sets)} WHERE id = :id")
        res = await session.execute(sql, params)
        return res.rowcount > 0

    async def delete_item(self, session: AsyncSession, *, item_id: int) -> bool:
        res = await session.execute(text("DELETE FROM knowledge_items WHERE id = :id"), {"id": item_id})
        return res.rowcount > 0

    async def bulk_fill_default_meta(
        self,
        session: AsyncSession,
        *,
        only_active: bool,
        only_empty_meta: bool,
        meta_json_value: str,
    ) -> int:
        where = []
        params: dict[str, Any] = {"meta": meta_json_value}

        if only_active:
            where.append("is_active = 1")
        if only_empty_meta:
            where.append("(meta_json IS NULL OR meta_json = '' OR meta_json = '{}')")

        where_sql = " AND ".join(where) if where else "1=1"

        sql = text(f"UPDATE knowledge_items SET meta_json = :meta WHERE {where_sql}")
        res = await session.execute(sql, params)
        return int(res.rowcount or 0)
    
    async def find_id_by_unique(
        self,
        session: AsyncSession,
        *,
        key: str,
        locale: str,
        topic_category: Optional[str],
    ) -> Optional[int]:
        sql = text("""
            SELECT id
            FROM knowledge_items
            WHERE key = :key AND locale = :locale
                AND ( (topic_category IS NULL AND :topic_category IS NULL)
                    OR topic_category = :topic_category )
            ORDER BY id DESC
            LIMIT 1
    """)
        row = (await session.execute(sql, {"key": key, "locale": locale, "topic_category": topic_category})).first()
        return int(row[0]) if row else None

    async def bulk_set_tone(
        self,
        session: AsyncSession,
        *,
        q: Optional[str],
        locale: Optional[str],
        topic_category: Optional[str],
        is_active: Optional[bool],
        ids: Optional[list[int]],
        tone: str,
    ) -> int:
        where_sql, params = _build_where_and_params(
            q=q, locale=locale, topic_category=topic_category, is_active=is_active, ids=ids
        )
        params["tone"] = tone

        sql = text(f"""
            UPDATE knowledge_items
            SET meta_json = json_set(
                CASE
                    WHEN meta_json IS NULL OR meta_json = '' THEN '{{}}'
                    ELSE meta_json
                END,
                '$.tone', :tone
            )
            WHERE {where_sql}
        """)

        res = await session.execute(sql, params)
        return int(res.rowcount or 0)
    
    async def bulk_set_abstraction(
        self,
        session: AsyncSession,
        *,
        q: Optional[str],
        locale: Optional[str],
        topic_category: Optional[str],
        is_active: Optional[bool],
        ids: Optional[list[int]],
        abstraction_level: str,
    ) -> int:
        where_sql, params = _build_where_and_params(
            q=q, locale=locale, topic_category=topic_category, is_active=is_active, ids=ids
        )
        params["abstraction_level"] = abstraction_level

        sql = text(f"""
            UPDATE knowledge_items
            SET meta_json = json_set(
                CASE
                    WHEN meta_json IS NULL OR meta_json = '' THEN '{{}}'
                    ELSE meta_json
                END,
                '$.abstraction_level', :abstraction_level
            )
            WHERE {where_sql}
        """)

        res = await session.execute(sql, params)
        return int(res.rowcount or 0)
    
    async def bulk_add_tag(
        self,
        session: AsyncSession,
        *,
        q: Optional[str],
        locale: Optional[str],
        topic_category: Optional[str],
        is_active: Optional[bool],
        ids: Optional[list[int]],
        tag: str,
    ) -> int:
        where_sql, params = _build_where_and_params(
            q=q, locale=locale, topic_category=topic_category, is_active=is_active, ids=ids
        )
        params["tag"] = tag

        # Логика:
        # - tags := COALESCE(json_extract(meta_json,'$.tags'), json('[]'))
        # - если tag уже есть (EXISTS json_each) -> meta_json не меняем
        # - иначе -> json_set(meta_json,'$.tags', json_insert(tags,'$[#]', tag))
        sql = text(f"""
            UPDATE knowledge_items
            SET meta_json = json_set(
                CASE
                    WHEN meta_json IS NULL OR meta_json = '' THEN '{{}}'
                    ELSE meta_json
                END,
                '$.tags',
                json_insert(
                    COALESCE(json_extract(meta_json, '$.tags'), json('[]')),
                    '$[#]', :tag
                )
            )
            WHERE {where_sql}
                AND NOT EXISTS (
                    SELECT 1
                    FROM json_each(COALESCE(json_extract(meta_json, '$.tags'), json('[]')))
                    WHERE value = :tag
                )
        """)

        res = await session.execute(sql, params)
        return int(res.rowcount or 0)
    
    async def bulk_remove_tag(
        self,
        session: AsyncSession,
        *,
        q: Optional[str],
        locale: Optional[str],
        topic_category: Optional[str],
        is_active: Optional[bool],
        ids: Optional[list[int]],
        tag: str,
    ) -> int:
        where_sql, params = _build_where_and_params(
            q=q, locale=locale, topic_category=topic_category, is_active=is_active, ids=ids
        )
        params["tag"] = tag

        sql = text(f"""
            UPDATE knowledge_items
            SET meta_json = json_remove(
                CASE
                    WHEN meta_json IS NULL OR meta_json = '' THEN '{{}}'
                    ELSE meta_json
                END,
                '$.tags[' || (
                    SELECT key
                    FROM json_each(COALESCE(json_extract(meta_json, '$.tags'), json('[]')))
                    WHERE value = :tag
                    ORDER BY key DESC
                    LIMIT 1
                ) || ']'
            )
            WHERE {where_sql}
                AND EXISTS (
                SELECT 1
                FROM json_each(COALESCE(json_extract(meta_json, '$.tags'), json('[]')))
                WHERE value = :tag
                )
        """)

        res = await session.execute(sql, params)
        return int(res.rowcount or 0)

    async def preflight_activate(
        self,
        session: AsyncSession,
        *,
        q: Optional[str],
        locale: Optional[str],
        topic_category: Optional[str],
        ids: Optional[list[int]],
        allowed_tones: list[str],
        allowed_abstraction: list[str],
        limit_bad_ids: int = 50,
    ) -> tuple[int, list[int]]:
        where_sql, params = _build_where_and_params(
            q=q,
            locale=locale,
            topic_category=topic_category,
            is_active=None,  # важно: проверяем независимо от текущего состояния
            ids=ids,
        )
        params["limit"] = limit_bad_ids

        # Списки allowed_* передаём как JSON и используем json_each
        import json as _json
        params["tones_json"] = _json.dumps(allowed_tones, ensure_ascii=False)
        params["abs_json"] = _json.dumps(allowed_abstraction, ensure_ascii=False)

        bad_where = f"""
            ({where_sql})
            AND (
            meta_json IS NULL OR meta_json = '' OR meta_json = '{{}}'
            OR json_extract(meta_json,'$.tone') IS NULL
            OR json_extract(meta_json,'$.abstraction_level') IS NULL
            OR json_extract(meta_json,'$.tone') NOT IN (SELECT value FROM json_each(:tones_json))
            OR json_extract(meta_json,'$.abstraction_level') NOT IN (SELECT value FROM json_each(:abs_json))
            )
        """

        total_sql = text(f"SELECT COUNT(*) FROM knowledge_items WHERE {bad_where}")
        bad_total = int((await session.execute(total_sql, params)).scalar_one())

        ids_sql = text(f"""
            SELECT id
            FROM knowledge_items
            WHERE {bad_where}
            ORDER BY id DESC
            LIMIT :limit
        """)
        rows = (await session.execute(ids_sql, params)).fetchall()
        bad_ids = [int(r[0]) for r in rows]
        return bad_total, bad_ids

    async def bulk_set_active(
        self,
        session: AsyncSession,
        *,
        q: Optional[str],
        locale: Optional[str],
        topic_category: Optional[str],
        ids: Optional[list[int]],
        is_active: bool,
    ) -> int:
        where_sql, params = _build_where_and_params(
            q=q,
            locale=locale,
            topic_category=topic_category,
            is_active=None,  # менять можем независимо от текущего флага
            ids=ids,
        )
        params["active"] = 1 if is_active else 0

        sql = text(f"""
            UPDATE knowledge_items
            SET is_active = :active
            WHERE {where_sql}
                AND is_active != :active
        """)
        res = await session.execute(sql, params)
        return int(res.rowcount or 0)


