# ============================================================
# File: astroprocessor/tests/test_public_v2_buttons_ids_enabled_only.py  (NEW)
# ============================================================
from __future__ import annotations

from fastapi.testclient import TestClient

from app.main import app


def test_v2_buttons_ids_filter_then_enabled_only(monkeypatch):
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
            "btn_a": {"label": "A", "order": 1, "is_enabled": False},
            "btn_b": {"label": "B", "order": 2, "is_enabled": True},
        },
        raising=False,
    )

    client = TestClient(app)
    resp = client.get("/v2/buttons?ids=btn_a,btn_b&enabled_only=1")
    assert resp.status_code == 200, resp.text
    body = resp.json()

    assert set(body["buttons"].keys()) == {"btn_b"}
    assert body["meta"]["sorted_ids"] == ["btn_b"]
