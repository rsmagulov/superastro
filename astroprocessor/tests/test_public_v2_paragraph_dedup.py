# ============================================================
# File: astroprocessor/tests/test_public_v2_paragraph_dedup.py
# ============================================================
from __future__ import annotations

import app.routers.public_v2 as public_v2


def test_dedupe_keep_order_collapses_whitespace_only_duplicates() -> None:
    paras = [
        "Карьерный маркер: Сильная мотивация к росту.",
        "  Карьерный   маркер:\u00A0Сильная   мотивация к росту.  ",  # NBSP + multi spaces
        "Карьерный маркер: Сильная мотивация к росту.\n",
    ]
    got = public_v2._dedupe_keep_order(paras)
    assert got == ["Карьерный маркер: Сильная мотивация к росту."]


def test_dedupe_keep_order_does_not_remove_different_text() -> None:
    paras = [
        "Карьерный маркер: A.",
        "Карьерный маркер: B.",
        "Карьерный маркер: A.",  # exact duplicate
    ]
    got = public_v2._dedupe_keep_order(paras)
    assert got == ["Карьерный маркер: A.", "Карьерный маркер: B."]