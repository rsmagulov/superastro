from __future__ import annotations

from fastapi.testclient import TestClient
from app.main import app


def test_debug_runtime_includes_knowledge_db_path(monkeypatch):
    import app.routers.public_v2 as public_v2

    async def fake_resolve_place(query: str, locale: str, session):
        class P:
            ok = True
            display_name = "Almaty"
            lat = 43.238949
            lon = 76.889709
            country_code = "kz"
            tz_str = "Asia/Almaty"
            source = "test_stub"
            error = None

            def require_ready(self): ...
        return P()

    async def fake_build_natal(*, user_name: str, birth, place):
        return {"subject": {"unknown_time": False}, "planets": {"sun": {"sign": "leo", "house": 1}}}

    async def fake_interpret_topics_with_blocks_batch(*, session, knowledge_blocks, topic_categories, locale, **_):
        return {str(topic_categories[0]): {"final_text": "X", "raw_blocks": [], "knowledge_blocks": []}}

    monkeypatch.setattr(public_v2, "resolve_place", fake_resolve_place)
    monkeypatch.setattr(public_v2._chart_service, "build_natal", fake_build_natal)
    monkeypatch.setattr(public_v2._chart_service, "interpret_topics_with_blocks_batch", fake_interpret_topics_with_blocks_batch)

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
    r = client.post("/v2/interpret?locale=ru&debug=2", json=payload)
    assert r.status_code == 200, r.text
    data = r.json()
    assert "debug_runtime" in data.get("meta", {})
    assert "knowledge_db_path" in data["meta"]["debug_runtime"]
