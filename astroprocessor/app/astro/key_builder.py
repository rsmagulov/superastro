# astro/key_builder.py
from __future__ import annotations
from dataclasses import dataclass
from typing import Any, Dict, List, Optional, Sequence, Tuple


# --- строгие словари нормализации ---

PLANETS = {
    "sun", "moon", "mercury", "venus", "mars",
    "jupiter", "saturn", "uranus", "neptune", "pluto",
}

SIGNS = {
    "aries", "taurus", "gemini", "cancer", "leo", "virgo",
    "libra", "scorpio", "sagittarius", "capricorn", "aquarius", "pisces",
}

ANGLES = {"asc", "mc"}

ASPECTS = {"conjunction", "sextile", "square", "trine", "opposition"}


class KeyBuilderError(ValueError):
    pass


@dataclass(frozen=True)
class KeyBlock:
    """
    Один смысловой блок ответа (например, Sun core, ASC, аспект Sun-Saturn).
    candidate_keys идут от наиболее специфичного к наиболее общему.
    """
    id: str
    candidate_keys: List[str]
    meta: Dict[str, Any]  # удобно для дебага/логов, но не обязательно использовать


def _norm_token(x: Any) -> str:
    if x is None:
        return ""
    return str(x).strip().lower()


def _require_in_set(name: str, value: str, allowed: set[str]) -> str:
    if value not in allowed:
        raise KeyBuilderError(f"Invalid {name}: '{value}'. Allowed: {sorted(allowed)}")
    return value


def _norm_house(h: Any) -> Optional[int]:
    if h is None:
        return None
    try:
        hi = int(h)
    except Exception as e:
        raise KeyBuilderError(f"Invalid house: '{h}'") from e
    if not (1 <= hi <= 12):
        raise KeyBuilderError(f"House out of range: {hi}")
    return hi


def _planet_sign_block(
    *,
    planet: str,
    sign: str,
    house: Optional[int],
    unknown_time: bool,
    tone_namespace: str = "natal",
) -> KeyBlock:
    # Базовый ключ
    base = f"{tone_namespace}.planet.{planet}.sign.{sign}"

    keys: List[str] = []
    # Дома только если время известно
    if not unknown_time and house is not None:
        keys.append(f"{base}.house.{house}")
        keys.append(f"{base}.house.any")

    keys.append(base)
    keys.append(f"{tone_namespace}.planet.{planet}.sign.any")
    keys.append(f"{tone_namespace}.planet.{planet}")
    keys.append(f"{tone_namespace}.generic")

    return KeyBlock(
        id=f"{planet}_core",
        candidate_keys=keys,
        meta={"planet": planet, "sign": sign, "house": house, "unknown_time": unknown_time},
    )


def _angle_block(
    *,
    angle: str,
    sign: str,
    tone_namespace: str = "natal",
) -> KeyBlock:
    base = f"{tone_namespace}.angle.{angle}.sign.{sign}"
    keys = [
        base,
        f"{tone_namespace}.angle.{angle}.sign.any",
        f"{tone_namespace}.angle.{angle}",
        f"{tone_namespace}.generic",
    ]
    return KeyBlock(
        id=f"{angle}_core",
        candidate_keys=keys,
        meta={"angle": angle, "sign": sign},
    )


def _aspect_block(
    *,
    p1: str,
    aspect: str,
    p2: str,
    tone_namespace: str = "natal",
) -> KeyBlock:
    # Симметрия: чтобы sun-square-moon и moon-square-sun давали один и тот же ключ
    a, b = sorted([p1, p2])
    base = f"{tone_namespace}.aspect.{a}.{aspect}.{b}"
    keys = [
        base,
        f"{tone_namespace}.aspect.{a}.any.{b}",
        f"{tone_namespace}.aspect.any.{aspect}.any",
        f"{tone_namespace}.aspect",
        f"{tone_namespace}.generic",
    ]
    return KeyBlock(
        id=f"aspect_{a}_{aspect}_{b}",
        candidate_keys=keys,
        meta={"p1": a, "aspect": aspect, "p2": b},
    )


