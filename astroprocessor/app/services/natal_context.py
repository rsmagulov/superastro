from __future__ import annotations

from typing import Any


def build_natal_context_v1(natal_data: dict[str, Any]) -> dict[str, Any]:
    """
    Deterministic grounding payload for LLM.

    Input: natal_data from ChartService.build_natal() (already plain dict).
    Output: compact, stable JSON with sorted aspects.
    """
    planets = natal_data.get("planets") or {}
    angles = natal_data.get("angles") or {}
    houses = natal_data.get("houses") or {}
    aspects = natal_data.get("aspects") or []
    subject = natal_data.get("subject") or {}
    probe = natal_data.get("__probe") or {}

    def _orb(x: Any) -> float:
        try:
            return float(x.get("orb", 999))
        except Exception:
            return 999.0

    aspects_sorted = sorted(
        [a for a in aspects if isinstance(a, dict)],
        key=lambda a: (_orb(a), str(a.get("aspect", "")), str(a.get("p1", "")), str(a.get("p2", ""))),
    )

    subject_min = {
        "tz": subject.get("tz"),
        "datetime": subject.get("datetime"),
        "houses_system": subject.get("houses_system"),
        "zodiac_type": subject.get("zodiac_type"),
    }

    return {
        "schema": "natal_context_v1",
        "chart_type": "natal",
        "subject_min": subject_min,
        "planets": planets,
        "angles": angles,
        "houses": houses,
        "aspects_sorted": aspects_sorted,
        "__probe": probe,
    }    