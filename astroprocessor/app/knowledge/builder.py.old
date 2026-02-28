# astroprocessor/app/knowledge/builder.py
from __future__ import annotations

import argparse
import hashlib
import json
import re
import shutil
import sqlite3
import time
import zipfile
import html
import xml.etree.ElementTree as ET
from html.parser import HTMLParser
from dataclasses import dataclass
from pathlib import Path
from typing import Any, Iterable, Optional
from datetime import datetime, timezone
from app.knowledge.sql import sql_norm

def _utc_iso() -> str:
    return datetime.now(timezone.utc).replace(microsecond=0).isoformat().replace("+00:00", "Z")

class _HTMLText(HTMLParser):
    def __init__(self) -> None:
        super().__init__()
        self._chunks: list[str] = []

    def handle_data(self, data: str) -> None:
        if data:
            self._chunks.append(data)

    def text(self) -> str:
        return " ".join(" ".join(self._chunks).split())


def _table_columns(conn: sqlite3.Connection, table: str) -> set[str]:
    rows = conn.execute(f"PRAGMA table_info({table})").fetchall()
    # row: (cid, name, type, notnull, dflt_value, pk)
    return {str(r[1]) for r in rows}


def _html_to_text(s: str) -> str:
    p = _HTMLText()
    p.feed(s)
    return html.unescape(p.text())


def _read_fb2_to_text(path: Path) -> str:
    raw = path.read_text(encoding="utf-8", errors="replace")
    root = ET.fromstring(raw)

    texts: list[str] = []
    for elem in root.iter():
        tag = elem.tag
        if "binary" in tag:
            continue
        if elem.text and elem.text.strip():
            texts.append(elem.text.strip())
    return "\n".join(texts)


def _read_epub_to_text(path: Path) -> str:
    texts: list[str] = []
    with zipfile.ZipFile(path, "r") as z:
        html_names = sorted(
            [n for n in z.namelist() if n.lower().endswith((".xhtml", ".html", ".htm"))]
        )
        for name in html_names:
            try:
                b = z.read(name)
            except Exception:
                continue
            s = b.decode("utf-8", errors="replace")
            t = _html_to_text(s)
            if t.strip():
                texts.append(t.strip())
    return "\n\n".join(texts)


def _read_rtf_to_text(path: Path) -> str:
    s = path.read_text(encoding="utf-8", errors="replace")

    s = re.sub(r"\\'[0-9a-fA-F]{2}", " ", s)
    s = s.replace("\\par", "\n")
    s = re.sub(r"\\[a-zA-Z]+\d* ?", " ", s)
    s = s.replace("{", " ").replace("}", " ")
    s = re.sub(r"[ \t]+", " ", s)
    s = re.sub(r"\n\s+\n", "\n\n", s)
    return s.strip()


# ============================================================
# Paths (CWD-independent)
# ============================================================

def _astro_root() -> Path:
    """
    Absolute path to astroprocessor/ directory (project root inside repo),
    independent of process CWD.
    """
    return Path(__file__).resolve().parents[2]


def _data_dir() -> Path:
    return _astro_root() / "data"


def _docs_dir() -> Path:
    return _astro_root() / "knowledge" / "docs"


def _sources_dir() -> Path:
    return _data_dir() / "knowledge_sources"


def _inbox_dir() -> Path:
    return _sources_dir() / "inbox"


def _processed_inbox_dir() -> Path:
    return _sources_dir() / "processed" / "inbox"


def _failed_inbox_dir() -> Path:
    return _sources_dir() / "failed" / "inbox"


def _manifest_path() -> Path:
    return _docs_dir() / "_import_manifest.json"


def _knowledge_db_path() -> Path:
    """
    Use settings.knowledge_db_path if available; else fall back to astroprocessor/data/knowledge.db.
    """
    try:
        from app.settings import settings  # type: ignore
        p = Path(str(settings.knowledge_db_path))
        if not p.is_absolute():
            p = _astro_root() / p
        return p
    except Exception:
        return _data_dir() / "knowledge.db"


# ============================================================
# EV1 keys resolving
# ============================================================

