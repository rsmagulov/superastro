# app/knowledge/cli.py
from __future__ import annotations

import argparse
import hashlib
import json
import sqlite3
import re
import sys
from datetime import datetime, timezone
from pathlib import Path
from typing import Any, Optional
VALIDATOR_PROFILE = "ru_v1"

# ----------------------------
# Paths / time
# ----------------------------

def _astro_root() -> Path:
    # .../astroprocessor/app/knowledge/cli.py -> astroprocessor root = parents[2]
    return Path(__file__).resolve().parents[2]


def _staging_db_path() -> Path:
    p = _astro_root() / "data" / "staging" / "staging.db"
    p.parent.mkdir(parents=True, exist_ok=True)
    return p


def _prod_db_path() -> Path:
    p = _astro_root() / "data" / "knowledge.db"
    p.parent.mkdir(parents=True, exist_ok=True)
    return p


def _utcnow_iso() -> str:
    return datetime.now(timezone.utc).replace(microsecond=0).isoformat().replace("+00:00", "Z")


def _die(msg: str, code: int = 2) -> int:
    print(f"❌ {msg}")
    return code


def _connect(path: Path) -> sqlite3.Connection:
    conn = sqlite3.connect(str(path))
    conn.row_factory = sqlite3.Row
    return conn


def _sha256_file(path: Path) -> str:
    h = hashlib.sha256()
    with path.open("rb") as f:
        for chunk in iter(lambda: f.read(1024 * 1024), b""):
            h.update(chunk)
    return h.hexdigest()


def _json_or_empty(s: str | None) -> str:
    s = (s or "").strip()
    if not s:
        return "{}"
    try:
        json.loads(s)
        return s
    except Exception:
        return "{}"

def _json_load_dict(s: str | None) -> dict[str, Any]:
    """Best-effort JSON dict loader. Returns {} on any problem."""
    raw = (s or "").strip()
    if not raw:
        return {}
    try:
        obj = json.loads(raw)
    except Exception:
        return {}
    return obj if isinstance(obj, dict) else {}


def _merge_meta_json(existing: str | None, updates: dict[str, Any]) -> str:
    """Merge updates into existing meta_json, preserving other fields."""
    obj = _json_load_dict(existing)
    obj.update(updates)
    return json.dumps(obj, ensure_ascii=False)


def _is_managed_by_build(meta_json: str | None) -> bool:
    """Return True if prod meta_json marks the row as created by kb build."""
    obj = _json_load_dict(meta_json)
    v = obj.get("kb_fragment_id")
    return isinstance(v, int) and v > 0


def _is_managed_by_build(meta_json: str | None) -> bool:
    """Return True if prod meta_json marks the row as created by kb build.

    We treat a row as "managed" only if meta_json contains a positive integer
    field: kb_fragment_id.
    """
    raw = (meta_json or "").strip()
    if not raw:
        return False
    try:
        obj = json.loads(raw)
    except Exception:
        return False
    if not isinstance(obj, dict):
        return False
    v = obj.get("kb_fragment_id")
    return isinstance(v, int) and v > 0


def _table_exists(conn: sqlite3.Connection, name: str) -> bool:
    row = conn.execute(
        "SELECT 1 FROM sqlite_master WHERE type IN ('table','view') AND name=? LIMIT 1",
        (name,),
    ).fetchone()
    return bool(row)


# ----------------------------
# Staging schema
# ----------------------------

STAGING_SCHEMA_SQL = """
CREATE TABLE IF NOT EXISTS kb_schema_meta (
  key TEXT PRIMARY KEY,
  value TEXT NOT NULL
);

CREATE TABLE IF NOT EXISTS kb_sources (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  title TEXT NOT NULL,
  path TEXT,
  sha256 TEXT,
  imported_at TEXT NOT NULL,
  notes TEXT
);

CREATE INDEX IF NOT EXISTS idx_kb_sources_sha256 ON kb_sources(sha256);

CREATE TABLE IF NOT EXISTS kb_fragments (
  id INTEGER PRIMARY KEY AUTOINCREMENT,

  -- уникальный ключ фрагмента в рамках языка
  key TEXT NOT NULL,
  locale TEXT NOT NULL DEFAULT 'ru-RU',

  topic_category TEXT NOT NULL,

  text TEXT NOT NULL,

  tone TEXT NOT NULL CHECK (tone IN ('supportive','neutral','warning')),
  abstraction_level TEXT NOT NULL CHECK (abstraction_level IN ('psychological','symbolic','behavioral')),

  state TEXT NOT NULL CHECK (state IN (
    'draft','needs_review','reviewed','annotated','validated','enabled','archived'
  )),

  -- привязки к астрологическим факторам (планета/дом/аспект и т.п.)
  factors_json TEXT NOT NULL DEFAULT '{}',

  -- мета/тэги/доп. поля (на будущее)
  meta_json TEXT NOT NULL DEFAULT '{}',

  source_id INTEGER,
  author TEXT,

  created_at TEXT NOT NULL,
  updated_at TEXT NOT NULL,

  FOREIGN KEY (source_id) REFERENCES kb_sources(id) ON DELETE SET NULL,
  UNIQUE (key, locale)
);

CREATE INDEX IF NOT EXISTS idx_kb_fragments_state ON kb_fragments(state);
CREATE INDEX IF NOT EXISTS idx_kb_fragments_topic ON kb_fragments(topic_category);
CREATE INDEX IF NOT EXISTS idx_kb_fragments_locale ON kb_fragments(locale);
CREATE INDEX IF NOT EXISTS idx_kb_fragments_key ON kb_fragments(key);

CREATE TABLE IF NOT EXISTS kb_events (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  fragment_id INTEGER NOT NULL,
  from_state TEXT,
  to_state TEXT NOT NULL,
  who TEXT,
  note TEXT,
  ts TEXT NOT NULL,
  FOREIGN KEY (fragment_id) REFERENCES kb_fragments(id) ON DELETE CASCADE
);

CREATE INDEX IF NOT EXISTS idx_kb_events_fragment ON kb_events(fragment_id);
CREATE INDEX IF NOT EXISTS idx_kb_events_ts ON kb_events(ts);

CREATE TABLE IF NOT EXISTS kb_builds (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  version TEXT NOT NULL UNIQUE,           -- v0001, v0002, ...
  created_at TEXT NOT NULL,
  manifest_json TEXT NOT NULL DEFAULT '{}',
  stats_json TEXT NOT NULL DEFAULT '{}'
);
""".strip()


