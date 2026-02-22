# astroprocessor/tools/seed/generate_personality_core_missing_planet_keys_global.py
from __future__ import annotations

from dataclasses import dataclass
from pathlib import Path

MISSING_KEYS = [
    "natal.planet.sun.sign.capricorn.house.any",
    "natal.planet.sun.sign.any",
    "natal.planet.sun",
    "natal.planet.moon.sign.pisces.house.any",
    "natal.planet.moon.sign.any",
    "natal.planet.moon",
    "natal.planet.mercury.sign.capricorn.house.11",
    "natal.planet.mercury.sign.capricorn.house.any",
    "natal.planet.mercury.sign.any",
    "natal.planet.mercury",
    "natal.planet.venus.sign.aquarius.house.any",
    "natal.planet.venus.sign.any",
    "natal.planet.venus",
    "natal.planet.mars.sign.sagittarius.house.any",
    "natal.planet.mars.sign.any",
    "natal.planet.mars",
]

PLANET_RU = {
    "sun": "Солнце", "moon": "Луна", "mercury": "Меркурий", "venus": "Венера", "mars": "Марс",
    "jupiter": "Юпитер", "saturn": "Сатурн", "uranus": "Уран", "neptune": "Нептун", "pluto": "Плутон",
}
SIGN_RU = {
    "aries":"Овен","taurus":"Телец","gemini":"Близнецы","cancer":"Рак","leo":"Лев","virgo":"Дева",
    "libra":"Весы","scorpio":"Скорпион","sagittarius":"Стрелец","capricorn":"Козерог","aquarius":"Водолей","pisces":"Рыбы",
}

@dataclass(frozen=True)
class SeedOptions:
    locale: str = "ru-RU"
    priority: int = 90

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

def _auto_text(key: str) -> str:
    # lightweight parser to make readable RU scaffold
    parts = key.split(".")
    # natal.planet.<p>...
    p = parts[2] if len(parts) > 2 else ""
    pr = PLANET_RU.get(p, p)

    if key == f"natal.planet.{p}":
        return f"{pr}: базовый смысл планеты как функции и мотива."
    if key == f"natal.planet.{p}.sign.any":
        return f"{pr} в знаке: общий стиль проявления качеств {pr}."
    if key.endswith(".house.any") and ".sign." in key:
        sign = parts[4]
        sr = SIGN_RU.get(sign, sign)
        return f"{pr} в «{sr}» (дом любой): общий смысл связки «планета+знак»."
    if ".house." in key and ".sign." in key:
        sign = parts[4]
        sr = SIGN_RU.get(sign, sign)
        house = parts[-1]
        return f"{pr} в «{sr}» в {house}-м доме: базовый смысл связки «планета+знак+дом»."
    return f"Scaffold для ключа: {key}"

def build_sql(opt: SeedOptions) -> str:
    out = ["-- AUTO-GENERATED. DO NOT EDIT BY HAND.", "-- GLOBAL exact missing keys for personality_core", "BEGIN;"]
    for k in MISSING_KEYS:
        out.append(_upsert_sql(k, _auto_text(k), opt.locale, opt.priority))
    out += ["COMMIT;", ""]
    return "\n\n".join(out)

def main() -> None:
    root = Path(__file__).resolve().parents[2]
    out = root / "tools" / "seed" / "seed_personality_core_missing_planet_keys_global.sql"
    out.write_text(build_sql(SeedOptions()), encoding="utf-8")
    print(f"Wrote: {out} (rows={len(MISSING_KEYS)})")

if __name__ == "__main__":
    main()