def resolve_ev1_keys_file(keys_file: Optional[str]) -> tuple[Path, bool]:
    root = _astro_root()

    candidates: list[Path] = []
    if keys_file and keys_file.strip():
        p = Path(keys_file.strip())
        candidates.append(p if p.is_absolute() else (root / p))
    else:
        candidates.extend(
            [
                root / "tools" / "knowledge" / "seed_keys_core_v1.txt",
                root / "ev1_keys_unique.txt",
                root / "data" / "ev1_keys_unique.txt",
                root.parent / "ev1_keys_unique.txt",
            ]
        )

    for c in candidates:
        if c.exists() and c.is_file():
            return c, True

    return candidates[0], False


def load_keys_txt(path: Path) -> list[str]:
    text = path.read_text(encoding="utf-8", errors="replace")
    keys: list[str] = []
    for line in text.splitlines():
        s = line.strip()
        if not s or s.startswith("#"):
            continue
        keys.append(s)

    seen: set[str] = set()
    out: list[str] = []
    for k in keys:
        if k in seen:
            continue
        seen.add(k)
        out.append(k)
    return out


# ============================================================
# SQLite schema (minimal, idempotent)
# ============================================================

# NOTE:
# У тебя в исходнике было ДВА определения ensure_schema_items и одно из них содержало
# вложенное (по отступам) ensure_schema_meta. Это легко приводит к ситуации, когда
# ensure_schema_items_and_meta “как бы есть”, но в рантайме его нет/не то.
#
# Я оставляю один “канонический” ensure_schema_items (самый расширяемый),
# а старый — сохраняю как алиас-совместимость.

def ensure_schema_meta(conn: sqlite3.Connection) -> None:
    """
    Ensure kb_meta table exists.
    Used by admin UI to store build/coverage markers.
    """
    conn.execute(
        """
        CREATE TABLE IF NOT EXISTS kb_meta (
            key TEXT PRIMARY KEY,
            value TEXT NOT NULL
        )
        """.strip()
    )


def ensure_schema_docs_chunks(conn: sqlite3.Connection) -> None:
    """
    Minimal schema for docs/chunks + FTS5.
    """
    conn.execute(
        """
        CREATE TABLE IF NOT EXISTS knowledge_docs (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            doc_id TEXT NOT NULL UNIQUE,
            source_path TEXT,
            title TEXT,
            created_at INTEGER,
            updated_at INTEGER,
            sha256 TEXT
        )
        """.strip()
    )

    conn.execute(
        """
        CREATE TABLE IF NOT EXISTS knowledge_chunks (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            doc_id TEXT NOT NULL,
            chunk_index INTEGER NOT NULL,
            chunk_text TEXT NOT NULL,
            created_at INTEGER,
            FOREIGN KEY(doc_id) REFERENCES knowledge_docs(doc_id)
        )
        """.strip()
    )

    conn.execute(
        """
        CREATE VIRTUAL TABLE IF NOT EXISTS knowledge_chunks_fts
        USING fts5(doc_id, chunk_index, chunk_text)
        """.strip()
    )


def ensure_schema_items(conn: sqlite3.Connection) -> None:
    """
    knowledge_items schema used by UI/seed/coverage.

    IMPORTANT:
    - Non-destructive: CREATE IF NOT EXISTS + ADD COLUMN if missing.
    """
    conn.execute(
        """
        CREATE TABLE IF NOT EXISTS knowledge_items (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            key TEXT NOT NULL,
            locale TEXT NOT NULL,
            topic_category TEXT,
            text TEXT,
            priority INTEGER NOT NULL DEFAULT 0,
            is_active INTEGER NOT NULL DEFAULT 1,
            meta_json TEXT,
            created_at INTEGER,
            updated_at INTEGER
        )
        """.strip()
    )

    cols = _table_columns(conn, "knowledge_items")

    def _add(col: str, ddl: str) -> None:
        conn.execute(f"ALTER TABLE knowledge_items ADD COLUMN {col} {ddl}")

    if "text" not in cols:
        _add("text", "TEXT")
    if "priority" not in cols:
        _add("priority", "INTEGER NOT NULL DEFAULT 0")
    if "is_active" not in cols:
        _add("is_active", "INTEGER NOT NULL DEFAULT 1")
    if "meta_json" not in cols:
        _add("meta_json", "TEXT")
    if "created_at" not in cols:
        _add("created_at", "INTEGER")
    if "updated_at" not in cols:
        _add("updated_at", "INTEGER")

    conn.execute(
        """
        CREATE UNIQUE INDEX IF NOT EXISTS ux_knowledge_items_key_locale_topic
        ON knowledge_items(key, locale, topic_category)
        """.strip()
    )
    conn.execute(
        """
        CREATE INDEX IF NOT EXISTS ix_knowledge_items_active_key
        ON knowledge_items(is_active, key)
        """.strip()
    )
    conn.execute(
        """
        CREATE INDEX IF NOT EXISTS ix_knowledge_items_active_locale_topic
        ON knowledge_items(is_active, locale, topic_category)
        """.strip()
    )


