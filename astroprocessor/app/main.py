# astroprocessor/app/main.py
from __future__ import annotations

import os
from contextlib import asynccontextmanager
from pathlib import Path
from typing import Any

from fastapi import FastAPI, HTTPException, Request
from fastapi.exceptions import RequestValidationError
from fastapi.responses import JSONResponse
from fastapi.staticfiles import StaticFiles
from starlette.exceptions import HTTPException as StarletteHTTPException

from app.admin.ui.router import router as admin_ui_router
from .db import ASTRO_DB_PATH, KNOWLEDGE_DB_PATH, get_knowledge_session, get_session, init_db
from app.middleware.request_id import RequestIDMiddleware
from app.routers.admin_knowledge import router as admin_knowledge_router
from app.routers.admin_knowledge_items import router as admin_knowledge_items_router
from app.routers.keys import router as keys_router
from app.routers.natal import router as natal_router
from app.routers.place_resolve import router as place_router
from app.routers.public_v2 import router as public_v2_router
from app.settings import settings
from app.llm import SaigaEngine, SaigaGenConfig

class UTF8JSONResponse(JSONResponse):
    media_type = "application/json; charset=utf-8"


@asynccontextmanager
async def lifespan(app: FastAPI):
    await init_db()
    if not os.path.exists(KNOWLEDGE_DB_PATH):
        print(f"[WARN] Knowledge DB file not found: {KNOWLEDGE_DB_PATH}")
    # inside lifespan():
    if settings.llm_enabled:
        app.state.llm = SaigaEngine(
            model_dir=settings.llm_model_dir,
            adapter_dir=settings.llm_adapter_dir,
            cpu_offload=settings.llm_cpu_offload,
            gpu_mem_gb=settings.llm_gpu_mem_gb,
            gen=SaigaGenConfig(
                max_new_tokens=settings.llm_max_new_tokens,
                temperature=settings.llm_temperature,
                top_p=settings.llm_top_p,
                repetition_penalty=settings.llm_repetition_penalty,
            ),
        )
        # eager load (optional but recommended to fail fast)
        app.state.llm.load()
    yield


app = FastAPI(
    title="SuperAstro Astroprocessor",
    version="1.0.0",
    default_response_class=UTF8JSONResponse,
    lifespan=lifespan,
)

# ---------------------------------------------------------------------
# Error contract helpers
# ---------------------------------------------------------------------


def _req_id(request: Request) -> str:
    return getattr(request.state, "request_id", "")


def _base_error_meta(request: Request) -> dict[str, Any]:
    return {
        "request_id": _req_id(request),
        "path": request.url.path,
        "method": request.method,
    }


def _error_headers(request: Request) -> dict[str, str]:
    rid = _req_id(request)
    return {"X-Request-ID": rid} if rid else {}


def _structured_detail(*, code: str, message: str, meta: dict | None = None) -> dict[str, Any]:
    return {"code": code, "message": message, "meta": meta or {}}


def _normalize_http_code(status_code: int, raw_message: str) -> str:
    if status_code == 404 and raw_message == "Not Found":
        return "not_found"
    if status_code == 405 and raw_message == "Method Not Allowed":
        return "method_not_allowed"
    return raw_message


@app.exception_handler(RequestValidationError)
async def request_validation_error_handler(request: Request, exc: RequestValidationError):
    if not settings.structured_errors:
        # fastapi-like: detail is list of errors
        return JSONResponse(
            status_code=422,
            content={"detail": exc.errors()},
            headers=_error_headers(request),
        )

    meta = {**_base_error_meta(request), "errors": exc.errors()}
    detail = _structured_detail(
        code="request_validation_error",
        message="Request validation failed",
        meta=meta,
    )
    return JSONResponse(status_code=422, content={"detail": detail}, headers=_error_headers(request))


@app.exception_handler(HTTPException)
async def http_exception_handler(request: Request, exc: HTTPException):
    if not settings.structured_errors:
        return JSONResponse(
            status_code=exc.status_code,
            content={"detail": exc.detail},
            headers=_error_headers(request),
        )

    base_meta = _base_error_meta(request)

    if isinstance(exc.detail, dict):
        detail = dict(exc.detail)
        old_meta = detail.get("meta") if isinstance(detail.get("meta"), dict) else {}
        detail["meta"] = {**old_meta, **base_meta}
        return JSONResponse(status_code=exc.status_code, content={"detail": detail}, headers=_error_headers(request))

    raw_message = str(exc.detail) if exc.detail is not None else "http_exception"
    code = _normalize_http_code(exc.status_code, raw_message)
    detail = _structured_detail(code=code, message=raw_message, meta=base_meta)
    return JSONResponse(status_code=exc.status_code, content={"detail": detail}, headers=_error_headers(request))


@app.exception_handler(StarletteHTTPException)
async def starlette_http_exception_handler(request: Request, exc: StarletteHTTPException):
    if not settings.structured_errors:
        return JSONResponse(
            status_code=exc.status_code,
            content={"detail": exc.detail},
            headers=_error_headers(request),
        )

    base_meta = _base_error_meta(request)

    if isinstance(exc.detail, dict):
        detail = dict(exc.detail)
        old_meta = detail.get("meta") if isinstance(detail.get("meta"), dict) else {}
        detail["meta"] = {**old_meta, **base_meta}
        return JSONResponse(status_code=exc.status_code, content={"detail": detail}, headers=_error_headers(request))

    raw_message = str(exc.detail) if exc.detail is not None else "http_exception"
    code = _normalize_http_code(exc.status_code, raw_message)
    detail = _structured_detail(code=code, message=raw_message, meta=base_meta)
    return JSONResponse(status_code=exc.status_code, content={"detail": detail}, headers=_error_headers(request))


@app.exception_handler(Exception)
async def unhandled_exception_handler(request: Request, exc: Exception):
    if not settings.structured_errors:
        return JSONResponse(
            status_code=500,
            content={"detail": "Internal Server Error"},
            headers=_error_headers(request),
        )

    detail = _structured_detail(
        code="internal_server_error",
        message="Internal Server Error",
        meta=_base_error_meta(request),
    )
    return JSONResponse(status_code=500, content={"detail": detail}, headers=_error_headers(request))


# ---------------------------------------------------------------------
# Routers / middleware
# ---------------------------------------------------------------------

# middleware
app.add_middleware(RequestIDMiddleware)

# Public API v2
app.include_router(public_v2_router)

# API routers
app.include_router(place_router)
app.include_router(natal_router)
app.include_router(keys_router)

# admin API (JSON)
app.include_router(admin_knowledge_router)
app.include_router(admin_knowledge_items_router)

# admin UI (HTML/HTMX)
app.include_router(admin_ui_router, prefix="/admin/ui")

# static (mount only if exists)
BASE_DIR = Path(__file__).resolve().parent  # .../astroprocessor/app
static_dir = BASE_DIR / "admin" / "ui" / "static"
if static_dir.exists():
    _STATIC_DIR = Path(__file__).resolve().parent / "admin" / "ui" / "static"
    app.mount("/admin/static", StaticFiles(directory=str(_STATIC_DIR)), name="admin_static")
else:
    print(f"[WARN] Admin static dir not found, skipping mount: {static_dir}")


@app.get("/__routes")
def __routes():
    out: list[dict[str, Any]] = []
    for r in app.router.routes:
        path = getattr(r, "path", "")
        methods = sorted(list(getattr(r, "methods", []) or []))
        name = getattr(r, "name", "")
        out.append({"path": path, "methods": methods, "name": name})
    return out
