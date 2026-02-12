from __future__ import annotations

import os
from contextlib import asynccontextmanager
from pathlib import Path

from fastapi import FastAPI
from fastapi.responses import JSONResponse
from fastapi.staticfiles import StaticFiles

from app.admin.ui.router import router as admin_ui_router
from app.db import init_db
from app.middleware.request_id import RequestIDMiddleware
from app.routers.admin_knowledge import router as admin_knowledge_router
from app.routers.admin_knowledge_items import router as admin_knowledge_items_router
from app.routers.keys import router as keys_router
from app.routers.natal import router as natal_router
from app.routers.place_resolve import router as place_router
from app.settings import settings



class UTF8JSONResponse(JSONResponse):
    media_type = "application/json; charset=utf-8"

@asynccontextmanager
async def lifespan(app: FastAPI):
    await init_db()
    if not os.path.exists(settings.knowledge_db_path):
        print(f"[WARN] Knowledge DB file not found: {settings.knowledge_db_path}")
    yield

app = FastAPI(
    title="SuperAstro Astroprocessor",
    version="1.0.0",
    default_response_class=UTF8JSONResponse,
    lifespan=lifespan,
)
# middleware
app.add_middleware(RequestIDMiddleware)

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
    app.mount(
        "/admin/static",
        StaticFiles(directory=str(static_dir)),
        name="admin_static",
    )
else:
    print(f"[WARN] Admin static dir not found, skipping mount: {static_dir}")


@app.get("/__routes")
def __routes():
    out = []
    for r in app.router.routes:
        path = getattr(r, "path", "")
        methods = sorted(list(getattr(r, "methods", []) or []))
        name = getattr(r, "name", "")
        out.append({"path": path, "methods": methods, "name": name})
    return out