# --- compatibility alias (твое старое определение было короче) ---
def ensure_schema_items_minimal(conn: sqlite3.Connection) -> None:
    """
    Legacy minimal schema (kept for compatibility; not used by default).
    """
    ensure_schema_items(conn)


def ensure_schema_items_and_meta(conn: sqlite3.Connection) -> None:
    """
    Backward-compatible helper expected by admin UI.

    Safe to call multiple times.
    Creates/updates:
      - knowledge_items
      - kb_meta
    """
    ensure_schema_items(conn)
    ensure_schema_meta(conn)


def _set_meta(conn: sqlite3.Connection, key: str, value: str) -> None:
    ensure_schema_meta(conn)
    conn.execute(
        """
        INSERT INTO kb_meta(key, value)
        VALUES(?, ?)
        ON CONFLICT(key) DO UPDATE SET value=excluded.value
        """.strip(),
        (str(key), str(value)),
    )


# ============================================================
# EV1 coverage / breakdown / issues (with robust normalization)
# ============================================================

def _sql_in_placeholders(n: int) -> str:
    return ",".join(["?"] * n)

@dataclass(frozen=True)
class BuildResult:
    enabled: int
    inserted: int
    updated: int

@dataclass(frozen=True)
class Ev1Coverage:
    total: int
    present_active: int
    missing: int
    missing_keys: list[str]


@dataclass(frozen=True)
class Ev1BreakdownRow:
    locale: str
    topic_category: str
    total: int
    present_active: int
    missing: int


@dataclass(frozen=True)
class Ev1DataIssues:
    null_topic_category_count: int
    sample_keys: list[str]

def build_from_staging(
    *,
    staging_db: str | Path,
    prod_db: str | Path,
    priority_default: int = 200,
) -> BuildResult:
    staging_db = Path(staging_db)
    prod_db = Path(prod_db)

    if not staging_db.exists():
        raise FileNotFoundError(f"staging db not found: {staging_db}")

    # prod db должен существовать (или создаваться у тебя отдельно),
    # иначе schema knowledge_items не будет.
    if not prod_db.exists():
        raise FileNotFoundError(f"prod db not found: {prod_db}")

    sconn = sqlite3.connect(str(staging_db))
    sconn.row_factory = sqlite3.Row

    pconn = sqlite3.connect(str(prod_db))
    pconn.row_factory = sqlite3.Row

    try:
        rows = sconn.execute(
            """
            SELECT
              id, key, locale, topic_category, text, tone, abstraction_level,
              source_id, author
            FROM kb_fragments
            WHERE state = 'enabled'
            ORDER BY id
            """
        ).fetchall()

        enabled = len(rows)
        inserted = 0
        updated = 0
        now = _utc_iso()

        # В prod ожидаем UNIQUE(key, locale) — как у тебя в kb_fragments.
        # Если у тебя в knowledge_items UNIQUE иначе — скажи, подстрою upsert.
        for r in rows:
            meta = {
                "tone": r["tone"],
                "abstraction_level": r["abstraction_level"],
                "kb_fragment_id": int(r["id"]),
                "source_id": r["source_id"],
                "author": r["author"] or "KB",
            }

            # Проверим, есть ли уже item
            existing = pconn.execute(
                "SELECT id FROM knowledge_items WHERE key=? AND locale=?",
                (r["key"], r["locale"]),
            ).fetchone()

            if existing:
                pconn.execute(
                    """
                    UPDATE knowledge_items
                    SET topic_category=?,
                        text=?,
                        priority=COALESCE(priority, ?),
                        is_active=1,
                        meta_json=?
                    WHERE key=? AND locale=?
                    """,
                    (
                        r["topic_category"],
                        r["text"],
                        int(priority_default),
                        json.dumps(meta, ensure_ascii=False),
                        r["key"],
                        r["locale"],
                    ),
                )
                updated += 1
            else:
                pconn.execute(
                    """
                    INSERT INTO knowledge_items
                      (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
                    VALUES
                      (?,   ?,            ?,     ?,    ?,        ?,          1,        ?)
                    """,
                    (
                        r["key"],
                        r["topic_category"],
                        r["locale"],
                        r["text"],
                        int(priority_default),
                        now,
                        json.dumps(meta, ensure_ascii=False),
                    ),
                )
                inserted += 1

        pconn.commit()
        return BuildResult(enabled=enabled, inserted=inserted, updated=updated)

    finally:
        try:
            sconn.close()
        finally:
            pconn.close()

