# astroprocessor/tools/seed/generate_career_house10_ruler_specific_aspects_seed.py
from __future__ import annotations

from dataclasses import dataclass
from pathlib import Path

PLANETS = ("sun", "moon", "mercury", "venus", "mars", "jupiter", "saturn", "uranus", "neptune", "pluto")
PLANET_RU = {
    "sun": "Солнце", "moon": "Луна", "mercury": "Меркурий", "venus": "Венера", "mars": "Марс",
    "jupiter": "Юпитер", "saturn": "Сатурн", "uranus": "Уран", "neptune": "Нептун", "pluto": "Плутон",
}

ASPECTS = ("conjunction", "sextile", "square", "trine", "opposition")
ASPECT_RU = {
    "conjunction": "соединение",
    "sextile": "секстиль",
    "square": "квадрат",
    "trine": "трин",
    "opposition": "оппозиция",
}

ASPECT_TONE = {
    "conjunction": "усиливает и «сливает» темы, важно управлять фокусом",
    "sextile": "даёт возможности через контакты и практику",
    "square": "даёт рост через вызовы, требует структуры и границ",
    "trine": "даёт поддержку и лёгкость, важно закреплять практикой",
    "opposition": "даёт напряжение через полярность интересов, нужны договорённости и баланс",
}


@dataclass(frozen=True)
class Opt:
    locale: str = "ru-RU"
    topic: str = "career"
    priority: int = 140


def upsert_overwrite(key: str, text: str, opt: Opt) -> str:
    esc = text.replace("'", "''")
    return f"""
UPDATE knowledge_items
SET text = '{esc}', is_active = 1, priority = {opt.priority}, meta_json = '{{}}'
WHERE key = '{key}' AND locale = '{opt.locale}' AND topic_category = '{opt.topic}';

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT '{key}', '{opt.topic}', '{opt.locale}', '{esc}', {opt.priority}, CURRENT_TIMESTAMP, 1, '{{}}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = '{key}' AND locale = '{opt.locale}' AND topic_category = '{opt.topic}'
);
""".strip()


def txt(r: str, a: str, o: str) -> str:
    rr = PLANET_RU[r]
    oo = PLANET_RU[o]
    ar = ASPECT_RU[a]
    tone = ASPECT_TONE[a]
    return (
        f"Аспект управителя 10-го дома ({rr}) к планете {oo} ({ar}) описывает, как карьера связывается с темами {oo}. "
        f"Этот аспект {tone}. Практически: ищите ситуации, где одновременно включаются «статус/роль» и качества {oo}, "
        f"и выстраивайте понятные правила (режим, границы, приоритеты), чтобы аспект работал на результат."
    )


def build_sql(opt: Opt) -> str:
    out: list[str] = [
        "-- AUTO-GENERATED. DO NOT EDIT BY HAND.",
        "-- Career: specific ruler aspects for house10 (topic_category=career)",
        "BEGIN;",
    ]

    for r in PLANETS:
        for a in ASPECTS:
            for o in PLANETS:
                if o == r:
                    continue
                out.append(upsert_overwrite(f"natal.house.10.ruler.{r}.aspect.{a}.{o}", txt(r, a, o), opt))

    # Also general (no ruler planet) fallbacks
    for a in ASPECTS:
        for o in PLANETS:
            out.append(
                upsert_overwrite(
                    f"natal.house.10.ruler.aspect.{a}.{o}",
                    f"Аспекты управителя 10-го дома типа «{ASPECT_RU[a]}» к планете {PLANET_RU[o]}: общий смысл и практические выводы для карьеры.",
                    opt,
                )
            )

    out += ["COMMIT;", ""]
    return "\n\n".join(out)


def main() -> None:
    root = Path(__file__).resolve().parents[2]  # .../astroprocessor
    out_path = root / "tools" / "seed" / "seed_career_house10_ruler_specific_aspects.sql"
    out_path.write_text(build_sql(Opt()), encoding="utf-8")
    print(f"Wrote: {out_path}")


if __name__ == "__main__":
    main()