# app/knowledge/cli.py
"""
Knowledge Builder CLI.

Key rules:
- Only KB writes into production DB (knowledge.db). Staging is editable.
- JSON output goes to stdout; logs/errors go to stderr.
- No auto-enabled: ingest/atomize only create candidates (draft/needs_review).
- Provenance is mandatory: meta_json carries source/chunk offsets + hashes.
"""

from __future__ import annotations

import argparse
import datetime as dt
import hashlib
import io
import json
import os
import random
import re
import sqlite3
import sys
import textwrap
import zipfile
from dataclasses import dataclass
from pathlib import Path
from typing import Any, Iterable, Optional
from xml.etree import ElementTree as ET


# ----------------------------
# Constants
# ----------------------------

STAGING_SCHEMA_VERSION = 3
PROD_SCHEMA_VERSION = 1

VALIDATOR_PROFILE = "ru_v1"

DEFAULT_STAGING_PATH = Path("data/staging/staging.db")
DEFAULT_PROD_PATH = Path("data/knowledge.db")


# ----------------------------
# Helpers: io / time / json
# ----------------------------

def _utcnow_iso() -> str:
    return dt.datetime.now(dt.timezone.utc).replace(microsecond=0).isoformat().replace("+00:00", "Z")


def _connect(path: Path) -> sqlite3.Connection:
    path.parent.mkdir(parents=True, exist_ok=True)
    conn = sqlite3.connect(str(path))
    conn.row_factory = sqlite3.Row
    conn.execute("PRAGMA foreign_keys=ON")
    return conn


def _staging_db_path() -> Path:
    return DEFAULT_STAGING_PATH


def _prod_db_path() -> Path:
    return DEFAULT_PROD_PATH


def _json_load_dict(raw: Any) -> dict[str, Any]:
    if raw is None:
        return {}
    if isinstance(raw, dict):
        return raw
    s = str(raw).strip()
    if not s:
        return {}
    try:
        obj = json.loads(s)
        return obj if isinstance(obj, dict) else {}
    except Exception:
        return {}


def _json_dump(obj: Any, *, compact: bool = False) -> str:
    return json.dumps(obj, ensure_ascii=False, indent=None if compact else 2)


def _stderr(msg: str) -> None:
    print(msg, file=sys.stderr)


# ----------------------------
# Schema
# ----------------------------

def _ensure_staging_schema(conn: sqlite3.Connection) -> None:
    conn.execute(
        """
        CREATE TABLE IF NOT EXISTS kb_schema_meta(
            key TEXT PRIMARY KEY,
            value TEXT NOT NULL
        )
        """.strip()
    )
    cur = conn.execute("SELECT value FROM kb_schema_meta WHERE key='schema_version'").fetchone()
    current = int(cur["value"]) if cur else 0

    if current == 0:
        _create_staging_v1(conn)
        current = 1
        conn.execute("INSERT OR REPLACE INTO kb_schema_meta(key,value) VALUES('schema_version',?)", (str(current),))
        conn.commit()

    if current < 2:
        _migrate_staging_v1_to_v2(conn)
        current = 2
        conn.execute("UPDATE kb_schema_meta SET value=? WHERE key='schema_version'", (str(current),))
        conn.commit()

    if current < 3:
        _migrate_staging_v2_to_v3(conn)
        current = 3
        conn.execute("UPDATE kb_schema_meta SET value=? WHERE key='schema_version'", (str(current),))
        conn.commit()


def _create_staging_v1(conn: sqlite3.Connection) -> None:
    conn.execute(
        """
        CREATE TABLE IF NOT EXISTS kb_sources(
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            title TEXT NOT NULL,
            source_type TEXT,
            locale TEXT,
            file_name TEXT,
            file_size INTEGER,
            sha256 TEXT UNIQUE,
            imported_at TEXT NOT NULL
        )
        """.strip()
    )

    conn.execute(
        """
        CREATE TABLE IF NOT EXISTS kb_fragments(
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            key TEXT NOT NULL,
            locale TEXT NOT NULL,
            topic_category TEXT NOT NULL,
            text TEXT NOT NULL,
            tone TEXT NOT NULL,
            abstraction_level TEXT NOT NULL,
            state TEXT NOT NULL,
            factors_json TEXT NOT NULL DEFAULT '{}',
            meta_json TEXT NOT NULL DEFAULT '{}',
            created_at TEXT NOT NULL,
            updated_at TEXT NOT NULL,
            source_id INTEGER,
            author TEXT,
            UNIQUE(key, locale)
        )
        """.strip()
    )

    conn.execute(
        """
        CREATE TABLE IF NOT EXISTS kb_events(
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            fragment_id INTEGER NOT NULL,
            from_state TEXT,
            to_state TEXT,
            who TEXT,
            note TEXT,
            at TEXT NOT NULL,
            FOREIGN KEY(fragment_id) REFERENCES kb_fragments(id) ON DELETE CASCADE
        )
        """.strip()
    )

    conn.execute(
        """
        CREATE TABLE IF NOT EXISTS kb_builds(
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            at TEXT NOT NULL,
            dry_run INTEGER NOT NULL,
            enabled_count INTEGER NOT NULL,
            inserted_count INTEGER NOT NULL,
            updated_count INTEGER NOT NULL,
            deactivated_count INTEGER NOT NULL,
            report_json TEXT NOT NULL
        )
        """.strip()
    )


def _migrate_staging_v1_to_v2(conn: sqlite3.Connection) -> None:
    # Nothing heavy; keep placeholder for real migrations.
    # (We keep v2 as a historical step in this repo.)
    return


def _migrate_staging_v2_to_v3(conn: sqlite3.Connection) -> None:
    conn.execute(
        """
        CREATE TABLE IF NOT EXISTS kb_source_chunks(
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            source_id INTEGER NOT NULL,
            seq INTEGER NOT NULL,
            text TEXT NOT NULL,
            text_sha1 TEXT NOT NULL,
            char_start INTEGER NOT NULL,
            char_end INTEGER NOT NULL,
            garble_score REAL NOT NULL DEFAULT 0.0,
            garble_lines INTEGER NOT NULL DEFAULT 0,
            created_at TEXT NOT NULL,
            UNIQUE(source_id, seq),
            FOREIGN KEY(source_id) REFERENCES kb_sources(id) ON DELETE CASCADE
        )
        """.strip()
    )
    # Indexes for speed
    conn.execute("CREATE INDEX IF NOT EXISTS idx_kb_chunks_source_seq ON kb_source_chunks(source_id, seq)")
    conn.execute("CREATE INDEX IF NOT EXISTS idx_kb_fragments_source ON kb_fragments(source_id)")
    conn.execute("CREATE INDEX IF NOT EXISTS idx_kb_fragments_state ON kb_fragments(state)")


def _ensure_prod_schema(conn: sqlite3.Connection) -> None:
    conn.execute(
        """
        CREATE TABLE IF NOT EXISTS knowledge_items(
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            key TEXT NOT NULL,
            topic_category TEXT NOT NULL,
            locale TEXT NOT NULL,
            text TEXT NOT NULL,
            priority INTEGER NOT NULL DEFAULT 200,
            created_at TEXT NOT NULL,
            is_active INTEGER NOT NULL DEFAULT 1,
            meta_json TEXT NOT NULL DEFAULT '{}',
            UNIQUE(key, locale)
        )
        """.strip()
    )


# ----------------------------
# Validator (deterministic)
# ----------------------------

_URL_RE = re.compile(r"https?://", re.IGNORECASE)
_CODE_FENCE_RE = re.compile(r"```")
_PLACEHOLDER_RE = re.compile(r"\b(TODO|TBD|FIXME|PLACEHOLDER)\b", re.IGNORECASE)
_ALL_CAPS_TITLE_RE = re.compile(r"^[A-ZА-ЯЁ0-9 _-]{3,}$")
_DIRECT_ADDRESS_RE = re.compile(r"\b(ты|тебе|твой|твоя|твои|вас|вам|ваш|ваша|ваши|у\s+тебя|у\s+вас)\b", re.IGNORECASE)

# Domains even without scheme (mylablife.ru, vk.com/..., etc.)
_DOMAIN_RE = re.compile(
    r"(?i)\b(?:[a-z0-9](?:[a-z0-9-]{0,61}[a-z0-9])?\.)+"
    r"(?:ru|com|net|org|pro|io|mg|tv|me|info|biz)(?:/[^\s<>()\"']*)?"
)

# Box-drawing etc (common in garbled text)
_BOX_GARBLE_RE = re.compile(r"[\u2500-\u259f\u00a4]")


def _validate_fragment_row(r: sqlite3.Row) -> list[str]:
    text_ = str(r["text"] or "")
    t = text_.strip()
    errs: list[str] = []

    if len(t) < 60:
        errs.append("text too short (<60 chars)")
    if len(t) > 4000:
        errs.append("text too long (>4000 chars)")

    if _URL_RE.search(t) or _DOMAIN_RE.search(t):
        errs.append("contains URL/domain")

    if _CODE_FENCE_RE.search(t):
        errs.append("contains code fence")

    if _PLACEHOLDER_RE.search(t):
        errs.append("contains placeholder marker")

    # avoid big ALL-CAPS titles with more content below
    first_line = t.splitlines()[0].strip() if t.splitlines() else t
    if _ALL_CAPS_TITLE_RE.match(first_line) and len(t.splitlines()) > 1:
        errs.append("suspicious ALL-CAPS title line")

    # too many blank lines
    if "\n\n\n" in t:
        errs.append("too many blank lines")

    return errs


