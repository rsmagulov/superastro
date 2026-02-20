import json
from fastapi.testclient import TestClient

from app.main import app

TOPICS = [
    "personality_core",
    "psychology",
    "talents",
    "strengths_weaknesses",
    "purpose_path",
    "career",
    "money",
    "love_intimacy",
    "partnership_marriage",
    "karmic_tasks",
    "past_lives_symbolic",
    "emotional_world",
    "how_others_see_me",
    "self_esteem",
    "creativity",
    "ancestral_topics",
]


def test_e2e_v2_interpret_uses_topic_generic_as_fallback_via_debug_used_blocks():
    """
    Real pipeline test (user -> /v2/interpret -> key_builder -> knowledge.db)

    /v2 response topics[] does NOT include raw_blocks/knowledge_blocks; those are in meta.debug (debug=2).
    We assert that for each requested topic, debug.used_blocks_sample includes natal.<topic>.generic
    (seeded and higher priority than natal.generic).
    """
    client = TestClient(app)

    payload = {
        "name": "E2E Test",
        "birth": {
            "date": "1990-01-01",
            "time": "12:30:00",
            "place_query": "Almaty",
            "gender": "m",
            "unknown_time": False,
        },
        "topic_categories": TOPICS,
    }

    resp = client.post(
        "/v2/interpret",
        params={"locale": "ru", "debug": 2},
        content=json.dumps(payload).encode("utf-8"),
        headers={"content-type": "application/json"},
    )
    assert resp.status_code == 200, resp.text
    data = resp.json()

    dbg = (data.get("meta") or {}).get("debug") or {}
    dbg_topics = dbg.get("topics") or {}
    assert isinstance(dbg_topics, dict) and dbg_topics, f"meta.debug.topics missing; meta keys={list((data.get('meta') or {}).keys())}"

    missing = sorted(set(TOPICS) - set(dbg_topics.keys()))
    assert not missing, f"Missing topics in meta.debug.topics: {missing}. Present={sorted(dbg_topics.keys())}"

    for t in TOPICS:
        tdbg = dbg_topics.get(t) or {}
        used = tdbg.get("used_blocks_sample") or []
        assert isinstance(used, list), f"{t}: used_blocks_sample not a list: {type(used)}"

        expected = f"natal.{t}.generic"
        used_keys = [b.get("key") for b in used if isinstance(b, dict) and b.get("key")]

        assert expected in used_keys, (
            f"{t}: expected {expected} in used_blocks_sample keys.\n"
            f"used_keys={used_keys}\n"
            f"tdbg_keys={list(tdbg.keys())}"
        )
