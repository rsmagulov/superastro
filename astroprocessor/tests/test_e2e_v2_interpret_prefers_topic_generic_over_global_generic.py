import json

from fastapi.testclient import TestClient

from app.main import app


def test_e2e_v2_interpret_prefers_topic_generic_over_global_generic():
    """
    Real pipeline test:
      user payload -> /v2/interpret -> topic-aware keygen -> knowledge.db
    Expectation:
      for each topic, at least one USED key should be natal.<topic>.generic,
      and it should outrank natal.generic (global).
    """
    client = TestClient(app)

    topics = ["career", "money", "love_intimacy"]

    payload = {
        "name": "E2E Test",
        "birth": {
            "date": "1990-01-01",
            "time": "12:30:00",
            "place_query": "Almaty",
            "gender": "m",
            "unknown_time": False,
        },
        "topic_categories": topics,
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
    assert isinstance(dbg_topics, dict) and dbg_topics, f"meta.debug.topics missing: keys={list(dbg.keys())}"

    for t in topics:
        tdbg = dbg_topics.get(t) or {}
        used = tdbg.get("used_blocks_sample") or []
        used_keys = [x.get("key") for x in used if isinstance(x, dict)]

        want_topic = f"natal.{t}.generic"
        want_global = "natal.generic"

        assert want_topic in used_keys, f"{t}: expected used key {want_topic}. used_keys(sample)={used_keys}"
        # if both exist in used sample, topic_generic should appear earlier (higher priority / earlier pick)
        if want_global in used_keys:
            assert used_keys.index(want_topic) <= used_keys.index(want_global), (
                f"{t}: expected {want_topic} to be preferred over {want_global}. used_keys(sample)={used_keys}"
            )
