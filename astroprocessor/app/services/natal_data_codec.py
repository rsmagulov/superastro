# ============================================================
# File: astroprocessor/app/services/natal_data_codec.py  (NEW)
# ============================================================
from __future__ import annotations

from typing import Any, Mapping


def to_plain_natal_data(value: Any) -> dict[str, Any]:
    """
    Normalize adapter output into a plain dict suitable for API responses.

    Guarantees:
    - returns dict
    - includes natal_data["chart_type"] == "Natal" (compat contract)
    """
    data = _to_plain_dict(value)
    data.setdefault("chart_type", "Natal")
    return data


def _to_plain_dict(value: Any) -> dict[str, Any]:
    if value is None:
        return {}

    if isinstance(value, dict):
        return value

    if isinstance(value, Mapping):
        return dict(value)

    model_dump = getattr(value, "model_dump", None)
    if callable(model_dump):
        dumped = model_dump()
        return dumped if isinstance(dumped, dict) else {"value": dumped}

    to_dict = getattr(value, "dict", None)
    if callable(to_dict):
        dumped = to_dict()
        return dumped if isinstance(dumped, dict) else {"value": dumped}

    d = getattr(value, "__dict__", None)
    if isinstance(d, dict) and d:
        return dict(d)
    
    return {"value": value}