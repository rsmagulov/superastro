from __future__ import annotations

import json
from typing import Any, Dict
from fastapi import APIRouter, Depends, HTTPException, Query
from requests import patch, session
from sqlalchemy.ext.asyncio import AsyncSession
from sqlalchemy.exc import IntegrityError

from app.db import get_knowledge_session
from app.schemas.admin_knowledge import (
    KnowledgeItemOut,
    KnowledgeItemCreate,
    KnowledgeItemPatch,
    KnowledgeItemListOut,
    BulkFillDefaultMetaRequest,
    BulkSetToneRequest,
    BulkSetAbstractionRequest,
    BulkTagRequest,
    BulkSetActiveRequest,
)
from app.services.admin_input_validator import (
    normalize_and_validate_meta_obj,
    validate_text_not_garbled,
    normalize_and_validate_meta_json,
)
from app.services.knowledge_items_admin_repo import KnowledgeItemsAdminRepo
from app.knowledge.meta_schema import ALLOWED_TONES, ALLOWED_ABSTRACTION_LEVELS

router = APIRouter(prefix="/admin/knowledge/items", tags=["admin-knowledge-items"])
repo = KnowledgeItemsAdminRepo()

def _meta_obj(meta_json: str) -> dict[str, Any]:
    try:
        obj = json.loads(meta_json or "{}")
        return obj if isinstance(obj, dict) else {}
    except Exception:
        return {}

@router.get("", response_model=KnowledgeItemListOut)
async def list_items(
    session: AsyncSession = Depends(get_knowledge_session),
    q: str | None = Query(default=None),
    locale: str | None = Query(default=None),
    topic_category: str | None = Query(default=None, description="__NULL__ чтобы выбрать NULL"),
    is_active: bool | None = Query(default=None),
    limit: int = Query(default=50, ge=1, le=200),
    offset: int = Query(default=0, ge=0),
):
    rows, total = await repo.list_items(
        session,
        q=q,
        locale=locale,
        topic_category=topic_category,
        is_active=is_active,
        limit=limit,
        offset=offset,
    )
    items = [
        KnowledgeItemOut(
            id=r.id,
            key=r.key,
            topic_category=r.topic_category,
            locale=r.locale,
            text=r.text,
            priority=r.priority,
            created_at=r.created_at,
            is_active=bool(r.is_active),
            meta_json=r.meta_json,
            meta=_meta_obj(r.meta_json),
        )
        for r in rows
    ]
    return KnowledgeItemListOut(items=items, total=total, limit=limit, offset=offset)

@router.get("/{item_id}", response_model=KnowledgeItemOut)
async def get_item(item_id: int, session: AsyncSession = Depends(get_knowledge_session)):
    r = await repo.get_item(session, item_id=item_id)
    if not r:
        raise HTTPException(status_code=404, detail="Не найдено")
    return KnowledgeItemOut(
        id=r.id,
        key=r.key,
        topic_category=r.topic_category,
        locale=r.locale,
        text=r.text,
        priority=r.priority,
        created_at=r.created_at,
        is_active=bool(r.is_active),
        meta_json=r.meta_json,
        meta=_meta_obj(r.meta_json),
    )

