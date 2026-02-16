# tests/test_kb_fragments_list_filters.py
from __future__ import annotations

import argparse
import json
from pathlib import Path

import pytest

import app.knowledge.cli as kb_cli


def _connect(path: Path):
    conn = kb_cli._connect(path)
    return conn


def test_fragments_list_supports_filters(monkeypatch: pytest.MonkeyPatch, tmp_path: Path, capsys: pytest.CaptureFixture[str]) -> None:
    staging_path = tmp_path / "staging.db"
    monkeypatch.setattr(kb_cli, "_staging_db_path", lambda: staging_path)

    conn = _connect(staging_path)
    try:
        kb_cli._ensure_staging_schema(conn)

        now = kb_cli._utcnow_iso()

        # minimal source
        cur = conn.execute(
            """
            INSERT INTO kb_sources(title, source_type, locale, file_name, file_size, sha256, imported_at)
            VALUES(?,?,?,?,?,?,?)
            """.strip(),
            ("Book", "fb2", "ru-RU", "book.fb2", 1, "x" * 64, now),
        )
        sid = int(cur.lastrowid)

        # fragment 1: needs_rewrite
        conn.execute(
            """
            INSERT INTO kb_fragments(
                key, locale, topic_category, text, tone, abstraction_level, state,
                factors_json, meta_json, created_at, updated_at, source_id
            ) VALUES(?,?,?,?,?,?,?,?,?,?,?,?)
            """.strip(),
            (
                "k1",
                "ru-RU",
                "book",
                "Текст без обращения, но requires_rewrite=true.",
                "neutral",
                "psychological",
                "needs_review",
                "{}",
                json.dumps({"requires_rewrite": True}, ensure_ascii=False),
                now,
                now,
                sid,
            ),
        )

        # fragment 2: bot_ready
        conn.execute(
            """
            INSERT INTO kb_fragments(
                key, locale, topic_category, text, tone, abstraction_level, state,
                factors_json, meta_json, created_at, updated_at, source_id
            ) VALUES(?,?,?,?,?,?,?,?,?,?,?,?)
            """.strip(),
            (
                "k2",
                "ru-RU",
                "book",
                "Ты можешь начать с малого и постепенно выстроить привычку.",
                "neutral",
                "psychological",
                "needs_review",
                "{}",
                json.dumps({"requires_rewrite": False}, ensure_ascii=False),
                now,
                now,
                sid,
            ),
        )

        conn.commit()
    finally:
        conn.close()

    # needs-rewrite-only
    rc = kb_cli.cmd_list(argparse.Namespace(
        state="",
        source_id=sid,
        topic="",
        locale="",
        key="",
        q="",
        limit=50,
        needs_rewrite_only=True,
        bot_ready_only=False,
    ))
    assert rc == 0
    out = capsys.readouterr().out
    assert "k1" in out
    assert "k2" not in out

    # bot-ready-only
    rc = kb_cli.cmd_list(argparse.Namespace(
        state="",
        source_id=sid,
        topic="",
        locale="",
        key="",
        q="",
        limit=50,
        needs_rewrite_only=False,
        bot_ready_only=True,
    ))
    assert rc == 0
    out = capsys.readouterr().out
    assert "k2" in out
    assert "k1" not in out
