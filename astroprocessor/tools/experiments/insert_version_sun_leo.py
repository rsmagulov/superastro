import sqlite3
from pathlib import Path
from datetime import datetime

DB = Path("data/knowledge.db")

KEY = "natal.planet.sun.sign.leo"
TOPIC = "personality_core"
LOCALE = "ru-RU"
PRIORITY = 950

TEXT = """Солнце во Льве усиливает тему самовыражения и личного лидерства. Тебе важно сиять — не обязательно быть в центре сцены, но чувствовать, что твой вклад замечают.
Сильная сторона — щедрость, творческая смелость, умение вдохновлять и брать ответственность.
Риск — застрять в потребности признания: обижаться, если внимание не дают, или путать авторитет с доминированием."""

def main():
    con = sqlite3.connect(DB)
    cur = con.cursor()

    # На всякий случай: убедимся, что таблица умеет created_at и is_active
    # Если столбцов нет — sqlite выдаст ошибку, и ты сразу увидишь, что миграция не применена.
    now = datetime.now().strftime("%Y-%m-%d %H:%M:%S")

    cur.execute(
        """
        INSERT INTO knowledge_items (key, topic_category, locale, text, priority, is_active, created_at)
        VALUES (?, ?, ?, ?, ?, 1, ?)
        """,
        (KEY, TOPIC, LOCALE, TEXT, PRIORITY, now),
    )

    con.commit()
    new_id = cur.execute("SELECT last_insert_rowid()").fetchone()[0]
    con.close()

    print(f"Inserted new version id={new_id} key={KEY} priority={PRIORITY}")

if __name__ == "__main__":
    main()