def _ensure_staging_schema(conn: sqlite3.Connection) -> None:
    if not _table_exists(conn, "kb_fragments"):
        conn.executescript(STAGING_SCHEMA_SQL)
        conn.execute(
            "INSERT OR REPLACE INTO kb_schema_meta(key,value) VALUES(?,?)",
            ("schema_version", "1"),
        )
        conn.execute(
            "INSERT OR REPLACE INTO kb_schema_meta(key,value) VALUES(?,?)",
            ("initialized_at", _utcnow_iso()),
        )
        conn.commit()


# ----------------------------
# Production schema (minimal)
# ----------------------------

PROD_SCHEMA_SQL = """
CREATE TABLE IF NOT EXISTS kb_meta (
  key TEXT PRIMARY KEY,
  value TEXT NOT NULL
);

CREATE TABLE IF NOT EXISTS knowledge_docs (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  title TEXT NOT NULL,
  path TEXT,
  sha256 TEXT,
  imported_at TEXT,
  meta_json TEXT NOT NULL DEFAULT '{}'
);

CREATE TABLE IF NOT EXISTS knowledge_chunks (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  doc_id INTEGER NOT NULL,
  chunk_index INTEGER NOT NULL,
  text TEXT NOT NULL,
  meta_json TEXT NOT NULL DEFAULT '{}',
  FOREIGN KEY (doc_id) REFERENCES knowledge_docs(id) ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS knowledge_items (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  key TEXT NOT NULL,
  topic_category TEXT,
  locale TEXT NOT NULL DEFAULT 'ru-RU',
  text TEXT,
  priority INTEGER NOT NULL DEFAULT 0,
  created_at TEXT NOT NULL,
  is_active INTEGER NOT NULL DEFAULT 0,
  meta_json TEXT NOT NULL DEFAULT '{}'
);

CREATE INDEX IF NOT EXISTS idx_knowledge_items_key ON knowledge_items(key);
CREATE INDEX IF NOT EXISTS idx_knowledge_items_locale ON knowledge_items(locale);
CREATE INDEX IF NOT EXISTS idx_knowledge_items_topic ON knowledge_items(topic_category);
CREATE INDEX IF NOT EXISTS idx_knowledge_items_active ON knowledge_items(is_active);
""".strip()


def _ensure_prod_schema(conn: sqlite3.Connection) -> None:
    if not _table_exists(conn, "knowledge_items"):
        conn.executescript(PROD_SCHEMA_SQL)
        conn.commit()


# ----------------------------
# Helpers: printing
# ----------------------------

def _print_rows(rows: list[sqlite3.Row]) -> None:
    for r in rows:
        print(
            f"{int(r['id']):<8} {str(r['key']):<36} {str(r['topic_category']):<22} "
            f"{str(r['locale']):<7} {str(r['tone']):<12} {str(r['abstraction_level']):<14} {str(r['state']):<10}"
        )
        print(f"        {str(r['created_at'])}")


def _print_prod_rows(rows: list[sqlite3.Row], *, with_text: bool = False, text_limit: int = 120) -> None:
    for r in rows:
        keys = set(r.keys())

        def _v(name: str, default: Any = "") -> Any:
            return r[name] if name in keys else default

        print(
            f"{int(_v('id', 0)):<6} {str(_v('key', '')):<36} {str(_v('topic_category', '') or ''):<20} "
            f"{str(_v('locale', '') or ''):<7} {int(_v('is_active', 0) or 0):<2} {int(_v('priority', 0) or 0):<6} "
            f"{str(_v('created_at', '') or '')}"
        )

        if with_text:
            t = str(_v("text", "") or "")
            t = t.replace("\r", " ").replace("\n", " ").strip()
            if len(t) > text_limit:
                t = t[:text_limit] + "…"
            if t:
                print("       " + t)


# ----------------------------
# Commands
# ----------------------------

