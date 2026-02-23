# astroprocessor/tools/seed/generate_career_overrides_from_debug_shortest.py
from __future__ import annotations

import argparse
import json
import re
from dataclasses import dataclass
from pathlib import Path
from typing import Any, Iterable


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
    "inner": "личные (Меркурий/Венера/Марс)",
    "social": "социальные (Юпитер/Сатурн)",
    "outer": "высшие (Уран/Нептун/Плутон)",
}

ELEMENTS_RU = {"fire": "Огонь", "earth": "Земля", "air": "Воздух", "water": "Вода"}
MODALITY_RU = {"cardinal": "кардинальный", "fixed": "фиксированный", "mutable": "мутабельный"}

HOUSE_THEME_RU = {
    "1": "самопрезентация/инициатива",
    "2": "деньги/ресурсы/монетизация",
    "6": "работа/рутина/процессы и навыки",
    "7": "партнёрства/клиенты/союзы",
    "10": "карьера/статус/видимый результат",
    "11": "сеть/команды/сообщество",
    "12": "закулисье/служение/психогигиена",
}


@dataclass(frozen=True)
class Opt:
    in_path: Path
    out_path: Path
    topic: str = "career"
    locale: str = "ru-RU"
    priority: int = 140
    max_len: int = 120
    max_keys: int = 50


def _safe_get(d: dict[str, Any], path: Iterable[str]) -> Any:
    cur: Any = d
    for p in path:
        if not isinstance(cur, dict) or p not in cur:
            return None
        cur = cur[p]
    return cur


def _extract_used_blocks(debug_json: dict[str, Any], topic: str) -> list[dict[str, Any]]:
    blocks = _safe_get(debug_json, ["meta", "debug", "topics", topic, "used_blocks_sample"])
    if not isinstance(blocks, list):
        return []
    out: list[dict[str, Any]] = []
    for b in blocks:
        if isinstance(b, dict) and isinstance(b.get("key"), str):
            out.append(b)
    return out


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


def _ru_planet(p: str) -> str:
    return PLANETS_RU.get(p, p)


def _ru_sign(s: str) -> str:
    return SIGNS_RU.get(s, s)


def _ru_aspect(a: str) -> str:
    return ASPECTS_RU.get(a, a)


def _ru_group(g: str) -> str:
    return GROUPS_RU.get(g, g)


def _ru_element(e: str) -> str:
    return ELEMENTS_RU.get(e, e)


def _ru_modality(m: str) -> str:
    return MODALITY_RU.get(m, m)


def _house_theme(h: str) -> str:
    base = f"{h}-й дом"
    theme = HOUSE_THEME_RU.get(h)
    return f"{base} ({theme})" if theme else base


def _career_lever_for_planet(p: str) -> str:
    return {
        "sun": "роль, лидерство, ответственность",
        "moon": "устойчивость, забота о ресурсе, удержание",
        "mercury": "коммуникации, аналитика, обучение, документы",
        "venus": "ценность, переговоры, отношения, вкус/бренд",
        "mars": "инициатива, скорость, запуск, конкуренция",
        "jupiter": "рост, масштаб, наставничество, репутация",
        "saturn": "структура, дисциплина, долгий цикл, надёжность",
        "uranus": "инновации, свобода, технологии, нестандарт",
        "neptune": "видение/смысл/креатив, эмпатия; риск тумана",
        "pluto": "влияние, глубина, трансформация, кризисы",
    }.get(p, "ключевая функция результата")


def _aspect_effect(aspect: str) -> str:
    if aspect in ("trine", "sextile"):
        return "даёт ресурс и проще превращается в навык/результат"
    if aspect in ("square", "opposition"):
        return "даёт напряжение и рост: нужно управлять рисками, границами и приоритетами"
    if aspect == "conjunction":
        return "создаёт сильную сцепку функций: тема становится центральной в карьере"
    return "требует настройки процесса и ясных правил"


