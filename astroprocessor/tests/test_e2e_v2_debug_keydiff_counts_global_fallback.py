# astroprocessor/tests/test_e2e_v2_debug_keydiff_counts_global_fallback.py
import pytest
from sqlalchemy import text as sql_text

from app.db import KnowledgeSessionLocal
from app.routers.public_v2 import _debug_keydiff_for_topics

pytestmark = pytest.mark.e2e


@pytest.mark.asyncio
async def test_keydiff_respects_global_fallback_for_presence_and_nonempty() -> None:
    """
    Regression guard:
    _debug_keydiff_for_topics MUST treat a key as covered if it exists as:
      - topic-specific OR
      - global (topic_category ''/NULL)
    matching KnowledgeRepo behavior.

    We don't depend on any chart generation / random candidate_keys.
    """
    test_key = "test.keydiff.global.only"
    topic = "personality_core"

    async with KnowledgeSessionLocal() as session:
        # Keep everything uncommitted so DB is not polluted.
        async with session.begin():
            # Ensure clean slate inside the transaction
            await session.execute(
                sql_text(
                    """
                    DELETE FROM knowledge_items
                    WHERE key = :key AND locale = 'ru-RU'
                      AND (topic_category = '' OR topic_category IS NULL OR topic_category = :topic)
                    """
                ),
                {"key": test_key, "topic": topic},
            )

            # Insert GLOBAL active+nonempty row only (topic_category='')
            await session.execute(
                sql_text(
                    """
                    INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
                    VALUES (:key, '', 'ru-RU', 'GLOBAL_OK', 10, CURRENT_TIMESTAMP, 1, '{}')
                    """
                ),
                {"key": test_key},
            )

            # Run keydiff with a controlled dump that includes ONLY our key
            knowledge_blocks_dump = [{"candidate_keys": [test_key]}]
            out = await _debug_keydiff_for_topics(
                knowledge_session=session,
                topics=[topic],
                locale="ru-RU",
                knowledge_blocks_dump=knowledge_blocks_dump,
                max_blocks=1,
                max_keys_total=10,
                max_sample=10,
            )

            t = out["topics"][topic]
            assert t["candidate_keys_missing_any_count"] == 0, t["candidate_keys_missing_any_sample"]
            assert t["candidate_keys_no_active_nonempty_count"] == 0, t["candidate_keys_no_active_nonempty_sample"]

            # Now flip global row inactive -> should become no_active_nonempty=1 (still "present", but not usable)
            await session.execute(
                sql_text(
                    """
                    UPDATE knowledge_items
                    SET is_active = 0
                    WHERE key = :key AND locale='ru-RU' AND (topic_category='' OR topic_category IS NULL)
                    """
                ),
                {"key": test_key},
            )

            out2 = await _debug_keydiff_for_topics(
                knowledge_session=session,
                topics=[topic],
                locale="ru-RU",
                knowledge_blocks_dump=knowledge_blocks_dump,
                max_blocks=1,
                max_keys_total=10,
                max_sample=10,
            )

            t2 = out2["topics"][topic]
            assert t2["candidate_keys_missing_any_count"] == 0, t2["candidate_keys_missing_any_sample"]
            assert t2["candidate_keys_no_active_nonempty_count"] == 1, t2["candidate_keys_no_active_nonempty_sample"]
            assert test_key in t2["candidate_keys_no_active_nonempty_sample"]