# astroprocessor/tools/seed/generate_aspect_scaffolds_global.py
from __future__ import annotations

from dataclasses import dataclass
from pathlib import Path

ASPECTS = ("conjunction","sextile","trine","square","opposition")

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

def build_sql(opt: SeedOptions) -> str:
    parts = ["-- AUTO-GENERATED. DO NOT EDIT BY HAND.", "-- GLOBAL aspect scaffolds (class/present/hard)", "BEGIN;"]

    parts.append(_upsert_sql(
        "natal.aspect.class.harmonic",
        "Гармоничные аспекты (трин/секстиль): поддержка, лёгкость включения и естественные таланты.",
        opt.locale, opt.priority
    ))
    parts.append(_upsert_sql(
        "natal.aspect.class.tense",
        "Напряжённые аспекты (квадрат/оппозиция): зоны роста, вызовы и необходимость учиться балансировать.",
        opt.locale, opt.priority
    ))
    parts.append(_upsert_sql(
        "natal.aspect.hard.present",
        "Есть жёсткие аспекты: это усиливает внутреннюю динамику и повышает требовательность к зрелым решениям.",
        opt.locale, opt.priority
    ))

    # per-aspect 'present' (если такие ключи генерируются — они часто есть в candidate_keys)
    for a in ASPECTS:
        parts.append(_upsert_sql(
            f"natal.aspect.{a}.present",
            f"Аспект {a}: значимая связка между темами планет, влияющая на стиль взаимодействия качеств в карте.",
            opt.locale, opt.priority
        ))

    # explicit markers mentioned in твоих правилах
    parts.append(_upsert_sql("natal.aspect.square.present", "Квадраты: напряжение, которое требует действия и перестройки.", opt.locale, opt.priority))
    parts.append(_upsert_sql("natal.aspect.opposition.present", "Оппозиции: полярности, которые важно согласовать и удерживать баланс.", opt.locale, opt.priority))

    parts += ["COMMIT;", ""]
    return "\n\n".join(parts)

def main() -> None:
    root = Path(__file__).resolve().parents[2]
    out = root / "tools" / "seed" / "seed_aspect_scaffolds_global.sql"
    out.write_text(build_sql(SeedOptions()), encoding="utf-8")
    print(f"Wrote: {out}")

if __name__ == "__main__":
    main()