def coverage_ev1(
    conn: sqlite3.Connection,
    keys: list[str],
    locale: Optional[str] = None,
    topic_category: Optional[str] = None,
    *,
    top_missing: int = 50,
) -> Ev1Coverage:
    if not keys:
        return Ev1Coverage(total=0, present_active=0, missing=0, missing_keys=[])

    where = ["is_active = 1", f"key IN ({_sql_in_placeholders(len(keys))})"]
    params: list[object] = list(keys)

    if locale:
        where.append(f"{sql_norm('locale')} = ?")
        params.append(locale.strip())

    if topic_category:
        where.append(f"{sql_norm('topic_category')} = ?")
        params.append(topic_category.strip())

    sql = f"""
        SELECT DISTINCT key
        FROM knowledge_items
        WHERE {" AND ".join(where)}
    """.strip()

    present = {row[0] for row in conn.execute(sql, params).fetchall()}
    missing_keys = [k for k in keys if k not in present]
    if top_missing > 0:
        missing_keys = missing_keys[:top_missing]

    total = len(keys)
    present_active = len(present)
    return Ev1Coverage(total=total, present_active=present_active, missing=total - present_active, missing_keys=missing_keys)


def coverage_breakdown_ev1(conn: sqlite3.Connection, keys: list[str]) -> list[Ev1BreakdownRow]:
    if not keys:
        return []

    sql = f"""
        SELECT
            {sql_norm('locale')} AS locale_n,
            {sql_norm('topic_category')} AS topic_n,
            COUNT(DISTINCT key) AS present_active
        FROM knowledge_items
        WHERE is_active = 1
          AND key IN ({_sql_in_placeholders(len(keys))})
        GROUP BY locale_n, topic_n
        ORDER BY present_active DESC, locale_n, topic_n
    """.strip()

    rows = conn.execute(sql, list(keys)).fetchall()
    total = len(keys)

    out: list[Ev1BreakdownRow] = []
    for locale_n, topic_n, present_active in rows:
        present_i = int(present_active)
        out.append(
            Ev1BreakdownRow(
                locale=str(locale_n or ""),
                topic_category=str(topic_n or ""),
                total=total,
                present_active=present_i,
                missing=total - present_i,
            )
        )
    return out


def ev1_data_issues(conn: sqlite3.Connection, keys: list[str], *, locale: str = "ru-RU", sample_limit: int = 20) -> Ev1DataIssues:
    if not keys:
        return Ev1DataIssues(null_topic_category_count=0, sample_keys=[])

    sql = f"""
        SELECT DISTINCT key
        FROM knowledge_items
        WHERE is_active = 1
          AND {sql_norm('locale')} = ?
          AND key IN ({_sql_in_placeholders(len(keys))})
          AND {sql_norm('topic_category')} = ''
        ORDER BY key
        LIMIT ?
    """.strip()
    params = [locale.strip(), *keys, sample_limit]
    sample_keys = [r[0] for r in conn.execute(sql, params).fetchall()]

    count_sql = f"""
        SELECT COUNT(DISTINCT key)
        FROM knowledge_items
        WHERE is_active = 1
          AND {sql_norm('locale')} = ?
          AND key IN ({_sql_in_placeholders(len(keys))})
          AND {sql_norm('topic_category')} = ''
    """.strip()
    count_params = [locale.strip(), *keys]
    null_count = int(conn.execute(count_sql, count_params).fetchone()[0])

    return Ev1DataIssues(null_topic_category_count=null_count, sample_keys=sample_keys)


