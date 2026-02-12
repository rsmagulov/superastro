# ============================================================
# File: astroprocessor/tests/test_public_v2_perf.py
# ============================================================
from __future__ import annotations

from dataclasses import dataclass
from typing import Any, Callable

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


class _KB:
    def __init__(self, _id: str, keys: list[str]) -> None:
        self.id = _id
        self.candidate_keys = keys
        self.meta = {}


class _FakeResult:
    def fetchall(self) -> list[Any]:
        return []


class _FakeAsyncSession:
    def __init__(self) -> None:
        self.execute_calls = 0

    async def execute(self, *args: Any, **kwargs: Any) -> _FakeResult:
        self.execute_calls += 1
        return _FakeResult()


def test_v2_two_topics_one_knowledge_execute(monkeypatch):
    """
    Perf-contract:
    - /v2/interpret with 2 topics should hit knowledge DB with exactly 1 execute()
      (single query for all topics at once).
    """
    import app.routers.public_v2 as public_v2
    from app.db import get_knowledge_session, get_session

    fake_knowledge_session = _FakeAsyncSession()
    fake_main_session = object()

    # Avoid any real external work: geocode + astro calc + keybuilder
    async def fake_resolve_place(query: str, locale: str, session: Any):
        return _PlaceStub(query_raw=query, query_norm=query.casefold(), locale=locale)

    async def fake_build_natal(*, user_name: str, birth: Any, place: Any):
        return {"chart_type": "Natal"}

    def fake_build_knowledge_blocks(*, natal_data: dict, tone_namespace: str = "natal"):
        # minimal block set (still triggers repo batch query)
        return [_KB("asc_core", ["k1", "k2"]), _KB("sun_core", ["k3"])]

    monkeypatch.setattr(public_v2, "resolve_place", fake_resolve_place)
    monkeypatch.setattr(public_v2._chart_service, "build_natal", fake_build_natal)
    monkeypatch.setattr(public_v2._chart_service, "build_knowledge_blocks", fake_build_knowledge_blocks)

    # Override DI to inject our fake sessions
    app.dependency_overrides[get_knowledge_session] = lambda: fake_knowledge_session
    app.dependency_overrides[get_session] = lambda: fake_main_session

    try:
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

        # ✅ the whole point of the perf test
        assert fake_knowledge_session.execute_calls == 1
    finally:
        app.dependency_overrides.clear()