# ----------------------------
# Build managed-only helper
# ----------------------------

def _is_managed_by_build(meta_json: str) -> bool:
    meta = _json_load_dict(meta_json)
    return bool(meta.get("kb_fragment_id"))


# ----------------------------
# Commands: init/add/state/list/show/restore/validate/build
# ----------------------------

def cmd_init(_: argparse.Namespace) -> int:
    conn = _connect(_staging_db_path())
    try:
        _ensure_staging_schema(conn)
        _stderr(f"✅ staging ready: {_staging_db_path()}")
        return 0
    finally:
        conn.close()


def cmd_add(args: argparse.Namespace) -> int:
    conn = _connect(_staging_db_path())
    try:
        _ensure_staging_schema(conn)

        key = (args.key or "").strip()
        if not key:
            raise SystemExit("kb add: --key is required")

        locale = (args.locale or "ru-RU").strip() or "ru-RU"
        now = _utcnow_iso()

        meta = _json_load_dict(args.meta_json)
        factors = _json_load_dict(args.factors_json)

        conn.execute(
            """
            INSERT INTO kb_fragments(
                key, locale, topic_category, text, tone, abstraction_level, state,
                factors_json, meta_json, created_at, updated_at, source_id, author
            ) VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?)
            """.strip(),
            (
                key,
                locale,
                (args.topic or "book").strip() or "book",
                (args.text or "").strip(),
                (args.tone or "neutral").strip(),
                (args.abstraction or "psychological").strip(),
                (args.state or "draft").strip(),
                _json_dump(factors, compact=True),
                _json_dump(meta, compact=True),
                now,
                now,
                int(args.source_id) if args.source_id else None,
                (args.author or None),
            ),
        )
        conn.commit()
        _stderr(f"✅ add: key={key} locale={locale}")
        return 0
    finally:
        conn.close()


def cmd_state(args: argparse.Namespace) -> int:
    """State transition with strict barrier: only validated -> enabled."""
    key = (args.key or "").strip()
    if not key:
        raise SystemExit("kb state: --key is required")

    locale = (args.locale or "ru-RU").strip() or "ru-RU"
    to_state = (args.to or "").strip()
    if not to_state:
        raise SystemExit("kb state: --to is required")

    as_json = bool(getattr(args, "json", False))

    conn = _connect(_staging_db_path())
    try:
        _ensure_staging_schema(conn)

        row = conn.execute(
            "SELECT id, state FROM kb_fragments WHERE key=? AND locale=?",
            (key, locale),
        ).fetchone()
        if not row:
            if as_json:
                print(_json_dump({"ok": False, "error": "not_found", "key": key, "locale": locale}, compact=True))
            else:
                _stderr("ℹ️ not found in staging")
            return 0

        fid = int(row["id"])
        from_state = str(row["state"] or "")

        if to_state == "enabled" and from_state != "validated":
            if as_json:
                print(_json_dump({"ok": False, "error": "barrier", "from": from_state, "to": to_state}, compact=True))
            else:
                _stderr(f"❌ state: cannot go {from_state} -> enabled (must be validated)")
            return 2

        now = _utcnow_iso()
        conn.execute("UPDATE kb_fragments SET state=?, updated_at=? WHERE id=?", (to_state, now, fid))
        conn.execute(
            """
            INSERT INTO kb_events(fragment_id, from_state, to_state, who, note, at)
            VALUES (?,?,?,?,?,?)
            """.strip(),
            (fid, from_state, to_state, getattr(args, "who", "KB"), getattr(args, "note", ""), now),
        )
        conn.commit()

        if as_json:
            print(_json_dump({"ok": True, "key": key, "locale": locale, "from": from_state, "to": to_state}, compact=True))
        else:
            _stderr(f"✅ state: key={key} locale={locale} {from_state} -> {to_state}")
        return 0
    finally:
        conn.close()


def _print_rows(rows: Iterable[sqlite3.Row]) -> None:
    for r in rows:
        meta = _json_load_dict(r["meta_json"])
        tags = []
        if bool(meta.get("requires_rewrite")):
            tags.append("needs_rewrite")
        if _DIRECT_ADDRESS_RE.search(str(r["text"] or "")):
            tags.append("bot_ready")

        tag_s = ",".join(tags) if tags else "-"
        print(
            f"{int(r['id']):<8} {str(r['key']):<32} {str(r['topic_category']):<22} "
            f"{str(r['locale']):<7} {str(r['tone']):<10} {str(r['abstraction_level']):<13} "
            f"{str(r['state']):<12} {tag_s}"
        )
        print(f"        {str(r['created_at'])}")


def cmd_list(args: argparse.Namespace) -> int:
    conn = _connect(_staging_db_path())
    try:
        _ensure_staging_schema(conn)

        state = (getattr(args, "state", "") or "").strip()
        source_id = int(getattr(args, "source_id", 0) or 0)
        topic = (getattr(args, "topic", "") or "").strip()
        locale = (getattr(args, "locale", "") or "").strip()
        key = (getattr(args, "key", "") or "").strip()
        q = (getattr(args, "q", "") or "").strip()
        limit = int(getattr(args, "limit", 50) or 50)

        needs_rewrite_only = bool(getattr(args, "needs_rewrite_only", False))
        bot_ready_only = bool(getattr(args, "bot_ready_only", False))

        where: list[str] = []
        params: list[Any] = []

        if state:
            where.append("state=?")
            params.append(state)
        if source_id:
            where.append("source_id=?")
            params.append(source_id)
        if topic:
            where.append("topic_category=?")
            params.append(topic)
        if locale:
            where.append("locale=?")
            params.append(locale)
        if key:
            where.append("key=?")
            params.append(key)
        if q:
            where.append("(key LIKE ? OR text LIKE ?)")
            params.extend([f"%{q}%", f"%{q}%"])

        sql = f"""
            SELECT id, key, topic_category, locale, tone, abstraction_level, state, created_at, meta_json, text
            FROM kb_fragments
            WHERE {' AND '.join(where) if where else '1=1'}
            ORDER BY id DESC
            LIMIT ?
        """.strip()
        params.append(limit)

        rows = conn.execute(sql, params).fetchall()

        if needs_rewrite_only or bot_ready_only:
            filtered: list[sqlite3.Row] = []
            for r in rows:
                meta = _json_load_dict(r["meta_json"])
                is_needs = bool(meta.get("requires_rewrite", False))
                is_bot = bool(_DIRECT_ADDRESS_RE.search(str(r["text"] or "")))

                if needs_rewrite_only and not is_needs:
                    continue
                if bot_ready_only and not is_bot:
                    continue
                filtered.append(r)
            rows = filtered

        _print_rows(rows)
        return 0
    finally:
        conn.close()


def cmd_show(args: argparse.Namespace) -> int:
    key = (args.key or "").strip()
    if not key:
        raise SystemExit("kb show: --key is required")

    with_text = bool(getattr(args, "with_text", False))
    as_json = bool(getattr(args, "json", False))

    staging = _connect(_staging_db_path())
    prod = _connect(_prod_db_path())
    try:
        _ensure_staging_schema(staging)
        _ensure_prod_schema(prod)

        st_rows = staging.execute(
            """
            SELECT id, key, state, topic_category, locale, tone, abstraction_level, created_at, updated_at,
                   source_id, author, factors_json, meta_json, text
            FROM kb_fragments
            WHERE key=?
            ORDER BY id DESC
            LIMIT 20
            """.strip(),
            (key,),
        ).fetchall()

        pr_rows = prod.execute(
            """
            SELECT id, key, topic_category, locale, is_active, priority, created_at, meta_json, text
            FROM knowledge_items
            WHERE key=?
            ORDER BY id DESC
            LIMIT 20
            """.strip(),
            (key,),
        ).fetchall()

        if as_json:
            payload = {"key": key, "staging": [dict(r) for r in st_rows], "production": [dict(r) for r in pr_rows]}
            print(_json_dump(payload))
            return 0

        if not st_rows and not pr_rows:
            print("ℹ️ not found in staging or production")
            return 0

        if st_rows:
            print("=== STAGING (kb_fragments) ===")
            for r in st_rows:
                print(
                    f"- id={r['id']} state={r['state']} locale={r['locale']} topic={r['topic_category']} "
                    f"tone={r['tone']} ab={r['abstraction_level']} created={r['created_at']} updated={r['updated_at']}"
                )
                print(f"  source_id={r['source_id']} author={r['author']}")
                print(f"  factors_json={r['factors_json']}")
                print(f"  meta_json={r['meta_json']}")
                if with_text:
                    print("  text:")
                    print(str(r["text"] or ""))
                print()

        if pr_rows:
            print("=== PRODUCTION (knowledge_items) ===")
            for r in pr_rows:
                print(
                    f"- id={r['id']} active={r['is_active']} locale={r['locale']} topic={r['topic_category']} "
                    f"priority={r['priority']} created={r['created_at']}"
                )
                print(f"  meta_json={r['meta_json']}")
                if with_text:
                    print("  text:")
                    print(str(r["text"] or ""))
                print()

        return 0
    finally:
        staging.close()
        prod.close()


