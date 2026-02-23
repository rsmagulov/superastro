# FILE: C:\Projects\superastro\astroprocessor\tools\seed\generate_career_overrides_from_debug_shortest.py
# (полный файл — замени содержимое 1:1)

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
    "conjunction": "соединении",
    "sextile": "секстиле",
    "square": "квадрате",
    "trine": "тригоне",
    "opposition": "оппозиции",
}

ELEMENTS_RU = {
    "fire": "Огонь",
    "earth": "Земля",
    "air": "Воздух",
    "water": "Вода",
}

MODALITY_RU = {
    "cardinal": "кардинальный",
    "fixed": "фиксированный",
    "mutable": "мутабельный",
}

HOUSE_THEME_RU = {
    "1": "личность и проявление",
    "2": "деньги и самооценка",
    "3": "мышление и навыки",
    "4": "дом и род",
    "5": "творчество и радость",
    "6": "работа и здоровье",
    "7": "партнёрство",
    "8": "кризисы и трансформация",
    "9": "смысл и рост",
    "10": "карьера и статус",
    "11": "сообщества и цели",
    "12": "подсознание и восстановление",
}

SIGN_TRAITS_RU: dict[str, dict[str, str]] = {
    "aries": {"plus": "инициатива, смелость, прямота", "risk": "импульсивность, конфликты, спешка"},
    "taurus": {"plus": "устойчивость, терпение, практичность", "risk": "инертность, упрямство, страх перемен"},
    "gemini": {"plus": "гибкость, любознательность, коммуникации", "risk": "поверхностность, распыление, нервозность"},
    "cancer": {"plus": "забота, интуиция, эмоциональная глубина", "risk": "обидчивость, тревожность, зависимость"},
    "leo": {"plus": "творчество, лидерство, щедрость", "risk": "гордыня, драматизация, потребность в признании"},
    "virgo": {"plus": "точность, анализ, сервис", "risk": "критичность, тревожность, перфекционизм"},
    "libra": {"plus": "дипломатия, чувство меры, эстетика", "risk": "колебания, зависимость от одобрения, избегание конфликтов"},
    "scorpio": {"plus": "интенсивность, глубина, воля", "risk": "контроль, крайности, ревность"},
    "sagittarius": {"plus": "оптимизм, смысл, расширение горизонтов", "risk": "прямолинейность, обещания без выполнения, избыток риска"},
    "capricorn": {"plus": "дисциплина, стратегия, ответственность", "risk": "жёсткость, перегруз, холодность"},
    "aquarius": {"plus": "оригинальность, свобода, идеи", "risk": "отстранённость, упрямство, бунт ради бунта"},
    "pisces": {"plus": "эмпатия, воображение, тонкость", "risk": "уход в иллюзии, размытые границы, усталость"},
}


@dataclass(frozen=True)
class Opt:
    in_path: Path
    out_path: Path
    topic: str
    locale: str
    max_len: int
    max_keys: int
    priority: int


def _ru_planet(p: str) -> str:
    return PLANETS_RU.get(p, p)


def _ru_sign(s: str) -> str:
    return SIGNS_RU.get(s, s)


def _ru_aspect(a: str) -> str:
    return ASPECTS_RU.get(a, a)


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


