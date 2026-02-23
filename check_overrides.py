import sqlite3
from pathlib import Path

db = Path(r".\astroprocessor\data\knowledge.db")
keys = [
  "natal.planets.group.luminaries.count.2",
  "natal.house.10.ruler.venus.aspects.present",
  "natal.aspect.mars.sextile.venus",
]

con = sqlite3.connect(db)
cur = con.cursor()

for k in keys:
    cur.execute(
        """
        SELECT key, topic_category, locale, is_active, priority, LENGTH(text)
        FROM knowledge_items
        WHERE key=? AND topic_category='career' AND locale='ru-RU'
        ORDER BY priority DESC
        LIMIT 1
        """,
        (k,),
    )
    print(cur.fetchone())

con.close()
