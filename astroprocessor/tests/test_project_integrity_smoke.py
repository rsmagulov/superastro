# astroprocessor/tests/test_project_integrity_smoke.py
"""
Project Integrity Smoke Tests

Goal: catch "refactor regressions" early:
- key files missing/renamed
- builder/router public API changed/removed
- Builds UI routes missing
- builds.html lost required placeholders

Run:
  cd astroprocessor
  pytest -q
"""

from __future__ import annotations

import importlib
import os
from dataclasses import dataclass
from pathlib import Path
from typing import Iterable, Sequence

import pytest


# ============================================================
# Helpers
# ============================================================

def _astro_root() -> Path:
    """
    Resolve astroprocessor/ directory independent of CWD.
    This file is at: astroprocessor/tests/test_*.py => parents[1] = astroprocessor/
    """
    return Path(__file__).resolve().parents[1]


def _repo_root() -> Path:
    return _astro_root().parent


def _read_text(path: Path) -> str:
    return path.read_text(encoding="utf-8", errors="replace")


@dataclass(frozen=True)
class RequiredAttr:
    module: str
    attrs: tuple[str, ...]


def _require_attrs(obj: object, attrs: Sequence[str]) -> list[str]:
    missing: list[str] = []
    for a in attrs:
        if not hasattr(obj, a):
            missing.append(a)
    return missing


def _import(module: str):
    try:
        return importlib.import_module(module)
    except Exception as e:
        pytest.fail(f"Failed to import module '{module}': {type(e).__name__}: {e}")


# ============================================================
# 1) Key files must exist
# ============================================================

@pytest.mark.smoke
def test_key_files_exist() -> None:
    astro = _astro_root()
    repo = _repo_root()

    required_paths = [
        # Core app
        astro / "app" / "main.py",
        astro / "app" / "db.py",
        astro / "app" / "settings.py",
        astro / "app" / "__init__.py",
        # Knowledge
        astro / "app" / "knowledge" / "builder.py",
        astro / "app" / "knowledge" / "__init__.py",
        # Admin UI
        astro / "app" / "admin" / "ui" / "router.py",
        astro / "app" / "admin" / "ui" / "templates" / "admin" / "builds.html",
        astro / "app" / "admin" / "ui" / "templates" / "admin" / "base.html",
        astro / "app" / "admin" / "ui" / "static" / "admin.css",
        astro / "app" / "admin" / "ui" / "static" / "admin.js",
        # DB
        astro / "data" / "knowledge.db",
        # EV1 keys (either in repo root or astroprocessor root, at least one)
        # We'll assert presence below.
    ]

    missing = [str(p) for p in required_paths if not p.exists()]
    if missing:
        pytest.fail("Missing required project files:\n" + "\n".join(missing))

    # EV1 keys file should exist at least in one location
    candidates = [
        repo / "ev1_keys_unique.txt",
        astro / "ev1_keys_unique.txt",
        astro / "tools" / "knowledge" / "seed_keys_core_v1.txt",
    ]
    if not any(p.exists() and p.is_file() for p in candidates):
        pytest.fail(
            "EV1 keys file not found. Expected one of:\n" + "\n".join(str(p) for p in candidates)
        )


# ============================================================
# 2) builder.py public API must exist (anti-“obrezali builder.py”)
# ============================================================

@pytest.mark.smoke
def test_builder_public_api() -> None:
    kb = _import("app.knowledge.builder")

    required = (
        # paths / keys
        "_astro_root",
        "resolve_ev1_keys_file",
        "load_keys_txt",
        # schema
        "ensure_schema_items",
        "ensure_schema_meta",
        "ensure_schema_docs_chunks",
        "ensure_schema_items_and_meta",
        "_set_meta",
        # EV1 metrics
        "coverage_ev1",
        "coverage_breakdown_ev1",
        "ev1_data_issues",
        "export_missing_txt",
        "export_missing_jsonl",
        # seed
        "apply_seed_ignore_unique",
        "seed_default",
        "make_ev1_seed_items",
        "seed_ev1",
        # pipeline
        "import_books",
        "build_chunks",
        # CLI
        "build_arg_parser",
        "main",
    )

    missing = _require_attrs(kb, required)
    if missing:
        pytest.fail(
            "builder.py missing required public API (regression):\n"
            + "\n".join(f"- {m}" for m in missing)
        )


@pytest.mark.smoke
def test_builder_ev1_resolve_default_works() -> None:
    """
    Ensure EV1 resolver returns a deterministic path candidate and does not crash.
    """
    kb = _import("app.knowledge.builder")
    p, exists = kb.resolve_ev1_keys_file(None)
    assert isinstance(p, Path)
    # exists may be False depending on repo layout, but should be a valid candidate path
    assert str(p)


# ============================================================
# 3) router.py public API + builds endpoints exist
# ============================================================

@pytest.mark.smoke
def test_admin_ui_router_imports_and_has_builds_routes() -> None:
    ui = _import("app.admin.ui.router")
    assert hasattr(ui, "router"), "app.admin.ui.router must expose 'router'"

    r = ui.router

    # Collect paths
    paths = {getattr(rt, "path", None) for rt in getattr(r, "routes", [])}
    # Some route objects may not have .path; filter None.
    paths = {p for p in paths if p}

    required_paths = {
        "/builds",
        "/builds/import_build",
        "/builds/seed",
        "/builds/seed_ev1",
        "/builds/ev1/missing.txt",
        "/builds/ev1/missing.jsonl",
    }

    missing = sorted(required_paths - paths)
    if missing:
        pytest.fail(
            "Missing required Builds UI routes (regression):\n"
            + "\n".join(f"- {m}" for m in missing)
            + "\n\nExisting routes:\n"
            + "\n".join(sorted(paths))
        )


# ============================================================
# 4) Template contract smoke: builds.html must contain key placeholders
# ============================================================

@pytest.mark.smoke
def test_builds_template_contract() -> None:
    """
    If someone edits builds.html and accidentally removes key placeholders,
    UI may silently degrade. Catch that.
    """
    tpl = _astro_root() / "app" / "admin" / "ui" / "templates" / "admin" / "builds.html"
    s = _read_text(tpl)

    required_snippets = [
        # EV1 form fields
        "name=\"keys_file\"",
        "{{ ev1_keys_file",
        "{{ ev1_locale",
        "{{ ev1_topic_category",
        # Live widget
        "ev1_keys_file_resolved",
        "ev1_total_live",
        "ev1_present_active_live",
        "ev1_missing_live",
        # Breakdown/missing
        "ev1_breakdown",
        "ev1_missing_keys",
        # Export links
        "/admin/ui/builds/ev1/missing.txt",
        "/admin/ui/builds/ev1/missing.jsonl",
    ]

    missing = [x for x in required_snippets if x not in s]
    if missing:
        pytest.fail(
            "builds.html missing required template contract fragments:\n"
            + "\n".join(f"- {m}" for m in missing)
        )


# ============================================================
# 5) DB file exists and is readable (smoke)
# ============================================================

@pytest.mark.smoke
def test_knowledge_db_is_readable() -> None:
    """
    Ensure knowledge.db exists and sqlite can open it.
    """
    db_path = Path(str(_import("app.settings").settings.knowledge_db_path))
    if not db_path.is_absolute():
        db_path = _astro_root() / db_path

    assert db_path.exists(), f"knowledge.db not found at: {db_path}"

    import sqlite3

    conn = sqlite3.connect(str(db_path))
    try:
        # Minimal sanity query. Tables might not exist in fresh DB, so don't hard-fail on schema.
        conn.execute("SELECT 1").fetchone()
    finally:
        conn.close()
