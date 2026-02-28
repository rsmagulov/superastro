# ============================================================
# File: astroprocessor/tests/test_public_v2_locale.py  (PATCH)
# ============================================================
from fastapi.testclient import TestClient

from app.main import app
from tests.utils import assert_422_code


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
    assert_422_code(resp, "only_ru_locale_supported")
    body = resp.json()

    assert isinstance(body["detail"], dict)
    assert body["detail"]["code"] == "only_ru_locale_supported"
    assert body["detail"]["message"] == "only_ru_locale_supported"
