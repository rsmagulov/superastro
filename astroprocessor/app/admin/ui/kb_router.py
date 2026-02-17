# astroprocessor/app/admin/ui/kb_router.py
from __future__ import annotations

import hashlib
import json
from dataclasses import dataclass
from pathlib import Path
from typing import Any

from fastapi import APIRouter, Depends, Form, Request
from fastapi.responses import HTMLResponse, PlainTextResponse
from sqlalchemy import text
from sqlalchemy.ext.asyncio import AsyncSession
from starlette.templating import Jinja2Templates

from app.db import get_staging_session

router = APIRouter()

TEMPLATES_DIR = Path(__file__).resolve().parent / "templates"
templates = Jinja2Templates(directory=str(TEMPLATES_DIR))


def _sha256_text(s: str) -> str:
    h = hashlib.sha256()
    h.update((s or "").encode("utf-8"))
    return h.hexdigest()


def _json_load(s: Any) -> dict[str, Any]:
    if not s:
        return {}
    try:
        obj = json.loads(str(s))
        return obj if isinstance(obj, dict) else {}
    except Exception:
        return {}


@router.get("/kb/sources", response_class=HTMLResponse, name="kb_sources_page")
async def kb_sources_page(
    request: Request,
    session: AsyncSession = Depends(get_staging_session),
) -> HTMLResponse:
    rows = (
        await session.execute(
            text(
                """
                SELECT
                  s.id, s.title, s.source_type, s.locale, s.file_name, s.file_size, s.imported_at,
                  (SELECT COUNT(1) FROM kb_source_chunks c WHERE c.source_id=s.id) AS chunks_count,
                  (SELECT COUNT(1) FROM kb_fragments f WHERE f.source_id=s.id) AS fragments_count
                FROM kb_sources s
                ORDER BY s.id DESC
                LIMIT 500
                """
            )
        )
    ).mappings().all()

    return templates.TemplateResponse(
        "admin/kb_sources.html",
        {
            "request": request,
            "title": "KB Staging — Sources",
            "nav_active": "kb",
            "items": list(rows),
        },
    )


@router.get("/kb/source/{source_id}", response_class=HTMLResponse, name="kb_source_detail_page")
async def kb_source_detail_page(
    request: Request,
    source_id: int,
    session: AsyncSession = Depends(get_staging_session),
) -> HTMLResponse:
    src = (
        await session.execute(
            text(
                """
                SELECT id, title, source_type, locale, file_name, file_size, imported_at, meta_json
                FROM kb_sources
                WHERE id=:id
                """
            ),
            {"id": source_id},
        )
    ).mappings().first()

    if not src:
        return templates.TemplateResponse(
            "admin/kb_source_detail.html",
            {"request": request, "title": "KB Staging — Source", "nav_active": "kb", "source": None},
            status_code=404,
        )

    chunks = (
        await session.execute(
            text(
                """
                SELECT id, seq, locale, char_start, char_end, length(text) AS text_len
                FROM kb_source_chunks
                WHERE source_id=:sid
                ORDER BY seq ASC
                LIMIT 5000
                """
            ),
            {"sid": source_id},
        )
    ).mappings().all()

    frags = (
        await session.execute(
            text(
                """
                SELECT id, key, locale, state, topic_category, length(text) AS text_len, meta_json
                FROM kb_fragments
                WHERE source_id=:sid
                ORDER BY id DESC
                LIMIT 2000
                """
            ),
            {"sid": source_id},
        )
    ).mappings().all()

    return templates.TemplateResponse(
        "admin/kb_source_detail.html",
        {
            "request": request,
            "title": f"KB Staging — Source #{source_id}",
            "nav_active": "kb",
            "source": dict(src),
            "chunks": list(chunks),
            "fragments": [dict(r) | {"meta": _json_load(r.get("meta_json"))} for r in frags],
        },
    )

