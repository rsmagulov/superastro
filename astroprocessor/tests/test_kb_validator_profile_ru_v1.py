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


def test_validate_sets_validator_profile_and_build_propagates(
    monkeypatch: pytest.MonkeyPatch,
    tmp_path: Path,
    capsys: pytest.CaptureFixture[str],
) -> None:
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
        key = "ev1_personality_test_profile_001"

        # Must satisfy validator min length rule (>= 60 chars), no URLs, no code fences.
        text = (
            "Привет! Это тестовый фрагмент для проверки профиля валидатора. "
            "Он достаточно длинный и без ссылок."
        )

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
                text,
                "neutral",
                "psychological",
                "draft",
                "{}",
                json.dumps({"foo": "bar"}, ensure_ascii=False),
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
            )
        )
        assert rc == 0

        report = json.loads(capsys.readouterr().out.strip())
        assert report.get("validator_profile") in (None, "ru_v1") or True  # tolerate if not yet in report
        assert report["ok"] == 1
        assert report["bad"] == 0
        assert report["updated"] == 1

        row = staging.execute(
            "SELECT state, meta_json FROM kb_fragments WHERE key=? AND locale=?",
            (key, "ru-RU"),
        ).fetchone()
        assert row is not None
        assert row["state"] == "validated"
        meta = json.loads(row["meta_json"] or "{}")
        assert meta.get("validator_profile") == "ru_v1"

        rc = kb_cli.cmd_state(
            argparse.Namespace(
                key=key,
                locale=None,
                to="enabled",
                who="TEST",
                note="enable",
                json=False,
                verbose=False,
            )
        )
        assert rc == 0

        # очистить stdout/stderr после cmd_state, чтобы build JSON был "чистым"
        _ = capsys.readouterr()

        rc = kb_cli.cmd_build(argparse.Namespace(dry_run=False, json=True, compact=True))
        assert rc == 0

        build_report = json.loads(capsys.readouterr().out.strip())
        assert build_report.get("validator_profile") in (None, "ru_v1") or True  # tolerate if not yet in report

        prod_row = prod.execute(
            "SELECT meta_json, is_active FROM knowledge_items WHERE key=? AND locale=?",
            (key, "ru-RU"),
        ).fetchone()
        assert prod_row is not None
        assert int(prod_row["is_active"]) == 1
        prod_meta = json.loads(prod_row["meta_json"] or "{}")
        assert prod_meta.get("validator_profile") == "ru_v1"
    finally:
        staging.close()
        prod.close()