@router.post("", response_model=KnowledgeItemOut, status_code=201)
async def create_item(payload: KnowledgeItemCreate, session: AsyncSession = Depends(get_knowledge_session)):
    data = payload.model_dump()
    incoming_is_active = bool(data.get("is_active", True))

    # если пришёл meta (объект) — превращаем в meta_json и валидируем
    if data.get("meta") is not None:
        data["meta_json"] = normalize_and_validate_meta_obj(
            data["meta"],
            is_active=incoming_is_active,
            require_for_active=True,
        )
    else:
        data["meta_json"] = normalize_and_validate_meta_json(
            data.get("meta_json") or "{}",
            is_active=incoming_is_active,
            require_for_active=True,
        )

    data.pop("meta", None)


    validate_text_not_garbled(data["text"], "text")
    # meta может прийти как объект или как строка
    incoming_is_active = bool(data.get("is_active", True))

    if data.get("meta") is not None:
        data["meta_json"] = normalize_and_validate_meta_obj(
            data["meta"],
            is_active=incoming_is_active,
            require_for_active=True,
        )
    else:
        data["meta_json"] = normalize_and_validate_meta_json(
            data.get("meta_json") or "{}",
            is_active=incoming_is_active,
            require_for_active=True,
        )

    data.pop("meta", None)  # в БД meta не пишем

    data["meta_json"] = normalize_and_validate_meta_json(
        data.get("meta_json") or "{}",
        is_active=bool(data.get("is_active", True)),
        require_for_active=True,
    )
    # 1) Пытаемся INSERT (сначала самый быстрый путь)
    try:
        item_id = await repo.create_item(session, data=data)
        await session.commit()
        r = await repo.get_item(session, item_id=item_id)
        assert r is not None
        return KnowledgeItemOut(
            id=r.id,
            key=r.key,
            topic_category=r.topic_category,
            locale=r.locale,
            text=r.text,
            priority=r.priority,
            created_at=r.created_at,
            is_active=bool(r.is_active),
            meta_json=r.meta_json,
            meta=_meta_obj(r.meta_json),
        )
    except IntegrityError:
        # Конфликт уникальности -> апсёрт: обновляем существующую
        await session.rollback()

    # 2) Находим существующую запись по уникальному ключу
    existing_id = await repo.find_id_by_unique(
        session,
        key=data["key"],
        locale=data["locale"],
        topic_category=data.get("topic_category"),
    )
    if existing_id is None:
        # редкий случай: конфликт был, но найти не смогли
        raise HTTPException(status_code=409, detail="Конфликт уникальности, но запись не найдена для upsert")

    # 3) Обновляем поля (что именно перезаписываем — определяем здесь)
    patch = {
        "text": data["text"],
        "priority": int(data.get("priority", 100)),
        "is_active": bool(data.get("is_active", True)),
        "meta_json": data.get("meta_json") or "{}",
        # Важно: key/locale/topic_category НЕ меняем, это ключ уникальности.
    }

    # --- НОВОЕ: валидируем перед UPDATE ---
    validate_text_not_garbled(patch["text"], "text")
    patch["meta_json"] = normalize_and_validate_meta_json(
        patch["meta_json"],
        is_active=bool(patch["is_active"]),
        require_for_active=True,
    )
    # --------------------------------------

    try:
        ok = await repo.patch_item(session, item_id=existing_id, patch=patch)
        if not ok:
            raise HTTPException(status_code=404, detail="Не найдено")
        await session.commit()
    except IntegrityError:
        await session.rollback()
        raise HTTPException(status_code=409, detail="Конфликт уникальности при обновлении")

    r = await repo.get_item(session, item_id=existing_id)
    assert r is not None
    # Формально upsert мог быть update, но статус-код оставим 201 для простоты v1.
    return KnowledgeItemOut(
        id=r.id,
        key=r.key,
        topic_category=r.topic_category,
        locale=r.locale,
        text=r.text,
        priority=r.priority,
        created_at=r.created_at,
        is_active=bool(r.is_active),
        meta_json=r.meta_json,
        meta=_meta_obj(r.meta_json),
    )

@router.patch("/{item_id}", response_model=KnowledgeItemOut)
async def patch_item(item_id: int, payload: KnowledgeItemPatch, session: AsyncSession = Depends(get_knowledge_session)):
    patch = {k: v for k, v in payload.model_dump().items() if v is not None}
    
    # --- НОВОЕ: если правим text, защищаемся от "????" ---
    if "text" in patch and patch["text"] is not None:
        validate_text_not_garbled(str(patch["text"]), "text")
    # ----------------------------------------------------

    # --- НОВОЕ: meta_json валидируем с учётом is_active ---
    if "meta_json" in patch and patch["meta_json"] is not None:
        # определяем целевое is_active
        if "is_active" in patch and patch["is_active"] is not None:
            active_flag = bool(patch["is_active"])
        else:
            current = await repo.get_item(session, item_id=item_id)
            if not current:
                raise HTTPException(status_code=404, detail="Не найдено")
            active_flag = bool(current.is_active)

        patch["meta_json"] = normalize_and_validate_meta_json(
            str(patch["meta_json"]),
            is_active=active_flag,
            require_for_active=True,
        )
    # ------------------------------------------------------

    # --- НОВОЕ: если включаем is_active=1, но meta_json не трогали — проверим текущее ---
    if "is_active" in patch and patch["is_active"] is True and "meta_json" not in patch:
        current = await repo.get_item(session, item_id=item_id)
        if not current:
            raise HTTPException(status_code=404, detail="Не найдено")
        _ = normalize_and_validate_meta_json(
            current.meta_json or "{}",
            is_active=True,
            require_for_active=True,
        )
    # ----------------------------------------------------------------------------------

    # Если meta пришёл объектом — преобразуем в meta_json
    if "meta" in patch and patch["meta"] is not None:
        # определяем активность так же, как делали для meta_json
        if "is_active" in patch and patch["is_active"] is not None:
            active_flag = bool(patch["is_active"])
        else:
            current = await repo.get_item(session, item_id=item_id)
            if not current:
                raise HTTPException(status_code=404, detail="Не найдено")
            active_flag = bool(current.is_active)

        patch["meta_json"] = normalize_and_validate_meta_obj(
            patch["meta"],
            is_active=active_flag,
            require_for_active=True,
        )
        patch.pop("meta", None)

    try:
        ok = await repo.patch_item(session, item_id=item_id, patch=patch)
        if not ok:
            raise HTTPException(status_code=404, detail="Не найдено")
        await session.commit()
    except IntegrityError:
        await session.rollback()
        raise HTTPException(
            status_code=409,
            detail="Конфликт уникальности: key+locale+topic_category должны быть уникальны",
        )

    r = await repo.get_item(session, item_id=item_id)
    assert r is not None
    return KnowledgeItemOut(
        id=r.id,
        key=r.key,
        topic_category=r.topic_category,
        locale=r.locale,
        text=r.text,
        priority=r.priority,
        created_at=r.created_at,
        is_active=bool(r.is_active),
        meta_json=r.meta_json,
        meta=_meta_obj(r.meta_json),
    )