@router.get("/kb/source/{source_id}/chunks", response_class=HTMLResponse, name="kb_source_chunks_page")
async def kb_source_chunks_page(
    request: Request,
    source_id: int,
    session: AsyncSession = Depends(get_staging_session),
) -> HTMLResponse:
    src = (
        await session.execute(
            text(
                """
                SELECT id, title, source_type, locale, file_name, file_size, imported_at
                FROM kb_sources
                WHERE id=:id
                """
            ),
            {"id": source_id},
        )
    ).mappings().first()
    if not src:
        return templates.TemplateResponse(
            "admin/kb_source_overview.html",
            {"request": request, "title": "KB Staging — Source", "nav_active": "kb", "source": None},
            status_code=404,
        )

    rows = (
        await session.execute(
            text(
                """
                SELECT id, seq, locale, char_start, char_end, length(text) AS text_len
                FROM kb_source_chunks
                WHERE source_id=:sid
                ORDER BY seq ASC
                LIMIT 5000
                """
            ),
            {"sid": source_id},
        )
    ).mappings().all()

    return templates.TemplateResponse(
        "admin/kb_source_chunks.html",
        {
            "request": request,
            "title": f"KB Chunks — Source #{source_id}",
            "nav_active": "kb",
            "tab": "chunks",
            "source": dict(src),
            "chunks": list(rows),
        },
    )


@router.get("/kb/source/{source_id}/fragments", response_class=HTMLResponse, name="kb_source_fragments_page")
async def kb_source_fragments_page(
    request: Request,
    source_id: int,
    state: str | None = None,
    q: str | None = None,
    chunk_seq: str | None = None,  # важно: str, чтобы chunk_seq="" не давал 422
    session: AsyncSession = Depends(get_staging_session),
) -> HTMLResponse:
    src = (
        await session.execute(
            text(
                """
                SELECT id, title, source_type, locale, file_name, file_size, imported_at
                FROM kb_sources
                WHERE id=:id
                """
            ),
            {"id": source_id},
        )
    ).mappings().first()

    if not src:
        return templates.TemplateResponse(
            "admin/kb_source_overview.html",
            {"request": request, "title": "KB Staging — Source", "nav_active": "kb", "source": None},
            status_code=404,
        )

    where = ["source_id=:sid"]
    params: dict[str, Any] = {"sid": source_id}

    if state:
        where.append("state=:state")
        params["state"] = state

    if q:
        where.append("(key LIKE :q OR text LIKE :q)")
        params["q"] = f"%{q}%"

    chunk_seq_val: int | None = None
    if chunk_seq is not None:
        s = str(chunk_seq).strip()
        if s.isdigit():
            chunk_seq_val = int(s)

    if chunk_seq_val is not None:
        where.append("json_extract(meta_json, '$.chunk_seq') = :chunk_seq")
        params["chunk_seq"] = chunk_seq_val

    sql = f"""
        SELECT
          id, key, locale, state, topic_category, length(text) AS text_len, meta_json,
          json_extract(meta_json, '$.chunk_id')  AS chunk_id,
          json_extract(meta_json, '$.chunk_seq') AS chunk_seq,
          json_extract(meta_json, '$.char_start') AS char_start,
          json_extract(meta_json, '$.char_end')   AS char_end
        FROM kb_fragments
        WHERE {' AND '.join(where)}
        ORDER BY id DESC
        LIMIT 2000
    """.strip()

    rows = (await session.execute(text(sql), params)).mappings().all()
    fragments = [dict(r) | {"meta": _json_load(r.get("meta_json"))} for r in rows]

    return templates.TemplateResponse(
        "admin/kb_source_fragments.html",
        {
            "request": request,
            "title": f"KB Fragments — Source #{source_id}",
            "nav_active": "kb",
            "tab": "fragments",
            "source": dict(src),
            "fragments": fragments,
            "filters": {
                "state": state or "",
                "q": q or "",
                "chunk_seq": "" if chunk_seq_val is None else str(chunk_seq_val),
            },
        },
    )



# -------------------------
# HTMX: load editors
# -------------------------

@router.get("/kb/chunk/{chunk_id}", response_class=HTMLResponse, name="kb_chunk_editor")
async def kb_chunk_editor(
    request: Request,
    chunk_id: int,
    session: AsyncSession = Depends(get_staging_session),
) -> HTMLResponse:
    row = (
        await session.execute(
            text(
                """
                SELECT id, source_id, seq, locale, char_start, char_end, text, sha256
                FROM kb_source_chunks
                WHERE id=:id
                """
            ),
            {"id": chunk_id},
        )
    ).mappings().first()

    return templates.TemplateResponse(
        "admin/_kb_editor_chunk.html",
        {
            "request": request,
            "chunk": dict(row) if row else None,
        },
    )


