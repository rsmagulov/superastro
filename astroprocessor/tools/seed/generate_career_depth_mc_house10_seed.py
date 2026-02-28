# astroprocessor/tools/seed/generate_career_depth_mc_house10_seed.py
from __future__ import annotations

from dataclasses import dataclass
from pathlib import Path

SIGNS = (
    "aries", "taurus", "gemini", "cancer", "leo", "virgo",
    "libra", "scorpio", "sagittarius", "capricorn", "aquarius", "pisces",
)

SIGN_RU = {
    "aries": "Овен", "taurus": "Телец", "gemini": "Близнецы", "cancer": "Рак",
    "leo": "Лев", "virgo": "Дева", "libra": "Весы", "scorpio": "Скорпион",
    "sagittarius": "Стрелец", "capricorn": "Козерог", "aquarius": "Водолей", "pisces": "Рыбы",
}

PLANETS = ("sun", "moon", "mercury", "venus", "mars", "jupiter", "saturn", "uranus", "neptune", "pluto")

PLANET_RU = {
    "sun": "Солнце", "moon": "Луна", "mercury": "Меркурий", "venus": "Венера", "mars": "Марс",
    "jupiter": "Юпитер", "saturn": "Сатурн", "uranus": "Уран", "neptune": "Нептун", "pluto": "Плутон",
}

ELEMENTS = ("fire", "earth", "air", "water")
ELEMENT_RU = {"fire": "Огонь", "earth": "Земля", "air": "Воздух", "water": "Вода"}

POLARITY = ("yin", "yang", "balanced")
POLARITY_RU = {"yin": "инь", "yang": "ян", "balanced": "баланс"}

MODALITY = ("cardinal", "fixed", "mutable", "balanced")
MODALITY_RU = {"cardinal": "кардинальная", "fixed": "фиксированная", "mutable": "мутабельная", "balanced": "баланс"}

ASPECT_CLASS = ("tense", "harmonic")
ANGLES = ("mc", "asc", "ic", "dsc")


@dataclass(frozen=True)
class SeedOptions:
    locale: str = "ru-RU"
    topic_category: str = "career"
    priority: int = 120


def _upsert_sql(key: str, text: str, *, locale: str, topic: str, priority: int) -> str:
    esc = text.replace("'", "''")
    # IMPORTANT:
    # Career-depth seeds MUST overwrite topic-specific text to improve quality.
    return f"""
UPDATE knowledge_items
SET text = '{esc}', is_active = 1, priority = {int(priority)}, meta_json = '{{}}'
WHERE key = '{key}' AND locale = '{locale}' AND topic_category = '{topic}';

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT '{key}', '{topic}', '{locale}', '{esc}', {int(priority)}, CURRENT_TIMESTAMP, 1, '{{}}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = '{key}' AND locale = '{locale}' AND topic_category = '{topic}'
);
""".strip()


def _txt_career_generic() -> str:
    return (
        "Карьера и призвание в натальной карте читаются как сочетание: MC (общественный образ и направление реализации), "
        "10-й дом (статус, профессия, видимая роль), управитель 10-го дома (как именно вы реализуетесь), "
        "а также аспекты управителя и планеты в 10-м доме (ваши рычаги влияния и зоны роста). "
        "Важна логика «сигнал → навык → стратегия»: где легко (гармоничные связи) — там проще расти через практику; "
        "где напряжение (квадраты/оппозиции) — там нужен план, границы и устойчивый режим. "
        "Если время рождения неточно, аспекты/дома могут быть снижены по точности — тогда ориентируйтесь на знаковую часть и повторяющиеся мотивы."
    )


def _txt_mc_sign(sign: str) -> str:
    s = SIGN_RU[sign]
    return (
        f"MC в знаке «{s}» задаёт стиль общественной реализации: как вас считывают в профессиональной среде, "
        f"какие роли вам естественнее, через что вы достигаете статуса. Это не «одна профессия», а вектор: "
        f"поведение, темп, тип ответственности и критерии успеха."
    )


def _txt_house10_cusp_sign(sign: str) -> str:
    s = SIGN_RU[sign]
    return (
        f"Куспид 10-го дома в «{s}» показывает, каким способом вы обычно строите карьеру: "
        f"через какой тип задач, какой формат лидерства/служения, какая мотивация держит вас в длинной дистанции. "
        f"Это базовая «обёртка» карьеры: стиль цели и правила игры, в которых проще всего выигрывать."
    )


