# tests/test_contract_natal_data.py
import json

from fastapi.testclient import TestClient

from app.main import app


def test_natal_data_has_chart_type_contract():
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
    }

    resp = client.post(
        "/v1/natal/interpret",
        params={"locale": "ru", "topic_category": "personality_core"},
        content=json.dumps(payload).encode("utf-8"),
        headers={"content-type": "application/json"},
    )
    assert resp.status_code == 200, resp.text
    body = resp.json()

    assert "natal_data" in body
    assert body["natal_data"]["chart_type"] == "Natal"
