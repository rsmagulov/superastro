# tests/test_kb_validator_profile_ru_v1_state_stdout.py

from __future__ import annotations

import argparse
import json
from pathlib import Path

import pytest

from app.knowledge import cli as kb_cli


def _connect(path: Path):
    import sqlite3

    conn = sqlite3.connect(path)
    conn.row_factory = sqlite3.Row
    return conn


def test_state_logs_go_to_stderr_not_stdout(monkeypatch: pytest.MonkeyPatch, tmp_path: Path, capsys: pytest.CaptureFixture[str]) -> None:
    staging_path = tmp_path / "staging.db"
    prod_path = tmp_path / "knowledge.db"

    monkeypatch.setattr(kb_cli, "_staging_db_path", lambda: staging_path)
    monkeypatch.setattr(kb_cli, "_prod_db_path", lambda: prod_path)

    staging = _connect(staging_path)
    prod = _connect(prod_path)
    try:
        kb_cli._ensure_staging_schema(staging)
        kb_cli._ensure_prod_schema(prod)

        now = kb_cli._utcnow_iso()
        key = "ev1_personality_test_state_stdout_001"

        staging.execute(
            """
            INSERT INTO kb_fragments(
                key, locale, topic_category, text, tone, abstraction_level, state,
                factors_json, meta_json, created_at, updated_at
            ) VALUES (?,?,?,?,?,?,?,?,?,?,?)
            """,
            (
                key,
                "ru-RU",
                "ev1",
                "Привет! Это тестовый фрагмент, достаточно длинный, без ссылок и без кода, чтобы пройти validate.",
                "neutral",
                "psychological",
                "draft",
                "{}",
                json.dumps({}, ensure_ascii=False),
                now,
                now,
            ),
        )
        staging.commit()

        rc = kb_cli.cmd_validate(
            argparse.Namespace(
                key=key,
                locale=None,
                state=None,
                limit=1000,
                who="TEST",
                note="validate",
                recheck=False,
                json=True,
                verbose=False,
                strict=False,
            )
        )
        assert rc == 0
        _ = capsys.readouterr()  # очистили буфер

        rc = kb_cli.cmd_state(
            argparse.Namespace(
                key=key,
                locale="ru-RU",
                to="enabled",
                who="TEST",
                note="enable",
                json=False,
                verbose=False,
            )
        )
        assert rc == 0

        out = capsys.readouterr().out.strip()
        assert out == ""  # stdout должен быть чистым
    finally:
        staging.close()
        prod.close()
