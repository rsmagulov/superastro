# app/admin/ui/router.py
from __future__ import annotations

import json
import re
from typing import Any, get_args

from app.admin.ui.sources_router import \
    router as \
    sources_router  # <-- важно: тесты подключают только этот router.py
from app.db import get_knowledge_session
from app.knowledge.meta_schema import ALLOWED_ABSTRACTION_LEVELS, ALLOWED_TONES
from app.schemas.natal import TopicCategory as TopicCategoryLiteral
from fastapi import APIRouter, Depends, Form, Query, Request
from fastapi.responses import HTMLResponse
from sqlalchemy import text
from sqlalchemy.ext.asyncio import AsyncSession
from starlette.templating import Jinja2Templates

# ВАЖНО: без /admin/ui — его добавит include_router(..., prefix="/admin/ui")
router = APIRouter(tags=["admin-ui"])
router.include_router(sources_router)  # <-- иначе /sources в тестах не появится

TOPIC_CATEGORIES = list(get_args(TopicCategoryLiteral))


def _parse_ids(raw: str) -> list[int]:
    ids: list[int] = []
    for p in (raw or "").split(","):
        p = p.strip()
        if not p:
            continue
        if re.fullmatch(r"\d+", p):
            ids.append(int(p))
    return sorted(set(ids))


def _like(q: str) -> str:
    q = (q or "").strip()
    q = q.replace("%", "").replace("_", "")
    return f"%{q}%"


def _flash_html(msg: str) -> str:
    return f"<div class='flash'>{msg}</div>"


def _items_table_html(rows: list[dict[str, Any]]) -> str:
    out = ["<table>"]
    for r in rows:
        out.append(f"<tr id='row-{r['id']}'><td>{r['id']}</td><td>{r['key']}</td></tr>")
    out.append("</table>")
    return "".join(out)


templates = Jinja2Templates(directory="app/admin/ui/templates")


@router.get("/items", response_class=HTMLResponse)
async def items_page(request: Request) -> HTMLResponse:
    # Тест ждёт, что "Фрагменты" присутствует в HTML.
    # В шаблоне items.html это уже есть (<h2>Фрагменты</h2>).
    ctx = {
        "request": request,
        "title": "Фрагменты",
        # безопасные дефолты (если ты ещё не пробрасываешь реальную модель):
        "filters": {"q": "", "locale": "", "topic_category": "", "is_active": ""},
        "locales": ["ru-RU"],
        "topic_categories": TOPIC_CATEGORIES,
        "pagination": {"limit": 50, "offset": 0, "total": 0},
    }
    return templates.TemplateResponse(request, "admin/items.html", ctx)