def cmd_validate(args: argparse.Namespace) -> int:
    conn = _connect(_staging_db_path())
    try:
        _ensure_staging_schema(conn)

        key = (args.key or "").strip()
        locale_arg = args.locale  # may be None
        state_arg = args.state    # may be None
        recheck = bool(getattr(args, "recheck", False))
        as_json = bool(getattr(args, "json", False))
        verbose = bool(getattr(args, "verbose", False))
        silent = recheck and as_json and not verbose

        def log(msg: str) -> None:
            if not silent:
                _stderr(msg)

        params: dict[str, Any] = {}
        where: list[str] = []

        if key:
            where.append("key = :key")
            params["key"] = key

            if locale_arg:
                where.append("locale = :loc")
                params["loc"] = str(locale_arg).strip()

            if state_arg:
                where.append("state = :state")
                params["state"] = str(state_arg).strip()
        else:
            locale = str(locale_arg or "ru-RU").strip()
            state = str(state_arg or "draft").strip()
            where.append("locale = :loc")
            params["loc"] = locale
            where.append("state = :state")
            params["state"] = state

        rows = conn.execute(
            f"""
            SELECT id, key, locale, topic_category, text, tone, abstraction_level, state,
                   factors_json, meta_json
            FROM kb_fragments
            WHERE {" AND ".join(where) if where else "1=1"}
            ORDER BY id ASC
            LIMIT :limit
            """.strip(),
            {**params, "limit": int(args.limit or 1000)},
        ).fetchall()

        if not rows:
            payload = {"validator_profile": VALIDATOR_PROFILE, "checked": 0, "ok": 0, "bad": 0, "updated": 0, "items": []}
            if as_json:
                print(_json_dump(payload, compact=True))
            else:
                log("ℹ️ nothing to validate")
            return 0

        ok_ids: list[int] = []
        bad_items: list[dict[str, Any]] = []
        ok_items: list[dict[str, Any]] = []

        for r in rows:
            errs = _validate_fragment_row(r)
            item = {
                "id": int(r["id"]),
                "key": str(r["key"]),
                "locale": str(r["locale"]),
                "state": str(r["state"]),
                "ok": not bool(errs),
                "errors": errs,
            }
            if errs:
                bad_items.append(item)
            else:
                ok_items.append(item)
                ok_ids.append(int(r["id"]))

        # RECHECK MODE: report only
        if recheck:
            payload = {
                "validator_profile": VALIDATOR_PROFILE,
                "checked": len(rows),
                "ok": len(ok_items),
                "bad": len(bad_items),
                "updated": 0,
                "items": ok_items + bad_items,
            }
            if as_json:
                print(_json_dump(payload, compact=bool(getattr(args, "compact", False))))
            else:
                log(f"recheck: checked={len(rows)} ok={len(ok_items)} bad={len(bad_items)}")
            return 0 if not bad_items else 1

        # MUTATING validate: ok -> validated + set meta.validator_profile
        now = _utcnow_iso()
        updated = 0
        for fid in ok_ids:
            cur = conn.execute("SELECT state, meta_json FROM kb_fragments WHERE id=?", (fid,)).fetchone()
            if not cur:
                continue
            old_state = str(cur["state"] or "")
            meta = _json_load_dict(cur["meta_json"])
            meta["validator_profile"] = VALIDATOR_PROFILE
            conn.execute(
                "UPDATE kb_fragments SET state='validated', meta_json=?, updated_at=? WHERE id=?",
                (_json_dump(meta, compact=True), now, fid),
            )
            conn.execute(
                """
                INSERT INTO kb_events(fragment_id, from_state, to_state, who, note, at)
                VALUES (?,?,?,?,?,?)
                """.strip(),
                (fid, old_state, "validated", getattr(args, "who", "KB"), getattr(args, "note", "validate"), now),
            )
            updated += 1

        conn.commit()

        payload = {
            "validator_profile": VALIDATOR_PROFILE,
            "checked": len(rows),
            "ok": len(ok_items),
            "bad": len(bad_items),
            "updated": updated,
            "items": ok_items + bad_items,
        }

        if as_json:
            print(_json_dump(payload, compact=bool(getattr(args, "compact", False))))
        else:
            log(f"✅ validate ok: checked={len(rows)} ok={len(ok_items)} updated={updated} bad={len(bad_items)}")

        return 0 if not bad_items else 1
    finally:
        conn.close()


def cmd_build(args: argparse.Namespace) -> int:
    dry_run = bool(getattr(args, "dry_run", False))
    as_json = bool(getattr(args, "json", False))
    compact = bool(getattr(args, "compact", False))

    staging = _connect(_staging_db_path())
    prod = _connect(_prod_db_path())
    try:
        _ensure_staging_schema(staging)
        _ensure_prod_schema(prod)

        if dry_run:
            prod.execute("BEGIN")

        enabled_rows = staging.execute(
            """
            SELECT id, key, locale, topic_category, text, tone, abstraction_level, source_id, author, created_at, meta_json
            FROM kb_fragments
            WHERE state='enabled'
            ORDER BY id ASC
            """.strip()
        ).fetchall()

        enabled = len(enabled_rows)
        inserted = 0
        updated = 0
        deactivated = 0
        skipped_not_managed = 0

        inserted_pairs: list[tuple[str, str]] = []
        updated_pairs: list[tuple[str, str]] = []
        deactivated_pairs: list[tuple[str, str]] = []

        for r in enabled_rows:
            key = str(r["key"])
            locale = str(r["locale"])
            topic = str(r["topic_category"])
            text_ = str(r["text"] or "")
            created_at = str(r["created_at"] or _utcnow_iso())

            st_meta = _json_load_dict(r["meta_json"])
            meta = {
                "tone": str(r["tone"]),
                "abstraction_level": str(r["abstraction_level"]),
                "validator_profile": st_meta.get("validator_profile"),
                "kb_fragment_id": int(r["id"]),
                "source_id": (int(r["source_id"]) if r["source_id"] is not None else None),
                "author": (str(r["author"]) if r["author"] is not None else None),
            }
            meta_json = _json_dump(meta, compact=True)

            cur = prod.execute(
                """
                UPDATE knowledge_items
                SET topic_category=?, text=?, priority=?, is_active=?, meta_json=?
                WHERE key=? AND locale=?
                """.strip(),
                (topic, text_, 200, 1, meta_json, key, locale),
            )
            if int(cur.rowcount or 0) > 0:
                updated += int(cur.rowcount or 0)
                updated_pairs.append((key, locale))
                continue

            prod.execute(
                """
                INSERT INTO knowledge_items(key, topic_category, locale, text, priority, created_at, is_active, meta_json)
                VALUES(?,?,?,?,?,?,?,?)
                """.strip(),
                (key, topic, locale, text_, 200, created_at, 1, meta_json),
            )
            inserted += 1
            inserted_pairs.append((key, locale))

        # deactivation: only records that are managed-by-build and present in staging but not enabled
        managed_pairs = staging.execute("SELECT DISTINCT key, locale FROM kb_fragments").fetchall()
        managed_set = {(str(r["key"]), str(r["locale"])) for r in managed_pairs}

        non_enabled_pairs = staging.execute(
            "SELECT DISTINCT key, locale FROM kb_fragments WHERE state != 'enabled'"
        ).fetchall()
        non_enabled_set = {(str(r["key"]), str(r["locale"])) for r in non_enabled_pairs}

        to_deactivate = managed_set & non_enabled_set

        if to_deactivate:
            cur_rows = prod.execute("SELECT key, locale, meta_json, is_active FROM knowledge_items").fetchall()
            for pr in cur_rows:
                pair = (str(pr["key"]), str(pr["locale"]))
                if pair not in to_deactivate:
                    continue

                if not _is_managed_by_build(str(pr["meta_json"] or "{}")):
                    skipped_not_managed += 1
                    continue

                if int(pr["is_active"] or 0) == 0:
                    continue

                prod.execute(
                    "UPDATE knowledge_items SET is_active=0 WHERE key=? AND locale=?",
                    (pair[0], pair[1]),
                )
                deactivated += 1
                deactivated_pairs.append(pair)

        report = {
            "dry_run": dry_run,
            "validator_profile": VALIDATOR_PROFILE,
            "enabled": enabled,
            "inserted": inserted,
            "updated": updated,
            "deactivated": deactivated,
            "skipped_not_managed": skipped_not_managed,
            "inserted_pairs": inserted_pairs[:200],
            "updated_pairs": updated_pairs[:200],
            "deactivated_pairs": deactivated_pairs[:200],
            "prod_path": str(_prod_db_path()),
        }

        # record build report into staging
        staging.execute(
            """
            INSERT INTO kb_builds(at, dry_run, enabled_count, inserted_count, updated_count, deactivated_count, report_json)
            VALUES (?,?,?,?,?,?,?)
            """.strip(),
            (_utcnow_iso(), 1 if dry_run else 0, enabled, inserted, updated, deactivated, _json_dump(report, compact=True)),
        )
        staging.commit()

        if dry_run:
            prod.execute("ROLLBACK")
        else:
            # keep lightweight build stats in production for quick diagnostics
            prod.execute("CREATE TABLE IF NOT EXISTS kb_meta (key TEXT PRIMARY KEY, value TEXT NOT NULL)")
            prod.execute(
                "INSERT OR REPLACE INTO kb_meta(key,value) VALUES(?,?)",
                ("updated_at", dt.datetime.utcnow().replace(microsecond=0).isoformat() + "Z"),
            )
            prod.execute("INSERT OR REPLACE INTO kb_meta(key,value) VALUES(?,?)", ("enabled", str(enabled)))
            prod.execute("INSERT OR REPLACE INTO kb_meta(key,value) VALUES(?,?)", ("inserted", str(inserted)))
            prod.execute("INSERT OR REPLACE INTO kb_meta(key,value) VALUES(?,?)", ("updated", str(updated)))
            prod.execute("INSERT OR REPLACE INTO kb_meta(key,value) VALUES(?,?)", ("deactivated", str(deactivated)))
            prod.commit()

        if as_json:
            print(_json_dump(report, compact=compact))
        else:
            _stderr(
                f"build: enabled={enabled} inserted={inserted} updated={updated} deactivated={deactivated} "
                f"skipped_not_managed={skipped_not_managed}"
            )
        return 0
    finally:
        staging.close()
        prod.close()


