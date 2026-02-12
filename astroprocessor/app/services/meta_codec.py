# ============================================================
# File: astroprocessor/app/services/meta_codec.py  (NEW)
# ============================================================
from __future__ import annotations

from typing import Any


def build_response_meta(*, final_meta: dict[str, Any] | None, trace: dict[str, Any] | None) -> dict[str, Any]:
    """
    Contract meta builder.

    Current behavior:
    - base meta comes from final_meta (may be empty)
    - trace is nested under meta["trace"]
    """
    meta: dict[str, Any] = dict(final_meta or {})
    meta["trace"] = trace or {}
    return meta