# -----------------------------
# House templates (unified)
# -----------------------------
_HOUSE_RULER_ANY_OVERRIDES: dict[int, str] = {
    1: (
        "Управитель 1 дома — ключ к самопрезентации и стилю действий: через что ты проявляешься и как тебя считывают. "
        "Он показывает, что делает образ цельным, а что даёт конфликт между «как хочется» и «как выглядит». "
        "Практика: выбери один «якорь проявления» на 7 дней (темп, границы, ясность речи) и наблюдай реакцию среды."
    ),
    2: (
        "Управитель 2 дома — ключ к деньгам, самооценке и ресурсу: через что ты стабильно зарабатываешь и что поддерживает чувство ценности. "
        "Он показывает, где легче удерживать доход и где возникают провалы (импульсивные траты, обесценивание, страх дефицита). "
        "Практика: выбери 1 финансовое правило на 14 дней (процент на накопления/лимит трат/учёт) и замерь эффект."
    ),
    3: (
        "Управитель 3 дома — ключ к навыкам, мышлению и коммуникациям: через что ты учишься, объясняешь и налаживаешь контакт. "
        "Он показывает, какие форматы обучения и общения дают быстрый прогресс, а какие перегружают или распыляют внимание. "
        "Практика: выбери 1 навык (письмо/языки/переговоры/логика) и тренируй 14 дней по 20 минут, фиксируя результат."
    ),
    4: (
        "Управитель 4 дома — ключ к дому, внутренней опоре и эмоциональной безопасности: что даёт чувство «своего места». "
        "Он показывает семейные сценарии и то, как ты восстанавливаешься, когда перегружен(а). "
        "Практика: введи 1 домашний ритуал опоры на 14 дней (сон/тишина/границы/разговор) и отслеживай состояние."
    ),
    5: (
        "Управитель 5 дома — ключ к творчеству, удовольствию и самовыражению: через что ты «зажигаешься» и создаёшь. "
        "Он показывает, где талант превращается в результат, а где включается страх оценки или прокрастинация. "
        "Практика: 14 дней делай маленький творческий шаг ежедневно (20–30 минут) и собери мини-портфолио."
    ),
    7: (
        "Управитель 7 дома — ключ к партнёрству: кого ты выбираешь, как строишь договорённости и где возникают конфликты. "
        "Он показывает, через какую модель взаимодействия отношения становятся устойчивыми. "
        "Практика: сформулируй 3 правила союза (границы/ответственность/поддержка) и проверь их в реальных диалогах 7 дней."
    ),
    8: (
        "Управитель 8 дома — ключ к глубине, кризисам и трансформации: через что ты проходишь точки перелома и обновляешься. "
        "Он показывает, как ты обращаешься с темами доверия, контроля и общих ресурсов (включая границы и зависимость). "
        "Практика: выбери 1 тему для проработки на 14 дней (границы, доверие, финансы пары, страхи) и делай шаг ежедневно."
    ),
    9: (
        "Управитель 9 дома — ключ к смыслу, мировоззрению и траектории роста: через что ты расширяешь горизонты и находишь направление. "
        "Он показывает, какие идеи и знания становятся «осевыми», а какие уводят в теорию без практики. "
        "Практика: выбери 1 большую тему (учёба/путешествия/публикации) и сделай один конкретный шаг в неделю 4 недели подряд."
    ),
    10: (
        "Управитель 10 дома — ключ к карьере и статусу: через что ты строишь результат, репутацию и долгую траекторию. "
        "Он показывает, где легче взять лидерство, а где важнее система, дисциплина и правила игры. "
        "Практика: выбери 1 стандарт качества/границ на 14 дней (что делаю всегда, а что не беру) и закрепи как правило."
    ),
    12: (
        "Управитель 12 дома — ключ к подсознанию и восстановлению: через что ты отпускаешь контроль и возвращаешь себе внутреннюю тишину. "
        "Он показывает, что помогает выходить из фоновой тревоги и «самосаботажа», и какие условия делают психику устойчивее. "
        "Практика: выбери 1 ритуал разгрузки на 14 дней (сон, тишина, дневник, медитация, творчество) и фиксируй до/после."
    ),
}


def _txt_house_ruler_any(topic: str, house: int) -> str:
    """Unified template for `natal.house.<N>.ruler.any` to avoid default fallback shrinking meanings."""
    if house in _HOUSE_RULER_ANY_OVERRIDES:
        return _HOUSE_RULER_ANY_OVERRIDES[house]
    ht = _house_theme(str(house))
    return (
        f"Управитель {ht} — ключевой маркер тем дома: через что ты решаешь задачи этого поля жизни. "
        "Он помогает понять, какой стиль действий стабилизирует результат. "
        "Практика: выбери 1 повторяющуюся задачу по теме дома и введи одно правило (границы/темп/коммуникации) на 14 дней."
    )



