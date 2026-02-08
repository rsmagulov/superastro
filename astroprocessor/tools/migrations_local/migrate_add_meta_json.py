import sqlite3
from pathlib import Path

DB_PATH = Path(__file__).resolve().parents[2] / "data" / "knowledge.db"

def column_exists(cur: sqlite3.Cursor, table: str, column: str) -> bool:
    cur.execute(f"PRAGMA table_info({table})")
    return any(row[1] == column for row in cur.fetchall())

def main() -> None:
    if not DB_PATH.exists():
        raise FileNotFoundError(f"DB not found: {DB_PATH}")

    con = sqlite3.connect(DB_PATH)
    try:
        cur = con.cursor()

        if column_exists(cur, "knowledge_items", "meta_json"):
            print("OK: meta_json already exists")
            return

        # SQLite: ADD COLUMN с NOT NULL допустим только если есть DEFAULT
        cur.execute(
            "ALTER TABLE knowledge_items "
            "ADD COLUMN meta_json TEXT NOT NULL DEFAULT '{}'"
        )

        con.commit()
        print("OK: meta_json added")
    finally:
        con.close()

if __name__ == "__main__":
    main()