def _txt_default(_: str) -> str:
    return (
        "Карьерный маркер: показывает, где проще получить результат и что мешает стабильности. "
        "Практика: выбери 1 конкретный навык/процесс на 2 недели (приоритеты, дедлайны, коммуникации, контроль качества) "
        "и замерь эффект по метрикам: скорость, качество, доход, устойчивость."
    )


# --------- Planet groups (make them career-specific) ---------

def _txt_group_count(group: str, n: str) -> str:
    gr = _ru_group(group)
    focus = {
        "luminaries": "мотивация, направление и выгорание/ресурс",
        "inner": "навыки, сделки, коммуникации и скорость выполнения",
        "social": "структура, статус, правила и управляемый рост",
        "outer": "инновации, стратегия, изменения и работа с неопределённостью",
    }.get(group, "ключевая логика поведения")
    return (
        f"Группа планет: {gr} (кол-во = {n}). В карьере это показывает, какая подсистема чаще ведёт решения: {focus}. "
        "Практика: проверь, поддерживает ли текущая роль эту подсистему (формат задач, KPI, уровень ответственности). "
        "Если нет — добавь компенсатор: процесс, партнёр в команде или смена фокуса проекта."
    )


# --------- Planet placements (special-cases for your real used keys) ---------

def _txt_planet_sign_house_special(p: str, s: str, h: str) -> str | None:
    """
    Targeted high-precision texts for placements you actually see in used.
    Return None if no special-case match.
    """
    # Capricorn in 1st (identity/leadership) — very common in your sample
    if s == "capricorn" and h == "1":
        pr = _ru_planet(p)
        base = (
            f"{pr} в Козероге в 1-м доме: карьерный стиль «собранность, ответственность, результат». "
            "Сильная ставка на репутацию, статус и долгий цикл. Риск — жёсткость и перегруз."
        )
        if p == "sun":
            add = (
                " Солнце здесь усиливает лидерство через пример: тебя считывают как опору. "
                "Практика: формализуй роль (зона ответственности, KPI) и веди портфолио результатов."
            )
        elif p == "mercury":
            add = (
                " Меркурий: сильны стратегия, документы, аналитика и переговоры «по фактам». "
                "Практика: стандартизируй коммуникации (шаблоны писем, протоколы решений, чек-листы)."
            )
        elif p == "saturn":
            add = (
                " Сатурн: талант строить систему и держать качество, но рост часто через испытания. "
                "Практика: выбери один долгий проект и введи регулярный ритм контроля (еженедельные ревью/отчёты)."
            )
        elif p == "neptune":
            add = (
                " Нептун: видение + идеал качества, но возможен туман целей и расплывчатые договорённости. "
                "Практика: всегда фиксируй критерии успеха и границы ответственности письменно."
            )
        elif p == "uranus":
            add = (
                " Уран: нестандартное лидерство и тяга к реформам; сильны технологии и новые подходы. "
                "Практика: оформляй инновации в понятные метрики (A/B, пилоты, сроки), чтобы идеи становились результатом."
            )
        else:
            add = " Практика: закрепи 1 процесс, который делает твой результат повторяемым (ритм, KPI, ревью)."
        return base + add

    # Aquarius in 2nd (money/values) — Moon/Venus in your used
    if s == "aquarius" and h == "2":
        pr = _ru_planet(p)
        base = (
            f"{pr} в Водолее во 2-м доме: деньги через нестандарт, технологии, сеть и ценность «по-новому». "
            "Важно не только заработать, но и иметь свободу/смысл в монетизации."
        )
        if p == "moon":
            add = (
                " Луна: доход зависит от ощущения безопасности; возможны колебания. "
                "Практика: введи финансовый буфер и стабильную систему учёта, чтобы ресурс не «качало»."
            )
        elif p == "venus":
            add = (
                " Венера: монетизация через вкус, упаковку ценности, отношения и договорённости. "
                "Практика: прокачай позиционирование (оффер, прайс, кейсы) и держи прозрачные правила оплаты."
            )
        else:
            add = " Практика: упакуй уникальность в продукт/услугу и проверь спрос через тест продаж."
        return base + add

    # Jupiter in Cancer in 7th (clients/partners)
    if p == "jupiter" and s == "cancer" and h == "7":
        return (
            "Юпитер в Раке в 7-м доме: рост через партнёрства, клиентов и доверие. "
            "Сильны долгие отношения, забота о качестве сервиса и репутация «своего человека». "
            "Риск — брать на себя слишком много. Практика: фиксируй границы, SLA/ожидания и усиливай рекомендации."
        )

    # Mars in Sagittarius in 12th (behind the scenes / burnout)
    if p == "mars" and s == "sagittarius" and h == "12":
        return (
            "Марс в Стрельце в 12-м доме: энергия уходит в закулисье — исследование, подготовку, смысловые проекты. "
            "Сильны работа «в тишине», обучение, дальние цели. Риск — выгорание и скрытая раздражительность. "
            "Практика: планируй нагрузку циклами (спринт/восстановление) и выноси результат наружу маленькими релизами."
        )

    # Pluto in Scorpio in 11th (network / influence)
    if p == "pluto" and s == "scorpio" and h == "11":
        return (
            "Плутон в Скорпионе в 11-м доме: влияние через сеть, команды и проекты с высокой ставкой. "
            "Ты умеешь собирать сильных людей и менять правила игры, но важно избегать токсичных союзов. "
            "Практика: выбирай сообщества по ценностям, держи прозрачные роли и усиливай авторитет через кейсы."
        )

    return None


