# astroprocessor/app/main.py
from __future__ import annotations

import os
os.environ.pop("TORCH_LOGS", None)
os.environ.pop("TORCH_LOGS_FORMAT", None)
os.environ.pop("TORCHINDUCTOR_LOG_LEVEL", None)
os.environ.setdefault("TORCH_DISABLE_ADDR2LINE", "1")
os.environ.setdefault("TORCH_LOGS", "")
os.environ.setdefault("TORCHINDUCTOR_COMPILE_THREADS", "1")
os.environ.setdefault("TORCHINDUCTOR_CACHE_DIR", "/tmp/torchinductor")
os.environ.setdefault("OMP_NUM_THREADS", "1")
os.environ.setdefault("MALLOC_ARENA_MAX", "1")
os.environ.setdefault("MKL_NUM_THREADS", "1")
os.environ.setdefault("TOKENIZERS_PARALLELISM", "false")
# VRAM fragmentation guard (important for 12GB cards)
os.environ.setdefault("PYTORCH_CUDA_ALLOC_CONF", "expandable_segments:True,max_split_size_mb:128")
import json
import asyncio
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
from app.routers.chat_v2 import router as chat_v2_router

class UTF8JSONResponse(JSONResponse):
    media_type = "application/json; charset=utf-8"


@asynccontextmanager
async def lifespan(app):
    # --- MUST initialize state attributes first ---
    app.state.llm = None
    app.state.llm_ready = False
    app.state.llm_loading = False

    # твоя остальная инициализация (db/migrations/etc) может быть выше/ниже — не критично

    if getattr(settings, "llm_enabled", False):
        from app.llm.saiga_engine import SaigaEngine, SaigaGenConfig

        gen = SaigaGenConfig(
            max_new_tokens=getattr(settings, "llm_max_new_tokens", 320),
            temperature=getattr(settings, "llm_temperature", 0.3),
            top_p=getattr(settings, "llm_top_p", 0.85),
            repetition_penalty=getattr(settings, "llm_repetition_penalty", 1.05),
        )

        app.state.llm = SaigaEngine(
            model_dir=settings.saiga_model_dir,
            adapter_dir=getattr(settings, "saiga_adapter_dir", None) or None,
            cpu_offload=settings.saiga_cpu_offload,
            gpu_mem_gb=settings.saiga_gpu_mem_gb,
            gen=gen,
        )

        async def _load_llm_bg():
            app.state.llm_loading = True
            try:
                await asyncio.to_thread(app.state.llm.load)
                # optional warmup
                await app.state.llm.generate_chat([{"role": "user", "content": "Привет"}])
                app.state.llm_ready = True
                print("[startup] LLM loaded in background")
            except Exception as e:
                print("[startup] LLM background load failed:", e)
                app.state.llm = None
            finally:
                app.state.llm_loading = False

        asyncio.create_task(_load_llm_bg())

    yield

    # shutdown
    # (если нужно — добавишь освобождение ресурсов)


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
    def _json_safe(obj):
        try:
            json.dumps(obj, ensure_ascii=False)
            return obj
        except Exception:
            return str(obj)

    raw_errors = exc.errors()
    safe_errors = []
    for e in raw_errors:
        e2 = dict(e)
        if "ctx" in e2 and isinstance(e2["ctx"], dict):
            e2["ctx"] = {k: _json_safe(v) for k, v in e2["ctx"].items()}
        e2["input"] = _json_safe(e2.get("input"))
        safe_errors.append(e2)

    detail = {
        "code": "request_validation_error",
        "message": "Request validation failed",
        "meta": {
            "request_id": getattr(request.state, "request_id", ""),
            "path": request.url.path,
            "method": request.method,
            "errors": safe_errors,
        },
    }
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

# Chat API v2
app.include_router(chat_v2_router)

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
