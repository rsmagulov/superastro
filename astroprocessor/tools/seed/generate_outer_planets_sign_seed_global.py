# astroprocessor/tools/seed/generate_outer_planets_sign_seed_global.py
from __future__ import annotations

from dataclasses import dataclass
from pathlib import Path

SIGNS: tuple[str, ...] = (
    "aries",
    "taurus",
    "gemini",
    "cancer",
    "leo",
    "virgo",
    "libra",
    "scorpio",
    "sagittarius",
    "capricorn",
    "aquarius",
    "pisces",
)

SIGN_RU: dict[str, str] = {
    "aries": "Овен",
    "taurus": "Телец",
    "gemini": "Близнецы",
    "cancer": "Рак",
    "leo": "Лев",
    "virgo": "Дева",
    "libra": "Весы",
    "scorpio": "Скорпион",
    "sagittarius": "Стрелец",
    "capricorn": "Козерог",
    "aquarius": "Водолей",
    "pisces": "Рыбы",
}

OUTER_PLANETS: tuple[str, ...] = ("uranus", "neptune", "pluto")
PLANET_RU: dict[str, str] = {"uranus": "Уран", "neptune": "Нептун", "pluto": "Плутон"}


@dataclass(frozen=True)
class SeedOptions:
    locale: str = "ru-RU"
    priority: int = 88  # slightly below core personal planets if needed


def _planet_sign_text_ru(planet: str, sign: str) -> str:
    p_ru = PLANET_RU.get(planet, planet)
    s_ru = SIGN_RU.get(sign, sign)

    # Template: нейтрально и применимо к любой теме.
    # Мы не делаем "астрошколу", а даём смысловой слой для интерпретации.
    return (
        f"{p_ru} в знаке «{s_ru}» задаёт долгосрочный фон и стиль перемен. "
        f"Это проявляется медленно, но влияет на решения, окружение и жизненные стратегии. "
        f"В ресурсном варианте качества «{s_ru}» помогают обновляться конструктивно; "
        f"в теневом — могут давать перекосы и крайности, если игнорировать реальность и границы."
    )


def _update_insert_sql(*, key: str, locale: str, text: str, priority: int) -> str:
    esc_text = text.replace("'", "''")
    # global rows: topic_category = '' OR NULL
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


def build_seed_sql(opt: SeedOptions) -> str:
    parts: list[str] = []
    parts.append("-- AUTO-GENERATED. DO NOT EDIT BY HAND.")
    parts.append("-- Seeds GLOBAL outer planets sign keys: natal.planet.{uranus|neptune|pluto}.sign.<sign>")
    parts.append("BEGIN;")

    for planet in OUTER_PLANETS:
        for sign in SIGNS:
            key = f"natal.planet.{planet}.sign.{sign}"
            text = _planet_sign_text_ru(planet, sign)
            parts.append(_update_insert_sql(key=key, locale=opt.locale, text=text, priority=opt.priority))

    parts.append("COMMIT;")
    parts.append("")
    return "\n\n".join(parts)


def main() -> None:
    repo_root = Path(__file__).resolve().parents[2]  # .../astroprocessor
    out_path = repo_root / "tools" / "seed" / "seed_outer_planets_sign_global.sql"
    sql = build_seed_sql(SeedOptions())
    out_path.write_text(sql, encoding="utf-8")
    print(f"Wrote: {out_path} (rows={len(OUTER_PLANETS) * len(SIGNS)})")


if __name__ == "__main__":
    main()