def export_missing_txt(missing_keys: Iterable[str]) -> str:
    keys_list = list(missing_keys)
    return "\n".join(keys_list) + ("\n" if keys_list else "")


def export_missing_jsonl(
    missing_keys: Iterable[str],
    *,
    locale: Optional[str] = None,
    topic_category: Optional[str] = None,
    priority: int = 50,
    stub_text: str = "",
) -> str:
    import json as _json

    lines: list[str] = []
    for k in missing_keys:
        obj = {
            "key": k,
            "locale": locale or "",
            "topic_category": topic_category or "",
            "priority": int(priority),
            "text": stub_text,
        }
        lines.append(_json.dumps(obj, ensure_ascii=False))
    return "\n".join(lines) + ("\n" if lines else "")


# ============================================================
# Seed helpers
# ============================================================

def apply_seed_ignore_unique(conn: sqlite3.Connection, items: list[dict[str, object]]) -> tuple[int, int]:
    """
    Insert seed items into knowledge_items.
    If UNIQUE constraint fails (key+locale+topic_category) -> skip.

    Works with old DB schemas: inserts only columns that exist.
    """
    ensure_schema_items_and_meta(conn)

    cols = _table_columns(conn, "knowledge_items")
    now_i = int(time.time())

    inserted = 0
    skipped = 0

    for it in items:
        key = str(it.get("key", "") or "").strip()
        locale = str(it.get("locale", "") or "").strip()
        if not key or not locale:
            # key/locale are required by schema
            skipped += 1
            continue

        topic_category = it.get("topic_category", None)

        # normalize text/meta_json to non-null strings when column exists
        text_val = str(it.get("text", "") or "")
        meta_val = str(it.get("meta_json", "") or "")

        # IMPORTANT:
        # Use INSERT OR IGNORE to avoid raising IntegrityError on duplicates.
        # This makes behavior stable and avoids partial transactions.
        col_names: list[str] = ["key", "locale", "topic_category"]
        values: list[object] = [key, locale, topic_category]

        if "text" in cols:
            col_names.append("text")
            values.append(text_val)

        if "priority" in cols:
            col_names.append("priority")
            values.append(int(it.get("priority", 0) or 0))

        if "is_active" in cols:
            col_names.append("is_active")
            values.append(int(it.get("is_active", 1) or 0))

        if "meta_json" in cols:
            col_names.append("meta_json")
            values.append(meta_val)

        if "created_at" in cols:
            col_names.append("created_at")
            values.append(now_i)

        if "updated_at" in cols:
            col_names.append("updated_at")
            values.append(now_i)

        placeholders = ",".join(["?"] * len(col_names))
        sql = f"INSERT OR IGNORE INTO knowledge_items ({', '.join(col_names)}) VALUES ({placeholders})"
        cur = conn.execute(sql, tuple(values))

        if cur.rowcount and cur.rowcount > 0:
            inserted += 1
        else:
            skipped += 1

    return inserted, skipped


def _read_jsonl(path: Path) -> list[dict[str, Any]]:
    out: list[dict[str, Any]] = []
    for line in path.read_text(encoding="utf-8", errors="replace").splitlines():
        s = line.strip()
        if not s:
            continue
        out.append(json.loads(s))
    return out


def seed_default(conn: sqlite3.Connection, *, glob_pattern: str = "knowledge_items_*_ETALON.jsonl") -> tuple[int, int]:
    data_dir = _data_dir()
    files = sorted(data_dir.glob(glob_pattern))
    total_inserted = 0
    total_skipped = 0

    for f in files:
        items = _read_jsonl(f)
        ins, sk = apply_seed_ignore_unique(conn, items)
        total_inserted += ins
        total_skipped += sk

    return total_inserted, total_skipped


