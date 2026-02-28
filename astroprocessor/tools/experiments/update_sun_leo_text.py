# update_sun_leo_text.py
import sqlite3
from pathlib import Path

db = Path("data/knowledge.db")
con = sqlite3.connect(db)
cur = con.cursor()

TEXT = """
Солнце во Льве усиливает тему самовыражения и личного лидерства. Тебе важно сиять — 
не обязательно быть в центре сцены, но чувствовать, что твой вклад замечают и ценят.

Сильная сторона — щедрость, уверенность в себе, творческая смелость и способность 
вдохновлять других. Ты естественно берёшь ответственность, когда действуешь из 
внутреннего чувства достоинства.

Риск — застревание в потребности признания: болезненно реагировать на отсутствие 
внимания, путать авторитет с доминированием или выгорать, если отклик не соответствует 
ожиданиям. Баланс приходит, когда самовыражение становится внутренней опорой, а не 
способом получить подтверждение извне.
"""

cur.execute("""
UPDATE knowledge_items
SET text = ?
WHERE id = (
    SELECT id
    FROM knowledge_items
    WHERE key = ?
    ORDER BY priority DESC, created_at DESC, id DESC
    LIMIT 1
)
""", (TEXT.strip(), "natal.planet.sun.sign.leo"))

con.commit()
con.close()
print("Updated latest version of natal.planet.sun.sign.leo")
