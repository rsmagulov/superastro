# astroprocessor/tools/seed/generate_elements_polarity_modality_exact_global.py
from __future__ import annotations

from dataclasses import dataclass
from pathlib import Path

ELEMENTS = ("fire", "earth", "air", "water")
ELEMENT_RU = {"fire": "Огонь", "earth": "Земля", "air": "Воздух", "water": "Вода"}

# bucket(n) in your key_builder is 0..10 typically; safe upper bound:
COUNT_BUCKETS = tuple(range(0, 11))

POL_BAL = ("yin", "yang", "balanced")
POL_RU = {"yin": "инь", "yang": "ян", "balanced": "баланс"}

MODALITY = ("cardinal", "fixed", "mutable")
MOD_RU = {"cardinal": "кардинальная", "fixed": "фиксированная", "mutable": "мутабельная"}


@dataclass(frozen=True)
class SeedOptions:
    locale: str = "ru-RU"
    priority: int = 89


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
    p: list[str] = []
    p += ["-- AUTO-GENERATED. DO NOT EDIT BY HAND.", "-- GLOBAL exact keys for elements/polarity/modality", "BEGIN;"]

    # elements.<el>.count.<bucket> + .count.any + .elements.<el> + .elements
    for el in ELEMENTS:
        el_ru = ELEMENT_RU[el]
        p.append(_upsert_sql(
            f"natal.elements.{el}.count.any",
            f"Стихия «{el_ru}»: количество планет/точек (любой уровень).",
            opt.locale, opt.priority
        ))
        for b in COUNT_BUCKETS:
            p.append(_upsert_sql(
                f"natal.elements.{el}.count.{b}",
                f"Стихия «{el_ru}»: количество попало в bucket {b}.",
                opt.locale, opt.priority
            ))
        p.append(_upsert_sql(
            f"natal.elements.{el}",
            f"Стихия «{el_ru}»: общий смысл и проявления этой стихии.",
            opt.locale, opt.priority
        ))

    p.append(_upsert_sql("natal.elements", "Стихии карты: общий баланс огня/земли/воздуха/воды.", opt.locale, opt.priority))

    # dominant/deficient
    p.append(_upsert_sql("natal.elements.dominant.any", "Доминирующая стихия: общий ресурс (любой вариант).", opt.locale, opt.priority))
    p.append(_upsert_sql("natal.elements.deficient.any", "Дефицит стихии: зона развития (любой вариант).", opt.locale, opt.priority))
    for el in ELEMENTS:
        el_ru = ELEMENT_RU[el]
        p.append(_upsert_sql(f"natal.elements.dominant.{el}", f"Доминирующая стихия — «{el_ru}».", opt.locale, opt.priority))
        p.append(_upsert_sql(f"natal.elements.deficient.{el}", f"Дефицит стихии — «{el_ru}».", opt.locale, opt.priority))

    # polarity.balance.<bal> + .any + polarity
    p.append(_upsert_sql("natal.polarity.balance.any", "Баланс инь/ян: общий вариант (любой).", opt.locale, opt.priority))
    for bal in POL_BAL:
        p.append(_upsert_sql(f"natal.polarity.balance.{bal}", f"Баланс инь/ян: {POL_RU[bal]}.", opt.locale, opt.priority))
    p.append(_upsert_sql("natal.polarity", "Полярность карты: общий баланс инь/ян.", opt.locale, opt.priority))

    # modality.dominant.<mod> + .any + modality
    p.append(_upsert_sql("natal.modality.dominant.any", "Доминирующая модальность: общий вариант (любой).", opt.locale, opt.priority))
    for m in MODALITY:
        p.append(_upsert_sql(f"natal.modality.dominant.{m}", f"Доминирующая модальность — {MOD_RU[m]}.", opt.locale, opt.priority))
    p.append(_upsert_sql("natal.modality", "Модальность карты: общий баланс кардинальная/фиксированная/мутабельная.", opt.locale, opt.priority))

    p += ["COMMIT;", ""]
    return "\n\n".join(p)


def main() -> None:
    root = Path(__file__).resolve().parents[2]
    out = root / "tools" / "seed" / "seed_elements_polarity_modality_exact_global.sql"
    out.write_text(build_sql(SeedOptions()), encoding="utf-8")
    print(f"Wrote: {out}")


if __name__ == "__main__":
    main()