# ----------------------------
# Ingest / Atomize (FB2)
# ----------------------------

def _sha256_bytes(data: bytes) -> str:
    h = hashlib.sha256()
    h.update(data)
    return h.hexdigest()


def _sha1_text(s: str) -> str:
    h = hashlib.sha1()
    h.update(s.encode("utf-8"))
    return h.hexdigest()


def _read_bytes(path: Path) -> bytes:
    return path.read_bytes()


def _extract_fb2_from_zip(zip_path: Path) -> bytes:
    with zipfile.ZipFile(zip_path, "r") as zf:
        names = [n for n in zf.namelist() if n.lower().endswith(".fb2")]
        if not names:
            raise ValueError("zip does not contain .fb2")
        with zf.open(names[0], "r") as fp:
            return fp.read()


def _normalize_text(s: str) -> str:
    s = (s or "").replace("\r\n", "\n").replace("\r", "\n")
    s = re.sub(r"[ \t]+", " ", s)
    s = re.sub(r"\n{3,}", "\n\n", s)
    return s.strip()


@dataclass(frozen=True)
class GarbleInfo:
    score: float
    bad_lines: int


def _garble_info(text: str) -> GarbleInfo:
    """
    Heuristic:
    - counts box-drawing/currency artifacts (╩╦…/¤ etc)
    - counts replacement chars � and very low ratio of letters to all non-space
    """
    t = text or ""
    if not t:
        return GarbleInfo(0.0, 0)

    lines = [ln for ln in t.splitlines() if ln.strip()]
    if not lines:
        return GarbleInfo(0.0, 0)

    bad = 0
    for ln in lines:
        if "�" in ln or _BOX_GARBLE_RE.search(ln):
            bad += 1
            continue
        # very low letter ratio often indicates garble
        non_space = re.sub(r"\s+", "", ln)
        if not non_space:
            continue
        letters = re.findall(r"[A-Za-zА-Яа-яЁё]", non_space)
        if len(letters) / max(1, len(non_space)) < 0.35:
            bad += 1

    score = bad / max(1, len(lines))
    return GarbleInfo(score=float(score), bad_lines=int(bad))


def _fb2_to_text(fb2_bytes: bytes) -> str:
    # FB2 is XML, often UTF-8; allow recover.
    try:
        root = ET.fromstring(fb2_bytes)
    except Exception:
        # fallback decode as utf-8 with replace and parse
        s = fb2_bytes.decode("utf-8", errors="replace")
        root = ET.fromstring(s.encode("utf-8"))

    ns = ""
    if root.tag.startswith("{") and "}" in root.tag:
        ns = root.tag.split("}")[0] + "}"

    paras: list[str] = []
    for p in root.findall(f".//{ns}p"):
        txt = "".join(p.itertext())
        txt = _normalize_text(txt)
        if txt:
            paras.append(txt)
    return "\n\n".join(paras)


def cmd_ingest(args: argparse.Namespace) -> int:
    path = Path(getattr(args, "path", "") or "")
    if not path.exists():
        _stderr(f"ERROR: path not found: {path}")
        return 2

    default_locale = (getattr(args, "locale", "") or "ru-RU").strip() or "ru-RU"
    chunk_size = int(getattr(args, "chunk_size", 6000) or 6000)
    dry_run = bool(getattr(args, "dry_run", False))
    as_json = bool(getattr(args, "json", False))
    compact = bool(getattr(args, "compact", False))
    force = bool(getattr(args, "force", False))

    files: list[Path] = []
    if path.is_dir():
        for p in sorted(path.rglob("*")):
            if p.is_file() and (p.suffix.lower() in {".fb2", ".zip"}):
                files.append(p)
    else:
        files = [path]

    conn = _connect(_staging_db_path())
    try:
        _ensure_staging_schema(conn)
        started_at = _utcnow_iso()

        sources_created = 0
        sources_reused = 0
        chunks_created = 0
        errors: list[dict[str, Any]] = []

        for fp in files:
            try:
                raw = _read_bytes(fp)
                fb2_bytes = raw
                source_type = "fb2"
                if fp.suffix.lower() == ".zip":
                    fb2_bytes = _extract_fb2_from_zip(fp)
                    source_type = "fb2.zip"

                sha = _sha256_bytes(fb2_bytes)
                file_size = fp.stat().st_size
                file_name = fp.name

                row = conn.execute("SELECT id FROM kb_sources WHERE sha256=?", (sha,)).fetchone()
                if row:
                    source_id = int(row["id"])
                    sources_reused += 1
                    if force and not dry_run:
                        conn.execute("DELETE FROM kb_source_chunks WHERE source_id=?", (source_id,))
                else:
                    sources_created += 1
                    now = _utcnow_iso()
                    if not dry_run:
                        cur = conn.execute(
                            """
                            INSERT INTO kb_sources(title, source_type, locale, file_name, file_size, sha256, imported_at)
                            VALUES(?,?,?,?,?,?,?)
                            """.strip(),
                            (fp.name, source_type, default_locale, file_name, int(file_size), sha, now),
                        )
                        source_id = int(cur.lastrowid)
                    else:
                        source_id = -1  # placeholder

                text = _fb2_to_text(fb2_bytes)
                text = _normalize_text(text)

                # chunk into kb_source_chunks
                if not dry_run:
                    char_start = 0
                    seq = 0
                    while char_start < len(text):
                        chunk = text[char_start: char_start + chunk_size]
                        char_end = min(len(text), char_start + len(chunk))
                        g = _garble_info(chunk)
                        conn.execute(
                            """
                            INSERT OR REPLACE INTO kb_source_chunks(
                                source_id, seq, text, text_sha1, char_start, char_end, garble_score, garble_lines, created_at
                            ) VALUES (?,?,?,?,?,?,?,?,?)
                            """.strip(),
                            (
                                int(source_id),
                                int(seq),
                                chunk,
                                _sha1_text(chunk),
                                int(char_start),
                                int(char_end),
                                float(g.score),
                                int(g.bad_lines),
                                started_at,
                            ),
                        )
                        chunks_created += 1
                        seq += 1
                        char_start = char_end

                if not dry_run:
                    conn.commit()

            except Exception as e:
                errors.append({"file": str(fp), "error": f"{type(e).__name__}: {e}"})

        payload = {
            "dry_run": dry_run,
            "files_total": len(files),
            "sources_created": sources_created,
            "sources_reused": sources_reused,
            "chunks_created": chunks_created,
            "errors": errors,
        }

        if as_json:
            print(_json_dump(payload, compact=compact))
        else:
            _stderr(f"ingest: files={len(files)} sources_created={sources_created} sources_reused={sources_reused} chunks={chunks_created}")
        return 0 if not errors else 1
    finally:
        conn.close()


def _split_into_atoms(text: str, *, target_min: int, target_max: int, max_newlines: int) -> list[str]:
    """
    Mode B: generate many candidates; some require rewrite.
    Uses paragraph grouping + sentence splits when too long.
    """
    t = _normalize_text(text)
    if not t:
        return []

    paras = [p.strip() for p in t.split("\n\n") if p.strip()]
    atoms: list[str] = []

    buf: list[str] = []
    buf_len = 0

    def flush() -> None:
        nonlocal buf, buf_len
        if not buf:
            return
        s = "\n\n".join(buf).strip()
        if s:
            atoms.append(s)
        buf = []
        buf_len = 0

    for p in paras:
        if len(p) > target_max * 1.4:
            # split by sentences
            parts = re.split(r"(?<=[\.\!\?…])\s+", p)
            cur = ""
            for part in parts:
                if not part.strip():
                    continue
                if not cur:
                    cur = part
                elif len(cur) + 1 + len(part) <= target_max:
                    cur = f"{cur} {part}"
                else:
                    atoms.append(cur.strip())
                    cur = part
            if cur.strip():
                atoms.append(cur.strip())
            continue

        if buf_len + len(p) + 2 <= target_max:
            buf.append(p)
            buf_len += len(p) + 2
            continue

        flush()
        buf.append(p)
        buf_len = len(p)

        if buf_len >= target_min:
            flush()

    flush()

    # post: clamp newlines
    out: list[str] = []
    for a in atoms:
        if a.count("\n") > max_newlines:
            # compact excessive newlines
            a2 = re.sub(r"\n{3,}", "\n\n", a).strip()
            out.append(a2)
        else:
            out.append(a)
    return out


