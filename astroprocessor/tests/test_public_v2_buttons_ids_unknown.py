# ============================================================
# File: astroprocessor/tests/test_public_v2_buttons_ids_unknown.py  (NEW)
# ============================================================
from __future__ import annotations

from fastapi.testclient import TestClient

from app.main import app


def test_v2_buttons_ids_unknown_returns_error(monkeypatch):
    import app.routers.public_v2 as public_v2

    monkeypatch.setattr(
        public_v2.settings,
        "button_topic_map",
        {"btn_a": ["personality_core"]},
        raising=False,
    )
    monkeypatch.setattr(public_v2.settings, "button_catalog", {}, raising=False)

    client = TestClient(app)

    resp = client.get("/v2/buttons?ids=btn_a,btn_missing")
    assert resp.status_code == 200, resp.text
    body = resp.json()

    assert body["ok"] is False
    assert body["error"] == "unknown_button_id"
    assert body["buttons"] == {}
    assert body["meta"]["unknown_ids"] == ["btn_missing"]
    assert body["meta"]["ids"] == ["btn_a", "btn_missing"]

    etag = resp.headers.get("etag")
    assert etag == body["meta"]["etag"]
    assert isinstance(etag, str) and len(etag) == 16

    # 304 caching for the same error
    resp2 = client.get("/v2/buttons?ids=btn_a,btn_missing", headers={"If-None-Match": etag})
    assert resp2.status_code == 304
    assert resp2.headers.get("etag") == etag