def _txt_house_ruler_planet(topic: str, house: int, ruler: str) -> str:
    """
    Unified template for `natal.house.<N>.ruler.<planet>`
    """
    rr = _ru_planet(ruler)
    ht = _house_theme(str(house))

    # tiny special-cases to preserve meaning for core axes
    if house == 1:
        return (
            f"Управитель 1 дома — {rr}. Это влияет на самопрезентацию и стиль действий. "
            "Сильная сторона — можно быстро включаться и вести; риск — действовать слишком автоматически. "
            "Практика: выбери один «якорь» контроля (пауза, ясное «да/нет», спокойный темп) и тренируй 7 дней."
        )

    if house == 10:
        return (
            f"Управитель 10 дома — {rr}. Это влияет на карьерную стратегию и то, как ты достигаешь результата. "
            "Сильная сторона — можно построить устойчивую траекторию; риск — застревать в роли или перегружаться. "
            "Практика: выбери 1 стандарт качества/границ и удерживай его 14 дней."
        )

    return (
        f"Управитель {ht} — {rr}. Это показывает, через какую функцию ты решаешь задачи дома. "
        "Сильная сторона — яснее становится стратегия; риск — повторять один сценарий вместо выбора. "
        "Практика: выбери 1 ситуацию по теме дома и заранее задай правило поведения на неделю."
    )


def _txt_house_ruler_planet_sign_any(topic: str, house: int, ruler: str) -> str:
    """
    Unified template for `natal.house.<N>.ruler.<planet>.sign.any`
    """
    rr = _ru_planet(ruler)
    ht = _house_theme(str(house))
    return (
        f"Управитель {ht} ({rr}) в определённом знаке задаёт стиль решений по теме дома: темп, мотивацию и привычные реакции. "
        "Сильная сторона — устойчивый стиль; риск — шаблонные реакции в стрессе. "
        "Практика: 7 дней отмечай, где этот стиль помогает, а где мешает — и введи одну корректировку."
    )


def _txt_house_ruler_aspects_present(topic: str, house: int, ruler: str) -> str:
    """
    Unified template for `natal.house.<N>.ruler.<planet>.aspects.present`
    """
    rr = _ru_planet(ruler)
    ht = _house_theme(str(house))
    return (
        f"Управитель {ht} ({rr}) имеет значимые аспекты: задачи дома связаны с другими функциями карты. "
        "Сильная сторона — многогранность; риск — внутренние конфликты, влияющие на решения. "
        "Практика: опиши 1 повторяющийся сценарий по теме дома и добавь одно стабилизирующее правило."
    )


def _txt_house_ruler_aspect(topic: str, house: int, ruler: str, aspect: str, other: str) -> str:
    """
    Unified template for `natal.house.<N>.ruler.<planet>.aspect.<aspect>.<other>`
    """
    rr = _ru_planet(ruler)
    orr = _ru_planet(other)
    ar = _ru_aspect(aspect)
    ht = _house_theme(str(house))
    eff = _aspect_effect(aspect)
    return (
        f"Управитель {ht} ({rr}) в аспекте {ar} с {orr}: это влияет на то, как ты решаешь задачи дома. "
        f"Обычно это {eff}. "
        "Практика: опиши 1 сценарий (триггер → реакция → итог) и заранее задай правило, которое улучшает итог."
    )

def _txt_house(topic: str, house: int) -> str:
    ht = _house_theme(str(house))
    return (
        f"{ht}: это основная тема дома — где разворачиваются важные сценарии и задачи. "
        "Сильная сторона — можно выстроить устойчивую стратегию; риск — реагировать по привычке и терять ресурс. "
        "Практика: выбери 1 повторяющуюся ситуацию по теме дома и задай правило на 7 дней "
        "(границы/темп/приоритет/коммуникация), затем оцени результат."
    )