def _txt_house10_planet(p: str) -> str:
    pr = PLANET_RU[p]
    return (
        f"Планета {pr} в 10-м доме усиливает карьерный акцент этой функции: "
        f"какие качества вы проявляете публично, за что вас замечают и чему придётся научиться. "
        f"В плюс — это «кнопка роста» и видимый ресурс; в минус — перегибы/перегорание, если делать ставку только на одну роль."
    )


def _txt_ruler_pos(kind: str) -> str:
    if kind == "sign.any":
        return (
            "Управитель 10-го дома по знаку показывает «манеру реализации»: "
            "какой стиль решений, коммуникации и мотивации помогает расти."
        )
    if kind == "house.any":
        return (
            "Управитель 10-го дома по дому показывает «куда уходит энергия карьеры»: "
            "через какую сферу жизни вы чаще всего делаете статус, капитал или признание."
        )
    return (
        "Связка «управитель 10-го дома: знак + дом» — один из самых практичных индикаторов: "
        "она показывает и стиль (знак), и площадку (дом), где карьера легче собирается в систему."
    )


def _txt_aspect_class(cls: str) -> str:
    if cls == "tense":
        return (
            "Напряжённые аспекты управителя 10-го дома (квадраты/оппозиции и др. «тягучие» связи) "
            "дают рост через вызовы: конкуренцию, дедлайны, необходимость границ и навыка переговоров. "
            "Это не «плохо», а требование к стратегии: план, дисциплина, приоритеты, здоровый режим."
        )
    return (
        "Гармоничные аспекты управителя 10-го дома (трины/секстили и др.) "
        "дают поддержку: легче находить союзников, получать признание, развивать компетенции без постоянного сопротивления. "
        "Важно не расслабляться — гармония раскрывается через практику и системность."
    )


def _txt_hard_present() -> str:
    return (
        "Маркер «hard aspects present» у управителя 10-го дома означает, что в карьере будут узлы напряжения, "
        "которые нельзя игнорировать. Это точки роста: конфликт интересов, давление ожиданий, необходимость выбора. "
        "Лучшее решение — заранее продумать правила, границы и структуру ответственности."
    )


def _txt_any_any() -> str:
    return (
        "Аспекты управителя 10-го дома описывают динамику карьеры: с кем/чем вы входите во взаимодействие, "
        "где идёт ускорение, где — торможение, и через какие навыки вы становитесь устойчивее. "
        "Смотрите повторяющиеся темы: власть/контроль, публичность, коммуникации, риск, обучение, партнёрства."
    )


def _txt_with_angle(angle: str) -> str:
    if angle == "mc":
        return (
            "Аспект управителя 10-го дома к MC — прямой индикатор «карьерной судьбы»: "
            "как ваша личная воля/стиль решений подключаются к публичной роли. Это усиливает заметность и требует ясной цели."
        )
    if angle == "asc":
        return (
            "Аспект управителя 10-го дома к ASC связывает карьеру с образом «я»: "
            "то, как вы проявляетесь лично, напрямую влияет на профессиональную репутацию. Важно управлять первым впечатлением."
        )
    if angle == "ic":
        return (
            "Аспект управителя 10-го дома к IC связывает карьеру с домом/семьёй/внутренней опорой: "
            "баланс приватного и публичного становится ключом к устойчивому росту."
        )
    return (
        "Аспект управителя 10-го дома к DSC связывает карьеру с партнёрствами и клиентами: "
        "успех приходит через договорённости, совместные проекты и качество отношений."
    )


