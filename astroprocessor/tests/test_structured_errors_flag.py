# ============================================================
# File: astroprocessor/tests/test_structured_errors_flag.py  (NEW)
# ============================================================
from __future__ import annotations

from fastapi.testclient import TestClient

from app.main import app
from app.settings import settings


def test_structured_errors_flag_off_returns_plain_detail(monkeypatch):
    monkeypatch.setattr(settings, "structured_errors", False)

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
    assert resp.json()["detail"] == "only_ru_locale_supported"