@router.delete("/{item_id}", status_code=204)
async def delete_item(item_id: int, session: AsyncSession = Depends(get_knowledge_session)):
    ok = await repo.delete_item(session, item_id=item_id)
    if not ok:
        raise HTTPException(status_code=404, detail="Не найдено")
    await session.commit()
    return None

@router.post("/bulk/fill-default-meta")
async def bulk_fill_default_meta(
    payload: BulkFillDefaultMetaRequest,
    session: AsyncSession = Depends(get_knowledge_session),
):
    meta = {
        "tone": payload.default_tone,
        "abstraction_level": payload.default_abstraction_level,
        "tags": [],
        "notes": "",
    }
    affected = await repo.bulk_fill_default_meta(
        session,
        only_active=payload.only_active,
        only_empty_meta=payload.only_empty_meta,
        meta_json_value=json.dumps(meta, ensure_ascii=False),
    )
    await session.commit()
    return {"ok": True, "affected": affected}

@router.post("/bulk/set-tone")
async def bulk_set_tone(req: BulkSetToneRequest, session: AsyncSession = Depends(get_knowledge_session)):
    if req.tone not in ALLOWED_TONES:
        raise HTTPException(status_code=400, detail="tone: недопустимое значение")

    f = req.filter
    affected = await repo.bulk_set_tone(
        session,
        q=f.q, locale=f.locale, topic_category=f.topic_category, is_active=f.is_active, ids=f.ids,
        tone=req.tone,
    )
    await session.commit()
    return {"ok": True, "affected": affected}

@router.post("/bulk/set-abstraction")
async def bulk_set_abstraction(req: BulkSetAbstractionRequest, session: AsyncSession = Depends(get_knowledge_session)):
    if req.abstraction_level not in ALLOWED_ABSTRACTION_LEVELS:
        raise HTTPException(status_code=400, detail="abstraction_level: недопустимое значение")

    f = req.filter
    affected = await repo.bulk_set_abstraction(
        session,
        q=f.q, locale=f.locale, topic_category=f.topic_category, is_active=f.is_active, ids=f.ids,
        abstraction_level=req.abstraction_level,
    )
    await session.commit()
    return {"ok": True, "affected": affected}

@router.post("/bulk/add-tag")
async def bulk_add_tag(req: BulkTagRequest, session: AsyncSession = Depends(get_knowledge_session)):
    tag = (req.tag or "").strip().lower()
    if not tag:
        raise HTTPException(status_code=400, detail="tag: пустой")
    if len(tag) > 40:
        raise HTTPException(status_code=400, detail="tag: слишком длинный")

    f = req.filter
    affected = await repo.bulk_add_tag(
        session,
        q=f.q, locale=f.locale, topic_category=f.topic_category, is_active=f.is_active, ids=f.ids,
        tag=tag,
    )
    await session.commit()
    return {"ok": True, "affected": affected}

@router.post("/bulk/remove-tag")
async def bulk_remove_tag(req: BulkTagRequest, session: AsyncSession = Depends(get_knowledge_session)):
    tag = (req.tag or "").strip().lower()
    if not tag:
        raise HTTPException(status_code=400, detail="tag: пустой")

    f = req.filter
    affected = await repo.bulk_remove_tag(
        session,
        q=f.q, locale=f.locale, topic_category=f.topic_category, is_active=f.is_active, ids=f.ids,
        tag=tag,
    )
    await session.commit()
    return {"ok": True, "affected": affected}

@router.post("/bulk/set-active")
async def bulk_set_active(req: BulkSetActiveRequest, session: AsyncSession = Depends(get_knowledge_session)):
    f = req.filter

    # 1) Если включаем — делаем preflight
    if req.is_active:
        bad_total, bad_ids = await repo.preflight_activate(
            session,
            q=f.q,
            locale=f.locale,
            topic_category=f.topic_category,
            ids=f.ids,
            allowed_tones=list(ALLOWED_TONES),
            allowed_abstraction=list(ALLOWED_ABSTRACTION_LEVELS),
            limit_bad_ids=50,
        )
        if bad_total > 0:
            raise HTTPException(
                status_code=400,
                detail={
                    "message": "Нельзя включить: у части записей нет валидных meta_json.tone/abstraction_level",
                    "bad_total": bad_total,
                    "bad_ids": bad_ids,
                },
            )

    # 2) Меняем флаг одним UPDATE
    affected = await repo.bulk_set_active(
        session,
        q=f.q,
        locale=f.locale,
        topic_category=f.topic_category,
        ids=f.ids,
        is_active=req.is_active,
    )
    await session.commit()
    return {"ok": True, "affected": affected}