def cmd_atomize(args: argparse.Namespace) -> int:
    source_id = int(getattr(args, "source_id", 0) or 0)
    all_sources = bool(getattr(args, "all", False))
    mode = (getattr(args, "mode", "b") or "b").strip().lower()
    if mode not in {"a", "b"}:
        _stderr("ERROR: --mode must be a|b")
        return 2

    topic_category = (getattr(args, "topic_category", "book") or "book").strip()
    tone = (getattr(args, "tone", "neutral") or "neutral").strip()
    abstraction_level = (getattr(args, "abstraction_level", "psychological") or "psychological").strip()
    state = (getattr(args, "state", "needs_review") or "needs_review").strip()

    min_len = int(getattr(args, "min_len", 120) or 120)
    max_len = int(getattr(args, "max_len", 1800) or 1800)
    max_newlines = int(getattr(args, "max_newlines", 6) or 6)
    target_min = int(getattr(args, "target_min", 450) or 450)
    target_max = int(getattr(args, "target_max", 900) or 900)

    dry_run = bool(getattr(args, "dry_run", False))
    as_json = bool(getattr(args, "json", False))
    compact = bool(getattr(args, "compact", False))
    limit = int(getattr(args, "limit", 0) or 0)

    conn = _connect(_staging_db_path())
    try:
        _ensure_staging_schema(conn)

        if not all_sources and not source_id:
            _stderr("ERROR: atomize requires --source-id or --all")
            return 2

        if all_sources:
            src_rows = conn.execute("SELECT id FROM kb_sources ORDER BY id ASC").fetchall()
            source_ids = [int(r["id"]) for r in src_rows]
        else:
            source_ids = [source_id]

        inserted = 0
        skipped_existing = 0
        skipped_mode = 0

        now = _utcnow_iso()

        for sid in source_ids:
            chunks = conn.execute(
                """
                SELECT id, seq, text, char_start, char_end, garble_score
                FROM kb_source_chunks
                WHERE source_id=?
                ORDER BY seq ASC
                """.strip(),
                (sid,),
            ).fetchall()

            for ch in chunks:
                # if chunk is heavily garbled, skip atomization from it
                if float(ch["garble_score"] or 0.0) >= 0.45:
                    continue

                chunk_text = str(ch["text"] or "")
                atoms = _split_into_atoms(chunk_text, target_min=target_min, target_max=target_max, max_newlines=max_newlines)

                for atom_text in atoms:
                    t = _normalize_text(atom_text)

                    if len(t) < min_len or len(t) > max_len:
                        continue
                    if _URL_RE.search(t) or _DOMAIN_RE.search(t) or _CODE_FENCE_RE.search(t):
                        continue

                    bot_ready = bool(_DIRECT_ADDRESS_RE.search(t))
                    if mode == "a" and not bot_ready:
                        skipped_mode += 1
                        continue

                    requires_rewrite = bool(_BOX_GARBLE_RE.search(t) or "�" in t or t.lower().startswith("оглавление"))

                    # deterministic key: src{sid}.{locale}.{hash12}
                    locale = (getattr(args, "locale", "") or "ru-RU").strip() or "ru-RU"
                    content_hash = _sha1_text(f"{locale}\n{topic_category}\n{t}")
                    key = f"src{sid}.{locale}.{content_hash[:12]}"

                    meta = {
                        "source_id": sid,
                        "chunk_id": int(ch["id"]),
                        "chunk_seq": int(ch["seq"]),
                        "char_start": int(ch["char_start"]),
                        "char_end": int(ch["char_end"]),
                        "extractor": "atomizer_v1",
                        "content_hash": content_hash,
                        "requires_rewrite": requires_rewrite,
                    }

                    if dry_run:
                        inserted += 1
                        if limit and inserted >= limit:
                            break
                        continue

                    # idempotency: if exists -> skip
                    exists = conn.execute(
                        "SELECT id FROM kb_fragments WHERE key=? AND locale=?",
                        (key, locale),
                    ).fetchone()
                    if exists:
                        skipped_existing += 1
                        continue

                    conn.execute(
                        """
                        INSERT INTO kb_fragments(
                            key, locale, topic_category, text, tone, abstraction_level, state,
                            factors_json, meta_json, created_at, updated_at, source_id
                        ) VALUES (?,?,?,?,?,?,?,?,?,?,?,?)
                        """.strip(),
                        (
                            key,
                            locale,
                            topic_category,
                            t,
                            tone,
                            abstraction_level,
                            state,
                            "{}",
                            _json_dump(meta, compact=True),
                            now,
                            now,
                            sid,
                        ),
                    )
                    inserted += 1
                    if limit and inserted >= limit:
                        break

                if limit and inserted >= limit:
                    break

            if limit and inserted >= limit:
                break

        if not dry_run:
            conn.commit()

        payload = {
            "dry_run": dry_run,
            "mode": mode,
            "inserted": inserted,
            "skipped_existing": skipped_existing,
            "skipped_mode": skipped_mode,
        }
        if as_json:
            print(_json_dump(payload, compact=compact))
        else:
            _stderr(f"atomize: mode={mode} inserted={inserted} skipped_existing={skipped_existing} skipped_mode={skipped_mode}")
        return 0
    finally:
        conn.close()


# ----------------------------
# Sources helpers
# ----------------------------

def cmd_sources_list(args: argparse.Namespace) -> int:
    q = (getattr(args, "q", "") or "").strip()
    limit = int(getattr(args, "limit", 200) or 200)
    compact = bool(getattr(args, "compact", False))

    conn = _connect(_staging_db_path())
    try:
        _ensure_staging_schema(conn)

        where = []
        params: list[Any] = []
        if q:
            where.append("(title LIKE ? OR file_name LIKE ?)")
            params.extend([f"%{q}%", f"%{q}%"])

        rows = conn.execute(
            f"""
            SELECT s.*,
                   (SELECT COUNT(1) FROM kb_source_chunks c WHERE c.source_id=s.id) AS chunks_count,
                   (SELECT COUNT(1) FROM kb_fragments f WHERE f.source_id=s.id) AS fragments_count
            FROM kb_sources s
            WHERE {' AND '.join(where) if where else '1=1'}
            ORDER BY s.id DESC
            LIMIT ?
            """.strip(),
            (*params, limit),
        ).fetchall()

        items = []
        for r in rows:
            items.append(
                {
                    "id": int(r["id"]),
                    "title": r["title"],
                    "source_type": r["source_type"],
                    "locale": r["locale"],
                    "file_name": r["file_name"],
                    "file_size": r["file_size"],
                    "imported_at": r["imported_at"],
                    "chunks": int(r["chunks_count"] or 0),
                    "fragments": int(r["fragments_count"] or 0),
                }
            )

        if getattr(args, "json", False):
            print(_json_dump({"count": len(items), "items": items}, compact=compact))
        else:
            for it in items:
                _stderr(
                    f"source#{it['id']} chunks={it['chunks']} frags={it['fragments']} "
                    f"type={it.get('source_type') or ''} locale={it.get('locale') or ''} title={it['title']}"
                )
        return 0
    finally:
        conn.close()


def cmd_sources_diagnose(args: argparse.Namespace) -> int:
    source_id = int(getattr(args, "source_id", 0) or 0)
    if not source_id:
        _stderr("ERROR: --source-id is required")
        return 2

    threshold = float(getattr(args, "threshold", 0.20) or 0.20)
    limit = int(getattr(args, "limit", 20) or 20)
    as_json = bool(getattr(args, "json", False))
    compact = bool(getattr(args, "compact", False))

    conn = _connect(_staging_db_path())
    try:
        _ensure_staging_schema(conn)

        rows = conn.execute(
            """
            SELECT id, seq, garble_score, garble_lines, LENGTH(text) AS n
            FROM kb_source_chunks
            WHERE source_id=?
            ORDER BY seq ASC
            """.strip(),
            (source_id,),
        ).fetchall()

        total = len(rows)
        bad = [r for r in rows if float(r["garble_score"] or 0.0) >= threshold]
        bad_count = len(bad)

        worst = sorted(rows, key=lambda r: float(r["garble_score"] or 0.0), reverse=True)[:limit]
        worst_items = [
            {
                "chunk_id": int(r["id"]),
                "seq": int(r["seq"]),
                "garble_score": float(r["garble_score"] or 0.0),
                "garble_lines": int(r["garble_lines"] or 0),
                "chars": int(r["n"] or 0),
            }
            for r in worst
        ]

        payload = {
            "source_id": source_id,
            "threshold": threshold,
            "chunks_total": total,
            "chunks_garbled": bad_count,
            "garbled_ratio": (bad_count / total) if total else 0.0,
            "worst": worst_items,
        }

        if as_json:
            print(_json_dump(payload, compact=compact))
        else:
            _stderr(
                f"diagnose: source_id={source_id} total={total} garbled>={threshold:.2f}: {bad_count} "
                f"ratio={payload['garbled_ratio']:.2%}"
            )
            for it in worst_items[: min(limit, 10)]:
                _stderr(f"  chunk#{it['chunk_id']} seq={it['seq']} score={it['garble_score']:.2f} bad_lines={it['garble_lines']}")
        return 0
    finally:
        conn.close()


# ----------------------------
# Fragments helpers
# ----------------------------