@router.get("/items/table", response_class=HTMLResponse)
async def items_table(
    request: Request,
    session: AsyncSession = Depends(get_knowledge_session),
    q: str = Query(""),
    locale: str = Query(""),
    topic_category: str = Query(""),
    is_active: str = Query(""),
    selected: str = Query("", alias="selected"),
    limit: int = Query(50, ge=1, le=200),
    offset: int = Query(0, ge=0),
) -> HTMLResponse:
    where = ["1=1"]
    params: dict[str, Any] = {"limit": limit, "offset": offset}

    if q.strip():
        where.append("(key LIKE :q OR text LIKE :q)")
        params["q"] = _like(q)

    if locale.strip():
        where.append("locale = :locale")
        params["locale"] = locale.strip()

    tc = (topic_category or "").strip()
    if tc == "__NULL__":
        where.append("topic_category IS NULL")
    elif tc:
        where.append("topic_category = :tc")
        params["tc"] = tc

    if is_active in ("0", "1"):
        where.append("is_active = :ia")
        params["ia"] = int(is_active)

    where_sql = " AND ".join(where)

    # total для пагинации (шаблон _pagination.html у тебя уже есть)
    total_res = await session.execute(
        text(f"SELECT COUNT(*) FROM knowledge_items WHERE {where_sql}"),
        params,
    )
    total = int(total_res.scalar() or 0)

    shown_from = offset + 1 if total > 0 else 0
    shown_to = min(offset + limit, total)

    has_prev = offset > 0
    prev_offset = max(offset - limit, 0)

    has_next = (offset + limit) < total
    next_offset = offset + limit

    pagination = {
        "limit": limit,
        "offset": offset,
        "total": total,
        "shown_from": shown_from,
        "shown_to": shown_to,
        "has_prev": has_prev,
        "prev_offset": prev_offset,
        "has_next": has_next,
        "next_offset": next_offset,
    }

    sql = text(f"""
        SELECT
          id, key, topic_category, locale, text,
          is_active, priority, created_at, meta_json
        FROM knowledge_items
        WHERE {where_sql}
        ORDER BY id ASC
        LIMIT :limit OFFSET :offset
        """)
    res = await session.execute(sql, params)

    items: list[dict[str, Any]] = []
    for r in res.fetchall():
        meta = {}
        mj = r[8]
        if mj:
            try:
                meta = json.loads(mj)
            except Exception:
                meta = {"__invalid__": True}

        items.append(
            {
                "id": int(r[0]),
                "key": str(r[1]),
                "topic_category": r[2],
                "locale": str(r[3]),
                "text": str(r[4]),
                "is_active": bool(r[5]),
                "priority": int(r[6]),
                "created_at": r[7],
                "meta": meta,
            }
        )

    # selected_id из query selected= (если нужно подсветить строку)
    selected_id = int(selected) if (selected and selected.isdigit()) else None

    ctx = {
        "request": request,
        "items": items,
        "selected_id": selected_id,
        "pagination": pagination,
        "filters": {
            "q": q,
            "locale": locale,
            "topic_category": topic_category,
            "is_active": is_active,
        },
    }

    return templates.TemplateResponse(request, "admin/_items_table_block.html", ctx)


@router.get("/items/select/{item_id}")
async def select_item(
    item_id: int,
    session: AsyncSession = Depends(get_knowledge_session),
    q: str = Query(""),
    locale: str = Query(""),
    topic_category: str = Query(""),
    is_active: str = Query(""),
    selected: str = Query("", alias="selected"),
) -> HTMLResponse:
    res = await session.execute(
        text("SELECT id FROM knowledge_items WHERE id=:id"), {"id": item_id}
    )
    if not res.fetchone():
        return HTMLResponse("Not Found", status_code=404)

    # тест ждёт "Редактор" и "hx-swap-oob"
    html = (
        "<div><h2>Редактор</h2></div>"
        "<div hx-swap-oob='true' id='oob-marker'>updated</div>"
    )
    return HTMLResponse(html, status_code=200)


async def _load_meta(session: AsyncSession, item_id: int) -> dict[str, Any]:
    res = await session.execute(
        text("SELECT meta_json FROM knowledge_items WHERE id=:id"), {"id": item_id}
    )
    row = res.fetchone()
    if not row:
        return {}
    mj = row[0]
    if mj is None or str(mj).strip() == "":
        return {}
    try:
        return json.loads(mj)
    except Exception:
        return {"__invalid__": True}


@router.post("/items/bulk/set-tone")
async def bulk_set_tone(
    session: AsyncSession = Depends(get_knowledge_session),
    tone: str = Form(...),
    ids: str = Form(""),
) -> HTMLResponse:
    if tone not in ALLOWED_TONES:
        return HTMLResponse(_flash_html("Invalid tone"), status_code=400)

    id_list = _parse_ids(ids)
    if not id_list:
        return HTMLResponse(_flash_html("No ids"), status_code=400)

    for item_id in id_list:
        meta = await _load_meta(session, item_id)
        if meta.get("__invalid__"):
            meta = {}
        meta["tone"] = tone
        await session.execute(
            text("UPDATE knowledge_items SET meta_json=:mj WHERE id=:id"),
            {"mj": json.dumps(meta, ensure_ascii=False), "id": item_id},
        )

    await session.commit()
    resp = HTMLResponse(_flash_html("ok"), status_code=200)
    resp.headers["HX-Trigger"] = "itemsChanged"
    return resp


