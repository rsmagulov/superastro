# ============================================================
# File: astroprocessor/tests/test_public_v2_buttons_enabled_only_304.py  (NEW)
# ============================================================
from __future__ import annotations

from fastapi.testclient import TestClient

from app.main import app


def test_v2_buttons_enabled_only_if_none_match_returns_304(monkeypatch):
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

    first = client.get("/v2/buttons?enabled_only=1")
    assert first.status_code == 200, first.text
    etag = first.headers.get("etag")
    assert etag

    second = client.get("/v2/buttons?enabled_only=1", headers={"If-None-Match": etag})
    assert second.status_code == 304
    assert second.headers.get("etag") == etag
