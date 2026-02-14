# astroprocessor/app/admin/ui/router.py
from __future__ import annotations

import asyncio
import json
import sqlite3
import time
from dataclasses import dataclass
from datetime import datetime
from pathlib import Path
from typing import Any, Optional

from fastapi import APIRouter, Depends, Form, Request
from fastapi.responses import HTMLResponse, PlainTextResponse, RedirectResponse, Response
from sqlalchemy import text
from sqlalchemy.ext.asyncio import AsyncSession
from starlette.templating import Jinja2Templates

from app.db import get_knowledge_session
from app.settings import settings
from app.knowledge.sql import sql_norm
router = APIRouter()

TEMPLATES_DIR = Path(__file__).resolve().parent / "templates"
templates = Jinja2Templates(directory=str(TEMPLATES_DIR))

# optional sub-router
try:
    from app.admin.ui.sources_router import router as sources_router  # type: ignore

    router.include_router(sources_router)
except Exception:
    pass

# constants used by tests + UI validation
from app.knowledge.meta_schema import ALLOWED_ABSTRACTION_LEVELS, ALLOWED_TONES  # type: ignore

try:
    from app.admin.ui.constants import TOPIC_CATEGORIES  # type: ignore
except Exception:
    TOPIC_CATEGORIES: list[str] = []


# ============================================================
# Generic helpers
# ============================================================

def _qp(request: Request, name: str, default: str = "") -> str:
    v = (request.query_params.get(name) or "").strip()
    return v if v else default


def _now_build_version() -> str:
    return datetime.now().strftime("%Y.%m.%d.%H%M")


def _flash_redirect(url: str, *, kind: str, text: str) -> RedirectResponse:
    from urllib.parse import quote

    u = f"{url}?flash_kind={quote(kind)}&flash={quote(text)}"
    return RedirectResponse(url=u, status_code=303)


def _flash_from_query(request: Request) -> dict[str, str] | None:
    kind = (request.query_params.get("flash_kind") or "").strip()
    text_ = (request.query_params.get("flash") or "").strip()
    if not text_:
        return None
    return {"kind": kind or "info", "text": text_}


def _int_or(s: str | None, default: int) -> int:
    try:
        return int((s or "").strip())
    except Exception:
        return default


def _parse_ids(ids: str) -> list[int]:
    raw = (ids or "").strip()
    if not raw:
        return []
    out: list[int] = []
    for part in raw.split(","):
        s = part.strip()
        if not s:
            continue
        out.append(int(s))
    return out


def _hx_ok(text_: str = "ok") -> PlainTextResponse:
    return PlainTextResponse(text_, status_code=200, headers={"HX-Trigger": "itemsChanged"})


def _load_meta(meta_json: Any) -> dict[str, Any]:
    if not meta_json:
        return {}
    try:
        return json.loads(str(meta_json))
    except Exception:
        return {}


def _dump_meta(meta: dict[str, Any]) -> str:
    return json.dumps(meta, ensure_ascii=False)

def _ev1_sql_in(n: int) -> str:
    return ",".join(["?"] * n)

def _sql_norm(col: str) -> str:
    """
    Normalize text column for comparisons/grouping in SQLite:
    - replace NBSP (char(160)) with regular space
    - replace tabs with space
    - trim
    """
    return f"TRIM(REPLACE(REPLACE(COALESCE({col}, ''), char(160), ' '), char(9), ' '))"


def _ev1_bool_from_form(v: Optional[str]) -> bool:
    # HTML checkbox usually sends "on"
    return bool(v) and str(v).strip().lower() in {"1", "true", "on", "yes"}


def _ev1_repair_enforce_topic_and_locale(
    conn: sqlite3.Connection,
    *,
    keys: list[str],
    canonical_locale: str,
    desired_topic_category: str,
    conflict_strategy: str = "delete",  # delete|deactivate
    touch_inactive: bool = False,
) -> dict[str, int]:
    """
    Enforce canonical_locale + desired_topic_category for EV1 keys.

    Strategy:
    - First normalize locale variants (ru, ru_RU, ru-ru...) -> canonical_locale
    - Then for rows scoped to (keys, canonical_locale, active?):
        - per (key, locale) keep exactly ONE row:
            prefer the row already in desired_topic_category, else lowest id
        - remove all other rows in that group (delete/deactivate)
        - update keeper's topic_category -> desired_topic_category (if needed)
    """
    if conflict_strategy not in {"delete", "deactivate"}:
        raise ValueError("conflict_strategy must be 'delete' or 'deactivate'")

    canonical_locale = canonical_locale.strip()
    desired_topic_category = desired_topic_category.strip()
    if not canonical_locale:
        raise ValueError("canonical_locale is empty")
    if not desired_topic_category:
        raise ValueError("desired_topic_category is empty")
    if not keys:
        return {"locale_updated": 0, "rows_removed": 0, "rows_deactivated": 0, "topic_updated": 0, "groups": 0}

    active_clause = "" if touch_inactive else "AND is_active = 1"

    # 1) Locale normalization for EV1 keys (covers the older 'ru' rows if any)
    # Normalize by updating common ru variants to canonical_locale.
    norm_candidates = ["ru", "ru-ru", "ru_ru", "ru ru", "RU", "RU-RU", "ru-RU"]
    locale_updated = 0
    cur = conn.execute(
        f"""
        UPDATE knowledge_items
           SET locale = ?
         WHERE key IN ({_ev1_sql_in(len(keys))})
           {active_clause}
           AND LOWER(REPLACE(REPLACE(TRIM(locale), '_', '-'), ' ', '-')) IN ({_ev1_sql_in(len(norm_candidates))})
           AND LOWER(REPLACE(REPLACE(TRIM(locale), '_', '-'), ' ', '-')) <> LOWER(REPLACE(REPLACE(TRIM(?), '_', '-'), ' ', '-'))
        """.strip(),
        [canonical_locale, *keys, *norm_candidates, canonical_locale],
    )
    locale_updated = int(cur.rowcount or 0)

    # 2) Scoped groups under canonical_locale
    # Important: Do NOT alias UPDATE target for SQLite compatibility.
    keys_in = _ev1_sql_in(len(keys))

    # How many groups exist (key+locale) in scope?
    groups = conn.execute(
        f"""
        SELECT COUNT(*)
        FROM (
          SELECT key, locale
          FROM knowledge_items
          WHERE key IN ({keys_in})
            {active_clause}
            AND locale = ?
          GROUP BY key, locale
        )
        """.strip(),
        [*keys, canonical_locale],
    ).fetchone()[0]
    groups = int(groups or 0)

    # Pick keepers (prefer already desired topic)
    # Remove everyone else in each (key, locale) group.
    remove_ids = [
        int(r[0])
        for r in conn.execute(
            f"""
            WITH scoped AS (
              SELECT id, key, locale,
                     TRIM(COALESCE(topic_category,'')) AS topic_n
              FROM knowledge_items
              WHERE key IN ({keys_in})
                {active_clause}
                AND locale = ?
            ),
            keepers AS (
              SELECT key, locale,
                (SELECT s2.id
                   FROM scoped s2
                  WHERE s2.key = s.key AND s2.locale = s.locale
                  ORDER BY CASE WHEN s2.topic_n = ? THEN 0 ELSE 1 END, s2.id
                  LIMIT 1
                ) AS keep_id
              FROM scoped s
              GROUP BY key, locale
            )
            SELECT s.id
            FROM scoped s
            JOIN keepers k
              ON k.key = s.key AND k.locale = s.locale
            WHERE s.id <> k.keep_id
            """.strip(),
            [*keys, canonical_locale, desired_topic_category],
        ).fetchall()
    ]

    rows_removed = 0
    rows_deactivated = 0
    if remove_ids:
        if conflict_strategy == "delete":
            cur = conn.execute(
                f"DELETE FROM knowledge_items WHERE id IN ({_ev1_sql_in(len(remove_ids))})",
                remove_ids,
            )
            rows_removed = int(cur.rowcount or 0)
        else:
            cur = conn.execute(
                f"UPDATE knowledge_items SET is_active=0 WHERE id IN ({_ev1_sql_in(len(remove_ids))})",
                remove_ids,
            )
            rows_deactivated = int(cur.rowcount or 0)

    # Update keeper rows to desired_topic_category (only within canonical locale scope)
    cur = conn.execute(
        f"""
        UPDATE knowledge_items
           SET topic_category = ?
         WHERE key IN ({keys_in})
           {active_clause}
           AND locale = ?
           AND TRIM(COALESCE(topic_category,'')) <> ?
        """.strip(),
        [desired_topic_category, *keys, canonical_locale, desired_topic_category],
    )
    topic_updated = int(cur.rowcount or 0)

    return {
        "locale_updated": locale_updated,
        "rows_removed": rows_removed,
        "rows_deactivated": rows_deactivated,
        "topic_updated": topic_updated,
        "groups": groups,
    }


