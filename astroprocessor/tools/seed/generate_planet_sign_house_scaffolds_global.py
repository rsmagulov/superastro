# astroprocessor/tools/seed/generate_planet_sign_house_scaffolds_global.py
from __future__ import annotations

from dataclasses import dataclass
from pathlib import Path

SIGNS = (
    "aries","taurus","gemini","cancer","leo","virgo","libra","scorpio",
    "sagittarius","capricorn","aquarius","pisces",
)
SIGN_RU = {
    "aries":"Овен","taurus":"Телец","gemini":"Близнецы","cancer":"Рак","leo":"Лев","virgo":"Дева",
    "libra":"Весы","scorpio":"Скорпион","sagittarius":"Стрелец","capricorn":"Козерог","aquarius":"Водолей","pisces":"Рыбы",
}
HOUSES = tuple(range(1, 13))
PLANETS = ("sun","moon","mercury","venus","mars","jupiter","saturn","uranus","neptune","pluto")
PLANET_RU = {
    "sun":"Солнце","moon":"Луна","mercury":"Меркурий","venus":"Венера","mars":"Марс",
    "jupiter":"Юпитер","saturn":"Сатурн","uranus":"Уран","neptune":"Нептун","pluto":"Плутон",
}

@dataclass(frozen=True)
class SeedOptions:
    locale: str = "ru-RU"
    priority_base: int = 82
    priority_any: int = 83
    priority_combo: int = 90

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
    parts = ["-- AUTO-GENERATED. DO NOT EDIT BY HAND.", "-- GLOBAL planet sign/house scaffolds", "BEGIN;"]

    for p in PLANETS:
        pr = PLANET_RU.get(p, p)
        parts.append(_upsert_sql(f"natal.planet.{p}", f"{pr}: базовый смысл планеты как функции/мотива.", opt.locale, opt.priority_base))
        parts.append(_upsert_sql(f"natal.planet.{p}.sign.any", f"{pr} в знаке: стиль проявления качеств {pr}.", opt.locale, opt.priority_any))
        parts.append(_upsert_sql(f"natal.planet.{p}.house.any", f"{pr} в доме: сфера жизни, где тема {pr} проявляется чаще.", opt.locale, opt.priority_any))

        for s in SIGNS:
            sr = SIGN_RU.get(s, s)
            parts.append(_upsert_sql(
                f"natal.planet.{p}.sign.{s}.house.any",
                f"{pr} в «{sr}» (дом любой): общий стиль проявления через качества «{sr}».",
                opt.locale, opt.priority_combo,
            ))
            for h in HOUSES:
                parts.append(_upsert_sql(
                    f"natal.planet.{p}.sign.{s}.house.{h}",
                    f"{pr} в «{sr}» в {h}-м доме: стиль «{sr}» проявляется в темах {h}-го дома.",
                    opt.locale, opt.priority_combo,
                ))

    parts += ["COMMIT;", ""]
    return "\n\n".join(parts)

def main() -> None:
    root = Path(__file__).resolve().parents[2]
    out = root / "tools" / "seed" / "seed_planet_sign_house_scaffolds_global.sql"
    out.write_text(build_sql(SeedOptions()), encoding="utf-8")
    print(f"Wrote: {out}")

if __name__ == "__main__":
    main()