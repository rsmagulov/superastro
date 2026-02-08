import json
import sqlite3
from datetime import datetime

DB = r"./data/knowledge.db"
JSONL = r"tools\seed\ev1_seed_any_ru.jsonl"

con = sqlite3.connect(DB)
con.row_factory = sqlite3.Row
cur = con.cursor()

# Подстрой под твою схему:
# Часто поля: id, key, text, locale, topic_category, priority, created_at
# Если у тебя другие названия — меняешь SQL ниже.

sql = """
INSERT INTO knowledge_items (key, text, locale, topic_category, priority, created_at)
VALUES (?, ?, ?, ?, ?, ?)
"""

now = datetime.utcnow().replace(microsecond=0).isoformat() + "Z"

with open(JSONL, "r", encoding="utf-8") as f:
    for line in f:
        if not line.strip():
            continue
        obj = json.loads(line)
        cur.execute(
            sql,
            (
                obj["key"],
                obj["text"],
                obj.get("locale", "ru-RU"),
                obj.get("topic_category", None),
                int(obj.get("priority", 100)),
                now,
            ),
        )

con.commit()
print("OK: inserted", cur.rowcount, "last-rowcount (last statement only)")
