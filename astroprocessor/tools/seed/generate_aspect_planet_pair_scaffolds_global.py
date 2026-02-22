# astroprocessor/tools/seed/generate_aspect_planet_pair_scaffolds_global.py
from __future__ import annotations

from dataclasses import dataclass
from pathlib import Path

PLANETS = ("sun","moon","mercury","venus","mars","jupiter","saturn","uranus","neptune","pluto")
PLANET_RU = {
    "sun":"Солнце","moon":"Луна","mercury":"Меркурий","venus":"Венера","mars":"Марс",
    "jupiter":"Юпитер","saturn":"Сатурн","uranus":"Уран","neptune":"Нептун","pluto":"Плутон",
}
ASPECTS = ("conjunction","sextile","trine","square","opposition")
ASPECT_RU = {
    "conjunction":"соединение",
    "sextile":"секстиль",
    "trine":"трин",
    "square":"квадрат",
    "opposition":"оппозиция",
}

@dataclass(frozen=True)
class SeedOptions:
    locale: str = "ru-RU"
    priority: int = 92

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
    parts = ["-- AUTO-GENERATED. DO NOT EDIT BY HAND.", "-- GLOBAL aspect planet-pair scaffolds", "BEGIN;"]

    for a in ASPECTS:
        ar = ASPECT_RU.get(a, a)
        for p1 in PLANETS:
            for p2 in PLANETS:
                if p1 == p2:
                    continue
                p1r = PLANET_RU.get(p1, p1)
                p2r = PLANET_RU.get(p2, p2)
                key = f"natal.aspect.{p1}.{a}.{p2}"
                text = f"Аспект «{ar}» между {p1r} и {p2r}: связь тем двух планет, влияющая на стиль их взаимодействия."
                parts.append(_upsert_sql(key, text, opt.locale, opt.priority))

    parts += ["COMMIT;", ""]
    return "\n\n".join(parts)

def main() -> None:
    root = Path(__file__).resolve().parents[2]
    out = root / "tools" / "seed" / "seed_aspect_planet_pair_scaffolds_global.sql"
    out.write_text(build_sql(SeedOptions()), encoding="utf-8")
    print(f"Wrote: {out}")

if __name__ == "__main__":
    main()