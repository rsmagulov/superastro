# ============================================================
# File: astroprocessor/tests/test_public_v2_buttons_ids_sources_422.py  (NEW)
# ============================================================
from __future__ import annotations

from fastapi.testclient import TestClient

from app.main import app
from tests.utils import assert_422_code


def test_v2_buttons_ids_and_ids_csv_together_returns_422(monkeypatch):
    import app.routers.public_v2 as public_v2

    monkeypatch.setattr(
        public_v2.settings,
        "button_topic_map",
        {"btn_a": ["personality_core"], "btn_b": ["career"]},
        raising=False,
    )
    monkeypatch.setattr(public_v2.settings, "button_catalog", {}, raising=False)

    client = TestClient(app)
    resp = client.get("/v2/buttons?ids=btn_a&ids_csv=btn_b")

    body = assert_422_code(resp, "use_only_one_of_ids_or_ids_csv")
    assert "Provide either" in body["detail"]["message"]

    body = resp.json()
    assert isinstance(body["detail"], dict)
    assert body["detail"]["code"] == "use_only_one_of_ids_or_ids_csv"
    assert "Provide either" in body["detail"]["message"]
    assert body["detail"]["meta"]["enabled_only"] is False
    assert body["detail"]["meta"]["strict"] is True