@router.post("/kb/chunk/{chunk_id}/save", response_class=HTMLResponse, name="kb_chunk_save")
async def kb_chunk_save(
    request: Request,
    chunk_id: int,
    text_value: str = Form(..., alias="text"),
    session: AsyncSession = Depends(get_staging_session),
) -> HTMLResponse:
    new_text = (text_value or "").replace("\r\n", "\n").replace("\r", "\n")
    new_sha = _sha256_text(new_text)
    new_end = len(new_text)

    await session.execute(
        text(
            """
            UPDATE kb_source_chunks
            SET text=:t, sha256=:sha, char_end=:ce
            WHERE id=:id
            """
        ),
        {"t": new_text, "sha": new_sha, "ce": new_end, "id": chunk_id},
    )
    await session.commit()

    # возвращаем маленький “ok” блок в редактор
    return templates.TemplateResponse(
        "admin/_kb_save_ok.html",
        {"request": request, "what": f"chunk#{chunk_id} saved"},
    )


@router.get("/kb/fragment/{fragment_id}", response_class=HTMLResponse, name="kb_fragment_editor")
async def kb_fragment_editor(
    request: Request,
    fragment_id: int,
    session: AsyncSession = Depends(get_staging_session),
) -> HTMLResponse:
    row = (
        await session.execute(
            text(
                """
                SELECT
                  id,
                  source_id,
                  key,
                  locale,
                  state,
                  topic_category,
                  text,
                  meta_json,
                  json_extract(meta_json, '$.chunk_id')   AS chunk_id,
                  json_extract(meta_json, '$.chunk_seq')  AS chunk_seq,
                  json_extract(meta_json, '$.char_start') AS char_start,
                  json_extract(meta_json, '$.char_end')   AS char_end
                FROM kb_fragments
                WHERE id=:id
                """
            ),
            {"id": fragment_id},
        )
    ).mappings().first()

    data = dict(row) if row else None
    if data:
        data["meta"] = _json_load(data.get("meta_json"))

    return templates.TemplateResponse(
        "admin/_kb_editor_fragment.html",
        {"request": request, "frag": data},
    )


@router.post("/kb/fragment/{fragment_id}/save", response_class=HTMLResponse, name="kb_fragment_save")
async def kb_fragment_save(
    request: Request,
    fragment_id: int,
    text_value: str = Form(..., alias="text"),
    state_value: str = Form("", alias="state"),
    requires_rewrite_value: str | None = Form(None, alias="requires_rewrite"),
    meta_json_value: str = Form("", alias="meta_json"),
    session: AsyncSession = Depends(get_staging_session),
) -> HTMLResponse:
    new_text = (text_value or "").replace("\r\n", "\n").replace("\r", "\n").strip()
    new_meta_raw = (meta_json_value or "").strip()

    allowed_states = {"draft", "needs_review", "reviewed", "annotated", "validated", "enabled", "archived"}
    new_state = (state_value or "").strip() or "needs_review"
    if new_state not in allowed_states:
        new_state = "needs_review"

    meta_obj = _json_load(new_meta_raw)
    meta_obj["edited_in_admin_ui"] = True

    # checkbox: если пришёл параметр — считаем True
    meta_obj["requires_rewrite"] = requires_rewrite_value is not None

    await session.execute(
        text(
            """
            UPDATE kb_fragments
            SET text=:t, state=:s, meta_json=:m, updated_at=datetime('now')
            WHERE id=:id
            """
        ),
        {
            "t": new_text,
            "s": new_state,
            "m": json.dumps(meta_obj, ensure_ascii=False),
            "id": fragment_id,
        },
    )
    await session.commit()

    # ВАЖНО: возвращаем data-* для обновления строки в таблице без reload
    return HTMLResponse(
        f"""
        <span class="badge ok kb-save-ok"
              data-kb-saved="1"
              data-kind="fragment"
              data-id="{fragment_id}"
              data-state="{new_state}">
          saved
        </span>
        """
    )