def _txt_planet_sign_house_generic(p: str, s: str, h: str) -> str:
    pr = _ru_planet(p)
    sr = _ru_sign(s)
    ht = _house_theme(h)
    lever = _career_lever_for_planet(p)
    return (
        f"{pr} в {sr} в {ht}: планета — рычаг ({lever}), знак — стиль действий, дом — зона результата. "
        "Практика: выбери 1 тип задач, где это проявляется сильнее, и добавь опору процесса (KPI/ритм/договорённости/ревью), "
        "чтобы результат стал стабильным."
    )


def _txt_planet_sign_house(p: str, s: str, h: str) -> str:
    special = _txt_planet_sign_house_special(p, s, h)
    return special if special is not None else _txt_planet_sign_house_generic(p, s, h)


# --------- Aspects: special-cases for your real used keys ---------

def _txt_aspect_special(p1: str, aspect: str, p2: str) -> str | None:
    # Normalize order for a few pairs
    pair = (p1, aspect, p2)

    if pair == ("mars", "sextile", "venus") or pair == ("venus", "sextile", "mars"):
        return (
            "Марс ✧ Венера (секстиль): энергия + ценность. В карьере это про умение действовать и одновременно «продавать» результат — "
            "инициатива, переговоры, упаковка и отношения. Практика: закрепи связку «действие → демонстрация ценности»: "
            "каждую неделю один релиз/инициатива + один артефакт (кейс, презентация, предложение)."
        )

    if pair == ("saturn", "conjunction", "sun") or pair == ("sun", "conjunction", "saturn"):
        return (
            "Солнце ☌ Сатурн: лидерство через ответственность и дисциплину. Карьера растёт по долгому циклу: качество, статус, доверие. "
            "Риск — самокритика и перегруз. Практика: формализуй роль (KPI, зона ответственности) и держи ритм отчётности/ревью, "
            "чтобы усилия превращались в видимый результат."
        )

    if pair == ("sun", "conjunction", "uranus") or pair == ("uranus", "conjunction", "sun"):
        return (
            "Солнце ☌ Уран: независимый стиль лидерства и потребность в свободе/инновациях. Сильны технологии, реформы, нестандартные решения. "
            "Риск — резкие повороты и конфликт с жёсткими правилами. Практика: оформляй новизну в пилоты и метрики (срок, гипотеза, критерий успеха)."
        )

    if pair == ("jupiter", "opposition", "uranus") or pair == ("uranus", "opposition", "jupiter"):
        return (
            "Юпитер ☍ Уран: рост через рывки и неожиданные возможности. В карьере это про масштабирование и смену траектории. "
            "Риск — переоценка возможностей и хаос в приоритетах. Практика: делай «большие ставки» через короткие пилоты "
            "и держи финансовую/временную подушку."
        )

    if pair == ("jupiter", "opposition", "sun") or pair == ("sun", "opposition", "jupiter"):
        return (
            "Солнце ☍ Юпитер: амбиции и стремление к масштабу. В карьере это помогает брать большие роли, но важно не обещать лишнего. "
            "Практика: фиксируй объём работ и критерии успеха, дели цель на этапы и держи контроль качества, чтобы рост был устойчивым."
        )

    if pair == ("neptune", "conjunction", "saturn") or pair == ("saturn", "conjunction", "neptune"):
        return (
            "Нептун ☌ Сатурн: соединение мечты и структуры. В карьере — умение превращать видение в систему (креатив/смысл → регламент/план). "
            "Риск — туман целей или чрезмерная жёсткость. Практика: всегда задавай измеримые критерии и сроки, чтобы вдохновение давало результат."
        )

    if pair == ("neptune", "conjunction", "sun") or pair == ("sun", "conjunction", "neptune"):
        return (
            "Нептун ☌ Солнце: сильное видение, эмпатия и творческая идентичность. Подходит работа со смыслом, образом, вдохновением. "
            "Риск — размытые границы и самообман в целях. Практика: держи чёткий контракт (что делаем/когда/за сколько) и проверяй гипотезы фактами."
        )

    if pair == ("neptune", "sextile", "pluto") or pair == ("pluto", "sextile", "neptune"):
        return (
            "Нептун ✧ Плутон (секстиль): глубокое видение + трансформационная сила. В карьере — способность работать с большими изменениями: "
            "культура, смыслы, кризисы, «пересборка» систем. Практика: выбирай проекты с долгим эффектом и фиксируй границы ответственности, "
            "чтобы не утонуть в эмоциях и неопределённости."
        )

    if pair == ("pluto", "sextile", "saturn") or pair == ("saturn", "sextile", "pluto"):
        return (
            "Плутон ✧ Сатурн (секстиль): управляемая трансформация. В карьере — умение менять систему без разрушения: кризис-менеджмент, "
            "оптимизация, власть через компетентность. Практика: веди изменения через план (этапы, риски, контрольные точки), "
            "чтобы рост был безопасным."
        )

    return None


