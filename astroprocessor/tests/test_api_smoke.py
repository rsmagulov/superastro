# astroprocessor/tests/test_api_smoke.py
from __future__ import annotations

import json
from uuid import UUID

from fastapi.testclient import TestClient

from app.main import app


def _assert_x_request_id(resp) -> str:
    rid = resp.headers.get("x-request-id")
    assert rid, "Missing X-Request-ID header"
    UUID(rid)
    return rid


def _assert_request_id_in_body_and_header(resp) -> dict:
    rid = _assert_x_request_id(resp)
    body = resp.json()
    assert body.get("request_id") == rid, "Body request_id must match X-Request-ID"
    return body


def test_place_resolve_smoke():
    client = TestClient(app)

    resp = client.get("/v1/place/resolve", params={"q": "Almaty", "locale": "ru"})
    assert resp.status_code == 200, resp.text

    _assert_x_request_id(resp)  # place endpoint does NOT include request_id in body
    body = resp.json()
    assert body["ok"] is True
    assert body["query_raw"] == "Almaty"
    assert body["country_code"] in ("kz", "KZ")


def test_natal_interpret_known_time_smoke():
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

    body = _assert_request_id_in_body_and_header(resp)
    assert body["place"]["ok"] is True
    assert body["natal_data"]["chart_type"] == "Natal"
    assert body["natal_data"]["subject"]["houses_system_identifier"] == "P"


def test_natal_interpret_unknown_time_smoke():
    client = TestClient(app)

    payload = {
        "name": "Test",
        "birth": {
            "date": "1990-01-01",
            "time": None,
            "place_query": "Almaty",
            "gender": "m",
            "unknown_time": True,
        },
    }

    resp = client.post(
        "/v1/natal/interpret",
        params={"locale": "ru", "topic_category": "personality_core"},
        content=json.dumps(payload).encode("utf-8"),
        headers={"content-type": "application/json"},
    )
    assert resp.status_code == 200, resp.text

    body = _assert_request_id_in_body_and_header(resp)
    assert body["place"]["ok"] is True
    assert body["natal_data"]["chart_type"] == "Natal"
    assert "T12:00:00" in body["natal_data"]["subject"]["iso_formatted_local_datetime"]
