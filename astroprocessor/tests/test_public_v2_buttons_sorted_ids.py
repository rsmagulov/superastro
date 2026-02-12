# ============================================================
# File: astroprocessor/tests/test_public_v2_buttons_sorted_ids.py  (NEW)
# ============================================================
from __future__ import annotations

from fastapi.testclient import TestClient

from app.main import app


def test_v2_buttons_sorted_ids_by_order_then_id(monkeypatch):
    import app.routers.public_v2 as public_v2

    monkeypatch.setattr(
        public_v2.settings,
        "button_topic_map",
        {"btn_b": ["career"], "btn_a": ["personality_core"], "btn_c": ["money"]},
        raising=False,
    )
    monkeypatch.setattr(
        public_v2.settings,
        "button_catalog",
        {
            "btn_a": {"label": "A", "order": 2, "is_enabled": True},
            "btn_b": {"label": "B", "order": 1, "is_enabled": True},
            "btn_c": {"label": "C", "order": 2, "is_enabled": True},
        },
        raising=False,
    )

    client = TestClient(app)
    resp = client.get("/v2/buttons")
    assert resp.status_code == 200, resp.text
    body = resp.json()

    assert body["meta"]["sorted_ids"] == ["btn_b", "btn_a", "btn_c"]
