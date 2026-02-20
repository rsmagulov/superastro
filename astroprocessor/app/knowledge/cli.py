# app/knowledge/cli.py
from __future__ import annotations

import argparse
import hashlib
import json
import re
import sqlite3
import sys
import contextlib
import io
import zipfile
import xml.etree.ElementTree as ET
import html
from html.parser import HTMLParser
from datetime import datetime, timezone
from pathlib import Path
from typing import Any, Optional
from dataclasses import dataclass
from app.knowledge.topic_gate_ru_natal import NatalTopicGate
from collections import Counter
from app.knowledge.quality_rating_ru import rate_fragment_ru


@dataclass
class GarbleInfo:
    score: float
    bad_lines: int

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
    print(f"❌ {msg}", file=sys.stderr)
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

def _meta_preview(meta_json: str | None, *, max_len: int = 220) -> str:
    """
    Human-friendly one-line preview of meta_json for CLI lists.
    Keeps only a small, useful subset when possible.
    """
    meta = _json_load_dict(meta_json)
    if not meta:
        return ""
    # Prefer a small subset if present (topic gate / routing / diagnostics)
    preferred_keys = [
        "topic_gate",
        "topic_reason",
        "no_topic_reason",
        "below_threshold_reason",
        "best_topic",
        "best_score",
        "near_miss",
        "near_miss_best_topic",
        "near_miss_best_score",
        "skipped_topic_reason",
        "source_chunk_id",
        "source_path",
    ]
    slim: dict[str, Any] = {k: meta[k] for k in preferred_keys if k in meta}
    obj = slim if slim else meta
    s = json.dumps(obj, ensure_ascii=False, separators=(",", ":"))
    if len(s) > max_len:
        s = s[:max_len] + "…"
    return s


def _merge_meta_json(existing: str | None, updates: dict[str, Any]) -> str:
    """Merge updates into existing meta_json, preserving other fields."""
    obj = _json_load_dict(existing)
    obj.update(updates)
    return json.dumps(obj, ensure_ascii=False)


def _is_managed_by_build(meta_json: str | None) -> bool:
    """Return True if prod meta_json marks the row as created by kb build.

    We treat a row as "managed" only if meta_json contains a positive integer
    field: kb_fragment_id.
    """
    obj = _json_load_dict(meta_json)
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

STAGING_SCHEMA_VERSION = 3

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

  quality_score INTEGER NOT NULL DEFAULT 50,
  quality_label TEXT NOT NULL DEFAULT 'D',
  quality_reasons_json TEXT NOT NULL DEFAULT '{}',
  created_at TEXT NOT NULL,
  updated_at TEXT NOT NULL,

  FOREIGN KEY (source_id) REFERENCES kb_sources(id) ON DELETE SET NULL,
  UNIQUE (key, locale)
);

CREATE INDEX IF NOT EXISTS idx_kb_fragments_state ON kb_fragments(state);
CREATE INDEX IF NOT EXISTS idx_kb_fragments_topic ON kb_fragments(topic_category);
CREATE INDEX IF NOT EXISTS idx_kb_fragments_locale ON kb_fragments(locale);
CREATE INDEX IF NOT EXISTS idx_kb_fragments_key ON kb_fragments(key);
CREATE INDEX IF NOT EXISTS idx_kb_fragments_quality_score ON kb_fragments(quality_score);

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

STAGING_SCHEMA_V2_SQL = """
-- v2 additions: richer sources + chunks + ingest runs

CREATE TABLE IF NOT EXISTS kb_source_chunks (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  source_id INTEGER NOT NULL,
  seq INTEGER NOT NULL,
  locale TEXT NOT NULL DEFAULT 'ru-RU',
  text TEXT NOT NULL,
  sha256 TEXT NOT NULL,
  char_start INTEGER NOT NULL DEFAULT 0,
  char_end INTEGER NOT NULL DEFAULT 0,
  created_at TEXT NOT NULL,
  UNIQUE(source_id, seq)
);

CREATE INDEX IF NOT EXISTS idx_kb_source_chunks_source_seq ON kb_source_chunks(source_id, seq);
CREATE INDEX IF NOT EXISTS idx_kb_source_chunks_sha256 ON kb_source_chunks(sha256);

CREATE TABLE IF NOT EXISTS kb_ingest_runs (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  started_at TEXT NOT NULL,
  finished_at TEXT,
  input_path TEXT,
  tool TEXT NOT NULL,
  tool_version TEXT NOT NULL,
  files_total INTEGER NOT NULL DEFAULT 0,
  sources_created INTEGER NOT NULL DEFAULT 0,
  sources_reused INTEGER NOT NULL DEFAULT 0,
  chunks_created INTEGER NOT NULL DEFAULT 0,
  errors_json TEXT NOT NULL DEFAULT '{}'
);
""".strip()


def _has_column(conn: sqlite3.Connection, table: str, column: str) -> bool:
    cur = conn.execute(f"PRAGMA table_info({table})")
    return any(r[1] == column for r in cur.fetchall())


def _migrate_staging_v2(conn: sqlite3.Connection) -> None:
    """Staging schema v2 migration: enrich kb_sources and add chunk/run tables."""
    if _table_exists(conn, "kb_sources"):
        if not _has_column(conn, "kb_sources", "source_type"):
            conn.execute("ALTER TABLE kb_sources ADD COLUMN source_type TEXT")
        if not _has_column(conn, "kb_sources", "author"):
            conn.execute("ALTER TABLE kb_sources ADD COLUMN author TEXT")
        if not _has_column(conn, "kb_sources", "locale"):
            conn.execute("ALTER TABLE kb_sources ADD COLUMN locale TEXT")
        if not _has_column(conn, "kb_sources", "file_name"):
            conn.execute("ALTER TABLE kb_sources ADD COLUMN file_name TEXT")
        if not _has_column(conn, "kb_sources", "file_size"):
            conn.execute("ALTER TABLE kb_sources ADD COLUMN file_size INTEGER")
        if not _has_column(conn, "kb_sources", "meta_json"):
            conn.execute("ALTER TABLE kb_sources ADD COLUMN meta_json TEXT NOT NULL DEFAULT '{}'")

    conn.executescript(STAGING_SCHEMA_V2_SQL)

def _migrate_staging_v3(conn: sqlite3.Connection) -> None:
    """Staging schema v3 migration: add quality rating columns to kb_fragments."""
    if _table_exists(conn, "kb_fragments"):
        if not _has_column(conn, "kb_fragments", "quality_score"):
            conn.execute(
                "ALTER TABLE kb_fragments ADD COLUMN quality_score INTEGER NOT NULL DEFAULT 50"
            )
        if not _has_column(conn, "kb_fragments", "quality_label"):
            conn.execute(
                "ALTER TABLE kb_fragments ADD COLUMN quality_label TEXT NOT NULL DEFAULT 'D'"
            )
        if not _has_column(conn, "kb_fragments", "quality_reasons_json"):
            conn.execute(
                "ALTER TABLE kb_fragments ADD COLUMN quality_reasons_json TEXT NOT NULL DEFAULT '{}'"
            )

    # helpful index for sorting/filtering in admin
    conn.execute(
        "CREATE INDEX IF NOT EXISTS idx_kb_fragments_quality_score ON kb_fragments(quality_score)"
    )


def _ensure_staging_schema(conn: sqlite3.Connection) -> None:
    """Ensure staging schema exists and is migrated forward."""
    if not _table_exists(conn, "kb_fragments"):
        conn.executescript(STAGING_SCHEMA_SQL)
        _migrate_staging_v2(conn)
        conn.execute(
            "INSERT OR REPLACE INTO kb_schema_meta(key,value) VALUES(?,?)",
            ("schema_version", str(STAGING_SCHEMA_VERSION)),
        )
        conn.execute(
            "INSERT OR REPLACE INTO kb_schema_meta(key,value) VALUES(?,?)",
            ("initialized_at", _utcnow_iso()),
        )
        conn.commit()
        return

    cur = conn.execute("SELECT value FROM kb_schema_meta WHERE key='schema_version'")
    row = cur.fetchone()
    version = int(row[0]) if row and str(row[0]).isdigit() else 1

    if version < 2:
        _migrate_staging_v2(conn)
    conn.execute(
        "INSERT OR REPLACE INTO kb_schema_meta(key,value) VALUES(?,?)",
        ("schema_version", "2"),
    )
    conn.commit()
    version = 2

    if version < 3:
        _migrate_staging_v3(conn)
        conn.execute(
            "INSERT OR REPLACE INTO kb_schema_meta(key,value) VALUES(?,?)",
            ("schema_version", "3"),
        )
        conn.commit()

def _table_columns(conn: sqlite3.Connection, table: str) -> set[str]:
    rows = conn.execute(f"PRAGMA table_info({table})").fetchall()
    return {str(r["name"]) for r in rows}


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


def _print_rows(
    rows: list[sqlite3.Row],
    *,
    show_reasons: bool = False,
    reasons_top: int = 5,
    show_text: int = 0,
    with_meta: bool = False,
    meta_max: int = 220,
) -> None:
    for r in rows:
        keys = set(r.keys())
        q_score = int(r["quality_score"]) if "quality_score" in keys and r["quality_score"] is not None else None
        q_label = str(r["quality_label"]) if "quality_label" in keys and r["quality_label"] is not None else None

        line = (
            f"{int(r['id']):<8} {str(r['key']):<36} {str(r['topic_category']):<22} "
            f"{str(r['locale']):<7} {str(r['tone']):<12} {str(r['abstraction_level']):<14} {str(r['state']):<12}"
        )
        if q_score is not None:
            line += f" {q_score:>3} {q_label or ''}"
        print(line)
        print(f"        {str(r['created_at'])}")

        if show_text and "text" in keys:
            t = (r["text"] or "").replace("\r", " ").replace("\n", " ").strip()
            if t:
                n = max(1, int(show_text))
                if len(t) > n:
                    t = t[:n] + "…"
                print(f"        text: {t}")

        if with_meta and "meta_json" in keys:
            mp = _meta_preview(r["meta_json"], max_len=int(meta_max or 220))
            if mp:
                print(f"        meta: {mp}")

        if show_reasons and "quality_reasons_json" in keys:
            raw = (r["quality_reasons_json"] or "{}").strip()
            try:
                d = json.loads(raw) if raw else {}
            except Exception:
                d = {}
            if isinstance(d, dict) and d:
                def _val(x: Any) -> float:
                    return float(x) if isinstance(x, (int, float)) else 0.0

                top_n = max(1, int(reasons_top or 5))
                items = sorted(d.items(), key=lambda kv: _val(kv[1]), reverse=True)[:top_n]
                pretty = ", ".join([f"{k}:{v}" for k, v in items])
                print(f"        reasons: {pretty}")





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

def _collect_quality_metrics(conn: sqlite3.Connection) -> dict[str, Any]:
    row = conn.execute(
        """
        SELECT
          COUNT(*) AS fragments_total,
          SUM(CASE WHEN state='enabled' THEN 1 ELSE 0 END) AS enabled_total,
          SUM(CASE WHEN state='needs_review' THEN 1 ELSE 0 END) AS needs_review_total,
          SUM(CASE WHEN state='archived' THEN 1 ELSE 0 END) AS archived_total,
          MIN(quality_score) AS min_score,
          AVG(quality_score) AS avg_score,
          MAX(quality_score) AS max_score
        FROM kb_fragments
        """
    ).fetchone()

    labels = conn.execute(
        "SELECT quality_label, COUNT(*) AS c FROM kb_fragments GROUP BY quality_label ORDER BY c DESC"
    ).fetchall()
    label_counts = {str(r["quality_label"]): int(r["c"]) for r in labels}

    def bucket(score: int) -> str:
        if score <= 44:
            return "0-44"
        if score <= 54:
            return "45-54"
        if score <= 69:
            return "55-69"
        if score <= 84:
            return "70-84"
        return "85-100"

    buckets = Counter()
    for r in conn.execute("SELECT quality_score FROM kb_fragments").fetchall():
        buckets[bucket(int(r["quality_score"] or 0))] += 1

    return {
        "fragments_total": int(row["fragments_total"] or 0),
        "enabled_total": int(row["enabled_total"] or 0),
        "needs_review_total": int(row["needs_review_total"] or 0),
        "archived_total": int(row["archived_total"] or 0),
        "min_score": int(row["min_score"] or 0),
        "avg_score": float(row["avg_score"] or 0.0),
        "max_score": int(row["max_score"] or 0),
        "labels": label_counts,
        "buckets": dict(buckets),
    }


def _compare_metrics_with_baseline(current: dict[str, Any], baseline: dict[str, Any]) -> list[str]:
    warns: list[str] = []

    def _get(d: dict[str, Any], k: str, default: Any) -> Any:
        return d.get(k, default)

    # Simple deltas (tune thresholds later)
    cur_enabled = int(_get(current, "enabled_total", 0))
    base_enabled = int(_get(baseline, "enabled_total", 0))
    if base_enabled and cur_enabled < int(base_enabled * 0.85):
        warns.append(f"enabled_total_drop: {cur_enabled} vs baseline {base_enabled}")

    cur_avg = float(_get(current, "avg_score", 0.0))
    base_avg = float(_get(baseline, "avg_score", 0.0))
    if base_avg and cur_avg < (base_avg - 3.0):
        warns.append(f"avg_score_drop: {cur_avg:.2f} vs baseline {base_avg:.2f}")

    # Bucket drift
    cur_b = _get(current, "buckets", {}) or {}
    base_b = _get(baseline, "buckets", {}) or {}
    for k in sorted(set(cur_b) | set(base_b)):
        c = int(cur_b.get(k, 0))
        b = int(base_b.get(k, 0))
        if b and abs(c - b) > max(10, int(b * 0.25)):
            warns.append(f"bucket_drift[{k}]: {c} vs baseline {b}")

    return warns


# ----------------------------
# Commands
# ----------------------------