# ============================================================
# Items contracts (templates expect these)
# ============================================================

@dataclass(frozen=True)
class Filters:
    q: str
    locale: str
    topic_category: str
    is_active: str
    selected: str


@dataclass(frozen=True)
class Pagination:
    limit: int
    offset: int
    total: int


async def _distinct_locales(session: AsyncSession) -> list[str]:
    rows = (await session.execute(text("SELECT DISTINCT locale FROM knowledge_items ORDER BY locale"))).fetchall()
    return [str(r[0]) for r in rows if r and r[0]]


def _where_sql(filters: Filters) -> tuple[str, dict[str, Any]]:
    clauses: list[str] = ["1=1"]
    params: dict[str, Any] = {}

    if filters.q.strip():
        clauses.append("(key LIKE :q OR text LIKE :q)")
        params["q"] = f"%{filters.q.strip()}%"

    if filters.locale.strip():
        clauses.append("locale = :locale")
        params["locale"] = filters.locale.strip()

    if filters.topic_category.strip():
        if filters.topic_category.strip() == "__NULL__":
            clauses.append("topic_category IS NULL")
        else:
            clauses.append("topic_category = :tc")
            params["tc"] = filters.topic_category.strip()

    if filters.is_active.strip():
        if filters.is_active.strip() in {"1", "true", "True", "on"}:
            clauses.append("is_active = 1")
        elif filters.is_active.strip() in {"0", "false", "False", "off"}:
            clauses.append("is_active = 0")

    return " AND ".join(clauses), params


def _selected_id(selected: str) -> int:
    try:
        return int((selected or "").strip() or "0")
    except Exception:
        return 0


# ============================================================
# ITEMS UI (AsyncSession => tests override DB)
# ============================================================

@router.get("/items", response_class=HTMLResponse, name="items_page")
async def items_page(request: Request, session: AsyncSession = Depends(get_knowledge_session)):
    filters = Filters(
        q=_qp(request, "q", ""),
        locale=_qp(request, "locale", "ru-RU"),
        topic_category=_qp(request, "topic_category", ""),
        is_active=_qp(request, "is_active", ""),
        selected=_qp(request, "selected", ""),
    )

    limit = _int_or(request.query_params.get("limit"), 50)
    offset = _int_or(request.query_params.get("offset"), 0)

    where_sql, params = _where_sql(filters)
    total = int(
        (await session.execute(text(f"SELECT COUNT(*) FROM knowledge_items WHERE {where_sql}"), params)).scalar() or 0
    )

    pagination = Pagination(limit=limit, offset=offset, total=total)
    locales = await _distinct_locales(session)

    return templates.TemplateResponse(
        request,
        "admin/items.html",
        {
            "request": request,
            "flash": _flash_from_query(request),
            "nav_active": "items",
            "filters": filters,
            "pagination": pagination,
            "locales": locales,
            "topic_categories": TOPIC_CATEGORIES,
        },
    )


@router.get("/items/table", response_class=HTMLResponse, name="items_table")
async def items_table(
    request: Request,
    session: AsyncSession = Depends(get_knowledge_session),
    q: str = "",
    locale: str = "",
    topic_category: str = "",
    is_active: str = "",
    selected: str = "",
    limit: int = 50,
    offset: int = 0,
):
    filters = Filters(q=q, locale=locale, topic_category=topic_category, is_active=is_active, selected=selected)

    where_sql, params = _where_sql(filters)
    total = int(
        (await session.execute(text(f"SELECT COUNT(*) FROM knowledge_items WHERE {where_sql}"), params)).scalar() or 0
    )

    # IMPORTANT: order by id ASC to match tests
    rows = (
        await session.execute(
            text(
                f"""
                SELECT id, key, topic_category, locale, text, priority, created_at, is_active, meta_json
                FROM knowledge_items
                WHERE {where_sql}
                ORDER BY id ASC
                LIMIT :limit OFFSET :offset
                """
            ),
            {**params, "limit": int(limit), "offset": int(offset)},
        )
    ).mappings().all()

    items: list[dict[str, Any]] = []
    for r in rows:
        meta = _load_meta(r.get("meta_json"))
        items.append(
            {
                "id": int(r["id"]),
                "key": str(r["key"]),
                "topic_category": r.get("topic_category"),
                "locale": str(r["locale"]),
                "text": str(r.get("text") or ""),
                "priority": int(r.get("priority") or 0),
                "created_at": r.get("created_at"),
                "is_active": int(r.get("is_active") or 0),
                "meta": meta,
                "meta_json": r.get("meta_json") or "{}",
            }
        )

    pagination = Pagination(limit=int(limit), offset=int(offset), total=total)

    # ✅ THIS is the template that contains class="items-table"
    return templates.TemplateResponse(
        request,
        "admin/_items_table_block.html",
        {
            "request": request,
            "items": items,
            "pagination": pagination,
            "filters": filters,
            "selected_id": _selected_id(selected),
        },
    )