def cmd_fragments_sample(args: argparse.Namespace) -> int:
    source_id = int(getattr(args, "source_id", 0) or 0)
    if not source_id:
        _stderr("ERROR: --source-id is required")
        return 2

    limit = int(getattr(args, "limit", 20) or 20)
    with_text = bool(getattr(args, "with_text", False))
    state = (getattr(args, "state", "") or "").strip()
    needs_rewrite_only = bool(getattr(args, "needs_rewrite_only", False))
    bot_ready_only = bool(getattr(args, "bot_ready_only", False))

    conn = _connect(_staging_db_path())
    try:
        _ensure_staging_schema(conn)

        where = ["source_id=?"]
        params: list[Any] = [source_id]
        if state:
            where.append("state=?")
            params.append(state)

        rows = conn.execute(
            f"""
            SELECT id, key, locale, state, topic_category, tone, abstraction_level, created_at, meta_json, text
            FROM kb_fragments
            WHERE {' AND '.join(where)}
            ORDER BY id DESC
            LIMIT 5000
            """.strip(),
            params,
        ).fetchall()

        # apply filters same as list/export
        filtered: list[sqlite3.Row] = []
        for r in rows:
            meta = _json_load_dict(r["meta_json"])
            is_needs = bool(meta.get("requires_rewrite", False))
            is_bot = bool(_DIRECT_ADDRESS_RE.search(str(r["text"] or "")))
            if needs_rewrite_only and not is_needs:
                continue
            if bot_ready_only and not is_bot:
                continue
            filtered.append(r)

        random.shuffle(filtered)
        picked = filtered[:limit]

        for r in picked:
            meta = _json_load_dict(r["meta_json"])
            tag = "needs_rewrite" if meta.get("requires_rewrite") else ("bot_ready" if _DIRECT_ADDRESS_RE.search(str(r["text"] or "")) else "-")
            print(f"{int(r['id']):<8} {str(r['key']):<32} {str(r['locale']):<7} {str(r['state']):<12} {tag}")
            if with_text:
                print(str(r["text"] or ""))
                print("-" * 60)
        return 0
    finally:
        conn.close()


def cmd_fragments_stats(args: argparse.Namespace) -> int:
    source_id = int(getattr(args, "source_id", 0) or 0)
    if not source_id:
        _stderr("ERROR: --source-id is required")
        return 2

    state = (getattr(args, "state", "") or "").strip()
    as_json = bool(getattr(args, "json", False))
    compact = bool(getattr(args, "compact", False))

    conn = _connect(_staging_db_path())
    try:
        _ensure_staging_schema(conn)

        where = ["source_id=?"]
        params: list[Any] = [source_id]
        if state:
            where.append("state=?")
            params.append(state)

        rows = conn.execute(
            f"SELECT meta_json, text FROM kb_fragments WHERE {' AND '.join(where)}",
            params,
        ).fetchall()

        total = len(rows)
        requires_rewrite = 0
        bot_ready = 0
        has_url = 0
        has_domain = 0

        for r in rows:
            meta = _json_load_dict(r["meta_json"])
            if bool(meta.get("requires_rewrite", False)):
                requires_rewrite += 1
            txt = str(r["text"] or "")
            if _DIRECT_ADDRESS_RE.search(txt):
                bot_ready += 1
            low = txt.lower()
            if "http://" in low or "https://" in low:
                has_url += 1
            if _DOMAIN_RE.search(txt):
                has_domain += 1

        payload = {
            "source_id": source_id,
            "state": state or None,
            "total": total,
            "requires_rewrite": requires_rewrite,
            "bot_ready": bot_ready,
            "has_url": has_url,
            "has_domain": has_domain,
        }

        if as_json:
            print(_json_dump(payload, compact=compact))
        else:
            _stderr(
                f"source_id={source_id} total={total} requires_rewrite={requires_rewrite} "
                f"bot_ready={bot_ready} has_url={has_url} has_domain={has_domain}"
            )
        return 0
    finally:
        conn.close()


def cmd_fragments_export(args: argparse.Namespace) -> int:
    source_id = int(getattr(args, "source_id", 0) or 0)
    if not source_id:
        _stderr("ERROR: --source-id is required")
        return 2

    state = (getattr(args, "state", "") or "").strip()
    q = (getattr(args, "q", "") or "").strip()
    needs_rewrite_only = bool(getattr(args, "needs_rewrite_only", False))
    bot_ready_only = bool(getattr(args, "bot_ready_only", False))
    limit = int(getattr(args, "limit", 0) or 0)
    out_path = (getattr(args, "out", "") or "").strip()
    include_meta = bool(getattr(args, "include_meta", True))
    include_text = bool(getattr(args, "include_text", True))

    conn = _connect(_staging_db_path())
    try:
        _ensure_staging_schema(conn)

        where = ["source_id=?"]
        params: list[Any] = [source_id]
        if state:
            where.append("state=?")
            params.append(state)
        if q:
            where.append("(key LIKE ? OR text LIKE ?)")
            params.extend([f"%{q}%", f"%{q}%"])

        rows = conn.execute(
            f"""
            SELECT id, key, locale, state, topic_category, tone, abstraction_level, created_at, updated_at, meta_json, text
            FROM kb_fragments
            WHERE {' AND '.join(where)}
            ORDER BY id ASC
            """.strip(),
            params,
        ).fetchall()

        out_fp: io.TextIOBase
        if out_path:
            Path(out_path).parent.mkdir(parents=True, exist_ok=True)
            out_fp = open(out_path, "w", encoding="utf-8")
        else:
            out_fp = sys.stdout

        try:
            n = 0
            for r in rows:
                meta = _json_load_dict(r["meta_json"])
                is_needs = bool(meta.get("requires_rewrite", False))
                is_bot = bool(_DIRECT_ADDRESS_RE.search(str(r["text"] or "")))
                if needs_rewrite_only and not is_needs:
                    continue
                if bot_ready_only and not is_bot:
                    continue

                item: dict[str, Any] = {
                    "id": int(r["id"]),
                    "key": str(r["key"]),
                    "locale": str(r["locale"]),
                    "state": str(r["state"]),
                    "topic_category": str(r["topic_category"]),
                    "tone": str(r["tone"]),
                    "abstraction_level": str(r["abstraction_level"]),
                    "created_at": str(r["created_at"]),
                    "updated_at": str(r["updated_at"]),
                    "requires_rewrite": is_needs,
                    "bot_ready": is_bot,
                }
                if include_text:
                    item["text"] = str(r["text"] or "")
                if include_meta:
                    item["meta_json"] = meta

                out_fp.write(json.dumps(item, ensure_ascii=False) + "\n")
                n += 1
                if limit and n >= limit:
                    break

            if out_path:
                _stderr(f"✅ export: wrote {n} lines to {out_path}")
            return 0
        finally:
            if out_fp is not sys.stdout:
                out_fp.close()
    finally:
        conn.close()


def cmd_fragments_import(args: argparse.Namespace) -> int:
    inp = (getattr(args, "path", "") or "").strip()
    if not inp:
        _stderr("ERROR: --path is required")
        return 2
    path = Path(inp)
    if not path.exists():
        _stderr(f"ERROR: not found: {path}")
        return 2

    dry_run = bool(getattr(args, "dry_run", False))
    as_json = bool(getattr(args, "json", False))
    compact = bool(getattr(args, "compact", False))

    conn = _connect(_staging_db_path())
    try:
        _ensure_staging_schema(conn)

        updated = 0
        skipped = 0
        errors: list[dict[str, Any]] = []
        now = _utcnow_iso()

        with open(path, "r", encoding="utf-8") as fp:
            for i, line in enumerate(fp, start=1):
                line = line.strip()
                if not line:
                    continue
                try:
                    obj = json.loads(line)
                    if not isinstance(obj, dict):
                        raise ValueError("line must be JSON object")
                    fid = int(obj.get("id") or 0)
                    if not fid:
                        raise ValueError("missing id")

                    row = conn.execute("SELECT id, meta_json FROM kb_fragments WHERE id=?", (fid,)).fetchone()
                    if not row:
                        skipped += 1
                        continue

                    new_text = obj.get("text")
                    new_meta = obj.get("meta_json")

                    if new_text is None and new_meta is None:
                        skipped += 1
                        continue

                    meta = _json_load_dict(row["meta_json"])
                    if isinstance(new_meta, dict):
                        meta.update(new_meta)

                    if not dry_run:
                        if new_text is not None:
                            conn.execute(
                                "UPDATE kb_fragments SET text=?, meta_json=?, updated_at=? WHERE id=?",
                                (str(new_text), _json_dump(meta, compact=True), now, fid),
                            )
                        else:
                            conn.execute(
                                "UPDATE kb_fragments SET meta_json=?, updated_at=? WHERE id=?",
                                (_json_dump(meta, compact=True), now, fid),
                            )
                    updated += 1

                except Exception as e:
                    errors.append({"line": i, "error": f"{type(e).__name__}: {e}"})

        if not dry_run:
            conn.commit()

        payload = {"dry_run": dry_run, "updated": updated, "skipped": skipped, "errors": errors}
        if as_json:
            print(_json_dump(payload, compact=compact))
        else:
            _stderr(f"import: updated={updated} skipped={skipped} errors={len(errors)}")
        return 0 if not errors else 1
    finally:
        conn.close()


