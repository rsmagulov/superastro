# ============================================================
# File: astroprocessor/tests/utils.py  (PATCH)
# ============================================================
from __future__ import annotations

from typing import Any


def assert_error(resp: Any, status_code: int, code: str) -> dict:
    """
    Assert our structured error format for ANY status:
      {"detail": {"code": str, "message": str, "meta": dict}}
    Returns parsed JSON.
    """
    assert resp.status_code == status_code, resp.text
    body = resp.json()

    assert isinstance(body, dict)
    assert isinstance(body.get("detail"), dict)

    detail = body["detail"]
    assert detail.get("code") == code
    assert isinstance(detail.get("message"), str)
    assert isinstance(detail.get("meta"), dict)

    meta = detail["meta"]
    assert isinstance(meta.get("request_id"), str) and meta["request_id"]
    assert isinstance(meta.get("path"), str) and meta["path"]
    assert isinstance(meta.get("method"), str) and meta["method"]

    return body


def assert_422_code(resp: Any, code: str) -> dict:
    return assert_error(resp, 422, code)
