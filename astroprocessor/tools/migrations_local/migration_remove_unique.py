import sqlite3

con = sqlite3.connect("data/knowledge.db")
cur = con.cursor()

cur.execute("""
CREATE TABLE knowledge_items_new (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    key TEXT NOT NULL,
    topic_category TEXT,
    locale TEXT NOT NULL,
    text TEXT NOT NULL,
    priority INTEGER NOT NULL DEFAULT 100,
    created_at TEXT DEFAULT (datetime('now')),
    is_active INTEGER NOT NULL DEFAULT 1
);
""")

cur.execute("""
INSERT INTO knowledge_items_new
(id, key, topic_category, locale, text, priority, created_at, is_active)
SELECT id, key, topic_category, locale, text, priority, created_at, is_active
FROM knowledge_items;
""")

cur.execute("DROP TABLE knowledge_items;")
cur.execute("ALTER TABLE knowledge_items_new RENAME TO knowledge_items;")

con.commit()
con.close()

print("Migration done: UNIQUE constraint removed.")