def make_ev1_seed_items(
    keys: list[str],
    *,
    locale: str,
    topic_category: str,
    priority: int,
    stub_text: str = "",
    is_active: int = 1,
) -> list[dict[str, Any]]:
    """
    NOTE:
    Я добавил is_active параметр (по умолчанию как у тебя было = 1),
    чтобы router/UI могли создавать EV1-stubs inactive при желании.
    """
    return [
        {
            "key": k,
            "locale": locale,
            "topic_category": topic_category,
            "priority": int(priority),
            "text": stub_text,
            "is_active": int(is_active),
        }
        for k in keys
    ]


def seed_ev1(
    conn: sqlite3.Connection,
    *,
    keys_file: Optional[str],
    locale: str,
    topic_category: str,
    priority: int,
    build_version: Optional[str] = None,
    knowledge_build_version: Optional[str] = None,
) -> dict[str, Any]:
    ensure_schema_items_and_meta(conn)

    keys_path, ok = resolve_ev1_keys_file(keys_file)
    if not ok:
        raise FileNotFoundError(f"keys_file пустой или не найден: {keys_path}")

    keys = load_keys_txt(keys_path)
    if not keys:
        raise ValueError(f"keys_file пустой: {keys_path}")

    items = make_ev1_seed_items(
        keys,
        locale=locale,
        topic_category=topic_category,
        priority=priority,
        stub_text="",
        is_active=1,
    )
    inserted, skipped = apply_seed_ignore_unique(conn, items)

    cov = coverage_ev1(conn, keys, locale=locale, topic_category=topic_category, top_missing=10_000)

    _set_meta(conn, "ev1_total", str(cov.total))
    _set_meta(conn, "ev1_present_active", str(cov.present_active))
    _set_meta(conn, "ev1_missing", str(cov.missing))
    _set_meta(conn, "updated_at", str(int(time.time())))

    if build_version:
        _set_meta(conn, "build_version", build_version)
    if knowledge_build_version:
        _set_meta(conn, "knowledge_build_version", knowledge_build_version)

    return {
        "inserted": inserted,
        "skipped": skipped,
        "coverage_total": cov.total,
        "coverage_present_active": cov.present_active,
        "coverage_missing": cov.missing,
        "keys_file_resolved": str(keys_path),
    }


# ============================================================
# Import books -> markdown docs (best-effort)
# ============================================================

def _sha256_bytes(data: bytes) -> str:
    h = hashlib.sha256()
    h.update(data)
    return h.hexdigest()


def _doc_id_from_file_bytes(data: bytes) -> str:
    return _sha256_bytes(data)[:16]


def _convert_to_markdown(src: Path) -> tuple[str, str]:
    ext = src.suffix.lower()
    title = src.stem

    if ext == ".md":
        return title, src.read_text(encoding="utf-8", errors="replace")
    if ext == ".txt":
        return title, src.read_text(encoding="utf-8", errors="replace")

    if ext == ".docx":
        try:
            import docx  # python-docx
            d = docx.Document(str(src))
            lines = [p.text for p in d.paragraphs if p.text.strip()]
            return title, "\n\n".join(lines) + "\n"
        except Exception as e:
            raise RuntimeError(f"docx conversion failed: {e}") from e

    if ext == ".pdf":
        try:
            from pypdf import PdfReader  # type: ignore
            reader = PdfReader(str(src))
            chunks: list[str] = []
            for page in reader.pages:
                txt = page.extract_text() or ""
                txt = txt.strip()
                if txt:
                    chunks.append(txt)
            return title, "\n\n".join(chunks) + "\n"
        except Exception as e:
            raise RuntimeError(f"pdf conversion failed (install pypdf): {e}") from e

    if ext == ".fb2":
        text = _read_fb2_to_text(src)
        md = f"# {title}\n\n{text}\n"
        return title, md

    if ext == ".epub":
        text = _read_epub_to_text(src)
        md = f"# {title}\n\n{text}\n"
        return title, md

    if ext == ".rtf":
        text = _read_rtf_to_text(src)
        md = f"# {title}\n\n{text}\n"
        return title, md

    raise RuntimeError(f"unsupported extension: {ext}")


