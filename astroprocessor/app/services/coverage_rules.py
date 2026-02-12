# ============================================================
# File: astroprocessor/app/services/coverage_rules.py  (REPLACE)
# ============================================================
from __future__ import annotations

from typing import Any, Literal, Sequence

CoverageV2 = Literal["high", "low", "missing"]


def compute_coverage(*, raw_blocks: Sequence[Any] | None) -> str:
    """
    Internal V1-ish rule (kept for backwards compatibility).
    """
    if not raw_blocks:
        return "empty"
    return "ok"


def topic_coverage_v2(*, ok: bool, raw_blocks_used: int) -> CoverageV2:
    """
    Public coverage policy (V2):

    - ok=False => missing
    - ok=True and blocks_used == 0 => missing
    - ok=True and blocks_used < 3 => low
    - ok=True and blocks_used >= 3 => high
    """
    if not ok:
        return "missing"
    if raw_blocks_used <= 0:
        return "missing"
    if raw_blocks_used < 3:
        return "low"
    return "high"


def aggregate_coverage_v2(items: Sequence[CoverageV2]) -> CoverageV2:
    """
    Worst-of aggregation:
    missing > low > high
    """
    if not items:
        return "missing"
    if "missing" in items:
        return "missing"
    if "low" in items:
        return "low"
    return "high"