@router.get("/items/select/{item_id}", response_class=HTMLResponse, name="items_select")
async def items_select(
    request: Request,
    item_id: int,
    session: AsyncSession = Depends(get_knowledge_session),
    q: str = "",
    locale: str = "",
    topic_category: str = "",
    is_active: str = "",
    selected: str = "",
):
    row = (
        await session.execute(
            text(
                """
                SELECT id, key, topic_category, locale, text, priority, created_at, is_active, meta_json
                FROM knowledge_items
                WHERE id = :id
                """
            ),
            {"id": int(item_id)},
        )
    ).mappings().first()

    if not row:
        return PlainTextResponse("not found", status_code=404)

    meta = _load_meta(row.get("meta_json"))
    item = {
        "id": int(row["id"]),
        "key": str(row["key"]),
        "topic_category": row.get("topic_category"),
        "locale": str(row["locale"]),
        "text": str(row.get("text") or ""),
        "priority": int(row.get("priority") or 0),
        "created_at": row.get("created_at"),
        "is_active": int(row.get("is_active") or 0),
        "meta": meta,
        "meta_json": row.get("meta_json") or "{}",
    }

    return templates.TemplateResponse(
        request,
        "admin/_select_response.html",
        {
            "request": request,
            "item": item,
            "filters": Filters(q=q, locale=locale, topic_category=topic_category, is_active=is_active, selected=selected),
            "topic_categories": TOPIC_CATEGORIES,
            "ALLOWED_TONES": list(ALLOWED_TONES),
            "ALLOWED_ABSTRACTION_LEVELS": list(ALLOWED_ABSTRACTION_LEVELS),
        },
    )


# ============================================================
# BULK endpoints (AsyncSession => tests override DB)
# ============================================================

@router.post("/items/bulk/set-tone", name="bulk_set_tone")
async def bulk_set_tone(
    request: Request,
    session: AsyncSession = Depends(get_knowledge_session),
    tone: str = Form(""),
    ids: str = Form(""),
):
    tone = (tone or "").strip()
    id_list = _parse_ids(ids)
    if not id_list:
        return PlainTextResponse("ids required", status_code=400)
    if not tone or tone not in set(ALLOWED_TONES):
        return PlainTextResponse("invalid tone", status_code=400)

    rows = (
        await session.execute(
            text(f"SELECT id, meta_json FROM knowledge_items WHERE id IN ({','.join([str(i) for i in id_list])})")
        )
    ).mappings().all()

    for r in rows:
        meta = _load_meta(r.get("meta_json"))
        meta["tone"] = tone
        await session.execute(text("UPDATE knowledge_items SET meta_json=:mj WHERE id=:id"), {"mj": _dump_meta(meta), "id": int(r["id"])})

    await session.commit()
    return _hx_ok("ok")


@router.post("/items/bulk/set-abstraction", name="bulk_set_abstraction")
async def bulk_set_abstraction(
    request: Request,
    session: AsyncSession = Depends(get_knowledge_session),
    abstraction_level: str = Form(""),
    ids: str = Form(""),
):
    abstraction_level = (abstraction_level or "").strip()
    id_list = _parse_ids(ids)
    if not id_list:
        return PlainTextResponse("ids required", status_code=400)
    if not abstraction_level or abstraction_level not in set(ALLOWED_ABSTRACTION_LEVELS):
        return PlainTextResponse("invalid abstraction_level", status_code=400)

    rows = (
        await session.execute(
            text(f"SELECT id, meta_json FROM knowledge_items WHERE id IN ({','.join([str(i) for i in id_list])})")
        )
    ).mappings().all()

    for r in rows:
        meta = _load_meta(r.get("meta_json"))
        meta["abstraction_level"] = abstraction_level
        await session.execute(text("UPDATE knowledge_items SET meta_json=:mj WHERE id=:id"), {"mj": _dump_meta(meta), "id": int(r["id"])})

    await session.commit()
    return _hx_ok("ok")


@router.post("/items/bulk/set-active", name="bulk_set_active")
async def bulk_set_active(
    request: Request,
    session: AsyncSession = Depends(get_knowledge_session),
    active: str = Form(""),
    ids: str = Form(""),
):
    id_list = _parse_ids(ids)
    if not id_list:
        return PlainTextResponse("ids required", status_code=400)

    active_val = 1 if str(active).strip() in {"1", "true", "True", "on"} else 0

    if active_val == 1:
        rows = (
            await session.execute(
                text(f"SELECT id, meta_json FROM knowledge_items WHERE id IN ({','.join([str(i) for i in id_list])})")
            )
        ).mappings().all()

        bad: list[int] = []
        for r in rows:
            meta = _load_meta(r.get("meta_json"))
            lvl = str(meta.get("abstraction_level", "")).strip()
            if not lvl or lvl not in set(ALLOWED_ABSTRACTION_LEVELS):
                bad.append(int(r["id"]))

        if bad:
            return PlainTextResponse(
                f"Нельзя активировать: отсутствует/некорректный abstraction_level (ids={bad})",
                status_code=400,
            )

    await session.execute(
        text(f"UPDATE knowledge_items SET is_active=:a WHERE id IN ({','.join([str(i) for i in id_list])})"),
        {"a": int(active_val)},
    )
    await session.commit()
    return _hx_ok("ok")


@router.post("/items/bulk/set-topic-category", name="bulk_set_topic_category")
async def bulk_set_topic_category(
    request: Request,
    session: AsyncSession = Depends(get_knowledge_session),
    topic_category: str = Form(""),
    ids: str = Form(""),
):
    id_list = _parse_ids(ids)
    if not id_list:
        return PlainTextResponse("ids required", status_code=400)

    tc = (topic_category or "").strip()
    if tc and tc not in set(TOPIC_CATEGORIES):
        return PlainTextResponse("invalid topic_category", status_code=400)

    tc_db = tc if tc else None
    await session.execute(
        text(f"UPDATE knowledge_items SET topic_category=:tc WHERE id IN ({','.join([str(i) for i in id_list])})"),
        {"tc": tc_db},
    )
    await session.commit()
    return _hx_ok("ok")


# ============================================================
# BUILDS / EV1 (sqlite3 against real db; smoke requires routes exist)
# ============================================================

def _astro_root() -> Path:
    return Path(__file__).resolve().parents[3]


def _repo_root() -> Path:
    return _astro_root().parent


def _kb_defaults() -> dict[str, str]:
    root = _astro_root()
    return {
        "inbox_dir": str(root / "data" / "knowledge_sources" / "inbox"),
        "docs_dir": str(root / "knowledge" / "docs"),
        "processed_dir": str(root / "data" / "knowledge_sources" / "processed" / "inbox"),
        "failed_dir": str(root / "data" / "knowledge_sources" / "failed" / "inbox"),
        "db_path": str(Path(str(settings.knowledge_db_path))),
        "knowledge_build_version": "kb-0.1",
    }

def _connect_db() -> sqlite3.Connection:
    """
    Open knowledge DB with deterministic path and safe defaults for threads.
    """
    db_path = Path(str(settings.knowledge_db_path))
    conn = sqlite3.connect(str(db_path), timeout=30, check_same_thread=False)
    conn.row_factory = sqlite3.Row
    return conn

def _table_columns(conn: sqlite3.Connection, table: str) -> set[str]:
    rows = conn.execute(f"PRAGMA table_info({table})").fetchall()
    # row: (cid, name, type, notnull, dflt_value, pk)
    return {str(r[1]) for r in rows}