def cmd_fragments_purge(args: argparse.Namespace) -> int:
    source_id = int(getattr(args, "source_id", 0) or 0)
    if not source_id:
        _stderr("ERROR: --source-id is required")
        return 2

    state = (getattr(args, "state", "") or "").strip()
    only_extractor = (getattr(args, "only_extractor", "") or "").strip()
    limit = int(getattr(args, "limit", 0) or 0)
    who = (getattr(args, "who", "KB") or "KB").strip()
    note = (getattr(args, "note", "purge") or "purge").strip()
    dry_run = bool(getattr(args, "dry_run", False))
    as_json = bool(getattr(args, "json", False))
    compact = bool(getattr(args, "compact", False))

    conn = _connect(_staging_db_path())
    try:
        _ensure_staging_schema(conn)

        where = ["source_id=?"]
        params: list[Any] = [source_id]
        if state:
            where.append("state=?")
            params.append(state)

        rows = conn.execute(
            f"""
            SELECT id, meta_json
            FROM kb_fragments
            WHERE {' AND '.join(where)}
            ORDER BY id DESC
            """.strip(),
            params,
        ).fetchall()

        ids: list[int] = []
        for r in rows:
            meta = _json_load_dict(r["meta_json"])
            if only_extractor and str(meta.get("extractor", "")) != only_extractor:
                continue
            ids.append(int(r["id"]))
            if limit and len(ids) >= limit:
                break

        if not ids:
            payload = {"dry_run": dry_run, "deleted": 0}
            if as_json:
                print(_json_dump(payload, compact=compact))
            else:
                _stderr("purge: nothing matched")
            return 0

        if not dry_run:
            # log events then delete
            now = _utcnow_iso()
            for fid in ids:
                cur = conn.execute("SELECT state FROM kb_fragments WHERE id=?", (fid,)).fetchone()
                from_state = str(cur["state"] or "") if cur else ""
                conn.execute(
                    """
                    INSERT INTO kb_events(fragment_id, from_state, to_state, who, note, at)
                    VALUES (?,?,?,?,?,?)
                    """.strip(),
                    (fid, from_state, "deleted", who, note, now),
                )
            conn.executemany("DELETE FROM kb_fragments WHERE id=?", [(fid,) for fid in ids])
            conn.commit()

        payload = {"dry_run": dry_run, "deleted": len(ids)}
        if as_json:
            print(_json_dump(payload, compact=compact))
        else:
            _stderr(f"purge: deleted={len(ids)} dry_run={dry_run}")
        return 0
    finally:
        conn.close()


# ----------------------------
# Argparse
# ----------------------------



def cmd_restore(args: argparse.Namespace) -> int:
    """Restore a fragment to enabled in one command (staging only).

    Flow:
      archived -> needs_review (configurable) -> validated -> enabled

    Notes:
      - Uses deterministic validator (_validate_fragment_row) before mutating.
      - Can optionally run build (or dry-run build) after success.
      - Writes logs to stderr; JSON (build report) stays on stdout.
    """
    key = (getattr(args, "key", "") or "").strip()
    if not key:
        raise SystemExit("kb restore: --key is required")

    locale_filter = (getattr(args, "locale", None) or "").strip()
    who = (getattr(args, "who", "KB") or "KB").strip()
    note = (getattr(args, "note", "restore") or "restore").strip()
    review_state = (getattr(args, "review_state", "needs_review") or "needs_review").strip()
    dry_run = bool(getattr(args, "dry_run", False))

    run_build = bool(getattr(args, "build", False))
    build_json = bool(getattr(args, "json", False))
    build_compact = bool(getattr(args, "compact", False))
    verbose = bool(getattr(args, "verbose", False))

    def log(msg: str) -> None:
        if verbose or not (run_build and build_json):
            _stderr(msg)

    conn = _connect(_staging_db_path())
    try:
        _ensure_staging_schema(conn)

        params: list[Any] = [key]
        where = ["key=?"]
        if locale_filter:
            where.append("locale=?")
            params.append(locale_filter)

        row = conn.execute(
            f"""
            SELECT id, key, locale, state, meta_json, text
            FROM kb_fragments
            WHERE {' AND '.join(where)}
            ORDER BY id DESC
            LIMIT 1
            """.strip(),
            params,
        ).fetchone()

        if not row:
            log("ℹ️ not found in staging")
            return 0

        fid = int(row["id"])
        locale = str(row["locale"] or "ru-RU")
        state0 = str(row["state"] or "")

        # Validate first (content only)
        errs = _validate_fragment_row(row)
        if errs:
            log("❌ restore blocked by validation:")
            for e in errs:
                log(f"  - {e}")
            return 1

        sim_state = state0
        now = _utcnow_iso()

        def _event(from_state: str, to_state: str, _note: str) -> None:
            if dry_run:
                return
            conn.execute(
                """
                INSERT INTO kb_events(fragment_id, from_state, to_state, who, note, at)
                VALUES (?,?,?,?,?,?)
                """.strip(),
                (fid, from_state, to_state, who, _note, now),
            )

        def _set_state(to_state: str, _note: str) -> None:
            nonlocal sim_state
            if sim_state == to_state:
                return
            from_state = sim_state
            if dry_run:
                log(f"🧪 dry-run: {from_state} -> {to_state} ({_note})")
                sim_state = to_state
                return

            conn.execute("UPDATE kb_fragments SET state=?, updated_at=? WHERE id=?", (to_state, now, fid))
            _event(from_state, to_state, _note)
            sim_state = to_state

        if sim_state == "enabled":
            log(f"✅ restore: already enabled key={key} locale={locale}")
        else:
            if sim_state == "archived":
                _set_state(review_state, f"{note}: unarchive")
            if sim_state != "validated":
                _set_state("validated", f"{note}: validated")
            _set_state("enabled", f"{note}: enabled")

        if not dry_run:
            conn.commit()
            log(f"✅ restore ok: key={key} locale={locale} state={state0} -> {sim_state}")
        else:
            log(f"🧪 dry-run ok: key={key} locale={locale} would become enabled")

        if run_build:
            cmd_build(argparse.Namespace(dry_run=dry_run, json=build_json, compact=build_compact))

        return 0
    finally:
        conn.close()

def cmd_fragments_promote(args: argparse.Namespace) -> int:
    """Bulk state transition for fragments of a source.

    Intended for fast review flow:
      needs_review -> reviewed  (default)

    Filters:
      --only-bot-ready: text contains direct address markers
      --only-needs-rewrite: meta_json.requires_rewrite == true
    """
    source_id = int(getattr(args, "source_id", 0) or 0)
    if not source_id:
        _stderr("ERROR: --source-id is required")
        return 2

    from_state = (getattr(args, "from_state", "needs_review") or "needs_review").strip()
    to_state = (getattr(args, "to_state", "reviewed") or "reviewed").strip()
    only_bot_ready = bool(getattr(args, "only_bot_ready", False))
    only_needs_rewrite = bool(getattr(args, "only_needs_rewrite", False))
    dry_run = bool(getattr(args, "dry_run", False))
    as_json = bool(getattr(args, "json", False))
    compact = bool(getattr(args, "compact", False))

    conn = _connect(_staging_db_path())
    try:
        _ensure_staging_schema(conn)

        rows = conn.execute(
            """
            SELECT id, meta_json, text
            FROM kb_fragments
            WHERE source_id=? AND state=?
            ORDER BY id ASC
            """.strip(),
            (source_id, from_state),
        ).fetchall()

        eligible_ids: list[int] = []
        skipped_filter = 0
        for r in rows:
            meta = _json_load_dict(r["meta_json"])
            txt = str(r["text"] or "")
            is_needs = bool(meta.get("requires_rewrite", False))
            is_bot = bool(_DIRECT_ADDRESS_RE.search(txt))
            if only_needs_rewrite and not is_needs:
                skipped_filter += 1
                continue
            if only_bot_ready and not is_bot:
                skipped_filter += 1
                continue
            eligible_ids.append(int(r["id"]))

        updated = 0
        now = _utcnow_iso()
        if not dry_run:
            for fid in eligible_ids:
                conn.execute("UPDATE kb_fragments SET state=?, updated_at=? WHERE id=?", (to_state, now, fid))
                conn.execute(
                    """
                    INSERT INTO kb_events(fragment_id, from_state, to_state, who, note, at)
                    VALUES (?,?,?,?,?,?)
                    """.strip(),
                    (fid, from_state, to_state, "KB", "promote", now),
                )
                updated += 1
            conn.commit()

        payload = {
            "dry_run": dry_run,
            "source_id": source_id,
            "from_state": from_state,
            "to_state": to_state,
            "only_bot_ready": only_bot_ready,
            "only_needs_rewrite": only_needs_rewrite,
            "matched": len(rows),
            "eligible": len(eligible_ids),
            "updated": updated,
            "skipped_filter": skipped_filter,
        }

        if as_json:
            print(_json_dump(payload, compact=compact))
        else:
            _stderr(
                f"promote: source_id={source_id} {from_state}->{to_state} "
                f"matched={len(rows)} eligible={len(eligible_ids)} updated={updated} skipped_filter={skipped_filter}"
            )
        return 0
    finally:
        conn.close()

