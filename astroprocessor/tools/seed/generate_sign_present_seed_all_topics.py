# astroprocessor/tools/seed/generate_sign_present_seed_all_topics.py
from __future__ import annotations

import sys
from dataclasses import dataclass
from pathlib import Path
from typing import Iterable

# Make "app" importable when running as a standalone script from any cwd:
# We add ".../astroprocessor" to sys.path so that "import app" works.
_THIS_FILE = Path(__file__).resolve()
_ASTROPROCESSOR_ROOT = _THIS_FILE.parents[2]  # .../astroprocessor
if str(_ASTROPROCESSOR_ROOT) not in sys.path:
    sys.path.insert(0, str(_ASTROPROCESSOR_ROOT))

from app.services.search_intent_builder import TOPIC_RU  # noqa: E402


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


@dataclass(frozen=True)
class SeedOptions:
    locale: str = "ru-RU"
    include_global: bool = True
    include_topics: bool = True
    priority_global: int = 100
    priority_topic: int = 102


def _topic_title_ru(topic: str) -> str:
    synonyms = TOPIC_RU.get(topic) or []
    if synonyms:
        s0 = str(synonyms[0]).strip()
        if s0:
            return s0[:1].upper() + s0[1:]
    return topic


def _sign_title_ru(sign_slug: str) -> str:
    return SIGN_RU.get(sign_slug, sign_slug)


def _make_text_global(sign_slug: str) -> str:
    s_ru = _sign_title_ru(sign_slug)
    return (
        f"Акцент на знаке «{s_ru}». "
        f"Он заметнее проявляется в характере и сценариях жизни, "
        f"если в «{s_ru}» находятся личные планеты, углы (ASC/MC/DSC/IC) или куспиды домов."
    )


def _make_text_topic(topic: str, sign_slug: str) -> str:
    s_ru = _sign_title_ru(sign_slug)
    t_ru = _topic_title_ru(topic)
    return (
        f"Тема «{t_ru}»: заметен акцент знака «{s_ru}». "
        f"Это добавляет стилю проявления темы качества «{s_ru}» "
        f"(через личные планеты, углы или куспиды домов в этом знаке)."
    )


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


def build_seed_sql(*, topics: Iterable[str], opt: SeedOptions) -> str:
    parts: list[str] = []
    parts.append("-- AUTO-GENERATED. DO NOT EDIT BY HAND.")
    parts.append("-- Seeds natal.sign.<sign>.present for global + per-topic rows.")
    parts.append("BEGIN;")

    if opt.include_global:
        for s in SIGNS:
            key = f"natal.sign.{s}.present"
            text = _make_text_global(s)
            parts.append(_update_insert_sql(key=key, topic="", locale=opt.locale, text=text, priority=opt.priority_global))

    if opt.include_topics:
        for t in topics:
            for s in SIGNS:
                key = f"natal.sign.{s}.present"
                text = _make_text_topic(t, s)
                parts.append(_update_insert_sql(key=key, topic=t, locale=opt.locale, text=text, priority=opt.priority_topic))

    parts.append("COMMIT;")
    parts.append("")
    return "\n\n".join(parts)


def main() -> None:
    out_path = _ASTROPROCESSOR_ROOT / "tools" / "seed" / "seed_sign_present_all_topics.sql"
    topics = sorted([str(k) for k in TOPIC_RU.keys() if isinstance(k, str) and k.strip()])
    sql = build_seed_sql(topics=topics, opt=SeedOptions())
    out_path.write_text(sql, encoding="utf-8")
    print(f"Wrote: {out_path} (topics={len(topics)}; rows≈{len(topics) * len(SIGNS) + len(SIGNS)})")


if __name__ == "__main__":
    main()