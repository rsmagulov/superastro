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


def test_v2_interpret_debug2_contains_keydiff(monkeypatch):
    import app.routers.public_v2 as public_v2

    async def fake_resolve_place(query: str, locale: str, session: Any):
        return _PlaceStub(query_raw=query, query_norm=query.casefold(), locale=locale)

    async def fake_build_natal(*, user_name: str, birth: Any, place: Any):
        return {"subject": {"unknown_time": False}, "planets": {"sun": {"sign": "leo", "house": 1}}}

    def fake_build_knowledge_blocks(*, natal_data: dict, tone_namespace: str = "natal"):
        # router берет knowledge_blocks_dump из cores_by_topic, так что тут можно вернуть что угодно
        return [{"id": "sun_core", "candidate_keys": ["natal.planet.sun.sign.leo", "natal.generic"], "meta": {}}]

    async def fake_interpret_topics_with_blocks_batch(*, session, knowledge_blocks, topic_categories, locale, max_blocks=50, max_chars=30_000):
        kb_dump = [{"id": "sun_core", "candidate_keys": ["natal.planet.sun.sign.leo", "natal.generic"], "meta": {}}]
        return {
            str(topic_categories[0]): {
                "final_text": "X",
                "raw_blocks": [{"block_id": "sun_core", "knowledge_item_id": 1, "key": "natal.generic", "priority": 1, "created_at": None, "text": "t"}],
                "knowledge_blocks": kb_dump,
                "trace": {"hits": [{"block_id": "sun_core", "key": "natal.generic", "knowledge_item_id": 1, "priority": 1, "created_at": None}]},
                "final_meta": {"blocks_used": 1},
            }
        }

    async def fake_debug_keydiff_for_topics(*, knowledge_session, topics, locale, knowledge_blocks_dump, **kwargs):
        return {
            "candidate_keys_total_unique": 2,
            "topics": {
                str(topics[0]): {
                    "candidate_keys_total_unique": 2,
                    "candidate_keys_missing_any_count": 1,
                    "candidate_keys_missing_any_sample": ["natal.planet.sun.sign.leo"],
                    "candidate_keys_no_active_nonempty_count": 0,
                    "candidate_keys_no_active_nonempty_sample": [],
                }
            },
            "limits": {"max_blocks": 12, "max_keys_total": 600, "max_sample": 60},
        }

    monkeypatch.setattr(public_v2, "resolve_place", fake_resolve_place)
    monkeypatch.setattr(public_v2._chart_service, "build_natal", fake_build_natal)
    monkeypatch.setattr(public_v2._chart_service, "build_knowledge_blocks", fake_build_knowledge_blocks)
    monkeypatch.setattr(public_v2._chart_service, "interpret_topics_with_blocks_batch", fake_interpret_topics_with_blocks_batch)
    monkeypatch.setattr(public_v2, "_debug_keydiff_for_topics", fake_debug_keydiff_for_topics)

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
        "topic_categories": ["personality_core"],
    }
    resp = client.post("/v2/interpret?locale=ru&debug=2", json=payload)
    assert resp.status_code == 200, resp.text
    body = resp.json()

    dbg = body["meta"]["debug"]
    assert dbg["debug"] == 2
    assert "keydiff" in dbg
    assert "topics" in dbg["keydiff"]
    assert "personality_core" in dbg["keydiff"]["topics"]
    tdbg = dbg["keydiff"]["topics"]["personality_core"]
    assert "candidate_keys_missing_any_sample" in tdbg
    assert tdbg["candidate_keys_missing_any_sample"] == ["natal.planet.sun.sign.leo"]
