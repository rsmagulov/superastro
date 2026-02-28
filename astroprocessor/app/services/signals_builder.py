# astroprocessor/app/services/signals_builder.py
from __future__ import annotations

from dataclasses import dataclass
from typing import Any, Iterable


PLANET_RU = {
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
    "chiron": "Хирон",
    "lilith": "Лилит",
    "north_node": "Северный узел",
    "south_node": "Южный узел",
}

SIGN_RU = {
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

ASPECT_RU = {
    "conjunction": "соединение",
    "opposition": "оппозиция",
    "trine": "трин",
    "square": "квадрат",
    "sextile": "секстиль",
    "quincunx": "квинконс",
}


TOPIC_FOCUS = {
    # твои внутренние topic_category (примерные; подставь реальные значения из _resolve_topics)
    "career": {"houses": {10, 6, 2}, "planets": {"sun", "saturn", "jupiter"}},
    "money": {"houses": {2, 8, 11}, "planets": {"venus", "jupiter", "saturn"}},
    "love_intimacy": {"houses": {5, 7, 8}, "planets": {"venus", "mars", "moon"}},
    "partnership_marriage": {"houses": {7}, "planets": {"venus", "mars"}},
    "psychology": {"houses": {1, 4, 12}, "planets": {"moon", "saturn", "pluto"}},
    "talents": {"houses": {2, 5, 10, 11}, "planets": {"mercury", "venus", "jupiter"}},
}


def _ru_planet(p: str) -> str:
    return PLANET_RU.get(p, p)

def _ru_sign(s: str | None) -> str:
    if not s:
        return "?"
    return SIGN_RU.get(s, s)

def _ru_aspect(a: str | None) -> str:
    if not a:
        return "аспект"
    return ASPECT_RU.get(a, a)


def build_signals(
    natal_data: dict[str, Any],
    *,
    topic: str | None = None,
    max_items: int = 12,
    max_aspects: int = 8,
) -> list[str]:
    """
    Deterministic "key significators" list.
    Uses ONLY natal_data facts.
    """
    planets = natal_data.get("planets") or {}
    angles = natal_data.get("angles") or {}
    houses = natal_data.get("houses") or {}
    aspects = natal_data.get("aspects") or []

    focus = TOPIC_FOCUS.get(topic or "", None)
    focus_houses = focus["houses"] if focus else set()
    focus_planets = focus["planets"] if focus else set()

    out: list[str] = []

    # 1) Angles
    for a in ("asc", "mc"):
        v = angles.get(a) or {}
        sign = v.get("sign")
        if sign:
            out.append(f"{a.upper()} в знаке {_ru_sign(sign)}")

    # 2) Focus houses cusps (if available)
    for h in sorted({1, 7, 10} | set(focus_houses)):
        hv = houses.get(str(h)) or {}
        if hv.get("sign"):
            out.append(f"{h} дом в знаке {_ru_sign(hv['sign'])}")

    # 3) Planets: pick focus planets first, then “big three”
    def add_planet(p: str):
        pv = planets.get(p) or {}
        if not pv:
            return
        sign = pv.get("sign")
        house = pv.get("house")
        if sign and house:
            out.append(f"{_ru_planet(p)} в {_ru_sign(sign)}, {house} дом")
        elif sign:
            out.append(f"{_ru_planet(p)} в {_ru_sign(sign)}")

    for p in [*sorted(focus_planets)]:
        add_planet(p)

    for p in ["sun", "moon", "saturn"]:
        if p not in focus_planets:
            add_planet(p)

    # 4) Tight aspects (lowest orb first), optionally prioritize focus planets
    def orb(a: dict[str, Any]) -> float:
        try:
            return float(a.get("orb"))
        except Exception:
            return 999.0

    aspects_sorted = sorted([a for a in aspects if isinstance(a, dict)], key=orb)

    def score(a: dict[str, Any]) -> tuple[int, float]:
        p1 = a.get("p1")
        p2 = a.get("p2")
        in_focus = int((p1 in focus_planets) or (p2 in focus_planets))
        return (-in_focus, orb(a))

    if focus_planets:
        aspects_sorted = sorted(aspects_sorted, key=score)

    count = 0
    for a in aspects_sorted:
        if count >= max_aspects:
            break
        p1, p2, asp = a.get("p1"), a.get("p2"), a.get("aspect")
        if not p1 or not p2:
            continue
        out.append(f"{_ru_planet(p1)} {_ru_aspect(asp)} {_ru_planet(p2)} (орб {a.get('orb')})")
        count += 1

    # De-dup + trim
    seen = set()
    deduped = []
    for s in out:
        if s not in seen:
            seen.add(s)
            deduped.append(s)

    return deduped[:max_items]