import sqlite3
from pathlib import Path

db = Path("data/knowledge.db")
con = sqlite3.connect(db)
cur = con.cursor()

# created_at: ISO строка, по умолчанию текущий момент
try:
    cur.execute("ALTER TABLE knowledge_items ADD COLUMN created_at TEXT")
    print("Added column created_at")
except sqlite3.OperationalError as e:
    print("created_at:", e)

# is_active: 1/0, по умолчанию 1
try:
    cur.execute("ALTER TABLE knowledge_items ADD COLUMN is_active INTEGER NOT NULL DEFAULT 1")
    print("Added column is_active")
except sqlite3.OperationalError as e:
    print("is_active:", e)

# Заполним created_at для старых записей, если NULL
cur.execute("""
UPDATE knowledge_items
SET created_at = COALESCE(created_at, datetime('now'))
""")

con.commit()
con.close()
print("Done.")
