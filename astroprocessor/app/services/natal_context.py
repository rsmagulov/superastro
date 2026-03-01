from __future__ import annotations

import json
from typing import Any


def _sorted_aspects(aspects: list[dict[str, Any]]) -> list[dict[str, Any]]:
    def orb(a: dict[str, Any]) -> float:
        try:
            return float(a.get("orb"))
        except Exception:
            return 999.0

    def to_dict(x: Any) -> dict[str, Any]:
        if x is None:
            return {}
        if isinstance(x, dict):
            return x
        # Mapping-like
        try:
            from collections.abc import Mapping
            if isinstance(x, Mapping):
                return dict(x)
        except Exception:
            pass

        md = getattr(x, "model_dump", None)
        if callable(md):
            y = md()
            return y if isinstance(y, dict) else {}

        d = getattr(x, "dict", None)
        if callable(d):
            y = d()
            return y if isinstance(y, dict) else {}

        dd = getattr(x, "__dict__", None)
        if isinstance(dd, dict) and dd:
            return dict(dd)

        return {}

    def extract_fields(a: dict[str, Any]) -> tuple[str | None, str | None, str | None, Any]:
        # primary schema
        p1 = a.get("p1") or a.get("planet1") or a.get("from") or a.get("a")
        p2 = a.get("p2") or a.get("planet2") or a.get("to") or a.get("b")
        asp = a.get("aspect") or a.get("type") or a.get("name")
        o = a.get("orb") or a.get("orb_deg") or a.get("orbital") or a.get("delta")
        return (
            str(p1) if p1 else None,
            str(p2) if p2 else None,
            str(asp) if asp else None,
            o,
        )

    clean: list[dict[str, Any]] = []
    for raw in aspects or []:
        a = to_dict(raw)
        if not a:
            continue

        p1, p2, asp, o = extract_fields(a)
        if not p1 or not p2 or not asp:
            continue

        clean.append({"p1": p1, "p2": p2, "aspect": asp, "orb": o})

    return sorted(clean, key=orb)


def build_natal_context_v1(natal_data: dict[str, Any]) -> dict[str, Any]:
    subject = natal_data.get("subject") or {}
    subject_min = {
        "tz": subject.get("tz") or subject.get("timezone") or subject.get("tz_str"),
        "datetime": subject.get("datetime") or subject.get("dt") or subject.get("iso_datetime"),
        "houses_system": subject.get("houses_system") or subject.get("houses_system_identifier"),
        "zodiac_type": subject.get("zodiac_type") or subject.get("zodiac") or subject.get("zodiac_system"),
    }

    return {
        "chart_type": "natal",
        "subject_min": subject_min,
        "planets": natal_data.get("planets") or {},
        "angles": natal_data.get("angles") or {},
        "houses": natal_data.get("houses") or {},
        "aspects_sorted": _sorted_aspects(natal_data.get("aspects") or []),
        "__probe": natal_data.get("__probe") or {},
    }


def dumps_natal_context_v1(natal_data: dict[str, Any]) -> str:
    return json.dumps(build_natal_context_v1(natal_data), ensure_ascii=False, indent=2)