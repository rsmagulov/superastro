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


def test_build_deactivates_only_managed_by_build(
    monkeypatch: pytest.MonkeyPatch,
    tmp_path: Path,
    capsys: pytest.CaptureFixture[str],
) -> None:
    staging_path = tmp_path / "staging.db"
    prod_path = tmp_path / "knowledge.db"

    # Force CLI to use temp DBs.
    monkeypatch.setattr(kb_cli, "_staging_db_path", lambda: staging_path)
    monkeypatch.setattr(kb_cli, "_prod_db_path", lambda: prod_path)

    staging = _connect(staging_path)
    prod = _connect(prod_path)
    try:
        kb_cli._ensure_staging_schema(staging)
        kb_cli._ensure_prod_schema(prod)

        now = kb_cli._utcnow_iso()

        # Staging tracks both keys, but none are enabled => both become candidates for deactivation.
        staging.execute(
            """
            INSERT INTO kb_fragments(
                key, locale, topic_category, text, tone, abstraction_level, state,
                factors_json, meta_json, created_at, updated_at
            ) VALUES (?,?,?,?,?,?,?,?,?,?,?)
            """,
            (
                "seeded_should_stay",
                "ru-RU",
                "ev1",
                "t",
                "neutral",
                "psychological",
                "archived",
                "{}",
                "{}",
                now,
                now,
            ),
        )
        staging.execute(
            """
            INSERT INTO kb_fragments(
                key, locale, topic_category, text, tone, abstraction_level, state,
                factors_json, meta_json, created_at, updated_at
            ) VALUES (?,?,?,?,?,?,?,?,?,?,?)
            """,
            (
                "managed_should_deactivate",
                "ru-RU",
                "ev1",
                "t",
                "neutral",
                "psychological",
                "archived",
                "{}",
                "{}",
                now,
                now,
            ),
        )
        staging.commit()

        # Prod seeded row: active, but NOT managed-by-build (no kb_fragment_id).
        prod.execute(
            """
            INSERT INTO knowledge_items(
                key, topic_category, locale, text, priority, created_at, is_active, meta_json
            ) VALUES (?,?,?,?,?,?,?,?)
            """,
            ("seeded_should_stay", "seed", "ru-RU", "seed text", 100, now, 1, "{}"),
        )

        # Prod managed row: active AND managed-by-build (kb_fragment_id in meta_json).
        prod.execute(
            """
            INSERT INTO knowledge_items(
                key, topic_category, locale, text, priority, created_at, is_active, meta_json
            ) VALUES (?,?,?,?,?,?,?,?)
            """,
            (
                "managed_should_deactivate",
                "ev1",
                "ru-RU",
                "managed text",
                200,
                now,
                1,
                json.dumps({"kb_fragment_id": 123, "tone": "neutral"}, ensure_ascii=False),
            ),
        )
        prod.commit()

        rc = kb_cli.cmd_build(argparse.Namespace(dry_run=False, json=True, compact=True))
        assert rc == 0

        report = json.loads(capsys.readouterr().out.strip())
        assert {"key": "managed_should_deactivate", "locale": "ru-RU"} in report["deactivated_items"]
        assert {"key": "seeded_should_stay", "locale": "ru-RU"} not in report["deactivated_items"]

        seeded = prod.execute(
            "SELECT is_active FROM knowledge_items WHERE key=? AND locale=?",
            ("seeded_should_stay", "ru-RU"),
        ).fetchone()
        assert int(seeded["is_active"]) == 1

        managed = prod.execute(
            "SELECT is_active FROM knowledge_items WHERE key=? AND locale=?",
            ("managed_should_deactivate", "ru-RU"),
        ).fetchone()
        assert int(managed["is_active"]) == 0

        assert int(report["skipped_not_managed"]) >= 1
    finally:
        staging.close()
        prod.close()
