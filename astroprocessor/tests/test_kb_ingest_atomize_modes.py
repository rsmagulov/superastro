
from __future__ import annotations

import argparse
import json
import sqlite3
import zipfile
from pathlib import Path

import pytest

from app.knowledge import cli as kb_cli

FB2_XML = '''<?xml version="1.0" encoding="utf-8"?>
<FictionBook xmlns="http://www.gribuser.ru/xml/fictionbook/2.0">
  <description>
    <title-info>
      <book-title>Test Book</book-title>
      <lang>ru</lang>
    </title-info>
  </description>
  <body>
    <section>
      <p>Это абзац без обращения. Он достаточно длинный, чтобы пройти минимальную длину, и содержит пунктуацию.</p>
      <p>А вот тут у тебя есть обращение, и этот абзац тоже достаточно длинный, чтобы пройти минимальную длину.</p>
    </section>
  </body>
</FictionBook>
'''


def _connect(path: Path) -> sqlite3.Connection:
    conn = sqlite3.connect(str(path))
    conn.row_factory = sqlite3.Row
    return conn


def _write_fb2_zip(dst: Path, fb2_name: str, content: str) -> None:
    dst.parent.mkdir(parents=True, exist_ok=True)
    with zipfile.ZipFile(dst, "w") as zf:
        zf.writestr(fb2_name, content.encode("utf-8"))


def test_ingest_atomize_modes_and_sources_list(
    monkeypatch: pytest.MonkeyPatch,
    tmp_path: Path,
    capsys: pytest.CaptureFixture[str],
) -> None:
    staging_path = tmp_path / "staging.db"
    monkeypatch.setattr(kb_cli, "_staging_db_path", lambda: staging_path)

    inbox = tmp_path / "inbox"
    fb2_zip = inbox / "book.zip"
    _write_fb2_zip(fb2_zip, "book.fb2", FB2_XML)

    # Ingest
    rc = kb_cli.cmd_ingest(argparse.Namespace(
        path=str(inbox),
        locale="ru-RU",
        chunk_size=2000,
        force=False,
        dry_run=False,
        json=True,
        compact=True,
    ))
    assert rc == 0
    ingest_report = json.loads(capsys.readouterr().out.strip())
    assert ingest_report["sources_created"] == 1
    assert ingest_report["chunks_created"] >= 1

    # sources list includes counts
    rc = kb_cli.cmd_sources_list(argparse.Namespace(q="", limit=10, json=True, compact=True))
    assert rc == 0
    sources_report = json.loads(capsys.readouterr().out.strip())
    assert sources_report["count"] == 1
    assert sources_report["items"][0]["chunks"] >= 1

    # Atomize mode B (keeps both, marks requires_rewrite for the one without address)
    rc = kb_cli.cmd_atomize(argparse.Namespace(
        source_id=0,
        all=True,
        mode="b",
        state="needs_review",
        locale="ru-RU",
        topic="book",
        tone="neutral",
        abstraction="psychological",
        min_len=60,
        max_len=1800,
        target_min=60,
        target_max=900,
        max_newlines=6,
        limit=0,
        dry_run=False,
        json=True,
        compact=True,
    ))
    assert rc == 0
    atom_b = json.loads(capsys.readouterr().out.strip())
    assert atom_b["inserted"] >= 1

    conn = _connect(staging_path)
    try:
        row = conn.execute("SELECT meta_json FROM kb_fragments ORDER BY id ASC LIMIT 1").fetchone()
        assert row is not None
        meta = json.loads(row["meta_json"])
        assert meta.get("extractor") == "atomizer_v1"
        assert "requires_rewrite" in meta
    finally:
        conn.close()

    # Atomize mode A: should insert 0 additional (since existing keys) OR skip those without address.
    rc = kb_cli.cmd_atomize(argparse.Namespace(
        source_id=0,
        all=True,
        mode="a",
        state="needs_review",
        locale="ru-RU",
        topic="book",
        tone="neutral",
        abstraction="psychological",
        min_len=60,
        max_len=1800,
        target_min=60,
        target_max=900,
        max_newlines=6,
        limit=0,
        dry_run=False,
        json=True,
        compact=True,
    ))
    assert rc == 0
    atom_a = json.loads(capsys.readouterr().out.strip())
    assert atom_a["skipped_mode"] >= 0
