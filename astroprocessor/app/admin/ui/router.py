# app/admin/ui/router.py
from __future__ import annotations

import json
from typing import Optional, Any

from fastapi import APIRouter, Depends, Request, Form, HTTPException
from fastapi.responses import HTMLResponse
from fastapi.templating import Jinja2Templates
from sqlalchemy.ext.asyncio import AsyncSession

from app.db import get_knowledge_session

# TODO: импортируй реальные словари
from app.admin.knowledge.constants import ALLOWED_TONES, ALLOWED_ABSTRACTION_LEVELS  # пример

# TODO: замени на ваши реальные сервисы/репозитории
from app.admin.knowledge.service import KnowledgeAdminService  # пример

router = APIRouter()
templates = Jinja2Templates(directory="app/admin/ui/templates")

def _is_htmx(req: Request) -> bool:
    return req.headers.get("HX-Request", "").lower() == "true"

@router.get("/items", response_class=HTMLResponse)
async def items_page(
    request: Request,
    session: AsyncSession = Depends(get_knowledge_session),
    q: str = "",
    locale: str = "ru-RU",
    topic_category: str = "",
    is_active: str = "",
    selected: Optional[int] = None,
):
    svc = KnowledgeAdminService()

    # initial table
    items = await svc.list_items(
        session,
        q=q,
        locale=locale,
        topic_category=(topic_category or None),   # "" -> None
        is_active=(None if is_active == "" else (is_active == "1")),
        limit=50,
        offset=0,
    )

    selected_item = None
    if selected is not None:
        selected_item = await svc.get_item(session, selected)

    ctx = {
        "request": request,
        "items": items,
        "selected_item": selected_item,
        "filters": {"q": q, "locale": locale, "topic_category": topic_category, "is_active": is_active},
        "allowed_tones": ALLOWED_TONES,
        "allowed_abstraction_levels": ALLOWED_ABSTRACTION_LEVELS,
    }
    return templates.TemplateResponse("admin/items.html", ctx)

@router.get("/items/table", response_class=HTMLResponse)
async def items_table(
    request: Request,
    session: AsyncSession = Depends(get_knowledge_session),
    q: str = "",
    locale: str = "ru-RU",
    topic_category: str = "",
    is_active: str = "",
):
    svc = KnowledgeAdminService()
    items = await svc.list_items(
        session,
        q=q,
        locale=locale,
        topic_category=(topic_category or None),
        is_active=(None if is_active == "" else (is_active == "1")),
        limit=50,
        offset=0,
    )
    return templates.TemplateResponse(
        "admin/_items_table.html",
        {
            "request": request,
            "items": items,
        },
    )

@router.get("/items/editor/{item_id}", response_class=HTMLResponse)
async def item_editor(
    request: Request,
    item_id: int,
    session: AsyncSession = Depends(get_knowledge_session),
):
    svc = KnowledgeAdminService()
    item = await svc.get_item(session, item_id)
    if not item:
        raise HTTPException(status_code=404, detail="Not found")

    return templates.TemplateResponse(
        "admin/_item_editor.html",
        {
            "request": request,
            "item": item,
            "allowed_tones": ALLOWED_TONES,
            "allowed_abstraction_levels": ALLOWED_ABSTRACTION_LEVELS,
        },
    )

@router.post("/items/editor/{item_id}/save", response_class=HTMLResponse)
async def item_save(
    request: Request,
    item_id: int,
    session: AsyncSession = Depends(get_knowledge_session),
    text: str = Form(...),
    priority: int = Form(100),
    is_active: int = Form(0),
    tone: str = Form(""),
    abstraction_level: str = Form(""),
    tags: str = Form(""),   # comma-separated
    notes: str = Form(""),
):
    svc = KnowledgeAdminService()

    tags_list = [t.strip() for t in (tags or "").split(",") if t.strip()]
    meta_obj = {
        "tone": tone or None,
        "abstraction_level": abstraction_level or None,
        "tags": tags_list,
        "notes": notes or "",
    }

    # ВАЖНО: ваш инвариант — если is_active=1, tone/abstraction обязательны
    if is_active == 1 and (not tone or not abstraction_level):
        # UI-валидация должна быть, но серверная обязана тоже
        raise HTTPException(status_code=400, detail="Для активной записи нужны tone и abstraction_level")

    updated = await svc.patch_item(
        session,
        item_id=item_id,
        patch={
            "text": text,
            "priority": int(priority),
            "is_active": bool(is_active),
            "meta": meta_obj,  # сервис сам сериализует в meta_json
        },
    )

    # Триггерим перерисовку таблицы (HTMX)
    resp = templates.TemplateResponse(
        "admin/_item_editor.html",
        {
            "request": request,
            "item": updated,
            "allowed_tones": ALLOWED_TONES,
            "allowed_abstraction_levels": ALLOWED_ABSTRACTION_LEVELS,
            "flash": {"kind": "ok", "text": "Сохранено"},
        },
    )
    resp.headers["HX-Trigger"] = "itemsChanged"
    return resp

@router.post("/items/bulk/set-active", response_class=HTMLResponse)
async def bulk_set_active(
    request: Request,
    session: AsyncSession = Depends(get_knowledge_session),
    active: int = Form(...),  # 1/0
    ids: str = Form(""),      # "1,2,3"
):
    svc = KnowledgeAdminService()
    id_list = [int(x) for x in ids.split(",") if x.strip().isdigit()]
    if not id_list:
        raise HTTPException(status_code=400, detail="Нет выбранных строк")

    # ВАЖНО: preflight без force — как вы зафиксировали
    try:
        res = await svc.bulk_set_active(session, ids=id_list, active=bool(active))
    except svc.PreflightError as e:
        # Верни красиво в UI
        return templates.TemplateResponse(
            "admin/_flash.html",
            {"request": request, "flash": {"kind": "err", "text": f"Нельзя активировать: bad_total={e.bad_total}, bad_ids={e.bad_ids}"}},
        )

    resp = templates.TemplateResponse(
        "admin/_flash.html",
        {"request": request, "flash": {"kind": "ok", "text": f"Готово. affected={res.affected}"}},
    )
    resp.headers["HX-Trigger"] = "itemsChanged"
    return resp
