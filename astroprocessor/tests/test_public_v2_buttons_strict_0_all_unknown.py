# ============================================================
# File: astroprocessor/tests/test_public_v2_buttons_strict_0_all_unknown.py  (NEW)
# ============================================================
from __future__ import annotations

from fastapi.testclient import TestClient

from app.main import app


def test_v2_buttons_strict_0_all_unknown_returns_no_known_button_ids(monkeypatch):
    import app.routers.public_v2 as public_v2

    monkeypatch.setattr(public_v2.settings, "button_topic_map", {"btn_a": ["personality_core"]}, raising=False)
    monkeypatch.setattr(public_v2.settings, "button_catalog", {}, raising=False)

    client = TestClient(app)

    resp = client.get("/v2/buttons?ids=btn_missing&strict=0")
    assert resp.status_code == 200, resp.text
    body = resp.json()

    assert body["ok"] is False
    assert body["error"] == "no_known_button_ids"
    assert body["buttons"] == {}
    assert body["meta"]["ids"] == ["btn_missing"]
    assert body["meta"]["unknown_ids"] == ["btn_missing"]
    assert body["meta"]["strict"] is False

    etag = resp.headers.get("etag")
    assert etag == body["meta"]["etag"]

    # 304 works for this error too
    resp2 = client.get("/v2/buttons?ids=btn_missing&strict=0", headers={"If-None-Match": etag})
    assert resp2.status_code == 304
    assert resp2.headers.get("etag") == etag