def _detect_text_column(conn: sqlite3.Connection) -> str | None:
    """
    Detect text-like column in knowledge_items.
    We prefer 'text', but support older schemas.
    """
    cols = _table_columns(conn, "knowledge_items")
    for c in ("text", "content", "body"):
        if c in cols:
            return c
    return None

def _call_make_ev1_seed_items(
    kb_mod,
    keys: list[str],
    *,
    locale: str,
    topic_category: str,
    priority: int,
    text: str,
    is_active: int,
    tags: str,
):
    """
    Compatibility wrapper: builder.make_ev1_seed_items may have different signatures.
    We pass what it supports, then patch dicts defensively.
    """
    import inspect

    fn = kb_mod.make_ev1_seed_items
    sig = None
    try:
        sig = inspect.signature(fn)
    except Exception:
        sig = None

    kwargs = {"keys": keys, "locale": locale, "topic_category": topic_category, "priority": priority}
    # Some versions may accept stub_text/text/is_active/tags etc.
    if sig:
        if "stub_text" in sig.parameters:
            kwargs["stub_text"] = text
        elif "text" in sig.parameters:
            kwargs["text"] = text
        if "is_active" in sig.parameters:
            kwargs["is_active"] = is_active
        if "tags" in sig.parameters:
            kwargs["tags"] = tags

    items = fn(**kwargs)

    # Patch items to ensure fields exist if items are dict-like
    patched = []
    for it in items:
        if isinstance(it, dict):
            it.setdefault("text", text)
            it.setdefault("priority", priority)
            it.setdefault("locale", locale)
            it.setdefault("topic_category", topic_category)
            # only set if schema supports (safe: extra keys usually ignored, but we keep minimal)
            it["is_active"] = is_active
            if tags:
                # keep existing tags if present
                cur = (it.get("tags") or "").strip()
                if cur:
                    # avoid duplicates
                    parts = {p.strip() for p in cur.split(",") if p.strip()}
                    parts.update({p.strip() for p in tags.split(",") if p.strip()})
                    it["tags"] = ",".join(sorted(parts))
                else:
                    it["tags"] = tags
        patched.append(it)
    return patched

def _call_apply_seed_ignore_unique(
    kb_mod,
    conn: sqlite3.Connection,
    items,
    *,
    dry_run: bool = False,
    only_keys=None,
    set_priority=None,
    priority_offset: int = 0,
) -> tuple[int, int]:
    """
    Compatibility wrapper for kb.apply_seed_ignore_unique with different signatures.
    """
    import inspect

    fn = kb_mod.apply_seed_ignore_unique
    try:
        sig = inspect.signature(fn)
    except Exception:
        sig = None

    kwargs = {"conn": conn, "items": items} if sig and "conn" in sig.parameters else {}
    # some versions are positional: (conn, items, ...)
    args = [] if kwargs else [conn, items]

    if sig:
        if "dry_run" in sig.parameters:
            kwargs["dry_run"] = dry_run
        if "only_keys" in sig.parameters:
            kwargs["only_keys"] = only_keys
        if "set_priority" in sig.parameters:
            kwargs["set_priority"] = set_priority
        if "priority_offset" in sig.parameters:
            kwargs["priority_offset"] = priority_offset

        if kwargs:
            return fn(**kwargs)
        return fn(*args)
    # fallback: positional minimal
    return fn(conn, items)

def _default_ev1_keys_file() -> str:
    rr = _repo_root()
    ar = _astro_root()
    if (rr / "ev1_keys_unique.txt").exists():
        return "../ev1_keys_unique.txt"
    if (ar / "ev1_keys_unique.txt").exists():
        return "./ev1_keys_unique.txt"
    if (ar / "tools" / "knowledge" / "seed_keys_core_v1.txt").exists():
        return "./tools/knowledge/seed_keys_core_v1.txt"
    return "../ev1_keys_unique.txt"


async def _read_kb_meta_rows() -> list[tuple[str, str]]:
    db_path = Path(str(settings.knowledge_db_path))
    if not db_path.exists():
        return []

    def _read() -> list[tuple[str, str]]:
        c = sqlite3.connect(str(db_path))
        try:
            c.execute("CREATE TABLE IF NOT EXISTS kb_meta (key TEXT PRIMARY KEY, value TEXT NOT NULL)")
            rows = c.execute("SELECT key, value FROM kb_meta ORDER BY key").fetchall()
            return [(str(k), str(v)) for (k, v) in rows]
        finally:
            c.close()

    return await asyncio.to_thread(_read)


def _load_ev1_keys_or_error(keys_file: str) -> tuple[list[str], Optional[str], str]:
    from app.knowledge import builder as kb

    p, ok = kb.resolve_ev1_keys_file(keys_file)
    if not ok:
        return [], f"keys_file пустой или не найден: {p}", str(p)
    try:
        keys = kb.load_keys_txt(p)
    except Exception as e:
        return [], f"{type(e).__name__}: {e}", str(p)
    if not keys:
        return [], f"keys_file пустой: {p}", str(p)
    return keys, None, str(p)


def _ev1_live_compute(*, keys_file: str, locale: str, topic_category: str, top_missing: int = 50) -> dict[str, Any]:
    from app.knowledge import builder as kb

    keys, err, keys_path_str = _load_ev1_keys_or_error(keys_file)
    if err:
        return {
            "ev1_keys_file_resolved": keys_path_str,
            "ev1_live_error": err,
            "ev1_breakdown": [],
            "ev1_missing_keys": [],
            "ev1_total_live": 0,
            "ev1_present_active_live": 0,
            "ev1_missing_live": 0,
            "ev1_issues_null_topic_category_count": 0,
            "ev1_issues_null_topic_category_sample": [],
        }

    db_path = Path(str(settings.knowledge_db_path))
    conn = sqlite3.connect(str(db_path))
    try:
        cov = kb.coverage_ev1(conn, keys, locale=locale, topic_category=topic_category, top_missing=top_missing)
        breakdown_rows = kb.coverage_breakdown_ev1(conn, keys)
        breakdown = []
        for r in breakdown_rows:
            pct = int(round((r.present_active / r.total) * 100)) if r.total else 0
            breakdown.append(
                {
                    "locale": (r.locale or "").strip() or "(empty)",
                    "topic_category": (r.topic_category or "").strip() or "(none)",
                    "total": r.total,
                    "present_active": r.present_active,
                    "missing": r.missing,
                    "pct": pct,
                }
            )
        issues = kb.ev1_data_issues(conn, keys, locale=locale, sample_limit=20)
        return {
            "ev1_keys_file_resolved": keys_path_str,
            "ev1_live_error": None,
            "ev1_breakdown": breakdown,
            "ev1_missing_keys": cov.missing_keys,
            "ev1_total_live": cov.total,
            "ev1_present_active_live": cov.present_active,
            "ev1_missing_live": cov.missing,
            "ev1_issues_null_topic_category_count": issues.null_topic_category_count,
            "ev1_issues_null_topic_category_sample": issues.sample_keys,
        }
    finally:
        conn.close()


