# ============================================================
# File: astroprocessor/tests/test_public_v2_buttons_etag_304.py  (NEW)
# ============================================================
from __future__ import annotations

from fastapi.testclient import TestClient

from app.main import app


def test_v2_buttons_if_none_match_returns_304(monkeypatch):
    import app.routers.public_v2 as public_v2

    monkeypatch.setattr(
        public_v2.settings,
        "button_topic_map",
        {"btn_x": ["personality_core"]},
        raising=False,
    )
    monkeypatch.setattr(public_v2.settings, "button_catalog", {}, raising=False)

    client = TestClient(app)

    first = client.get("/v2/buttons")
    assert first.status_code == 200, first.text
    etag = first.headers.get("etag")
    assert etag

    second = client.get("/v2/buttons", headers={"If-None-Match": etag})
    assert second.status_code == 304
    assert second.headers.get("etag") == etag
