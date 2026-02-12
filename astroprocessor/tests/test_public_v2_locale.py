# ============================================================
# File: astroprocessor/tests/test_public_v2_locale.py  (NEW)
# ============================================================
from __future__ import annotations

from fastapi.testclient import TestClient

from app.main import app


def test_v2_locale_only_ru_returns_422():
    client = TestClient(app)

    payload = {
        "name": "Test",
        "birth": {
            "date": "1990-01-01",
            "time": "12:30:00",
            "place_query": "Almaty",
            "gender": "m",
            "unknown_time": False,
        },
        "topic_categories": ["personality_core"],
    }

    resp = client.post("/v2/interpret?locale=en", json=payload)
    assert resp.status_code == 422
    body = resp.json()
    assert body["detail"] == "only_ru_locale_supported"
