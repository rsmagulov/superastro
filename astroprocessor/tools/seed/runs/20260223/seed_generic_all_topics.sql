-- seed_generic_all_topics.sql
-- Copies natal.generic from personality_core to other topic_category entries (ru-RU)

BEGIN;

-- remove old copies to make seed idempotent
DELETE FROM knowledge_items
WHERE key = 'natal.generic'
  AND locale = 'ru-RU'
  AND topic_category IN (
    'psychology','talents','strengths_weaknesses','purpose_path','career','money',
    'love_intimacy','partnership_marriage','karmic_tasks','past_lives_symbolic',
    'emotional_world','how_others_see_me','self_esteem','creativity','ancestral_topics'
  );

-- insert fresh copies
INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT
  src.key,
  tgt.topic_category,
  src.locale,
  src.text,
  src.priority,
  CAST(strftime('%s','now') AS TEXT) AS created_at,
  1 AS is_active,
  src.meta_json
FROM knowledge_items src
JOIN (
  SELECT 'psychology' AS topic_category UNION ALL
  SELECT 'talents' UNION ALL
  SELECT 'strengths_weaknesses' UNION ALL
  SELECT 'purpose_path' UNION ALL
  SELECT 'career' UNION ALL
  SELECT 'money' UNION ALL
  SELECT 'love_intimacy' UNION ALL
  SELECT 'partnership_marriage' UNION ALL
  SELECT 'karmic_tasks' UNION ALL
  SELECT 'past_lives_symbolic' UNION ALL
  SELECT 'emotional_world' UNION ALL
  SELECT 'how_others_see_me' UNION ALL
  SELECT 'self_esteem' UNION ALL
  SELECT 'creativity' UNION ALL
  SELECT 'ancestral_topics'
) tgt
WHERE src.key='natal.generic'
  AND src.topic_category='personality_core'
  AND src.locale='ru-RU'
  AND src.is_active=1
  AND src.text IS NOT NULL AND length(src.text)>0
LIMIT 1;

COMMIT;
