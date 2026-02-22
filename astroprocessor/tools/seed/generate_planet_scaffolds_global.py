# astroprocessor/tools/seed/generate_planet_scaffolds_global.py
from __future__ import annotations

from dataclasses import dataclass
from pathlib import Path

SIGNS: tuple[str, ...] = (
    "aries","taurus","gemini","cancer","leo","virgo","libra","scorpio","sagittarius","capricorn","aquarius","pisces"
)

SIGN_RU = {
    "aries":"Овен","taurus":"Телец","gemini":"Близнецы","cancer":"Рак","leo":"Лев","virgo":"Дева",
    "libra":"Весы","scorpio":"Скорпион","sagittarius":"Стрелец","capricorn":"Козерог","aquarius":"Водолей","pisces":"Рыбы",
}

PLANETS: tuple[str, ...] = (
    "sun","moon","mercury","venus","mars","jupiter","saturn","uranus","neptune","pluto"
)
PLANET_RU = {
    "sun":"Солнце","moon":"Луна","mercury":"Меркурий","venus":"Венера","mars":"Марс",
    "jupiter":"Юпитер","saturn":"Сатурн","uranus":"Уран","neptune":"Нептун","pluto":"Плутон",
}

@dataclass(frozen=True)
class SeedOptions:
    locale: str = "ru-RU"
    priority_base: int = 82
    priority_any: int = 83
    priority_sign: int = 88  # for jupiter/saturn sign.<sign>

def _upsert_sql(*, key: str, text: str, locale: str, priority: int) -> str:
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

def _t_planet_base(p: str) -> str:
    pr = PLANET_RU.get(p, p)
    return f"{pr}: базовый смысл планеты как психологической функции и мотива."

def _t_planet_sign_any(p: str) -> str:
    pr = PLANET_RU.get(p, p)
    return f"{pr} в знаке: показывает стиль проявления качества {pr} (как это «делается»)."

def _t_planet_house_any(p: str) -> str:
    pr = PLANET_RU.get(p, p)
    return f"{pr} в доме: показывает сферу жизни, где тема {pr} включается чаще и заметнее."

def _t_planet_sign(p: str, s: str) -> str:
    pr = PLANET_RU.get(p, p)
    sr = SIGN_RU.get(s, s)
    return f"{pr} в «{sr}»: базовый стиль проявления через качества знака «{sr}» (универсально для любой темы)."

def build_sql(opt: SeedOptions) -> str:
    parts: list[str] = []
    parts += ["-- AUTO-GENERATED. DO NOT EDIT BY HAND.", "-- GLOBAL planet scaffolds", "BEGIN;"]

    for p in PLANETS:
        parts.append(_upsert_sql(
            key=f"natal.planet.{p}",
            text=_t_planet_base(p),
            locale=opt.locale,
            priority=opt.priority_base,
        ))
        parts.append(_upsert_sql(
            key=f"natal.planet.{p}.sign.any",
            text=_t_planet_sign_any(p),
            locale=opt.locale,
            priority=opt.priority_any,
        ))
        parts.append(_upsert_sql(
            key=f"natal.planet.{p}.house.any",
            text=_t_planet_house_any(p),
            locale=opt.locale,
            priority=opt.priority_any,
        ))

    # точечно: Jupiter/Saturn sign.<sign> (они у тебя чаще всего падают в generic)
    for p in ("jupiter", "saturn"):
        for s in SIGNS:
            parts.append(_upsert_sql(
                key=f"natal.planet.{p}.sign.{s}",
                text=_t_planet_sign(p, s),
                locale=opt.locale,
                priority=opt.priority_sign,
            ))

    parts += ["COMMIT;", ""]
    return "\n\n".join(parts)

def main() -> None:
    root = Path(__file__).resolve().parents[2]
    out = root / "tools" / "seed" / "seed_planet_scaffolds_global.sql"
    out.write_text(build_sql(SeedOptions()), encoding="utf-8")
    print(f"Wrote: {out}")

if __name__ == "__main__":
    main()