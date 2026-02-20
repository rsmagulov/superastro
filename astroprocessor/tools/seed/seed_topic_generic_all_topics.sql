-- tools/seed/seed_topic_generic_all_topics.sql
-- Idempotent seed for 16 topics:
-- - natal.<topic>.generic (priority >= 80)
-- - natal.generic per topic (priority = 50)
-- SQLite-safe: no CTE spanning multiple statements, no BEGIN/COMMIT
-- meta_json is NOT NULL -> always '{}'
-- updated_at column does NOT exist -> do not reference it

-- Helper: topics as a derived table
-- (repeated where needed because executescript splits statements)
-- topics list:
-- personality_core, psychology, talents, strengths_weaknesses, purpose_path, career, money,
-- love_intimacy, partnership_marriage, karmic_tasks, past_lives_symbolic, emotional_world,
-- how_others_see_me, self_esteem, creativity, ancestral_topics

-- 1) Update existing natal.generic (force active + priority=50 + meta_json not null + non-empty text)
UPDATE knowledge_items
SET
  is_active = 1,
  priority = 50,
  meta_json = COALESCE(meta_json, '{}'),
  text = CASE
    WHEN text IS NULL OR LENGTH(TRIM(text)) = 0 THEN
      'Базовый общий блок натальной карты. Самый нижний fallback, когда специфические ключи недоступны.'
    ELSE text
  END
WHERE key = 'natal.generic'
  AND locale = 'ru-RU'
  AND topic_category IN (
    'personality_core','psychology','talents','strengths_weaknesses','purpose_path','career','money',
    'love_intimacy','partnership_marriage','karmic_tasks','past_lives_symbolic','emotional_world',
    'how_others_see_me','self_esteem','creativity','ancestral_topics'
  );

-- 2) Insert missing natal.generic per topic
INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT
  'natal.generic',
  t.topic_category,
  'ru-RU',
  'Базовый общий блок натальной карты. Самый нижний fallback, когда специфические ключи недоступны.',
  50,
  CAST(strftime('%s','now') AS TEXT),
  1,
  '{}'
FROM (
  SELECT 'personality_core' AS topic_category UNION ALL
  SELECT 'psychology' UNION ALL
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
) t
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items k
  WHERE k.key='natal.generic' AND k.topic_category=t.topic_category AND k.locale='ru-RU'
);

-- 3) Update existing natal.<topic>.generic (force active + priority>=80 + meta_json not null + non-empty text)
UPDATE knowledge_items
SET
  is_active = 1,
  priority = CASE WHEN priority < 80 THEN 80 ELSE priority END,
  meta_json = COALESCE(meta_json, '{}'),
  text = CASE
    WHEN text IS NULL OR LENGTH(TRIM(text)) = 0 THEN
      'Базовый блок темы: ' || topic_category || '. Fallback внутри темы, когда специфические ключи недоступны.'
    ELSE text
  END
WHERE locale='ru-RU'
  AND key LIKE 'natal.%\.generic' ESCAPE '\'
  AND key <> 'natal.generic'
  AND topic_category IN (
    'personality_core','psychology','talents','strengths_weaknesses','purpose_path','career','money',
    'love_intimacy','partnership_marriage','karmic_tasks','past_lives_symbolic','emotional_world',
    'how_others_see_me','self_esteem','creativity','ancestral_topics'
  );

-- 4) Insert missing natal.<topic>.generic rows
INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT
  'natal.' || t.topic_category || '.generic',
  t.topic_category,
  'ru-RU',
  'Базовый блок темы: ' || t.topic_category || '. Fallback внутри темы, когда специфические ключи недоступны.',
  80,
  CAST(strftime('%s','now') AS TEXT),
  1,
  '{}'
FROM (
  SELECT 'personality_core' AS topic_category UNION ALL
  SELECT 'psychology' UNION ALL
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
) t
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items k
  WHERE k.key=('natal.' || t.topic_category || '.generic')
    AND k.topic_category=t.topic_category
    AND k.locale='ru-RU'
);
