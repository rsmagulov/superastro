from __future__ import annotations

from app.astro.key_builder import build_knowledge_key_blocks


def test_include_all_planets_adds_non_default_planets() -> None:
    natal_data = {
        "subject": {"unknown_time": False},
        "planets": {
            "sun": {"sign": "leo", "house": 1},
            "moon": {"sign": "taurus", "house": 10},
            "jupiter": {"sign": "virgo", "house": 2},
        },
        "angles": {"asc": "leo", "mc": "taurus"},
        "aspects": [],
    }

    blocks = build_knowledge_key_blocks(
        natal_data,
        tone_namespace="natal",
        include_all_planets=True,
        include_aspects=False,
    )
    ids = [b.id for b in blocks]
    assert "sun_core" in ids
    assert "moon_core" in ids
    assert "jupiter_core" in ids


def test_default_planets_order_unchanged_when_include_all_planets_false() -> None:
    natal_data = {
        "subject": {"unknown_time": False},
        "planets": {
            "sun": {"sign": "leo", "house": 1},
            "jupiter": {"sign": "virgo", "house": 2},
        },
        "angles": {"asc": "leo"},
        "aspects": [],
    }

    blocks = build_knowledge_key_blocks(natal_data, tone_namespace="natal", include_aspects=False)
    ids = [b.id for b in blocks]
    assert "sun_core" in ids
    assert "jupiter_core" not in ids
