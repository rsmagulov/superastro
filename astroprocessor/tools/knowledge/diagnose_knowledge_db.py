from __future__ import annotations

import sys
import sqlite3
from pathlib import Path
from datetime import datetime


# --- bootstrap: make `import app.*` work when running as a script ---
def _bootstrap_sys_path() -> Path:
    """
    tools/knowledge/diagnose_knowledge_db.py -> parents[2] == astroprocessor/
    Add astroprocessor/ to sys.path so `import app...` works.
    """
    astro_root = Path(__file__).resolve().parents[2]
    if str(astro_root) not in sys.path:
        sys.path.insert(0, str(astro_root))
    return astro_root


def _resolve_db_path() -> Path:
    """
    Единственный источник правды: app.settings.settings.knowledge_db_path.
    Поддерживает относительный путь (от корня astroprocessor/).
    """
    astro_root = _bootstrap_sys_path()

    from app.settings import settings  # type: ignore

    p = Path(str(settings.knowledge_db_path))

    # если вдруг ошибочно указали директорию — подставим knowledge.db
    if p.exists() and p.is_dir():
        p = p / "knowledge.db"

    if not p.is_absolute():
        p = astro_root / p

    return p.resolve()


def _open(db_path: Path) -> sqlite3.Connection:
    return sqlite3.connect(str(db_path))


def _table_exists(conn: sqlite3.Connection, name: str) -> bool:
    row = conn.execute(
        "SELECT 1 FROM sqlite_master WHERE type IN ('table','view') AND name=? LIMIT 1",
        (name,),
    ).fetchone()
    return bool(row)


def _count(conn: sqlite3.Connection, table: str) -> int:
    return int(conn.execute(f"SELECT COUNT(*) FROM {table}").fetchone()[0])


def main() -> None:
    db_path = _resolve_db_path()

    print(f"DB path: {db_path}")
    print(f"Exists: {db_path.exists()}")
    if db_path.exists():
        st = db_path.stat()
        print(f"Size: {st.st_size} bytes")
        print(f"Modified: {datetime.fromtimestamp(st.st_mtime)}")

    if not db_path.exists():
        print("❌ DB file not found.")
        return

    conn = _open(db_path)
    try:
        # quick sanity
        try:
            ok = conn.execute("PRAGMA integrity_check;").fetchone()[0]
            print(f"integrity_check: {ok}")
        except Exception as e:
            print(f"integrity_check failed: {type(e).__name__}: {e}")

        tables = ["knowledge_docs", "knowledge_chunks", "knowledge_chunks_fts", "kb_meta", "knowledge_items"]
        for t in tables:
            ex = _table_exists(conn, t)
            print(f"Table {t}: {ex}")
            if ex and t != "knowledge_chunks_fts":
                print(f"  rows: {_count(conn, t)}")

        # EV1 quick probe
        if _table_exists(conn, "knowledge_items"):
            row = conn.execute("SELECT COUNT(*) FROM knowledge_items WHERE key LIKE 'natal.%'").fetchone()
            print(f"EV1 probe key LIKE 'natal.%': {int(row[0])}")

    finally:
        conn.close()


if __name__ == "__main__":
    main()
