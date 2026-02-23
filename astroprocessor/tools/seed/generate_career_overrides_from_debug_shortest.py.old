# C:\Projects\superastro\astroprocessor\tools\seed\generate_career_overrides_from_debug_shortest.py
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
MODALITY_RU = {"cardinal": "кардинальная", "fixed": "фиксированная", "mutable": "мутабельная"}

HOUSE_THEME_RU = {
    "1": "самопрезентация/инициатива",
    "2": "деньги/ресурсы/монетизация",
    "6": "работа/рутина/процессы и навыки",
    "7": "партнёрства/клиенты/союзы",
    "10": "карьера/статус/видимый результат",
    "11": "сеть/команды/сообщество",
    "12": "закулисье/служение/психогигиена",
}

SIGN_TRAITS_RU: dict[str, dict[str, str]] = {
    "aries": {"plus": "инициатива, смелость, скорость старта", "risk": "резкость, нетерпение, поспешные решения"},
    "taurus": {"plus": "устойчивость, практичность, вкус и качество", "risk": "инертность, упрямство, страх перемен"},
    "gemini": {"plus": "гибкость ума, коммуникации, обучение", "risk": "распыление, поверхностность, нервозность"},
    "cancer": {"plus": "эмпатия, забота, интуиция, память", "risk": "ранимость, обидчивость, уход в защиту"},
    "leo": {"plus": "самовыражение, лидерство, творчество", "risk": "самолюбие, драматизация, зависимость от оценки"},
    "virgo": {"plus": "точность, анализ, полезность, порядок", "risk": "критичность, тревожность, перфекционизм"},
    "libra": {"plus": "дипломатия, баланс, чувство справедливости", "risk": "сомнения, зависимость от мнения, избегание конфликта"},
    "scorpio": {"plus": "глубина, стойкость, концентрация, трансформация", "risk": "контроль, подозрительность, крайности"},
    "sagittarius": {"plus": "широта взглядов, смысл, честность, рост", "risk": "прямолинейность, обещания без расчёта, беспокойство"},
    "capricorn": {"plus": "ответственность, стратегия, дисциплина, результат", "risk": "жёсткость, перегруз, страх ошибки"},
    "aquarius": {"plus": "независимость, инновации, идеи, команда", "risk": "отстранённость, упрямство идей, непредсказуемость"},
    "pisces": {"plus": "воображение, сострадание, тонкость, вдохновение", "risk": "размытые границы, избегание, иллюзии"},
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


def _aspect_effect(aspect: str) -> str:
    if aspect in ("trine", "sextile"):
        return "даёт ресурс и проще превращается в навык/результат"
    if aspect in ("square", "opposition"):
        return "даёт напряжение и рост: нужно управлять рисками, границами и приоритетами"
    if aspect == "conjunction":
        return "создаёт сильную сцепку функций: тема становится центральной"
    return "требует настройки процесса и ясных правил"

def _txt_ancestral_topics_generic(topic: str) -> str:
    return (
        "Этот блок описывает родовые темы как повторяющиеся семейные сценарии: что передаётся через установки, роли и эмоциональные правила «дома». "
        "Сильная сторона — можно осознанно взять ресурс рода; риск — автоматически повторять чужой сценарий (вина, контроль, спасательство, молчание) вместо выбора. "
        "Практика: выбери 1 семейный паттерн и разложи его на шаги (триггер → реакция → итог). Затем замени один шаг на новый — и повторяй 14 дней."
    )

def _txt_default(topic: str, key: str) -> str:
    if topic == "career":
        return (
            "Карьерный маркер: показывает, где проще получить результат и что мешает стабильности. "
            "Практика: выбери 1 конкретный навык/процесс на 2 недели (приоритеты, дедлайны, коммуникации, контроль качества) "
            "и замерь эффект по метрикам: скорость, качество, доход, устойчивость."
        )
    return (
        f"Натальный маркер ({key}): это подсказка о стиле реакции и типичных сценариях. "
        "Практика: отследи, как это проявляется 7 дней (триггеры → реакция → результат) и выбери одну настройку поведения "
        "(границы, темп, коммуникация, режим восстановления)."
    )


# -----------------------------
# Topic-core templates
# -----------------------------
def _txt_past_lives_symbolic_generic(topic: str) -> str:
    return (
        "Этот блок описывает «символический слой прошлого» как набор повторяющихся архетипов: какие темы, страхи и желания всплывают автоматически. "
        "Сильная сторона — ты быстрее распознаёшь паттерн и можешь управлять им осознанно; риск — попадать в сценарий (идеализация, контроль, избегание) вместо живого контакта с реальностью. "
        "Практика: выбери 1 повторяющуюся тему на 14 дней и веди дневник триггеров (что произошло → что почувствовал(а) → что сделал(а) → какой итог)."
    )

def _txt_talents_generic(topic: str) -> str:
    return (
        "Этот блок описывает таланты как повторяемые сильные стороны: что у тебя получается быстрее среднего и что даёт ощущение потока. "
        "Сильная сторона — можно собрать 1–2 ключевых навыка в устойчивую систему; риск — распыляться и не доводить до продукта. "
        "Практика: выбери один талант и за 14 дней преврати его в маленький результат (текст, проект, навык, портфолио) с конкретным критерием качества."
    )

def _txt_sign_present(topic: str, sign: str) -> str:
    sr = _ru_sign(sign)
    tr = SIGN_TRAITS_RU.get(sign, {"plus": "характерные качества", "risk": "типичные перекосы"})
    return (
        f"{sr} заметно проявлен в карте. Сильные стороны: {tr['plus']}. "
        f"Риски перекоса: {tr['risk']}. "
        "Практика: выбери 1 сильную сторону и 1 риск и закрепи их в конкретном действии на неделю "
        "(что усиливаю, что ограничиваю, по каким признакам пойму, что баланс соблюдён)."
    )

def _txt_house8_ruler_any(topic: str) -> str:
    return (
        "Управитель 8 дома — ключ к глубине, кризисам и трансформации: через что ты проходишь точки перелома и обновляешься. "
        "Он показывает, как ты обращаешься с темами доверия, контроля и общих ресурсов (включая границы и зависимость). "
        "Практика: выбери 1 тему для проработки на 14 дней (границы, доверие, финансы пары, страхи) и делай маленький шаг ежедневно."
    )


def _txt_house12_ruler_any(topic: str) -> str:
    return (
        "Управитель 12 дома — ключ к подсознанию и восстановлению: через что ты отпускаешь контроль и возвращаешь себе внутреннюю тишину. "
        "Он показывает, что помогает выходить из фоновой тревоги и «самосаботажа», и какие условия делают психику устойчивее. "
        "Практика: выбери 1 ритуал разгрузки на 14 дней (сон, тишина, дневник, медитация, творчество) и фиксируй состояние до/после."
    )


def _txt_house12_planet(topic: str, planet: str) -> str:
    pr = _ru_planet(planet)
    return (
        f"{pr} в 12 доме усиливает внутренние процессы: эмоции и мотивы могут работать «за кадром», влияя на решения и самочувствие. "
        "Сильная сторона — тонкая интуиция и глубина; риск — уход в избегание, усталость или размытые границы. "
        "Практика: введи один защитный стандарт (сон/режим/границы/тишина) и наблюдай 14 дней, как меняется устойчивость."
    )

def _txt_house3_ruler_any(topic: str) -> str:
    return (
        "Управитель 3 дома — ключ к навыкам, мышлению и коммуникациям: через что ты учишься, объясняешь и налаживаешь контакт. "
        "Он показывает, какие форматы обучения и общения дают быстрый прогресс, а какие перегружают или распыляют внимание. "
        "Практика: выбери 1 навык (письмо/языки/переговоры/логика) и тренируй 14 дней по 20 минут, фиксируя результат и обратную связь."
    )

def _txt_house9_ruler_any(topic: str) -> str:
    return (
        "Управитель 9 дома — ключ к смыслу, мировоззрению и траектории роста: через что ты расширяешь горизонты и находишь направление. "
        "Он показывает, что делает обучение/путешествия/идею продуктивными, а что уводит в теорию без шага в реальность. "
        "Практика: выбери 1 «линию роста» на 14 дней (курс/чтение/проект/наставник) и закрепи её ежедневным шагом 20–30 минут."
    )

def _txt_love_intimacy_generic(topic: str) -> str:
    return (
        "Этот блок описывает близость как сочетание притяжения, доверия и эмоциональной безопасности: что тебя сближает, а что закрывает. "
        "Сильная сторона — ты можешь осознанно выстраивать тепло и глубину; риск — путать близость с контролем, спасательством или тревожной проверкой. "
        "Практика: выбери один «язык близости» на 14 дней (разговор, время, прикосновения, забота, совместные планы) и наблюдай, что реально укрепляет контакт."
    )

def _txt_self_esteem_generic(topic: str) -> str:
    return (
        "Этот блок описывает самооценку как внутренний «фундамент ценности»: что даёт чувство опоры, а что легко выбивает из уверенности. "
        "Сильная сторона — можно собрать устойчивую систему поддержки; риск — мерить ценность внешними результатами или чужой оценкой. "
        "Практика: выбери 1 стандарт отношения к себе (границы, режим, забота, честность) и соблюдай 14 дней, фиксируя изменения в состоянии."
    )

def _txt_how_others_see_me_generic(topic: str) -> str:
    return (
        "Этот блок описывает, какое первое впечатление ты обычно производишь и какой «сигнал» люди считывают до того, как узнают тебя ближе. "
        "Сильная сторона — ты быстро задаёшь тон контакта; риск — закрепляться в роли, которая не всегда отражает тебя полностью. "
        "Практика: в 3 ситуациях проверь, что меняется, если осознанно поменять один параметр старта (темп, дистанция, прямота, мягкость)."
    )

def _txt_money_generic(topic: str) -> str:
    return (
        "Этот блок описывает, как ты строишь финансовую устойчивость: через ценность, навыки, привычки и отношение к ресурсам. "
        "Сильная сторона — легче понять, что монетизируется; риск — путать желание и реальную отдачу или недооценивать границы цены. "
        "Практика: выбери один денежный рычаг на 14 дней (учёт, прайс, резерв, дисциплина, переговоры) и измеряй эффект по сумме/стабильности."
    )

def _txt_polarity_balance(topic: str, side: str) -> str:
    if side == "yang":
        return (
            "Баланс полярности смещён в Ян: легче включаться в действие, проявлять инициативу и брать роль. "
            "Риск — идти вперёд без пауз и не слышать сигналов усталости/отношений. "
            "Микро-пример: в дедлайне можно ускориться так, что качество и диалог проседают. "
            "Практика: добавь «стоп-проверку» перед решениями (пауза 60 секунд: цель, последствия, ресурс)."
        )
    if side == "yin":
        return (
            "Баланс полярности смещён в Инь: сильны чувствительность, восприимчивость и умение поддерживать процесс. "
            "Риск — ждать внешнего импульса и затягивать старт. "
            "Практика: введи маленькие старты (5 минут на шаг №1) и фиксируй прогресс ежедневно."
        )
    return (
        "Баланс полярности показывает соотношение импульса действия и восприимчивости. "
        "Практика: замечай, где ты действуешь автоматически, а где ждёшь — и выравнивай через маленькие корректировки."
    )


def _txt_elements_count(topic: str, element: str, n: int) -> str:
    er = _ru_element(element)
    return (
        f"Стихия {er} выражена на уровне {n}. Это задаёт привычный способ включаться в жизнь: "
        "через смысл/действие (Огонь), практику/материальность (Земля), идеи/контакты (Воздух), чувства/интуицию (Вода). "
        "Практика: в сложной ситуации попробуй «перевести» задачу на язык этой стихии и посмотри, что упростится."
    )


def _txt_elements_dominant(topic: str, element: str) -> str:
    er = _ru_element(element)
    return (
        f"Доминирует стихия {er}: она чаще всего ведёт тебя к решениям. "
        "Сильная сторона — быстро включаешься в «родной» стиль. Риск — недооценивать противоположные подходы. "
        "Практика: добавь один компенсирующий шаг из другой стихии (план/контакт/чувства/действие) перед финальным выбором."
    )


def _txt_elements_deficient(topic: str, element: str) -> str:
    er = _ru_element(element)
    return (
        f"Дефицит стихии {er}: этот способ реагирования может требовать сознательной тренировки. "
        "Не слабость, а зона развития: её легче встроить через простые ритуалы. "
        "Практика: выбери 1 привычку на 10 минут в день, которая добавляет {er} (например: телесная рутина, общение, эмоции, действие)."
    )


def _txt_modality_dominant(topic: str, modality: str) -> str:
    mr = _ru_modality(modality)
    if modality == "fixed":
        plus = "устойчивость, доведение до результата, верность выбранному"
        risk = "застревание, сопротивление переменам"
    elif modality == "cardinal":
        plus = "инициирование, лидерство, запуск процессов"
        risk = "перегорание на старте, бросать на полпути"
    else:
        plus = "адаптация, обучение, настройка по ходу"
        risk = "распыление, трудность с финализацией"
    return (
        f"Доминирует модальность {mr}: сильные стороны — {plus}. Риски — {risk}. "
        "Практика: выбери один процесс, где нужен баланс, и добавь недостающую стадию (старт/стабилизация/адаптация) на неделю."
    )


# -----------------------------
# ASC / house1-core templates (NEW)
# -----------------------------
def _career_lever_for_planet(p: str) -> str:
    return {
        "sun": "лидерство, видимость, роль и ответственность",
        "moon": "забота о людях, сервис, эмоциональный интеллект",
        "mercury": "коммуникации, анализ, тексты, переговоры",
        "venus": "эстетика, отношения, ценность, клиентский опыт",
        "mars": "действие, конкуренция, скорость, внедрение",
        "jupiter": "масштаб, наставничество, репутация",
        "saturn": "структура, дисциплина, долгий цикл, надёжность",
        "uranus": "инновации, свобода, технологии, нестандарт",
        "neptune": "видение/смысл/креатив, эмпатия; риск тумана",
        "pluto": "влияние, глубина, трансформация, кризисы",
    }.get(p, "ключевая функция результата")
# -----------------------------
# Career / MC / house10 templates (NEW)
# -----------------------------
def _txt_angle_mc(topic: str) -> str:
    return (
        "MC (Середина Неба) — вектор карьеры и общественного образа: как ты хочешь быть видим(а) и за что тебя ценят «снаружи». "
        "Он связан с направлением роста, статусом и типом задач, где проще получать признание. "
        "Практика: сформулируй 1 фразу «за что я хочу быть известен(на)» и проверь, какие действия реально поддерживают её каждую неделю."
    )


def _txt_angle_mc_sign(topic: str, sign: str) -> str:
    sr = _ru_sign(sign)
    tr = SIGN_TRAITS_RU.get(sign, {"plus": "типичные качества", "risk": "типичные перекосы"})
    return (
        f"MC в знаке {sr}: карьерный стиль и способ заявлять о результате окрашены качествами знака. "
        f"Сильная сторона: {tr['plus']}. Риск: {tr['risk']}. "
        "Практика: выбери 1 KPI результата (качество/скорость/доход/влияние) и веди его 14 дней, удерживая сильную сторону без перегиба."
    )

def _txt_house5_ruler_any(topic: str) -> str:
    return (
        "Управитель 5 дома — ключ к творчеству, удовольствию и самовыражению: через что включается вдохновение и что даёт радость процесса. "
        "Он показывает, какие формы творчества питают тебя, а какие быстро выжигают или превращаются в обязанность. "
        "Практика: выбери 1 творческий ритуал на 14 дней (20–30 минут) и фиксируй: энергия до/после, лёгкость, результат."
    )

def _txt_house4_ruler_any(topic: str) -> str:
    return (
        "Управитель 4 дома — ключ к внутренней опоре и эмоциональной безопасности: через что ты восстанавливаешься и чувствуешь «дом». "
        "Он показывает, какие условия успокаивают нервную систему, а какие делают фон тревожным или нестабильным. "
        "Практика: выбери 1 ритуал поддержки (сон/тишина/общение/пространство/границы) и соблюдай 14 дней, отмечая изменения в состоянии."
    )

def _txt_house7_ruler_any(topic: str) -> str:
    return (
        "Управитель 7 дома — ключ к партнёрствам и браку: через какие качества и сценарии ты выбираешь людей и строишь союз. "
        "Он показывает, что укрепляет доверие и договорённости, а что делает отношения нестабильными. "
        "Практика: выбери 1 правило партнёрства (границы, честность, роли, деньги, ответственность) и проверь 14 дней, как оно влияет на контакт."
    )


def _txt_house7_ruler_planet(topic: str, planet: str) -> str:
    pr = _ru_planet(planet)
    return (
        f"Управитель 7 дома — {pr}: стиль партнёрства и критерии «мой человек» идут через функции этой планеты. "
        "Сильная сторона — проще осознанно выстраивать отношения через её качества. "
        "Риск — попадать в автоматический сценарий (спасать, контролировать, спорить, уходить в холод). "
        "Практика: в общении выбери 1 настройку по планете (тон, ясность, границы, инициатива) и удерживай её неделю."
    )

def _txt_house10(topic: str) -> str:
    return (
        "10 дом — зона карьеры, статуса и видимого результата: то, как ты строишь достижения и какие роли легче закрепляются. "
        "Это не только работа, но и репутация: за что тебя считают «надёжным(ой)» и где ожидают ответственности. "
        "Практика: выдели 1 ключевой результат на месяц и привяжи к нему еженедельный шаг (план → выполнение → обзор)."
    )


def _txt_house10_cusp_sign_any(topic: str) -> str:
    return (
        "Куспид 10 дома показывает стиль достижения: как ты поднимаешь статус и за счёт чего закрепляешь результат. "
        "Он описывает «манеру успеха»: через дисциплину, харизму, пользу, связи или смысл. "
        "Практика: опиши свой рабочий стиль в 2 фразы и проверь, какие задачи усиливают репутацию, а какие её размывают."
    )


def _txt_house10_cusp_sign(topic: str, sign: str) -> str:
    sr = _ru_sign(sign)
    tr = SIGN_TRAITS_RU.get(sign, {"plus": "типичные качества", "risk": "типичные перекосы"})
    return (
        f"Куспид 10 дома в {sr}: способ добиваться статуса и результата идёт через качества {sr}. "
        f"Сильная сторона: {tr['plus']}. Риск: {tr['risk']}. "
        "Практика: выбери 1 привычку «по знаку» и закрепи её как рабочий стандарт (как принимаю решения, как сдаю результат, как общаюсь)."
    )


def _txt_house10_ruler_any(topic: str) -> str:
    return (
        "Управитель 10 дома — ключ к карьерной траектории: через какие мотивы и навыки ты выходишь на статус и признание. "
        "Он показывает, что укрепляет репутацию и какие условия делают рост стабильным. "
        "Практика: найди 1 повторяющийся карьерный сценарий (успех/ошибка) и выдели правило, которое ты готов(а) соблюдать всегда."
    )

def _txt_house2_ruler_any(topic: str) -> str:
    return (
        "Управитель 2 дома — ключ к финансовой устойчивости: через какие навыки, привычки и ценности ты легче накапливаешь ресурсы. "
        "Он показывает, что укрепляет доход, а что делает денежный поток нестабильным. "
        "Практика: выбери 1 правило денег (учёт/прайс/резерв/границы) и соблюдай его 14 дней, фиксируя результат."
    )

def _txt_house10_ruler_planet(topic: str, planet: str) -> str:
    pr = _ru_planet(planet)
    lever = _career_lever_for_planet(planet)
    return (
        f"Управитель 10 дома — {pr}: карьерный рост лучше идёт через {lever}. "
        "Сильная сторона — можно сознательно развивать эту функцию как главный рычаг. "
        "Риск — перегибать роль (например, давить, спасать, слишком контролировать). "
        "Практика: выбери 1 навык по этой планете и прокачай его 14 дней с измеримой метрикой."
    )


def _txt_house10_ruler_planet_sign_any(topic: str, planet: str) -> str:
    pr = _ru_planet(planet)
    return (
        f"{pr} как управитель 10 дома: стиль карьеры зависит от того, в каком «режиме» проявляется {pr} (знак/аспекты). "
        "Сильная сторона — можно точнее настроить позиционирование и рабочий стиль. "
        "Практика: перед важной задачей выбери 1 настройку поведения (структура/темп/диалог/видимость) и удерживай её до сдачи результата."
    )


def _txt_house10_ruler_aspects_present(topic: str, planet: str) -> str:
    pr = _ru_planet(planet)
    return (
        f"Аспекты управителя 10 дома ({pr}) показывают, что усиливает или усложняет карьерную реализацию. "
        "Гармоничные аспекты дают естественный ресурс, напряжённые требуют стратегии и навыка управления рисками. "
        "Практика: выбери 1 стрессовую точку (дедлайн/конфликт/неясные ожидания) и заранее задай правило, как ты действуешь в таких ситуациях."
    )


def _txt_house10_ruler_aspect(topic: str, ruler: str, aspect: str, other: str) -> str:
    rr = _ru_planet(ruler)
    orr = _ru_planet(other)
    ar = _ru_aspect(aspect)
    eff = _aspect_effect(aspect)
    return (
        f"Управитель 10 дома ({rr}) в аспекте {ar} с {orr}: это влияет на карьерные решения и стиль достижения. "
        f"Обычно это {eff}. "
        "Практика: опиши 1 повторяющийся карьерный сценарий (триггер → реакция → результат) и добавь одно правило, которое стабилизирует итог."
    )


def _txt_house10_planet(topic: str, planet: str) -> str:
    pr = _ru_planet(planet)
    lever = _career_lever_for_planet(planet)
    return (
        f"{pr} в 10 доме усиливает видимость этой функции в карьере: люди считывают тебя через {lever}. "
        "Сильная сторона — проще получать признание за результаты по этой теме. "
        "Риск — перегружаться ожиданиями или застревать в роли. "
        "Практика: выбери 1 стандарт качества/границ (что делаю всегда, а что не беру) и закрепи его как правило."
    )

def _txt_angle_asc(topic: str) -> str:
    return (
        "ASC (Асцендент) — твоя «первая подача»: как ты входишь в контакт и как тебя считывают в начале. "
        "Он влияет на манеру поведения, темп, язык тела и то, как ты запускаешь новые ситуации. "
        "Практика: в ближайшем общении проверь, что ты транслируешь на старте (тон/скорость/границы) и как это влияет на ответ людей."
    )


def _txt_angle_asc_sign(topic: str, sign: str) -> str:
    sr = _ru_sign(sign)
    tr = SIGN_TRAITS_RU.get(sign, {"plus": "типичные качества", "risk": "типичные перекосы"})
    return (
        f"ASC в знаке {sr}: первое впечатление и стартовые реакции окрашены качествами знака. "
        f"Сильная сторона: {tr['plus']}. Риск: {tr['risk']}. "
        "Практика: выбери один «мягкий» регулятор (темп, дистанция, формулировки) и подстрой его, чтобы сильная сторона работала без перегиба."
    )


def _txt_house1_cusp_sign_any(topic: str) -> str:
    return (
        "Куспид 1 дома показывает стиль самопрезентации: как ты заявляешь о себе, входишь в роль и берёшь инициативу. "
        "Это не «маска», а стартовая стратегия поведения. "
        "Практика: в новых ситуациях заранее выбери 1 опорное правило (что считаю нормой, где границы, какой темп) и придерживайся его."
    )


def _txt_house1_cusp_sign(topic: str, sign: str) -> str:
    sr = _ru_sign(sign)
    tr = SIGN_TRAITS_RU.get(sign, {"plus": "типичные качества", "risk": "типичные перекосы"})
    return (
        f"Куспид 1 дома в {sr}: самопрезентация и старт инициативы идут через качества {sr}. "
        f"Сильная сторона: {tr['plus']}. Риск: {tr['risk']}. "
        "Практика: опиши свою «стартовую формулу» в 1–2 фразы и проверь, как она меняет реакцию людей."
    )


def _txt_house1_ruler_any(topic: str) -> str:
    return (
        "Управитель 1 дома — ключ к тому, как работает твой стиль проявления: через какие мотивы ты действуешь и где ищешь опору. "
        "Он помогает понять, что усиливает уверенность и что сбивает контакт. "
        "Практика: отслеживай 7 дней: что запускает инициативу и что её гасит — и сохрани 1 рабочий паттерн."
    )


def _txt_house1_ruler_planet(topic: str, planet: str) -> str:
    pr = _ru_planet(planet)
    return (
        f"Управитель 1 дома — {pr}: самопрезентация и «я-стиль» идут через функции этой планеты. "
        "Сильная сторона — проще проявлять качества планеты осознанно. Риск — отождествляться с одной ролью. "
        "Практика: выбери 1 ситуацию, где ты хочешь звучать увереннее, и включи качество планеты в конкретном действии."
    )


def _txt_house1_ruler_planet_sign_any(topic: str, planet: str) -> str:
    pr = _ru_planet(planet)
    return (
        f"{pr} как управитель 1 дома: то, «как ты себя делаешь», зависит от того, в каком стиле проявляется {pr} (знак/аспекты). "
        "Сильная сторона — легче настраивать образ и тон общения через осознанное поведение. "
        "Практика: перед важным контактом выбери 1 настройку (темп, уверенность, аргументы, мягкость) и удерживай её весь разговор."
    )


def _txt_house1_ruler_aspects_present(topic: str, planet: str) -> str:
    pr = _ru_planet(planet)
    return (
        f"Аспекты управителя 1 дома ({pr}) показывают, что усиливает или усложняет твою самопрезентацию. "
        "Гармоничные аспекты дают естественный ресурс, напряжённые требуют навыка управления реакцией. "
        "Практика: найди 1 повторяющийся триггер (критика/дедлайн/сравнение) и заранее задай правило поведения для стабильного образа."
    )


def _txt_house1_ruler_aspect(topic: str, ruler: str, aspect: str, other: str) -> str:
    rr = _ru_planet(ruler)
    orr = _ru_planet(other)
    ar = _ru_aspect(aspect)
    eff = _aspect_effect(aspect)
    return (
        f"Управитель 1 дома ({rr}) в аспекте {ar} с {orr}: это влияет на манеру проявляться и на то, как считывают твои намерения. "
        f"Обычно это {eff}. "
        "Практика: в ситуациях «на публике» выбери один якорь (пауза перед ответом, ясное «да/нет», спокойный темп) и тренируй 7 дней."
    )


def _txt_house1_planet(topic: str, planet: str) -> str:
    pr = _ru_planet(planet)
    return (
        f"{pr} в 1 доме усиливает заметность качеств планеты в образе и поведении. "
        "Сильная сторона — быстрее проявляешь эту функцию; риск — реагировать ею автоматически, особенно под стрессом. "
        "Практика: определи 1 полезную форму проявления планеты и 1 нежелательную — и введи «стоп-сигнал» для контроля."
    )


# -----------------------------
# Existing: groups/aspects/planet-sign-house (kept)
# -----------------------------
def _txt_group_count(group: str, n: str) -> str:
    gr = _ru_group(group)
    focus = {
        "luminaries": "мотивация, направление и выгорание/ресурс",
        "inner": "навыки, сделки, коммуникации и скорость выполнения",
        "social": "структура, статус, правила и управляемый рост",
        "outer": "инновации, стратегия, изменения и работа с неопределённостью",
    }.get(group, "фокус")
    return (
        f"Группа планет {gr} выражена (count={n}): усиливается {focus}. "
        "Практика: выдели 1 поведение этой группы и преврати в конкретную привычку на 14 дней (ритм, метрика, обратная связь)."
    )


def _txt_aspect_pair(p1: str, aspect: str, p2: str) -> str:
    pr1 = _ru_planet(p1)
    pr2 = _ru_planet(p2)
    ar = _ru_aspect(aspect)
    eff = _aspect_effect(aspect)
    return (
        f"Аспект {pr1} {ar} {pr2}: взаимодействие функций. Обычно это {eff}. "
        "Практика: опиши 1 повторяющийся сценарий (триггер → реакция → результат) и заранее задай правило поведения."
    )


def _txt_planet_sign_house(p: str, s: str, h: str) -> str:
    pr = _ru_planet(p)
    sr = _ru_sign(s)
    ht = _house_theme(h)
    return (
        f"{pr} в {sr} в {ht}: это описывает, как функция планеты проявляется в задачах дома. "
        "Практика: выбери 1 ситуацию по теме дома и проверь, что будет, если проявить качество знака более осознанно."
    )


def synth_text(key: str, topic: str) -> str:
    # --- ASC / house1 core
    if key == "natal.ancestral_topics.generic":
        return _txt_ancestral_topics_generic(topic)

    if key == "natal.past_lives_symbolic.generic":
        return _txt_past_lives_symbolic_generic(topic)

    if key == "natal.house.8.ruler.any":
        return _txt_house8_ruler_any(topic)

    if key == "natal.house.12.ruler.any":
        return _txt_house12_ruler_any(topic)

    m = re.fullmatch(r"natal\.house\.12\.planet\.([a-z_]+)", key)
    if m:
        return _txt_house12_planet(topic, m.group(1))

    if key == "natal.talents.generic":
        return _txt_talents_generic(topic)

    if key == "natal.house.3.ruler.any":
        return _txt_house3_ruler_any(topic)

    if key == "natal.house.9.ruler.any":
        return _txt_house9_ruler_any(topic)

    if key == "natal.house.5.ruler.any":
        return _txt_house5_ruler_any(topic)
    
    if key == "natal.house.4.ruler.any":
        return _txt_house4_ruler_any(topic)
    
    if key == "natal.love_intimacy.generic":
        return _txt_love_intimacy_generic(topic)

    if key == "natal.house.7.ruler.any":
        return _txt_house7_ruler_any(topic)

    m = re.fullmatch(r"natal\.house\.7\.ruler\.([a-z_]+)$", key)
    if m:
        return _txt_house7_ruler_planet(topic, m.group(1))
    
    if key == "natal.self_esteem.generic":
        return _txt_self_esteem_generic(topic)
    
    if key == "natal.money.generic":
        return _txt_money_generic(topic)
    
    if key == "natal.house.2.ruler.any":
        return _txt_house2_ruler_any(topic)
    
    if key == "natal.angle.asc":
        return _txt_angle_asc(topic)
    
    if key == "natal.how_others_see_me.generic":
        return _txt_how_others_see_me_generic(topic)

    m = re.fullmatch(r"natal\.angle\.asc\.sign\.([a-z_]+)", key)
    if m:
        return _txt_angle_asc_sign(topic, m.group(1))

    if key == "natal.house.1.cusp.sign.any":
        return _txt_house1_cusp_sign_any(topic)

    m = re.fullmatch(r"natal\.house\.1\.cusp\.sign\.([a-z_]+)", key)
    if m:
        return _txt_house1_cusp_sign(topic, m.group(1))

    if key == "natal.house.1.ruler.any":
        return _txt_house1_ruler_any(topic)

    m = re.fullmatch(r"natal\.house\.1\.ruler\.([a-z_]+)$", key)
    if m:
        return _txt_house1_ruler_planet(topic, m.group(1))

    m = re.fullmatch(r"natal\.house\.1\.ruler\.([a-z_]+)\.sign\.any", key)
    if m:
        return _txt_house1_ruler_planet_sign_any(topic, m.group(1))

    m = re.fullmatch(r"natal\.house\.1\.ruler\.([a-z_]+)\.aspects\.present", key)
    if m:
        return _txt_house1_ruler_aspects_present(topic, m.group(1))

    m = re.fullmatch(r"natal\.house\.1\.ruler\.([a-z_]+)\.aspect\.([a-z_]+)\.([a-z_]+)", key)
    if m:
        return _txt_house1_ruler_aspect(topic, m.group(1), m.group(2), m.group(3))

    m = re.fullmatch(r"natal\.house\.1\.planet\.([a-z_]+)", key)
    if m:
        return _txt_house1_planet(topic, m.group(1))

    # --- Career / MC / house10 core
    if key == "natal.angle.mc":
        return _txt_angle_mc(topic)

    m = re.fullmatch(r"natal\.angle\.mc\.sign\.([a-z_]+)", key)
    if m:
        return _txt_angle_mc_sign(topic, m.group(1))

    if key == "natal.house.10":
        return _txt_house10(topic)

    if key == "natal.house.10.cusp.sign.any":
        return _txt_house10_cusp_sign_any(topic)

    m = re.fullmatch(r"natal\.house\.10\.cusp\.sign\.([a-z_]+)", key)
    if m:
        return _txt_house10_cusp_sign(topic, m.group(1))

    if key == "natal.house.10.ruler.any":
        return _txt_house10_ruler_any(topic)

    m = re.fullmatch(r"natal\.house\.10\.ruler\.([a-z_]+)$", key)
    if m:
        return _txt_house10_ruler_planet(topic, m.group(1))

    m = re.fullmatch(r"natal\.house\.10\.ruler\.([a-z_]+)\.sign\.any", key)
    if m:
        return _txt_house10_ruler_planet_sign_any(topic, m.group(1))

    m = re.fullmatch(r"natal\.house\.10\.ruler\.([a-z_]+)\.aspects\.present", key)
    if m:
        return _txt_house10_ruler_aspects_present(topic, m.group(1))

    m = re.fullmatch(r"natal\.house\.10\.ruler\.([a-z_]+)\.aspect\.([a-z_]+)\.([a-z_]+)", key)
    if m:
        return _txt_house10_ruler_aspect(topic, m.group(1), m.group(2), m.group(3))

    m = re.fullmatch(r"natal\.house\.10\.planet\.([a-z_]+)", key)
    if m:
        return _txt_house10_planet(topic, m.group(1))

    # --- topic-core
    m = re.fullmatch(r"natal\.sign\.([a-z_]+)\.present", key)
    if m:
        return _txt_sign_present(topic, m.group(1))

    m = re.fullmatch(r"natal\.polarity\.balance\.(yang|yin)", key)
    if m:
        return _txt_polarity_balance(topic, m.group(1))

    m = re.fullmatch(r"natal\.elements\.([a-z_]+)\.count\.([0-9]+)", key)
    if m:
        return _txt_elements_count(topic, m.group(1), int(m.group(2)))

    m = re.fullmatch(r"natal\.elements\.dominant\.([a-z_]+)", key)
    if m:
        return _txt_elements_dominant(topic, m.group(1))

    m = re.fullmatch(r"natal\.elements\.deficient\.([a-z_]+)", key)
    if m:
        return _txt_elements_deficient(topic, m.group(1))

    m = re.fullmatch(r"natal\.modality\.dominant\.(cardinal|fixed|mutable)", key)
    if m:
        return _txt_modality_dominant(topic, m.group(1))

    # --- previously supported
    m = re.fullmatch(r"natal\.planet\.([a-z_]+)\.sign\.([a-z_]+)\.house\.(\d+)", key)
    if m:
        return _txt_planet_sign_house(m.group(1), m.group(2), m.group(3))

    m = re.fullmatch(r"natal\.planets\.group\.([a-z_]+)\.count\.([0-9]+)", key)
    if m:
        return _txt_group_count(m.group(1), m.group(2))

    m = re.fullmatch(r"natal\.aspect\.([a-z_]+)\.([a-z_]+)\.([a-z_]+)", key)
    if m:
        return _txt_aspect_pair(m.group(1), m.group(2), m.group(3))

    return _txt_default(topic, key)


def select_short_keys(used_blocks: list[dict[str, Any]], opt: Opt) -> list[str]:
    rows: list[tuple[int, str]] = []
    for b in used_blocks:
        key = b.get("key")
        text = b.get("text") or ""
        if not isinstance(key, str):
            continue
        if not isinstance(text, str):
            text = str(text)
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
        f"-- Overrides from debug shortest used blocks (topic_category={opt.topic})",
        f"-- Source JSON: {opt.in_path.as_posix()}",
        f"-- Filter: len(text)<= {opt.max_len}, max_keys={opt.max_keys}",
        "BEGIN;",
    ]
    for k in keys:
        out.append(upsert_overwrite(k, synth_text(k, opt.topic), opt))
    out += ["COMMIT;", ""]
    return "\n\n".join(out)


def parse_args() -> Opt:
    p = argparse.ArgumentParser(
        description="Generate topic-specific overrides (SQL) from debug=2 JSON shortest used blocks."
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
    debug_json = json.loads(opt.in_path.read_text(encoding="utf-8-sig"))
    used_blocks = _extract_used_blocks(debug_json, opt.topic)
    keys = select_short_keys(used_blocks, opt)
    sql = build_sql(keys, opt)
    opt.out_path.write_text(sql, encoding="utf-8")
    print(f"OK: generated {len(keys)} keys -> {opt.out_path}")


if __name__ == "__main__":
    main()