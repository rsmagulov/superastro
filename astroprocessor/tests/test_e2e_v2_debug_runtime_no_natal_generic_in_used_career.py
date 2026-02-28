# astroprocessor/tests/test_e2e_v2_debug_runtime_no_natal_generic_in_used_career.py
from __future__ import annotations

import pytest
from fastapi.testclient import TestClient

from app.main import app


@pytest.mark.e2e
def test_v2_debug_used_has_no_natal_generic_for_career() -> None:
    client = TestClient(app)

    payload = {
        "name": "Test",
        "birth": {"date": "1990-01-01", "time": "12:00", "place_query": "Moscow", "gender": "male"},
        "topic_categories": ["career"],
    }

    r = client.post("/v2/interpret?locale=ru&debug=2&max_blocks=50", json=payload)
    assert r.status_code == 200, r.text
    data = r.json()
    assert data.get("ok") is True, data

    career_dbg = data["meta"]["debug"]["topics"]["career"]

    assert career_dbg["used_natal_generic_count"] == 0, career_dbg

    used_blocks = career_dbg.get("used_blocks_sample") or []
    assert all(b.get("key") != "natal.generic" for b in used_blocks), used_blocks