def build_sql(opt: SeedOptions) -> str:
    out: list[str] = [
        "-- AUTO-GENERATED. DO NOT EDIT BY HAND.",
        "-- Career depth: MC / house10 / ruler / aspects (topic-specific)",
        "BEGIN;",
    ]

    # topic generic
    out.append(_upsert_sql("natal.career.generic", _txt_career_generic(), locale=opt.locale, topic=opt.topic_category, priority=opt.priority))

    # MC sign + MC element/polarity/modality (generic hooks)
    for s in SIGNS:
        out.append(_upsert_sql(f"natal.angle.mc.sign.{s}", _txt_mc_sign(s), locale=opt.locale, topic=opt.topic_category, priority=opt.priority))

    for el in ELEMENTS:
        out.append(_upsert_sql(f"natal.angle.mc.element.{el}", f"MC по стихии «{ELEMENT_RU[el]}»: общий стиль профессиональной реализации.", locale=opt.locale, topic=opt.topic_category, priority=opt.priority))
        out.append(_upsert_sql(f"natal.angle.any.element.{el}", f"Углы карты по стихии «{ELEMENT_RU[el]}»: общий оттенок проявления в мире.", locale=opt.locale, topic=opt.topic_category, priority=opt.priority))

    for pol in POLARITY:
        out.append(_upsert_sql(f"natal.angle.mc.polarity.{pol}", f"MC по полярности ({POLARITY_RU[pol]}): общий темп и мотивация в карьере.", locale=opt.locale, topic=opt.topic_category, priority=opt.priority))
        out.append(_upsert_sql(f"natal.angle.any.polarity.{pol}", f"Углы карты по полярности ({POLARITY_RU[pol]}): общий стиль внешней реализации.", locale=opt.locale, topic=opt.topic_category, priority=opt.priority))

    for mod in MODALITY:
        out.append(_upsert_sql(f"natal.angle.mc.modality.{mod}", f"MC по модальности ({MODALITY_RU[mod]}): как вы запускаете и удерживаете карьерные процессы.", locale=opt.locale, topic=opt.topic_category, priority=opt.priority))
        out.append(_upsert_sql(f"natal.angle.any.modality.{mod}", f"Углы карты по модальности ({MODALITY_RU[mod]}): общий ритм внешней активности.", locale=opt.locale, topic=opt.topic_category, priority=opt.priority))

    out.append(_upsert_sql("natal.angle.mc", "MC: точка карьеры, статуса и общественного образа. Как вы проявляетесь «на виду».", locale=opt.locale, topic=opt.topic_category, priority=opt.priority))
    out.append(_upsert_sql("natal.angle", "Углы карты (ASC/MC/DSC/IC): каркас проявления личности во внешнем мире.", locale=opt.locale, topic=opt.topic_category, priority=opt.priority))

    # House 10 cusp sign + group/floor + element/polarity/modality hooks
    for s in SIGNS:
        out.append(_upsert_sql(f"natal.house.10.cusp.sign.{s}", _txt_house10_cusp_sign(s), locale=opt.locale, topic=opt.topic_category, priority=opt.priority))

    for el in ELEMENTS:
        out.append(_upsert_sql(f"natal.house.10.cusp.element.{el}", f"10 дом по стихии «{ELEMENT_RU[el]}»: общий стиль карьерной цели.", locale=opt.locale, topic=opt.topic_category, priority=opt.priority))
        out.append(_upsert_sql(f"natal.house.any.cusp.element.{el}", f"Дома по стихии «{ELEMENT_RU[el]}»: общий способ проживать темы дома.", locale=opt.locale, topic=opt.topic_category, priority=opt.priority))

    for pol in POLARITY:
        out.append(_upsert_sql(f"natal.house.10.cusp.polarity.{pol}", f"10 дом по полярности ({POLARITY_RU[pol]}): мотивация и стиль достижения статуса.", locale=opt.locale, topic=opt.topic_category, priority=opt.priority))
        out.append(_upsert_sql(f"natal.house.any.cusp.polarity.{pol}", f"Дома по полярности ({POLARITY_RU[pol]}): общий тон проживания сферы.", locale=opt.locale, topic=opt.topic_category, priority=opt.priority))

    for mod in MODALITY:
        out.append(_upsert_sql(f"natal.house.10.cusp.modality.{mod}", f"10 дом по модальности ({MODALITY_RU[mod]}): как вы строите карьеру во времени.", locale=opt.locale, topic=opt.topic_category, priority=opt.priority))
        out.append(_upsert_sql(f"natal.house.any.cusp.modality.{mod}", f"Дома по модальности ({MODALITY_RU[mod]}): общий ритм проживания тем.", locale=opt.locale, topic=opt.topic_category, priority=opt.priority))

    out.append(_upsert_sql("natal.house.10.group.angular", "10 дом угловой: сильная публичная реализация, быстрая видимость результата.", locale=opt.locale, topic=opt.topic_category, priority=opt.priority))
    out.append(_upsert_sql("natal.house.10.floor.upper", "10 дом верхняя полусфера: акцент на социальном проявлении и достижениях.", locale=opt.locale, topic=opt.topic_category, priority=opt.priority))

    out.append(_upsert_sql("natal.house.10.cusp.sign.any", "10 дом: знак на куспиде (любой) — общий стиль карьерной цели.", locale=opt.locale, topic=opt.topic_category, priority=opt.priority))
    out.append(_upsert_sql("natal.house.10.cusp", "Куспид 10 дома: как включается тема статуса и признания.", locale=opt.locale, topic=opt.topic_category, priority=opt.priority))
    out.append(_upsert_sql("natal.house.10", "10 дом: карьера, статус, роль, ответственность, общественный результат.", locale=opt.locale, topic=opt.topic_category, priority=opt.priority))
    out.append(_upsert_sql("natal.house", "Дома карты: сферы жизни, где проявляются планеты и их сценарии.", locale=opt.locale, topic=opt.topic_category, priority=opt.priority))

    # Planets in house 10 (career-specific depth)
    for p in PLANETS:
        out.append(_upsert_sql(f"natal.house.10.planet.{p}", _txt_house10_planet(p), locale=opt.locale, topic=opt.topic_category, priority=opt.priority))

    # Ruler pos (career-specific depth) — keep generic (any) but topic-rich
    for p in PLANETS:
        out.append(_upsert_sql(f"natal.house.10.ruler.{p}.sign.any", _txt_ruler_pos("sign.any"), locale=opt.locale, topic=opt.topic_category, priority=opt.priority))
        out.append(_upsert_sql(f"natal.house.10.ruler.{p}.house.any", _txt_ruler_pos("house.any"), locale=opt.locale, topic=opt.topic_category, priority=opt.priority))
        out.append(_upsert_sql(f"natal.house.10.ruler.{p}.sign.any.house.any", _txt_ruler_pos("sign.any.house.any"), locale=opt.locale, topic=opt.topic_category, priority=opt.priority))

        # Aspect ladders (non-explosive)
        out.append(_upsert_sql(f"natal.house.10.ruler.{p}.aspect.any.any", _txt_any_any(), locale=opt.locale, topic=opt.topic_category, priority=opt.priority))
        out.append(_upsert_sql(f"natal.house.10.ruler.{p}.aspect.hard.present", _txt_hard_present(), locale=opt.locale, topic=opt.topic_category, priority=opt.priority))
        for cls in ASPECT_CLASS:
            out.append(_upsert_sql(f"natal.house.10.ruler.{p}.aspect.class.{cls}", _txt_aspect_class(cls), locale=opt.locale, topic=opt.topic_category, priority=opt.priority))
        for a in ANGLES:
            out.append(_upsert_sql(f"natal.house.10.ruler.{p}.aspect.any.with.angle.{a}", _txt_with_angle(a), locale=opt.locale, topic=opt.topic_category, priority=opt.priority))

    # Also seed ruler-any ladders (still house-scoped) used by key_builder
    out.append(_upsert_sql("natal.house.10.ruler.aspect.any.any", _txt_any_any(), locale=opt.locale, topic=opt.topic_category, priority=opt.priority))
    out.append(_upsert_sql("natal.house.10.ruler.aspect.hard.present", _txt_hard_present(), locale=opt.locale, topic=opt.topic_category, priority=opt.priority))
    for cls in ASPECT_CLASS:
        out.append(_upsert_sql(f"natal.house.10.ruler.aspect.class.{cls}", _txt_aspect_class(cls), locale=opt.locale, topic=opt.topic_category, priority=opt.priority))
    for a in ANGLES:
        out.append(_upsert_sql(f"natal.house.10.ruler.aspect.with.angle.{a}", _txt_with_angle(a), locale=opt.locale, topic=opt.topic_category, priority=opt.priority))

    out += ["COMMIT;", ""]
    return "\n\n".join(out)


def main() -> None:
    root = Path(__file__).resolve().parents[2]  # .../astroprocessor
    out = root / "tools" / "seed" / "seed_career_depth_mc_house10.sql"
    out.write_text(build_sql(SeedOptions()), encoding="utf-8")
    print(f"Wrote: {out}")


if __name__ == "__main__":
    main()