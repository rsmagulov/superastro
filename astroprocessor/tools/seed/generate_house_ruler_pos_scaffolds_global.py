# astroprocessor/tools/seed/generate_house_ruler_pos_scaffolds_global.py
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
    priority: int = 86  # выше natal.generic(50), ниже многих конкретных sign.house(100)


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


def _text_house_ruler_pos_any(house: int, ruler: str) -> str:
    p = PLANET_RU.get(ruler, ruler)
    return (
        f"Управитель {house}-го дома — {p}: важны условия, где твои решения по теме дома становятся устойчивыми. "
        f"Смотри, в каком знаке и доме стоит {p}: это подсказывает стиль и среду реализации."
    )


def _text_house_ruler_sign_any(house: int, ruler: str) -> str:
    p = PLANET_RU.get(ruler, ruler)
    return f"Управитель {house}-го дома ({p}) стоит в определённом знаке: это задаёт стиль проявления темы {house}-го дома."

def _text_house_ruler_house_any(house: int, ruler: str) -> str:
    p = PLANET_RU.get(ruler, ruler)
    return f"Управитель {house}-го дома ({p}) расположен в некотором доме: это показывает, где именно «включается» тема {house}-го дома."

def build_seed_sql(opt: SeedOptions) -> str:
    parts: list[str] = []
    parts.append("-- AUTO-GENERATED. DO NOT EDIT BY HAND.")
    parts.append("-- GLOBAL scaffolds for house ruler position keys.")
    parts.append("BEGIN;")

    for h in HOUSES:
        for r in PLANETS:
            parts.append(
                _update_insert_sql(
                    key=f"natal.house.{h}.ruler.{r}.sign.any",
                    locale=opt.locale,
                    text=_text_house_ruler_sign_any(h, r),
                    priority=opt.priority,
                )
            )
            parts.append(
                _update_insert_sql(
                    key=f"natal.house.{h}.ruler.{r}.house.any",
                    locale=opt.locale,
                    text=_text_house_ruler_house_any(h, r),
                    priority=opt.priority,
                )
            )
            parts.append(
                _update_insert_sql(
                    key=f"natal.house.{h}.ruler.{r}.sign.any.house.any",
                    locale=opt.locale,
                    text=_text_house_ruler_pos_any(h, r),
                    priority=opt.priority,
                )
            )

    parts.append("COMMIT;")
    parts.append("")
    return "\n\n".join(parts)


def main() -> None:
    repo_root = Path(__file__).resolve().parents[2]  # .../astroprocessor
    out_path = repo_root / "tools" / "seed" / "seed_house_ruler_pos_scaffolds_global.sql"
    sql = build_seed_sql(SeedOptions())
    out_path.write_text(sql, encoding="utf-8")
    print(f"Wrote: {out_path} (rows={len(HOUSES) * len(PLANETS) * 3})")


if __name__ == "__main__":
    main()