def cmd_init(args: argparse.Namespace) -> int:
    sp = _staging_db_path()
    conn = _connect(sp)
    try:
        conn.executescript(STAGING_SCHEMA_SQL)
        conn.execute(
            "INSERT OR REPLACE INTO kb_schema_meta(key,value) VALUES(?,?)",
            ("schema_version", "1"),
        )
        conn.execute(
            "INSERT OR REPLACE INTO kb_schema_meta(key,value) VALUES(?,?)",
            ("initialized_at", _utcnow_iso()),
        )
        conn.commit()
        print(f"✅ staging db initialized: {sp}")
    finally:
        conn.close()

    # prod schema too (non-destructive)
    prod = _prod_db_path()
    pc = _connect(prod)
    try:
        pc.executescript(PROD_SCHEMA_SQL)
        pc.commit()
    finally:
        pc.close()

    return 0


def cmd_add(args: argparse.Namespace) -> int:
    conn = _connect(_staging_db_path())
    try:
        _ensure_staging_schema(conn)

        now = _utcnow_iso()

        key = (args.key or "").strip()
        if not key:
            return _die("key is required")

        locale = (args.locale or "ru-RU").strip() or "ru-RU"
        topic = (args.topic or "").strip()
        if not topic:
            return _die("topic is required (--topic)")

        text_ = (args.text or "")
        tone = (args.tone or "").strip()
        abstraction = (args.abstraction or "").strip()
        state = (args.state or "draft").strip()
        author = (args.author or "").strip() or None

        factors_json = _json_or_empty(args.factors_json)
        meta_json = _json_or_empty(args.meta_json)

        source_id = None
        if args.source_title:
            title = str(args.source_title).strip()
            if title:
                imported_at = now
                notes = (args.source_notes or "").strip() or None
                path = (args.source_path or "").strip() or None

                sha = None
                if path:
                    p = Path(path)
                    if p.exists() and p.is_file():
                        sha = _sha256_file(p)

                row = conn.execute("SELECT id FROM kb_sources WHERE title=?", (title,)).fetchone()
                if row:
                    source_id = int(row["id"])
                else:
                    cur = conn.execute(
                        "INSERT INTO kb_sources(title,path,sha256,imported_at,notes) VALUES(?,?,?,?,?)",
                        (title, path, sha, imported_at, notes),
                    )
                    source_id = int(cur.lastrowid)

        cur = conn.execute(
            """
            INSERT INTO kb_fragments(
              key, locale, topic_category, text, tone, abstraction_level, state,
              factors_json, meta_json, source_id, author, created_at, updated_at
            )
            VALUES(?,?,?,?,?,?,?,?,?,?,?,?,?)
            """.strip(),
            (
                key,
                locale,
                topic,
                text_,
                tone,
                abstraction,
                state,
                factors_json,
                meta_json,
                source_id,
                author,
                now,
                now,
            ),
        )
        fid = int(cur.lastrowid)

        conn.execute(
            """
            INSERT INTO kb_events(fragment_id, from_state, to_state, who, note, ts)
            VALUES(?,?,?,?,?,?)
            """.strip(),
            (fid, None, state, (args.who or "KB").strip(), "created", now),
        )

        conn.commit()
        print(f"✅ added: id={fid} key={key} state={state} locale={locale} topic={topic}")
        return 0
    finally:
        conn.close()


def cmd_state(args: argparse.Namespace) -> int:
    key = (args.key or "").strip()
    if not key:
        return _die("key is required (--key)")

    locale = (args.locale or "ru-RU").strip() or "ru-RU"
    to_state = (args.to or "").strip()
    if not to_state:
        return _die("target state is required (--to)")

    who = (args.who or "KB").strip()
    note = (args.note or "").strip() or None

    conn = _connect(_staging_db_path())
    try:
        _ensure_staging_schema(conn)

        row = conn.execute(
            "SELECT id, state FROM kb_fragments WHERE key=? AND locale=?",
            (key, locale),
        ).fetchone()
        if not row:
            return _die("not found", 2)

        fragment_id = int(row["id"])
        from_state = str(row["state"] or "").strip()

        # Gate: нельзя включать без validated
        if to_state == "enabled" and from_state not in {"validated", "enabled"}:
            print("❌ cannot enable: fragment must be in 'validated' state first (run: kb validate ...)")
            return 3

        if from_state == to_state:
            print(f"ℹ️ state unchanged: {key} already {to_state}")
            return 0

        now = _utcnow_iso()
        conn.execute(
            "UPDATE kb_fragments SET state=?, updated_at=? WHERE id=?",
            (to_state, now, fragment_id),
        )
        conn.execute(
            """
            INSERT INTO kb_events(fragment_id, from_state, to_state, who, note, ts)
            VALUES(?,?,?,?,?,?)
            """.strip(),
            (fragment_id, from_state, to_state, who, note, now),
        )
        conn.commit()

        print(f"✅ state: key={key} locale={locale} {from_state} -> {to_state}", file=sys.stderr)
        return 0
    finally:
        conn.close()