def import_books(*, inbox_dir: Optional[str] = None) -> dict[str, Any]:
    src_dir = Path(inbox_dir) if inbox_dir else _inbox_dir()
    if not src_dir.is_absolute():
        src_dir = _astro_root() / src_dir

    docs_dir = _docs_dir()
    docs_dir.mkdir(parents=True, exist_ok=True)
    _processed_inbox_dir().mkdir(parents=True, exist_ok=True)
    _failed_inbox_dir().mkdir(parents=True, exist_ok=True)

    manifest: dict[str, Any] = {"entries": []}
    if _manifest_path().exists():
        try:
            manifest = json.loads(_manifest_path().read_text(encoding="utf-8", errors="replace"))
            if not isinstance(manifest, dict) or "entries" not in manifest:
                manifest = {"entries": []}
        except Exception:
            manifest = {"entries": []}

    imported = 0
    failed = 0

    for src in sorted(src_dir.glob("*")):
        if not src.is_file():
            continue

        entry: dict[str, Any] = {
            "filename": src.name,
            "src": str(src),
            "ts": int(time.time()),
            "status": "unknown",
        }

        try:
            data = src.read_bytes()
            doc_id = _doc_id_from_file_bytes(data)
            title, md = _convert_to_markdown(src)

            out_path = docs_dir / f"{doc_id}.md"
            out_path.write_text(md, encoding="utf-8")

            entry.update(
                {"status": "ok", "doc_id": doc_id, "title": title, "md_path": str(out_path)}
            )

            shutil.move(str(src), str(_processed_inbox_dir() / src.name))
            imported += 1

        except Exception as e:
            entry.update({"status": "failed", "error": f"{type(e).__name__}: {e}"})
            shutil.move(str(src), str(_failed_inbox_dir() / src.name))
            failed += 1

        manifest["entries"].append(entry)

    _manifest_path().write_text(json.dumps(manifest, ensure_ascii=False, indent=2), encoding="utf-8")

    return {"imported": imported, "failed": failed, "manifest": str(_manifest_path())}


# ============================================================
# Build chunks + FTS
# ============================================================

def _chunk_markdown(md: str, *, max_chars: int = 1200) -> list[str]:
    parts = [p.strip() for p in md.split("\n\n") if p.strip()]
    chunks: list[str] = []
    buf: list[str] = []
    size = 0

    for p in parts:
        if size + len(p) + 2 > max_chars and buf:
            chunks.append("\n\n".join(buf).strip())
            buf = [p]
            size = len(p)
        else:
            buf.append(p)
            size += len(p) + 2

    if buf:
        chunks.append("\n\n".join(buf).strip())

    return [c for c in chunks if c]


def build_chunks(conn: sqlite3.Connection) -> dict[str, Any]:
    ensure_schema_docs_chunks(conn)
    ensure_schema_meta(conn)

    docs_dir = _docs_dir()
    docs_dir.mkdir(parents=True, exist_ok=True)

    conn.execute("DELETE FROM knowledge_chunks_fts")
    conn.execute("DELETE FROM knowledge_chunks")
    conn.execute("DELETE FROM knowledge_docs")

    doc_count = 0
    chunk_count = 0
    now = int(time.time())

    for md_path in sorted(docs_dir.glob("*.md")):
        data = md_path.read_bytes()
        doc_id = md_path.stem
        sha = _sha256_bytes(data)

        conn.execute(
            """
            INSERT INTO knowledge_docs(doc_id, source_path, title, created_at, updated_at, sha256)
            VALUES(?, ?, ?, ?, ?, ?)
            """.strip(),
            (doc_id, str(md_path), md_path.name, now, now, sha),
        )

        md = data.decode("utf-8", errors="replace")
        chunks = _chunk_markdown(md)

        for i, ch in enumerate(chunks):
            conn.execute(
                """
                INSERT INTO knowledge_chunks(doc_id, chunk_index, chunk_text, created_at)
                VALUES(?, ?, ?, ?)
                """.strip(),
                (doc_id, i, ch, now),
            )
            conn.execute(
                """
                INSERT INTO knowledge_chunks_fts(doc_id, chunk_index, chunk_text)
                VALUES(?, ?, ?)
                """.strip(),
                (doc_id, i, ch),
            )
            chunk_count += 1

        doc_count += 1

    _set_meta(conn, "kb_docs", str(doc_count))
    _set_meta(conn, "kb_chunks", str(chunk_count))
    _set_meta(conn, "updated_at", str(now))

    return {"docs": doc_count, "chunks": chunk_count}


