# tools/migrate_add_sources.py
from __future__ import annotations

import sqlite3
from pathlib import Path

DB_PATH = Path("./data/knowledge.db")

DDL = [
    # authors
    """
    CREATE TABLE IF NOT EXISTS knowledge_authors (
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      name TEXT NOT NULL UNIQUE,
      created_at TEXT NOT NULL DEFAULT (datetime('now'))
    );
    """,
    # sources
    """
    CREATE TABLE IF NOT EXISTS knowledge_sources (
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      title TEXT NOT NULL,
      author_id INTEGER NULL,
      school TEXT NULL,
      source_type TEXT NULL,        -- book/article/notes/other
      language TEXT NOT NULL DEFAULT 'ru',
      tags_json TEXT NULL,          -- json array
      status TEXT NOT NULL DEFAULT 'imported',  -- imported/text_extracted/fragmented/error/archived
      priority INTEGER NOT NULL DEFAULT 100,
      file_path TEXT NULL,
      extracted_text_path TEXT NULL,
      report_json TEXT NULL,
      is_enabled INTEGER NOT NULL DEFAULT 1,
      is_archived INTEGER NOT NULL DEFAULT 0,
      created_at TEXT NOT NULL DEFAULT (datetime('now')),
      updated_at TEXT NOT NULL DEFAULT (datetime('now')),
      FOREIGN KEY (author_id) REFERENCES knowledge_authors(id)
    );
    """,
    # add source_id to knowledge_items (best-effort)
    """
    ALTER TABLE knowledge_items ADD COLUMN source_id INTEGER NULL;
    """,
    # helpful indexes
    """
    CREATE INDEX IF NOT EXISTS idx_knowledge_items_source_id ON knowledge_items(source_id);
    """,
    """
    CREATE INDEX IF NOT EXISTS idx_sources_status ON knowledge_sources(status);
    """,
    """
    CREATE INDEX IF NOT EXISTS idx_sources_archived ON knowledge_sources(is_archived);
    """,
]

def main() -> None:
    if not DB_PATH.exists():
        raise SystemExit(f"DB not found: {DB_PATH.resolve()}")

    con = sqlite3.connect(str(DB_PATH))
    try:
        cur = con.cursor()
        for stmt in DDL:
            try:
                cur.execute(stmt)
            except sqlite3.OperationalError as e:
                # SQLite will throw "duplicate column name" if source_id already exists
                if "duplicate column name" in str(e).lower():
                    continue
                raise
        con.commit()
        print("OK: migrate_add_sources applied")
    finally:
        con.close()

if __name__ == "__main__":
    main()