def _ev1_empty_text_active(
    *,
    keys_file: str,
    locale: str,
    topic_category: str,
    sample_limit: int = 20,
) -> dict[str, Any]:
    """
    Count EV1 keys that exist as ACTIVE items with empty text (TRIM(text)='').
    Returns count + sample keys.
    """
    keys, err, keys_path_str = _load_ev1_keys_or_error(keys_file)
    if err:
        return {
            "ev1_keys_file_resolved": keys_path_str,
            "ev1_empty_text_error": err,
            "ev1_empty_text_active_count": 0,
            "ev1_empty_text_active_sample": [],
        }

    conn = _connect_db()
    try:
        text_col = _detect_text_column(conn)
        if not text_col:
            return {
                "ev1_keys_file_resolved": keys_path_str,
                "ev1_empty_text_error": "No text-like column in knowledge_items (expected: text/content/body).",
                "ev1_empty_text_active_count": 0,
                "ev1_empty_text_active_sample": [],
            }

        placeholders = ",".join(["?"] * len(keys))
        params = [*keys, locale.strip(), topic_category.strip()]

        count_sql = f"""
            SELECT COUNT(DISTINCT key)
            FROM knowledge_items
            WHERE is_active=1
              AND key IN ({placeholders})
              AND {sql_norm('locale')} = ?
              AND {sql_norm('topic_category')} = ?
              AND TRIM(COALESCE({text_col}, '')) = ''
        """.strip()
        cnt = int(conn.execute(count_sql, params).fetchone()[0] or 0)

        sample_sql = f"""
            SELECT DISTINCT key
            FROM knowledge_items
            WHERE is_active=1
              AND key IN ({placeholders})
              AND {sql_norm('locale')} = ?
              AND {sql_norm('topic_category')} = ?
              AND TRIM(COALESCE({text_col}, '')) = ''
            ORDER BY key
            LIMIT ?
        """.strip()
        sample = [
            r[0]
            for r in conn.execute(sample_sql, [*params, int(sample_limit)]).fetchall()
        ]

        return {
            "ev1_keys_file_resolved": keys_path_str,
            "ev1_empty_text_error": None,
            "ev1_empty_text_active_count": cnt,
            "ev1_empty_text_active_sample": sample,
        }
    finally:
        conn.close()

@router.get("/builds", name="builds_page")
async def builds_page(request: Request):
    d = _kb_defaults()
    kb_rows = await _read_kb_meta_rows()
    kb_dict = {k: v for (k, v) in kb_rows}

    ev1_keys_file = _default_ev1_keys_file()
    ev1_locale = "ru-RU"
    ev1_topic_category = "personality_core"
    ev1_priority = 200

    ev1_keys_file = _qp(request, "ev1_keys_file", ev1_keys_file)
    ev1_locale = _qp(request, "ev1_locale", ev1_locale)
    ev1_topic_category = _qp(request, "ev1_topic_category", ev1_topic_category)

    ev1_total = _int_or(kb_dict.get("ev1_total"), 0)
    ev1_present_active = _int_or(kb_dict.get("ev1_present_active"), 0)
    ev1_missing = _int_or(kb_dict.get("ev1_missing"), 0)
    ev1_pct = int(round((ev1_present_active / ev1_total) * 100)) if ev1_total else 0

    live = await asyncio.to_thread(
        _ev1_live_compute,
        keys_file=ev1_keys_file,
        locale=ev1_locale,
        topic_category=ev1_topic_category,
        top_missing=50,
    )

    empty_live = await asyncio.to_thread(
            _ev1_empty_text_active,
            keys_file=ev1_keys_file,
            locale=ev1_locale,
            topic_category=ev1_topic_category,
            sample_limit=20,
    )

    return templates.TemplateResponse(
        request,
        "admin/builds.html",
        {
            "request": request,
            "flash": _flash_from_query(request),
            "nav_active": "builds",
            "build_version": _now_build_version(),
            "knowledge_build_version": d["knowledge_build_version"],
            "inbox_dir": d["inbox_dir"],
            "docs_dir": d["docs_dir"],
            "kb_meta": kb_rows,
            "kb_meta_dict": kb_dict,
            "ev1_keys_file": ev1_keys_file,
            "ev1_locale": ev1_locale,
            "ev1_topic_category": ev1_topic_category,
            "ev1_priority": ev1_priority,
            "ev1_total": ev1_total,
            "ev1_present_active": ev1_present_active,
            "ev1_missing": ev1_missing,
            "ev1_pct": ev1_pct,
            **live,
            **empty_live,
        },
    )


@router.get("/builds/ev1/missing.txt", name="builds_ev1_missing_txt")
async def builds_ev1_missing_txt(
    request: Request,
    ev1_keys_file: str = "../ev1_keys_unique.txt",
    ev1_locale: str = "ru-RU",
    ev1_topic_category: str = "personality_core",
):
    from app.knowledge import builder as kb

    keys, err, keys_path_str = _load_ev1_keys_or_error(ev1_keys_file)
    if err:
        return PlainTextResponse(f"❌ {err}\n(keys_file={keys_path_str})\n", status_code=404)

    db_path = Path(str(settings.knowledge_db_path))
    conn = sqlite3.connect(str(db_path))
    try:
        cov = kb.coverage_ev1(conn, keys, locale=ev1_locale, topic_category=ev1_topic_category, top_missing=100_000)
        return PlainTextResponse(kb.export_missing_txt(cov.missing_keys), media_type="text/plain; charset=utf-8")
    finally:
        conn.close()

@router.get("/builds/ev1/empty.txt", name="builds_ev1_empty_txt")
async def builds_ev1_empty_txt(
    request: Request,
    ev1_keys_file: str = "../ev1_keys_unique.txt",
    ev1_locale: str = "ru-RU",
    ev1_topic_category: str = "personality_core",
):
    keys, err, keys_path_str = _load_ev1_keys_or_error(ev1_keys_file)
    if err:
        return PlainTextResponse(f"❌ {err}\n(keys_file={keys_path_str})\n", status_code=404)

    conn = _connect_db()
    try:
        text_col = _detect_text_column(conn)
        if not text_col:
            return PlainTextResponse("❌ No text-like column in knowledge_items.\n", status_code=500)

        placeholders = ",".join(["?"] * len(keys))
        sql = f"""
            SELECT DISTINCT key
            FROM knowledge_items
            WHERE is_active=1
              AND key IN ({placeholders})
              AND {sql_norm('locale')} = ?
              AND {sql_norm('topic_category')} = ?
              AND TRIM(COALESCE({text_col}, '')) = ''
            ORDER BY key
        """.strip()
        rows = conn.execute(sql, [*keys, ev1_locale.strip(), ev1_topic_category.strip()]).fetchall()
        out = "\n".join(r[0] for r in rows) + ("\n" if rows else "")
        return PlainTextResponse(out, media_type="text/plain; charset=utf-8")
    finally:
        conn.close()

