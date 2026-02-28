# ============================================================
# File: astroprocessor/tests/test_public_v2.py
# ============================================================
from __future__ import annotations

from dataclasses import dataclass
from typing import Any

from fastapi.testclient import TestClient

from app.main import app


@dataclass(frozen=True)
class _PlaceStub:
    ok: bool = True
    query_raw: str = "Almaty"
    query_norm: str = "almaty"
    locale: str = "ru"
    display_name: str = "Almaty, Kazakhstan"
    lat: float = 43.238949
    lon: float = 76.889709
    country_code: str = "kz"
    tz_str: str = "Asia/Almaty"
    source: str = "dev_stub"
    error: str | None = None

    def require_ready(self) -> None:
        return


def test_v2_interpret_multi_topics_build_natal_called_once(monkeypatch):
    """
    Contract:
    - /v2/interpret supports multiple topics
    - natal_data is computed once per request
    """
    # Import the module where router-level singletons live
    import app.routers.public_v2 as public_v2

    calls = {"build_natal": 0}

    async def fake_resolve_place(query: str, locale: str, session: Any):
        return _PlaceStub(query_raw=query, query_norm=query.casefold(), locale=locale)

    async def fake_build_natal(*, user_name: str, birth: Any, place: Any):
        calls["build_natal"] += 1
        return {"chart_type": "Natal"}  # minimal natal_data

    async def fake_interpret_topic_with_natal_data(
        *,
        session: Any,
        natal_data: dict,
        topic_category: str,
        locale: str,
        tone_namespace: str = "natal",
        max_blocks: int = 50,
        max_chars: int = 30_000,
    ):
        # minimal payload for V2 logic
        return {
            "final_text": f"Topic: {topic_category}",
            "raw_blocks": [{"block_id": "x", "knowledge_item_id": 1, "key": "k", "priority": 1, "created_at": None, "text": "t"}],
        }
    
    async def fake_interpret_topic_with_blocks(*, session, knowledge_blocks, topic_category, locale, max_blocks=50, max_chars=30_000):
        return {"final_text": f"Topic: {topic_category}", "raw_blocks": [{"block_id": "x", "knowledge_item_id": 1, "key": "k", "priority": 1, "created_at": None, "text": "t"}]}

    
    # Patch resolve_place used by V2 router
    monkeypatch.setattr(public_v2, "resolve_place", fake_resolve_place)

    # Patch the singleton ChartService instance inside the router module
    monkeypatch.setattr(public_v2._chart_service, "build_natal", fake_build_natal)
    monkeypatch.setattr(public_v2._chart_service, "interpret_topic_with_blocks", fake_interpret_topic_with_blocks)

    client = TestClient(app)

    payload = {
        "name": "Test",
        "birth": {
            "date": "1990-01-01",
            "time": "12:30:00",
            "place_query": "Almaty",
            "gender": "m",
            "unknown_time": False,
        },
        "topic_categories": ["personality_core", "career"],
    }

    resp = client.post("/v2/interpret?locale=ru", json=payload)
    assert resp.status_code == 200, resp.text
    body = resp.json()

    def _assert_v2_meta_contract(body: dict) -> None:
        assert "meta" in body and isinstance(body["meta"], dict)
        assert "build_version" in body["meta"]
        assert isinstance(body["meta"]["build_version"], str) and body["meta"]["build_version"]
        assert body["meta"].get("locale") in ("ru", "en", None) or isinstance(body["meta"].get("locale"), str)

        geocode = body["meta"].get("geocode")
        assert isinstance(geocode, dict)
        # ключи обязаны быть (значения могут быть None в error-case)
        assert "source" in geocode
        assert "timezone" in geocode
    
    _assert_v2_meta_contract(body)
    assert isinstance(body.get("request_id"), str)
    assert body["request_id"]  # должен быть непустой

    assert body["ok"] is True
    assert isinstance(body.get("topics"), list)
    assert len(body["topics"]) == 2
    assert calls["build_natal"] == 1

    # sanity: topics reflect requested categories
    got_topics = [t["topic_category"] for t in body["topics"]]
    assert got_topics == ["personality_core", "career"]

@dataclass(frozen=True)
class _PlaceFailStub:
    ok: bool = False
    query_raw: str = "Nowhere"
    query_norm: str = "nowhere"
    locale: str = "ru"
    display_name: str | None = None
    lat: float | None = None
    lon: float | None = None
    country_code: str | None = None
    tz_str: str | None = None
    source: str = "dev_stub"
    error: str = "place_not_resolved"

    def require_ready(self) -> None:
        return


def test_v2_interpret_place_not_resolved_returns_missing(monkeypatch):
    """
    Contract:
    - if place can't be resolved, V2 returns:
      ok=False, coverage="missing", topics=[], messages=[]
    """
    import app.routers.public_v2 as public_v2

    async def fake_resolve_place(query: str, locale: str, session: Any):
        return _PlaceFailStub(query_raw=query, query_norm=query.casefold(), locale=locale)

    monkeypatch.setattr(public_v2, "resolve_place", fake_resolve_place)

    client = TestClient(app)

    payload = {
        "name": "Test",
        "birth": {
            "date": "1990-01-01",
            "time": "12:30:00",
            "place_query": "Nowhere",
            "gender": "m",
            "unknown_time": False,
        },
        "topic_categories": ["personality_core", "career"],
    }

    resp = client.post("/v2/interpret?locale=ru", json=payload)
    assert resp.status_code == 200, resp.text
    body = resp.json()

    def _assert_v2_meta_contract(body: dict) -> None:
        assert "meta" in body and isinstance(body["meta"], dict)
        assert "build_version" in body["meta"]
        assert isinstance(body["meta"]["build_version"], str) and body["meta"]["build_version"]
        assert body["meta"].get("locale") in ("ru", "en", None) or isinstance(body["meta"].get("locale"), str)

        geocode = body["meta"].get("geocode")
        assert isinstance(geocode, dict)
        # ключи обязаны быть (значения могут быть None в error-case)
        assert "source" in geocode
        assert "timezone" in geocode

    _assert_v2_meta_contract(body)
    assert isinstance(body.get("request_id"), str)
    assert body["request_id"]  # тоже должен быть непустой

    assert body["ok"] is False
    assert body["coverage"] == "missing"
    assert body.get("topics") == []
    assert body.get("messages") == []
    assert body.get("error") in ("place_not_resolved", "place_not_resolved: place_not_resolved", "place_not_resolved")