def build_knowledge_key_blocks(
    natal_data: Dict[str, Any],
    *,
    tone_namespace: str = "natal",
    planets_order: Sequence[str] = ("sun", "moon", "mercury", "venus", "mars"),
    include_angles: bool = True,
    include_aspects: bool = True,
    max_aspects: int = 3,
) -> List[KeyBlock]:
    """
    Чистая функция: на вход нормализуемые астроданные, на выход блоки ключей.

    Ожидаемый natal_data (пример):
    {
      "subject": {"unknown_time": false},
      "planets": {
        "Sun": {"sign": "Leo", "house": 1},
        "Moon": {"sign": "Taurus", "house": 10}
      },
      "angles": {"ASC": "Leo", "MC": "Taurus"},
      "aspects": [{"p1":"Sun","aspect":"square","p2":"Moon"}]   # опционально
    }
    """
    subject = natal_data.get("subject", {})
    unknown_time = bool(subject.get("unknown_time", False))

    blocks: List[KeyBlock] = []

    # --- планеты ---
    planets_raw: Dict[str, Any] = natal_data.get("planets", {}) or {}
    # приводим ключи планет к lowercase-канону
    normalized_planets: Dict[str, Dict[str, Any]] = {}

    for k, v in planets_raw.items():
        pk = _norm_token(k)
        # допускаем вход Sun/Moon и т.п.
        if pk in PLANETS:
            planet = pk
        else:
            # часто приходит "Sun" -> "sun"
            planet = pk
            if planet not in PLANETS:
                raise KeyBuilderError(f"Unknown planet key: '{k}'")
        if not isinstance(v, dict):
            raise KeyBuilderError(f"Planet value must be dict for '{k}'")

        sign = _norm_token(v.get("sign"))
        sign = _require_in_set("sign", sign, SIGNS)
        house = _norm_house(v.get("house"))
        normalized_planets[planet] = {"sign": sign, "house": house}

    # строим блоки в заданном порядке (можно менять)
    for planet in planets_order:
        if planet in normalized_planets:
            sign = normalized_planets[planet]["sign"]
            house = normalized_planets[planet]["house"]
            blocks.append(
                _planet_sign_block(
                    planet=planet,
                    sign=sign,
                    house=house,
                    unknown_time=unknown_time,
                    tone_namespace=tone_namespace,
                )
            )

    # --- углы ---
    if include_angles:
        angles_raw: Dict[str, Any] = natal_data.get("angles", {}) or {}
        # ожидаем ASC/MC, но нормализуем
        for k, v in angles_raw.items():
            ak = _norm_token(k)
            # "ASC" -> "asc"
            if ak in {"ascendant", "asc"}:
                angle = "asc"
            elif ak in {"mc", "midheaven"}:
                # ✅ MC только если время известно
                if unknown_time:
                    continue
                angle = "mc"
            else:
                continue

            sign = _norm_token(v)
            sign = _require_in_set("sign", sign, SIGNS)
            blocks.append(_angle_block(angle=angle, sign=sign, tone_namespace=tone_namespace))

    # --- аспекты ---
    if include_aspects:
        aspects_raw = natal_data.get("aspects") or []
        if aspects_raw and not isinstance(aspects_raw, list):
            raise KeyBuilderError("aspects must be a list")

        # берём первые max_aspects (детерминированно)
        count = 0
        for a in aspects_raw:
            if count >= max_aspects:
                break
            if not isinstance(a, dict):
                continue
            p1 = _norm_token(a.get("p1"))
            p2 = _norm_token(a.get("p2"))
            asp = _norm_token(a.get("aspect"))

            # допускаем вход "Sun" -> "sun"
            if p1 not in PLANETS or p2 not in PLANETS:
                continue
            if asp not in ASPECTS:
                continue

            blocks.append(_aspect_block(p1=p1, aspect=asp, p2=p2, tone_namespace=tone_namespace))
            count += 1

    # --- общий блок только если вообще ничего не получилось ---
    if not blocks:
        blocks.append(
            KeyBlock(
                id="generic",
                candidate_keys=[f"{tone_namespace}.generic"],
                meta={"unknown_time": unknown_time},
            )
        )

    return blocks

