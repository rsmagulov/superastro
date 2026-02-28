# ============================================================
# File: astroprocessor/tests/test_public_v2_buttons_endpoint.py  (REPLACE)
# ============================================================
from __future__ import annotations

from fastapi.testclient import TestClient

from app.main import app


def test_v2_buttons_endpoint_returns_settings_map(monkeypatch):
    import app.routers.public_v2 as public_v2

    monkeypatch.setattr(
        public_v2.settings,
        "button_topic_map",
        {"btn_x": ["personality_core"], "btn_y": ["career", "money"]},
        raising=False,
    )
    monkeypatch.setattr(
        public_v2.settings,
        "button_catalog",
        {"btn_y": {"label": "Career+Money", "order": 10, "icon": "💼", "is_enabled": False}},
        raising=False,
    )
    monkeypatch.setattr(public_v2.settings, "build_version", "code-v1", raising=False)
    monkeypatch.setattr(public_v2.settings, "knowledge_build_version", "kb-v2", raising=False)

    client = TestClient(app)
    resp = client.get("/v2/buttons")
    assert resp.status_code == 200, resp.text

    body = resp.json()
    assert body["ok"] is True

    assert body["meta"]["build_version"] == "kb-v2"
    assert isinstance(body["meta"]["etag"], str)
    assert len(body["meta"]["etag"]) == 16

    assert body["buttons"]["btn_x"]["topics"] == ["personality_core"]
    assert body["buttons"]["btn_x"]["label"] == "btn_x"
    assert body["buttons"]["btn_x"]["order"] == 0
    assert body["buttons"]["btn_x"]["icon"] is None
    assert body["buttons"]["btn_x"]["is_enabled"] is True

    assert body["buttons"]["btn_y"]["topics"] == ["career", "money"]
    assert body["buttons"]["btn_y"]["label"] == "Career+Money"
    assert body["buttons"]["btn_y"]["order"] == 10
    assert body["buttons"]["btn_y"]["icon"] == "💼"
    assert body["buttons"]["btn_y"]["is_enabled"] is False

    # Also ensure ETag header is set
    assert resp.headers.get("etag") == body["meta"]["etag"]