@router.get("/builds/ev1/missing.jsonl", name="builds_ev1_missing_jsonl")
async def builds_ev1_missing_jsonl(
    request: Request,
    ev1_keys_file: str = "../ev1_keys_unique.txt",
    ev1_locale: str = "ru-RU",
    ev1_topic_category: str = "personality_core",
    priority: int = 200,
):
    from app.knowledge import builder as kb

    keys, err, keys_path_str = _load_ev1_keys_or_error(ev1_keys_file)
    if err:
        return PlainTextResponse(f"❌ {err}\n(keys_file={keys_path_str})\n", status_code=404)

    db_path = Path(str(settings.knowledge_db_path))
    conn = sqlite3.connect(str(db_path))
    try:
        cov = kb.coverage_ev1(conn, keys, locale=ev1_locale, topic_category=ev1_topic_category, top_missing=100_000)
        body = kb.export_missing_jsonl(
            cov.missing_keys,
            locale=ev1_locale,
            topic_category=ev1_topic_category,
            priority=int(priority),
            stub_text="",
        )
        return Response(body, media_type="application/jsonl; charset=utf-8")
    finally:
        conn.close()

@router.post("/builds/ev1/repair", name="builds_ev1_repair")
async def builds_ev1_repair(
    request: Request,
    keys_file: str = Form("../ev1_keys_unique.txt"),
    canonical_locale: str = Form("ru-RU"),
    desired_topic_category: str = Form("personality_core"),
    conflict_strategy: str = Form("delete"),  # delete|deactivate
    touch_inactive: Optional[str] = Form(None),  # checkbox -> "on"
):
    """
    Repair EV1 data drift:
    - normalize locale variants -> canonical_locale
    - enforce desired_topic_category for EV1 keys in canonical_locale
    - safely resolves UNIQUE by removing/deactivating competing rows per key+locale
    """
    from app.knowledge import builder as kb

    keys, err, keys_path_str = _load_ev1_keys_or_error(keys_file)
    if err:
        return _flash_redirect(
            str(request.url_for("builds_page")),
            kind="err",
            text=f"❌ EV1 Repair FAILED: {err} (keys_file={keys_path_str})",
        )

    def _run() -> str:
        conn = _connect_db()
        try:
            conn.execute("BEGIN IMMEDIATE")

            stats = _ev1_repair_enforce_topic_and_locale(
                conn,
                keys=keys,
                canonical_locale=str(canonical_locale),
                desired_topic_category=str(desired_topic_category),
                conflict_strategy=str(conflict_strategy).strip().lower(),
                touch_inactive=_ev1_bool_from_form(touch_inactive),
            )

            # recompute coverage for canonical locale/topic
            cov = kb.coverage_ev1(
                conn,
                keys,
                locale=str(canonical_locale),
                topic_category=str(desired_topic_category),
                top_missing=50,
            )

            # write meta (optional but useful)
            kb._set_meta(conn, "ev1_repair_updated_at", str(int(time.time())))
            kb._set_meta(conn, "ev1_repair_keys_file", str(keys_path_str))
            kb._set_meta(conn, "ev1_repair_locale", str(canonical_locale))
            kb._set_meta(conn, "ev1_repair_topic_category", str(desired_topic_category))
            kb._set_meta(conn, "ev1_repair_strategy", str(conflict_strategy))
            kb._set_meta(conn, "ev1_repair_locale_updated", str(stats["locale_updated"]))
            kb._set_meta(conn, "ev1_repair_topic_updated", str(stats["topic_updated"]))
            kb._set_meta(conn, "ev1_repair_rows_removed", str(stats["rows_removed"]))
            kb._set_meta(conn, "ev1_repair_rows_deactivated", str(stats["rows_deactivated"]))
            kb._set_meta(conn, "ev1_repair_groups", str(stats["groups"]))

            # also keep your existing EV1 meta in sync (optional)
            kb._set_meta(conn, "ev1_total", str(cov.total))
            kb._set_meta(conn, "ev1_present_active", str(cov.present_active))
            kb._set_meta(conn, "ev1_missing", str(cov.missing))

            conn.commit()

            return (
                "✅ EV1 Repair OK. "
                f"groups={stats['groups']} "
                f"locale_updated={stats['locale_updated']} "
                f"topic_updated={stats['topic_updated']} "
                f"removed={stats['rows_removed']} "
                f"deactivated={stats['rows_deactivated']}; "
                f"coverage={cov.present_active}/{cov.total} missing={cov.missing}"
            )
        except Exception:
            conn.rollback()
            raise
        finally:
            conn.close()

    try:
        msg = await asyncio.to_thread(_run)
        kind = "ok"
    except Exception as e:
        msg = f"❌ EV1 Repair FAILED: {type(e).__name__}: {e}"
        kind = "err"

    return _flash_redirect(str(request.url_for("builds_page")), kind=kind, text=msg)

@router.post("/builds/ev1/seed_missing", name="builds_ev1_seed_missing")
async def builds_ev1_seed_missing(
    request: Request,
    keys_file: str = Form("../ev1_keys_unique.txt"),
    locale: str = Form("ru-RU"),
    topic_category: str = Form("personality_core"),
    priority: int = Form(200),
    make_active: Optional[str] = Form(None),  # checkbox -> "on"
    add_stub_tag: Optional[str] = Form(None),  # checkbox -> "on"
):
    """
    Create stubs ONLY for missing EV1 keys (live-missing), idempotent.
    Default: inserts as inactive drafts (is_active=0).
    """
    from app.knowledge import builder as kb

    keys, err, keys_path_str = _load_ev1_keys_or_error(keys_file)
    if err:
        return _flash_redirect(
            str(request.url_for("builds_page")),
            kind="err",
            text=f"❌ EV1 Seed Missing FAILED: {err} (keys_file={keys_path_str})",
        )

    def _run() -> str:
        conn = _connect_db()
        try:
            conn.execute("BEGIN IMMEDIATE")

            # compute missing (full list) for ACTIVE coverage
            cov_before = kb.coverage_ev1(
                conn,
                keys,
                locale=str(locale),
                topic_category=str(topic_category),
                top_missing=100_000,
            )
            missing_keys = cov_before.missing_keys

            if not missing_keys:
                conn.commit()
                return (
                    "✅ EV1 Seed Missing: nothing to do "
                    f"(coverage={cov_before.present_active}/{cov_before.total} missing=0)"
                )

            is_active = 1 if _ev1_bool_from_form(make_active) else 0
            tags = "ev1_stub" if _ev1_bool_from_form(add_stub_tag) else ""

            items = _call_make_ev1_seed_items(
                kb,
                missing_keys,
                locale=str(locale),
                topic_category=str(topic_category),
                priority=int(priority),
                text="",
                is_active=is_active,
                tags=tags,
            )

            inserted, skipped = _call_apply_seed_ignore_unique(
                kb,
                conn,
                items,
                dry_run=False,
                only_keys=None,
                set_priority=None,
                priority_offset=0,
            )

            # NEW: if skipped, it usually means rows already exist (often inactive).
            # Update existing rows for these missing keys: set priority, ensure ev1_stub tag,
            # and optionally activate if make_active checked.
            updated = 0
            if missing_keys:
                cols = _table_columns(conn, "knowledge_items")
                has_tags = "tags" in cols
                has_priority = "priority" in cols
                has_is_active = "is_active" in cols

                set_parts: list[str] = []
                params: list[object] = []

                if has_priority:
                    set_parts.append("priority = ?")
                    params.append(int(priority))

                if has_is_active:
                    # if make_active checked -> force to 1, else keep as-is
                    set_parts.append("is_active = CASE WHEN ?=1 THEN 1 ELSE is_active END")
                    params.append(int(is_active))

                if has_tags and tags:
                    # merge tag if absent
                    set_parts.append(
                        """
                        tags = CASE
                        WHEN tags IS NULL OR TRIM(tags)='' THEN ?
                        WHEN INSTR(',' || tags || ',', ',' || ? || ',') > 0 THEN tags
                        ELSE tags || ',' || ?
                        END
                        """.strip()
                    )
                    params.extend([tags, tags, tags])

                if set_parts:
                    placeholders = ",".join(["?"] * len(missing_keys))
                    sql = f"""
                        UPDATE knowledge_items
                        SET {", ".join(set_parts)}
                        WHERE key IN ({placeholders})
                        AND locale = ?
                        AND topic_category = ?
                    """.strip()
                    params.extend([*missing_keys, str(locale), str(topic_category)])
                    cur = conn.execute(sql, params)
                    updated = int(cur.rowcount or 0)

            cov_after = kb.coverage_ev1(
                conn,
                keys,
                locale=str(locale),
                topic_category=str(topic_category),
                top_missing=50,
            )

            kb._set_meta(conn, "ev1_total", str(cov_after.total))
            kb._set_meta(conn, "ev1_present_active", str(cov_after.present_active))
            kb._set_meta(conn, "ev1_missing", str(cov_after.missing))
            kb._set_meta(conn, "ev1_seed_missing_updated_at", str(int(time.time())))
            kb._set_meta(conn, "ev1_seed_missing_inserted", str(int(inserted)))
            kb._set_meta(conn, "ev1_seed_missing_skipped", str(int(skipped)))
            kb._set_meta(conn, "ev1_seed_missing_updated", str(int(updated)))
            kb._set_meta(conn, "ev1_seed_missing_is_active", str(int(is_active)))
            kb._set_meta(conn, "ev1_seed_missing_tags", tags)

            conn.commit()

            return (
                "✅ EV1 Seed Missing OK. "
                f"missing_before={len(missing_keys)} inserted={inserted} skipped={skipped} updated={updated}; "
                f"coverage={cov_after.present_active}/{cov_after.total} missing={cov_after.missing}; "
                f"make_active={int(is_active)} tags={tags or '(none)'}"
            )
        except Exception:
            conn.rollback()
            raise
        finally:
            conn.close()
    try:
        msg = await asyncio.to_thread(_run)
        kind = "ok"
    except Exception as e:
        msg = f"❌ EV1 Seed Missing FAILED: {type(e).__name__}: {e}"
        kind = "err"

    return _flash_redirect(str(request.url_for("builds_page")), kind=kind, text=msg)

