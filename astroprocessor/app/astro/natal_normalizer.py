from __future__ import annotations

import re
from typing import Any, Dict, Optional

# Kerykeion даёт Leo / Sag / Vir и т.п.
SIGN_MAP = {
    "Ari": "aries", "Tau": "taurus", "Gem": "gemini", "Can": "cancer",
    "Leo": "leo", "Vir": "virgo", "Lib": "libra", "Sco": "scorpio",
    "Sag": "sagittarius", "Cap": "capricorn", "Aqu": "aquarius", "Pis": "pisces",

    # если вдруг придут полные названия
    "Aries": "aries", "Taurus": "taurus", "Gemini": "gemini", "Cancer": "cancer",
    "Leo": "leo", "Virgo": "virgo", "Libra": "libra", "Scorpio": "scorpio",
    "Sagittarius": "sagittarius", "Capricorn": "capricorn", "Aquarius": "aquarius", "Pisces": "pisces",
}

HOUSE_RE = re.compile(r"^(First|Second|Third|Fourth|Fifth|Sixth|Seventh|Eighth|Ninth|Tenth|Eleventh|Twelfth)_House$", re.I)
HOUSE_NUM = {
    "first": 1, "second": 2, "third": 3, "fourth": 4, "fifth": 5, "sixth": 6,
    "seventh": 7, "eighth": 8, "ninth": 9, "tenth": 10, "eleventh": 11, "twelfth": 12
}

PLANET_KEYS = ("sun","moon","mercury","venus","mars","jupiter","saturn","uranus","neptune","pluto")

def _canon_sign(x: Any) -> Optional[str]:
    if x is None:
        return None
    s = str(x).strip()
    return SIGN_MAP.get(s, s.lower())

def _house_to_int(x: Any) -> Optional[int]:
    if x is None:
        return None
    m = HOUSE_RE.match(str(x).strip())
    if not m:
        return None
    return HOUSE_NUM.get(m.group(1).lower())

def normalize_for_keybuilder(natal_data_raw: Dict[str, Any], *, unknown_time: bool) -> Dict[str, Any]:
    """
    Из kerykeion ChartDataFactory dump -> формат, который ждёт key_builder.build_knowledge_key_blocks()
    """
    subject = natal_data_raw.get("subject") or {}

    planets: Dict[str, Dict[str, Any]] = {}
    for p in PLANET_KEYS:
        node = subject.get(p)
        if isinstance(node, dict):
            planets[p] = {
                "sign": _canon_sign(node.get("sign")),
                "house": _house_to_int(node.get("house")) if not unknown_time else None,
            }

    angles: Dict[str, Any] = {}
    if not unknown_time:
        asc = subject.get("ascendant")
        mc = subject.get("medium_coeli")

        if isinstance(asc, dict):
            angles["asc"] = _canon_sign(asc.get("sign"))
        if isinstance(mc, dict):
            angles["mc"] = _canon_sign(mc.get("sign"))
    else:
        # unknown_time=True: ASC приближенно = знак Солнца (берем из нормализованных planets)
        sun_sign = (planets.get("sun") or {}).get("sign")
        if sun_sign:
            angles["asc"] = sun_sign
        # mc намеренно НЕ добавляем при неизвестном времени

    # аспекты подключим позже (можно вытащить из natal_data_raw["aspects"])
    return {
        "subject": {"unknown_time": bool(unknown_time)},
        "planets": planets,
        "angles": angles,
        # "aspects": ...
    }
