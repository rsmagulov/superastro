# ============================================================
# File: astroprocessor/tests/test_error_contract_404.py  (PATCH)
# ============================================================
from __future__ import annotations

from fastapi.testclient import TestClient

from app.main import app
from tests.utils import assert_error


def test_error_404_has_structured_detail_and_request_id():
    client = TestClient(app)

    resp = client.get("/nope")
    body = assert_error(resp, 404, "not_found")

    assert body["detail"]["message"] == "Not Found"
    meta = body["detail"]["meta"]

    assert meta["path"] == "/nope"
    assert meta["method"] == "GET"
    assert resp.headers.get("x-request-id") == meta["request_id"]
