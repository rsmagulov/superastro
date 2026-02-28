# ============================================================
# File: astroprocessor/tests/test_public_v2_buttons_strict_1.py  (NEW)
# ============================================================
from __future__ import annotations

from fastapi.testclient import TestClient

from app.main import app


def test_v2_buttons_strict_1_unknown_ids_returns_error(monkeypatch):
    import app.routers.public_v2 as public_v2

    monkeypatch.setattr(
        public_v2.settings,
        "button_topic_map",
        {"btn_a": ["personality_core"]},
        raising=False,
    )
    monkeypatch.setattr(public_v2.settings, "button_catalog", {}, raising=False)

    client = TestClient(app)

    resp = client.get("/v2/buttons?ids=btn_a,btn_missing&strict=1")
    assert resp.status_code == 200, resp.text
    body = resp.json()

    assert body["ok"] is False
    assert body["error"] == "unknown_button_id"
    assert body["buttons"] == {}
    assert body["meta"]["unknown_ids"] == ["btn_missing"]
    assert body["meta"]["strict"] is True
