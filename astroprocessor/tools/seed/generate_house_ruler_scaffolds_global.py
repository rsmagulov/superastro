# astroprocessor/tools/seed/generate_house_ruler_scaffolds_global.py
from __future__ import annotations

from dataclasses import dataclass
from pathlib import Path

HOUSES = tuple(range(1, 13))
PLANETS = ("sun","moon","mercury","venus","mars","jupiter","saturn","uranus","neptune","pluto")
PLANET_RU = {
    "sun":"Солнце","moon":"Луна","mercury":"Меркурий","venus":"Венера","mars":"Марс",
    "jupiter":"Юпитер","saturn":"Сатурн","uranus":"Уран","neptune":"Нептун","pluto":"Плутон",
}

@dataclass(frozen=True)
class SeedOptions:
    locale: str = "ru-RU"
    priority: int = 84

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
    parts = ["-- AUTO-GENERATED. DO NOT EDIT BY HAND.", "-- GLOBAL house ruler scaffolds", "BEGIN;"]
    for h in HOUSES:
        parts.append(_upsert_sql(
            f"natal.house.{h}.ruler.any",
            f"Управитель {h}-го дома: планета, которая показывает «как» и «через что» реализуется тема {h}-го дома.",
            opt.locale, opt.priority
        ))
        for p in PLANETS:
            pr = PLANET_RU.get(p, p)
            parts.append(_upsert_sql(
                f"natal.house.{h}.ruler.{p}",
                f"Управитель {h}-го дома — {pr}: его положение (знак/дом/аспекты) уточняет стиль и стратегию по теме {h}-го дома.",
                opt.locale, opt.priority
            ))
    parts += ["COMMIT;", ""]
    return "\n\n".join(parts)

def main() -> None:
    root = Path(__file__).resolve().parents[2]
    out = root / "tools" / "seed" / "seed_house_ruler_scaffolds_global.sql"
    out.write_text(build_sql(SeedOptions()), encoding="utf-8")
    print(f"Wrote: {out}")

if __name__ == "__main__":
    main()