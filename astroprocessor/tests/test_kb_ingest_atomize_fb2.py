from __future__ import annotations

import argparse
import json
import sqlite3
from pathlib import Path

import pytest

from app.knowledge import cli as kb_cli


def _connect(path: Path) -> sqlite3.Connection:
    conn = sqlite3.connect(str(path))
    conn.row_factory = sqlite3.Row
    return conn


def _write_fb2(path: Path, paras: list[str]) -> None:
    body = "\n".join(f"<p>{p}</p>" for p in paras)
    xml = f"""<?xml version="1.0" encoding="utf-8"?>
<FictionBook xmlns="http://www.gribuser.ru/xml/fictionbook/2.0">
  <description>
    <title-info>
      <book-title>Test Book</book-title>
      <lang>ru</lang>
    </title-info>
  </description>
  <body>
    <section>
      {body}
    </section>
  </body>
</FictionBook>
"""
    path.write_text(xml, encoding="utf-8")


def test_ingest_fb2_and_atomize_idempotent(
    monkeypatch: pytest.MonkeyPatch,
    tmp_path: Path,
    capsys: pytest.CaptureFixture[str],
) -> None:
    staging_path = tmp_path / "staging.db"
    monkeypatch.setattr(kb_cli, "_staging_db_path", lambda: staging_path)

    inbox = tmp_path / "inbox"
    inbox.mkdir()

    # Content long enough and with punctuation; no URL. Mode B does not require direct address.
    paras = [
        "Это первый абзац. Он достаточно длинный, чтобы пройти минимальный порог символов в атомизации.",
        "Это второй абзац. Он продолжает мысль и добавляет контекст, чтобы атом получился устойчивым.",
        "Это третий абзац. Здесь тоже есть пунктуация и нормальная длина.",
    ]
    fb2_path = inbox / "book.fb2"
    _write_fb2(fb2_path, paras)

    # First ingest
    rc = kb_cli.cmd_ingest(
        argparse.Namespace(
            path=str(inbox),
            locale="ru-RU",
            chunk_size=1000,
            force=False,
            dry_run=False,
            json=True,
            compact=True,
        )
    )
    assert rc == 0
    ingest1 = json.loads(capsys.readouterr().out.strip())
    assert ingest1["files_total"] == 1
    assert ingest1["sources_created"] == 1
    assert ingest1["chunks_created"] >= 1

    # Second ingest (idempotent: should reuse source and not recreate chunks)
    rc = kb_cli.cmd_ingest(
        argparse.Namespace(
            path=str(inbox),
            locale="ru-RU",
            chunk_size=1000,
            force=False,
            dry_run=False,
            json=True,
            compact=True,
        )
    )
    assert rc == 0
    ingest2 = json.loads(capsys.readouterr().out.strip())
    assert ingest2["sources_created"] == 0

    # Atomize (mode B): use --all to avoid relying on source_id discovery in test
    rc = kb_cli.cmd_atomize(
        argparse.Namespace(
            source_id=0,
            all=True,
            mode="b",
            state="needs_review",
            locale="",
            topic="book",
            tone="neutral",
            abstraction="psychological",
            min_len=120,
            max_len=1800,
            target_min=200,
            target_max=900,
            max_newlines=6,
            limit=0,
            dry_run=False,
            json=True,
            compact=True,
        )
    )
    assert rc == 0
    atom1 = json.loads(capsys.readouterr().out.strip())
    assert atom1["inserted"] > 0

    # Atomize again: should be idempotent (no new inserts, only skipped_existing)
    rc = kb_cli.cmd_atomize(
        argparse.Namespace(
            source_id=0,
            all=True,
            mode="b",
            state="needs_review",
            locale="",
            topic="book",
            tone="neutral",
            abstraction="psychological",
            min_len=120,
            max_len=1800,
            target_min=200,
            target_max=900,
            max_newlines=6,
            limit=0,
            dry_run=False,
            json=True,
            compact=True,
        )
    )
    assert rc == 0
    atom2 = json.loads(capsys.readouterr().out.strip())
    assert atom2["inserted"] == 0
    assert atom2["skipped_existing"] > 0

    # Quick DB sanity
    conn = _connect(staging_path)
    try:
        n_sources = conn.execute("SELECT COUNT(1) AS n FROM kb_sources").fetchone()["n"]
        n_chunks = conn.execute("SELECT COUNT(1) AS n FROM kb_source_chunks").fetchone()["n"]
        n_frags = conn.execute("SELECT COUNT(1) AS n FROM kb_fragments").fetchone()["n"]
        assert int(n_sources) == 1
        assert int(n_chunks) >= 1
        assert int(n_frags) >= 1
    finally:
        conn.close()
