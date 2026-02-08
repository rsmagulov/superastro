import sqlite3
from pathlib import Path

DB_PATH = Path(__file__).resolve().parents[2] / "data" / "knowledge.db"

def column_exists(cur: sqlite3.Cursor, table: str, column: str) -> bool:
    cur.execute(f"PRAGMA table_info({table})")
    return any(row[1] == column for row in cur.fetchall())

def main() -> None:
    con = sqlite3.connect(DB_PATH)
    try:
        cur = con.cursor()

        if column_exists(cur, "knowledge_items", "updated_at"):
            print("OK: updated_at already exists")
            return

        cur.execute(
            "ALTER TABLE knowledge_items "
            "ADD COLUMN updated_at TEXT"
        )

        # Заполним updated_at для текущих строк хотя бы created_at или now
        cur.execute(
            "UPDATE knowledge_items "
            "SET updated_at = COALESCE(created_at, datetime('now')) "
            "WHERE updated_at IS NULL"
        )

        con.commit()
        print("OK: updated_at added and backfilled")
    finally:
        con.close()

if __name__ == "__main__":
    main()