def _validate_fragment_row(row: sqlite3.Row) -> list[str]:
    """Validate a staging fragment row.

    Contract:
      - Return a list of human-readable reasons. Empty list => valid.
      - No AI. Only deterministic sanitary rules.
      - Keep rules conservative: avoid false positives that block real content.

    Notes:
      - Locale-sensitive heuristics are intentionally light-weight.
      - This function is used by `kb validate` only (staging barrier before `enabled`).
    """
    errs: list[str] = []

    def _g(col: str) -> Any:
        try:
            return row[col]
        except Exception:
            return None

    key = str(_g("key") or "").strip()
    if not key:
        errs.append("key is empty")
    elif any(ch.isspace() for ch in key):
        errs.append("key contains whitespace")

    topic = str(_g("topic_category") or "").strip()
    if not topic:
        errs.append("topic_category is empty")

    locale = str(_g("locale") or "ru-RU").strip() or "ru-RU"

    text_raw = str(_g("text") or "")
    text_stripped = text_raw.strip()
    if not text_stripped:
        errs.append("text is empty")
    else:
        # --- sanitary rules (no AI) ---
        min_len = 60
        max_len = 2000
        if len(text_stripped) < min_len:
            errs.append(f"text too short (<{min_len} chars)")
        if len(text_stripped) > max_len:
            errs.append(f"text too long (>{max_len} chars)")

        # Reject an ALL-CAPS "headline" at the very start (common copy-paste title).
        lines = [ln.strip() for ln in text_stripped.splitlines() if ln.strip()]
        first_line = lines[0] if lines else ""
        first_line_alpha = re.sub(r"[^A-Za-zА-Яа-яЁё]", "", first_line)

        if first_line and first_line_alpha:
            is_all_caps = first_line_alpha.upper() == first_line_alpha
            # If it's an ALL-CAPS first line and the text continues, treat as a headline.
            if is_all_caps and (len(first_line_alpha) >= 8) and (len(lines) >= 2):
                errs.append("starts with ALL-CAPS headline")

        # Too many line breaks / blank lines.
        if text_raw.count("\n") >= 8:
            errs.append("too many newlines (>=8)")
        if re.search(r"\n\s*\n\s*\n", text_raw):
            errs.append("contains 3+ consecutive blank lines")

        # Obvious placeholders / technical artifacts.
        bad_markers = [
            "lorem ipsum",
            "placeholder",
            "todo",
            "tbd",
            "qwe",
            "asdf",
            "test test",
            "заглушка",
            "мусор",
        ]
        low = text_stripped.lower()
        if any(b in low for b in bad_markers):
            errs.append("contains placeholder/garbage marker")

        # Disallow common accidental payloads.
        if "```" in text_raw:
            errs.append("contains code fence ```")
        if "http://" in low or "https://" in low:
            errs.append("contains URL")

        # RU interpretational form heuristic:
        # should read like an interpretation, not just a label or a noun phrase.
        if locale.lower().startswith("ru"):
            address_markers = [
                "ты",
                "тебе",
                "твой",
                "твоё",
                "твоем",
                "у тебя",
                "вы",
                "вам",
                "ваш",
                "у вас",
            ]
            ru_garbage_markers = [
                "биоастрология",
                "банить",
                "цеплять",
                "карту на куски",
                "смыть перхоть",
                "древних заблуждений",
                "внести свою скромную лепту",
                "прогресс современной науки",
            ]
            if any(m in low for m in ru_garbage_markers):
                errs.append("ru: contains meta/technical/garbage phrasing")
            has_address = any(m in low for m in address_markers)
            if not has_address:
                errs.append("ru: missing direct address (ты/вы/вам/у тебя/у вас)")
            if not re.search(r"[.!?…]", text_stripped):
                errs.append("ru: missing sentence punctuation")

    tone = str(_g("tone") or "").strip()
    if tone not in ("supportive", "neutral", "warning"):
        errs.append(f"invalid tone: {tone!r}")

    ab = str(_g("abstraction_level") or "").strip()
    if ab not in ("psychological", "symbolic", "behavioral"):
        errs.append(f"invalid abstraction_level: {ab!r}")

    for col in ("factors_json", "meta_json"):
        raw = str(_g(col) or "").strip() or "{}"
        try:
            obj = json.loads(raw)
            if not isinstance(obj, dict):
                errs.append(f"{col} must be a JSON object")
        except Exception as e:
            errs.append(f"{col} invalid JSON: {type(e).__name__}: {e}")

    return errs


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
                print(msg, file=sys.stderr)

        params: dict[str, Any] = {}
        where: list[str] = []

        # Selection logic:
        # - With --key: default is "any state/locale" unless user restricts.
        # - Without --key: keep old defaults: locale=ru-RU, state=draft (unless overridden).
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
            if as_json:
                print(json.dumps({"checked": 0, "ok": 0, "bad": 0, "updated": 0, "items": []}, ensure_ascii=False))
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

        # RECHECK MODE: report only, no state changes, includes terminal states
        if recheck:
            if as_json:
                print(
                    json.dumps(
                        {
                            "validator_profile": VALIDATOR_PROFILE,
                            "checked": len(rows),
                            "ok": len(ok_items),
                            "bad": len(bad_items),
                            "updated": 0,
                            "items": ok_items + bad_items,
                        },
                        ensure_ascii=False,
                        indent=2,
                    )
                )
            else:
                if bad_items:
                    log("❌ recheck failed:")
                    for it in bad_items:
                        log(f"  - {it['key']}: " + "; ".join(it["errors"]))
                log(f"✅ recheck: checked={len(rows)} ok={len(ok_items)} bad={len(bad_items)}")
            return 0 if not bad_items else 1

        # NORMAL MODE: print errors; optionally strict prevents any state changes.
        if bad_items and not as_json:
            log("❌ validation failed:")
            for it in bad_items:
                log(f"  - {it['key']}: " + "; ".join(it["errors"]))
            if getattr(args, "strict", False) and ok_ids:
                log("ℹ️ strict mode: not applying any state changes")

        if getattr(args, "strict", False) and bad_items:
            if as_json:
                print(
                    json.dumps(
                        {
                            "validator_profile": VALIDATOR_PROFILE,
                            "checked": len(rows),
                            "ok": len(ok_items),
                            "bad": len(bad_items),
                            "updated": 0,
                            "items": ok_items + bad_items,
                        },
                        ensure_ascii=False,
                        indent=2,
                    )
                )
            return 2

        updated = 0
        now = _utcnow_iso()
        who = (args.who or "KB").strip()
        note = (args.note or "validated").strip()

        for fid in ok_ids:
            row = conn.execute("SELECT state, meta_json FROM kb_fragments WHERE id=?", (fid,)).fetchone()
            if not row:
                continue

            from_state = str(row["state"] or "").strip()

            # Don't auto-mutate terminal-ish states in normal validate mode.
            if from_state in {"validated", "enabled", "archived"}:
                continue

            cur = conn.execute(
                "UPDATE kb_fragments SET state='validated', updated_at=?, meta_json=? WHERE id=?",
                (
                now,
                _merge_meta_json(row["meta_json"], {"validator_profile": VALIDATOR_PROFILE}),
                fid,
                )
            )
            if cur.rowcount:
                updated += int(cur.rowcount)
                conn.execute(
                    """
                    INSERT INTO kb_events(fragment_id, from_state, to_state, who, note, ts)
                    VALUES(?,?,?,?,?,?)
                    """.strip(),
                    (fid, from_state, "validated", who, note, now),
                )

        conn.commit()

        if as_json:
            print(
                json.dumps(
                    {
                        "checked": len(rows),
                        "ok": len(ok_items),
                        "bad": len(bad_items),
                        "updated": updated,
                        "items": ok_items + bad_items,
                    },
                    ensure_ascii=False,
                    indent=2,
                )
            )
        else:
            log(f"✅ validate ok: checked={len(rows)} ok={len(ok_items)} updated={updated} bad={len(bad_items)}")

        return 0 if not bad_items else 1
    finally:
        conn.close()