def _txt_aspect_generic(p1: str, aspect: str, p2: str) -> str:
    a = _ru_aspect(aspect)
    p1r = _ru_planet(p1)
    p2r = _ru_planet(p2)
    eff = _aspect_effect(aspect)
    return (
        f"Аспект {p1r} — {a} — {p2r}: связь функций «{_career_lever_for_planet(p1)}» и «{_career_lever_for_planet(p2)}». "
        f"В карьере это {eff}. Практика: выбери одну настройку процесса (правило коммуникации, буфер времени, чек-лист качества) "
        "и проверь эффект за 2 недели."
    )


def _txt_aspect_pair(p1: str, aspect: str, p2: str) -> str:
    special = _txt_aspect_special(p1, aspect, p2)
    return special if special is not None else _txt_aspect_generic(p1, aspect, p2)


# --------- House mechanics (already used in your pipeline) ---------

def _txt_house_ruler_aspects_present(h: str, planet: str) -> str:
    ht = _house_theme(h)
    pr = _ru_planet(planet)
    return (
        f"Аспекты управителя {ht} ({pr}) — это каналы, через которые тема дома связана с карьерными событиями. "
        "Практика: найди 2 повторяющихся кейса и настрой процесс (договора, дедлайны, контроль качества, роли), "
        "чтобы переводить динамику аспектов в прогнозируемый результат."
    )