def _txt_house_planet(topic: str, house: int, planet: str) -> str:
    """Unified template for `natal.house.<N>.planet.<planet>` with small per-house special cases."""
    pr = _ru_planet(planet)
    ht = _house_theme(str(house))

    if house == 10:
        lever = _career_lever_for_planet(planet)
        return (
            f"{pr} в {ht} усиливает видимость этой функции в карьере: люди считывают тебя через {lever}. "
            "Сильная сторона — проще получать признание за результаты по этой теме. "
            "Риск — перегружаться ожиданиями или застревать в роли. "
            "Практика: выбери 1 стандарт качества/границ (что делаю всегда, а что не беру) и закрепи его как правило."
        )

    if house == 12:
        return (
            f"{pr} в {ht} усиливает внутренние процессы: эмоции и мотивы могут работать «за кадром», влияя на решения и самочувствие. "
            "Сильная сторона — тонкая интуиция и глубина; риск — уход в избегание, усталость или размытые границы. "
            "Практика: введи один защитный стандарт (сон/режим/границы/тишина) и наблюдай 14 дней, как меняется устойчивость."
        )

    if house == 1:
        return (
            f"{pr} в {ht} усиливает заметность качеств планеты в образе и поведении. "
            "Сильная сторона — быстрее проявляешь эту функцию; риск — реагировать ею автоматически, особенно под стрессом. "
            "Практика: определи 1 полезную форму проявления планеты и 1 нежелательную — и введи «стоп-сигнал» для контроля."
        )

    return (
        f"{pr} в {ht}: планетная функция проявляется в задачах дома. "
        "Сильная сторона — легче действовать в этой теме; риск — перегруз или фиксация на сценарии дома. "
        "Практика: выбери 1 ситуацию по теме дома и заранее задай правило поведения (границы/темп/приоритеты) на неделю."
    )

def _txt_house_cusp_sign_any(topic: str, house: int) -> str:
    ht = _house_theme(str(house))
    return (
        f"Куспид {ht} показывает, как ты входишь в ситуации этой сферы и какой стиль запускает события. "
        "Сильная сторона — можно осознанно выбрать стратегию; риск — действовать на автопилоте. "
        "Практика: выбери 1 повторяющуюся ситуацию по теме дома и заранее задай правило (темп/границы/приоритеты) на неделю."
    )


def _txt_house_cusp_sign(topic: str, house: int, sign: str) -> str:
    ht = _house_theme(str(house))
    sr = _ru_sign(sign)
    return (
        f"Куспид {ht} в {sr}: стиль входа в ситуации этой сферы окрашен качествами знака. "
        "Сильная сторона — проще проявлять сильные качества; риск — перегибать и попадать в крайности знака. "
        "Практика: выбери 1 качество {sr} как ресурс и 1 риск как ограничение — и проверь на практике 7 дней."
    )

def _txt_house8_ruler_any(topic: str) -> str:
    return _txt_house_ruler_any(topic, 8)



def _txt_house12_ruler_any(topic: str) -> str:
    return _txt_house_ruler_any(topic, 12)


def _txt_house12_planet(topic: str, planet: str) -> str:
    return _txt_house_planet(topic, 12, planet)


def _txt_house3_ruler_any(topic: str) -> str:
    return _txt_house_ruler_any(topic, 3)


def _txt_house9_ruler_any(topic: str) -> str:
    return _txt_house_ruler_any(topic, 9)


def _txt_house5_ruler_any(topic: str) -> str:
    return _txt_house_ruler_any(topic, 5)


def _txt_house4_ruler_any(topic: str) -> str:
    return _txt_house_ruler_any(topic, 4)


def _txt_love_intimacy_generic(topic: str) -> str:
    return (
        "Этот блок описывает близость как сочетание желания, доверия и границ. "
        "Сильная сторона — ты умеешь создавать контакт и тепло; риск — путать близость с контролем, идеализацией или спасательством. "
        "Практика: выбери 1 правило близости на неделю (честность, границы, темп, забота) и проверь, как меняется качество контакта."
    )


def _txt_house7_ruler_any(topic: str) -> str:
    return _txt_house_ruler_any(topic, 7)


def _txt_house7_ruler_planet(topic: str, ruler: str) -> str:
    rr = _ru_planet(ruler)
    return (
        f"Управитель 7 дома — {rr}. Это показывает, какого партнёра ты притягиваешь и через какой стиль строишь союз. "
        "Сильная сторона — можно быстрее договориться о правилах и целях; риск — повторять старый сценарий и не замечать красные флаги. "
        "Практика: сформулируй 3 условия здоровых отношений и проверь их в реальных диалогах."
    )


def _txt_self_esteem_generic(topic: str) -> str:
    return (
        "Этот блок описывает самооценку как устойчивое ощущение ценности, не зависящее полностью от внешних оценок. "
        "Сильная сторона — ты можешь опираться на внутренние критерии; риск — обесценивать себя при стрессе или сравнениях. "
        "Практика: на 14 дней выбери 1 показатель прогресса (навык/дисциплина/результат) и фиксируй маленькие шаги ежедневно."
    )


