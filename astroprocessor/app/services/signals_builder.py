# astroprocessor/app/services/signals_builder.py
from __future__ import annotations

from dataclasses import dataclass
from typing import Any, Dict, List, Literal, Optional, Tuple


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
    "career": {"houses": {10, 6, 2}, "planets": {"sun", "saturn", "jupiter"}},
    "money": {"houses": {2, 8, 11}, "planets": {"venus", "jupiter", "saturn"}},
    "love_intimacy": {"houses": {5, 7, 8}, "planets": {"venus", "mars", "moon"}},
    "partnership_marriage": {"houses": {7}, "planets": {"venus", "mars"}},
    "psychology": {"houses": {1, 4, 12}, "planets": {"moon", "saturn", "pluto"}},
    "talents": {"houses": {2, 5, 10, 11}, "planets": {"mercury", "venus", "jupiter"}},
}

SignalType = Literal["angle", "house", "planet", "aspect"]


def _ru_planet(p: str) -> str:
    return PLANET_RU.get(p, p)


def _ru_sign(s: Optional[str]) -> str:
    return SIGN_RU.get(s or "", s or "?")


def _ru_aspect(a: Optional[str]) -> str:
    return ASPECT_RU.get(a or "", a or "аспект")


def _clamp01(x: float) -> float:
    return 0.0 if x < 0.0 else 1.0 if x > 1.0 else x


def _orb_value(a: Dict[str, Any]) -> float:
    try:
        return float(a.get("orb"))
    except Exception:
        return 999.0


def _angle_key(name: str, sign: str) -> str:
    return f"angle:{name}:sign:{sign}"


def _house_key(h: int, sign: str) -> str:
    return f"house:{h}:sign:{sign}"


def _planet_key(p: str, sign: str, house: int) -> str:
    return f"planet:{p}:sign:{sign}:house:{house}"


def _aspect_key(p1: str, p2: str, asp: str) -> str:
    lo, hi = sorted([p1, p2])
    return f"aspect:{lo}:{asp}:{hi}"


@dataclass(frozen=True)
class Signal:
    id: str
    type: SignalType
    text_ru: str
    weight: float
    reasons: Tuple[str, ...] = ()

    planet: Optional[str] = None
    house: Optional[int] = None
    sign: Optional[str] = None

    p1: Optional[str] = None
    p2: Optional[str] = None
    aspect: Optional[str] = None
    orb: Optional[float] = None


@dataclass(frozen=True)
class SignalsLimits:
    total: int = 12
    angles: int = 2
    houses: int = 4
    planets: int = 4
    aspects: int = 6


@dataclass(frozen=True)
class SignalsResponse:
    topic: Optional[str]
    signals: Tuple[Signal, ...]
    groups: Dict[SignalType, Tuple[Signal, ...]]
    compact_ru: Tuple[str, ...]
    top_ids: Tuple[str, ...]
    counts: Dict[str, int]


def _limits_for_topic(topic: Optional[str], *, total: int, max_aspects: int) -> SignalsLimits:
    if topic == "career":
        return SignalsLimits(total=total, angles=2, houses=4, planets=4, aspects=min(max_aspects, 6))
    if topic in ("love_intimacy", "partnership_marriage"):
        return SignalsLimits(total=total, angles=2, houses=4, planets=4, aspects=min(max_aspects, 8))
    if topic == "psychology":
        return SignalsLimits(total=total, angles=2, houses=4, planets=4, aspects=min(max_aspects, 8))
    return SignalsLimits(total=total, angles=2, houses=4, planets=4, aspects=min(max_aspects, 6))


def _weight_angle(name: str, sign: Optional[str]) -> Tuple[float, Tuple[str, ...]]:
    if not sign:
        return 0.0, ("missing_sign",)
    if name in ("asc", "mc"):
        return 0.88, ("angle_core",)
    return 0.70, ("angle_secondary",)


def _weight_house(h: int, sign: Optional[str], *, focus_houses: set[int]) -> Tuple[float, Tuple[str, ...]]:
    if not sign:
        return 0.0, ("missing_sign",)
    w = 0.55
    reasons: List[str] = ["house_cusp"]
    if h in (1, 4, 7, 10):
        w += 0.10
        reasons.append("angular_house_bonus")
    if h in focus_houses:
        w += 0.25
        reasons.append("topic_focus_house")
    return _clamp01(w), tuple(reasons)