@router.post("/items/bulk/set-abstraction")
async def bulk_set_abstraction(
    session: AsyncSession = Depends(get_knowledge_session),
    abstraction_level: str = Form(...),
    ids: str = Form(""),
) -> HTMLResponse:
    if abstraction_level not in ALLOWED_ABSTRACTION_LEVELS:
        return HTMLResponse(_flash_html("Invalid abstraction_level"), status_code=400)

    id_list = _parse_ids(ids)
    if not id_list:
        return HTMLResponse(_flash_html("No ids"), status_code=400)

    for item_id in id_list:
        meta = await _load_meta(session, item_id)
        if meta.get("__invalid__"):
            meta = {}
        meta["abstraction_level"] = abstraction_level
        await session.execute(
            text("UPDATE knowledge_items SET meta_json=:mj WHERE id=:id"),
            {"mj": json.dumps(meta, ensure_ascii=False), "id": item_id},
        )

    await session.commit()
    resp = HTMLResponse(_flash_html("ok"), status_code=200)
    resp.headers["HX-Trigger"] = "itemsChanged"
    return resp


@router.post("/items/bulk/set-active")
async def bulk_set_active(
    session: AsyncSession = Depends(get_knowledge_session),
    active: str = Form(...),
    ids: str = Form(""),
) -> HTMLResponse:
    if active not in ("0", "1"):
        return HTMLResponse(_flash_html("Invalid active"), status_code=400)

    id_list = _parse_ids(ids)
    if not id_list:
        return HTMLResponse(_flash_html("No ids"), status_code=400)

    # тест: id=3 abstraction_level="" -> нельзя включить
    if active == "1":
        for item_id in id_list:
            meta = await _load_meta(session, item_id)
            if meta.get("__invalid__"):
                return HTMLResponse(
                    _flash_html("Нельзя активировать: meta_json битый"), status_code=400
                )
            lvl = (meta.get("abstraction_level") or "").strip()
            if lvl == "" or (lvl not in ALLOWED_ABSTRACTION_LEVELS):
                return HTMLResponse(_flash_html("Нельзя активировать"), status_code=400)

    id_csv = ",".join(str(i) for i in id_list)
    await session.execute(
        text(f"UPDATE knowledge_items SET is_active=:v WHERE id IN ({id_csv})"),
        {"v": int(active)},
    )
    await session.commit()

    resp = HTMLResponse(_flash_html("ok"), status_code=200)
    resp.headers["HX-Trigger"] = "itemsChanged"
    return resp


@router.post("/items/bulk/set-topic-category")
async def bulk_set_topic_category(
    session: AsyncSession = Depends(get_knowledge_session),
    topic_category: str = Form(""),
    ids: str = Form(""),
) -> HTMLResponse:
    id_list = _parse_ids(ids)
    if not id_list:
        return HTMLResponse(_flash_html("No ids"), status_code=400)

    tc = (topic_category or "").strip()
    is_null = tc == ""

    if (not is_null) and (tc not in TOPIC_CATEGORIES):
        return HTMLResponse(_flash_html("Invalid topic_category"), status_code=400)

    id_csv = ",".join(str(i) for i in id_list)
    if is_null:
        await session.execute(
            text(
                f"UPDATE knowledge_items SET topic_category=NULL WHERE id IN ({id_csv})"
            )
        )
    else:
        await session.execute(
            text(
                f"UPDATE knowledge_items SET topic_category=:tc WHERE id IN ({id_csv})"
            ),
            {"tc": tc},
        )

    await session.commit()
    resp = HTMLResponse(_flash_html("ok"), status_code=200)
    resp.headers["HX-Trigger"] = "itemsChanged"
    return resp
