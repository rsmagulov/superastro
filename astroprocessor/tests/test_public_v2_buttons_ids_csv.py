# ============================================================
# File: astroprocessor/tests/test_public_v2_buttons_ids_csv.py  (NEW)
# ============================================================
from __future__ import annotations

from fastapi.testclient import TestClient

from app.main import app


def test_v2_buttons_ids_csv_works(monkeypatch):
    import app.routers.public_v2 as public_v2

    monkeypatch.setattr(
        public_v2.settings,
        "button_topic_map",
        {"btn_a": ["personality_core"], "btn_b": ["career"], "btn_c": ["money"]},
        raising=False,
    )
    monkeypatch.setattr(public_v2.settings, "button_catalog", {}, raising=False)

    client = TestClient(app)

    resp = client.get("/v2/buttons?ids_csv=btn_b,btn_a")
    assert resp.status_code == 200, resp.text
    body = resp.json()

    assert body["ok"] is True
    assert body["meta"]["ids"] == ["btn_b", "btn_a"]
    assert set(body["buttons"].keys()) == {"btn_a", "btn_b"}