def _weight_planet(p: str, house: Optional[int], *, focus_planets: set[str], focus_houses: set[int]) -> Tuple[float, Tuple[str, ...]]:
    w = 0.50
    reasons: List[str] = ["planet_position"]
    if p in ("sun", "moon"):
        w += 0.10
        reasons.append("luminary_bonus")
    if p in focus_planets:
        w += 0.25
        reasons.append("topic_focus_planet")
    if house in (1, 4, 7, 10):
        w += 0.10
        reasons.append("angular_house_bonus")
    if house is not None and house in focus_houses:
        w += 0.15
        reasons.append("topic_focus_house")
    return _clamp01(w), tuple(reasons)


def _weight_aspect(a: Dict[str, Any], *, focus_planets: set[str]) -> Tuple[float, Tuple[str, ...]]:
    p1 = str(a.get("p1") or "")
    p2 = str(a.get("p2") or "")
    asp = str(a.get("aspect") or "")
    o = _orb_value(a)

    w = 0.45
    reasons: List[str] = ["aspect"]

    if o <= 1.0:
        w += 0.35
        reasons.append("tight_orb<=1")
    elif o <= 2.0:
        w += 0.25
        reasons.append("tight_orb<=2")
    elif o <= 3.0:
        w += 0.15
        reasons.append("tight_orb<=3")

    if (p1 in focus_planets) or (p2 in focus_planets):
        w += 0.20
        reasons.append("topic_focus_planet")

    if asp in ("square", "opposition"):
        w += 0.05
        reasons.append("hard_aspect")
    elif asp in ("trine", "sextile"):
        w += 0.03
        reasons.append("soft_aspect")

    return _clamp01(w), tuple(reasons)


