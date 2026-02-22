# astroprocessor/tools/seed/generate_sign_present_seed_all_topics.py
from __future__ import annotations

from dataclasses import dataclass
from pathlib import Path
from typing import Iterable

# Source of truth for topics in this repo (used by intent builder)
from app.services.search_intent_builder import TOPIC_RU  # dict[str, list[str]]

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


@dataclass(frozen=True)
class SeedOptions:
    locale: str = "ru-RU"
    include_global: bool = True
    include_topics: bool = True
    priority_global: int = 100
    priority_topic: int = 102


def _update_insert_sql(*, key: str, topic: str, locale: str, text: str, priority: int) -> str:
    # sqlite-safe idempotent: UPDATE + INSERT WHERE NOT EXISTS
    topic_expr = f"'{topic}'" if topic != "" else "''"
    topic_pred = "topic_category = '' OR topic_category IS NULL" if topic == "" else f"topic_category = '{topic}'"

    esc_text = text.replace("'", "''")

    return f"""
UPDATE knowledge_items
SET text = '{esc_text}', priority = {int(priority)}, is_active = 1, meta_json = '{{}}'
WHERE key = '{key}' AND locale = '{locale}' AND ({topic_pred});

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT '{key}', {topic_expr}, '{locale}', '{esc_text}', {int(priority)}, CURRENT_TIMESTAMP, 1, '{{}}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = '{key}' AND locale = '{locale}' AND ({topic_pred})
);
""".strip()


def build_seed_sql(*, topics: Iterable[str], opt: SeedOptions) -> str:
    parts: list[str] = []
    parts.append("-- AUTO-GENERATED. DO NOT EDIT BY HAND.")
    parts.append("-- Seeds natal.sign.<sign>.present for global + per-topic rows.")
    parts.append("BEGIN;")

    if opt.include_global:
        for s in SIGNS:
            key = f"natal.sign.{s}.present"
            text = f"Акцент знака: {s} (если знак выражен в карте)."
            parts.append(_update_insert_sql(key=key, topic="", locale=opt.locale, text=text, priority=opt.priority_global))

    if opt.include_topics:
        for t in topics:
            for s in SIGNS:
                key = f"natal.sign.{s}.present"
                text = f"({t}) Акцент знака: {s}."
                parts.append(_update_insert_sql(key=key, topic=t, locale=opt.locale, text=text, priority=opt.priority_topic))

    parts.append("COMMIT;")
    parts.append("")
    return "\n\n".join(parts)


def main() -> None:
    repo_root = Path(__file__).resolve().parents[2]  # .../astroprocessor
    out_path = repo_root / "tools" / "seed" / "seed_sign_present_all_topics.sql"

    topics = sorted([str(k) for k in TOPIC_RU.keys() if isinstance(k, str) and k.strip()])

    sql = build_seed_sql(topics=topics, opt=SeedOptions())

    out_path.write_text(sql, encoding="utf-8")
    print(f"Wrote: {out_path} (topics={len(topics)}; rows≈{len(topics) * len(SIGNS) + len(SIGNS)})")


if __name__ == "__main__":
    main()