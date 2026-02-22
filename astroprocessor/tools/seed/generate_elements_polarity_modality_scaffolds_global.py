# astroprocessor/tools/seed/generate_elements_polarity_modality_scaffolds_global.py
from __future__ import annotations

from dataclasses import dataclass
from pathlib import Path

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
    parts = ["-- AUTO-GENERATED. DO NOT EDIT BY HAND.", "-- GLOBAL elements/polarity/modality scaffolds", "BEGIN;"]

    # Elements (две формы ключей — подстраховка)
    for e_ru, e in (("Огонь","fire"),("Земля","earth"),("Воздух","air"),("Вода","water")):
        parts.append(_upsert_sql(f"natal.elements.{e}.count", f"Стихия «{e_ru}»: количество планет/точек в этой стихии.", opt.locale, opt.priority))
        parts.append(_upsert_sql(f"natal.element.{e}.count", f"Стихия «{e_ru}»: количество планет/точек в этой стихии.", opt.locale, opt.priority))

    parts.append(_upsert_sql("natal.elements.dominant", "Доминирующая стихия: что даётся естественно и проявляется автоматически.", opt.locale, opt.priority))
    parts.append(_upsert_sql("natal.elements.deficient", "Дефицит стихии: что важно развивать осознанно и добирать через практику.", opt.locale, opt.priority))

    # Polarity / modality (две формы ключей)
    parts.append(_upsert_sql("natal.polarity.balance", "Баланс инь/ян: соотношение восприимчивости и инициативности.", opt.locale, opt.priority))
    parts.append(_upsert_sql("natal.modality.dominant", "Доминирующая модальность: кардинальная/фиксированная/мутабельная — общий стиль действия.", opt.locale, opt.priority))

    parts += ["COMMIT;", ""]
    return "\n\n".join(parts)

def main() -> None:
    root = Path(__file__).resolve().parents[2]
    out = root / "tools" / "seed" / "seed_elements_polarity_modality_scaffolds_global.sql"
    out.write_text(build_sql(SeedOptions()), encoding="utf-8")
    print(f"Wrote: {out}")

if __name__ == "__main__":
    main()