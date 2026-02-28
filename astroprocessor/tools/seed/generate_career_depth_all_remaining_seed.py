# astroprocessor/tools/seed/generate_career_depth_all_remaining_seed.py
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

ANGLES = ("mc", "asc", "ic", "dsc")
ANGLE_RU = {"mc": "MC", "asc": "ASC", "ic": "IC", "dsc": "DSC"}


@dataclass(frozen=True)
class Opt:
    locale: str = "ru-RU"
    topic: str = "career"
    priority: int = 140  # align with your MC/10/ruler texts


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


def txt_mc_sign_any() -> str:
    return (
        "MC по знаку (любой): это «манера профессиональной реализации». "
        "Даёт стиль решений, темп роста и то, каким образом вы становитесь заметны. "
        "Смотрите знак MC + управителя: первый задаёт образ, второй — стратегию."
    )


def txt_mc_sign(sign: str) -> str:
    s = SIGN_RU[sign]
    return (
        f"MC в «{s}» описывает, как вы хотите выглядеть в профессии и за счёт чего растёт статус. "
        f"Вектор здесь — не «одна профессия», а стиль реализации: как вы ставите цели, как держите темп и как закрепляете репутацию. "
        f"Практика: выбирайте роли, где ваш «{s}»-стиль воспринимается как ценность (ответственность, скорость, системность, креатив и т.д.)."
    )


def txt_house10_cusp_any() -> str:
    return (
        "Куспид 10-го дома по знаку (любой) — это стиль карьерной цели: "
        "какие правила игры вам подходят, какой тип ответственности вы готовы держать и что считаете «достижением»."
    )


def txt_house10_cusp_sign(sign: str) -> str:
    s = SIGN_RU[sign]
    return (
        f"Куспид 10-го дома в «{s}» показывает, каким способом вы строите карьеру и закрепляете статус. "
        f"Это «обёртка» цели: через какие задачи и роли легче всего получать признание. "
        f"Уточняйте через планеты в 10-м доме и управителя 10-го — они дадут конкретную стратегию."
    )


def txt_house10_planet(p: str) -> str:
    pr = PLANET_RU[p]
    return (
        f"{pr} в 10-м доме делает эту функцию заметной в профессии: вас считывают через качества {pr}. "
        "В плюсе — это сильный рычаг влияния и рост статуса; в минусе — риск перегибов, если делать ставку только на одну роль. "
        "Баланс: развивайте навыки, которые соответствуют планете, и держите режим, чтобы не выгорать."
    )


def txt_ruler_any() -> str:
    return (
        "Управитель 10-го дома — «двигатель карьеры»: он показывает, через какие действия и навыки строится статус. "
        "Знак управителя = стиль решений; дом управителя = площадка, где карьера «собирается» в результат; аспекты = где легко/где нужен план."
    )


def txt_ruler_planet(p: str) -> str:
    pr = PLANET_RU[p]
    if p == "saturn":
        return (
            "Когда управитель 10-го дома — Сатурн, рост строится через дисциплину, стандарты качества и репутацию, проверенную временем. "
            "Это сценарий «долго, но надёжно»: ответственность, структура, умение держать рамки. "
            "Вызов — не уйти в самокритику: фиксируйте этапы и прогресс, усиливайте компетенцию и системность."
        )
    return (
        f"Когда управитель 10-го дома — {pr}, карьера растёт через качества {pr}: "
        f"то, как вы принимаете решения, действуете и создаёте результат. "
        "Смотрите знак/дом управителя и аспекты: они подскажут, где усиливать навык и где ставить границы."
    )


def txt_ruler_pos(kind: str) -> str:
    if kind == "sign.any":
        return (
            "Управитель 10-го дома по знаку (любой): стиль реализации и манера решений. "
            "Это ваш «профессиональный почерк» — как вы действуете, чтобы расти."
        )
    if kind == "house.any":
        return (
            "Управитель 10-го дома по дому (любой): куда уходит энергия карьеры. "
            "Дом показывает сферу жизни/задач, через которую проще собирать статус и признание."
        )
    return (
        "Управитель 10-го дома: знак + дом (любой) — практическая сборка карьеры. "
        "Знак даёт стиль, дом — площадку, а вместе они показывают стратегию, которая повторяемо даёт результат."
    )


def txt_aspect_any_any() -> str:
    return (
        "Аспекты управителя 10-го дома описывают динамику карьеры: где идёт ускорение, где — сопротивление, "
        "и через какие навыки вы становитесь устойчивее. Смотрите повторяющиеся темы: власть/границы, публичность, коммуникации, риск, обучение."
    )


def txt_hard_present() -> str:
    return (
        "Hard-aspects у управителя 10-го дома означают узлы напряжения в карьерной траектории. "
        "Это не «плохо», а требование к стратегии: границы, режим, приоритеты, ясные договорённости и измеримые этапы роста."
    )


