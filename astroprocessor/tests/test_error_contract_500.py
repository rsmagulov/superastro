# ============================================================
# File: astroprocessor/tests/test_error_contract_500.py  (PATCH)
# ============================================================
from __future__ import annotations

from fastapi.testclient import TestClient

from app.main import app
from tests.utils import assert_error


def test_error_500_has_structured_detail_and_request_id():
    async def _boom():
        raise RuntimeError("boom")

    app.add_api_route("/__test__/boom", _boom, methods=["GET"])

    client = TestClient(app, raise_server_exceptions=False)
    resp = client.get("/__test__/boom")

    body = assert_error(resp, 500, "internal_server_error")
    assert body["detail"]["message"] == "Internal Server Error"

    meta = body["detail"]["meta"]
    assert meta["path"] == "/__test__/boom"
    assert meta["method"] == "GET"
    assert resp.headers.get("x-request-id") == meta["request_id"]
