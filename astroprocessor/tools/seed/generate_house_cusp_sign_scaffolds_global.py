# astroprocessor/tools/seed/generate_house_cusp_sign_scaffolds_global.py
from __future__ import annotations

from dataclasses import dataclass
from pathlib import Path

HOUSES = tuple(range(1, 13))
SIGNS = ("aries","taurus","gemini","cancer","leo","virgo","libra","scorpio","sagittarius","capricorn","aquarius","pisces")
SIGN_RU = {
    "aries":"Овен","taurus":"Телец","gemini":"Близнецы","cancer":"Рак","leo":"Лев","virgo":"Дева",
    "libra":"Весы","scorpio":"Скорпион","sagittarius":"Стрелец","capricorn":"Козерог","aquarius":"Водолей","pisces":"Рыбы",
}

@dataclass(frozen=True)
class SeedOptions:
    locale: str = "ru-RU"
    priority_any: int = 85
    priority_sign: int = 86

def _upsert_sql(key: str, text: str, locale: str, priority: int) -> str:
    esc = text.replace("'", "''")
    return f"""
UPDATE knowledge_items
SET text = '{esc}', priority = {int(priority)}, is_active = 1, meta_json = '{{}}'
WHERE key = '{key}' AND locale = '{locale}'
  AND (topic_category = '' OR topic_category IS NULL)
  AND (text IS NULL OR LENGTH(TRIM(text))=0);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT '{key}', '', '{locale}', '{esc}', {int(priority)}, CURRENT_TIMESTAMP, 1, '{{}}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = '{key}' AND locale = '{locale}' AND (topic_category = '' OR topic_category IS NULL)
);
""".strip()

def build_sql(opt: SeedOptions) -> str:
    parts = ["-- AUTO-GENERATED. DO NOT EDIT BY HAND.", "-- GLOBAL house cusp sign scaffolds", "BEGIN;"]
    for h in HOUSES:
        parts.append(_upsert_sql(
            f"natal.house.{h}.cusp.sign.any",
            f"Куспид {h}-го дома в знаке: задаёт тон и стиль проявления темы {h}-го дома.",
            opt.locale, opt.priority_any
        ))
        for s in SIGNS:
            sr = SIGN_RU.get(s, s)
            parts.append(_upsert_sql(
                f"natal.house.{h}.cusp.sign.{s}",
                f"Куспид {h}-го дома в «{sr}»: стиль темы {h}-го дома через качества «{sr}».",
                opt.locale, opt.priority_sign
            ))
    parts += ["COMMIT;", ""]
    return "\n\n".join(parts)

def main() -> None:
    root = Path(__file__).resolve().parents[2]
    out = root / "tools" / "seed" / "seed_house_cusp_sign_scaffolds_global.sql"
    out.write_text(build_sql(SeedOptions()), encoding="utf-8")
    print(f"Wrote: {out}")

if __name__ == "__main__":
    main()