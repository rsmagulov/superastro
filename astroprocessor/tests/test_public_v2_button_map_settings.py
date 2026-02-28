# ============================================================
# File: astroprocessor/tests/test_public_v2_button_map_settings.py  (NEW)
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


def test_v2_button_map_from_settings_overrides(monkeypatch):
    import app.routers.public_v2 as public_v2

    # override settings map
    monkeypatch.setattr(
        public_v2.settings,
        "button_topic_map",
        {"btn_core_pack": ["money", "career"]},
        raising=False,
    )

    async def fake_resolve_place(query: str, locale: str, session: Any):
        return _PlaceStub(query_raw=query, query_norm=query.casefold(), locale=locale)

    async def fake_build_natal(*, user_name: str, birth: Any, place: Any):
        return {"chart_type": "Natal"}

    def fake_build_knowledge_blocks(*, natal_data: dict, tone_namespace: str = "natal"):
        return []

    async def fake_interpret_topics_with_blocks_batch(
        *,
        session: Any,
        knowledge_blocks: Any,
        topic_categories: list[str],
        locale: str,
        max_blocks: int = 50,
        max_chars: int = 30_000,
    ):
        return {t: {"final_text": f"Topic: {t}", "raw_blocks": [{"block_id": "x", "knowledge_item_id": 1, "key": "k", "priority": 1, "created_at": None, "text": "t"}]} for t in topic_categories}

    monkeypatch.setattr(public_v2, "resolve_place", fake_resolve_place)
    monkeypatch.setattr(public_v2._chart_service, "build_natal", fake_build_natal)
    monkeypatch.setattr(public_v2._chart_service, "build_knowledge_blocks", fake_build_knowledge_blocks)
    monkeypatch.setattr(public_v2._chart_service, "interpret_topics_with_blocks_batch", fake_interpret_topics_with_blocks_batch)

    client = TestClient(app)

    payload = {
        "button_id": "btn_core_pack",
        "topic_categories": [],
        "name": "Test",
        "birth": {
            "date": "1990-01-01",
            "time": "12:30:00",
            "place_query": "Almaty",
            "gender": "m",
            "unknown_time": False,
        },
    }

    resp = client.post("/v2/interpret?locale=ru", json=payload)
    assert resp.status_code == 200, resp.text
    body = resp.json()

    assert [t["topic_category"] for t in body["topics"]] == ["money", "career"]
    assert body["meta"]["topics"] == ["money", "career"]
