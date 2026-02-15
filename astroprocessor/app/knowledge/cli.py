# app/knowledge/cli.py
from __future__ import annotations

import argparse
import hashlib
import json
import sqlite3
from datetime import datetime, timezone
from pathlib import Path
from typing import Any, Optional


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

        print(f"✅ state: key={key} locale={locale} {from_state} -> {to_state}")
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

    text_ = str(_g("text") or "")
    if not text_.strip():
        errs.append("text is empty")
    elif len(text_.strip()) < 20:
        errs.append("text too short (<20 chars)")

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
        locale = (args.locale or "ru-RU").strip()
        state = (args.state or "draft").strip()

        params: dict[str, Any] = {"loc": locale}
        where = ["locale = :loc"]

        if key:
            where.append("key = :key")
            params["key"] = key
        if state:
            where.append("state = :state")
            params["state"] = state

        rows = conn.execute(
            f"""
            SELECT id, key, locale, topic_category, text, tone, abstraction_level, state,
                   factors_json, meta_json
            FROM kb_fragments
            WHERE {" AND ".join(where)}
            ORDER BY id ASC
            LIMIT :limit
            """.strip(),
            {**params, "limit": int(args.limit or 1000)},
        ).fetchall()

        if not rows:
            print("ℹ️ nothing to validate")
            return 0

        ok_ids: list[int] = []
        bad: list[tuple[str, list[str]]] = []

        for r in rows:
            errs = _validate_fragment_row(r)
            if errs:
                bad.append((str(r["key"]), errs))
            else:
                ok_ids.append(int(r["id"]))

        if bad:
            print("❌ validation failed:")
            for k, errs in bad:
                print(f"  - {k}: " + "; ".join(errs))
            if getattr(args, "strict", False) and ok_ids:
                print("ℹ️ strict mode: not applying any state changes")
                return 2

        updated = 0
        now = _utcnow_iso()
        who = (args.who or "KB").strip()
        note = (args.note or "validated").strip()

        for fid in ok_ids:
            row = conn.execute("SELECT state FROM kb_fragments WHERE id=?", (fid,)).fetchone()
            if not row:
                continue
            from_state = str(row["state"] or "").strip()
            if from_state in {"validated", "enabled", "archived"}:
                continue

            cur = conn.execute(
                "UPDATE kb_fragments SET state='validated', updated_at=? WHERE id=?",
                (now, fid),
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
        print(f"✅ validate ok: checked={len(rows)} ok={len(ok_ids)} updated={updated} bad={len(bad)}")
        return 0 if not bad else 1
    finally:
        conn.close()


def cmd_build(args: argparse.Namespace) -> int:
    staging = _connect(_staging_db_path())
    prod = _connect(_prod_db_path())
    try:
        _ensure_staging_schema(staging)
        _ensure_prod_schema(prod)

        rows = staging.execute(
            """
            SELECT id, key, locale, topic_category, text, tone, abstraction_level, source_id, author, created_at
            FROM kb_fragments
            WHERE state='enabled'
            ORDER BY id ASC
            """.strip()
        ).fetchall()

        enabled = len(rows)
        inserted = 0
        updated = 0

        for r in rows:
            key = str(r["key"])
            locale = str(r["locale"])
            topic = str(r["topic_category"])
            text_ = str(r["text"] or "")
            created_at = str(r["created_at"] or _utcnow_iso())

            meta = {
                "tone": str(r["tone"]),
                "abstraction_level": str(r["abstraction_level"]),
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
                continue

            prod.execute(
                """
                INSERT INTO knowledge_items(key, topic_category, locale, text, priority, created_at, is_active, meta_json)
                VALUES(?,?,?,?,?,?,?,?)
                """.strip(),
                (key, topic, locale, text_, 200, created_at, 1, meta_json),
            )
            inserted += 1

        prod.execute("CREATE TABLE IF NOT EXISTS kb_meta (key TEXT PRIMARY KEY, value TEXT NOT NULL)")
        prod.execute(
            "INSERT OR REPLACE INTO kb_meta(key,value) VALUES(?,?)",
            ("updated_at", datetime.now().replace(microsecond=0).isoformat(timespec="seconds")),
        )
        prod.execute("INSERT OR REPLACE INTO kb_meta(key,value) VALUES(?,?)", ("enabled", str(enabled)))

        prod.commit()
        print(f"✅ build ok: enabled={enabled} inserted={inserted} updated={updated}\n   prod: {_prod_db_path()}")
        return 0
    finally:
        staging.close()
        prod.close()


def cmd_list(args: argparse.Namespace) -> int:
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


# ----------------------------
# Argparse
# ----------------------------

def build_parser() -> argparse.ArgumentParser:
    p = argparse.ArgumentParser(prog="kb")
    sub = p.add_subparsers(dest="cmd", required=True)

    sp = sub.add_parser("init", help="init staging.db schema")
    sp.set_defaults(func=cmd_init)

    sp = sub.add_parser("build", help="build production knowledge.db from enabled staging fragments")
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
    p_val.add_argument("--locale", default="ru-RU")
    p_val.add_argument("--state", default="draft", help="which state to validate (default: draft)")
    p_val.add_argument("--limit", type=int, default=1000)
    p_val.add_argument("--who", default="KB")
    p_val.add_argument("--note", default="validated")
    p_val.add_argument("--strict", action="store_true", help="if any errors, do not update states")
    p_val.set_defaults(func=cmd_validate)

    sp = sub.add_parser("list", help="list fragments in staging (default) or items in production (--prod)")
    sp.add_argument("--prod", action="store_true", help="list from production knowledge.db (knowledge_items)")
    sp.add_argument("--active", action="store_true", help="(prod) only active items")
    sp.add_argument("--inactive", action="store_true", help="(prod) only inactive items")
    sp.add_argument("--with-text", action="store_true", help="(prod) print text preview lines")
    sp.add_argument("--state", default="", help="(staging) filter by state")
    sp.add_argument("--topic", default="")
    sp.add_argument("--locale", default="")
    sp.add_argument("--q", default="", help="search in key/text (LIKE)")
    sp.add_argument("--limit", type=int, default=50)
    sp.set_defaults(func=cmd_list)

    return p


def main(argv: Optional[list[str]] = None) -> int:
    parser = build_parser()
    args = parser.parse_args(argv)
    return int(args.func(args) or 0)


if __name__ == "__main__":
    raise SystemExit(main())