def _txt_house_ruler_specific_aspect(h: str, ruler: str, aspect: str, other: str) -> str:
    ht = _house_theme(h)
    rr = _ru_planet(ruler)
    orr = _ru_planet(other)
    ar = _ru_aspect(aspect)
    eff = _aspect_effect(aspect)
    return (
        f"Управитель {ht} ({rr}) в аспекте «{ar}» с {orr} показывает механику результата. "
        f"Это {eff}. Практика: закрепи 1 правило процесса (приоритеты, дедлайны, формат договорённостей) "
        "и 1 метрику, чтобы повторять успех и снижать риски."
    )


def _txt_mc() -> str:
    return (
        "MC (Средина Неба) — вектор карьеры: к какому статусу и типу результата ты стремишься и что должно быть видно рынку. "
        "Практика: сформулируй образ результата (роль/уровень/ценность) и 2 KPI на 30 дней; под них выбери один проект-носитель."
    )


def _txt_mc_sign(sign: str) -> str:
    sr = _ru_sign(sign)
    hint = {
        "libra": "через партнёрства, репутацию и баланс интересов",
        "capricorn": "через дисциплину, ответственность и долгий цикл",
        "virgo": "через качество, сервис и стандарты",
        "gemini": "через коммуникации и гибкость",
        "leo": "через лидерство и публичность",
        "aries": "через инициативу и скорость",
        "taurus": "через стабильную ценность и материальный результат",
        "scorpio": "через глубину и влияние",
        "sagittarius": "через рост и масштаб",
        "aquarius": "через инновации и сеть",
        "pisces": "через смысл и креатив",
        "cancer": "через заботу и безопасность",
    }.get(sign, "через качества знака")
    return (
        f"MC в знаке {sr}: рост {hint}. Практика: подстрой роль/окружение так, чтобы этот стиль был преимуществом "
        "(KPI, позиционирование, переговоры), и фиксируй договорённости письменно — это усиливает репутацию."
    )


def _txt_house10() -> str:
    return (
        "10-й дом — карьера/статус/видимый результат: за что тебя оценивают и повышают. "
        "Практика: выбери «метрику статуса» (что должно быть видно) и выстрой трек: задачи → дедлайны → критерии качества → отчёт."
    )


def _txt_house10_ruler_any() -> str:
    return (
        "Управитель 10-го дома не уточнён (any). Сфокусируйся на теме 10-го дома: статус, видимый результат и ответственность. "
        "Практика: 1 KPI + 1 дедлайн + 1 еженедельный отчёт на 2–4 недели — и смотри, что сильнее всего двигает карьеру."
    )


def _txt_house10_ruler(planet: str) -> str:
    pr = _ru_planet(planet)
    lever = _career_lever_for_planet(planet)
    return (
        f"Управитель 10-го дома — {pr}: карьерный рост через {lever}. "
        "Практика: выбери 1 проект, где эта функция проявляется, и усили демонстрацию результата (кейсы, метрики, портфолио)."
    )


def _txt_house10_ruler_sign_any(planet: str) -> str:
    pr = _ru_planet(planet)
    lever = _career_lever_for_planet(planet)
    return (
        f"{pr} как управитель 10-го дома, знак не уточнён (sign.any). Важнее функция: {lever}. "
        "Практика: согласуй критерии качества до старта и фиксируй договорённости письменно — это ускоряет рост статуса."
    )


def _txt_house10_ruler_aspects_present(planet: str) -> str:
    pr = _ru_planet(planet)
    return (
        f"Аспекты управителя 10-го дома ({pr}) показывают, через какие темы карьера включается сильнее: союзы, конфликты, рост, ограничения. "
        "Практика: выпиши 2 повторяющихся сюжета и настрой управление: границы, формат коммуникации, сроки и критерии качества."
    )


