# =========================
# FILE: astroprocessor/tests/test_project_integrity_smoke.py
# =========================
from __future__ import annotations

import importlib
from pathlib import Path
from typing import Iterable

import pytest


def _import(mod: str):
    return importlib.import_module(mod)


def _project_roots() -> dict[str, Path]:
    """
    Returns:
      repo_root:   .../superastro
      astro_root:  .../superastro/astroprocessor
    """
    # this file: .../astroprocessor/tests/test_project_integrity_smoke.py
    astro_root = Path(__file__).resolve().parents[1]
    repo_root = astro_root.parent
    return {"repo_root": repo_root, "astro_root": astro_root}


def _any_exists(paths: Iterable[Path]) -> Path | None:
    for p in paths:
        if p.exists() and p.is_file():
            return p
    return None


def _assert_has_any(obj, names: list[str], *, label: str) -> str:
    for n in names:
        if hasattr(obj, n):
            return n
    pytest.fail(f"Missing required symbol for {label}: expected any of {names}, got {sorted(dir(obj))[:50]}...")


@pytest.mark.smoke
def test_builder_exports_not_truncated() -> None:
    """
    Regression guard: builder.py must keep core public API after refactors.
    We allow aliases/renames by accepting "any of" sets for each capability.
    """
    kb = _import("app.knowledge.builder")

    # Core, must exist (stable API expected by UI + CLI + tests)
    required_any = {
        "astro_root_resolver": ["_astro_root", "astro_root"],
        "ev1_keys_resolver": ["resolve_ev1_keys_file", "resolve_keys_file", "resolve_ev1_keys_path"],
        "load_keys_txt": ["load_keys_txt", "load_keys_file"],
        "coverage_ev1": ["coverage_ev1"],
        "coverage_breakdown_ev1": ["coverage_breakdown_ev1"],
        "export_missing_txt": ["export_missing_txt"],
        "export_missing_jsonl": ["export_missing_jsonl"],
        "ev1_data_issues": ["ev1_data_issues", "data_issues_ev1"],
    }

    for label, names in required_any.items():
        _assert_has_any(kb, names, label=label)

    # Seed/build plumbing: accept a couple naming variants
    optional_but_expected = {
        "schema_items_meta": ["ensure_schema_items_and_meta", "ensure_schema_items_meta", "ensure_schema_items"],
        "schema_meta": ["ensure_schema_meta", "ensure_schema_kb_meta", "ensure_schema_meta_only"],
        "meta_setter": ["_set_meta", "set_meta"],
        "seed_default": ["seed_default", "default_seed_ru", "seed_ru_default"],
        "seed_ev1": ["seed_ev1", "make_ev1_seed_items"],
        "import_books": ["import_books", "import_books_to_markdown"],
        "build_chunks": ["build_chunks", "build_docs_and_chunks"],
    }

    # these should exist in a “complete” builder; allow missing one or two, but not all
    present = 0
    for label, names in optional_but_expected.items():
        try:
            _assert_has_any(kb, names, label=label)
            present += 1
        except pytest.fail.Exception:
            pass

    assert present >= 5, "builder.py looks truncated: too many expected capabilities missing"


@pytest.mark.smoke
def test_admin_ui_router_imports_and_has_required_routes() -> None:
    """
    Regression guard: UI router must keep required endpoints.
    """
    ui = _import("app.admin.ui.router")
    assert hasattr(ui, "router"), "app.admin.ui.router must expose 'router'"

    r = ui.router
    paths = {getattr(rt, "path", None) for rt in getattr(r, "routes", [])}
    paths = {p for p in paths if p}

    required_paths = {
        # Builds + EV1 exports
        "/builds",
        "/builds/import_build",
        "/builds/seed",
        "/builds/seed_ev1",
        "/builds/ev1/missing.txt",
        "/builds/ev1/missing.jsonl",
        # Items UI
        "/items",
        "/items/table",
        "/items/select/{item_id}",
        "/items/bulk/set-tone",
        "/items/bulk/set-abstraction",
        "/items/bulk/set-active",
        "/items/bulk/set-topic-category",
        # Sources UI (existing)
        "/sources",
        "/sources/import",
        "/sources/{source_id}",
    }

    missing = sorted(required_paths - paths)
    if missing:
        pytest.fail(
            "Missing required UI routes (regression):\n"
            + "\n".join(f"- {m}" for m in missing)
            + "\n\nExisting routes:\n"
            + "\n".join(sorted(paths))
        )


@pytest.mark.smoke
def test_seed_keys_files_exist_in_expected_locations() -> None:
    """
    Regression guard: seed keys must remain in repo in at least one known location.
    """
    roots = _project_roots()
    repo_root = roots["repo_root"]
    astro_root = roots["astro_root"]

    ev1_candidates = [
        repo_root / "ev1_keys_unique.txt",
        astro_root / "ev1_keys_unique.txt",
        astro_root / "tools" / "knowledge" / "ev1_keys_unique.txt",
        astro_root / "tools" / "knowledge" / "seed_keys_core_v1.txt",  # fallback
    ]
    ev1_path = _any_exists(ev1_candidates)
    assert ev1_path is not None, (
        "EV1 keys file not found. Expected one of:\n" + "\n".join(str(p) for p in ev1_candidates)
    )

    core_candidates = [
        astro_root / "tools" / "knowledge" / "seed_keys_core_v1.txt",
        astro_root / "tools" / "knowledge" / "seed_keys_core_v2.txt",
    ]
    core_path = _any_exists(core_candidates)
    assert core_path is not None, (
        "Core seed keys file not found. Expected one of:\n" + "\n".join(str(p) for p in core_candidates)
    )


@pytest.mark.smoke
def test_builder_file_not_empty() -> None:
    """
    Super-cheap guard: builder.py must not be accidentally replaced by a stub.
    """
    kb = _import("app.knowledge.builder")
    p = Path(kb.__file__).resolve()
    assert p.exists(), f"builder module file missing: {p}"

    text = p.read_text(encoding="utf-8", errors="replace")
    # heuristic: real builder should be non-trivial
    assert len(text.splitlines()) >= 120, f"builder.py looks too small/truncated: {p} ({len(text.splitlines())} lines)"
    assert "def " in text and "class " in text, "builder.py looks suspicious: missing function/class definitions"


# =========================
# FILE: astroprocessor/pytest.ini
# (append/merge the markers section; keep existing settings)
# =========================
"""
[pytest]
markers =
    smoke: quick integrity checks (fast, no network, minimal IO)
"""
