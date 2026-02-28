# tests/test_kb_sources_diagnose.py
from __future__ import annotations

import argparse
from pathlib import Path

import pytest

import app.knowledge.cli as kb_cli


def test_sources_diagnose_reports_garble(monkeypatch: pytest.MonkeyPatch, tmp_path: Path, capsys: pytest.CaptureFixture[str]) -> None:
    staging_path = tmp_path / "staging.db"
    monkeypatch.setattr(kb_cli, "_staging_db_path", lambda: staging_path)

    conn = kb_cli._connect(staging_path)
    try:
        kb_cli._ensure_staging_schema(conn)
        now = kb_cli._utcnow_iso()

        cur = conn.execute(
            """
            INSERT INTO kb_sources(title, source_type, locale, file_name, file_size, sha256, imported_at)
            VALUES(?,?,?,?,?,?,?)
            """.strip(),
            ("Book", "fb2", "ru-RU", "book.fb2", 1, "y" * 64, now),
        )
        sid = int(cur.lastrowid)

        # good chunk
        conn.execute(
            """
            INSERT INTO kb_source_chunks(source_id, seq, locale, text, sha256, char_start, char_end, created_at)
            VALUES(?,?,?,?,?,?,?,?) 
            """.strip(),
            (sid, 0, "ru-RU", "Нормальный русский текст без артефактов.", "a" * 64, 0, 40, now),
        )

        # garbled chunk
        garbled = "╩ръ т ётюх тЁхь ¤Єю ёфхырыш ..."

        conn.execute(
            """
            INSERT INTO kb_source_chunks(source_id, seq, locale, text, sha256, char_start, char_end, created_at)
            VALUES(?,?,?,?,?,?,?,?)
            """.strip(),
            (sid, 1, "ru-RU", garbled, "b" * 64, 40, 80, now),
        )

        conn.commit()
    finally:
        conn.close()

    rc = kb_cli.cmd_sources_diagnose(argparse.Namespace(
        source_id=sid,
        threshold=0.20,
        limit=10,
        json=True,
        compact=True,
    ))
    assert rc == 0
    payload = capsys.readouterr().out.strip()
    assert '"chunks_total":2' in payload.replace(" ", "")
    assert '"chunks_garbled":1' in payload.replace(" ", "")
