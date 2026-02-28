# astroprocessor/tools/seed/generate_house_ruler_aspect_scaffolds_global.py
from __future__ import annotations

from dataclasses import dataclass
from pathlib import Path

HOUSES = tuple(range(1, 13))
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
    priority: int = 91

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
    parts = ["-- AUTO-GENERATED. DO NOT EDIT BY HAND.", "-- GLOBAL house ruler aspect scaffolds", "BEGIN;"]

    for h in HOUSES:
        # generic markers
        parts.append(_upsert_sql(
            f"natal.house.{h}.ruler.aspects.present",
            f"Есть аспекты управителя {h}-го дома: они уточняют динамику темы {h}-го дома.",
            opt.locale, opt.priority
        ))
        parts.append(_upsert_sql(
            f"natal.house.{h}.ruler.aspect.class.harmonic",
            f"Гармоничные аспекты управителя {h}-го дома: поддержка и ресурсные связи для темы {h}-го дома.",
            opt.locale, opt.priority
        ))
        parts.append(_upsert_sql(
            f"natal.house.{h}.ruler.aspect.class.tense",
            f"Напряжённые аспекты управителя {h}-го дома: вызовы и точки роста для темы {h}-го дома.",
            opt.locale, opt.priority
        ))

        for r in PLANETS:
            rr = PLANET_RU.get(r, r)
            parts.append(_upsert_sql(
                f"natal.house.{h}.ruler.{r}.aspects.present",
                f"Есть аспекты у управителя {h}-го дома ({rr}): они показывают, с чем сцеплена тема {h}-го дома.",
                opt.locale, opt.priority
            ))

            for a in ASPECTS:
                ar = ASPECT_RU.get(a, a)
                for other in PLANETS:
                    if other == r:
                        continue
                    oru = PLANET_RU.get(other, other)

                    # two common patterns (подстраховка под разные key_builder варианты)
                    parts.append(_upsert_sql(
                        f"natal.house.{h}.ruler.aspect.{a}.{other}",
                        f"Управитель {h}-го дома в аспекте «{ar}» с {oru}: связь темы {h}-го дома с качествами {oru}.",
                        opt.locale, opt.priority
                    ))
                    parts.append(_upsert_sql(
                        f"natal.house.{h}.ruler.{r}.aspect.{a}.{other}",
                        f"Управитель {h}-го дома ({rr}) в аспекте «{ar}» с {oru}: сцепка тем и влияние на реализацию {h}-го дома.",
                        opt.locale, opt.priority
                    ))

    parts += ["COMMIT;", ""]
    return "\n\n".join(parts)

def main() -> None:
    root = Path(__file__).resolve().parents[2]
    out = root / "tools" / "seed" / "seed_house_ruler_aspect_scaffolds_global.sql"
    out.write_text(build_sql(SeedOptions()), encoding="utf-8")
    print(f"Wrote: {out}")

if __name__ == "__main__":
    main()