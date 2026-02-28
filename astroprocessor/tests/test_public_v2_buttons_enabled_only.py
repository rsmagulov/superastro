# ============================================================
# File: astroprocessor/tests/test_public_v2_buttons_enabled_only.py  (NEW)
# ============================================================
from __future__ import annotations

from fastapi.testclient import TestClient

from app.main import app


def test_v2_buttons_enabled_only_filters_disabled(monkeypatch):
    import app.routers.public_v2 as public_v2

    monkeypatch.setattr(
        public_v2.settings,
        "button_topic_map",
        {"btn_a": ["personality_core"], "btn_b": ["career"]},
        raising=False,
    )
    monkeypatch.setattr(
        public_v2.settings,
        "button_catalog",
        {
            "btn_a": {"label": "A", "order": 1, "is_enabled": True},
            "btn_b": {"label": "B", "order": 2, "is_enabled": False},
        },
        raising=False,
    )

    client = TestClient(app)

    resp = client.get("/v2/buttons?enabled_only=1")
    assert resp.status_code == 200, resp.text
    body = resp.json()

    assert body["ok"] is True
    assert "btn_a" in body["buttons"]
    assert "btn_b" not in body["buttons"]
    assert body["meta"]["enabled_only"] is True