def cmd_init(args: argparse.Namespace) -> int:
    sp = _staging_db_path()
    conn = _connect(sp)
    try:
        # IMPORTANT:
        # - Do NOT executescript(STAGING_SCHEMA_SQL) unconditionally.
        #   It breaks when an existing DB is older (no quality_* columns),
        #   because STAGING_SCHEMA_SQL tries to create an index on quality_score.
        _ensure_staging_schema(conn)

        # Ensure meta present/updated
        conn.execute(
            "INSERT OR REPLACE INTO kb_schema_meta(key,value) VALUES(?,?)",
            ("schema_version", str(STAGING_SCHEMA_VERSION)),
        )
        conn.execute(
            "INSERT OR REPLACE INTO kb_schema_meta(key,value) VALUES(?,?)",
            ("initialized_at", _utcnow_iso()),
        )
        conn.commit()
        print(f"✅ staging db initialized/migrated: {sp}", file=sys.stderr)
    finally:
        conn.close()

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

        qr = rate_fragment_ru(text_)
        quality_score = int(qr.score)
        quality_label = str(qr.label)
        quality_reasons_json = json.dumps(qr.reasons, ensure_ascii=False)


        cur = conn.execute(
            """
            INSERT INTO kb_fragments(
            key, locale, topic_category, text, tone, abstraction_level, state,
            factors_json, meta_json, source_id, author,
            quality_score, quality_label, quality_reasons_json,
            created_at, updated_at
            )
            VALUES(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)
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
                quality_score,
                quality_label,
                quality_reasons_json,
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
        print(f"✅ added: id={fid} key={key} state={state} locale={locale} topic={topic}", file=sys.stderr)
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
            print(
                "❌ cannot enable: fragment must be in 'validated' state first (run: kb validate ...)",
                file=sys.stderr,
            )
            return 3

        if from_state == to_state:
            print(f"ℹ️ state unchanged: {key} already {to_state}", file=sys.stderr)
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

        # ВАЖНО: stdout оставляем чистым (для пайпов/JSON), поэтому всё — в stderr.
        print(f"✅ state: key={key} locale={locale} {from_state} -> {to_state}", file=sys.stderr)
        return 0
    finally:
        conn.close()


def _validate_fragment_row(row: sqlite3.Row) -> list[str]:
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
        min_len = 60
        max_len = 2000
        if len(text_stripped) < min_len:
            errs.append(f"text too short (<{min_len} chars)")
        if len(text_stripped) > max_len:
            errs.append(f"text too long (>{max_len} chars)")

        lines = [ln.strip() for ln in text_stripped.splitlines() if ln.strip()]
        first_line = lines[0] if lines else ""
        first_line_alpha = re.sub(r"[^A-Za-zА-Яа-яЁё]", "", first_line)

        if first_line and first_line_alpha:
            is_all_caps = first_line_alpha.upper() == first_line_alpha
            if is_all_caps and (len(first_line_alpha) >= 8) and (len(lines) >= 2):
                errs.append("starts with ALL-CAPS headline")

        if text_raw.count("\n") >= 8:
            errs.append("too many newlines (>=8)")
        if re.search(r"\n\s*\n\s*\n", text_raw):
            errs.append("contains 3+ consecutive blank lines")

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

        if "```" in text_raw:
            errs.append("contains code fence ```")
        if "http://" in low or "https://" in low:
            errs.append("contains URL")

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
        locale_arg = args.locale
        state_arg = args.state
        recheck = bool(getattr(args, "recheck", False))
        as_json = bool(getattr(args, "json", False))
        verbose = bool(getattr(args, "verbose", False))
        silent = recheck and as_json and not verbose

        def log(msg: str) -> None:
            if not silent:
                print(msg, file=sys.stderr)

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

        if recheck:
            if as_json:
                print(
                    json.dumps(
                        {
                            "validator_profile": VALIDATOR_PROFILE_RU_V1,
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

            if from_state in {"validated", "enabled", "archived"}:
                continue

            row2 = conn.execute(
                "SELECT meta_json FROM kb_fragments WHERE id=?",
                (fid,),
            ).fetchone()
            meta = _json_load_dict(row2["meta_json"] if row2 else None)
            meta["validator_profile"] = VALIDATOR_PROFILE_RU_V1

            cur = conn.execute(
                "UPDATE kb_fragments SET state='validated', meta_json=?, updated_at=? WHERE id=?",
                (json.dumps(meta, ensure_ascii=False), now, fid),
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
                        "validator_profile": VALIDATOR_PROFILE,
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

def cmd_validate_release(args: argparse.Namespace) -> int:
    """
    Release policy validation for staging DB before kb build.

    Hard-fail:
      - enabled must have quality_score >= min_enabled_score
      - enabled must not contain label 'F'
      - enabled must not contain forbidden patterns (safety lint)
      - required topic_category coverage (min per category)

    Optional:
      - baseline comparison for regressions (warn or fail)
    """
    min_enabled_score = int(getattr(args, "min_enabled_score", 55) or 55)
    min_per_topic = int(getattr(args, "min_per_topic", 3) or 3)
    required_topics_raw = (getattr(args, "required_topics", "") or "").strip()
    baseline_path = (getattr(args, "baseline", "") or "").strip()
    write_baseline = bool(getattr(args, "write_baseline", False))
    fail_on_warn = bool(getattr(args, "fail_on_warn", False))

    # Default required topics: keep small and core; extend later.
    required_topics = [t.strip() for t in required_topics_raw.split(",") if t.strip()]

    # Simple RU safety lint (extend later)
    forbidden_patterns = [
        r"\b(ты\s+точно|тебе\s+предначертано|это\s+судьба)\b",
        r"\b(обречен|обречена|обречены)\b",
        r"\b(диагноз|псих(иатр|ическое)\s+расстройство)\b",
        r"\b(умр(её|ешь|ет|ут)|смерть\s+скоро)\b",
        r"\b(точно\s+развед(ешься|етесь)|точно\s+уйд(ёшь|ете))\b",
        r"\b(гарантированно|неизбежно)\b",
    ]
    forbidden_re = re.compile("|".join(f"(?:{p})" for p in forbidden_patterns), re.IGNORECASE)

    conn = _connect(_staging_db_path())
    try:
        _ensure_staging_schema(conn)

        # 1) enabled score gate
        bad_score = conn.execute(
            """
            SELECT COUNT(*) AS c
            FROM kb_fragments
            WHERE state='enabled' AND quality_score < ?
            """,
            (min_enabled_score,),
        ).fetchone()["c"]

        # 2) enabled no F
        bad_f = conn.execute(
            """
            SELECT COUNT(*) AS c
            FROM kb_fragments
            WHERE state='enabled' AND quality_label='F'
            """
        ).fetchone()["c"]

        # 3) forbidden patterns in enabled
        enabled_texts = conn.execute(
            "SELECT id, text FROM kb_fragments WHERE state='enabled'"
        ).fetchall()
        forbidden_hits = []
        for r in enabled_texts:
            t = (r["text"] or "").strip()
            if t and forbidden_re.search(t):
                forbidden_hits.append(int(r["id"]))
        forbidden_count = len(forbidden_hits)

        # 4) coverage guard
        missing_topics: dict[str, int] = {}
        if required_topics:
            for topic in required_topics:
                c = conn.execute(
                    """
                    SELECT COUNT(*) AS c
                    FROM kb_fragments
                    WHERE state='enabled' AND topic_category=?
                    """,
                    (topic,),
                ).fetchone()["c"]
                if int(c) < min_per_topic:
                    missing_topics[topic] = int(c)


        # Metrics snapshot
        metrics = _collect_quality_metrics(conn)

        hard_fail_reasons = []
        if int(bad_score) > 0:
            hard_fail_reasons.append(f"enabled_quality_below_{min_enabled_score}={bad_score}")
        if int(bad_f) > 0:
            hard_fail_reasons.append(f"enabled_label_F={bad_f}")
        if forbidden_count > 0:
            hard_fail_reasons.append(f"enabled_forbidden_text={forbidden_count}")
        if missing_topics:
            hard_fail_reasons.append(f"coverage_missing_topics={missing_topics}")

        warns = []
        baseline_obj = None
        if baseline_path and (not write_baseline):
            try:
                baseline_obj = json.load(open(baseline_path, "r", encoding="utf-8-sig"))
            except Exception as e:
                warns.append(f"baseline_load_failed: {e}")


        if baseline_obj:
            warns.extend(_compare_metrics_with_baseline(metrics, baseline_obj))

        if write_baseline:
            out = baseline_path or "kb_validate_baseline.json"
            with open(out, "w", encoding="utf-8") as f:
                json.dump(metrics, f, ensure_ascii=False, indent=2)
            print(f"baseline_written: {out}", file=sys.stderr)

        # Report (json to stdout if requested)
        report = {
            "ok": not hard_fail_reasons and not (fail_on_warn and warns),
            "hard_fail": hard_fail_reasons,
            "warn": warns,
            "min_enabled_score": min_enabled_score,
            "required_topics": required_topics,
            "min_per_topic": min_per_topic,
            "forbidden_hits_sample": forbidden_hits[:20],
            "metrics": metrics,
        }

        as_json = bool(getattr(args, "json", False))
        if as_json:
            print(json.dumps(report, ensure_ascii=False))
        else:
            if hard_fail_reasons:
                print("VALIDATE RELEASE: FAIL", file=sys.stderr)
                for x in hard_fail_reasons:
                    print(f"  - {x}", file=sys.stderr)
            else:
                print("VALIDATE RELEASE: OK (hard checks)", file=sys.stderr)
            if warns:
                print("WARN:", file=sys.stderr)
                for w in warns:
                    print(f"  - {w}", file=sys.stderr)

        return 0 if report["ok"] else 2
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

        if dry_run:
            prod.execute("ROLLBACK")
        else:
            prod.execute("CREATE TABLE IF NOT EXISTS kb_meta (key TEXT PRIMARY KEY, value TEXT NOT NULL)")
            prod.execute(
                "INSERT OR REPLACE INTO kb_meta(key,value) VALUES(?,?)",
                ("updated_at", datetime.now().replace(microsecond=0).isoformat(timespec="seconds")),
            )
            prod.execute("INSERT OR REPLACE INTO kb_meta(key,value) VALUES(?,?)", ("enabled", str(enabled)))
            prod.execute("INSERT OR REPLACE INTO kb_meta(key,value) VALUES(?,?)", ("inserted", str(inserted)))
            prod.execute("INSERT OR REPLACE INTO kb_meta(key,value) VALUES(?,?)", ("updated", str(updated)))
            prod.execute("INSERT OR REPLACE INTO kb_meta(key,value) VALUES(?,?)", ("deactivated", str(deactivated)))
            prod.commit()

        report = {
            "dry_run": dry_run,
            "enabled": enabled,
            "inserted": inserted,
            "updated": updated,
            "deactivated": deactivated,
            "skipped_not_managed": skipped_not_managed,
            "validator_profile": VALIDATOR_PROFILE,
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
            f"   prod: {_prod_db_path()}",
            file=sys.stderr,
        )
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
    source_id = int(getattr(args, "source_id", 0) or 0)
    needs_rewrite_only = bool(getattr(args, "needs_rewrite_only", False))
    bot_ready_only = bool(getattr(args, "bot_ready_only", False))

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
                SELECT id, key, topic_category, locale, is_active, priority, created_at, meta_json, text
                FROM knowledge_items
                WHERE {' AND '.join(where)}
                ORDER BY priority DESC, id ASC
                LIMIT ?
            """.strip()
            params.append(limit)

            rows = conn.execute(sql, params).fetchall()

            needs_rewrite_only = bool(getattr(args, "needs_rewrite_only", False))
            bot_ready_only = bool(getattr(args, "bot_ready_only", False))

            if needs_rewrite_only or bot_ready_only:
                filtered: list[sqlite3.Row] = []
                for r in rows:
                    meta = _json_load_dict(r["meta_json"])
                    requires_rewrite = bool(meta.get("requires_rewrite", False))
                    has_addr = bool(_DIRECT_ADDRESS_RE.search(str(r["text"] or "")))

                    if needs_rewrite_only and not requires_rewrite:
                        continue
                    if bot_ready_only and not has_addr:
                        continue
                    filtered.append(r)
                rows = filtered

            _print_rows(rows)
            return 0
        finally:
            conn.close()

    conn = _connect(_staging_db_path())
    try:
        _ensure_staging_schema(conn)

        where = ["1=1"]
        params = []
        if key:
            where.append("key = ?")
            params.append(key)
        if state:
            where.append("state = ?")
            params.append(state)
        if source_id:
            where.append("source_id = ?")
            params.append(source_id)
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
            SELECT id, key, topic_category, locale, tone, abstraction_level, state, created_at, meta_json, text
            FROM kb_fragments
            WHERE {' AND '.join(where)}
            ORDER BY id DESC
            LIMIT ?
        """.strip()

        sql_limit = limit
        if needs_rewrite_only or bot_ready_only:
            sql_limit = max(limit * 50, 500)

        params.append(sql_limit)
        rows = conn.execute(sql, params).fetchall()

        if needs_rewrite_only or bot_ready_only:
            filtered: list[sqlite3.Row] = []
            for r in rows:
                meta = _json_load_dict(r["meta_json"])
                requires_rewrite = bool(meta.get("requires_rewrite", False))
                bot_ready = bool(_DIRECT_ADDRESS_RE.search(str(r["text"] or "")))

                if needs_rewrite_only and not requires_rewrite:
                    continue
                if bot_ready_only and not bot_ready:
                    continue
                filtered.append(r)
            rows = filtered[:limit]

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
        sim_state = state0

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

            cur_state_row = conn.execute("SELECT state FROM kb_fragments WHERE id=?", (fid,)).fetchone()
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
                        _merge_meta_json((meta_row["meta_json"] if meta_row else None), {"validator_profile": VALIDATOR_PROFILE}),
                        fid,
                    ),
                )
            else:
                conn.execute("UPDATE kb_fragments SET state=?, updated_at=? WHERE id=?", (to_state, now, fid))
            _event(from_state, to_state, _note)
            sim_state = to_state
            return to_state

        if state0 == "enabled":
            log(f"✅ restore: already enabled key={key} locale={locale}")
            if run_build:
                cmd_build(argparse.Namespace(dry_run=dry_run, json=build_json, compact=build_compact))
            return 0

        if state0 == "archived":
            _set_state(review_state, f"{note}: unarchive")

        cur = conn.execute("SELECT * FROM kb_fragments WHERE id=?", (fid,)).fetchone()
        if not cur:
            print("ℹ️ not found in staging")
            return 0

        errs = _validate_fragment_row(cur)
        if errs:
            print("❌ restore blocked by validation:")
            print("  - " + "; ".join(errs))
            return 1

        if sim_state != "validated":
            if sim_state in {"enabled", "archived"}:
                log(f"❌ restore: cannot validate from terminal state={sim_state!r}")
                return 2
            _set_state("validated", f"{note}: validated")

        if sim_state != "validated":
            print("❌ restore: invariant failed; expected state='validated' before enabling")
            return 2

        _set_state("enabled", f"{note}: enabled")
        if not dry_run:
            conn.commit()
        log(f"✅ restore ok: key={key} locale={locale} -> enabled")

        if run_build:
            cmd_build(argparse.Namespace(dry_run=dry_run, json=build_json, compact=build_compact))
        return 0
    finally:
        conn.close()


# ----------------------------
# Ingest / Atomize (FB2)
# ----------------------------

_DIRECT_ADDRESS_RE = re.compile(
    r"\b(ты|тебе|твой|твоя|твои|вас|вам|ваш|ваша|ваши|у\s+тебя|у\s+вас)\b", re.IGNORECASE
)
_DOMAIN_RE = re.compile(
    r"(?i)\b(?:[a-z0-9](?:[a-z0-9-]{0,61}[a-z0-9])?\.)+(?:ru|com|net|org|pro|io|mg|tv|me|info|biz)(?:/[^\s<>()\"']*)?"
)

VALIDATOR_PROFILE_RU_V1 = "ru_v1"

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
    s = s.strip()
    s = re.sub(r"^[©\u00a9]+\s*", "", s)  # “©Далее…” → “Далее…”
    if not s:
        return ""

    if _looks_like_mojibake(s):
        s2 = _try_unmojibake_cp866(s)
        s = s2 if s2 != s else _try_unmojibake_cp1251(s)

    return s

_GARBLE_HARD_CHARS_RE = re.compile(r"[\u2500-\u259F\u00A4\uFFFD]")  # box + '¤' + '�'
_GARBLE_C1_CONTROLS_RE = re.compile(r"[\u0080-\u009F]")            # C1 control block

_GARBLE_MOJIBAKE_RE = re.compile(
    r"(?:"                    # any of:
    r"[ÐÑ][\u0080-\u00FF]"     # UTF-8 bytes mis-decoded as latin1: "Ð¸", "Ñ", ...
    r"|[РС][\u0080-\u00FF]"    # cp1251/latin1 artifacts: "Р°", "СЃ", ...
    r"|â€[\u0080-\u00FF]"      # smart quotes/dash: "â€”", "â€œ", ...
    r"|вЂ[\u0080-\u00FF]"     # same family: "вЂ”", "вЂњ", ...
    r"|тА[^\s]"               # very common RU mojibake token family: "тАФ", "тАж", ...
    r")"
)
_GARBLE_SOFT_BLOCKS_RE = re.compile(r"[╨╤╥╦╧╩╪╫╬]")

# Маркеры битой декодировки (несколько популярных "семейств"):
# 1) UTF-8 -> cp1251: "Р…/С…/вЂ…"
# 2) UTF-8 -> latin1: "Ð…/Ñ…"
# 3) UTF-8 -> cp866/koi8-r: "╨╤…", "тАФ", "┬л", "О╩©", "Б─▌", "п╣п╦..." и т.п.
_MOJIBAKE_RE = re.compile(
    r"(?:"
    r"[РС][\u0080-\u00FF]"          # e.g. "Р°", "СЃ" (cp1251/latin1 artifacts)
    r"|[ÐÑ][\u0080-\u00FF]"         # e.g. "Ð¸", "Ñ" (UTF-8 decoded as latin1)
    r"|â€[\u0080-\u00FF]"           # e.g. "â€”", "â€œ"
    r"|вЂ[\u0080-\u00FF]"           # e.g. "вЂ”", "вЂњ"
    r"|тАФ"                         # common RU mojibake token
    r"|[╨╤╥╦╧╩╪╫╬]"                 # box-drawing-ish blocks often from cp866/koi8 leaks
    r")"
)

_GLOSSARY_DEF_LINE_RE = re.compile(
    r"^\s*[A-ZА-ЯЁ]{3,}(?:\s+[A-ZА-ЯЁ]{3,})*\s*[—\-:]\s+",
    flags=re.UNICODE,
)

def _looks_like_mojibake(s: str) -> bool:
    """
    Heuristic mojibake detector.

    Returns True only when there are strong signals of broken decoding.
    Must NOT trigger on normal Russian text.
    """
    if not s:
        return False

    # Quick pass: count strong markers
    hits = len(_MOJIBAKE_RE.findall(s))

    # If no markers — definitely not mojibake
    if hits == 0:
        return False

    # Normalize by length; require enough density to avoid false positives.
    # For typical clean RU text: hits should be 0.
    # For mojibake blocks: hits is usually large.
    density = hits / max(len(s), 1)

    # Very short strings: require at least 2 hits to avoid random false positives
    if len(s) < 80:
        return hits >= 2

    # Longer strings: require both absolute hits and density
    return hits >= 3 and density >= 0.001


def _garble_score(s: str) -> float:
    """
    Stable garble score in [0..1].

    Principles:
      - 0.0 for normal text (incl. Russian punctuation/quotes/dashes).
      - Hard artifacts (box-drawing, '�', C1 controls) push score up quickly.
      - Mojibake markers add score proportionally, but require more than a single случайный hit.
      - Deterministic: score depends only on counts/ratios, no early magic returns.

    Recommended thresholds:
      - for chunks:   0.02 .. 0.05 (start conservative)
      - for atoms:    0.05 .. 0.10 (atoms are shorter; allow more noise)
    """
    s = s or ""
    if not s.strip():
        return 0.0

    n = len(s)

    # --- count signals ---
    hard = len(_GARBLE_HARD_CHARS_RE.findall(s))
    c1   = len(_GARBLE_C1_CONTROLS_RE.findall(s))
    moj  = len(_GARBLE_MOJIBAKE_RE.findall(s))
    soft = len(_GARBLE_SOFT_BLOCKS_RE.findall(s))

    # --- hard ratio: these are strong evidence of wrong decoding ---
    hard_ratio = hard / n
    c1_ratio   = c1 / n

    # --- mojibake ratio: strong only if not a single случайность ---
    # Ignore single mojibake hit in long text (common false positive guard).
    if moj == 1 and n >= 200:
        moj_eff = 0
    else:
        moj_eff = moj
    moj_ratio = moj_eff / n

    # --- soft blocks: contribute weakly (to avoid false positives) ---
    soft_ratio = soft / n

    # --- scoring (smooth, predictable) ---
    # Weighting:
    #  - hard artifacts dominate quickly
    #  - C1 controls also strong
    #  - mojibake medium-strong, but guarded by moj_eff logic
    #  - soft blocks weak
    score = 0.0
    score += min(1.0, hard_ratio * 25.0)   # 1 hard per 100 chars => 0.25
    score += min(1.0, c1_ratio   * 20.0)   # C1 controls are very suspicious
    score += min(1.0, moj_ratio  * 30.0)   # mojibake density
    score += min(1.0, soft_ratio * 5.0)    # weak hint

    # Extra bump rules (still deterministic):
    # - If there are many hard artifacts, clamp high.
    if hard >= 3:
        score = max(score, 0.7)
    # - If mojibake hits are clearly multiple, ensure it's visible.
    if moj_eff >= 3:
        score = max(score, 0.25)

    # clamp
    if score < 0.0:
        return 0.0
    if score > 1.0:
        return 1.0
    return float(score)


def _try_unmojibake_cp866(s: str) -> str:
    """
    UTF-8 bytes were decoded as cp866 -> reverse:
    """
    try:
        fixed = s.encode("cp866", errors="strict").decode("utf-8", errors="strict")
    except Exception:
        return s

    if len(_MOJIBAKE_RE.findall(fixed)) < len(_MOJIBAKE_RE.findall(s)):
        return fixed
    return s

def _try_unmojibake_cp866(s: str) -> str:
    # UTF-8 bytes were decoded as cp866 => reverse:
    try:
        fixed = s.encode("cp866", errors="strict").decode("utf-8", errors="strict")
    except Exception:
        return s

    if len(_MOJIBAKE_RE.findall(fixed)) < len(_MOJIBAKE_RE.findall(s)):
        return fixed
    return s


def _try_unmojibake_cp1251(s: str) -> str:
    """
    UTF-8 bytes were decoded as cp1251 -> reverse:
    """
    try:
        fixed = s.encode("cp1251", errors="strict").decode("utf-8", errors="strict")
    except Exception:
        return s

    if len(_MOJIBAKE_RE.findall(fixed)) < len(_MOJIBAKE_RE.findall(s)):
        return fixed
    return s

# ----------------------------
# Sanitation (atomize gate, v1)
# ----------------------------

_HTML_ENTITY_RE = re.compile(r"&(?:nbsp|amp|quot|lt|gt|apos|#\d+);", re.IGNORECASE)

# Считаем HTML только если встречаются "взрослые" теги, а не мусор вроде <j>.
_HTML_TAG_RE = re.compile(
    r"(?is)</?\s*(?:p|br|div|span|ul|ol|li|table|tr|td|th|h[1-6]|strong|em|b|i|a|img)\b[^>]*>"
)
_TOC_TITLE_RE = re.compile(r"(?i)\b(содержание|оглавление|contents|table\s+of\s+contents)\b")
_TOC_LINE_RE = re.compile(r"^\s*.+?(?:\.{2,}|…{2,}|\s{2,})\s*\d{1,5}\s*$")
_PAGE_NUM_RE = re.compile(r"^\s*\d{1,5}\s*$")

_ISBN_RE = re.compile(r"(?i)\bISBN(?:-1[03])?:?\s*[0-9Xx][0-9Xx\-\s]{8,}")
_UDC_BBK_RE = re.compile(r"(?i)\b(?:УДК|ББК)\b")
_COPYRIGHT_RE = re.compile(r"(?:©|\u00a9|\ball rights reserved\b)", re.IGNORECASE)

_PUBLISHER_TAIL_RE = re.compile(
    r"(?i)\b(издательств\w*|тираж|заказ\s*№|подписано\s+в\s+печать|отпечатано|верстка|корректор|редактор|ответственный\s+редактор)\b"
)

_WS_RE = re.compile(r"\s+")
_NONPRINTABLE_RE = re.compile(r"[\x00-\x08\x0b\x0c\x0e-\x1f]")

# --- sanitation v2 helpers (atom-level) ---

_SENT_END_RE = re.compile(r"[.!?…]+")
_ISBN_RE = re.compile(r"\bISBN\b|\bИСБН\b", re.IGNORECASE)
_QR_RE = re.compile(r"\bQR\b|\bкьюар\b|\bqr-?код\b", re.IGNORECASE)
_BARCODE_RE = re.compile(r"\bштрих[ -]?код\b|\bbarcode\b", re.IGNORECASE)
_COPYRIGHT_RE = re.compile(r"[©\u00a9]|\ball rights reserved\b", re.IGNORECASE)
_PUBLISH_RE = re.compile(
    r"\bиздательств\w*\b|\bтипограф\w*\b|\bтираж\b|\bотпечатан\w*\b|\bподписан\w*\b|\bзаказ\s*№\b",
    re.IGNORECASE,
)


_AUTHOR_LINE_RE = re.compile(
    r"^\s*[А-ЯЁ][а-яё]+(?:\s+[А-ЯЁ][а-яё]+){1,2}\s*$"
)

_CAPS_TOKEN_RE = re.compile(r"\b[А-ЯЁ]{4,}\b")
_BAD_OCR_RE = re.compile(r"\b[А-ЯЁ]{8,}\b")  # склеенные капслок-слова типа ВЕРШИНАДОМА

def _letters_count(s: str) -> int:
    return sum(1 for ch in s if ch.isalpha())


def _uppercase_ratio(s: str) -> float:
    letters = [ch for ch in s if ch.isalpha()]
    if not letters:
        return 0.0
    ups = sum(1 for ch in letters if ch.isupper())
    return ups / max(1, len(letters))


def _caps_token_ratio(s: str) -> float:
    tokens = re.findall(r"\b[^\W_]+\b", s, flags=re.UNICODE)
    if not tokens:
        return 0.0
    caps = sum(1 for t in tokens if t.isalpha() and t.isupper() and len(t) >= 4)
    return caps / max(1, len(tokens))


_SENTENCE_RE = re.compile(r"[^.!?…]+[.!?…]+", re.UNICODE)

def _has_complete_sentence(s: str, *, min_letters: int = 40) -> bool:
    """
    True if text contains at least one "real" sentence:
      - has sentence-ending punctuation .!?…
      - the sentence contains >= min_letters alphabetic chars
    """
    txt = (s or "").strip()
    if not txt:
        return False

    for m in _SENTENCE_RE.finditer(txt):
        sent = m.group(0)
        if _letters_count(sent) >= min_letters:
            return True

    return False

    for m in _SENTENCE_RE.finditer(txt):
        sent = m.group(0)
        if _letters_count(sent) >= min_letters:
            return True

    return False



def _looks_like_title_or_publisher_block(s: str) -> bool:
    if _ISBN_RE.search(s) or _UDC_BBK_RE.search(s):
        return True
    if _QR_RE.search(s) or _BARCODE_RE.search(s):
        return True

    # жёсткие признаки выходных данных
    hard = 0
    hard += 1 if _PUBLISH_RE.search(s) else 0
    hard += 1 if _COPYRIGHT_RE.search(s) else 0

    # город/год НЕ считаем “жёсткими”, они встречаются в обычном тексте
    # (можно оставить как слабые, но не решающие)
    weak = 0
    weak += 1 if re.search(r"\b(москва|санкт[- ]петербург|спб)\b", s, re.IGNORECASE) else 0
    weak += 1 if re.search(r"\b\d{4}\b", s) else 0

    first_line = (s.splitlines()[:1] or [""])[0]
    if _AUTHOR_LINE_RE.match(first_line) and (hard >= 1 or weak >= 2):
        return True

    # правило: только hard>=2 или hard>=1 + weak>=2
    return (hard >= 2) or (hard >= 1 and weak >= 2)


def _normalize_name_piece(s: str) -> str:
    s = (s or "").strip().lower().replace("ё", "е")
    s = re.sub(r"[^a-zа-я0-9\s\-]", " ", s, flags=re.IGNORECASE)
    s = re.sub(r"\s+", " ", s).strip()
    return s


def _first_words(s: str, n: int = 8) -> str:
    s = _normalize_name_piece(s)
    parts = s.split()
    return " ".join(parts[:n])


def _starts_with_author_or_title(text: str, author: str | None, title: str | None) -> bool:
    """
    Conservative rule:
      - only checks beginning of the atom (first ~8 words)
      - requires 2+ tokens match for author, or 3+ tokens for title
      - ignores very short/empty fields
    """
    head = _first_words(text, 10)
    if not head:
        return False

    if author:
        a = _first_words(author, 6)
        a_parts = [p for p in a.split() if len(p) >= 3]
        if len(a_parts) >= 2:
            # author tokens should appear very early
            score = sum(1 for p in a_parts if p in head)
            if score >= 2:
                return True

    if title:
        t = _first_words(title, 8)
        t_parts = [p for p in t.split() if len(p) >= 4]
        if len(t_parts) >= 3:
            score = sum(1 for p in t_parts if p in head)
            if score >= 3:
                return True

    return False


def _glossary_def_line_count(s: str) -> int:
    """
    Считает, сколько отдельных фрагментов выглядят как строки глоссария:
      ТЕРМИН — определение
    Фрагменты берём по переводам строк и по разделителю " / ".
    """
    if not s:
        return 0

    # Нормализуем разделители, чтобы одинаково работало на txt/docx-экспорте
    parts = []
    for line in s.splitlines():
        line = line.strip()
        if not line:
            continue
        # часто в исходнике глоссарий режут " / "
        for p in line.split(" / "):
            p = p.strip()
            if p:
                parts.append(p)

    return sum(1 for p in parts if _GLOSSARY_DEF_LINE_RE.match(p))

def _looks_like_glossary_caps_list(s: str) -> bool:
    """
    Возвращает True только если текст ПРАВДА похож на капс-глоссарий/список заголовков.
    Предсказуемо:
      - если есть нормальное предложение => False
      - иначе смотрим на долю капс-слов, долю заглавных букв и количество глоссарных строк
    """
    txt = (s or "").strip()
    if not txt:
        return False

    # 1) Если есть хотя бы одно "реальное" предложение — это НЕ глоссарий.
    #    (используем твой же хелпер; если он в файле выше — просто вызываем)
    if _has_complete_sentence(txt, min_letters=40):
        return False

    # 2) Считаем токены и капс-токены (только слова длиной >= 4, чтобы не ловить "I", "V" и т.п.)
    tokens = re.findall(r"\b[^\W_]+\b", txt, flags=re.UNICODE)
    if not tokens:
        return False

    caps_tokens = [t for t in tokens if t.isalpha() and t.isupper() and len(t) >= 4]
    caps_token_ratio = len(caps_tokens) / max(1, len(tokens))

    # 3) Доля заглавных букв по буквам (не по символам)
    letters = [ch for ch in txt if ch.isalpha()]
    if letters:
        upper_letters = sum(1 for ch in letters if ch.isupper())
        upper_ratio = upper_letters / max(1, len(letters))
    else:
        upper_ratio = 0.0

    # 4) Сколько “строк-определений” типа "ТЕРМИН — ..."
    def_lines = _glossary_def_line_count(txt)

    # --- Решение (строгие пороги) ---
    #
    # def_lines >= 3: реально список определений
    # caps_token_ratio и upper_ratio — подстраховка, чтобы не ловить обычный текст,
    # где пару раз встречается СОЛНЦЕ/ЛУНА/ЮПИТЕР капсом.
    #
    # Пороги подобраны так, чтобы пример вида:
    #   "СОЛНЦЕ — ... ЛУНА — ... СОЛНЦЕ — ..."
    # НЕ вылетал, если остальной текст нормальный.
    #
    looks_like_glossary = (
        (def_lines >= 4 and caps_token_ratio >= 0.18) or
        (def_lines >= 3 and (caps_token_ratio >= 0.28 or upper_ratio >= 0.55)) or
        (caps_token_ratio >= 0.45 and upper_ratio >= 0.35)
    )

    return bool(looks_like_glossary)


def _atom_garble_bad(s: str) -> bool:
    # _garble_score уже есть у тебя в cli.py
    # для атома порог можно сделать мягче, чем для chunk
    return _garble_score(s) >= 0.06


def _norm_line(s: str) -> str:
    s = _NONPRINTABLE_RE.sub("", s or "")
    s = _WS_RE.sub(" ", s).strip().lower()
    return s


def _text_metrics(s: str) -> dict[str, float]:
    s = s or ""
    if not s:
        return {"letters": 0.0, "digits": 0.0, "spaces": 0.0, "punct": 0.0, "other": 0.0}

    n = len(s)
    letters = sum(1 for ch in s if ch.isalpha())
    digits = sum(1 for ch in s if ch.isdigit())
    spaces = sum(1 for ch in s if ch.isspace())
    punct = sum(1 for ch in s if (not ch.isalnum()) and (not ch.isspace()))
    other = n - letters - digits - spaces - punct
    return {
        "letters": letters / n,
        "digits": digits / n,
        "spaces": spaces / n,
        "punct": punct / n,
        "other": other / n,
    }


def _looks_like_toc(text: str) -> bool:
    t = (text or "").strip()
    if not t:
        return False

    lines = [ln.strip() for ln in t.splitlines() if ln.strip()]
    if len(lines) < 5:
        return False

    toc_hits = sum(1 for ln in lines if _TOC_LINE_RE.match(ln))
    page_hits = sum(1 for ln in lines if _PAGE_NUM_RE.match(ln))

    if _TOC_TITLE_RE.search(t):
        # Title + many toc-like lines.
        return toc_hits >= 3 or (toc_hits / max(1, len(lines))) >= 0.25

    # Pure page lists or dot leaders.
    if page_hits / max(1, len(lines)) >= 0.6:
        return True
    return (toc_hits / max(1, len(lines))) >= 0.6


def _publisher_tail_score(t: str) -> int:
    score = 0
    if _ISBN_RE.search(t):
        score += 3
    if _UDC_BBK_RE.search(t):
        score += 2
    if _PUBLISHER_TAIL_RE.search(t):
        score += 3
    if _COPYRIGHT_RE.search(t):
        score += 1  # © сам по себе НЕ должен выкидывать текст
    return score


def _looks_like_publisher_tail(text: str) -> bool:
    t = (text or "").strip()
    if not t:
        return False

    # работаем только с разумной длиной “служебных блоков”
    if len(t) > 2000:
        return False

    # Важно: теперь нужно сочетание признаков (ISBN/УДК/тираж/издательство + возможно ©),
    # а не одиночный символ ©.
    if re.search(r"(?i)\b(введение|пролог|глава|предисловие)\b", t):
        return False
    return _publisher_tail_score(t) >= 4


def _looks_like_html(text: str) -> bool:
    t = text or ""
    if not t:
        return False
    return bool(_HTML_TAG_RE.search(t) or _HTML_ENTITY_RE.search(t))


def _looks_like_garbage(text: str) -> bool:
    t = (text or "").strip()
    if not t:
        return True

    # Быстрый числовой скоринг: если "небуквенного" слишком много — мусор/верстка.
    if _garbage_score(t) >= 0.55:
        return True

    m = _text_metrics(t)

    # Very low letter ratio, or dominated by digits/symbols.
    if m["letters"] < 0.20 and (m["digits"] > 0.35 or m["punct"] > 0.35):
        return True
    if m["digits"] > 0.60 and len(t) <= 1200:
        return True
    if m["punct"] > 0.55 and len(t) <= 1200:
        return True

    # Repeated single-char noise (e.g., ======, -----, ******)
    stripped = re.sub(r"\s+", "", t)
    if len(stripped) >= 20:
        uniq = set(stripped)
        if len(uniq) <= 3:
            return True

    # Many very short "lines" (scanned layout / broken wraps)
    lines = [ln.strip() for ln in t.splitlines() if ln.strip()]
    if len(lines) >= 10:
        short = sum(1 for ln in lines if len(ln) <= 3)
        if short / len(lines) >= 0.5:
            return True

    return False


def _garbage_score(t: str) -> float:
    if not t:
        return 1.0
    letters = sum(ch.isalpha() for ch in t)
    digits = sum(ch.isdigit() for ch in t)
    spaces = sum(ch.isspace() for ch in t)
    others = len(t) - letters - digits - spaces
    if len(t) < 80 and letters < 20:
        return 1.0
    # если "небуквенного" слишком много — это верстка/мусор
    return (digits + others) / max(1, len(t))


def _detect_repeated_headers_footers(rows: list[sqlite3.Row]) -> dict[int, set[str]]:
    """Detect repeated first/last lines per source_id among provided chunks."""
    by_source: dict[int, list[tuple[str, str]]] = {}
    for r in rows:
        sid = int(r["source_id"])
        txt = (r["text"] or "")
        lines = [ln.strip() for ln in txt.splitlines() if ln.strip()]
        if not lines:
            continue
        first = _norm_line(lines[0])
        last = _norm_line(lines[-1])
        if sid not in by_source:
            by_source[sid] = []
        by_source[sid].append((first, last))

    repeated: dict[int, set[str]] = {}
    for sid, pairs in by_source.items():
        total = len(pairs)
        if total < 6:
            repeated[sid] = set()
            continue

        first_counts: dict[str, int] = {}
        last_counts: dict[str, int] = {}
        for first, last in pairs:
            if 3 <= len(first) <= 80:
                first_counts[first] = first_counts.get(first, 0) + 1
            if 3 <= len(last) <= 80:
                last_counts[last] = last_counts.get(last, 0) + 1

        threshold = max(3, int(total * 0.20))
        bad: set[str] = set()
        for k, v in first_counts.items():
            if v >= threshold:
                bad.add(k)
        for k, v in last_counts.items():
            if v >= threshold:
                bad.add(k)

        repeated[sid] = bad
    return repeated


def _sanitation_reason_v1(
    text: str,
    repeated_headers_footers: set[str] | None = None,
    source_author: str | None = None,
    source_title: str | None = None,
    *,
    min_sent_letters: int = 40,
    min_len: int = 120,
    max_len: int = 2600,
) -> str | None:
    s = (text or "").strip()
    if not s:
        return "empty"

    if len(s) < int(min_len):
        return "too_short"
    if len(s) > int(max_len):
        return "too_long"

    if "```" in s:
        return "code_fence"
    if re.search(r"https?://|www\.", s, re.IGNORECASE):
        return "url"

    if repeated_headers_footers:
        low = s.lower()
        for hf in repeated_headers_footers:
            if hf and hf.lower() in low:
                return "header_footer"

    if _starts_with_author_or_title(s, source_author, source_title):
        return "author_title_prefix"

    if _looks_like_title_or_publisher_block(s):
        return "publisher_noise"

    if _looks_like_glossary_caps_list(s):
        return "glossary_caps"

    if _atom_garble_bad(s):
        return "garbled_atom"
    
    _DEFINITION_RE = re.compile(r"[А-Яа-яA-Za-z0-9][^.!?…\n]{0,60}\s[—-]\s[^.!?…\n]{40,}")
    _COLON_EXPLAIN_RE = re.compile(r":[^\n.!?…]{40,}")

    def _has_complete_sentence(s: str, *, min_letters: int = 40) -> bool:
        # 1) нормальное предложение с концовкой
        for m in re.finditer(r"([^.!?…]{0,500})([.!?…])", s):
            chunk = m.group(1)
            if _letters_count(chunk) >= min_letters:
                return True

        # 2) определение “X — ...” (часто без точки)
        if _DEFINITION_RE.search(s):
            return True

        # 3) “Заголовок: объяснение...” тоже ок
        if _COLON_EXPLAIN_RE.search(s):
            return True

        return False
    _LISTY_RE = re.compile(r"(?m)^\s*(?:[-•—]|\d+\)|\d+\.)\s+")
    if _LISTY_RE.search(s) and not re.search(r"[.!?…]", s):
        return "list_without_sentences"


    if not _has_complete_sentence(s, min_letters=min_sent_letters):
        return "no_complete_sentence"

    return None



def _snippet_for_report(s: str, max_len: int = 240) -> str:
    s = _WS_RE.sub(" ", _normalize_text(s or "")).strip()
    if len(s) <= max_len:
        return s
    return s[: max_len - 1] + "…"

def _line_preview_for_report(s: str, lines: int = 2, max_len: int = 240) -> str:
    """Return first N non-empty lines, normalized, for quick debug previews."""
    txt = _normalize_text(s or "")
    parts = [ln.strip() for ln in txt.splitlines() if ln.strip()]
    head = " / ".join(parts[:lines])
    head = _WS_RE.sub(" ", head).strip()
    if len(head) <= max_len:
        return head
    return head[: max_len - 1] + "…"



_BOX_GARBLE_RE = re.compile(r"[\u2500-\u259f\u00a4]")  # box drawing + currency sign


def _garble_score(s: str) -> float:
    """
    Garble score for encoding/font artifacts.

    We intentionally treat ANY presence of box-drawing chars (U+2500–U+259F)
    or the currency sign '¤' (U+00A4) as a strong garble signal.
    This is because even a couple of such characters usually means the entire
    chunk is decoded with the wrong codepage (classic "кракозябры").
    """
    s = s or ""
    if not s:
        return 0.0

    if _looks_like_mojibake(s):
    # слабее чем box-drawing, но всё равно сильный сигнал
        return 0.5

    bad = len(_BOX_GARBLE_RE.findall(s))
    if bad == 0:
        return 0.0

    # Strong signal: one artifact char already indicates garbling.
    # Keep it compatible with threshold-based filtering (e.g. 0.20).
    return 1.0

def _garble_info(s: str) -> GarbleInfo:
    s = s or ""
    if not s:
        return GarbleInfo(score=0.0, bad_lines=0)

    lines = s.splitlines() or [s]
    bad_lines = 0
    for ln in lines:
        if _BOX_GARBLE_RE.search(ln):
            bad_lines += 1

    score = _garble_score(s)
    return GarbleInfo(score=score, bad_lines=bad_lines)

def _fb2_to_text(fb2_bytes: bytes) -> tuple[str, str]:
    """Return (locale, plain_text) from FB2 bytes (best-effort, with encoding recovery)."""

    def parse_bytes(data: bytes) -> tuple[str, str]:
        root = ET.fromstring(data)

        ns = ""
        if root.tag.startswith("{"):
            ns = root.tag.split("}")[0] + "}"

        def _t(el: Any) -> str:
            return ("".join(el.itertext()) if el is not None else "").strip()

        lang_el = root.find(f".//{ns}description/{ns}title-info/{ns}lang")
        lang = _t(lang_el) or "ru-RU"
        locale = "ru-RU" if lang.lower().startswith("ru") else lang

        paragraphs: list[str] = []
        for p in root.findall(f".//{ns}body//{ns}p"):
            s = _t(p)
            if s:
                paragraphs.append(s)

        text = "\n\n".join(paragraphs)
        return locale, _normalize_text(text)

    # 1) Try as-is (ET will use XML prolog encoding if present)
    try:
        locale, text = parse_bytes(fb2_bytes)
        if _garble_score(text) < 0.002:  # практически нет box-символов
            return locale, text
    except Exception:
        locale, text = "ru-RU", ""

    # 2) Encoding recovery: decode bytes with candidates and reparse as Unicode XML
    #    (ET.fromstring(str) treats it as already-decoded text).
    candidates = ["windows-1251", "cp1251", "koi8-r", "cp866"]
    best_locale = locale or "ru-RU"
    best_text = text or ""
    best_score = _garble_score(best_text) if best_text else 1.0

    for enc in candidates:
        try:
            xml_text = fb2_bytes.decode(enc, errors="strict")
        except Exception:
            continue

        # Remove/neutralize wrong encoding declaration if any, to avoid confusing downstream tools.
        # ET will parse unicode anyway, but keep it clean.
        xml_text2 = re.sub(
            r'(<\?xml[^>]*encoding\s*=\s*["\'])([^"\']+)(["\'])',
            r"\1utf-8\3",
            xml_text,
            flags=re.IGNORECASE,
        )

        try:
            root = ET.fromstring(xml_text2)  # unicode input
        except Exception:
            continue

        ns = ""
        if root.tag.startswith("{"):
            ns = root.tag.split("}")[0] + "}"

        def _t(el: Any) -> str:
            return ("".join(el.itertext()) if el is not None else "").strip()

        lang_el = root.find(f".//{ns}description/{ns}title-info/{ns}lang")
        lang = _t(lang_el) or "ru-RU"
        loc = "ru-RU" if lang.lower().startswith("ru") else lang

        paragraphs: list[str] = []
        for p in root.findall(f".//{ns}body//{ns}p"):
            s = _t(p)
            if s:
                paragraphs.append(s)

        txt = _normalize_text("\n\n".join(paragraphs))
        score = _garble_score(txt)

        if txt and score < best_score:
            best_score = score
            best_text = txt
            best_locale = loc

        if best_score < 0.002:
            break

    return best_locale, best_text

# ----------------------------
# Ingest readers (txt/md/docx/epub/fb2)
# ----------------------------

_ZERO_WIDTH_RE = re.compile(r"[\u200B-\u200F\uFEFF]")
_CTRL_RE = re.compile(r"[\x00-\x08\x0b\x0c\x0e-\x1f]")


def _normalize_text_ingest(s: str) -> str:
    # stronger normalization for raw file text
    s = (s or "").replace("\r\n", "\n").replace("\r", "\n")
    s = _CTRL_RE.sub("", s)
    s = _ZERO_WIDTH_RE.sub("", s)
    s = re.sub(r"[ \t]+", " ", s)
    s = re.sub(r"\n{3,}", "\n\n", s)
    s = s.strip()
    s = re.sub(r"^[©\u00a9]+\s*", "", s)
    if _looks_like_mojibake(s):
        s = _try_unmojibake_cp1251(s)
    return s


def _decode_bytes_best_effort(data: bytes) -> str:
    """
    Decode bytes to text with a SAFE priority order.

    Rule:
    - Always prefer UTF-8 (and UTF-8-SIG) if it decodes strictly.
    - If the byte stream looks like UTF-16 (lots of NULs) -> try UTF-16 variants strictly.
    - Only then try legacy encodings (cp1251/koi8-r/cp866) with scoring.

    This prevents the common bug: UTF-8 content getting "successfully" decoded as koi8-r/cp866,
    producing box-drawing garbage (╘╤ etc) and poisoning chunks.
    """
    if not data:
        return ""

    # 1) Strong preference: UTF-8 / UTF-8 with BOM
    for enc in ("utf-8-sig", "utf-8"):
        try:
            return data.decode(enc, errors="strict")
        except Exception:
            pass

    # 2) UTF-16 detection: lots of NUL bytes
    nul_ratio = data.count(b"\x00") / max(1, len(data))
    if nul_ratio > 0.05:
        for enc in ("utf-16", "utf-16-le", "utf-16-be"):
            try:
                return data.decode(enc, errors="strict")
            except Exception:
                pass

    # 3) Legacy fallback with scoring (ONLY if UTF-8/UTF-16 didn't work strictly)
    candidates = ("windows-1251", "cp1251", "koi8-r", "cp866", "latin-1")
    best_s: str | None = None
    best_score = 1e18

    for enc in candidates:
        try:
            s = data.decode(enc, errors="strict")
        except Exception:
            continue

        score = 0.0
        # NULs inside decoded string almost always mean wrong decoding
        score += 50.0 * s.count("\x00")
        # Known mojibake markers (your _MOJIBAKE_RE)
        score += 10.0 * len(_MOJIBAKE_RE.findall(s))
        # Box drawing / currency sign is a VERY strong signal of wrong codepage
        score += 1000.0 * (1.0 if _garble_score(s) >= 0.5 else 0.0)

        # If bytes had many NULs but we are not using utf-16* -> penalize hard
        if nul_ratio > 0.05 and not enc.startswith("utf-16"):
            score += 2000.0

        if score < best_score:
            best_score = score
            best_s = s

    if best_s is not None:
        return best_s

    # last-resort
    return data.decode("utf-8", errors="ignore")




class _HTMLTextExtractor(HTMLParser):
    def __init__(self) -> None:
        super().__init__(convert_charrefs=True)
        self._parts: list[str] = []
        self._block = False

    def handle_starttag(self, tag: str, attrs: list[tuple[str, str | None]]) -> None:
        if tag.lower() in {"p", "br", "div", "li", "h1", "h2", "h3", "h4", "h5", "h6"}:
            self._parts.append("\n")

    def handle_data(self, data: str) -> None:
        if data:
            self._parts.append(data)

    def get_text(self) -> str:
        return "".join(self._parts)


def _html_to_text(html_text: str) -> str:
    parser = _HTMLTextExtractor()
    parser.feed(html_text or "")
    txt = parser.get_text()
    txt = html.unescape(txt)
    return _normalize_text_ingest(txt)


def _fb2_to_text_meta(fb2_bytes: bytes) -> tuple[str, str, str | None, str | None]:
    """
    Return (locale, plain_text, title, author) from FB2 bytes (best-effort).
    Uses the same encoding recovery logic as _fb2_to_text().
    """

    def parse_bytes(data: bytes) -> tuple[str, str, str | None, str | None]:
        root = ET.fromstring(data)

        ns = ""
        if root.tag.startswith("{"):
            ns = root.tag.split("}")[0] + "}"

        def _t(el: Any) -> str:
            return ("".join(el.itertext()) if el is not None else "").strip()

        lang_el = root.find(f".//{ns}description/{ns}title-info/{ns}lang")
        lang = _t(lang_el) or "ru-RU"
        locale = "ru-RU" if lang.lower().startswith("ru") else lang

        title_el = root.find(f".//{ns}description/{ns}title-info/{ns}book-title")
        title = _t(title_el) or None

        a_first = _t(root.find(f".//{ns}description/{ns}title-info/{ns}author/{ns}first-name")) or ""
        a_last = _t(root.find(f".//{ns}description/{ns}title-info/{ns}author/{ns}last-name")) or ""
        author = (f"{a_first} {a_last}".strip() or None)

        paragraphs: list[str] = []
        for p in root.findall(f".//{ns}body//{ns}p"):
            s = _t(p)
            if s:
                paragraphs.append(s)

        text = _normalize_text_ingest("\n\n".join(paragraphs))
        return locale, text, title, author

    # 1) as-is
    try:
        locale, text, title, author = parse_bytes(fb2_bytes)
        if _garble_score(text) < 0.002:
            return locale, text, title, author
    except Exception:
        locale, text, title, author = "ru-RU", "", None, None

    # 2) encoding recovery
    candidates = ["windows-1251", "cp1251", "koi8-r", "cp866"]
    best_locale = locale or "ru-RU"
    best_text = text or ""
    best_title = title
    best_author = author
    best_score = _garble_score(best_text) if best_text else 1.0

    for enc in candidates:
        try:
            xml_text = fb2_bytes.decode(enc, errors="strict")
            root = ET.fromstring(xml_text)  # unicode XML
        except Exception:
            continue

        ns = ""
        if root.tag.startswith("{"):
            ns = root.tag.split("}")[0] + "}"

        def _t(el: Any) -> str:
            return ("".join(el.itertext()) if el is not None else "").strip()

        lang_el = root.find(f".//{ns}description/{ns}title-info/{ns}lang")
        lang = _t(lang_el) or "ru-RU"
        loc = "ru-RU" if lang.lower().startswith("ru") else lang

        title_el = root.find(f".//{ns}description/{ns}title-info/{ns}book-title")
        tt = _t(title_el) or None

        a_first = _t(root.find(f".//{ns}description/{ns}title-info/{ns}author/{ns}first-name")) or ""
        a_last = _t(root.find(f".//{ns}description/{ns}title-info/{ns}author/{ns}last-name")) or ""
        au = (f"{a_first} {a_last}".strip() or None)

        paragraphs: list[str] = []
        for p in root.findall(f".//{ns}body//{ns}p"):
            s = _t(p)
            if s:
                paragraphs.append(s)

        txt2 = _normalize_text_ingest("\n\n".join(paragraphs))
        score = _garble_score(txt2)

        if txt2 and score < best_score:
            best_score = score
            best_text = txt2
            best_locale = loc
            best_title = tt
            best_author = au

        if best_score < 0.002:
            break

    return best_locale, best_text, best_title, best_author


def _read_plain_text_file(path: Path) -> tuple[str, str, str | None, str | None]:
    data = _read_bytes(path)
    txt = _decode_bytes_best_effort(data)
    txt = _normalize_text_ingest(txt)
    title = path.stem
    return "ru-RU", txt, title, None


def _read_docx_file(path: Path) -> tuple[str, str, str | None, str | None]:
    # local import to avoid hard dependency failures
    from docx import Document  # type: ignore

    doc = Document(str(path))
    paras = [p.text.strip() for p in doc.paragraphs if (p.text or "").strip()]
    txt = _normalize_text_ingest("\n\n".join(paras))
    title = None
    author = None
    try:
        cp = doc.core_properties
        title = (cp.title or "").strip() or None
        author = (cp.author or "").strip() or None
    except Exception:
        pass
    return "ru-RU", txt, title or path.stem, author


def _epub_to_text_meta(epub_path: Path) -> tuple[str, str, str | None, str | None]:
    """
    Minimal EPUB reader without external deps:
      - parse META-INF/container.xml -> OPF path
      - parse OPF spine -> manifest href order
      - read html/xhtml files in spine order
    """
    with zipfile.ZipFile(epub_path, "r") as zf:
        # container.xml
        try:
            container_xml = zf.read("META-INF/container.xml")
        except Exception:
            raise ValueError("EPUB: META-INF/container.xml not found")

        root = ET.fromstring(container_xml)
        ns = ""
        if root.tag.startswith("{"):
            ns = root.tag.split("}")[0] + "}"

        opf_path = None
        for rf in root.findall(f".//{ns}rootfiles/{ns}rootfile"):
            opf_path = rf.attrib.get("full-path")
            if opf_path:
                break
        if not opf_path:
            raise ValueError("EPUB: OPF full-path not found in container.xml")

        opf_dir = str(Path(opf_path).parent).replace("\\", "/")
        opf_bytes = zf.read(opf_path)
        opf = ET.fromstring(opf_bytes)

        opf_ns = ""
        if opf.tag.startswith("{"):
            opf_ns = opf.tag.split("}")[0] + "}"

        def _t(el: Any) -> str:
            return ("".join(el.itertext()) if el is not None else "").strip()

        title = _t(opf.find(f".//{opf_ns}metadata/*[@*='title']")) or None
        # Safer: try common dc elements
        if not title:
            title = _t(opf.find(".//{http://purl.org/dc/elements/1.1/}title")) or None
        author = _t(opf.find(".//{http://purl.org/dc/elements/1.1/}creator")) or None
        lang = _t(opf.find(".//{http://purl.org/dc/elements/1.1/}language")) or "ru-RU"
        locale = "ru-RU" if lang.lower().startswith("ru") else lang

        manifest: dict[str, str] = {}
        for item in opf.findall(f".//{opf_ns}manifest/{opf_ns}item"):
            iid = item.attrib.get("id") or ""
            href = item.attrib.get("href") or ""
            if iid and href:
                manifest[iid] = href

        spine_ids: list[str] = []
        for itemref in opf.findall(f".//{opf_ns}spine/{opf_ns}itemref"):
            rid = itemref.attrib.get("idref")
            if rid:
                spine_ids.append(rid)

        html_texts: list[str] = []
        for rid in spine_ids:
            href = manifest.get(rid)
            if not href:
                continue
            full = f"{opf_dir}/{href}".lstrip("./")
            full = full.replace("\\", "/")
            try:
                data = zf.read(full)
            except Exception:
                # try raw href
                try:
                    data = zf.read(href)
                except Exception:
                    continue
            raw = _decode_bytes_best_effort(data)
            html_texts.append(_html_to_text(raw))

        if not html_texts:
            # fallback: read all html-ish files deterministically by name
            names = sorted([n for n in zf.namelist() if n.lower().endswith((".xhtml", ".html", ".htm"))])
            for n in names:
                raw = _decode_bytes_best_effort(zf.read(n))
                html_texts.append(_html_to_text(raw))

        txt = _normalize_text_ingest("\n\n".join([t for t in html_texts if t.strip()]))
        return locale, txt, title or epub_path.stem, author


def _read_source_to_text(fp: Path, default_locale: str) -> tuple[str, str, str, str | None, str | None, bytes | None]:
    """
    Return:
      (source_type, locale, plain_text, title, author, canonical_bytes_for_sha)
    canonical_bytes_for_sha:
      - for fb2.zip: extracted fb2 bytes (stable to content)
      - for others: None => caller uses file bytes
    """
    ext = fp.suffix.lower()

    if ext == ".zip":
        fb2_bytes = _extract_fb2_from_zip(fp)
        locale, plain, title, author = _fb2_to_text_meta(fb2_bytes)
        return "fb2.zip", (locale or default_locale), plain, (title or fp.stem), author, fb2_bytes

    if ext == ".fb2":
        fb2_bytes = _read_bytes(fp)
        locale, plain, title, author = _fb2_to_text_meta(fb2_bytes)
        return "fb2", (locale or default_locale), plain, (title or fp.stem), author, fb2_bytes

    if ext in {".txt", ".md"}:
        locale, plain, title, author = _read_plain_text_file(fp)
        return ext.lstrip("."), (locale or default_locale), plain, title or fp.stem, author, None

    if ext == ".docx":
        locale, plain, title, author = _read_docx_file(fp)
        return "docx", (locale or default_locale), plain, title or fp.stem, author, None

    if ext == ".epub":
        locale, plain, title, author = _epub_to_text_meta(fp)
        return "epub", (locale or default_locale), plain, title or fp.stem, author, None

    raise ValueError(f"unsupported file type: {fp.suffix}")


def _chunk_text(text: str, chunk_size: int) -> list[tuple[int, int, str]]:
    if not text:
        return []
    paras = [p.strip() for p in text.split("\n\n") if p.strip()]
    chunks: list[tuple[int, int, str]] = []
    buf: list[str] = []
    start = 0
    pos = 0

    def flush() -> None:
        nonlocal buf, start, pos
        if not buf:
            return
        chunk = "\n\n".join(buf).strip()
        end = start + len(chunk)
        chunks.append((start, end, chunk))
        pos = end + 2
        start = pos
        buf = []

    for p in paras:
        if not buf:
            start = pos
        if sum(len(x) for x in buf) + (2 * len(buf)) + len(p) > chunk_size and buf:
            flush()
        buf.append(p)
        pos += len(p) + 2
    flush()
    return chunks


def cmd_sources_list(args: argparse.Namespace) -> int:
    conn = _connect(_staging_db_path())
    try:
        _ensure_staging_schema(conn)
        limit = int(getattr(args, "limit", 200) or 200)
        q = (getattr(args, "q", "") or "").strip()

        where = ["1=1"]
        params: list[Any] = []
        if q:
            where.append("(title LIKE ? OR path LIKE ? OR file_name LIKE ?)")
            like = f"%{q}%"
            params.extend([like, like, like])

        sql = f"""
        SELECT
          s.id, s.title, s.source_type, s.locale, s.file_name, s.file_size, s.imported_at,
          (SELECT COUNT(1) FROM kb_source_chunks c WHERE c.source_id=s.id) AS chunks_count,
          (SELECT COUNT(1) FROM kb_fragments f WHERE f.source_id=s.id) AS fragments_count
        FROM kb_sources s
        WHERE {' AND '.join(where)}
        ORDER BY s.id DESC
        LIMIT ?
        """
        params.append(limit)
        rows = conn.execute(sql, params).fetchall()

        
        items = []
        for r in rows:
            items.append(
                {
                    "id": int(r["id"]),
                    "title": r["title"],
                    "source_type": r["source_type"] if "source_type" in r.keys() else None,
                    "locale": r["locale"] if "locale" in r.keys() else None,
                    "file_name": r["file_name"] if "file_name" in r.keys() else None,
                    "file_size": r["file_size"] if "file_size" in r.keys() else None,
                    "imported_at": r["imported_at"],
                    "chunks": int(r["chunks_count"] or 0),
                    "fragments": int(r["fragments_count"] or 0),
                }
            )

        if getattr(args, "json", False):
            print(
                json.dumps(
                    {"count": len(items), "items": items},
                    ensure_ascii=False,
                    indent=None if getattr(args, "compact", False) else 2,
                )
            )
        else:
            for it in items:
                print(
                    f"source#{it['id']} chunks={it['chunks']} frags={it['fragments']} "
                    f"type={it.get('source_type') or ''} locale={it.get('locale') or ''} title={it['title']}",
                    file=sys.stderr,
                )
        return 0
    finally:
        conn.close()

def cmd_sources_diagnose(args: argparse.Namespace) -> int:
    source_id = int(getattr(args, "source_id", 0) or 0)
    if not source_id:
        print("ERROR: --source-id is required", file=sys.stderr)
        return 2

    threshold = float(getattr(args, "threshold", 0.01) or 0.01)
    top = int(getattr(args, "top", 10) or 10)
    as_json = bool(getattr(args, "json", False))
    compact = bool(getattr(args, "compact", False))

    conn = _connect(_staging_db_path())
    try:
        _ensure_staging_schema(conn)

        src = conn.execute(
            "SELECT id, title, source_type, locale, file_name, file_size, imported_at FROM kb_sources WHERE id=?",
            (source_id,),
        ).fetchone()
        if not src:
            print("ERROR: source not found", file=sys.stderr)
            return 2

        rows = conn.execute(
            "SELECT id, seq, text FROM kb_source_chunks WHERE source_id=? ORDER BY seq ASC",
            (source_id,),
        ).fetchall()

        scores: list[tuple[int, float, int, str]] = []
        for r in rows:
            txt = str(r["text"] or "")
            info = _garble_info(txt)
            preview = re.sub(r"\s+", " ", txt.strip())[:160]
            scores.append((int(r["seq"]), float(info.score), int(info.bad_lines), preview))

        chunks_total = len(scores)
        score_min = min((s for _, s, _, _ in scores), default=0.0)
        score_max = max((s for _, s, _, _ in scores), default=0.0)
        score_avg = (sum(s for _, s, _, _ in scores) / chunks_total) if chunks_total else 0.0
        chunks_garbled = sum(1 for _, s, _, _ in scores if s >= threshold)

        worst = sorted(scores, key=lambda x: x[1], reverse=True)[:top]
        worst_items = [
            {"seq": seq, "garble_score": sc, "bad_lines": bl, "preview": prev}
            for seq, sc, bl, prev in worst
        ]

        payload = {
            "source": {
                "id": int(src["id"]),
                "title": src["title"],
                "source_type": src["source_type"] if "source_type" in src.keys() else None,
                "locale": src["locale"] if "locale" in src.keys() else None,
                "file_name": src["file_name"] if "file_name" in src.keys() else None,
                "file_size": src["file_size"] if "file_size" in src.keys() else None,
                "imported_at": src["imported_at"],
            },
            "threshold": threshold,
            "chunks_total": chunks_total,
            "chunks_garbled": chunks_garbled,
            "score_min": score_min,
            "score_avg": score_avg,
            "score_max": score_max,
            "worst": worst_items,
        }

        if as_json:
            if compact:
                print(json.dumps(payload, ensure_ascii=False, separators=(",", ":")))
            else:
                print(json.dumps(payload, ensure_ascii=False, indent=2))
        else:
            print(
                f"diagnose: source_id={source_id} chunks_total={chunks_total} garbled={chunks_garbled} "
                f"threshold={threshold} min={score_min:.4f} avg={score_avg:.4f} max={score_max:.4f}",
                file=sys.stderr,
            )
            for it in worst_items[: min(top, 10)]:
                print(f"  - seq={it['seq']} score={it['garble_score']:.4f} {it['preview']}", file=sys.stderr)

        return 0
    finally:
        conn.close()

def cmd_fragments_sample(args: argparse.Namespace) -> int:
    source_id = int(getattr(args, "source_id", 0) or 0)
    if not source_id:
        print("ERROR: --source-id is required", file=sys.stderr)
        return 2

    limit = int(getattr(args, "limit", 20) or 20)
    with_text = bool(getattr(args, "with_text", False))
    needs_rewrite_only = bool(getattr(args, "needs_rewrite_only", False))
    bot_ready_only = bool(getattr(args, "bot_ready_only", False))
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
            f"""
            SELECT id, key, locale, topic_category, tone, abstraction_level, state, created_at, meta_json, text
            FROM kb_fragments
            WHERE {' AND '.join(where)}
            ORDER BY id DESC
            LIMIT ?
            """.strip(),
            [*params, limit * 10],
        ).fetchall()

        items: list[dict[str, Any]] = []
        for r in rows:
            meta = _json_load_dict(r["meta_json"])
            requires_rewrite = bool(meta.get("requires_rewrite", False))
            txt = str(r["text"] or "")
            has_addr = bool(_DIRECT_ADDRESS_RE.search(txt))
            has_url = ("http://" in txt.lower()) or ("https://" in txt.lower())

            if needs_rewrite_only and not requires_rewrite:
                continue
            if bot_ready_only and not has_addr:
                continue

            item = {
                "id": int(r["id"]),
                "key": str(r["key"]),
                "locale": str(r["locale"]),
                "state": str(r["state"]),
                "requires_rewrite": requires_rewrite,
                "bot_ready": has_addr,
                "has_url": has_url,
            }
            if with_text:
                item["text"] = txt
            items.append(item)
            if len(items) >= limit:
                break

        if as_json:
            print(json.dumps({"source_id": source_id, "count": len(items), "items": items},
                             ensure_ascii=False, indent=None if compact else 2))
            return 0

        for it in items:
            flags = []
            if it["requires_rewrite"]:
                flags.append("needs_rewrite")
            if it["bot_ready"]:
                flags.append("bot_ready")
            if it["has_url"]:
                flags.append("has_url")
            print(f"{it['id']:<8} {it['key']:<36} {it['locale']:<7} {it['state']:<12} "
                  f"{(','.join(flags) if flags else '-')}",
                  file=sys.stderr)
            if with_text:
                print(it.get("text", ""), file=sys.stderr)
                print("-" * 60, file=sys.stderr)

        return 0
    finally:
        conn.close()

def cmd_fragments_promote(args: argparse.Namespace) -> int:
    source_id = int(getattr(args, "source_id", 0) or 0)
    if not source_id:
        print("ERROR: --source-id is required", file=sys.stderr)
        return 2

    from_state = (getattr(args, "from_state", "needs_review") or "needs_review").strip()
    to_state = (getattr(args, "to_state", "reviewed") or "reviewed").strip()
    only_bot_ready = bool(getattr(args, "only_bot_ready", False))
    only_needs_rewrite = bool(getattr(args, "only_needs_rewrite", False))
    dry_run = bool(getattr(args, "dry_run", False))
    as_json = bool(getattr(args, "json", False))
    compact = bool(getattr(args, "compact", False))
    commit_batch = int(getattr(args, "commit_batch", 500) or 500)
    limit = int(getattr(args, "limit", 0) or 0)
    who = (getattr(args, "who", "KB") or "KB").strip()
    note = (getattr(args, "note", "promote") or "promote").strip()

    if from_state == to_state:
        print("ERROR: from_state equals to_state", file=sys.stderr)
        return 2

    conn = _connect(_staging_db_path())
    try:
        _ensure_staging_schema(conn)

        rows = conn.execute(
            """
            SELECT id, key, locale, state, meta_json, text
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
            requires_rewrite = bool(meta.get("requires_rewrite", False))
            txt = str(r["text"] or "")
            bot_ready = bool(_DIRECT_ADDRESS_RE.search(txt))

            if only_bot_ready and not bot_ready:
                skipped_filter += 1
                continue
            if only_needs_rewrite and not requires_rewrite:
                skipped_filter += 1
                continue

            eligible_ids.append(int(r["id"]))
            if limit and len(eligible_ids) >= limit:
                break

        updated = 0
        now = _utcnow_iso()

        if not dry_run:
            for fid in eligible_ids:
                conn.execute(
                    "UPDATE kb_fragments SET state=?, updated_at=? WHERE id=?",
                    (to_state, now, fid),
                )
                conn.execute(
                    """
                    INSERT INTO kb_events(fragment_id, from_state, to_state, who, note, ts)
                    VALUES(?,?,?,?,?,?)
                    """.strip(),
                    (fid, from_state, to_state, who, note, now),
                )
                updated += 1
            if (not dry_run) and commit_batch > 0 and (updated % commit_batch == 0):
                conn.commit()

        else:
            updated = len(eligible_ids)

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
            print(json.dumps(payload, ensure_ascii=False, indent=None if compact else 2))
        else:
            print(
                f"promote: source_id={source_id} {from_state}->{to_state} "
                f"matched={len(rows)} eligible={len(eligible_ids)} updated={updated} skipped_filter={skipped_filter}",
                file=sys.stderr,
            )
        return 0
    finally:
        conn.close()
def _print_quality_stats_pretty(report: dict) -> None:
    """Pretty stderr output for `fragments stats --by-quality`."""
    label_by_state = report.get("label_by_state") or {}
    state_counts = report.get("state_counts") or {}
    label_counts = report.get("label_counts") or {}
    buckets = report.get("score_buckets") or {}

    states = list(state_counts.keys()) or sorted(label_by_state.keys())
    # Prefer stable ordering
    preferred = ["enabled", "needs_review", "archived", "draft", "reviewed", "annotated", "validated"]
    states = [s for s in preferred if s in states] + [s for s in states if s not in preferred]

    labels = ["A", "B", "C", "D", "F"]

    def fmt_int(n: object) -> str:
        try:
            return str(int(n))
        except Exception:
            return "0"

    # Header
    header = ["STATE", "TOTAL"] + labels
    widths = [12, 7] + [6] * len(labels)

    def row_line(cols: list[str]) -> str:
        out = []
        for i, c in enumerate(cols):
            w = widths[i] if i < len(widths) else 10
            out.append(c.rjust(w) if i else c.ljust(w))
        return " ".join(out)

    print("\nQUALITY STATS (by state)", file=sys.stderr)
    print(row_line(header), file=sys.stderr)
    print(row_line(["-" * widths[0], "-" * widths[1]] + ["-" * 6] * len(labels)), file=sys.stderr)

    # Rows
    for st in states:
        per = label_by_state.get(st) or {}
        cols = [st, fmt_int(state_counts.get(st, 0))]
        for lb in labels:
            cols.append(fmt_int(per.get(lb, 0)))
        print(row_line(cols), file=sys.stderr)

    # Totals
    print("", file=sys.stderr)
    total = report.get("fragments_total", 0)
    min_s = report.get("min_score", 0)
    avg_s = report.get("avg_score", 0.0)
    max_s = report.get("max_score", 0)
    print(f"TOTAL: {total}    min/avg/max: {min_s}/{avg_s:.1f}/{max_s}", file=sys.stderr)
    print(f"LABELS: {label_counts}", file=sys.stderr)

    if buckets:
        order = ["0-44", "45-54", "55-69", "70-84", "85-100"]
        parts = [f"{k}:{fmt_int(buckets.get(k, 0))}" for k in order if k in buckets] + [
            f"{k}:{fmt_int(v)}" for k, v in buckets.items() if k not in order
        ]
        print("BUCKETS: " + "  ".join(parts), file=sys.stderr)


def cmd_fragments_stats(args: argparse.Namespace) -> int:
    by_quality = bool(getattr(args, "by_quality", False))
    source_id = int(getattr(args, "source_id", 0) or 0)
    if (not by_quality) and (not source_id):
        print("ERROR: --source-id is required (unless --by-quality)", file=sys.stderr)
        return 2
    state = (getattr(args, "state", "") or "").strip()
    
    where = ["1=1"]
    params: list[object] = []
    if source_id > 0:
        where.append("source_id=?")
        params.append(source_id)
    state = (getattr(args, "state", "") or "").strip()
    if state:
        where.append("state=?")
        params.append(state)
    
    where_sql = " AND ".join(where)

    as_json = bool(getattr(args, "json", False))
    compact = bool(getattr(args, "compact", False))

    conn = _connect(_staging_db_path())
    if by_quality:
        rows = conn.execute(
            f"""
            SELECT quality_score, quality_label, state, quality_reasons_json
            FROM kb_fragments
            WHERE {where_sql}
            """,
            params,
        ).fetchall()

        total = len(rows)
        label_ctr: Counter[str] = Counter()
        state_ctr: Counter[str] = Counter()
        label_by_state: dict[str, Counter[str]] = {}
        reason_ctr: Counter[str] = Counter()
        score_buckets = {
            "0-44": 0,
            "45-54": 0,
            "55-69": 0,
            "70-84": 0,
            "85-100": 0,
        }


        min_score: Optional[int] = None
        max_score: Optional[int] = None
        sum_score = 0

        for score, label, st, reasons_json in rows:
            sc = int(score or 0)
            if sc <= 44:
                score_buckets["0-44"] += 1
            elif sc <= 54:
                score_buckets["45-54"] += 1
            elif sc <= 69:
                score_buckets["55-69"] += 1
            elif sc <= 84:
                score_buckets["70-84"] += 1
            else:
                score_buckets["85-100"] += 1
            lb = str(label or "")
            st = str(st or "")

            label_ctr[lb] += 1
            state_ctr[st] += 1
            label_by_state.setdefault(st, Counter())[lb] += 1

            min_score = sc if min_score is None else min(min_score, sc)
            max_score = sc if max_score is None else max(max_score, sc)
            sum_score += sc

            if reasons_json:
                try:
                    r = json.loads(reasons_json)
                    if isinstance(r, dict):
                        for k, v in r.items():
                            reason_ctr[str(k)] += int(v or 0)
                except Exception:
                    reason_ctr["reasons_json_parse_error"] += 1

        report = {
            "fragments_total": total,
            "filters": {"source_id": source_id or None, "state": state or None},
            "min_score": int(min_score or 0),
            "avg_score": (sum_score / total) if total else 0.0,
            "max_score": int(max_score or 0),
            "label_counts": dict(label_ctr),
            "state_counts": dict(state_ctr),
            "label_by_state": {k: dict(v) for k, v in label_by_state.items()},
            "top_reason_counts": dict(reason_ctr.most_common(20)),
            "score_buckets": score_buckets,
        }

        as_json = bool(getattr(args, "json", False))
        compact = bool(getattr(args, "compact", False))
        if as_json:
            if compact:
                print(json.dumps(report, ensure_ascii=False, separators=(",", ":")))
            else:
                print(json.dumps(report, ensure_ascii=False, indent=2))
        else:
            _print_quality_stats_pretty(report)

        return 0


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
            print(json.dumps(payload, ensure_ascii=False, indent=None if compact else 2))
        else:
            print(
                f"source_id={source_id} total={total} requires_rewrite={requires_rewrite} "
                f"bot_ready={bot_ready} has_url={has_url}",
                file=sys.stderr,
            )
        return 0
        
    finally:
        conn.close()

    

def cmd_fragments_export(args: argparse.Namespace) -> int:
    source_id = int(getattr(args, "source_id", 0) or 0)
    if not source_id:
        print("ERROR: --source-id is required", file=sys.stderr)
        return 2

    state = (getattr(args, "state", "") or "").strip()
    needs_rewrite_only = bool(getattr(args, "needs_rewrite_only", False))
    bot_ready_only = bool(getattr(args, "bot_ready_only", False))
    q = (getattr(args, "q", "") or "").strip()
    limit = int(getattr(args, "limit", 0) or 0)

    out_path_raw = (getattr(args, "out", "") or "").strip()
    out_path = Path(out_path_raw) if out_path_raw else None
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
            like = f"%{q}%"
            params.extend([like, like])

        sql = f"""
        SELECT id, key, locale, topic_category, tone, abstraction_level, state, created_at, updated_at, meta_json, text
        FROM kb_fragments
        WHERE {' AND '.join(where)}
        ORDER BY id ASC
        """.strip()

        rows = conn.execute(sql, params).fetchall()

        # Apply derived filters in Python (meta_json + direct address)
        items: list[dict[str, Any]] = []
        skipped_filter = 0

        for r in rows:
            meta_obj = _json_load_dict(r["meta_json"])
            requires_rewrite = bool(meta_obj.get("requires_rewrite", False))
            txt = str(r["text"] or "")
            bot_ready = bool(_DIRECT_ADDRESS_RE.search(txt))

            if needs_rewrite_only and not requires_rewrite:
                skipped_filter += 1
                continue
            if bot_ready_only and not bot_ready:
                skipped_filter += 1
                continue

            obj: dict[str, Any] = {
                "id": int(r["id"]),
                "key": str(r["key"]),
                "locale": str(r["locale"]),
                "state": str(r["state"]),
                "topic_category": str(r["topic_category"]),
                "tone": str(r["tone"]),
                "abstraction_level": str(r["abstraction_level"]),
                "created_at": str(r["created_at"]),
                "updated_at": str(r["updated_at"]),
                "requires_rewrite": requires_rewrite,
                "bot_ready": bot_ready,
            }
            if include_text:
                obj["text"] = txt
            if include_meta:
                obj["meta_json"] = meta_obj

            items.append(obj)
            if limit and len(items) >= limit:
                break

        # Write JSONL
        out_fp = None
        try:
            if out_path:
                out_path.parent.mkdir(parents=True, exist_ok=True)
                out_fp = out_path.open("w", encoding="utf-8", newline="\n")
                writer = out_fp
            else:
                writer = sys.stdout

            for obj in items:
                writer.write(json.dumps(obj, ensure_ascii=False) + "\n")

            if out_fp:
                out_fp.flush()
        finally:
            if out_fp:
                out_fp.close()

        print(
            f"export: source_id={source_id} matched={len(rows)} exported={len(items)} skipped_filter={skipped_filter}"
            + (f" out={str(out_path)}" if out_path else ""),
            file=sys.stderr,
        )
        return 0
    finally:
        conn.close()

def cmd_fragments_list(args: argparse.Namespace) -> int:
    """
    List staging fragments with the same filters as `fragments export`.

    Filters:
      --needs-rewrite-only  -> meta_json.requires_rewrite == True
      --bot-ready-only      -> direct address heuristic in text
    """
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

        min_score = getattr(args, "min_score", None)
        max_score = getattr(args, "max_score", None)
        order = (getattr(args, "order", "") or "").strip().lower()
        asc = bool(getattr(args, "asc", False))

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
        if min_score is not None:
            where.append("quality_score >= ?")
            params.append(int(min_score))
        if max_score is not None:
            where.append("quality_score <= ?")
            params.append(int(max_score))


        order_by = "id"
        if order == "quality_score":
            order_by = "quality_score"
        direction = "ASC" if asc else "DESC"

        sql = f"""
            SELECT id, key, topic_category, locale, tone, abstraction_level, state, created_at,
                meta_json, text, quality_score, quality_label, quality_reasons_json
            FROM kb_fragments
            WHERE {' AND '.join(where) if where else '1=1'}
            ORDER BY {order_by} {direction}, id DESC
            LIMIT ?
        """.strip()

        params.append(limit)

        rows = conn.execute(sql, params).fetchall()

        # Same filtering logic as export (important!)
        if needs_rewrite_only or bot_ready_only:
            filtered: list[sqlite3.Row] = []
            for r in rows:
                meta = _json_load_dict(r["meta_json"])
                requires_rewrite = bool(meta.get("requires_rewrite", False))
                bot_ready = bool(_DIRECT_ADDRESS_RE.search(str(r["text"] or "")))

                if needs_rewrite_only and not requires_rewrite:
                    continue
                if bot_ready_only and not bot_ready:
                    continue
                filtered.append(r)
            rows = filtered

        show_reasons = bool(getattr(args, "show_reasons", False))
        reasons_top = int(getattr(args, "reasons_top", 5) or 5)
        show_text = int(getattr(args, "show_text", 0) or 0)
        with_meta = bool(getattr(args, "with_meta", False))
        meta_max = int(getattr(args, "meta_max", 220) or 220)

        _print_rows(
            rows,
            show_reasons=show_reasons,
            reasons_top=reasons_top,
            show_text=show_text,
            with_meta=with_meta,
            meta_max=meta_max,
        )

        return 0
    finally:
        conn.close()

def cmd_fragments_show(args: argparse.Namespace) -> int:
    """Show one staging fragment by id with optional meta/reasons/text.

    Resilient to staging schema differences (columns may be missing).
    """
    fragment_id = int(getattr(args, "id", 0) or 0)
    if not fragment_id:
        print("ERROR: --id is required", file=sys.stderr)
        return 2

    show_reasons = bool(getattr(args, "show_reasons", False))
    reasons_top = int(getattr(args, "reasons_top", 10) or 10)
    with_meta = bool(getattr(args, "with_meta", False))
    show_text = int(getattr(args, "show_text", 0) or 0)

    conn = _connect(_staging_db_path())
    try:
        _ensure_staging_schema(conn)

        cols = _table_columns(conn, "kb_fragments")

        base_cols = [
            "id",
            "key",
            "topic_category",
            "locale",
            "tone",
            "abstraction_level",
            "state",
            "created_at",
            "updated_at",
            "author",
            "source_id",
            "quality_score",
            "quality_label",
            "quality_reasons_json",
            "meta_json",
            "factors_json",
            "text",
        ]

        # Optional columns (may not exist in older DBs)
        optional_cols = []
        for c in ["source_chunk_id", "source_chunk_seq", "source_chunk_hash", "source_chunk_start", "source_chunk_end"]:
            if c in cols:
                optional_cols.append(c)

        select_cols = [c for c in base_cols if c in cols] + optional_cols
        sql = f"SELECT {', '.join(select_cols)} FROM kb_fragments WHERE id=?"

        row = conn.execute(sql, (fragment_id,)).fetchone()
        if not row:
            print(f"NOT FOUND: fragment id={fragment_id}", file=sys.stderr)
            return 1

        keys = set(row.keys())

        def _v(name: str, default: Any = None) -> Any:
            return row[name] if name in keys else default

        q_score = int(_v("quality_score", 0) or 0)
        q_label = str(_v("quality_label", "") or "")

        print(
            f"{int(_v('id', 0)):<8} {str(_v('key', '')):<36} {str(_v('topic_category', '')):<22} "
            f"{str(_v('locale', '')):<7} {str(_v('tone', '')):<12} {str(_v('abstraction_level', '')):<14} "
            f"{str(_v('state', '')):<12} {q_score:>3} {q_label}"
        )

        created_at = str(_v("created_at", "") or "")
        updated_at = str(_v("updated_at", "") or "")
        print(f"        created: {created_at}   updated: {updated_at}")

        author = str(_v("author", "") or "")
        source_id = _v("source_id", None)
        # These may be absent; if absent, they still might exist in meta_json as chunk_id/chunk_seq/etc.
        source_chunk_id = _v("source_chunk_id", None)

        line2 = f"        author: {author}   source_id: {source_id}"
        if source_chunk_id is not None:
            line2 += f"   source_chunk_id: {source_chunk_id}"
        print(line2)

        if show_reasons and "quality_reasons_json" in keys:
            raw = (_v("quality_reasons_json", "{}") or "{}").strip()
            try:
                d = json.loads(raw) if raw else {}
            except Exception:
                d = {}
            if isinstance(d, dict) and d:
                def _val(x: Any) -> float:
                    return float(x) if isinstance(x, (int, float)) else 0.0

                items = sorted(d.items(), key=lambda kv: _val(kv[1]), reverse=True)[: max(1, reasons_top)]
                pretty = ", ".join([f"{k}:{v}" for k, v in items])
                print(f"        reasons: {pretty}")

        if with_meta:
            meta_raw = (_v("meta_json", "{}") or "{}").strip()
            factors_raw = (_v("factors_json", "{}") or "{}").strip()
            try:
                meta = json.loads(meta_raw) if meta_raw else {}
            except Exception:
                meta = {}
            try:
                factors = json.loads(factors_raw) if factors_raw else {}
            except Exception:
                factors = {}

            print("        meta_json:")
            print(json.dumps(meta, ensure_ascii=False, indent=2))
            print("        factors_json:")
            print(json.dumps(factors, ensure_ascii=False, indent=2))

        t = str(_v("text", "") or "").strip()
        if t:
            if show_text > 0:
                t1 = t.replace("\r", " ").replace("\n", " ").strip()
                if len(t1) > show_text:
                    t1 = t1[:show_text] + "…"
                print(f"        text: {t1}")
            else:
                print("        text:")
                print(t)

        return 0
    finally:
        conn.close()



def cmd_fragments_purge(args: argparse.Namespace) -> int:
    source_id = int(getattr(args, "source_id", 0) or 0)
    if not source_id:
        print("ERROR: --source-id is required", file=sys.stderr)
        return 2

    only_extractor = (getattr(args, "only_extractor", "") or "").strip()
    state = (getattr(args, "state", "") or "").strip()
    limit = int(getattr(args, "limit", 0) or 0)

    dry_run = bool(getattr(args, "dry_run", False))
    as_json = bool(getattr(args, "json", False))
    compact = bool(getattr(args, "compact", False))

    who = (getattr(args, "who", "KB") or "KB").strip()
    note = (getattr(args, "note", "purge") or "purge").strip()

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
            SELECT id, key, locale, state, meta_json
            FROM kb_fragments
            WHERE {' AND '.join(where)}
            ORDER BY id ASC
            """.strip(),
            params,
        ).fetchall()

        selected: list[int] = []
        skipped_filter = 0

        for r in rows:
            meta = _json_load_dict(r["meta_json"])
            extractor = str(meta.get("extractor") or "")
            if only_extractor and extractor != only_extractor:
                skipped_filter += 1
                continue

            selected.append(int(r["id"]))
            if limit and len(selected) >= limit:
                break

        deleted = 0
        now = _utcnow_iso()

        if not dry_run:
            for fid in selected:
                row = conn.execute("SELECT state FROM kb_fragments WHERE id=?", (fid,)).fetchone()
                from_state = str(row["state"] if row else "")
                conn.execute(
                    """
                    INSERT INTO kb_events(fragment_id, from_state, to_state, who, note, ts)
                    VALUES(?,?,?,?,?,?)
                    """.strip(),
                    (fid, from_state, "purged", who, note, now),
                )
                conn.execute("DELETE FROM kb_fragments WHERE id=?", (fid,))
                deleted += 1
            conn.commit()
        else:
            deleted = len(selected)

        payload = {
            "dry_run": dry_run,
            "source_id": source_id,
            "state": state or None,
            "only_extractor": only_extractor or None,
            "matched": len(rows),
            "selected": len(selected),
            "deleted": deleted,
            "skipped_filter": skipped_filter,
        }

        if as_json:
            print(json.dumps(payload, ensure_ascii=False, indent=None if compact else 2))
        else:
            print(
                f"purge: source_id={source_id} matched={len(rows)} selected={len(selected)} "
                f"deleted={deleted} skipped_filter={skipped_filter}"
                + (f" extractor={only_extractor}" if only_extractor else ""),
                file=sys.stderr,
            )
        return 0
    finally:
        conn.close()

def cmd_fragments_rerate(args: argparse.Namespace) -> int:
    """
    Recompute RU quality rating for existing staging fragments and store it in columns:
      - quality_score
      - quality_label
      - quality_reasons_json

    Usage:
      kb fragments re-rate --all
      kb fragments re-rate --source-id 1
    """
    if not getattr(args, "all", False) and not getattr(args, "source_id", 0):
        raise SystemExit("Provide --all or --source-id")

    conn = _connect(_staging_db_path())
    try:
        _ensure_staging_schema(conn)

        where = []
        params: list[object] = []

        if not getattr(args, "all", False):
            where.append("source_id = ?")
            params.append(int(args.source_id))

        state = (getattr(args, "state", "") or "").strip()
        if state:
            where.append("state = ?")
            params.append(state)

        where_sql = (" WHERE " + " AND ".join(where)) if where else ""
        limit = int(getattr(args, "limit", 0) or 0)
        limit_sql = f" LIMIT {limit}" if limit > 0 else ""

        rows = conn.execute(
            f"SELECT id, text FROM kb_fragments{where_sql} ORDER BY id{limit_sql}",
            params,
        ).fetchall()

        total = len(rows)
        processed = 0
        updated = 0
        min_score: Optional[int] = None
        max_score: Optional[int] = None
        sum_score = 0

        label_ctr: Counter[str] = Counter()
        reason_ctr: Counter[str] = Counter()

        now = _utcnow_iso()
        dry_run = bool(getattr(args, "dry_run", False))
        commit_batch = int(getattr(args, "commit_batch", 500) or 500)
        below = int(getattr(args, "below", 0) or 0)
        set_state = (getattr(args, "set_state", "") or "").strip()
        above = int(getattr(args, "above", 0) or 0)
        set_state_above = (getattr(args, "set_state_above", "") or "").strip()
        only_if_state = (getattr(args, "only_if_state", "") or "").strip()
        normalize_3 = bool(getattr(args, "normalize_3", False))
        reject_below = int(getattr(args, "reject_below", 45) or 45)
        review_below = int(getattr(args, "review_below", 55) or 55)
        state_rejected = (getattr(args, "state_rejected", "archived") or "archived").strip()
        state_review = (getattr(args, "state_review", "needs_review") or "needs_review").strip()
        state_enabled = (getattr(args, "state_enabled", "enabled") or "enabled").strip()

        if normalize_3 and not (0 <= reject_below < review_below):
            raise SystemExit("--reject-below must be < --review-below")

        for frag_id, text_ in rows:
            processed += 1
            qr = rate_fragment_ru(text_ or "")
            score = int(qr.score)
            label = str(qr.label)
            reasons_json = json.dumps(qr.reasons, ensure_ascii=False)

            label_ctr[label] += 1
            for k, v in (qr.reasons or {}).items():
                reason_ctr[str(k)] += int(v)

            min_score = score if min_score is None else min(min_score, score)
            max_score = score if max_score is None else max(max_score, score)
            sum_score += score

            target_state = None

            if normalize_3:
                if score < reject_below:
                    target_state = state_rejected
                elif score < review_below:
                    target_state = state_review
                else:
                    target_state = state_enabled
            else:
                if below > 0 and set_state and score < below:
                    target_state = set_state
                elif above > 0 and set_state_above and score >= above:
                    target_state = set_state_above

            if below > 0 and set_state and score < below:
                target_state = set_state
            elif above > 0 and set_state_above and score >= above:
                target_state = set_state_above

            if not dry_run:
                if target_state is not None:
                    # Update quality + state only if something actually changes
                    if only_if_state:
                        cur = conn.execute(
                            """
                            UPDATE kb_fragments
                            SET quality_score=?,
                                quality_label=?,
                                quality_reasons_json=?,
                                state=?,
                                updated_at=?
                            WHERE id=? AND state=?
                              AND (
                                   quality_score <> ?
                                OR quality_label <> ?
                                OR quality_reasons_json <> ?
                                OR state <> ?
                              )
                            """,
                            (
                                score, label, reasons_json, target_state, now,
                                int(frag_id), only_if_state,
                                score, label, reasons_json, target_state,
                            ),
                        )
                        updated += int(cur.rowcount or 0)
                    else:
                        cur = conn.execute(
                            """
                            UPDATE kb_fragments
                            SET quality_score=?,
                                quality_label=?,
                                quality_reasons_json=?,
                                state=?,
                                updated_at=?
                            WHERE id=?
                              AND (
                                   quality_score <> ?
                                OR quality_label <> ?
                                OR quality_reasons_json <> ?
                                OR state <> ?
                              )
                            """,
                            (
                                score, label, reasons_json, target_state, now,
                                int(frag_id),
                                score, label, reasons_json, target_state,
                            ),
                        )
                        updated += int(cur.rowcount or 0)
                else:
                    # Update quality only if something actually changes
                    cur = conn.execute(
                        """
                        UPDATE kb_fragments
                        SET quality_score=?,
                            quality_label=?,
                            quality_reasons_json=?,
                            updated_at=?
                        WHERE id=?
                          AND (
                               quality_score <> ?
                            OR quality_label <> ?
                            OR quality_reasons_json <> ?
                          )
                        """,
                        (
                            score, label, reasons_json, now,
                            int(frag_id),
                            score, label, reasons_json,
                        ),
                    )
                    updated += int(cur.rowcount or 0)

                # Commit in batches (updated == actually changed rows)
                if commit_batch > 0 and (processed % commit_batch == 0):
                    conn.commit()


        if not dry_run:
            conn.commit()

        avg_score = (sum_score / total) if total else 0.0
        report = {
            "fragments_total": total,
            "processed": processed,
            "updated": updated,
            "dry_run": dry_run,
            "min_score": min_score if min_score is not None else 0,
            "avg_score": avg_score,
            "max_score": max_score if max_score is not None else 0,
            "label_counts": dict(label_ctr),
            "top_reason_counts": dict(reason_ctr.most_common(20)),
        }

        as_json = bool(getattr(args, "json", False))
        compact = bool(getattr(args, "compact", False))

        if as_json:
            if compact:
                print(json.dumps(report, ensure_ascii=False, separators=(",", ":")))
            else:
                print(json.dumps(report, ensure_ascii=False, indent=2))
        else:
            print(
                f"re-rate: total={report['fragments_total']} updated={report['updated']} "
                f"dry_run={report['dry_run']} min/avg/max={report['min_score']}/{report['avg_score']:.1f}/{report['max_score']}",
                file=sys.stderr,
            )
            print(f"labels={report['label_counts']}", file=sys.stderr)
            print(f"top_reasons={report['top_reason_counts']}", file=sys.stderr)
        
        return 0
    finally:
        conn.close()

def cmd_ingest(args: argparse.Namespace) -> int:
    path = Path(getattr(args, "path", "") or "")
    if not path.exists():
        print(f"ERROR: path not found: {path}", file=sys.stderr)
        return 2

    default_locale = (getattr(args, "locale", "") or "ru-RU").strip() or "ru-RU"
    chunk_size = int(getattr(args, "chunk_size", 6000) or 6000)
    dry_run = bool(getattr(args, "dry_run", False))
    as_json = bool(getattr(args, "json", False))
    compact = bool(getattr(args, "compact", False))
    force = bool(getattr(args, "force", False))

    supported = {".fb2", ".zip", ".txt", ".md", ".docx", ".epub"}

    files: list[Path] = []
    if path.is_dir():
        for p in sorted(path.rglob("*")):
            if p.is_file() and p.suffix.lower() in supported:
                files.append(p)
    else:
        if path.suffix.lower() in supported:
            files = [path]
        else:
            files = [path]  # let reader raise a clear error

    conn = _connect(_staging_db_path())
    try:
        _ensure_staging_schema(conn)

        sources_created = 0
        sources_reused = 0
        chunks_created = 0
        errors: list[dict[str, Any]] = []

        for fp in files:
            try:
                source_type, locale, plain, title, author, canonical_bytes = _read_source_to_text(fp, default_locale)

                if not plain.strip():
                    continue

                # sha: canonical-bytes for fb2.zip, else raw file bytes
                if canonical_bytes is not None:
                    sha = _sha256_bytes(canonical_bytes)
                    file_size = fp.stat().st_size
                else:
                    sha = _sha256_file(fp)
                    file_size = fp.stat().st_size

                file_name = fp.name

                row = conn.execute("SELECT id FROM kb_sources WHERE sha256=?", (sha,)).fetchone()
                if row:
                    source_id = int(row["id"])
                    sources_reused += 1
                    if force and not dry_run:
                        conn.execute("DELETE FROM kb_source_chunks WHERE source_id=?", (source_id,))
                else:
                    if dry_run:
                        source_id = -1
                    else:
                        meta = {"file_path": str(fp), "file_ext": fp.suffix.lower()}
                        cur = conn.execute(
                            "INSERT INTO kb_sources(title,path,sha256,imported_at,notes,source_type,author,locale,file_name,file_size,meta_json) "
                            "VALUES(?,?,?,?,?,?,?,?,?,?,?)",
                            (
                                title or file_name,
                                str(fp),
                                sha,
                                _utcnow_iso(),
                                "",
                                source_type,
                                author,
                                locale,
                                file_name,
                                file_size,
                                json.dumps(meta, ensure_ascii=False),
                            ),
                        )
                        source_id = int(cur.lastrowid)
                    sources_created += 1

                chunks = _chunk_text(_normalize_text_ingest(plain), chunk_size)
                if not chunks:
                    continue

                if dry_run:
                    chunks_created += len(chunks)
                    continue

                if row and not force:
                    existing = conn.execute(
                        "SELECT COUNT(1) AS n FROM kb_source_chunks WHERE source_id=?", (source_id,)
                    ).fetchone()
                    if existing and int(existing["n"] or 0) > 0:
                        continue

                for seq, (cs, ce, chunk_text) in enumerate(chunks, start=1):
                    ch_sha = _sha256_bytes(chunk_text.encode("utf-8"))
                    conn.execute(
                        "INSERT OR REPLACE INTO kb_source_chunks(source_id,seq,locale,text,sha256,char_start,char_end,created_at) "
                        "VALUES(?,?,?,?,?,?,?,?)",
                        (source_id, seq, locale, chunk_text, ch_sha, cs, ce, _utcnow_iso()),
                    )
                chunks_created += len(chunks)

            except Exception as e:
                errors.append({"file": str(fp), "error": str(e)})

        if not dry_run:
            conn.commit()

        report = {
            "dry_run": dry_run,
            "files_total": len(files),
            "sources_created": sources_created,
            "sources_reused": sources_reused,
            "chunks_created": chunks_created,
            "errors": errors,
        }

        if as_json:
            print(json.dumps(report, ensure_ascii=False, indent=None if compact else 2))
        else:
            print(
                f"ingest: files={len(files)} sources_created={sources_created} "
                f"sources_reused={sources_reused} chunks_created={chunks_created}",
                file=sys.stderr,
            )
            if errors:
                print(f"errors: {len(errors)} (use --json)", file=sys.stderr)
        return 0
    finally:
        conn.close()


def _atomize_chunk(
    text: str, *, min_len: int, max_len: int, target_min: int, target_max: int, max_newlines: int
) -> list[tuple[int, int, str]]:
    """Atomize a chunk into candidate atoms.

    Sentence-driven by default:
      - Split by paragraphs (\n\n)
      - For regular paragraphs: split into sentences and accumulate until target_min
      - Flush only on a "safe end" (end of sentence) unless forced by target_max

    Structural exceptions (lightweight, to reduce false negatives):
      - List-like paragraphs are kept as a single unit.
      - Definition-like paragraphs (TERM — definition) are kept as a single unit.

    Offsets (char_start/char_end) are relative to the normalized chunk text, matching the previous
    implementation approach.
    """

    text = _normalize_text(text)
    if not text:
        return []

    # --- detectors (very conservative; step B will refine later) ---

    list_line_re = re.compile(r"^\s*(?:[-—•*]|\d{1,3}[\).]|[a-zа-я]\))\s+")
    def_line_re = re.compile(r"^\s*[^\n]{1,60}\s*[—-]\s+\S+")

    def _looks_like_list_para(para: str) -> bool:
        lines = [ln for ln in para.splitlines() if ln.strip()]
        if len(lines) < 3:
            return False
        hits = sum(1 for ln in lines if list_line_re.match(ln))
        return (hits / max(1, len(lines))) >= 0.6

    def _looks_like_definitions_para(para: str) -> bool:
        lines = [ln for ln in para.splitlines() if ln.strip()]
        if len(lines) < 2:
            return False
        hits = sum(1 for ln in lines if def_line_re.match(ln))
        return (hits / max(1, len(lines))) >= 0.7

    # Sentence splitting: scan for sentence-ending punctuation and split on whitespace after it.
    sent_end_re = re.compile(r"[.!?…]+")
    split_after_re = re.compile(r"[\s\u00a0]+")

    def _iter_sentence_spans(s: str) -> list[tuple[int, int]]:
        spans: list[tuple[int, int]] = []
        i = 0
        n = len(s)
        while i < n:
            m_end = sent_end_re.search(s, i)
            if not m_end:
                break
            end = m_end.end()
            # Eat trailing quotes/brackets and spaces after punctuation.
            j = end
            while j < n and s[j] in '"»”’)]}':
                j += 1
            m_ws = split_after_re.match(s, j)
            if m_ws:
                j = m_ws.end()
            # Sentence span is [i, j)
            if j > i:
                spans.append((i, j))
            i = j
        # tail (no ending punctuation) is handled by caller as a continuation unit
        return spans

    atoms: list[tuple[int, int, str]] = []
    buf_start: int | None = None
    buf_end: int = 0
    last_safe_end: int | None = None

    def _finalize_atom(start: int, end: int) -> None:
        atom = text[start:end].strip()
        atom = _normalize_text(atom)
        if not atom:
            return
        atom = re.sub(r"\n{3,}", "\n\n", atom)
        if atom.count("\n") > max_newlines:
            atom = atom.replace("\n\n", " ").replace("\n", " ")
            atom = re.sub(r"\s{2,}", " ", atom).strip()

        if len(atom) < min_len or len(atom) > max_len:
            return
        low = atom.lower()
        if "http://" in low or "https://" in low or "```" in atom:
            return
        if not re.search(r"[.!?…]", atom):
            return

        atoms.append((start, end, atom))

    def _flush(end_pos: int) -> None:
        nonlocal buf_start, buf_end, last_safe_end
        if buf_start is None:
            return
        _finalize_atom(buf_start, end_pos)
        buf_start = None
        buf_end = 0
        last_safe_end = None

    def _is_safe_end(current_end: int, next_head: str) -> bool:
        tail = (text[max(0, current_end - 4):current_end] or "").strip()
        if tail.endswith(":") or tail.endswith("—") or tail.endswith("-"):
            return False
        if next_head and list_line_re.match(next_head):
            return False
        return True

    # Iterate paragraphs while tracking absolute offsets in normalized text.
    parts = text.split("\n\n")
    pos = 0
    for idx, raw_para in enumerate(parts):
        para = raw_para.strip()
        para_start = pos
        para_end = pos + len(raw_para)

        # Prepare next paragraph head for safe-end lookahead.
        next_head = ""
        if idx + 1 < len(parts):
            nxt = parts[idx + 1].lstrip()
            next_head = (nxt.splitlines()[0] if nxt else "")[:64]

        if not para:
            pos = para_end + 2
            continue

        structural_para = _looks_like_list_para(raw_para) or _looks_like_definitions_para(raw_para)

        if structural_para:
            # Treat as a single unit (paragraph boundary is a safe end by itself).
            unit_start = para_start
            unit_end = para_end

            if buf_start is None:
                buf_start = unit_start
            buf_end = unit_end

            # Force flush if oversized; otherwise flush if we reached target_min.
            cur_len = buf_end - buf_start
            if cur_len >= target_min:
                _flush(buf_end)
            elif cur_len > target_max:
                _flush(buf_end)

            pos = para_end + 2
            continue

        # Regular paragraph: sentence-driven units.
        rel_spans = _iter_sentence_spans(raw_para)
        consumed = 0
        for (rs, re_) in rel_spans:
            unit_start = para_start + rs
            unit_end = para_start + re_
            consumed = re_

            if buf_start is None:
                buf_start = unit_start
            buf_end = unit_end

            # Determine the "next head" after this sentence (within paragraph or next paragraph).
            intra_next = raw_para[re_:].lstrip()
            unit_next_head = (intra_next.splitlines()[0] if intra_next else next_head)[:64]

            if _is_safe_end(unit_end, unit_next_head):
                last_safe_end = unit_end

            cur_len = buf_end - buf_start
            if cur_len >= target_min and last_safe_end is not None:
                flush_end = last_safe_end
                _flush(flush_end)
                # if we flushed before current sentence end (rare), reopen buffer for remainder
                if unit_end > flush_end:
                    buf_start = flush_end
                    buf_end = unit_end
                    last_safe_end = unit_end

            if buf_start is not None and (buf_end - buf_start) > target_max:
                # Prefer flushing at last safe end; else flush hard at current end.
                _flush(last_safe_end or buf_end)

        # Tail without sentence-ending punctuation: keep it as continuation unit.
        tail = raw_para[consumed:]
        if tail and tail.strip():
            unit_start = para_start + consumed
            unit_end = para_end
            if buf_start is None:
                buf_start = unit_start
            buf_end = unit_end
            # Not a safe end; we only flush if target_max is exceeded.
            if buf_start is not None and (buf_end - buf_start) > target_max:
                _flush(last_safe_end or buf_end)

        pos = para_end + 2

    if buf_start is not None:
        _flush(buf_end)

    return atoms


def cmd_atomize(args: argparse.Namespace) -> int:
    sid = None
    min_sent_letters = int(getattr(args, "min_sent_letters", 40) or 40)
    source_id = int(getattr(args, "source_id", 0) or 0)
    do_all = bool(getattr(args, "all", False))
    mode = (getattr(args, "mode", "b") or "b").strip().lower()
    state = (getattr(args, "state", "needs_review") or "needs_review").strip()
    locale_override = (getattr(args, "locale", "") or "").strip()
    dry_run = bool(getattr(args, "dry_run", False))
    as_json = bool(getattr(args, "json", False))
    compact = bool(getattr(args, "compact", False))
    limit = int(getattr(args, "limit", 0) or 0)

    dump_skipped = int(getattr(args, "dump_skipped", 0) or 0)
    dump_topic_rejected = int(getattr(args, "dump_topic_rejected", 0) or 0)
    skipped_examples: list[dict[str, Any]] = []
    topic_rejected_examples: list[dict[str, Any]] = []
    
        # --- topic rejected aggregates (count ALL rejected, keep only N examples) ---
    topic_rejected_total = 0
    best_topic_ctr = Counter()
    best_score_ctr = Counter()
    best_topic_ctr: Counter[str] = Counter()
    best_score_ctr: Counter[str] = Counter()
    near_miss_ctr: Counter[str] = Counter()


    def _best_topic_and_score_from_scores(topic_scores: dict[str, Any] | None) -> tuple[str, int]:
        s = topic_scores or {}
        if not isinstance(s, dict) or not s:
            return ("no_topic", 0)
        t, sc = max(s.items(), key=lambda kv: kv[1])
        try:
            return (str(t), int(sc))
        except Exception:
            return ("no_topic", 0)

    def _best_topic_and_score_from_gate(gr) -> tuple[str, int]:
        s = getattr(gr, "topic_scores", None) or {}
        if not s:
            return ("no_topic", 0)
        t, sc = max(s.items(), key=lambda kv: kv[1])
        return (str(t), int(sc))
    
    def _best_topic_and_score(scores: dict[str, int] | None) -> tuple[str, int]:
        s = scores or {}
        if not s:
            return ("no_topic", 0)
        t, sc = max(s.items(), key=lambda kv: kv[1])
        return (t, int(sc))

    min_len = int(getattr(args, "min_len", 120) or 120)
    max_len = int(getattr(args, "max_len", 1800) or 1800)
    target_min = int(getattr(args, "target_min", 450) or 450)
    target_max = int(getattr(args, "target_max", 900) or 900)
    max_newlines = int(getattr(args, "max_newlines", 6) or 6)

    skip_garbled = bool(getattr(args, "skip_garbled", False))
    garble_threshold = float(getattr(args, "garble_threshold", 0.20) or 0.20)

    topic_gate_name = (getattr(args, "topic_gate", "off") or "off").strip().lower()
    if topic_gate_name in {"off", "none", "0", ""}:
        topic_gate_name = "off"
    topic_threshold = int(getattr(args, "topic_threshold", 3) or 3)
    include_topics_raw = (getattr(args, "include_topics", "") or "").strip()
    include_topics = [t.strip() for t in include_topics_raw.split(",") if t.strip()] if include_topics_raw else []
    upsert_existing = bool(getattr(args, "upsert_existing", False))

    skipped_garbled = 0
    skipped_sanitation = 0
    skipped_topic = 0
    skipped_existing = 0
    updated = 0
    skipped_mode = 0
    skipped_reasons: dict[str, int] = {}
    skipped_topic_reasons: dict[str, int] = {"no_topic": 0}
    best_topic_ctr: Counter[str] = Counter()
    best_score_ctr: Counter[str] = Counter()
    topic_rejected_total = 0

    if mode not in {"a", "b"}:
        print("ERROR: --mode must be 'a' or 'b'", file=sys.stderr)
        return 2

    gate = None
    if topic_gate_name not in {"off", "none", "0", ""}:
        # currently only one profile in MVP
        gate = NatalTopicGate(threshold=topic_threshold, include_topics=include_topics)

    conn = _connect(_staging_db_path())
    try:
        _ensure_staging_schema(conn)

        where = []
        params: list[Any] = []
        if do_all:
            where.append("1=1")
        else:
            where.append("source_id=?")
            params.append(source_id)

        sql = (
            f"SELECT id, source_id, seq, locale, text "
            f"FROM kb_source_chunks WHERE {' AND '.join(where)} ORDER BY source_id, seq"
        )
        rows = conn.execute(sql, params).fetchall()
        repeated_hf = _detect_repeated_headers_footers(rows)
        # preload sources metadata for sanitation (author/title)
        src_rows = conn.execute("SELECT id, title, author FROM kb_sources").fetchall()
        src_meta = {
            int(x["id"]): {"title": (x["title"] or ""), "author": (x["author"] or "")}
            for x in src_rows
        }

        inserted = 0

        for r in rows:
            chunk_id = int(r["id"])
            sid = int(r["source_id"])
            chunk_locale = (locale_override or r["locale"] or "ru-RU")
            chunk_text = r["text"] or ""

            if skip_garbled and _garble_score(chunk_text) >= garble_threshold:
                skipped_garbled += 1
                continue

            atoms = _atomize_chunk(
                chunk_text,
                min_len=min_len,
                max_len=max_len,
                target_min=target_min,
                target_max=target_max,
                max_newlines=max_newlines,
            )

            for (cs, ce, atom_text) in atoms:
                # 1) sanitation
                src = src_meta.get(sid, {})
                reason = _sanitation_reason_v1(
                    atom_text,
                    repeated_hf.get(sid, set()),
                    source_author=src.get("author") or None,
                    source_title=src.get("title") or None,
                    min_sent_letters=min_sent_letters,
                    min_len=min_len,
                    max_len=max_len,
                )

                if reason is not None:
                    skipped_sanitation += 1
                    skipped_reasons[reason] = skipped_reasons.get(reason, 0) + 1
                    if sid is not None and dump_skipped > 0 and len(skipped_examples) < dump_skipped:
                        src = src_meta.get(sid, {})
                        skipped_examples.append(
                            {
                                "reason": reason,
                                "source_id": sid,
                                "source_title": src.get("title") or None,
                                "source_author": src.get("author") or None,
                                "chunk_id": chunk_id,
                                "chunk_seq": int(r["seq"]),
                                "char_start": int(cs),
                                "char_end": int(ce),
                                "line_preview": _line_preview_for_report(atom_text, lines=2, max_len=240),
                                "snippet": _snippet_for_report(atom_text, 240),
                            }
                        )
                    continue

                # 2) topic gate (NEW)
                gate_result = None
                if gate is not None:
                    gate_result = gate.classify(atom_text)

                    if not gate_result.accepted:
                        skipped_topic += 1
                        topic_rejected_total += 1

                        # reason (у тебя сейчас почти всегда "no_topic", но оставим универсально)
                        skipped_topic_reasons[gate_result.reason] = skipped_topic_reasons.get(gate_result.reason, 0) + 1

                        # === NEW: best topic / best score stats ===
                        bt, bsc = _best_topic_and_score(gate_result.topic_scores)
                        best_topic_ctr[bt] += 1
                        best_score_ctr[str(bsc)] += 1
                        if bsc == (topic_threshold - 1):
                            near_miss_ctr[bt] += 1

                        # examples (как и было) — только если попросили dump
                        if sid is not None and dump_topic_rejected > 0 and len(topic_rejected_examples) < dump_topic_rejected:
                            src = src_meta.get(sid, {})
                            topic_rejected_examples.append(
                                {
                                    "reason": gate_result.reason,
                                    "source_id": sid,
                                    "source_title": src.get("title") or None,
                                    "source_author": src.get("author") or None,
                                    "chunk_id": chunk_id,
                                    "chunk_seq": int(r["seq"]),
                                    "char_start": int(cs),
                                    "char_end": int(ce),
                                    "topics": gate_result.topics,
                                    "topic_scores": gate_result.topic_scores,
                                    "total_score": gate_result.total_score,
                                    "snippet": _snippet_for_report(atom_text, 240),
                                }
                            )

                        continue

                # 3) existing mode rule (addressing)
                has_addr = bool(_DIRECT_ADDRESS_RE.search(atom_text))
                if mode == "a" and not has_addr:
                    skipped_mode += 1
                    continue

                content_hash = _sha1_text(_normalize_text(atom_text))
                key = f"src{sid}.{chunk_locale}.{content_hash[:12]}"

                row_existing = conn.execute(
                    "SELECT id, state, meta_json FROM kb_fragments WHERE key=? AND locale=?",
                    (key, chunk_locale),
                ).fetchone()

                # Обновляем только meta_json (topics/gate), state не трогаем.
                if row_existing:
                    st = (row_existing["state"] or "").strip()
                    if upsert_existing and st in {"draft", "needs_review"}:
                        if dry_run:
                            updated += 1
                        else:
                            topic_updates: dict[str, Any] = {}
                            if gate_result is not None:
                                topic_updates["topics"] = gate_result.topics
                                topic_updates["topic_scores"] = gate_result.topic_scores
                                topic_updates["gate"] = {
                                    "profile": gate_result.profile,
                                    "threshold": gate_result.threshold,
                                    "strong_hit": gate_result.strong_hit,
                                    "total_score": gate_result.total_score,
                                }

                            # Ничего не перетираем кроме topic-полей
                            new_meta_json = _merge_meta_json(row_existing["meta_json"], topic_updates)

                            conn.execute(
                                """
                                UPDATE kb_fragments
                                SET meta_json=?,
                                    updated_at=?
                                WHERE id=?
                                """,
                                (new_meta_json, _utcnow_iso(), int(row_existing["id"])),
                            )
                            updated += 1
                    else:
                        skipped_existing += 1
                    continue

                meta: dict[str, Any] = {
                    "source_id": sid,
                    "chunk_id": chunk_id,
                    "chunk_seq": int(r["seq"]),
                    "char_start": int(cs),
                    "char_end": int(ce),
                    "extractor": "atomizer_v1",
                    "content_hash": content_hash,
                    # existing flag behavior
                    "requires_rewrite": (mode == "b" and not has_addr),
                }

                # topic-gate meta (NEW)
                if gate_result is not None:
                    meta["topics"] = gate_result.topics
                    meta["topic_scores"] = gate_result.topic_scores
                    meta["gate"] = {
                        "profile": gate_result.profile,
                        "threshold": gate_result.threshold,
                        "strong_hit": gate_result.strong_hit,
                        "total_score": gate_result.total_score,
                    }

                if dry_run:
                    inserted += 1
                    if limit and inserted >= limit:
                        break
                    continue

                conn.execute(
                    """
                    INSERT INTO kb_fragments(
                      key, locale, topic_category, text, tone, abstraction_level, state,
                      factors_json, meta_json, source_id, author, created_at, updated_at
                    ) VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?)
                    """,
                    (
                        key,
                        chunk_locale,
                        getattr(args, "topic", "book") or "book",
                        atom_text,
                        getattr(args, "tone", "neutral") or "neutral",
                        getattr(args, "abstraction", "psychological") or "psychological",
                        state,
                        "{}",
                        json.dumps(meta, ensure_ascii=False),
                        sid,
                        "INGEST",
                        _utcnow_iso(),
                        _utcnow_iso(),
                    ),
                )
                inserted += 1
                if limit and inserted >= limit:
                    break

            if limit and inserted >= limit:
                break

        if not dry_run:
            conn.commit()

                # ---- auto-rate pipeline (optional) ----
        auto_rate = bool(getattr(args, "auto_rate", False))
        if auto_rate and (not dry_run):
            normalize_3 = bool(getattr(args, "auto_normalize_3", True))
            reject_below = int(getattr(args, "auto_reject_below", 45) or 45)
            review_below = int(getattr(args, "auto_review_below", 55) or 55)
            state_rejected = (getattr(args, "auto_state_rejected", "archived") or "archived").strip()

            rerate_ns = argparse.Namespace(
                all=True,
                source_id=0,
                json=True,
                compact=True,
                include_distributions=True,
                normalize_3=normalize_3,
                reject_below=reject_below,
                review_below=review_below,
                state_rejected=state_rejected,
            )

            buf = io.StringIO()
            with contextlib.redirect_stdout(buf):
                rc_rerate = cmd_fragments_rerate(rerate_ns)

            auto_rerate_report: dict[str, Any] = {"ok": rc_rerate == 0}
            try:
                auto_rerate_report.update(json.loads(buf.getvalue() or "{}"))
            except Exception:
                auto_rerate_report["raw"] = buf.getvalue()

            # Pretty stats to stderr (always)
            stats_pretty_ns = argparse.Namespace(
                by_quality=True,
                source_id=0,
                state="",
                json=False,
                compact=False,
            )
            cmd_fragments_stats(stats_pretty_ns)

            # JSON stats into atomize report (only when atomize --json)
            auto_stats_report: dict[str, Any] = {}
            if as_json:
                buf2 = io.StringIO()
                stats_json_ns = argparse.Namespace(
                    by_quality=True,
                    source_id=0,
                    state="",
                    json=True,
                    compact=True,
                )
                with contextlib.redirect_stdout(buf2):
                    rc_stats = cmd_fragments_stats(stats_json_ns)
                try:
                    auto_stats_report = json.loads(buf2.getvalue() or "{}")
                    auto_stats_report["ok"] = rc_stats == 0
                except Exception:
                    auto_stats_report = {"ok": rc_stats == 0, "raw": buf2.getvalue()}


        # ---- topic rejected aggregates (best topic / best score) ----
        
        def best_topic_and_score(ex: dict[str, Any]) -> tuple[str, int]:
            s = ex.get("topic_scores") or {}
            if not isinstance(s, dict) or not s:
                return ("no_topic", 0)
            t, sc = max(s.items(), key=lambda kv: kv[1])
            try:
                return (str(t), int(sc))
            except Exception:
                return ("no_topic", 0)

        for ex in topic_rejected_examples:
            t, sc = best_topic_and_score(ex)
            best_topic_ctr[t] += 1
            best_score_ctr[str(sc)] += 1

        report: dict[str, Any] = {
            "dry_run": dry_run,
            "mode": mode,
            "inserted": inserted,
            "updated": updated,
            "created": inserted,
            "skipped_existing": skipped_existing,
            "skipped_mode": skipped_mode,
            "skipped_garbled": skipped_garbled,
            "skipped_sanitation": skipped_sanitation,
            "skipped_topic": skipped_topic,
            "skipped_reasons": skipped_reasons,
            "skipped_topic_reasons": skipped_topic_reasons,
            "topic_gate": "off" if gate is None else "ru_natal_v1",
            "topic_threshold": topic_threshold,
            "include_topics": include_topics,
            "topic_rejected_examples": (topic_rejected_examples[:dump_topic_rejected] if dump_topic_rejected else []),
            "topic_rejected_total": topic_rejected_total,
            "topic_rejected_best_topic_counts": dict(best_topic_ctr),
            "topic_rejected_best_score_counts": dict(best_score_ctr),
            "topic_rejected_near_miss_total": int(sum(near_miss_ctr.values())),
            "topic_rejected_near_miss_topic_counts": dict(near_miss_ctr),
        }
        report["topic_rejected_total"] = topic_rejected_total
        report["topic_rejected_examples"] = topic_rejected_examples  # уже ограничен dump'ом
        report["topic_rejected_best_topic_counts"] = dict(best_topic_ctr)
        report["topic_rejected_best_score_counts"] = dict(best_score_ctr)
        report["topic_rejected_near_miss_total"] = int(sum(near_miss_ctr.values()))
        report["topic_rejected_near_miss_topic_counts"] = dict(near_miss_ctr)
        if auto_rate and (not dry_run):
            report["auto_rate"] = {
                "rerate": auto_rerate_report,
                "stats_by_quality": auto_stats_report,
            }

        if dump_skipped > 0:
            report["skipped_examples"] = skipped_examples

        if as_json:
            print(json.dumps(report, ensure_ascii=False, indent=None if compact else 2))
        else:
            print(
                f"atomize: inserted={inserted} skipped_existing={skipped_existing} "
                f"skipped_mode={skipped_mode} skipped_topic={skipped_topic}",
                file=sys.stderr,
            )
        return 0
    finally:
        conn.close()

def cmd_pipeline(args: argparse.Namespace) -> int:
    """
    One-shot KB pipeline:
      init -> ingest -> atomize --auto-rate -> validate release -> build

    Notes:
      - Designed for Windows-friendly stdout JSON (use cmd /c "... --json > out.json").
      - Uses existing command handlers directly (no shell).
    """
    as_json = bool(getattr(args, "json", False))
    compact = bool(getattr(args, "compact", False))

    run_init = not bool(getattr(args, "no_init", False))
    skip_ingest = bool(getattr(args, "skip_ingest", False))
    skip_atomize = bool(getattr(args, "skip_atomize", False))
    skip_validate = bool(getattr(args, "skip_validate", False))
    skip_build = bool(getattr(args, "skip_build", False))

    # ---- step: init ----
    init_rc = 0
    if run_init:
        init_ns = argparse.Namespace()
        init_rc = cmd_init(init_ns)
        if init_rc != 0:
            if as_json:
                print(json.dumps({"ok": False, "step": "init", "rc": init_rc}, ensure_ascii=False))
            return int(init_rc or 2)

    # ---- step: ingest ----
    ingest_rc = 0
    ingest_report: dict[str, Any] = {}
    if not skip_ingest:
        ingest_ns = argparse.Namespace(
            path=getattr(args, "path", ""),
            locale=getattr(args, "locale", "ru-RU"),
            chunk_size=getattr(args, "chunk_size", 6000),
            dry_run=False,
            json=as_json,
            compact=True,  # keep nested JSON single-line when captured
            force=bool(getattr(args, "force", False)),
        )
        if as_json:
            buf = io.StringIO()
            with contextlib.redirect_stdout(buf):
                ingest_rc = cmd_ingest(ingest_ns)
            try:
                ingest_report = json.loads(buf.getvalue() or "{}")
            except Exception:
                ingest_report = {"raw": buf.getvalue()}
        else:
            ingest_rc = cmd_ingest(ingest_ns)

        if ingest_rc != 0:
            if as_json:
                print(
                    json.dumps(
                        {"ok": False, "step": "ingest", "rc": ingest_rc, "ingest": ingest_report},
                        ensure_ascii=False,
                    )
                )
            return int(ingest_rc or 2)

    # ---- step: atomize (always uses --auto-rate unless skipped) ----
    atomize_rc = 0
    atomize_report: dict[str, Any] = {}
    if not skip_atomize:
        atomize_ns = argparse.Namespace(
            all=True,
            source_id=0,
            mode=getattr(args, "mode", "b"),
            dry_run=False,
            json=as_json,
            compact=True,
            # topic gate
            topic_gate=getattr(args, "topic_gate", "ru_natal_v1"),
            topic_threshold=int(getattr(args, "topic_threshold", 3) or 3),
            # auto-rate (your implemented feature)
            auto_rate=True,
            auto_normalize_3=True,
            auto_reject_below=int(getattr(args, "reject_below", 45) or 45),
            auto_review_below=int(getattr(args, "review_below", 55) or 55),
            auto_state_rejected=getattr(args, "state_rejected", "archived"),
        )

        if as_json:
            buf = io.StringIO()
            with contextlib.redirect_stdout(buf):
                atomize_rc = cmd_atomize(atomize_ns)
            try:
                atomize_report = json.loads(buf.getvalue() or "{}")
            except Exception:
                atomize_report = {"raw": buf.getvalue()}
        else:
            atomize_rc = cmd_atomize(atomize_ns)

        if atomize_rc != 0:
            if as_json:
                print(
                    json.dumps(
                        {"ok": False, "step": "atomize", "rc": atomize_rc, "atomize": atomize_report},
                        ensure_ascii=False,
                    )
                )
            return int(atomize_rc or 2)

    # ---- step: validate release ----
    validate_rc = 0
    validate_report: dict[str, Any] = {}
    if not skip_validate:
        validate_ns = argparse.Namespace(
            # validate release flags
            min_enabled_score=int(getattr(args, "min_enabled_score", 55) or 55),
            required_topics=(getattr(args, "required_topics", "") or "").strip(),
            min_per_topic=int(getattr(args, "min_per_topic", 3) or 3),
            baseline=(getattr(args, "baseline", "kb_baseline.json") or "kb_baseline.json").strip(),
            write_baseline=bool(getattr(args, "write_baseline", False)),
            fail_on_warn=bool(getattr(args, "fail_on_warn", False)),
            json=as_json,
        )

        if as_json:
            buf = io.StringIO()
            with contextlib.redirect_stdout(buf):
                validate_rc = cmd_validate_release(validate_ns)
            try:
                validate_report = json.loads(buf.getvalue() or "{}")
            except Exception:
                validate_report = {"raw": buf.getvalue()}
        else:
            validate_rc = cmd_validate_release(validate_ns)

        if validate_rc != 0:
            if as_json:
                print(
                    json.dumps(
                        {"ok": False, "step": "validate_release", "rc": validate_rc, "validate": validate_report},
                        ensure_ascii=False,
                    )
                )
            return int(validate_rc or 2)

    # ---- step: build ----
    build_rc = 0
    build_report: dict[str, Any] = {}
    if not skip_build:
        build_ns = argparse.Namespace(
            dry_run=bool(getattr(args, "dry_run_build", False)),
            json=as_json,
            compact=True,
        )

        if as_json:
            buf = io.StringIO()
            with contextlib.redirect_stdout(buf):
                build_rc = cmd_build(build_ns)
            try:
                build_report = json.loads(buf.getvalue() or "{}")
            except Exception:
                build_report = {"raw": buf.getvalue()}
        else:
            build_rc = cmd_build(build_ns)

        if build_rc != 0:
            if as_json:
                print(
                    json.dumps(
                        {"ok": False, "step": "build", "rc": build_rc, "build": build_report},
                        ensure_ascii=False,
                    )
                )
            return int(build_rc or 2)

    # ---- final report ----
    if as_json:
        out = {
            "ok": True,
            "steps": {
                "init": {"rc": init_rc},
                "ingest": {"rc": ingest_rc, **({"report": ingest_report} if ingest_report else {})},
                "atomize": {"rc": atomize_rc, **({"report": atomize_report} if atomize_report else {})},
                "validate_release": {"rc": validate_rc, **({"report": validate_report} if validate_report else {})},
                "build": {"rc": build_rc, **({"report": build_report} if build_report else {})},
            },
        }
        print(json.dumps(out, ensure_ascii=False, indent=None if compact else 2))
    else:
        print("PIPELINE: OK", file=sys.stderr)

    return 0


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
    sp.add_argument(
        "--state",
        default="draft",
        choices=["draft", "needs_review", "reviewed", "annotated", "validated", "enabled", "archived"],
    )
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
    sp.add_argument(
        "--to",
        required=True,
        choices=["draft", "needs_review", "reviewed", "annotated", "validated", "enabled", "archived"],
    )
    sp.add_argument("--who", default="KB")
    sp.add_argument("--note", default="")
    sp.set_defaults(func=cmd_state)

    sp = sub.add_parser("validate", help="validate knowledge base")
    subv = sp.add_subparsers(dest="validate_cmd")

    sp_rel = subv.add_parser("release", help="release-policy validation for staging before build")
    sp_rel.add_argument("--min-enabled-score", type=int, default=55)
    sp_rel.add_argument("--required-topics", default="")
    sp_rel.add_argument("--min-per-topic", type=int, default=3)
    sp_rel.add_argument("--baseline", default="")
    sp_rel.add_argument("--write-baseline", action="store_true")
    sp_rel.add_argument("--fail-on-warn", action="store_true")
    sp_rel.add_argument("--json", action="store_true")
    sp_rel.set_defaults(func=cmd_validate_release)

    # (опционально) оставить старую validate как "validate basic"
    sp_basic = subv.add_parser("basic", help="legacy/basic validate")
    sp_basic.set_defaults(func=cmd_validate)  # если у тебя уже есть cmd_validate

    sp = sub.add_parser("list", help="list fragments in staging (default) or items in production (--prod)")
    sp.add_argument("--prod", action="store_true")
    sp.add_argument("--active", action="store_true")
    sp.add_argument("--inactive", action="store_true")
    sp.add_argument("--with-text", action="store_true")
    sp.add_argument("--state", default="")
    sp.add_argument("--source-id", type=int, default=0)
    sp.add_argument("--needs-rewrite-only", dest="needs_rewrite_only", action="store_true",
                    help="(staging) only fragments with meta.requires_rewrite")
    sp.add_argument("--bot-ready-only", dest="bot_ready_only", action="store_true",
                    help="(staging) only fragments that already contain direct address")
    sp.add_argument("--topic", default="")
    sp.add_argument("--locale", default="")
    sp.add_argument("--key", default="", help="exact key match")
    sp.add_argument("--q", default="", help="search in key/text (LIKE)")
    sp.add_argument("--limit", type=int, default=50)
    sp.set_defaults(func=cmd_list)

    sp = sub.add_parser("show", help="show a key in staging + production")
    sp.add_argument("--key", required=True)
    sp.add_argument("--with-text", action="store_true")
    sp.add_argument("--json", action="store_true")
    sp.set_defaults(func=cmd_show)

    sp = sub.add_parser("restore", help="restore a key to enabled (archived -> needs_review -> validated -> enabled)")
    sp.add_argument("--key", required=True)
    sp.add_argument("--locale", default=None)
    sp.add_argument("--review-state", dest="review_state", default="needs_review")
    sp.add_argument("--who", default="KB")
    sp.add_argument("--note", default="restore")
    sp.add_argument("--dry-run", action="store_true")
    sp.add_argument("--build", action="store_true")
    sp.add_argument("--json", action="store_true")
    sp.add_argument("--compact", action="store_true")
    sp.add_argument("--verbose", action="store_true")
    sp.set_defaults(func=cmd_restore)

    # ---- ingest / atomize / sources / fragments ----
    sp = sub.add_parser("ingest", help="ingest txt/md/docx/epub/fb2(/zip) into staging sources + chunks")
    sp.add_argument("--path", required=True)
    sp.add_argument("--locale", default="ru-RU")
    sp.add_argument("--chunk-size", dest="chunk_size", type=int, default=6000)
    sp.add_argument("--force", action="store_true")
    sp.add_argument("--dry-run", action="store_true")
    sp.add_argument("--json", action="store_true")
    sp.add_argument("--compact", action="store_true")
    sp.set_defaults(func=cmd_ingest)

    sp = sub.add_parser("pipeline", help="one-shot pipeline: init->ingest->atomize --auto-rate->validate release->build")
    sp.add_argument("--path", required=True, help="file or directory with new source texts")
    sp.add_argument("--locale", default="ru-RU")
    sp.add_argument("--chunk-size", dest="chunk_size", type=int, default=6000)
    sp.add_argument("--force", action="store_true", help="re-import even if same sha exists")

    # atomize
    sp.add_argument("--mode", default="b", help="atomize mode (default=b)")
    sp.add_argument("--topic-gate", dest="topic_gate", default="ru_natal_v1")
    sp.add_argument("--topic-threshold", dest="topic_threshold", type=int, default=3)

    # auto-rate normalize thresholds
    sp.add_argument("--reject-below", dest="reject_below", type=int, default=45)
    sp.add_argument("--review-below", dest="review_below", type=int, default=55)
    sp.add_argument("--state-rejected", dest="state_rejected", default="archived")

    # validate release
    sp.add_argument("--baseline", default="kb_baseline.json")
    sp.add_argument("--write-baseline", action="store_true")
    sp.add_argument("--fail-on-warn", action="store_true")
    sp.add_argument("--min-enabled-score", dest="min_enabled_score", type=int, default=55)
    sp.add_argument("--required-topics", dest="required_topics", default="")
    sp.add_argument("--min-per-topic", dest="min_per_topic", type=int, default=3)

    # build
    sp.add_argument("--dry-run-build", action="store_true")

    # pipeline controls
    sp.add_argument("--no-init", action="store_true")
    sp.add_argument("--skip-ingest", action="store_true")
    sp.add_argument("--skip-atomize", action="store_true")
    sp.add_argument("--skip-validate", action="store_true")
    sp.add_argument("--skip-build", action="store_true")

    sp.add_argument("--json", action="store_true")
    sp.add_argument("--compact", action="store_true")
    sp.set_defaults(func=cmd_pipeline)


    sp = sub.add_parser("atomize", help="create candidate kb_fragments from ingested chunks")
    sp.add_argument("--skip-garbled", action="store_true", help="skip chunks that look garbled")
    sp.add_argument("--garble-threshold", type=float, default=0.20, help="garble threshold for skipping")
    sp.add_argument(
    "--dump-skipped",
    dest="dump_skipped",
    type=int,
    default=0,
    help="with --json: include up to N sanitation-skipped examples in report",
)
    sp.add_argument("--source-id", dest="source_id", type=int, default=0)
    sp.add_argument("--all", action="store_true")
    sp.add_argument("--mode", choices=["a", "b"], default="b")
    sp.add_argument(
        "--state",
        default="needs_review",
        choices=["draft", "needs_review", "reviewed", "annotated", "validated", "enabled", "archived"],
    )
    sp.add_argument("--locale", default="")
    sp.add_argument("--topic", default="book")
    sp.add_argument("--tone", default="neutral", choices=["supportive", "neutral", "warning"])
    sp.add_argument("--abstraction", default="psychological", choices=["psychological", "symbolic", "behavioral"])
    sp.add_argument("--min-len", dest="min_len", type=int, default=120)
    sp.add_argument("--max-len", dest="max_len", type=int, default=1800)
    sp.add_argument("--target-min", dest="target_min", type=int, default=450)
    sp.add_argument("--target-max", dest="target_max", type=int, default=900)
    sp.add_argument("--max-newlines", dest="max_newlines", type=int, default=6)
    sp.add_argument("--limit", type=int, default=0)
    sp.add_argument("--dry-run", action="store_true")
    sp.add_argument("--json", action="store_true")
    sp.add_argument("--compact", action="store_true")
    sp.add_argument(
        "--topic-gate",
        default="ru_natal_v1",
        help="topic gate profile: ru_natal_v1 | off",
    )
    sp.add_argument(
        "--topic-threshold",
        type=int,
        default=3,
        help="topic gate threshold (default=3)",
    )
    sp.add_argument(
        "--include-topics",
        default="",
        help="comma-separated subset of topics (e.g. aspects,houses_rulers). empty = all",
    )
    sp.add_argument(
        "--dump-topic-rejected",
        type=int,
        default=0,
        help="include N examples rejected by topic gate in JSON report",
    )
    sp.add_argument(
    "--upsert-existing",
    action="store_true",
    help="update existing fragments meta_json (topics/gate) if state is draft/needs_review; do not change state",
    )
    sp.add_argument(
        "--min-sent-letters",
        dest="min_sent_letters",
        type=int,
        default=40,
        help="sanitation: minimum letters in at least one finished sentence (default=40)",
    )
    sp.add_argument(
        "--auto-rate",
        dest="auto_rate",
        action="store_true",
        help="after atomize: run fragments re-rate --normalize-3 + fragments stats --by-quality",
    )
    sp.add_argument(
        "--auto-normalize-3",
        dest="auto_normalize_3",
        action="store_true",
        default=True,
        help="auto-rate: normalize state into enabled/needs_review/archived",
    )
    sp.add_argument(
        "--auto-reject-below",
        dest="auto_reject_below",
        type=int,
        default=45,
        help="auto-rate: score < N => rejected state (default=45)",
    )
    sp.add_argument(
        "--auto-review-below",
        dest="auto_review_below",
        type=int,
        default=55,
        help="auto-rate: score < N => needs_review (default=55)",
    )
    sp.add_argument(
        "--auto-state-rejected",
        dest="auto_state_rejected",
        default="archived",
        help="auto-rate: state to use for rejected (default=archived, because CHECK constraint forbids rejected)",
    )

    sp.set_defaults(func=cmd_atomize)

    sp = sub.add_parser("sources", help="sources helpers")
    sub2 = sp.add_subparsers(dest="sources_cmd", required=True)
    sp2 = sub2.add_parser("list", help="list ingested sources")
    spx = sub2.add_parser("diagnose", help="diagnose text garbling for a source (chunks)")
    spx.add_argument("--source-id", type=int, required=True)
    spx.add_argument("--threshold", type=float, default=0.01)
    spx.add_argument("--top", type=int, default=10)
    spx.add_argument("--json", action="store_true")
    spx.add_argument("--compact", action="store_true")
    spx.set_defaults(func=cmd_sources_diagnose)
    sp2.add_argument("--q", default="")
    sp2.add_argument("--limit", type=int, default=200)
    sp2.add_argument("--json", action="store_true")
    sp2.add_argument("--compact", action="store_true")
    sp2.set_defaults(func=cmd_sources_list)

    sp = sub.add_parser("fragments", help="fragments helpers (alias around 'list' for staging)")
    sub3 = sp.add_subparsers(dest="fragments_cmd", required=True)
    sp3 = sub3.add_parser("list", help="list staging fragments (supports --source-id)")
    sp3.add_argument("--state", default="")
    sp3.add_argument("--source-id", type=int, default=0)
    sp3.add_argument("--needs-rewrite-only", dest="needs_rewrite_only", action="store_true")
    sp3.add_argument("--bot-ready-only", dest="bot_ready_only", action="store_true")
    sp3.add_argument("--topic", default="")
    sp3.add_argument("--locale", default="")
    sp3.add_argument("--key", default="")
    sp3.add_argument("--q", default="")
    sp3.add_argument("--limit", type=int, default=50)
    sp3.add_argument("--min-score", dest="min_score", type=int, default=None)
    sp3.add_argument("--max-score", dest="max_score", type=int, default=None)
    sp3.add_argument(
        "--order",
        default="id",
        choices=["id", "quality_score"],
        help="sort by id or quality_score (default=id)",
    )
    sp3.add_argument("--asc", action="store_true", help="ascending order (default desc)")
    sp3.add_argument(
        "--show-reasons",
        action="store_true",
        help="print top quality reasons for each fragment (from quality_reasons_json)",
    )
    sp3.add_argument(
        "--reasons-top",
        type=int,
        default=5,
        help="how many reasons to print per fragment (default=5)",
    )
    sp3.add_argument(
        "--show-text",
        type=int,
        default=0,
        help="print fragment text truncated to N chars (default=0 = off)",
    )
    sp3.add_argument(
        "--with-meta",
        action="store_true",
        help="print meta_json preview (topic gate / diagnostics) under each fragment",
    )
    sp3.add_argument(
        "--meta-max",
        type=int,
        default=220,
        help="max chars for meta preview (default=220)",
    )

    sp3.set_defaults(func=cmd_fragments_list)
    sp_show = sub3.add_parser("show", help="show one staging fragment by id")
    sp_show.add_argument("--id", type=int, required=True)
    sp_show.add_argument("--with-meta", action="store_true")
    sp_show.add_argument("--show-reasons", action="store_true")
    sp_show.add_argument("--reasons-top", type=int, default=10)
    sp_show.add_argument(
        "--show-text",
        type=int,
        default=0,
        help="0 = print full text; N > 0 = truncate to N chars",
    )
    sp_show.set_defaults(func=cmd_fragments_show)

    sp4 = sub3.add_parser("sample", help="print sample fragments for review")
    sp4.add_argument("--source-id", type=int, required=True)
    sp4.add_argument("--state", default="")
    sp4.add_argument("--limit", type=int, default=20)
    sp4.add_argument("--with-text", action="store_true")
    sp4.add_argument("--needs-rewrite-only", dest="needs_rewrite_only", action="store_true")
    sp4.add_argument("--bot-ready-only", dest="bot_ready_only", action="store_true")
    sp4.add_argument("--json", action="store_true")
    sp4.add_argument("--compact", action="store_true")
    sp4.set_defaults(func=cmd_fragments_sample)

    sp5 = sub3.add_parser("stats", help="stats for fragments (optionally by source/state/quality)")
    sp5.add_argument("--source-id", type=int, default=0, help="optional; 0 => all sources")
    sp5.add_argument("--state", default="", help="optional state filter")
    sp5.add_argument("--by-quality", action="store_true", help="quality A/B/C/D/F + top reasons + label_by_state")
    sp5.add_argument("--json", action="store_true")
    sp5.add_argument("--compact", action="store_true")
    sp5.set_defaults(func=cmd_fragments_stats)



    sp6 = sub3.add_parser("promote", help="bulk move fragments between states (e.g., needs_review -> reviewed)")
    sp6.add_argument("--source-id", type=int, required=True)
    sp6.add_argument("--from", dest="from_state", default="needs_review")
    sp6.add_argument("--to", dest="to_state", default="reviewed")
    sp6.add_argument("--only-bot-ready", dest="only_bot_ready", action="store_true")
    sp6.add_argument("--only-needs-rewrite", dest="only_needs_rewrite", action="store_true")
    sp6.add_argument("--limit", type=int, default=0)
    sp6.add_argument("--who", default="KB")
    sp6.add_argument("--note", default="promote")
    sp6.add_argument("--dry-run", action="store_true")
    sp6.add_argument("--json", action="store_true")
    sp6.add_argument("--compact", action="store_true")
    sp6.set_defaults(func=cmd_fragments_promote)

    sp7 = sub3.add_parser("export", help="export fragments to JSONL for bulk editing")
    sp7.add_argument("--source-id", type=int, required=True)
    sp7.add_argument("--state", default="")
    sp7.add_argument("--q", default="")
    sp7.add_argument("--needs-rewrite-only", dest="needs_rewrite_only", action="store_true")
    sp7.add_argument("--bot-ready-only", dest="bot_ready_only", action="store_true")
    sp7.add_argument("--limit", type=int, default=0)
    sp7.add_argument("--out", default="", help="write to file (UTF-8). If omitted, writes to stdout")
    sp7.add_argument("--include-meta", dest="include_meta", action="store_true", default=True)
    sp7.add_argument("--no-meta", dest="include_meta", action="store_false")
    sp7.add_argument("--include-text", dest="include_text", action="store_true", default=True)
    sp7.add_argument("--no-text", dest="include_text", action="store_false")
    sp7.set_defaults(func=cmd_fragments_export)

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

    sp9 = sub3.add_parser("re-rate", help="recompute RU quality rating for existing staging fragments")
    mx = sp9.add_mutually_exclusive_group(required=True)
    mx.add_argument("--all", action="store_true", help="re-rate all staging fragments")
    mx.add_argument("--source-id", type=int, help="re-rate fragments of a specific source")
    sp9.add_argument("--state", default="", help="optional state filter (e.g. enabled/needs_review)")
    sp9.add_argument("--limit", type=int, default=0)
    sp9.add_argument("--dry-run", action="store_true")
    sp9.add_argument("--json", action="store_true")
    sp9.add_argument("--compact", action="store_true")
    sp9.add_argument("--below", type=int, default=0, help="if >0: mark fragments with score < below")
    sp9.add_argument("--set-state", default="", help="state to set for score < --below (e.g. needs_review)")
    sp9.add_argument("--only-if-state", default="", help="only update state if current state matches (e.g. enabled)")
    sp9.add_argument("--commit-batch", type=int, default=500)
    sp9.add_argument("--above", type=int, default=0, help="if >0: apply --set-state-above for score >= above")
    sp9.add_argument("--set-state-above", default="", help="state to set for score >= --above (e.g. enabled)")
    sp9.add_argument(
        "--normalize-3",
        action="store_true",
        help="apply 3-tier state normalization based on quality_score",
    )
    sp9.add_argument("--reject-below", type=int, default=45, help="score < reject_below => rejected")
    sp9.add_argument("--review-below", type=int, default=55, help="reject_below <= score < review_below => needs_review")
    sp9.add_argument("--state-rejected", default="archived")
    sp9.add_argument("--state-review", default="needs_review")
    sp9.add_argument("--state-enabled", default="enabled")
    sp9.set_defaults(func=cmd_fragments_rerate)

    return p


def main(argv: Optional[list[str]] = None) -> int:
    parser = build_parser()
    args = parser.parse_args(argv)
    return int(args.func(args) or 0)


if __name__ == "__main__":
    raise SystemExit(main())