def build_parser() -> argparse.ArgumentParser:
    p = argparse.ArgumentParser(prog="kb", description="Knowledge Builder CLI")
    sub = p.add_subparsers(dest="cmd", required=True)

    sp = sub.add_parser("init")
    sp.set_defaults(func=cmd_init)

    sp = sub.add_parser("add")
    sp.add_argument("--key", required=True)
    sp.add_argument("--locale", default="ru-RU")
    sp.add_argument("--topic", default="book")
    sp.add_argument("--tone", default="neutral", choices=["supportive", "neutral", "warning"])
    sp.add_argument("--abstraction", default="psychological", choices=["psychological", "symbolic", "behavioral"])
    sp.add_argument("--state", default="draft")
    sp.add_argument("--text", required=True)
    sp.add_argument("--source-id", dest="source_id", type=int, default=0)
    sp.add_argument("--author", default="")
    sp.add_argument("--meta-json", dest="meta_json", default="{}")
    sp.add_argument("--factors-json", dest="factors_json", default="{}")
    sp.set_defaults(func=cmd_add)

    sp = sub.add_parser("state")
    sp.add_argument("--key", required=True)
    sp.add_argument("--locale", default="ru-RU")
    sp.add_argument("--to", required=True)
    sp.add_argument("--who", default="KB")
    sp.add_argument("--note", default="")
    sp.add_argument("--json", action="store_true")
    sp.set_defaults(func=cmd_state)

    sp = sub.add_parser("validate")
    sp.add_argument("--key", default="")
    sp.add_argument("--locale", default=None)
    sp.add_argument("--state", default=None)
    sp.add_argument("--limit", type=int, default=1000)
    sp.add_argument("--who", default="KB")
    sp.add_argument("--note", default="validate")
    sp.add_argument("--recheck", action="store_true")
    sp.add_argument("--json", action="store_true")
    sp.add_argument("--compact", action="store_true")
    sp.add_argument("--verbose", action="store_true")
    sp.set_defaults(func=cmd_validate)

    sp = sub.add_parser("build")
    sp.add_argument("--dry-run", action="store_true")
    sp.add_argument("--json", action="store_true")
    sp.add_argument("--compact", action="store_true")
    sp.set_defaults(func=cmd_build)

    sp = sub.add_parser("list", help="list staging fragments (legacy)")
    sp.add_argument("--state", default="")
    sp.add_argument("--source-id", dest="source_id", type=int, default=0)
    sp.add_argument("--topic", default="")
    sp.add_argument("--locale", default="")
    sp.add_argument("--key", default="")
    sp.add_argument("--q", default="")
    sp.add_argument("--limit", type=int, default=50)
    sp.add_argument("--needs-rewrite-only", dest="needs_rewrite_only", action="store_true")
    sp.add_argument("--bot-ready-only", dest="bot_ready_only", action="store_true")
    sp.set_defaults(func=cmd_list)

    sp = sub.add_parser("show")
    sp.add_argument("--key", required=True)
    sp.add_argument("--with-text", action="store_true")
    sp.add_argument("--json", action="store_true")
    sp.set_defaults(func=cmd_show)


    sp = sub.add_parser("restore")
    sp.add_argument("--key", required=True)
    sp.add_argument("--locale", default="")
    sp.add_argument("--who", default="KB")
    sp.add_argument("--note", default="restore")
    sp.add_argument("--review-state", dest="review_state", default="needs_review")
    sp.add_argument("--dry-run", action="store_true")
    sp.add_argument("--build", action="store_true", help="run kb build after restore")
    sp.add_argument("--json", action="store_true", help="when used with --build: emit build JSON on stdout")
    sp.add_argument("--compact", action="store_true")
    sp.add_argument("--verbose", action="store_true")
    sp.set_defaults(func=cmd_restore)
    sp = sub.add_parser("ingest")
    sp.add_argument("--path", required=True)
    sp.add_argument("--locale", default="")
    sp.add_argument("--chunk-size", dest="chunk_size", type=int, default=6000)
    sp.add_argument("--force", action="store_true")
    sp.add_argument("--dry-run", action="store_true")
    sp.add_argument("--json", action="store_true")
    sp.add_argument("--compact", action="store_true")
    sp.set_defaults(func=cmd_ingest)

    sp = sub.add_parser("atomize")
    sp.add_argument("--source-id", type=int, default=0)
    sp.add_argument("--all", action="store_true")
    sp.add_argument("--mode", default="b", choices=["a", "b"])
    sp.add_argument("--state", default="needs_review",
                    choices=["draft", "needs_review", "reviewed", "annotated", "validated", "enabled", "archived"])
    sp.add_argument("--locale", default="")
    sp.add_argument("--topic-category", dest="topic_category", default="book")
    sp.add_argument("--tone", default="neutral", choices=["supportive", "neutral", "warning"])
    sp.add_argument("--abstraction-level", dest="abstraction_level", default="psychological",
                    choices=["psychological", "symbolic", "behavioral"])
    sp.add_argument("--min-len", dest="min_len", type=int, default=120)
    sp.add_argument("--max-len", dest="max_len", type=int, default=1800)
    sp.add_argument("--target-min", dest="target_min", type=int, default=450)
    sp.add_argument("--target-max", dest="target_max", type=int, default=900)
    sp.add_argument("--max-newlines", dest="max_newlines", type=int, default=6)
    sp.add_argument("--limit", type=int, default=0)
    sp.add_argument("--dry-run", action="store_true")
    sp.add_argument("--json", action="store_true")
    sp.add_argument("--compact", action="store_true")
    sp.set_defaults(func=cmd_atomize)

    sp = sub.add_parser("sources", help="sources helpers")
    sub2 = sp.add_subparsers(dest="sources_cmd", required=True)

    sp2 = sub2.add_parser("list", help="list ingested sources")
    sp2.add_argument("--q", default="")
    sp2.add_argument("--limit", type=int, default=200)
    sp2.add_argument("--json", action="store_true")
    sp2.add_argument("--compact", action="store_true")
    sp2.set_defaults(func=cmd_sources_list)

    sp2 = sub2.add_parser("diagnose", help="diagnose garble per chunks")
    sp2.add_argument("--source-id", type=int, required=True)
    sp2.add_argument("--threshold", type=float, default=0.20)
    sp2.add_argument("--limit", type=int, default=20)
    sp2.add_argument("--json", action="store_true")
    sp2.add_argument("--compact", action="store_true")
    sp2.set_defaults(func=cmd_sources_diagnose)

    sp = sub.add_parser("fragments", help="fragments helpers")
    sub3 = sp.add_subparsers(dest="fragments_cmd", required=True)

    sp3 = sub3.add_parser("list", help="list staging fragments (supports --source-id + flags)")
    sp3.add_argument("--state", default="")
    sp3.add_argument("--source-id", type=int, default=0)
    sp3.add_argument("--topic", default="")
    sp3.add_argument("--locale", default="")
    sp3.add_argument("--key", default="")
    sp3.add_argument("--q", default="")
    sp3.add_argument("--limit", type=int, default=50)
    sp3.add_argument("--needs-rewrite-only", dest="needs_rewrite_only", action="store_true")
    sp3.add_argument("--bot-ready-only", dest="bot_ready_only", action="store_true")
    sp3.set_defaults(func=cmd_list)

    sp4 = sub3.add_parser("sample", help="sample fragments (random) for quick review")
    sp4.add_argument("--source-id", type=int, required=True)
    sp4.add_argument("--state", default="")
    sp4.add_argument("--needs-rewrite-only", dest="needs_rewrite_only", action="store_true")
    sp4.add_argument("--bot-ready-only", dest="bot_ready_only", action="store_true")
    sp4.add_argument("--limit", type=int, default=20)
    sp4.add_argument("--with-text", action="store_true")
    sp4.set_defaults(func=cmd_fragments_sample)

    sp5 = sub3.add_parser("stats", help="stats for fragments by source")
    sp5.add_argument("--source-id", type=int, required=True)
    sp5.add_argument("--state", default="")
    sp5.add_argument("--json", action="store_true")
    sp5.add_argument("--compact", action="store_true")
    sp5.set_defaults(func=cmd_fragments_stats)

    sp6 = sub3.add_parser("export", help="export fragments to JSONL for bulk editing")
    sp6.add_argument("--source-id", type=int, required=True)
    sp6.add_argument("--state", default="")
    sp6.add_argument("--q", default="")
    sp6.add_argument("--needs-rewrite-only", dest="needs_rewrite_only", action="store_true")
    sp6.add_argument("--bot-ready-only", dest="bot_ready_only", action="store_true")
    sp6.add_argument("--limit", type=int, default=0)
    sp6.add_argument("--out", default="", help="write to file (UTF-8). If omitted, writes to stdout")
    sp6.add_argument("--include-meta", dest="include_meta", action="store_true", default=True)
    sp6.add_argument("--no-meta", dest="include_meta", action="store_false")
    sp6.add_argument("--include-text", dest="include_text", action="store_true", default=True)
    sp6.add_argument("--no-text", dest="include_text", action="store_false")
    sp6.set_defaults(func=cmd_fragments_export)

    sp7 = sub3.add_parser("import", help="import fragments from JSONL back into staging (by id)")
    sp7.add_argument("--path", required=True)
    sp7.add_argument("--dry-run", action="store_true")
    sp7.add_argument("--json", action="store_true")
    sp7.add_argument("--compact", action="store_true")
    sp7.set_defaults(func=cmd_fragments_import)

    sp8 = sub3.add_parser("purge", help="delete staging fragments by source (optionally by extractor)")
    sp8.add_argument("--source-id", type=int, required=True)
    sp8.add_argument("--state", default="")
    sp8.add_argument("--only-extractor", dest="only_extractor", default="")
    sp8.add_argument("--limit", type=int, default=0)
    sp8.add_argument("--who", default="KB")
    sp8.add_argument("--note", default="purge")
    sp8.add_argument("--dry-run", action="store_true")
    sp8.add_argument("--json", action="store_true")
    sp8.add_argument("--compact", action="store_true")
    sp8.set_defaults(func=cmd_fragments_purge)


    sp9 = sub3.add_parser("promote", help="bulk state transition for fragments of a source")
    sp9.add_argument("--source-id", type=int, required=True)
    sp9.add_argument("--from-state", dest="from_state", default="needs_review")
    sp9.add_argument("--to-state", dest="to_state", default="reviewed")
    sp9.add_argument("--only-bot-ready", dest="only_bot_ready", action="store_true")
    sp9.add_argument("--only-needs-rewrite", dest="only_needs_rewrite", action="store_true")
    sp9.add_argument("--dry-run", action="store_true")
    sp9.add_argument("--json", action="store_true")
    sp9.add_argument("--compact", action="store_true")
    sp9.set_defaults(func=cmd_fragments_promote)
    return p


def main(argv: Optional[list[str]] = None) -> int:
    parser = build_parser()
    args = parser.parse_args(argv)
    return int(args.func(args) or 0)


if __name__ == "__main__":
    raise SystemExit(main())