def cmd_build(args: argparse.Namespace) -> int:
    """Build production DB from staging.

    What it does:
      1) UPSERT all staging fragments with state='enabled' into prod knowledge_items (is_active=1)
      2) AUTO-DEACTIVATE in prod (is_active=0) any items that are "managed by staging"
         but are NOT enabled in staging anymore.

    Dry-run:
      - If --dry-run is set, we execute changes inside a transaction and ROLLBACK at the end.
      - Output still shows what WOULD be inserted/updated/deactivated.

    Safety:
      - We deactivate ONLY keys that exist in staging (managed_keys).
      - We do NOT touch prod-only seeded keys (e.g., natal.*) that are absent from staging.
    """
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

        inserted_pairs: list[tuple[str, str]] = []
        updated_pairs: list[tuple[str, str]] = []
        deactivated_pairs: list[tuple[str, str]] = []
        skipped_not_managed = 0


        # 1) Upsert enabled -> prod (active)
        for r in enabled_rows:
            key = str(r["key"])
            locale = str(r["locale"])
            topic = str(r["topic_category"])
            text_ = str(r["text"] or "")
            created_at = str(r["created_at"] or _utcnow_iso())

            meta = {
                "tone": str(r["tone"]),
                "abstraction_level": str(r["abstraction_level"]),
                "validator_profile": _json_load_dict(r["meta_json"]).get("validator_profile"),
                "kb_fragment_id": int(r["id"]),
                "source_id": (int(r["source_id"]) if r["source_id"] is not None else None),
                "author": (str(r["author"]) if r["author"] is not None else None),
            }
            meta_json = json.dumps(meta, ensure_ascii=False)

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

        # 2) Auto-deactivate: managed in staging but not enabled anymore
        managed_pairs = staging.execute("SELECT DISTINCT key, locale FROM kb_fragments").fetchall()
        managed_set = {(str(r["key"]), str(r["locale"])) for r in managed_pairs}

        enabled_pairs = staging.execute(
            "SELECT DISTINCT key, locale FROM kb_fragments WHERE state='enabled'"
        ).fetchall()
        enabled_set = {(str(r["key"]), str(r["locale"])) for r in enabled_pairs}

        to_deactivate = sorted(managed_set - enabled_set)
        for key, locale in to_deactivate:
            row = prod.execute(
                "SELECT id, is_active, meta_json FROM knowledge_items WHERE key=? AND locale=?",
                (key, locale),
            ).fetchone()
            if not row:
                continue

            if not _is_managed_by_build(row["meta_json"]):
                skipped_not_managed += 1
                continue

            cur = prod.execute(
                "UPDATE knowledge_items SET is_active=0 WHERE id=? AND is_active<>0",
                (int(row["id"]),),
            )
            n = int(cur.rowcount or 0)
            if n > 0:
                deactivated += n
                deactivated_pairs.append((key, locale))

        if not dry_run:
            prod.execute("CREATE TABLE IF NOT EXISTS kb_meta (key TEXT PRIMARY KEY, value TEXT NOT NULL)")
            prod.execute(
                "INSERT OR REPLACE INTO kb_meta(key,value) VALUES(?,?)",
                ("updated_at", datetime.now().replace(microsecond=0).isoformat(timespec="seconds")),
            )
            prod.execute("INSERT OR REPLACE INTO kb_meta(key,value) VALUES(?,?)", ("enabled", str(enabled)))
            prod.execute("INSERT OR REPLACE INTO kb_meta(key,value) VALUES(?,?)", ("inserted", str(inserted)))
            prod.execute("INSERT OR REPLACE INTO kb_meta(key,value) VALUES(?,?)", ("updated", str(updated)))
            prod.execute("INSERT OR REPLACE INTO kb_meta(key,value) VALUES(?,?)", ("deactivated", str(deactivated)))

        if dry_run:
            prod.execute("ROLLBACK")
        else:
            prod.commit()

        report = {
            "dry_run": dry_run,
            "enabled": enabled,
            "inserted": inserted,
            "updated": updated,
            "deactivated": deactivated,
            "skipped_not_managed": skipped_not_managed,
            "inserted_items": [{"key": k, "locale": loc} for k, loc in inserted_pairs],
            "updated_items": [{"key": k, "locale": loc} for k, loc in updated_pairs],
            "deactivated_items": [{"key": k, "locale": loc} for k, loc in deactivated_pairs],
            "prod_path": str(_prod_db_path()),
        }

        if as_json:
            if compact:
                print(json.dumps(report, ensure_ascii=False, separators=(",", ":")))
            else:
                print(json.dumps(report, ensure_ascii=False, indent=2))
            return 0

        prefix = "🧪 dry-run" if dry_run else "✅ build ok"
        print(
            f"{prefix}: enabled={enabled} inserted={inserted} updated={updated} deactivated={deactivated}\n"
            f"   prod: {_prod_db_path()}"
        )

        if deactivated_pairs:
            preview = deactivated_pairs[:20]
            suffix = "" if len(deactivated_pairs) <= 20 else f" (+{len(deactivated_pairs) - 20} more)"
            print("🧹 deactivated keys:")
            for k, loc in preview:
                print(f"  - {k} [{loc}]")
            print(f"🧾 deactivated_total={len(deactivated_pairs)}{suffix}")

        if dry_run:
            if inserted_pairs:
                prev = inserted_pairs[:20]
                suf = "" if len(inserted_pairs) <= 20 else f" (+{len(inserted_pairs) - 20} more)"
                print("➕ would insert:")
                for k, loc in prev:
                    print(f"  - {k} [{loc}]")
                print(f"🧾 inserted_total={len(inserted_pairs)}{suf}")
            if updated_pairs:
                prev = updated_pairs[:20]
                suf = "" if len(updated_pairs) <= 20 else f" (+{len(updated_pairs) - 20} more)"
                print("✏️ would update:")
                for k, loc in prev:
                    print(f"  - {k} [{loc}]")
                print(f"🧾 updated_total={len(updated_pairs)}{suf}")

        return 0
    finally:
        staging.close()
        prod.close()