def _txt_money_generic(topic: str) -> str:
    return (
        "Этот блок описывает деньги как систему: способность создавать доход, удерживать ресурс и превращать его в безопасность. "
        "Сильная сторона — можно быстро усилить финансовую устойчивость; риск — хаотичные траты или страх дефицита. "
        "Практика: введи 1 финансовый стандарт на 14 дней (учёт, лимит, накопления) и замерь эффект."
    )


def _txt_house2_ruler_any(topic: str) -> str:
    return _txt_house_ruler_any(topic, 2)


def _txt_angle_asc(topic: str) -> str:
    return (
        "ASC (Асцендент) — твоя «первая подача»: как ты входишь в контакт и как тебя считывают в начале. "
        "Он влияет на манеру поведения, темп, язык тела и то, как ты запускаешь новые ситуации. "
        "Практика: в ближайшем общении проверь, что ты транслируешь на старте (тон/скорость/границы) и как это влияет на ответ людей."
    )


def _txt_how_others_see_me_generic(topic: str) -> str:
    return (
        "Этот блок описывает, как тебя воспринимают другие на первом контакте: что заметно сразу и что считывают между строк. "
        "Сильная сторона — ты можешь управлять впечатлением осознанно; риск — застревать в маске или объяснять себя слишком поздно. "
        "Практика: выбери 1 элемент самопрезентации (темп, ясность, границы) и тренируй 7 дней."
    )


def _txt_angle_asc_sign(topic: str, sign: str) -> str:
    sr = _ru_sign(sign)
    return (
        f"ASC в {sr}: манера проявляться и входить в контакт окрашена качествами знака. "
        "Сильная сторона — ты быстро включаешься в ситуацию; риск — автоматически реагировать по шаблону знака. "
        "Практика: отслеживай 7 дней, где знак помогает, а где мешает — и введи одну корректировку."
    )


def _txt_house1_cusp_sign_any(topic: str) -> str:
    return (
        "Куспид 1 дома (ASC) показывает, каким стилем ты входишь в мир и запускаешь новые ситуации. "
        "Это влияет на впечатление, темп и способ действовать. "
        "Практика: выбери один элемент старта (темп/тон/границы) и отрепетируй 7 дней."
    )


def _txt_house1_cusp_sign(topic: str, sign: str) -> str:
    sr = _ru_sign(sign)
    return (
        f"Куспид 1 дома в {sr}: стиль самопрезентации окрашен качествами знака. "
        "Сильная сторона — проще проявлять сильные качества; риск — перегибать и выглядеть слишком «в одном тоне». "
        "Практика: выбери 1 качество знака и усиливай его осознанно неделю."
    )


def _txt_house1_ruler_any(topic: str) -> str:
    return _txt_house_ruler_any(topic, 1)


def _txt_house1_ruler_planet(topic: str, ruler: str) -> str:
    rr = _ru_planet(ruler)
    return (
        f"Управитель 1 дома — {rr}. Это влияет на самопрезентацию и стиль действий. "
        "Сильная сторона — можно быстро включаться и вести; риск — действовать слишком автоматически. "
        "Практика: выбери один «якорь» контроля (пауза, ясное «да/нет», спокойный темп) и тренируй 7 дней."
    )


def _txt_house1_ruler_planet_sign_any(topic: str, ruler: str) -> str:
    rr = _ru_planet(ruler)
    return (
        f"Управитель 1 дома ({rr}) в определённом знаке задаёт стиль поведения и реакций. "
        "Сильная сторона — ясный образ; риск — шаблонные реакции. "
        "Практика: 7 дней отслеживай триггеры и вводи одну корректировку поведения."
    )