@router.post("/builds/import_build", name="builds_import_build")
async def builds_import_build(
    request: Request,
    build_version: str = Form(...),
    knowledge_build_version: str = Form(...),
    inbox_dir: str = Form(...),
    docs_dir: str = Form(...),
):
    from app.knowledge import builder as kb

    def _run() -> str:
        st_import = kb.import_books(inbox_dir=inbox_dir)
        conn = sqlite3.connect(str(Path(str(settings.knowledge_db_path))))
        try:
            kb.ensure_schema_meta(conn)
            res = kb.build_chunks(conn)
            kb._set_meta(conn, "build_version", str(build_version))
            kb._set_meta(conn, "knowledge_build_version", str(knowledge_build_version))
            kb._set_meta(conn, "docs_total", str(res["docs"]))
            kb._set_meta(conn, "chunks_total", str(res["chunks"]))
            kb._set_meta(conn, "updated_at", str(int(time.time())))
            conn.commit()
        finally:
            conn.close()

        return (
            "✅ Import+Build OK. "
            f"imported={st_import['imported']} failed={st_import['failed']}; "
            f"docs={res['docs']} chunks={res['chunks']}; "
            f"build_version={build_version}, kb_build={knowledge_build_version}"
        )

    try:
        msg = await asyncio.to_thread(_run)
        kind = "ok"
    except Exception as e:
        msg = f"❌ Import+Build FAILED: {type(e).__name__}: {e}"
        kind = "err"

    return _flash_redirect(str(request.url_for("builds_page")), kind=kind, text=msg)


@router.post("/builds/seed", name="builds_seed")
async def builds_seed(
    request: Request,
    build_version: str = Form(...),
    knowledge_build_version: str = Form(...),
):
    from app.knowledge import builder as kb

    def _run_seed() -> str:
        conn = sqlite3.connect(str(Path(str(settings.knowledge_db_path))))
        try:
            kb.ensure_schema_items_and_meta(conn)
            inserted, skipped = kb.seed_default(conn)
            kb._set_meta(conn, "build_version", str(build_version))
            kb._set_meta(conn, "knowledge_build_version", str(knowledge_build_version))
            kb._set_meta(conn, "updated_at", str(int(time.time())))
            conn.commit()
        finally:
            conn.close()

        return (
            "✅ Seed OK. "
            f"inserted={inserted} skipped={skipped}; "
            f"build_version={build_version}, kb_build={knowledge_build_version}"
        )

    try:
        msg = await asyncio.to_thread(_run_seed)
        kind = "ok"
    except Exception as e:
        msg = f"❌ Seed FAILED: {type(e).__name__}: {e}"
        kind = "err"

    return _flash_redirect(str(request.url_for("builds_page")), kind=kind, text=msg)


@router.post("/builds/seed_ev1", name="builds_seed_ev1")
async def builds_seed_ev1(
    request: Request,
    build_version: str = Form(...),
    knowledge_build_version: str = Form(...),
    keys_file: str = Form("../ev1_keys_unique.txt"),
    locale: str = Form("ru-RU"),
    topic_category: str = Form("personality_core"),
    priority: int = Form(200),
):
    from app.knowledge import builder as kb

    def _run() -> str:
        conn = sqlite3.connect(str(Path(str(settings.knowledge_db_path))))
        try:
            res = kb.seed_ev1(
                conn,
                keys_file=str(keys_file),
                locale=str(locale),
                topic_category=str(topic_category),
                priority=int(priority),
                build_version=str(build_version),
                knowledge_build_version=str(knowledge_build_version),
            )
            conn.commit()
            return (
                "✅ EV1 Seed OK. "
                f"inserted={res['inserted']} skipped={res['skipped']}; "
                f"coverage={res['coverage_present_active']}/{res['coverage_total']} missing={res['coverage_missing']}; "
                f"build_version={build_version}, kb_build={knowledge_build_version}"
            )
        finally:
            conn.close()

    try:
        msg = await asyncio.to_thread(_run)
        kind = "ok"
    except Exception as e:
        msg = f"❌ EV1 Seed FAILED: {type(e).__name__}: {e}"
        kind = "err"

    return _flash_redirect(str(request.url_for("builds_page")), kind=kind, text=msg)