def cmd_list(args: argparse.Namespace) -> int:
    key = (getattr(args, "key", "") or "").strip()
    state = (args.state or "").strip()
    topic = (args.topic or "").strip()
    locale = (args.locale or "").strip()
    q = (args.q or "").strip()
    limit = int(args.limit or 50)

    if getattr(args, "prod", False):
        conn = _connect(_prod_db_path())
        try:
            _ensure_prod_schema(conn)

            where = ["1=1"]
            params: list[Any] = []

            if getattr(args, "active", False):
                where.append("is_active=1")
            if getattr(args, "inactive", False):
                where.append("is_active=0")
            if key:
                where.append("key = ?")
                params.append(key)

            if topic:
                where.append("topic_category = ?")
                params.append(topic)
            if locale:
                where.append("locale = ?")
                params.append(locale)
            if q:
                where.append("(key LIKE ? OR text LIKE ?)")
                params.extend([f"%{q}%", f"%{q}%"])

            sql = f"""
                SELECT id, key, topic_category, locale, is_active, priority, created_at, text
                FROM knowledge_items
                WHERE {' AND '.join(where)}
                ORDER BY priority DESC, id ASC
                LIMIT ?
            """.strip()
            params.append(limit)

            rows = conn.execute(sql, params).fetchall()
            _print_prod_rows(rows, with_text=bool(getattr(args, "with_text", False) or q))
            return 0
        finally:
            conn.close()

    conn = _connect(_staging_db_path())
    try:
        _ensure_staging_schema(conn)

        where = ["1=1"]
        params: list[Any] = []
        if key:
            where.append("key = ?")
            params.append(key)
        if state:
            where.append("state = ?")
            params.append(state)
        if topic:
            where.append("topic_category = ?")
            params.append(topic)
        if locale:
            where.append("locale = ?")
            params.append(locale)
        if q:
            where.append("(key LIKE ? OR text LIKE ?)")
            params.extend([f"%{q}%", f"%{q}%"])

        sql = f"""
            SELECT id, key, topic_category, locale, tone, abstraction_level, state, created_at
            FROM kb_fragments
            WHERE {' AND '.join(where)}
            ORDER BY id DESC
            LIMIT ?
        """.strip()
        params.append(limit)

        rows = conn.execute(sql, params).fetchall()
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
            def row_to_dict(r: sqlite3.Row) -> dict[str, Any]:
                return dict(r)

            payload = {
                "key": key,
                "staging": [row_to_dict(r) for r in st_rows],
                "production": [row_to_dict(r) for r in pr_rows],
            }
            print(json.dumps(payload, ensure_ascii=False, indent=2))
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