def _txt_house1_ruler_aspects_present(topic: str, ruler: str) -> str:
    rr = _ru_planet(ruler)
    return (
        f"Управитель 1 дома ({rr}) имеет значимые аспекты: самопрезентация связана с другими функциями карты. "
        "Сильная сторона — многогранность; риск — внутренние конфликты. "
        "Практика: опиши 1 повторяющийся сценарий проявления и заранее задай правило поведения."
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
    return _txt_house_planet(topic, 1, planet)


def _career_lever_for_planet(planet: str) -> str:
    levers = {
        "sun": "лидерство, видимость и ответственность",
        "moon": "заботу, атмосферу и эмоциональный климат команды",
        "mercury": "коммуникации, переговоры и обработку информации",
        "venus": "гармонию, вкус, отношения и ценность продукта",
        "mars": "действие, напор, инициативу и скорость",
        "jupiter": "рост, масштабирование и стратегию",
        "saturn": "структуру, дисциплину и надёжность",
        "uranus": "инновации и нестандартные решения",
        "neptune": "вдохновение, смысл и образ",
        "pluto": "влияние, глубину и трансформации",
    }
    return levers.get(planet, "ключевую функцию планеты")


def _txt_angle_mc(topic: str) -> str:
    return (
        "MC (Медиум Цели) — вектор карьеры и статуса: как ты реализуешься и за что тебя уважают. "
        "Он показывает формат роли, к которой ты естественно тянешься. "
        "Практика: опиши 1 желаемую роль и 3 критерия качества результата — и сверяйся с ними 14 дней."
    )

def _txt_angle_base(topic: str, angle: str) -> str:
    ar = {"mc": "MC", "ic": "IC", "dc": "DC", "dsc": "DC"}.get(angle, angle.upper())
    axis_hint = {
        "mc": "карьера и статус (вектор реализации)",
        "ic": "дом и внутренняя опора (корни и безопасность)",
        "dc": "партнёрства и договорённости (модель союза)",
        "dsc": "партнёрства и договорённости (модель союза)",
    }.get(angle, "ось карты")

    return (
        f"{ar}: базовый угол карты, который описывает ось «{axis_hint}». "
        "Сильная сторона — даёт ясный вектор, где настраивать стратегию; риск — действовать по привычке и получать повторяющийся результат. "
        "Практика: выбери 1 ситуацию по теме угла и задай правило на 7 дней (границы/темп/ответственность), затем оцени эффект."
    )

def _txt_angle_sign(topic: str, angle: str, sign: str) -> str:
    ar = {"mc": "MC", "ic": "IC", "dc": "DC", "dsc": "DC"}.get(angle, angle.upper())
    sr = _ru_sign(sign)
    axis_hint = {
        "mc": "карьера и статус",
        "ic": "дом и внутренняя опора",
        "dc": "партнёрства и договорённости",
        "dsc": "партнёрства и договорённости",
    }.get(angle, "ось карты")

    return (
        f"{ar} в {sr}: стиль проявления по оси «{axis_hint}» окрашен качествами знака. "
        "Сильная сторона — ясный способ проявляться; риск — перекос в крайности знака. "
        "Практика: выбери 1 качество знака и закрепи его в одном стандарте поведения на 2 недели."
    )

def _txt_angle_mc_sign(topic: str, sign: str) -> str:
    sr = _ru_sign(sign)
    return (
        f"MC в {sr}: карьерный стиль окрашен качествами знака. "
        "Сильная сторона — проще проявлять сильные качества; риск — уходить в крайности. "
        "Практика: выбери 1 качество знака и закрепи его в одном стандарте работы на 2 недели."
    )


def _txt_house10_ruler_any(topic: str) -> str:
    return _txt_house_ruler_any(topic, 10)


def _txt_house10_ruler_planet(topic: str, ruler: str) -> str:
    rr = _ru_planet(ruler)
    return (
        f"Управитель 10 дома — {rr}. Это влияет на карьерную стратегию и то, как ты достигаешь результата. "
        "Сильная сторона — можно построить устойчивую траекторию; риск — застревать в роли или перегружаться. "
        "Практика: выбери 1 стандарт качества/границ и удерживай его 14 дней."
    )


def _txt_house10_ruler_planet_sign_any(topic: str, ruler: str) -> str:
    rr = _ru_planet(ruler)
    return (
        f"Управитель 10 дома ({rr}) в определённом знаке задаёт стиль достижений. "
        "Сильная сторона — ясный вектор; риск — перекос в крайности. "
        "Практика: выбери 1 качество и закрепи его в ежедневном рабочем стандарте на 2 недели."
    )


def _txt_house10_ruler_aspects_present(topic: str, ruler: str) -> str:
    rr = _ru_planet(ruler)
    return (
        f"Управитель 10 дома ({rr}) имеет значимые аспекты: карьерные решения связаны с другими темами карты. "
        "Сильная сторона — многогранность; риск — внутренние конфликты. "
        "Практика: опиши 1 повторяющийся карьерный сценарий и добавь одно стабилизирующее правило."
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
    return _txt_house_planet(topic, 10, planet)


def _txt_polarity_balance(topic: str, pol: str) -> str:
    pr = "Ян" if pol == "yang" else "Инь"
    return (
        f"Баланс полярности смещён в сторону «{pr}». "
        "Это влияет на темп решений, активность и стиль контакта. "
        "Практика: выбери 1 способ уравновесить полярность на неделю (паузы, планирование, восстановление)."
    )


def _txt_elements_count(topic: str, element: str, cnt: int) -> str:
    er = _ru_element(element)
    return (
        f"Стихия {er}: количество значимых объектов = {cnt}. "
        "Это отражает выраженность качества и то, где проще действовать. "
        "Практика: используй эту стихию как ресурс (1 действие в день), но добавь баланс через противоположный навык."
    )


def _txt_elements_dominant(topic: str, element: str) -> str:
    er = _ru_element(element)
    return (
        f"Доминирует стихия {er}. "
        "Сильная сторона — проще действовать в её логике; риск — перекос и слепая зона. "
        "Практика: на неделю выбери 1 ресурс доминанты и 1 компенсирующее действие."
    )


def _txt_elements_deficient(topic: str, element: str) -> str:
    er = _ru_element(element)
    return (
        f"Стихия {er} выражена слабее. "
        "Это не «плохо», но может требовать осознанного развития соответствующих навыков. "
        "Практика: 7 дней делай одно маленькое действие в логике этой стихии."
    )


def _txt_modality_dominant(topic: str, modality: str) -> str:
    mr = _ru_modality(modality)
    return (
        f"Доминирует качество «{mr}». "
        "Это влияет на стиль изменений: старт/удержание/адаптация. "
        "Практика: выбери 1 привычку в логике доминанты и закрепи её на 14 дней."
    )


def _txt_group_count(group: str, cnt: str) -> str:
    return (
        f"Группа планет «{group}»: количество = {cnt}. "
        "Это отражает распределение внимания по задачам. "
        "Практика: выбери 1 группу и усили её через конкретный навык на неделю."
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
    m = re.fullmatch(r"natal\.angle\.(mc|ic|dc|dsc)$", key)
    if m:
        return _txt_angle_base(topic, m.group(1))
    if key == "natal.ancestral_topics.generic":
        return _txt_ancestral_topics_generic(topic)

    if key == "natal.past_lives_symbolic.generic":
        return _txt_past_lives_symbolic_generic(topic)

    if key == "natal.talents.generic":
        return _txt_talents_generic(topic)

    if key == "natal.love_intimacy.generic":
        return _txt_love_intimacy_generic(topic)

    if key == "natal.self_esteem.generic":
        return _txt_self_esteem_generic(topic)

    if key == "natal.money.generic":
        return _txt_money_generic(topic)

    # --- Unified house templates
    m = re.fullmatch(r"natal\.house\.(\d+)\.ruler\.any", key)
    if m:
        return _txt_house_ruler_any(topic, int(m.group(1)))

    # --- Unified house ruler.<planet>* family (all houses)
    m = re.fullmatch(r"natal\.house\.(\d+)\.ruler\.([a-z_]+)$", key)
    if m:
        return _txt_house_ruler_planet(topic, int(m.group(1)), m.group(2))

    m = re.fullmatch(r"natal\.house\.(\d+)\.ruler\.([a-z_]+)\.sign\.any", key)
    if m:
        return _txt_house_ruler_planet_sign_any(topic, int(m.group(1)), m.group(2))

    m = re.fullmatch(r"natal\.house\.(\d+)\.ruler\.([a-z_]+)\.aspects\.present", key)
    if m:
        return _txt_house_ruler_aspects_present(topic, int(m.group(1)), m.group(2))

    m = re.fullmatch(r"natal\.house\.(\d+)\.ruler\.([a-z_]+)\.aspect\.([a-z_]+)\.([a-z_]+)", key)
    if m:
        return _txt_house_ruler_aspect(topic, int(m.group(1)), m.group(2), m.group(3), m.group(4))

    m = re.fullmatch(r"natal\.house\.(\d+)\.planet\.([a-z_]+)", key)
    if m:
        return _txt_house_planet(topic, int(m.group(1)), m.group(2))

    if key == "natal.angle.asc":
        return _txt_angle_asc(topic)

    if key == "natal.how_others_see_me.generic":
        return _txt_how_others_see_me_generic(topic)

    m = re.fullmatch(r"natal\.angle\.asc\.sign\.([a-z_]+)", key)
    if m:
        return _txt_angle_asc_sign(topic, m.group(1))

    m = re.fullmatch(r"natal\.house\.(\d+)\.cusp\.sign\.any", key)
    if m:
        return _txt_house_cusp_sign_any(topic, int(m.group(1)))

    m = re.fullmatch(r"natal\.house\.(\d+)\.cusp\.sign\.([a-z_]+)", key)
    if m:
        return _txt_house_cusp_sign(topic, int(m.group(1)), m.group(2))

    # --- Career / MC / house10 core
    
    m = re.fullmatch(r"natal\.angle\.(mc|ic|dc|dsc)\.sign\.([a-z_]+)", key)
    if m:
        return _txt_angle_sign(topic, m.group(1), m.group(2))

    m = re.fullmatch(r"natal\.angle\.mc\.sign\.([a-z_]+)", key)
    if m:
        return _txt_angle_mc_sign(topic, m.group(1))

    m = re.fullmatch(r"natal\.house\.(\d+)", key)
    if m:
        return _txt_house(topic, int(m.group(1)))

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
    
    # --- Unified house.<N> (house theme) family (all houses)
    m = re.fullmatch(r"natal\.house\.(\d+)", key)
    if m:
        return _txt_house(topic, int(m.group(1)))

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
        "",
        "BEGIN;",
        "",
    ]

    for key in keys:
        txt = synth_text(key=key, topic=opt.topic).replace("'", "''")
        out.append(
            "INSERT INTO knowledge_items(key, topic_category, locale, text, is_active, priority)\n"
            f"VALUES('{key}', '{opt.topic}', '{opt.locale}', '{txt}', 1, {opt.priority})\n"
            "ON CONFLICT(key, topic_category, locale) DO UPDATE SET\n"
            "  text=excluded.text,\n"
            "  is_active=excluded.is_active,\n"
            "  priority=excluded.priority;\n"
        )

    out.extend(["", "COMMIT;", ""])
    return "\n".join(out)


def load_used_blocks(path: Path, topic: str) -> list[dict[str, Any]]:
    raw = json.loads(path.read_text(encoding="utf-8-sig"))
    try:
        return list(raw["meta"]["debug"]["topics"][topic]["used_blocks_sample"])
    except Exception as e:
        raise RuntimeError(f"Cannot find meta.debug.topics.{topic}.used_blocks_sample in {path}") from e


def parse_args() -> Opt:
    ap = argparse.ArgumentParser()
    ap.add_argument("--in", dest="in_path", required=True, help="debug(before).json")
    ap.add_argument("--out", dest="out_path", required=True, help="seed.sql output path")
    ap.add_argument("--topic", dest="topic", required=True, help="topic_category name (e.g., career)")
    ap.add_argument("--locale", dest="locale", default="ru-RU")
    ap.add_argument("--max-len", dest="max_len", type=int, default=420)
    ap.add_argument("--max-keys", dest="max_keys", type=int, default=200)
    ap.add_argument("--priority", dest="priority", type=int, default=140)
    a = ap.parse_args()

    return Opt(
        in_path=Path(a.in_path),
        out_path=Path(a.out_path),
        topic=a.topic,
        locale=a.locale,
        max_len=a.max_len,
        max_keys=a.max_keys,
        priority=a.priority,
    )


def main() -> int:
    opt = parse_args()
    used = load_used_blocks(opt.in_path, opt.topic)
    keys = select_short_keys(used, opt)
    sql = build_sql(keys, opt)
    opt.out_path.write_text(sql, encoding="utf-8")
    print(f"OK: wrote {opt.out_path} (keys={len(keys)})")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())