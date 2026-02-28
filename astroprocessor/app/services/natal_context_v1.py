# ============================================================
# File: astroprocessor/app/services/natal_context_v1.py
# ============================================================
from __future__ import annotations

from typing import Any


def _as_list(x: Any) -> list[Any]:
    if x is None:
        return []
    if isinstance(x, list):
        return x
    return [x]


def _get(d: dict[str, Any], *keys: str, default: Any = None) -> Any:
    cur: Any = d
    for k in keys:
        if not isinstance(cur, dict):
            return default
        cur = cur.get(k)
    return cur if cur is not None else default


def _stable_float(v: Any) -> float:
    try:
        return float(v)
    except Exception:
        return 9999.0


def build_natal_context_v1(natal_data: dict[str, Any]) -> dict[str, Any]:
    """
    Produce strict, stable JSON for LLM grounding.
    - Sort aspects by orb (asc), then by bodies (to stabilize)
    - Keep only deterministic structures; do not add interpretation text.
    """
    natal_data = natal_data or {}

    planets = _get(natal_data, "planets", default={}) or {}
    angles = _get(natal_data, "angles", default={}) or {}
    houses = _get(natal_data, "houses", default=[]) or []
    aspects = _as_list(_get(natal_data, "aspects", default=[]))

    def aspect_key(a: dict[str, Any]) -> tuple[float, str, str, str]:
        orb = _stable_float(a.get("orb") or a.get("orb_deg") or a.get("orb_degrees"))
        p1 = str(a.get("p1") or a.get("body1") or a.get("from") or "")
        p2 = str(a.get("p2") or a.get("body2") or a.get("to") or "")
        t = str(a.get("type") or a.get("aspect") or "")
        bodies = sorted([p1, p2])
        return (orb, bodies[0], bodies[1], t)

    aspects_sorted = sorted(
        (a for a in aspects if isinstance(a, dict)),
        key=aspect_key,
    )

    chart_type = _get(natal_data, "chart_type", default=None)
    subject_min = _get(natal_data, "subject", default=None)

    return {
        "schema": "natal_context_v1",
        "chart_type": chart_type,
        "subject_min": subject_min,
        "planets": planets,
        "angles": angles,
        "houses": houses,
        "aspects_sorted": aspects_sorted,
        "__probe": {
            "planets_n": len(planets) if isinstance(planets, dict) else 0,
            "angles_n": len(angles) if isinstance(angles, dict) else 0,
            "houses_n": len(houses) if isinstance(houses, list) else 0,
            "aspects_n": len(aspects_sorted),
        },
    }