def cmd_restore(args: argparse.Namespace) -> int:
    """Restore a fragment to enabled in one command.

    Flow (staging only):
      archived -> needs_review -> validated -> enabled

    Notes:
      - Uses deterministic validator (_validate_fragment_row).
      - Respects rule: enabled only from validated.
      - Updates kb_events for each transition.
    """
    key = (args.key or "").strip()
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

    # Default behavior:
    # - if --build --json: print ONLY JSON by default
    # - --verbose enables human logs
    silent = run_build and build_json and not verbose

    def log(msg: str) -> None:
        if not silent:
            print(msg, file=sys.stderr)

    conn = _connect(_staging_db_path())
    try:
        _ensure_staging_schema(conn)

        if locale_filter:
            row = conn.execute(
                """
                SELECT *
                FROM kb_fragments
                WHERE key=? AND locale=?
                ORDER BY id DESC
                LIMIT 1
                """.strip(),
                (key, locale_filter),
            ).fetchone()
        else:
            row = conn.execute(
                """
                SELECT *
                FROM kb_fragments
                WHERE key=?
                ORDER BY id DESC
                LIMIT 1
                """.strip(),
                (key,),
            ).fetchone()

        if not row:
            print("ℹ️ not found in staging")
            return 0

        fid = int(row["id"])
        locale = str(row["locale"])
        state0 = str(row["state"] or "").strip()
        now = _utcnow_iso()
        sim_state = state0  # used for --dry-run to simulate transitions

        def _event(from_state: str, to_state: str, _note: str) -> None:
            if dry_run:
                return
            conn.execute(
                """
                INSERT INTO kb_events(fragment_id, from_state, to_state, who, note, ts)
                VALUES(?,?,?,?,?,?)
                """.strip(),
                (fid, from_state, to_state, who, _note, now),
            )

        def _set_state(to_state: str, _note: str) -> str:
            nonlocal sim_state

            if dry_run:
                from_state = sim_state
                log(f"🧪 dry-run: {from_state} -> {to_state} ({_note})")
                sim_state = to_state
                return to_state

            cur_state_row = conn.execute(
                "SELECT state FROM kb_fragments WHERE id=?",
                (fid,),
            ).fetchone()
            if not cur_state_row:
                raise RuntimeError("fragment disappeared during restore")

            from_state = str(cur_state_row["state"] or "").strip()

            if to_state == "validated":
                meta_row = conn.execute("SELECT meta_json FROM kb_fragments WHERE id=?", (fid,)).fetchone()
                conn.execute(
                    "UPDATE kb_fragments SET state=?, updated_at=?, meta_json=? WHERE id=?",
                    (
                        to_state,
                        now,
                        _merge_meta_json(
                            (meta_row["meta_json"] if meta_row else None),
                            {"validator_profile": VALIDATOR_PROFILE},
                        ),
                        fid,
                    ),
                )
            else:
                conn.execute(
                    "UPDATE kb_fragments SET state=?, updated_at=? WHERE id=?",
                    (to_state, now, fid),
                )
            _event(from_state, to_state, _note)

            # keep state machine in sync in non-dry-run too
            sim_state = to_state
            return to_state

        # Already enabled -> still optionally run build (or dry-run build) if requested.
        if state0 == "enabled":
            log(f"✅ restore: already enabled key={key} locale={locale}")
            if run_build:
                if dry_run:
                    log("🏗️ ...")
                    cmd_build(argparse.Namespace(dry_run=True, json=build_json, compact=build_compact))
                else:
                    log("🏗️ ...")
                    cmd_build(argparse.Namespace(dry_run=False, json=build_json, compact=build_compact))
            return 0

        # If archived -> move into review_state first so normal validate can mutate to validated.
        if state0 == "archived":
            _set_state(review_state, f"{note}: unarchive")

        # Validate deterministically (content-based; state doesn't affect validator).
        cur = conn.execute("SELECT * FROM kb_fragments WHERE id=?", (fid,)).fetchone()
        if not cur:
            print("ℹ️ not found in staging")
            return 0

        errs = _validate_fragment_row(cur)
        if errs:
            print("❌ restore blocked by validation:")
            print("  - " + "; ".join(errs))
            return 1

        # Ensure validated (state machine).
        if sim_state != "validated":
            # At this point, archived should have been moved to review_state already (even in dry-run).
            if sim_state in {"enabled", "archived"}:
                log(f"❌ restore: cannot validate from terminal state={sim_state!r}")
                return 2
            _set_state("validated", f"{note}: validated")

        # Now enable (must be from validated).
        if sim_state != "validated":
            print("❌ restore: invariant failed; expected state='validated' before enabling")
            return 2

        _set_state("enabled", f"{note}: enabled")
        if not dry_run:
            conn.commit()
            log(f"✅ restore: already enabled key={key} locale={locale}")
            if run_build:
                log("🏗️ ...")
                cmd_build(argparse.Namespace(dry_run=False, json=build_json, compact=build_compact))
        else:
            log(f"🧪 dry-run ok: key={key} locale={locale} would become enabled")
            if run_build:
                log("🏗️ ...")
                cmd_build(argparse.Namespace(dry_run=True, json=build_json, compact=build_compact))
        return 0
    finally:
        conn.close()

# ----------------------------
# Argparse
# ----------------------------