def _txt_house_cusp_sign(h: str, sign: str | None) -> str:
    ht = _house_theme(h)
    if sign is None:
        return (
            f"Куспид {ht}: знак не уточнён (any). В карьере важнее управление темой дома, чем стиль знака. "
            "Практика: выдели 1–2 навыка по теме дома и составь план на 4 недели (задачи, метрики, ритм)."
        )
    sr = _ru_sign(sign)
    return (
        f"Куспид {ht} в {sr} задаёт стиль решения задач по теме дома. "
        "Практика: подстрой окружение (роль, процессы, KPI), чтобы стиль знака усиливал результат, а не создавал лишние конфликты."
    )


def synth_text(key: str) -> str:
    # MC
    if key == "natal.angle.mc":
        return _txt_mc()
    m = re.fullmatch(r"natal\.angle\.mc\.sign\.([a-z_]+)", key)
    if m:
        return _txt_mc_sign(m.group(1))

    # House 10 core
    if key == "natal.house.10":
        return _txt_house10()
    if key == "natal.house.10.ruler.any":
        return _txt_house10_ruler_any()

    m = re.fullmatch(r"natal\.house\.10\.ruler\.([a-z_]+)", key)
    if m:
        return _txt_house10_ruler(m.group(1))

    m = re.fullmatch(r"natal\.house\.10\.ruler\.([a-z_]+)\.sign\.any", key)
    if m:
        return _txt_house10_ruler_sign_any(m.group(1))

    m = re.fullmatch(r"natal\.house\.10\.ruler\.([a-z_]+)\.aspects\.present", key)
    if m:
        return _txt_house10_ruler_aspects_present(m.group(1))

    m = re.fullmatch(r"natal\.house\.10\.ruler\.([a-z_]+)\.aspect\.([a-z_]+)\.([a-z_]+)", key)
    if m:
        return _txt_house_ruler_specific_aspect("10", m.group(1), m.group(2), m.group(3))

    # Other house ruler aspects present / specific
    m = re.fullmatch(r"natal\.house\.(\d+)\.ruler\.([a-z_]+)\.aspects\.present", key)
    if m:
        return _txt_house_ruler_aspects_present(m.group(1), m.group(2))

    m = re.fullmatch(r"natal\.house\.(\d+)\.ruler\.([a-z_]+)\.aspect\.([a-z_]+)\.([a-z_]+)", key)
    if m:
        return _txt_house_ruler_specific_aspect(m.group(1), m.group(2), m.group(3), m.group(4))

    # Planet placements
    m = re.fullmatch(r"natal\.planet\.([a-z_]+)\.sign\.([a-z_]+)\.house\.(\d+)", key)
    if m:
        return _txt_planet_sign_house(m.group(1), m.group(2), m.group(3))

    # Planet groups
    m = re.fullmatch(r"natal\.planets\.group\.([a-z_]+)\.count\.([0-9]+)", key)
    if m:
        return _txt_group_count(m.group(1), m.group(2))

    # Aspects
    m = re.fullmatch(r"natal\.aspect\.([a-z_]+)\.([a-z_]+)\.([a-z_]+)", key)
    if m:
        return _txt_aspect_pair(m.group(1), m.group(2), m.group(3))

    # Cusp sign
    m = re.fullmatch(r"natal\.house\.(\d+)\.cusp\.sign\.(any|[a-z_]+)", key)
    if m:
        sign = None if m.group(2) == "any" else m.group(2)
        return _txt_house_cusp_sign(m.group(1), sign)

    # Existing polarity/elements/modality handling can remain in your DB;
    # keep fallback minimal and correct.
    return _txt_default(key)


def select_short_keys(used_blocks: list[dict[str, Any]], opt: Opt) -> list[str]:
    rows: list[tuple[int, str]] = []
    for b in used_blocks:
        key = b.get("key")
        text = b.get("text") or ""
        if not isinstance(key, str):
            continue
        if not isinstance(text, str):
            text = ""
        rows.append((len(text), key))

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