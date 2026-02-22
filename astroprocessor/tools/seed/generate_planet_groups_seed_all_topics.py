# astroprocessor/tools/seed/generate_planet_groups_seed_all_topics.py
from __future__ import annotations

from dataclasses import dataclass
from pathlib import Path
from typing import Iterable

from app.services.search_intent_builder import TOPIC_RU  # dict[str, list[str]]

PLANET_GROUPS: dict[str, tuple[str, ...]] = {
    "luminaries": ("sun", "moon"),
    "inner": ("mercury", "venus", "mars"),
    "social": ("jupiter", "saturn"),
    "outer": ("uranus", "neptune", "pluto"),
}


@dataclass(frozen=True)
class SeedOptions:
    locale: str = "ru-RU"
    include_global: bool = True
    include_topics: bool = True
    priority_global_present: int = 105
    priority_global_count: int = 95
    priority_topic_present: int = 108
    priority_topic_count: int = 98


def _update_insert_sql(*, key: str, topic: str, locale: str, text: str, priority: int) -> str:
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


def _present_text(group: str, topic: str) -> str:
    base = {
        "luminaries": "Группа планет: светила (Солнце и Луна) — базовый тон личности и эмоциональный фон.",
        "inner": "Группа планет: личные (Меркурий, Венера, Марс) — мышление, притяжение и способ действовать.",
        "social": "Группа планет: социальные (Юпитер, Сатурн) — рост, правила и долгие цели.",
        "outer": "Группа планет: высшие (Уран, Нептун, Плутон) — глубинные циклы, трансформация и перемены.",
    }[group]
    return base if topic == "" else f"({topic}) {base}"


def _count_text(group: str, n: int, max_n: int, topic: str) -> str:
    label = {
        "luminaries": "Светил",
        "inner": "Личных планет",
        "social": "Социальных планет",
        "outer": "Высших планет",
    }[group]
    base = f"{label} в группе: {n} из {max_n}."
    return base if topic == "" else f"({topic}) {base}"


def build_seed_sql(*, topics: Iterable[str], opt: SeedOptions) -> str:
    parts: list[str] = []
    parts.append("-- AUTO-GENERATED. DO NOT EDIT BY HAND.")
    parts.append("-- Seeds natal.planets.group.<group>.present and .count.<n> for global + per-topic rows.")
    parts.append("BEGIN;")

    def emit_for_topic(topic: str, is_global: bool) -> None:
        for group, members in PLANET_GROUPS.items():
            max_n = len(members)

            # present
            key_present = f"natal.planets.group.{group}.present"
            parts.append(
                _update_insert_sql(
                    key=key_present,
                    topic=topic,
                    locale=opt.locale,
                    text=_present_text(group, topic),
                    priority=opt.priority_global_present if is_global else opt.priority_topic_present,
                )
            )

            # count buckets 0..max_n
            for n in range(0, max_n + 1):
                key_count = f"natal.planets.group.{group}.count.{n}"
                parts.append(
                    _update_insert_sql(
                        key=key_count,
                        topic=topic,
                        locale=opt.locale,
                        text=_count_text(group, n, max_n, topic),
                        priority=opt.priority_global_count if is_global else opt.priority_topic_count,
                    )
                )

    if opt.include_global:
        emit_for_topic("", True)

    if opt.include_topics:
        for t in topics:
            emit_for_topic(t, False)

    parts.append("COMMIT;")
    parts.append("")
    return "\n\n".join(parts)


def main() -> None:
    repo_root = Path(__file__).resolve().parents[2]  # .../astroprocessor
    out_path = repo_root / "tools" / "seed" / "seed_planet_groups_all_topics.sql"

    topics = sorted([str(k) for k in TOPIC_RU.keys() if isinstance(k, str) and k.strip()])
    sql = build_seed_sql(topics=topics, opt=SeedOptions())

    out_path.write_text(sql, encoding="utf-8")

    total_rows = 0
    for g, members in PLANET_GROUPS.items():
        total_rows += (len(members) + 2)  # present + (0..max_n) count buckets
    print(f"Wrote: {out_path} (topics={len(topics)}; rows≈{len(topics) * total_rows + total_rows})")


if __name__ == "__main__":
    main()