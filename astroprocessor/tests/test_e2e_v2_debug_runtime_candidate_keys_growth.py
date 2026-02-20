import json

from fastapi.testclient import TestClient

from app.main import app


def test_e2e_v2_debug_runtime_has_candidate_keys_total_unique_per_topic_and_it_varies():
    """
    Real pipeline sanity:
      /v2/interpret?debug=2 should include meta.debug_runtime.topics.<topic>.candidate_keys_total_unique
    and these values should not be all identical across topics (topic-aware keygen signal).
    """
    client = TestClient(app)

    topics = ["personality_core", "career", "money", "love_intimacy", "talents"]

    payload = {
        "name": "E2E Test B",
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

    dbg_rt = (data.get("meta") or {}).get("debug_runtime") or {}
    rt_topics = dbg_rt.get("topics") or {}
    assert isinstance(rt_topics, dict) and rt_topics, f"meta.debug_runtime.topics missing: keys={list(dbg_rt.keys())}"

    vals = {}
    for t in topics:
        t_rt = rt_topics.get(t) or {}
        assert "candidate_keys_total_unique" in t_rt, (
            f"{t}: candidate_keys_total_unique missing. t_rt keys={list(t_rt.keys())}"
        )
        v = int(t_rt["candidate_keys_total_unique"])
        assert v > 0, f"{t}: candidate_keys_total_unique must be > 0"
        vals[t] = v

    assert len(set(vals.values())) > 1, f"Expected variation across topics, got {vals}"
