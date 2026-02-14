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
from app.knowledge.sql import sql_norm

class _HTMLText(HTMLParser):
    def __init__(self) -> None:
        super().__init__()
        self._chunks: list[str] = []

    def handle_data(self, data: str) -> None:
        if data:
            self._chunks.append(data)

    def text(self) -> str:
        return " ".join(" ".join(self._chunks).split())


def _html_to_text(s: str) -> str:
    p = _HTMLText()
    p.feed(s)
    return html.unescape(p.text())


def _read_fb2_to_text(path: Path) -> str:
    raw = path.read_text(encoding="utf-8", errors="replace")
    # fb2 may include namespaces; ElementTree needs care
    root = ET.fromstring(raw)

    # Extract <body> text; ignore binaries etc.
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
        # take xhtml/html files in a stable order
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
    # best-effort RTF -> text (simple)
    s = path.read_text(encoding="utf-8", errors="replace")

    # Remove rtf groups and control words crudely; keep plain text.
    # 1) drop escaped hex \'hh
    s = re.sub(r"\\'[0-9a-fA-F]{2}", " ", s)
    # 2) replace paragraph marks
    s = s.replace("\\par", "\n")
    # 3) remove control words like \b0, \fs20, \u1234?
    s = re.sub(r"\\[a-zA-Z]+\d* ?"," ", s)
    # 4) remove braces
    s = s.replace("{", " ").replace("}", " ")
    # 5) cleanup
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
    # builder.py is at: astroprocessor/app/knowledge/builder.py
    return Path(__file__).resolve().parents[2]


def _data_dir() -> Path:
    return _astro_root() / "data"


def _docs_dir() -> Path:
    # matches your structure: astroprocessor/knowledge/docs
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
    """
    Resolve EV1 keys file path deterministically from astroprocessor/.
    Returns (resolved_path, exists).
    """
    root = _astro_root()

    candidates: list[Path] = []
    if keys_file and keys_file.strip():
        p = Path(keys_file.strip())
        candidates.append(p if p.is_absolute() else (root / p))
    else:
        candidates.extend(
            [
                root / "tools" / "knowledge" / "seed_keys_core_v1.txt",
                root / "ev1_keys_unique.txt",          # repo root has this too, but we prefer astroprocessor root
                root / "data" / "ev1_keys_unique.txt",
                root.parent / "ev1_keys_unique.txt",   # repo root fallback
            ]
        )

    for c in candidates:
        if c.exists() and c.is_file():
            return c, True

    return candidates[0], False


def load_keys_txt(path: Path) -> list[str]:
    """
    Load keys from a txt file (one key per line). Ignores empty lines and comments.
    """
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

def ensure_schema_items(conn: sqlite3.Connection) -> None:
    """
    Minimal schema for knowledge_items used by UI, seed and coverage.
    Non-destructive: IF NOT EXISTS only.
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


def ensure_schema_meta(conn: sqlite3.Connection) -> None:
    """
    kb_meta for build info and EV1 metrics.
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

    # FTS5 virtual table (contentless is simplest)
    conn.execute(
        """
        CREATE VIRTUAL TABLE IF NOT EXISTS knowledge_chunks_fts
        USING fts5(doc_id, chunk_index, chunk_text)
        """.strip()
    )


def ensure_schema_items_and_meta(conn: sqlite3.Connection) -> None:
    """
    Backward-compatible entrypoint expected by UI seed.
    """
    ensure_schema_items(conn)
    ensure_schema_meta(conn)


def _set_meta(conn: sqlite3.Connection, key: str, value: str) -> None:
    conn.execute(
        """
        INSERT INTO kb_meta(key, value) VALUES(?, ?)
        ON CONFLICT(key) DO UPDATE SET value=excluded.value
        """.strip(),
        (key, value),
    )


# ============================================================
# EV1 coverage / breakdown / issues (with robust normalization)
# ============================================================

def _sql_in_placeholders(n: int) -> str:
    return ",".join(["?"] * n)


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
        where.append(f"{sql_norm('locale')} = ?")
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
    return Ev1Coverage(
        total=total,
        present_active=present_active,
        missing=total - present_active,
        missing_keys=missing_keys,
    )


def coverage_breakdown_ev1(conn: sqlite3.Connection, keys: list[str]) -> list[Ev1BreakdownRow]:
    """
    Breakdown only among EV1 keys (active), grouped by normalized locale/topic_category.
    """
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
    """
    EV1 keys that exist as active items but have empty/NULL topic_category (after normalization).
    """
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

def apply_seed_ignore_unique(
    conn: sqlite3.Connection,
    items: list[dict[str, Any]],
) -> tuple[int, int]:
    """
    Insert items into knowledge_items ignoring UNIQUE conflicts.
    Returns (inserted, skipped).
    """
    ensure_schema_items_and_meta(conn)

    inserted = 0
    skipped = 0
    now = int(time.time())

    sql = """
        INSERT INTO knowledge_items(key, locale, topic_category, text, priority, is_active, meta_json, created_at, updated_at)
        VALUES(?, ?, ?, ?, ?, ?, ?, ?, ?)
    """.strip()

    for it in items:
        try:
            conn.execute(
                sql,
                (
                    it["key"],
                    it.get("locale") or "ru-RU",
                    it.get("topic_category"),
                    it.get("text") or "",
                    int(it.get("priority", 0)),
                    int(it.get("is_active", 1)),
                    json.dumps(it.get("meta", {}), ensure_ascii=False) if isinstance(it.get("meta"), dict) else it.get("meta_json"),
                    it.get("created_at", now),
                    it.get("updated_at", now),
                ),
            )
            inserted += 1
        except sqlite3.IntegrityError:
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
    """
    Loads default seed JSONL files from astroprocessor/data/.
    """
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
) -> list[dict[str, Any]]:
    return [
        {
            "key": k,
            "locale": locale,
            "topic_category": topic_category,
            "priority": int(priority),
            "text": stub_text,
            "is_active": 1,
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
    """
    Idempotent EV1 seed + writes coverage to kb_meta.
    """
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
    """
    Best-effort conversion to markdown.
    Returns (title, markdown_text).
    """
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
        # optional dependency path
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
        title = src.stem
        text = _read_fb2_to_text(src)
        md = f"# {title}\n\n{text}\n"
        return title, md

    if ext == ".epub":
        title = src.stem
        text = _read_epub_to_text(src)
        md = f"# {title}\n\n{text}\n"
        return title, md

    if ext == ".rtf":
        title = src.stem
        text = _read_rtf_to_text(src)
        md = f"# {title}\n\n{text}\n"
        return title, md


    raise RuntimeError(f"unsupported extension: {ext}")


def import_books(*, inbox_dir: Optional[str] = None) -> dict[str, Any]:
    """
    Reads files from astroprocessor/data/knowledge_sources/inbox,
    converts to markdown and writes into astroprocessor/knowledge/docs.
    Moves processed/failed originals and updates _import_manifest.json.
    """
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
                {
                    "status": "ok",
                    "doc_id": doc_id,
                    "title": title,
                    "md_path": str(out_path),
                }
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
    """
    Reads markdown docs from astroprocessor/knowledge/docs and rebuilds knowledge_docs,
    knowledge_chunks, knowledge_chunks_fts.
    """
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