# ============================================================
# DB helpers
# ============================================================

def _connect_db() -> sqlite3.Connection:
    db_path = _knowledge_db_path()
    db_path.parent.mkdir(parents=True, exist_ok=True)
    conn = sqlite3.connect(str(db_path))
    conn.execute("PRAGMA journal_mode=WAL")
    conn.execute("PRAGMA synchronous=NORMAL")
    return conn


# ============================================================
# CLI
# ============================================================

def _cmd_import_books(args: argparse.Namespace) -> None:
    res = import_books(inbox_dir=args.inbox_dir)
    print(f"✅ import-books OK: imported={res['imported']} failed={res['failed']} manifest={res['manifest']}")


def _cmd_build_chunks(args: argparse.Namespace) -> None:
    conn = _connect_db()
    try:
        res = build_chunks(conn)
        conn.commit()
        print(f"✅ build-chunks OK: docs={res['docs']} chunks={res['chunks']}")
    finally:
        conn.close()


def _cmd_seed(args: argparse.Namespace) -> None:
    conn = _connect_db()
    try:
        ins, sk = seed_default(conn)
        conn.commit()
        print(f"✅ seed OK: inserted={ins} skipped={sk}")
    finally:
        conn.close()


def _cmd_seed_ev1(args: argparse.Namespace) -> None:
    conn = _connect_db()
    try:
        res = seed_ev1(
            conn,
            keys_file=args.keys_file,
            locale=args.locale,
            topic_category=args.topic_category,
            priority=args.priority,
            build_version=args.build_version,
            knowledge_build_version=args.knowledge_build_version,
        )
        conn.commit()
        print(
            "✅ EV1 Seed OK. "
            f"inserted={res['inserted']} skipped={res['skipped']}; "
            f"coverage={res['coverage_present_active']}/{res['coverage_total']} missing={res['coverage_missing']}; "
            f"keys_file={res['keys_file_resolved']}"
        )
    except Exception as e:
        conn.rollback()
        print(f"❌ EV1 Seed FAILED: {type(e).__name__}: {e}")
        raise
    finally:
        conn.close()


def _cmd_import_build(args: argparse.Namespace) -> None:
    res = import_books(inbox_dir=args.inbox_dir)
    print(f"✅ import-books OK: imported={res['imported']} failed={res['failed']}")

    conn = _connect_db()
    try:
        out = build_chunks(conn)
        conn.commit()
        print(f"✅ build-chunks OK: docs={out['docs']} chunks={out['chunks']}")
    finally:
        conn.close()


def build_arg_parser() -> argparse.ArgumentParser:
    p = argparse.ArgumentParser(prog="python -m app.knowledge.builder")
    sub = p.add_subparsers(dest="cmd", required=True)

    sp = sub.add_parser("import-books")
    sp.add_argument("--inbox-dir", default=str(_inbox_dir()))
    sp.set_defaults(func=_cmd_import_books)

    sp = sub.add_parser("build-chunks")
    sp.set_defaults(func=_cmd_build_chunks)

    sp = sub.add_parser("import-build")
    sp.add_argument("--inbox-dir", default=str(_inbox_dir()))
    sp.set_defaults(func=_cmd_import_build)

    sp = sub.add_parser("seed")
    sp.set_defaults(func=_cmd_seed)

    sp = sub.add_parser("seed-ev1")
    sp.add_argument("--keys-file", default=None)
    sp.add_argument("--locale", default="ru-RU")
    sp.add_argument("--topic-category", default="personality_core")
    sp.add_argument("--priority", type=int, default=200)
    sp.add_argument("--build-version", default=None)
    sp.add_argument("--knowledge-build-version", default=None)
    sp.set_defaults(func=_cmd_seed_ev1)

    return p


def main(argv: Optional[list[str]] = None) -> None:
    parser = build_arg_parser()
    args = parser.parse_args(argv)
    args.func(args)


if __name__ == "__main__":
    main()
