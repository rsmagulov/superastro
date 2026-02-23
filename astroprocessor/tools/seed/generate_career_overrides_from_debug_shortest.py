# astroprocessor/tools/seed/generate_career_overrides_from_debug_shortest.py
from __future__ import annotations

import argparse
import json
import re
from dataclasses import dataclass
from pathlib import Path
from typing import Any, Iterable


# ---- Dictionaries (minimal, extend as needed) ----

SIGNS_RU = {
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

PLANETS_RU = {
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
    "lilith": "Лилит",
    "north_node": "Северный узел",
    "south_node": "Южный узел",
}

ASPECTS_RU = {
    "conjunction": "соединение",
    "sextile": "секстиль",
    "square": "квадрат",
    "trine": "трин",
    "opposition": "оппозиция",
    "quincunx": "квинконс",
    "semisextile": "полусекстиль",
    "semisquare": "полуквадрат",
    "sesquisquare": "полутораквадрат",
    "quintile": "квинтиль",
    "biquintile": "биквинтиль",
}

GROUPS_RU = {
    "luminaries": "светила (Солнце+Луна)",
    "inner": "личные планеты (Меркурий/Венера/Марс)",
    "social": "социальные планеты (Юпитер/Сатурн)",
    "outer": "высшие планеты (Уран/Нептун/Плутон)",
}


# ---- Options ----

@dataclass(frozen=True)
class Opt:
    in_path: Path
    out_path: Path
    topic: str = "career"
    locale: str = "ru-RU"
    priority: int = 140
    max_len: int = 120
    max_keys: int = 50


# ---- JSON extraction ----

def _safe_get(d: dict[str, Any], path: Iterable[str]) -> Any:
    cur: Any = d
    for p in path:
        if not isinstance(cur, dict) or p not in cur:
            return None
        cur = cur[p]
    return cur


def _extract_used_blocks(debug_json: dict[str, Any], topic: str) -> list[dict[str, Any]]:
    """
    Expected shape (typical):
      meta.debug.topics.<topic>.used_blocks_sample = [{key,text,priority,...}, ...]
    """
    blocks = _safe_get(debug_json, ["meta", "debug", "topics", topic, "used_blocks_sample"])
    if isinstance(blocks, list):
        out: list[dict[str, Any]] = []
        for b in blocks:
            if isinstance(b, dict) and isinstance(b.get("key"), str):
                out.append(b)
        return out
    return []


# ---- SQL helper (overwrite/upsert) ----

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


# ---- Text synthesis (career-focused, longer than "service" blocks) ----

def _ru_planet(p: str) -> str:
    return PLANETS_RU.get(p, p)

def _ru_sign(s: str) -> str:
    return SIGNS_RU.get(s, s)

def _ru_aspect(a: str) -> str:
    return ASPECTS_RU.get(a, a)

def _ru_group(g: str) -> str:
    return GROUPS_RU.get(g, g)


def _txt_default(key: str) -> str:
    return (
        "Это карьерный маркер карты: он описывает, как конкретная конфигурация проявляется в профессиональной роли, "
        "в стиле принятия решений и в том, через что человеку проще всего добиваться результата. "
        "Смотри на него как на «рычаг»: усиливая сильную сторону и осознанно компенсируя слабую, можно быстрее расти в статусе, "
        "в компетенции и в устойчивости дохода. Практика: выпиши 2–3 поведенческих паттерна, которые уже проявляются в работе, "
        "и выбери один, который хочешь улучшить в ближайшие 2 недели (коммуникация, дисциплина, инициативность, фокус или управление рисками)."
    )


def _txt_planet_sign_house(p: str, s: str, h: str) -> str:
    pr = _ru_planet(p)
    sr = _ru_sign(s)
    return (
        f"{pr} в {sr} в {h}-м доме в карьерном контексте показывает «как ты работаешь» и «за что тебя ценят». "
        f"Знак описывает стиль: темп, мотивацию и то, как ты проявляешь волю/ум/ценности. Дом — где это лучше монетизируется: "
        f"в какой сфере задач и при каком типе ответственности потенциал раскрывается быстрее. "
        "Практический перевод: выбирай роли и проекты, где этот стиль — не «шум», а преимущество. "
        "Если стиль конфликтует с требованиями среды, не ломай себя: добавь опоры (процессы, трекинг задач, наставник, регламент коммуникации). "
        "Так конфигурация перестаёт быть случайностью и становится управляемым инструментом роста."
    )


def _txt_group_count(group: str, n: str) -> str:
    gr = _ru_group(group)
    return (
        f"Группа планет: {gr}. Количество объектов = {n}. "
        "В карьерной интерпретации это индикатор «куда уходит энергия» и какая логика поведения чаще включается автоматически. "
        "Больше объектов в группе — больше частоты и заметности её тем: "
        "светила — личная мотивация и смысл; личные — навыки и действия; социальные — статус/структура/рост; высшие — инновации/видение/глубина. "
        "Практика: сопоставь это с твоей текущей работой. Если роль не использует доминирующую группу, появляется ощущение выгорания или «я не на месте». "
        "Если использует — проще держать темп и стабильно улучшать результат."
    )


def _txt_house_ruler_aspects_present(h: str, p: str) -> str:
    pr = _ru_planet(p)
    return (
        f"Аспекты управителя {h}-го дома ({pr}) — это «каналы взаимодействия» темы дома с остальной картой. "
        "Для карьеры это важно, потому что показывает: через какие люди/задачи/ситуации включается профессиональный рост, "
        "что даёт поддержку, а где будут точки трения. "
        "Практика: смотри на повторяющиеся сюжеты в работе — конфликты, вдохновение, прорывы, задержки, удачные союзы. "
        "Аспекты управителя часто описывают именно эти повторяемости. "
        "Решение обычно не в том, чтобы «избежать аспекта», а в том, чтобы выбрать правильную стратегию: "
        "сроки, границы, формат договорённостей, и роли, где эта динамика полезна."
    )


def _txt_aspect_generic(a: str) -> str:
    ar = _ru_aspect(a)
    return (
        f"Аспект «{ar}» в карьерной теме — это тип связи между функциями: как быстро возникает результат, "
        "и какая цена по энергии/времени/конфликтам. "
        "Гармоничные аспекты проще превращать в навыки и сильные стороны, напряжённые — в зоны развития и управляемые риски. "
        "Практика: найди, где в работе ты попадаешь в крайности (слишком жёстко/слишком мягко, быстро/медленно, идеализм/контроль). "
        "Затем сделай одну «настройку процесса» (чёткие дедлайны, декомпозиция, ревью, регулярная обратная связь, критерии качества) — "
        "это переводит аспект из эмоциональной реакции в профессиональный инструмент."
    )


def _txt_house_ruler_specific_aspect(h: str, ruler: str, aspect: str, other: str) -> str:
    rr = _ru_planet(ruler)
    orr = _ru_planet(other)
    ar = _ru_aspect(aspect)
    return (
        f"Управитель {h}-го дома ({rr}) в аспекте «{ar}» с {orr} — это точная подсказка, как тема дома превращается в карьерное действие. "
        "Смотри на это как на «механику результата»: что запускает мотивацию, где нужно больше структуры, а где — больше свободы и доверия процессу. "
        "Практика: выпиши 2 ситуации из работы, где ты уже видел эту динамику (например: переговоры, дедлайны, креатив, власть/ответственность). "
        "Затем выбери одну привычку, которая усиливает сильную сторону аспекта (регламент, ритуал планирования, коммуникационный шаблон, "
        "или правило принятия решений). Так аспект перестаёт быть случайным «событием», и становится повторяемой технологией роста."
    )


def synth_text(key: str) -> str:
    """
    Heuristics based on key patterns. If unknown -> default text.
    """
    # natal.planet.<p>.sign.<s>.house.<h>
    m = re.fullmatch(r"natal\.planet\.([a-z_]+)\.sign\.([a-z_]+)\.house\.(\d+)", key)
    if m:
        return _txt_planet_sign_house(m.group(1), m.group(2), m.group(3))

    # natal.planets.group.<g>.count.<n>
    m = re.fullmatch(r"natal\.planets\.group\.([a-z_]+)\.count\.([0-9]+)", key)
    if m:
        return _txt_group_count(m.group(1), m.group(2))

    # natal.house.<h>.ruler.<p>.aspects.present
    m = re.fullmatch(r"natal\.house\.(\d+)\.ruler\.([a-z_]+)\.aspects\.present", key)
    if m:
        return _txt_house_ruler_aspects_present(m.group(1), m.group(2))

    # natal.house.<h>.ruler.<r>.aspect.<aspect>.<other>  (your project uses this style for some ladders)
    m = re.fullmatch(r"natal\.house\.(\d+)\.ruler\.([a-z_]+)\.aspect\.([a-z_]+)\.([a-z_]+)", key)
    if m:
        return _txt_house_ruler_specific_aspect(m.group(1), m.group(2), m.group(3), m.group(4))

    # natal.aspect.<aspect>.*  (generic)
    m = re.match(r"^natal\.aspect\.([a-z_]+)\b", key)
    if m:
        return _txt_aspect_generic(m.group(1))

    return _txt_default(key)


# ---- Selection logic ----

def select_short_keys(used_blocks: list[dict[str, Any]], opt: Opt) -> list[str]:
    """
    Take used blocks, compute text len from payload, select shortest keys <= opt.max_len.
    Dedupe preserving order by increasing length.
    """
    rows: list[tuple[int, str]] = []
    for b in used_blocks:
        key = b.get("key")
        text = b.get("text") or ""
        if not isinstance(key, str):
            continue
        if not isinstance(text, str):
            text = ""
        rows.append((len(text), key))

    # sort by length asc, then key asc for stability
    rows.sort(key=lambda x: (x[0], x[1]))

    seen: set[str] = set()
    out: list[str] = []
    for ln, key in rows:
        if key in seen:
            continue
        seen.add(key)
        if ln <= opt.max_len:
            out.append(key)
        if len(out) >= opt.max_keys:
            break
    return out


# ---- SQL build ----

def build_sql(keys: list[str], opt: Opt) -> str:
    out: list[str] = [
        "-- AUTO-GENERATED. DO NOT EDIT BY HAND.",
        f"-- Career overrides from debug shortest used blocks (topic_category={opt.topic})",
        f"-- Source JSON: {opt.in_path.as_posix()}",
        f"-- Filter: len(text)<= {opt.max_len}, max_keys={opt.max_keys}",
        "BEGIN;",
    ]

    for k in keys:
        out.append(upsert_overwrite(k, synth_text(k), opt))

    out += ["COMMIT;", ""]
    return "\n\n".join(out)


# ---- CLI ----

def parse_args() -> Opt:
    p = argparse.ArgumentParser(
        description="Generate career topic-specific overrides (SQL) from debug=2 JSON shortest used blocks."
    )
    p.add_argument("--in", dest="in_path", required=True, help="Path to debug JSON (response body).")
    p.add_argument("--out", dest="out_path", required=True, help="Path to output SQL file.")
    p.add_argument("--topic", default="career")
    p.add_argument("--locale", default="ru-RU")
    p.add_argument("--priority", type=int, default=140)
    p.add_argument("--max-len", type=int, default=120, help="Max text length in used_blocks_sample to consider as 'short'.")
    p.add_argument("--max-keys", type=int, default=50, help="Max keys to generate overrides for.")
    a = p.parse_args()

    return Opt(
        in_path=Path(a.in_path),
        out_path=Path(a.out_path),
        topic=str(a.topic),
        locale=str(a.locale),
        priority=int(a.priority),
        max_len=int(a.max_len),
        max_keys=int(a.max_keys),
    )


def main() -> None:
    opt = parse_args()

    try:
        content = opt.in_path.read_text(encoding="utf-8-sig")
    except UnicodeDecodeError:
        content = opt.in_path.read_text(encoding="utf-8")

    raw = json.loads(content)
    
    used = _extract_used_blocks(raw, opt.topic)
    keys = select_short_keys(used, opt)

    sql = build_sql(keys, opt)
    opt.out_path.parent.mkdir(parents=True, exist_ok=True)
    opt.out_path.write_text(sql, encoding="utf-8")

    print(f"Wrote: {opt.out_path}")
    print(f"Topic: {opt.topic}, locale: {opt.locale}, priority: {opt.priority}")
    print(f"Selected keys: {len(keys)}")
    for k in keys[:20]:
        print(f" - {k}")


if __name__ == "__main__":
    main()