@router.post("/builds/ev1/deactivate_empty", name="builds_ev1_deactivate_empty")
async def builds_ev1_deactivate_empty(
    request: Request,
    keys_file: str = Form("../ev1_keys_unique.txt"),
    locale: str = Form("ru-RU"),
    topic_category: str = Form("personality_core"),
    dry_run: Optional[str] = Form(None),
    only_priority_200: Optional[str] = Form("on"),  # ✅ default ON
):
    """
    Deactivate ACTIVE EV1 items with empty text.
    Default scope: only stubs (priority=200), unless only_priority_200 unchecked.
    """
    keys, err, keys_path_str = _load_ev1_keys_or_error(keys_file)
    if err:
        return _flash_redirect(
            str(request.url_for("builds_page")),
            kind="err",
            text=f"❌ Deactivate empty FAILED: {err} (keys_file={keys_path_str})",
        )

    def _run() -> str:
        conn = _connect_db()
        try:
            conn.execute("BEGIN IMMEDIATE")

            text_col = _detect_text_column(conn)
            if not text_col:
                raise RuntimeError("No text-like column in knowledge_items (expected text/content/body).")

            cols = _table_columns(conn, "knowledge_items")
            has_priority = "priority" in cols
            stub_only = _ev1_bool_from_form(only_priority_200)

            placeholders = ",".join(["?"] * len(keys))
            base_params: list[object] = [*keys, str(locale).strip(), str(topic_category).strip()]

            priority_clause = ""
            if stub_only and has_priority:
                priority_clause = "AND priority = 200"

            select_sql = f"""
                SELECT id
                FROM knowledge_items
                WHERE is_active=1
                  AND key IN ({placeholders})
                  AND {sql_norm('locale')} = ?
                  AND {sql_norm('topic_category')} = ?
                  {priority_clause}
                  AND TRIM(COALESCE({text_col}, '')) = ''
            """.strip()

            rows = conn.execute(select_sql, base_params).fetchall()
            ids = [int(r[0]) for r in rows]
            affected = len(ids)

            if _ev1_bool_from_form(dry_run) or not ids:
                conn.rollback()
                return f"✅ Deactivate empty (dry-run={int(_ev1_bool_from_form(dry_run))}). would_deactivate={affected}"

            cur = conn.execute(
                f"UPDATE knowledge_items SET is_active=0 WHERE id IN ({','.join(['?']*len(ids))})",
                ids,
            )
            updated = int(cur.rowcount or 0)

            from app.knowledge import builder as kb
            cov = kb.coverage_ev1(conn, keys, locale=str(locale), topic_category=str(topic_category), top_missing=50)
            kb._set_meta(conn, "ev1_total", str(cov.total))
            kb._set_meta(conn, "ev1_present_active", str(cov.present_active))
            kb._set_meta(conn, "ev1_missing", str(cov.missing))
            kb._set_meta(conn, "ev1_deactivate_empty_updated_at", str(int(time.time())))
            kb._set_meta(conn, "ev1_deactivate_empty_count", str(updated))
            kb._set_meta(conn, "ev1_deactivate_empty_stub_only", str(int(stub_only)))

            conn.commit()
            return (
                f"✅ Deactivated empty-text items: {updated} (stub_only={int(stub_only)}). "
                f"coverage={cov.present_active}/{cov.total} missing={cov.missing}"
            )
        except Exception:
            conn.rollback()
            raise
        finally:
            conn.close()

    try:
        msg = await asyncio.to_thread(_run)
        kind = "ok"
    except Exception as e:
        msg = f"❌ Deactivate empty FAILED: {type(e).__name__}: {e}"
        kind = "err"

    return _flash_redirect(str(request.url_for("builds_page")), kind=kind, text=msg)


# --- NEW: Activate only non-empty text (safety button) ---

@router.post("/builds/ev1/activate_nonempty", name="builds_ev1_activate_nonempty")
async def builds_ev1_activate_nonempty(
    request: Request,
    keys_file: str = Form("../ev1_keys_unique.txt"),
    locale: str = Form("ru-RU"),
    topic_category: str = Form("personality_core"),
    dry_run: Optional[str] = Form(None),
    only_priority_200: Optional[str] = Form(None),  # default OFF
):
    """
    Activate EV1 items ONLY when text is not empty.
    Optional: restrict to stubs (priority=200).
    """
    keys, err, keys_path_str = _load_ev1_keys_or_error(keys_file)
    if err:
        return _flash_redirect(
            str(request.url_for("builds_page")),
            kind="err",
            text=f"❌ Activate nonempty FAILED: {err} (keys_file={keys_path_str})",
        )

    def _run() -> str:
        conn = _connect_db()
        try:
            conn.execute("BEGIN IMMEDIATE")

            text_col = _detect_text_column(conn)
            if not text_col:
                raise RuntimeError("No text-like column in knowledge_items (expected text/content/body).")

            cols = _table_columns(conn, "knowledge_items")
            has_priority = "priority" in cols
            stub_only = _ev1_bool_from_form(only_priority_200)

            placeholders = ",".join(["?"] * len(keys))
            base_params: list[object] = [*keys, str(locale).strip(), str(topic_category).strip()]

            priority_clause = ""
            if stub_only and has_priority:
                priority_clause = "AND priority = 200"

            select_sql = f"""
                SELECT id
                FROM knowledge_items
                WHERE is_active=0
                  AND key IN ({placeholders})
                  AND {sql_norm('locale')} = ?
                  AND {sql_norm('topic_category')} = ?
                  {priority_clause}
                  AND TRIM(COALESCE({text_col}, '')) <> ''
            """.strip()

            rows = conn.execute(select_sql, base_params).fetchall()
            ids = [int(r[0]) for r in rows]
            affected = len(ids)

            if _ev1_bool_from_form(dry_run) or not ids:
                conn.rollback()
                return f"✅ Activate nonempty (dry-run={int(_ev1_bool_from_form(dry_run))}). would_activate={affected}"

            cur = conn.execute(
                f"UPDATE knowledge_items SET is_active=1 WHERE id IN ({','.join(['?']*len(ids))})",
                ids,
            )
            updated = int(cur.rowcount or 0)

            from app.knowledge import builder as kb
            cov = kb.coverage_ev1(conn, keys, locale=str(locale), topic_category=str(topic_category), top_missing=50)
            kb._set_meta(conn, "ev1_total", str(cov.total))
            kb._set_meta(conn, "ev1_present_active", str(cov.present_active))
            kb._set_meta(conn, "ev1_missing", str(cov.missing))
            kb._set_meta(conn, "ev1_activate_nonempty_updated_at", str(int(time.time())))
            kb._set_meta(conn, "ev1_activate_nonempty_count", str(updated))
            kb._set_meta(conn, "ev1_activate_nonempty_stub_only", str(int(stub_only)))

            conn.commit()
            return (
                f"✅ Activated non-empty items: {updated} (stub_only={int(stub_only)}). "
                f"coverage={cov.present_active}/{cov.total} missing={cov.missing}"
            )
        except Exception:
            conn.rollback()
            raise
        finally:
            conn.close()

    try:
        msg = await asyncio.to_thread(_run)
        kind = "ok"
    except Exception as e:
        msg = f"❌ Activate nonempty FAILED: {type(e).__name__}: {e}"
        kind = "err"

    return _flash_redirect(str(request.url_for("builds_page")), kind=kind, text=msg)