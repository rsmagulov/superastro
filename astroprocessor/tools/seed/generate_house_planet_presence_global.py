# astroprocessor/tools/seed/generate_house_planet_presence_global.py
from __future__ import annotations

from dataclasses import dataclass
from pathlib import Path

HOUSES: tuple[int, ...] = (1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12)
PLANETS: tuple[str, ...] = (
    "sun",
    "moon",
    "mercury",
    "venus",
    "mars",
    "jupiter",
    "saturn",
    "uranus",
    "neptune",
    "pluto",
)

PLANET_RU: dict[str, str] = {
    "sun": "Солнце",
    "moon": "Луна",
    "mercury": "Меркурий",
    "venus": "Венера",
    "mars": "Марс",
    "jupiter": "Юпитер",
    "saturn": "Сатурн",
    "uranus": "Уран",
    "neptune": "Нептун",
    "pluto": "Плутон",
}


@dataclass(frozen=True)
class SeedOptions:
    locale: str = "ru-RU"
    priority: int = 84  # выше generic(50); ниже многих конкретных связок


def _update_insert_sql(*, key: str, locale: str, text: str, priority: int) -> str:
    esc_text = text.replace("'", "''")
    return f"""
UPDATE knowledge_items
SET text = '{esc_text}', priority = {int(priority)}, is_active = 1, meta_json = '{{}}'
WHERE key = '{key}' AND locale = '{locale}' AND (topic_category = '' OR topic_category IS NULL);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT '{key}', '', '{locale}', '{esc_text}', {int(priority)}, CURRENT_TIMESTAMP, 1, '{{}}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = '{key}' AND locale = '{locale}' AND (topic_category = '' OR topic_category IS NULL)
);
""".strip()


def _text_house_planet(house: int, planet: str) -> str:
    p = PLANET_RU.get(planet, planet)
    return (
        f"{p} в {house}-м доме: эта жизненная сфера становится заметной зоной действий и решений. "
        f"Смотри знак и аспекты {p} — они уточняют стиль и приоритеты проявления."
    )


def build_seed_sql(opt: SeedOptions) -> str:
    parts: list[str] = []
    parts.append("-- AUTO-GENERATED. DO NOT EDIT BY HAND.")
    parts.append("-- GLOBAL scaffolds for house planet presence keys: natal.house.<h>.planet.<planet>")
    parts.append("BEGIN;")

    for h in HOUSES:
        for p in PLANETS:
            parts.append(
                _update_insert_sql(
                    key=f"natal.house.{h}.planet.{p}",
                    locale=opt.locale,
                    text=_text_house_planet(h, p),
                    priority=opt.priority,
                )
            )

    parts.append("COMMIT;")
    parts.append("")
    return "\n\n".join(parts)


def main() -> None:
    repo_root = Path(__file__).resolve().parents[2]  # .../astroprocessor
    out_path = repo_root / "tools" / "seed" / "seed_house_planet_presence_global.sql"
    sql = build_seed_sql(SeedOptions())
    out_path.write_text(sql, encoding="utf-8")
    print(f"Wrote: {out_path} (rows={len(HOUSES) * len(PLANETS)})")


if __name__ == "__main__":
    main()