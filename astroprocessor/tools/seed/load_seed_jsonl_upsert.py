# tools/seed/load_seed_jsonl_upsert.py
from __future__ import annotations

import argparse
import json
import sqlite3
from pathlib import Path


UNIQUE_INDEX_NAME = "ux_knowledge_items_key_locale_topic"


def dedupe_existing(conn: sqlite3.Connection) -> int:
    """
    Удаляет дубликаты по (key, locale, topic_category), оставляя "лучший" ряд:
    priority DESC, created_at DESC, id DESC.
    Возвращает количество удалённых строк.
    """
    cur = conn.cursor()
    cur.execute("""
    WITH ranked AS (
      SELECT
        id,
        ROW_NUMBER() OVER (
          PARTITION BY key, locale, topic_category
          ORDER BY
            COALESCE(priority, 0) DESC,
            COALESCE(created_at, '') DESC,
            id DESC
        ) AS rn
      FROM knowledge_items
      WHERE key IS NOT NULL
    )
    DELETE FROM knowledge_items
    WHERE id IN (SELECT id FROM ranked WHERE rn > 1);
    """)
    return cur.rowcount if cur.rowcount is not None else 0


def ensure_unique_index(conn: sqlite3.Connection) -> None:
    conn.execute(f"""
        CREATE UNIQUE INDEX IF NOT EXISTS {UNIQUE_INDEX_NAME}
        ON knowledge_items(key, locale, topic_category);
    """)


def upsert_row(conn: sqlite3.Connection, row: dict) -> str:
    """
    UPSERT по (key, locale, topic_category)
    - Если записи нет: вставляем
    - Если есть: обновляем text/priority/is_active/created_at
      (created_at: берём MAX(old,new) по строковому ISO)
    """
    key = row["key"]
    locale = row.get("locale", "ru-RU")
    topic_category = row.get("topic_category", None)
    text = row["text"]
    priority = int(row.get("priority", 100))
    is_active = int(row.get("is_active", 1))
    created_at = row.get("created_at", None)

    cur = conn.cursor()

    # Пытаемся INSERT..ON CONFLICT
    # Важно: topic_category может быть NULL — но у тебя сейчас он НЕ NULL (personality_core),
    # поэтому конфликт отработает нормально.
    cur.execute(
        """
        INSERT INTO knowledge_items (key, locale, topic_category, text, priority, is_active, created_at)
        VALUES (?, ?, ?, ?, ?, ?, ?)
        ON CONFLICT(key, locale, topic_category)
        DO UPDATE SET
          text = excluded.text,
          priority = excluded.priority,
          is_active = excluded.is_active,
          created_at = CASE
            WHEN knowledge_items.created_at IS NULL THEN excluded.created_at
            WHEN excluded.created_at IS NULL THEN knowledge_items.created_at
            WHEN excluded.created_at > knowledge_items.created_at THEN excluded.created_at
            ELSE knowledge_items.created_at
          END
        """,
        (key, locale, topic_category, text, priority, is_active, created_at),
    )

    # sqlite3 не даёт “update/insert” напрямую — определим по changes()
    changes = conn.execute("SELECT changes()").fetchone()[0]
    # changes() будет 1 и для insert, и для update; поэтому честно скажем "upserted"
    return "upserted" if changes else "noop"


def main() -> None:
    ap = argparse.ArgumentParser()
    ap.add_argument("--db", required=True)
    ap.add_argument("--jsonl", required=True)
    args = ap.parse_args()

    db_path = Path(args.db)
    jsonl_path = Path(args.jsonl)

    if not db_path.exists():
        raise SystemExit(f"DB not found: {db_path}")
    if not jsonl_path.exists():
        raise SystemExit(f"JSONL not found: {jsonl_path}")

    conn = sqlite3.connect(str(db_path))
    conn.execute("PRAGMA foreign_keys=ON;")
    conn.execute("PRAGMA journal_mode=WAL;")

    # 1) сначала убираем старые дубли
    deleted = dedupe_existing(conn)

    # 2) затем ставим UNIQUE (теперь не упадёт)
    ensure_unique_index(conn)

    inserted = 0
    updated = 0

    # 3) грузим jsonl
    with jsonl_path.open("r", encoding="utf-8") as f:
        for line_no, line in enumerate(f, start=1):
            s = line.strip()
            if not s:
                continue
            try:
                row = json.loads(s)
            except json.JSONDecodeError as e:
                raise SystemExit(f"Bad JSON at line {line_no}: {e}")

            # минимальная валидация
            if "key" not in row or "text" not in row:
                raise SystemExit(f"Missing key/text at line {line_no}")

            # определяем было ли обновление или вставка:
            # проверим существование до апсерта
            existed = conn.execute(
                "SELECT 1 FROM knowledge_items WHERE key=? AND locale=? AND topic_category IS ? LIMIT 1",
                (row["key"], row.get("locale", "ru-RU"), row.get("topic_category", None)),
            ).fetchone() is not None

            upsert_row(conn, row)

            if existed:
                updated += 1
            else:
                inserted += 1

    conn.commit()
    conn.close()

    print(f"OK: dedupe_deleted={deleted} inserted={inserted} updated={updated}")


if __name__ == "__main__":
    main()