def build_parser() -> argparse.ArgumentParser:
    p = argparse.ArgumentParser(prog="kb")
    sub = p.add_subparsers(dest="cmd", required=True)

    sp = sub.add_parser("init", help="init staging.db schema")
    sp.set_defaults(func=cmd_init)

    sp = sub.add_parser("build", help="build production knowledge.db from enabled staging fragments")
    sp.add_argument("--dry-run", action="store_true", help="show what would change, but do not write to production DB")
    sp.add_argument("--json", action="store_true", help="print JSON report (works with --dry-run too)")
    sp.add_argument("--compact", action="store_true", help="with --json: print one-line JSON (no indent)")
    sp.set_defaults(func=cmd_build)

    sp = sub.add_parser("add", help="add fragment to staging")
    sp.add_argument("--key", required=True)
    sp.add_argument("--locale", default="ru-RU")
    sp.add_argument("--topic", required=True)
    sp.add_argument("--tone", required=True, choices=["supportive", "neutral", "warning"])
    sp.add_argument("--abstraction", required=True, choices=["psychological", "symbolic", "behavioral"])
    sp.add_argument("--state", default="draft",
                    choices=["draft", "needs_review", "reviewed", "annotated", "validated", "enabled", "archived"])
    sp.add_argument("--text", required=True)
    sp.add_argument("--author", default="KB")
    sp.add_argument("--who", default="KB")
    sp.add_argument("--factors-json", dest="factors_json", default="{}")
    sp.add_argument("--meta-json", dest="meta_json", default="{}")
    sp.add_argument("--source-title", dest="source_title", default="")
    sp.add_argument("--source-path", dest="source_path", default="")
    sp.add_argument("--source-notes", dest="source_notes", default="")
    sp.set_defaults(func=cmd_add)

    sp = sub.add_parser("state", help="change fragment state and write kb_events")
    sp.add_argument("--key", required=True)
    sp.add_argument("--locale", default="ru-RU")
    sp.add_argument("--to", required=True,
                    choices=["draft", "needs_review", "reviewed", "annotated", "validated", "enabled", "archived"])
    sp.add_argument("--who", default="KB")
    sp.add_argument("--note", default="")
    sp.set_defaults(func=cmd_state)

    p_val = sub.add_parser("validate", help="validate staging fragments and move to state=validated")
    p_val.add_argument("--key", default="", help="fragment key (optional)")
    p_val.add_argument("--verbose", action="store_true", help="print human-readable logs to stderr (useful with --recheck --json)")

    # If --key is provided: we do not force default state/locale filters
    # unless user explicitly provides them.
    # If --key is NOT provided: defaults stay locale=ru-RU, state=draft (old behavior).
    p_val.add_argument("--locale", default=None, help="filter by locale (optional)")
    p_val.add_argument("--state", default=None, help="filter by state (optional; default is draft when --key not provided)")

    p_val.add_argument("--limit", type=int, default=1000)
    p_val.add_argument("--who", default="KB")
    p_val.add_argument("--note", default="validated")
    p_val.add_argument("--strict", action="store_true", help="if any errors, do not update states")

    # NEW:
    p_val.add_argument("--recheck", action="store_true", help="check only (do not change states), includes terminal states")
    p_val.add_argument("--json", action="store_true", help="print JSON report (works great with --recheck)")
    p_val.set_defaults(func=cmd_validate)

    sp = sub.add_parser("list", help="list fragments in staging (default) or items in production (--prod)")
    sp.add_argument("--prod", action="store_true", help="list from production knowledge.db (knowledge_items)")
    sp.add_argument("--active", action="store_true", help="(prod) only active items")
    sp.add_argument("--inactive", action="store_true", help="(prod) only inactive items")
    sp.add_argument("--with-text", action="store_true", help="(prod) print text preview lines")
    sp.add_argument("--state", default="", help="(staging) filter by state")
    sp.add_argument("--topic", default="")
    sp.add_argument("--locale", default="")
    sp.add_argument("--key", default="", help="exact key match")
    sp.add_argument("--q", default="", help="search in key/text (LIKE)")
    sp.add_argument("--limit", type=int, default=50)
    sp.set_defaults(func=cmd_list)

    sp = sub.add_parser("show", help="show a key in staging + production")
    sp.add_argument("--key", required=True, help="exact key")
    sp.add_argument("--with-text", action="store_true", help="print full text")
    sp.add_argument("--json", action="store_true", help="print JSON")
    sp.set_defaults(func=cmd_show)

    sp = sub.add_parser("restore", help="restore a key to enabled (archived -> needs_review -> validated -> enabled)")
    sp.add_argument("--key", required=True, help="exact key")
    sp.add_argument("--locale", default=None, help="optional locale filter")
    sp.add_argument("--review-state", default="needs_review", help="state to move archived into before validating")
    sp.add_argument("--who", default="KB")
    sp.add_argument("--note", default="restore")
    sp.add_argument("--dry-run", action="store_true", help="show steps and validation, but do not change anything")
    sp.add_argument("--build", action="store_true", help="run kb build after successful restore (ignored in --dry-run)")
    sp.add_argument("--json", action="store_true", help="with --build: print build report as JSON")
    sp.add_argument("--compact", action="store_true", help="with --build --json: one-line JSON")
    sp.add_argument("--verbose", action="store_true", help="print human-readable logs even with --build --json")
    sp.set_defaults(func=cmd_restore)


    return p


def main(argv: Optional[list[str]] = None) -> int:
    parser = build_parser()
    args = parser.parse_args(argv)
    return int(args.func(args) or 0)


if __name__ == "__main__":
    raise SystemExit(main())