def build_signals_structured(
    natal_data: Dict[str, Any],
    *,
    topic: Optional[str] = None,
    max_items: int = 12,
    max_aspects: int = 8,
) -> SignalsResponse:
    planets = natal_data.get("planets") or {}
    angles = natal_data.get("angles") or {}
    houses = natal_data.get("houses") or {}
    aspects = natal_data.get("aspects") or natal_data.get("aspects_sorted") or []

    focus = TOPIC_FOCUS.get(topic or "", None)
    focus_houses: set[int] = set(focus["houses"]) if focus else set()
    focus_planets: set[str] = set(focus["planets"]) if focus else set()

    limits = _limits_for_topic(topic, total=max_items, max_aspects=max_aspects)

    collected: List[Signal] = []

    # 1) angles: include asc/mc/dsc/ic (your real schema)
    for a in ("asc", "mc", "dsc", "ic"):
        v = angles.get(a) or {}
        sign = v.get("sign")
        if not sign:
            continue
        w, reasons = _weight_angle(a, sign)
        collected.append(
            Signal(
                id=_angle_key(a, str(sign)),
                type="angle",
                sign=str(sign),
                text_ru=f"{a.upper()} в знаке {_ru_sign(str(sign))}",
                weight=w,
                reasons=reasons,
            )
        )

    # 2) house cusps: always angular + topic focus
    for h in sorted({1, 4, 7, 10} | set(focus_houses)):
        hv = houses.get(str(h)) or {}
        sign = hv.get("sign")
        if not sign:
            continue
        w, reasons = _weight_house(h, str(sign), focus_houses=focus_houses)
        collected.append(
            Signal(
                id=_house_key(h, str(sign)),
                type="house",
                house=h,
                sign=str(sign),
                text_ru=f"{h} дом в знаке {_ru_sign(str(sign))}",
                weight=w,
                reasons=reasons,
            )
        )

    # 3) planets: focus -> priority fallback until cap
    def add_planet(p: str) -> None:
        pv = planets.get(p) or {}
        sign = pv.get("sign")
        house = pv.get("house")
        if not sign or house is None:
            return
        try:
            house_i = int(house)
        except Exception:
            return

        w, reasons = _weight_planet(p, house_i, focus_planets=focus_planets, focus_houses=focus_houses)
        collected.append(
            Signal(
                id=_planet_key(p, str(sign), house_i),
                type="planet",
                planet=p,
                sign=str(sign),
                house=house_i,
                text_ru=f"{_ru_planet(p)} в {_ru_sign(str(sign))}, {house_i} дом",
                weight=w,
                reasons=reasons,
            )
        )

    for p in sorted(focus_planets):
        add_planet(p)

    fallback_planets = (
        "sun",
        "moon",
        "mercury",
        "venus",
        "mars",
        "jupiter",
        "saturn",
        "uranus",
        "neptune",
        "pluto",
        "chiron",
    )
    for p in fallback_planets:
        if p in focus_planets:
            continue
        add_planet(p)

    # 4) aspects (optional; schema expected: p1/p2/aspect/orb)
    aspects_list = [a for a in aspects if isinstance(a, dict)]
    aspects_sorted = sorted(aspects_list, key=_orb_value)

    def score_aspect(a: Dict[str, Any]) -> Tuple[int, float]:
        p1 = a.get("p1")
        p2 = a.get("p2")
        in_focus = int((p1 in focus_planets) or (p2 in focus_planets))
        return (-in_focus, _orb_value(a))

    if focus_planets:
        aspects_sorted = sorted(aspects_sorted, key=score_aspect)

    for a in aspects_sorted[: limits.aspects]:
        p1, p2, asp = a.get("p1"), a.get("p2"), a.get("aspect")
        if not p1 or not p2 or not asp:
            continue
        o = _orb_value(a)
        w, reasons = _weight_aspect(a, focus_planets=focus_planets)
        collected.append(
            Signal(
                id=_aspect_key(str(p1), str(p2), str(asp)),
                type="aspect",
                p1=str(p1),
                p2=str(p2),
                aspect=str(asp),
                orb=o,
                text_ru=f"{_ru_planet(str(p1))} {_ru_aspect(str(asp))} {_ru_planet(str(p2))} (орб {a.get('orb')})",
                weight=w,
                reasons=reasons,
            )
        )

    # Dedupe by id (keep highest weight)
    best_by_id: Dict[str, Signal] = {}
    for s in collected:
        prev = best_by_id.get(s.id)
        if prev is None or s.weight > prev.weight:
            best_by_id[s.id] = s

    all_unique = list(best_by_id.values())
    all_unique.sort(key=lambda s: (-s.weight, s.type, s.id))

    # Apply per-group caps + total
    groups: Dict[SignalType, List[Signal]] = {"angle": [], "house": [], "planet": [], "aspect": []}
    caps = {"angle": limits.angles, "house": limits.houses, "planet": limits.planets, "aspect": limits.aspects}

    for s in all_unique:
        if len(groups[s.type]) >= caps[s.type]:
            continue
        groups[s.type].append(s)

    ordered: List[Signal] = [*groups["angle"], *groups["house"], *groups["planet"], *groups["aspect"]]
    ordered = ordered[: limits.total]

    final_groups: Dict[SignalType, List[Signal]] = {"angle": [], "house": [], "planet": [], "aspect": []}
    for s in ordered:
        final_groups[s.type].append(s)

    compact = tuple(s.text_ru for s in ordered)
    top_ids = tuple(s.id for s in ordered)
    counts = {
        "total": len(ordered),
        "angles": len(final_groups["angle"]),
        "houses": len(final_groups["house"]),
        "planets": len(final_groups["planet"]),
        "aspects": len(final_groups["aspect"]),
    }

    return SignalsResponse(
        topic=topic,
        signals=tuple(ordered),
        groups={k: tuple(v) for k, v in final_groups.items()},
        compact_ru=compact,
        top_ids=top_ids,
        counts=counts,
    )


def build_signals(
    natal_data: Dict[str, Any],
    *,
    topic: Optional[str] = None,
    max_items: int = 12,
    max_aspects: int = 8,
) -> List[str]:
    return list(build_signals_structured(natal_data, topic=topic, max_items=max_items, max_aspects=max_aspects).compact_ru)