def txt_aspect_class(cls: str) -> str:
    if cls == "tense":
        return (
            "Напряжённые аспекты управителя 10-го дома дают рост через вызовы: конкуренцию, дедлайны, давление ожиданий. "
            "Рабочая стратегия: план, дисциплина, границы и переговоры."
        )
    return (
        "Гармоничные аспекты управителя 10-го дома дают поддержку: легче находить союзников и развивать компетенции. "
        "Главное — закреплять успех практикой и системностью."
    )


def txt_with_angle(a: str) -> str:
    if a == "mc":
        return "Аспект управителя 10-го дома к MC усиливает заметность и связывает личные решения с публичной ролью. Нужна ясная цель."
    if a == "asc":
        return "Аспект управителя 10-го дома к ASC связывает карьеру с личным образом: важно управлять впечатлением и стилем самопрезентации."
    if a == "ic":
        return "Аспект управителя 10-го дома к IC связывает карьеру с домом/опорой: баланс приватного и публичного — ключ к устойчивости."
    return "Аспект управителя 10-го дома к DSC связывает успех с партнёрствами и клиентами: важны договорённости и качество отношений."


def build_sql(opt: Opt) -> str:
    out: list[str] = [
        "-- AUTO-GENERATED. DO NOT EDIT BY HAND.",
        "-- Career depth: fill ALL remaining MC/house10/ruler/aspect keys (topic_category=career)",
        "BEGIN;",
    ]

    # MC sign blocks
    out.append(upsert_overwrite("natal.angle.mc.sign.any", txt_mc_sign_any(), opt))
    for s in SIGNS:
        out.append(upsert_overwrite(f"natal.angle.mc.sign.{s}", txt_mc_sign(s), opt))

    # House10 cusp sign blocks
    out.append(upsert_overwrite("natal.house.10.cusp.sign.any", txt_house10_cusp_any(), opt))
    for s in SIGNS:
        out.append(upsert_overwrite(f"natal.house.10.cusp.sign.{s}", txt_house10_cusp_sign(s), opt))

    # Planets in house10
    for p in PLANETS:
        out.append(upsert_overwrite(f"natal.house.10.planet.{p}", txt_house10_planet(p), opt))

    # Ruler blocks (any + per planet)
    out.append(upsert_overwrite("natal.house.10.ruler.any", txt_ruler_any(), opt))
    for p in PLANETS:
        out.append(upsert_overwrite(f"natal.house.10.ruler.{p}", txt_ruler_planet(p), opt))
        out.append(upsert_overwrite(f"natal.house.10.ruler.{p}.sign.any", txt_ruler_pos("sign.any"), opt))
        out.append(upsert_overwrite(f"natal.house.10.ruler.{p}.house.any", txt_ruler_pos("house.any"), opt))
        out.append(upsert_overwrite(f"natal.house.10.ruler.{p}.sign.any.house.any", txt_ruler_pos("sign.any.house.any"), opt))

        # Aspect ladders per ruler planet
        out.append(upsert_overwrite(f"natal.house.10.ruler.{p}.aspect.any.any", txt_aspect_any_any(), opt))
        out.append(upsert_overwrite(f"natal.house.10.ruler.{p}.aspect.hard.present", txt_hard_present(), opt))
        out.append(upsert_overwrite(f"natal.house.10.ruler.{p}.aspect.class.tense", txt_aspect_class("tense"), opt))
        out.append(upsert_overwrite(f"natal.house.10.ruler.{p}.aspect.class.harmonic", txt_aspect_class("harmonic"), opt))
        for a in ANGLES:
            out.append(upsert_overwrite(f"natal.house.10.ruler.{p}.aspect.any.with.angle.{a}", txt_with_angle(a), opt))

    # General ruler.aspect ladders (house10 scoped)
    out.append(upsert_overwrite("natal.house.10.ruler.aspect.any.any", txt_aspect_any_any(), opt))
    out.append(upsert_overwrite("natal.house.10.ruler.aspect.hard.present", txt_hard_present(), opt))
    out.append(upsert_overwrite("natal.house.10.ruler.aspect.class.tense", txt_aspect_class("tense"), opt))
    out.append(upsert_overwrite("natal.house.10.ruler.aspect.class.harmonic", txt_aspect_class("harmonic"), opt))
    for a in ANGLES:
        out.append(upsert_overwrite(f"natal.house.10.ruler.aspect.with.angle.{a}", txt_with_angle(a), opt))

    out += ["COMMIT;", ""]
    return "\n\n".join(out)


def main() -> None:
    root = Path(__file__).resolve().parents[2]  # .../astroprocessor
    out_path = root / "tools" / "seed" / "seed_career_depth_all_remaining.sql"
    out_path.write_text(build_sql(Opt()), encoding="utf-8")
    print(f"Wrote: {out_path}")


if __name__ == "__main__":
    main()