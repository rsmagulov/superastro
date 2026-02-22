-- AUTO-GENERATED. DO NOT EDIT BY HAND.

-- Seeds natal.sign.<sign>.present for global + per-topic rows.

BEGIN;

UPDATE knowledge_items
SET text = 'Акцент знака: aries (если знак выражен в карте).', priority = 100, is_active = 1, meta_json = '{}'
WHERE key = 'natal.sign.aries.present' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.sign.aries.present', '', 'ru-RU', 'Акцент знака: aries (если знак выражен в карте).', 100, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.sign.aries.present' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Акцент знака: taurus (если знак выражен в карте).', priority = 100, is_active = 1, meta_json = '{}'
WHERE key = 'natal.sign.taurus.present' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.sign.taurus.present', '', 'ru-RU', 'Акцент знака: taurus (если знак выражен в карте).', 100, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.sign.taurus.present' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Акцент знака: gemini (если знак выражен в карте).', priority = 100, is_active = 1, meta_json = '{}'
WHERE key = 'natal.sign.gemini.present' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.sign.gemini.present', '', 'ru-RU', 'Акцент знака: gemini (если знак выражен в карте).', 100, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.sign.gemini.present' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Акцент знака: cancer (если знак выражен в карте).', priority = 100, is_active = 1, meta_json = '{}'
WHERE key = 'natal.sign.cancer.present' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.sign.cancer.present', '', 'ru-RU', 'Акцент знака: cancer (если знак выражен в карте).', 100, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.sign.cancer.present' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Акцент знака: leo (если знак выражен в карте).', priority = 100, is_active = 1, meta_json = '{}'
WHERE key = 'natal.sign.leo.present' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.sign.leo.present', '', 'ru-RU', 'Акцент знака: leo (если знак выражен в карте).', 100, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.sign.leo.present' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Акцент знака: virgo (если знак выражен в карте).', priority = 100, is_active = 1, meta_json = '{}'
WHERE key = 'natal.sign.virgo.present' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.sign.virgo.present', '', 'ru-RU', 'Акцент знака: virgo (если знак выражен в карте).', 100, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.sign.virgo.present' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Акцент знака: libra (если знак выражен в карте).', priority = 100, is_active = 1, meta_json = '{}'
WHERE key = 'natal.sign.libra.present' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.sign.libra.present', '', 'ru-RU', 'Акцент знака: libra (если знак выражен в карте).', 100, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.sign.libra.present' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Акцент знака: scorpio (если знак выражен в карте).', priority = 100, is_active = 1, meta_json = '{}'
WHERE key = 'natal.sign.scorpio.present' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.sign.scorpio.present', '', 'ru-RU', 'Акцент знака: scorpio (если знак выражен в карте).', 100, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.sign.scorpio.present' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Акцент знака: sagittarius (если знак выражен в карте).', priority = 100, is_active = 1, meta_json = '{}'
WHERE key = 'natal.sign.sagittarius.present' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.sign.sagittarius.present', '', 'ru-RU', 'Акцент знака: sagittarius (если знак выражен в карте).', 100, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.sign.sagittarius.present' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Акцент знака: capricorn (если знак выражен в карте).', priority = 100, is_active = 1, meta_json = '{}'
WHERE key = 'natal.sign.capricorn.present' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.sign.capricorn.present', '', 'ru-RU', 'Акцент знака: capricorn (если знак выражен в карте).', 100, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.sign.capricorn.present' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Акцент знака: aquarius (если знак выражен в карте).', priority = 100, is_active = 1, meta_json = '{}'
WHERE key = 'natal.sign.aquarius.present' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.sign.aquarius.present', '', 'ru-RU', 'Акцент знака: aquarius (если знак выражен в карте).', 100, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.sign.aquarius.present' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Акцент знака: pisces (если знак выражен в карте).', priority = 100, is_active = 1, meta_json = '{}'
WHERE key = 'natal.sign.pisces.present' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.sign.pisces.present', '', 'ru-RU', 'Акцент знака: pisces (если знак выражен в карте).', 100, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.sign.pisces.present' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = '(ancestral_topics) Акцент знака: aries.', priority = 102, is_active = 1, meta_json = '{}'
WHERE key = 'natal.sign.aries.present' AND locale = 'ru-RU' AND (topic_category = 'ancestral_topics');

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.sign.aries.present', 'ancestral_topics', 'ru-RU', '(ancestral_topics) Акцент знака: aries.', 102, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.sign.aries.present' AND locale = 'ru-RU' AND (topic_category = 'ancestral_topics')
);

UPDATE knowledge_items
SET text = '(ancestral_topics) Акцент знака: taurus.', priority = 102, is_active = 1, meta_json = '{}'
WHERE key = 'natal.sign.taurus.present' AND locale = 'ru-RU' AND (topic_category = 'ancestral_topics');

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.sign.taurus.present', 'ancestral_topics', 'ru-RU', '(ancestral_topics) Акцент знака: taurus.', 102, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.sign.taurus.present' AND locale = 'ru-RU' AND (topic_category = 'ancestral_topics')
);

UPDATE knowledge_items
SET text = '(ancestral_topics) Акцент знака: gemini.', priority = 102, is_active = 1, meta_json = '{}'
WHERE key = 'natal.sign.gemini.present' AND locale = 'ru-RU' AND (topic_category = 'ancestral_topics');

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.sign.gemini.present', 'ancestral_topics', 'ru-RU', '(ancestral_topics) Акцент знака: gemini.', 102, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.sign.gemini.present' AND locale = 'ru-RU' AND (topic_category = 'ancestral_topics')
);

UPDATE knowledge_items
SET text = '(ancestral_topics) Акцент знака: cancer.', priority = 102, is_active = 1, meta_json = '{}'
WHERE key = 'natal.sign.cancer.present' AND locale = 'ru-RU' AND (topic_category = 'ancestral_topics');

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.sign.cancer.present', 'ancestral_topics', 'ru-RU', '(ancestral_topics) Акцент знака: cancer.', 102, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.sign.cancer.present' AND locale = 'ru-RU' AND (topic_category = 'ancestral_topics')
);

UPDATE knowledge_items
SET text = '(ancestral_topics) Акцент знака: leo.', priority = 102, is_active = 1, meta_json = '{}'
WHERE key = 'natal.sign.leo.present' AND locale = 'ru-RU' AND (topic_category = 'ancestral_topics');

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.sign.leo.present', 'ancestral_topics', 'ru-RU', '(ancestral_topics) Акцент знака: leo.', 102, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.sign.leo.present' AND locale = 'ru-RU' AND (topic_category = 'ancestral_topics')
);

UPDATE knowledge_items
SET text = '(ancestral_topics) Акцент знака: virgo.', priority = 102, is_active = 1, meta_json = '{}'
WHERE key = 'natal.sign.virgo.present' AND locale = 'ru-RU' AND (topic_category = 'ancestral_topics');

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.sign.virgo.present', 'ancestral_topics', 'ru-RU', '(ancestral_topics) Акцент знака: virgo.', 102, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.sign.virgo.present' AND locale = 'ru-RU' AND (topic_category = 'ancestral_topics')
);

UPDATE knowledge_items
SET text = '(ancestral_topics) Акцент знака: libra.', priority = 102, is_active = 1, meta_json = '{}'
WHERE key = 'natal.sign.libra.present' AND locale = 'ru-RU' AND (topic_category = 'ancestral_topics');

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.sign.libra.present', 'ancestral_topics', 'ru-RU', '(ancestral_topics) Акцент знака: libra.', 102, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.sign.libra.present' AND locale = 'ru-RU' AND (topic_category = 'ancestral_topics')
);

UPDATE knowledge_items
SET text = '(ancestral_topics) Акцент знака: scorpio.', priority = 102, is_active = 1, meta_json = '{}'
WHERE key = 'natal.sign.scorpio.present' AND locale = 'ru-RU' AND (topic_category = 'ancestral_topics');

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.sign.scorpio.present', 'ancestral_topics', 'ru-RU', '(ancestral_topics) Акцент знака: scorpio.', 102, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.sign.scorpio.present' AND locale = 'ru-RU' AND (topic_category = 'ancestral_topics')
);

UPDATE knowledge_items
SET text = '(ancestral_topics) Акцент знака: sagittarius.', priority = 102, is_active = 1, meta_json = '{}'
WHERE key = 'natal.sign.sagittarius.present' AND locale = 'ru-RU' AND (topic_category = 'ancestral_topics');

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.sign.sagittarius.present', 'ancestral_topics', 'ru-RU', '(ancestral_topics) Акцент знака: sagittarius.', 102, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.sign.sagittarius.present' AND locale = 'ru-RU' AND (topic_category = 'ancestral_topics')
);

UPDATE knowledge_items
SET text = '(ancestral_topics) Акцент знака: capricorn.', priority = 102, is_active = 1, meta_json = '{}'
WHERE key = 'natal.sign.capricorn.present' AND locale = 'ru-RU' AND (topic_category = 'ancestral_topics');

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.sign.capricorn.present', 'ancestral_topics', 'ru-RU', '(ancestral_topics) Акцент знака: capricorn.', 102, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.sign.capricorn.present' AND locale = 'ru-RU' AND (topic_category = 'ancestral_topics')
);

UPDATE knowledge_items
SET text = '(ancestral_topics) Акцент знака: aquarius.', priority = 102, is_active = 1, meta_json = '{}'
WHERE key = 'natal.sign.aquarius.present' AND locale = 'ru-RU' AND (topic_category = 'ancestral_topics');

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.sign.aquarius.present', 'ancestral_topics', 'ru-RU', '(ancestral_topics) Акцент знака: aquarius.', 102, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.sign.aquarius.present' AND locale = 'ru-RU' AND (topic_category = 'ancestral_topics')
);

UPDATE knowledge_items
SET text = '(ancestral_topics) Акцент знака: pisces.', priority = 102, is_active = 1, meta_json = '{}'
WHERE key = 'natal.sign.pisces.present' AND locale = 'ru-RU' AND (topic_category = 'ancestral_topics');

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.sign.pisces.present', 'ancestral_topics', 'ru-RU', '(ancestral_topics) Акцент знака: pisces.', 102, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.sign.pisces.present' AND locale = 'ru-RU' AND (topic_category = 'ancestral_topics')
);

UPDATE knowledge_items
SET text = '(career) Акцент знака: aries.', priority = 102, is_active = 1, meta_json = '{}'
WHERE key = 'natal.sign.aries.present' AND locale = 'ru-RU' AND (topic_category = 'career');

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.sign.aries.present', 'career', 'ru-RU', '(career) Акцент знака: aries.', 102, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.sign.aries.present' AND locale = 'ru-RU' AND (topic_category = 'career')
);

UPDATE knowledge_items
SET text = '(career) Акцент знака: taurus.', priority = 102, is_active = 1, meta_json = '{}'
WHERE key = 'natal.sign.taurus.present' AND locale = 'ru-RU' AND (topic_category = 'career');

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.sign.taurus.present', 'career', 'ru-RU', '(career) Акцент знака: taurus.', 102, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.sign.taurus.present' AND locale = 'ru-RU' AND (topic_category = 'career')
);

UPDATE knowledge_items
SET text = '(career) Акцент знака: gemini.', priority = 102, is_active = 1, meta_json = '{}'
WHERE key = 'natal.sign.gemini.present' AND locale = 'ru-RU' AND (topic_category = 'career');

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.sign.gemini.present', 'career', 'ru-RU', '(career) Акцент знака: gemini.', 102, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.sign.gemini.present' AND locale = 'ru-RU' AND (topic_category = 'career')
);

UPDATE knowledge_items
SET text = '(career) Акцент знака: cancer.', priority = 102, is_active = 1, meta_json = '{}'
WHERE key = 'natal.sign.cancer.present' AND locale = 'ru-RU' AND (topic_category = 'career');

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.sign.cancer.present', 'career', 'ru-RU', '(career) Акцент знака: cancer.', 102, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.sign.cancer.present' AND locale = 'ru-RU' AND (topic_category = 'career')
);

UPDATE knowledge_items
SET text = '(career) Акцент знака: leo.', priority = 102, is_active = 1, meta_json = '{}'
WHERE key = 'natal.sign.leo.present' AND locale = 'ru-RU' AND (topic_category = 'career');

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.sign.leo.present', 'career', 'ru-RU', '(career) Акцент знака: leo.', 102, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.sign.leo.present' AND locale = 'ru-RU' AND (topic_category = 'career')
);

UPDATE knowledge_items
SET text = '(career) Акцент знака: virgo.', priority = 102, is_active = 1, meta_json = '{}'
WHERE key = 'natal.sign.virgo.present' AND locale = 'ru-RU' AND (topic_category = 'career');

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.sign.virgo.present', 'career', 'ru-RU', '(career) Акцент знака: virgo.', 102, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.sign.virgo.present' AND locale = 'ru-RU' AND (topic_category = 'career')
);

UPDATE knowledge_items
SET text = '(career) Акцент знака: libra.', priority = 102, is_active = 1, meta_json = '{}'
WHERE key = 'natal.sign.libra.present' AND locale = 'ru-RU' AND (topic_category = 'career');

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.sign.libra.present', 'career', 'ru-RU', '(career) Акцент знака: libra.', 102, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.sign.libra.present' AND locale = 'ru-RU' AND (topic_category = 'career')
);

UPDATE knowledge_items
SET text = '(career) Акцент знака: scorpio.', priority = 102, is_active = 1, meta_json = '{}'
WHERE key = 'natal.sign.scorpio.present' AND locale = 'ru-RU' AND (topic_category = 'career');

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.sign.scorpio.present', 'career', 'ru-RU', '(career) Акцент знака: scorpio.', 102, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.sign.scorpio.present' AND locale = 'ru-RU' AND (topic_category = 'career')
);

UPDATE knowledge_items
SET text = '(career) Акцент знака: sagittarius.', priority = 102, is_active = 1, meta_json = '{}'
WHERE key = 'natal.sign.sagittarius.present' AND locale = 'ru-RU' AND (topic_category = 'career');

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.sign.sagittarius.present', 'career', 'ru-RU', '(career) Акцент знака: sagittarius.', 102, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.sign.sagittarius.present' AND locale = 'ru-RU' AND (topic_category = 'career')
);

UPDATE knowledge_items
SET text = '(career) Акцент знака: capricorn.', priority = 102, is_active = 1, meta_json = '{}'
WHERE key = 'natal.sign.capricorn.present' AND locale = 'ru-RU' AND (topic_category = 'career');

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.sign.capricorn.present', 'career', 'ru-RU', '(career) Акцент знака: capricorn.', 102, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.sign.capricorn.present' AND locale = 'ru-RU' AND (topic_category = 'career')
);

UPDATE knowledge_items
SET text = '(career) Акцент знака: aquarius.', priority = 102, is_active = 1, meta_json = '{}'
WHERE key = 'natal.sign.aquarius.present' AND locale = 'ru-RU' AND (topic_category = 'career');

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.sign.aquarius.present', 'career', 'ru-RU', '(career) Акцент знака: aquarius.', 102, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.sign.aquarius.present' AND locale = 'ru-RU' AND (topic_category = 'career')
);

UPDATE knowledge_items
SET text = '(career) Акцент знака: pisces.', priority = 102, is_active = 1, meta_json = '{}'
WHERE key = 'natal.sign.pisces.present' AND locale = 'ru-RU' AND (topic_category = 'career');

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.sign.pisces.present', 'career', 'ru-RU', '(career) Акцент знака: pisces.', 102, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.sign.pisces.present' AND locale = 'ru-RU' AND (topic_category = 'career')
);

UPDATE knowledge_items
SET text = '(creativity) Акцент знака: aries.', priority = 102, is_active = 1, meta_json = '{}'
WHERE key = 'natal.sign.aries.present' AND locale = 'ru-RU' AND (topic_category = 'creativity');

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.sign.aries.present', 'creativity', 'ru-RU', '(creativity) Акцент знака: aries.', 102, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.sign.aries.present' AND locale = 'ru-RU' AND (topic_category = 'creativity')
);

UPDATE knowledge_items
SET text = '(creativity) Акцент знака: taurus.', priority = 102, is_active = 1, meta_json = '{}'
WHERE key = 'natal.sign.taurus.present' AND locale = 'ru-RU' AND (topic_category = 'creativity');

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.sign.taurus.present', 'creativity', 'ru-RU', '(creativity) Акцент знака: taurus.', 102, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.sign.taurus.present' AND locale = 'ru-RU' AND (topic_category = 'creativity')
);

UPDATE knowledge_items
SET text = '(creativity) Акцент знака: gemini.', priority = 102, is_active = 1, meta_json = '{}'
WHERE key = 'natal.sign.gemini.present' AND locale = 'ru-RU' AND (topic_category = 'creativity');

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.sign.gemini.present', 'creativity', 'ru-RU', '(creativity) Акцент знака: gemini.', 102, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.sign.gemini.present' AND locale = 'ru-RU' AND (topic_category = 'creativity')
);

UPDATE knowledge_items
SET text = '(creativity) Акцент знака: cancer.', priority = 102, is_active = 1, meta_json = '{}'
WHERE key = 'natal.sign.cancer.present' AND locale = 'ru-RU' AND (topic_category = 'creativity');

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.sign.cancer.present', 'creativity', 'ru-RU', '(creativity) Акцент знака: cancer.', 102, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.sign.cancer.present' AND locale = 'ru-RU' AND (topic_category = 'creativity')
);

UPDATE knowledge_items
SET text = '(creativity) Акцент знака: leo.', priority = 102, is_active = 1, meta_json = '{}'
WHERE key = 'natal.sign.leo.present' AND locale = 'ru-RU' AND (topic_category = 'creativity');

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.sign.leo.present', 'creativity', 'ru-RU', '(creativity) Акцент знака: leo.', 102, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.sign.leo.present' AND locale = 'ru-RU' AND (topic_category = 'creativity')
);

UPDATE knowledge_items
SET text = '(creativity) Акцент знака: virgo.', priority = 102, is_active = 1, meta_json = '{}'
WHERE key = 'natal.sign.virgo.present' AND locale = 'ru-RU' AND (topic_category = 'creativity');

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.sign.virgo.present', 'creativity', 'ru-RU', '(creativity) Акцент знака: virgo.', 102, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.sign.virgo.present' AND locale = 'ru-RU' AND (topic_category = 'creativity')
);

UPDATE knowledge_items
SET text = '(creativity) Акцент знака: libra.', priority = 102, is_active = 1, meta_json = '{}'
WHERE key = 'natal.sign.libra.present' AND locale = 'ru-RU' AND (topic_category = 'creativity');

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.sign.libra.present', 'creativity', 'ru-RU', '(creativity) Акцент знака: libra.', 102, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.sign.libra.present' AND locale = 'ru-RU' AND (topic_category = 'creativity')
);

UPDATE knowledge_items
SET text = '(creativity) Акцент знака: scorpio.', priority = 102, is_active = 1, meta_json = '{}'
WHERE key = 'natal.sign.scorpio.present' AND locale = 'ru-RU' AND (topic_category = 'creativity');

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.sign.scorpio.present', 'creativity', 'ru-RU', '(creativity) Акцент знака: scorpio.', 102, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.sign.scorpio.present' AND locale = 'ru-RU' AND (topic_category = 'creativity')
);

UPDATE knowledge_items
SET text = '(creativity) Акцент знака: sagittarius.', priority = 102, is_active = 1, meta_json = '{}'
WHERE key = 'natal.sign.sagittarius.present' AND locale = 'ru-RU' AND (topic_category = 'creativity');

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.sign.sagittarius.present', 'creativity', 'ru-RU', '(creativity) Акцент знака: sagittarius.', 102, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.sign.sagittarius.present' AND locale = 'ru-RU' AND (topic_category = 'creativity')
);

UPDATE knowledge_items
SET text = '(creativity) Акцент знака: capricorn.', priority = 102, is_active = 1, meta_json = '{}'
WHERE key = 'natal.sign.capricorn.present' AND locale = 'ru-RU' AND (topic_category = 'creativity');

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.sign.capricorn.present', 'creativity', 'ru-RU', '(creativity) Акцент знака: capricorn.', 102, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.sign.capricorn.present' AND locale = 'ru-RU' AND (topic_category = 'creativity')
);

UPDATE knowledge_items
SET text = '(creativity) Акцент знака: aquarius.', priority = 102, is_active = 1, meta_json = '{}'
WHERE key = 'natal.sign.aquarius.present' AND locale = 'ru-RU' AND (topic_category = 'creativity');

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.sign.aquarius.present', 'creativity', 'ru-RU', '(creativity) Акцент знака: aquarius.', 102, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.sign.aquarius.present' AND locale = 'ru-RU' AND (topic_category = 'creativity')
);

UPDATE knowledge_items
SET text = '(creativity) Акцент знака: pisces.', priority = 102, is_active = 1, meta_json = '{}'
WHERE key = 'natal.sign.pisces.present' AND locale = 'ru-RU' AND (topic_category = 'creativity');

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.sign.pisces.present', 'creativity', 'ru-RU', '(creativity) Акцент знака: pisces.', 102, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.sign.pisces.present' AND locale = 'ru-RU' AND (topic_category = 'creativity')
);

UPDATE knowledge_items
SET text = '(emotional_world) Акцент знака: aries.', priority = 102, is_active = 1, meta_json = '{}'
WHERE key = 'natal.sign.aries.present' AND locale = 'ru-RU' AND (topic_category = 'emotional_world');

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.sign.aries.present', 'emotional_world', 'ru-RU', '(emotional_world) Акцент знака: aries.', 102, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.sign.aries.present' AND locale = 'ru-RU' AND (topic_category = 'emotional_world')
);

UPDATE knowledge_items
SET text = '(emotional_world) Акцент знака: taurus.', priority = 102, is_active = 1, meta_json = '{}'
WHERE key = 'natal.sign.taurus.present' AND locale = 'ru-RU' AND (topic_category = 'emotional_world');

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.sign.taurus.present', 'emotional_world', 'ru-RU', '(emotional_world) Акцент знака: taurus.', 102, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.sign.taurus.present' AND locale = 'ru-RU' AND (topic_category = 'emotional_world')
);

UPDATE knowledge_items
SET text = '(emotional_world) Акцент знака: gemini.', priority = 102, is_active = 1, meta_json = '{}'
WHERE key = 'natal.sign.gemini.present' AND locale = 'ru-RU' AND (topic_category = 'emotional_world');

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.sign.gemini.present', 'emotional_world', 'ru-RU', '(emotional_world) Акцент знака: gemini.', 102, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.sign.gemini.present' AND locale = 'ru-RU' AND (topic_category = 'emotional_world')
);

UPDATE knowledge_items
SET text = '(emotional_world) Акцент знака: cancer.', priority = 102, is_active = 1, meta_json = '{}'
WHERE key = 'natal.sign.cancer.present' AND locale = 'ru-RU' AND (topic_category = 'emotional_world');

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.sign.cancer.present', 'emotional_world', 'ru-RU', '(emotional_world) Акцент знака: cancer.', 102, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.sign.cancer.present' AND locale = 'ru-RU' AND (topic_category = 'emotional_world')
);

UPDATE knowledge_items
SET text = '(emotional_world) Акцент знака: leo.', priority = 102, is_active = 1, meta_json = '{}'
WHERE key = 'natal.sign.leo.present' AND locale = 'ru-RU' AND (topic_category = 'emotional_world');

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.sign.leo.present', 'emotional_world', 'ru-RU', '(emotional_world) Акцент знака: leo.', 102, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.sign.leo.present' AND locale = 'ru-RU' AND (topic_category = 'emotional_world')
);

UPDATE knowledge_items
SET text = '(emotional_world) Акцент знака: virgo.', priority = 102, is_active = 1, meta_json = '{}'
WHERE key = 'natal.sign.virgo.present' AND locale = 'ru-RU' AND (topic_category = 'emotional_world');

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.sign.virgo.present', 'emotional_world', 'ru-RU', '(emotional_world) Акцент знака: virgo.', 102, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.sign.virgo.present' AND locale = 'ru-RU' AND (topic_category = 'emotional_world')
);

UPDATE knowledge_items
SET text = '(emotional_world) Акцент знака: libra.', priority = 102, is_active = 1, meta_json = '{}'
WHERE key = 'natal.sign.libra.present' AND locale = 'ru-RU' AND (topic_category = 'emotional_world');

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.sign.libra.present', 'emotional_world', 'ru-RU', '(emotional_world) Акцент знака: libra.', 102, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.sign.libra.present' AND locale = 'ru-RU' AND (topic_category = 'emotional_world')
);

UPDATE knowledge_items
SET text = '(emotional_world) Акцент знака: scorpio.', priority = 102, is_active = 1, meta_json = '{}'
WHERE key = 'natal.sign.scorpio.present' AND locale = 'ru-RU' AND (topic_category = 'emotional_world');

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.sign.scorpio.present', 'emotional_world', 'ru-RU', '(emotional_world) Акцент знака: scorpio.', 102, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.sign.scorpio.present' AND locale = 'ru-RU' AND (topic_category = 'emotional_world')
);

UPDATE knowledge_items
SET text = '(emotional_world) Акцент знака: sagittarius.', priority = 102, is_active = 1, meta_json = '{}'
WHERE key = 'natal.sign.sagittarius.present' AND locale = 'ru-RU' AND (topic_category = 'emotional_world');

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.sign.sagittarius.present', 'emotional_world', 'ru-RU', '(emotional_world) Акцент знака: sagittarius.', 102, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.sign.sagittarius.present' AND locale = 'ru-RU' AND (topic_category = 'emotional_world')
);

UPDATE knowledge_items
SET text = '(emotional_world) Акцент знака: capricorn.', priority = 102, is_active = 1, meta_json = '{}'
WHERE key = 'natal.sign.capricorn.present' AND locale = 'ru-RU' AND (topic_category = 'emotional_world');

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.sign.capricorn.present', 'emotional_world', 'ru-RU', '(emotional_world) Акцент знака: capricorn.', 102, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.sign.capricorn.present' AND locale = 'ru-RU' AND (topic_category = 'emotional_world')
);

UPDATE knowledge_items
SET text = '(emotional_world) Акцент знака: aquarius.', priority = 102, is_active = 1, meta_json = '{}'
WHERE key = 'natal.sign.aquarius.present' AND locale = 'ru-RU' AND (topic_category = 'emotional_world');

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.sign.aquarius.present', 'emotional_world', 'ru-RU', '(emotional_world) Акцент знака: aquarius.', 102, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.sign.aquarius.present' AND locale = 'ru-RU' AND (topic_category = 'emotional_world')
);

UPDATE knowledge_items
SET text = '(emotional_world) Акцент знака: pisces.', priority = 102, is_active = 1, meta_json = '{}'
WHERE key = 'natal.sign.pisces.present' AND locale = 'ru-RU' AND (topic_category = 'emotional_world');

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.sign.pisces.present', 'emotional_world', 'ru-RU', '(emotional_world) Акцент знака: pisces.', 102, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.sign.pisces.present' AND locale = 'ru-RU' AND (topic_category = 'emotional_world')
);

UPDATE knowledge_items
SET text = '(how_others_see_me) Акцент знака: aries.', priority = 102, is_active = 1, meta_json = '{}'
WHERE key = 'natal.sign.aries.present' AND locale = 'ru-RU' AND (topic_category = 'how_others_see_me');

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.sign.aries.present', 'how_others_see_me', 'ru-RU', '(how_others_see_me) Акцент знака: aries.', 102, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.sign.aries.present' AND locale = 'ru-RU' AND (topic_category = 'how_others_see_me')
);

UPDATE knowledge_items
SET text = '(how_others_see_me) Акцент знака: taurus.', priority = 102, is_active = 1, meta_json = '{}'
WHERE key = 'natal.sign.taurus.present' AND locale = 'ru-RU' AND (topic_category = 'how_others_see_me');

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.sign.taurus.present', 'how_others_see_me', 'ru-RU', '(how_others_see_me) Акцент знака: taurus.', 102, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.sign.taurus.present' AND locale = 'ru-RU' AND (topic_category = 'how_others_see_me')
);

UPDATE knowledge_items
SET text = '(how_others_see_me) Акцент знака: gemini.', priority = 102, is_active = 1, meta_json = '{}'
WHERE key = 'natal.sign.gemini.present' AND locale = 'ru-RU' AND (topic_category = 'how_others_see_me');

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.sign.gemini.present', 'how_others_see_me', 'ru-RU', '(how_others_see_me) Акцент знака: gemini.', 102, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.sign.gemini.present' AND locale = 'ru-RU' AND (topic_category = 'how_others_see_me')
);

UPDATE knowledge_items
SET text = '(how_others_see_me) Акцент знака: cancer.', priority = 102, is_active = 1, meta_json = '{}'
WHERE key = 'natal.sign.cancer.present' AND locale = 'ru-RU' AND (topic_category = 'how_others_see_me');

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.sign.cancer.present', 'how_others_see_me', 'ru-RU', '(how_others_see_me) Акцент знака: cancer.', 102, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.sign.cancer.present' AND locale = 'ru-RU' AND (topic_category = 'how_others_see_me')
);

UPDATE knowledge_items
SET text = '(how_others_see_me) Акцент знака: leo.', priority = 102, is_active = 1, meta_json = '{}'
WHERE key = 'natal.sign.leo.present' AND locale = 'ru-RU' AND (topic_category = 'how_others_see_me');

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.sign.leo.present', 'how_others_see_me', 'ru-RU', '(how_others_see_me) Акцент знака: leo.', 102, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.sign.leo.present' AND locale = 'ru-RU' AND (topic_category = 'how_others_see_me')
);

UPDATE knowledge_items
SET text = '(how_others_see_me) Акцент знака: virgo.', priority = 102, is_active = 1, meta_json = '{}'
WHERE key = 'natal.sign.virgo.present' AND locale = 'ru-RU' AND (topic_category = 'how_others_see_me');

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.sign.virgo.present', 'how_others_see_me', 'ru-RU', '(how_others_see_me) Акцент знака: virgo.', 102, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.sign.virgo.present' AND locale = 'ru-RU' AND (topic_category = 'how_others_see_me')
);

UPDATE knowledge_items
SET text = '(how_others_see_me) Акцент знака: libra.', priority = 102, is_active = 1, meta_json = '{}'
WHERE key = 'natal.sign.libra.present' AND locale = 'ru-RU' AND (topic_category = 'how_others_see_me');

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.sign.libra.present', 'how_others_see_me', 'ru-RU', '(how_others_see_me) Акцент знака: libra.', 102, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.sign.libra.present' AND locale = 'ru-RU' AND (topic_category = 'how_others_see_me')
);

UPDATE knowledge_items
SET text = '(how_others_see_me) Акцент знака: scorpio.', priority = 102, is_active = 1, meta_json = '{}'
WHERE key = 'natal.sign.scorpio.present' AND locale = 'ru-RU' AND (topic_category = 'how_others_see_me');

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.sign.scorpio.present', 'how_others_see_me', 'ru-RU', '(how_others_see_me) Акцент знака: scorpio.', 102, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.sign.scorpio.present' AND locale = 'ru-RU' AND (topic_category = 'how_others_see_me')
);

UPDATE knowledge_items
SET text = '(how_others_see_me) Акцент знака: sagittarius.', priority = 102, is_active = 1, meta_json = '{}'
WHERE key = 'natal.sign.sagittarius.present' AND locale = 'ru-RU' AND (topic_category = 'how_others_see_me');

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.sign.sagittarius.present', 'how_others_see_me', 'ru-RU', '(how_others_see_me) Акцент знака: sagittarius.', 102, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.sign.sagittarius.present' AND locale = 'ru-RU' AND (topic_category = 'how_others_see_me')
);

UPDATE knowledge_items
SET text = '(how_others_see_me) Акцент знака: capricorn.', priority = 102, is_active = 1, meta_json = '{}'
WHERE key = 'natal.sign.capricorn.present' AND locale = 'ru-RU' AND (topic_category = 'how_others_see_me');

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.sign.capricorn.present', 'how_others_see_me', 'ru-RU', '(how_others_see_me) Акцент знака: capricorn.', 102, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.sign.capricorn.present' AND locale = 'ru-RU' AND (topic_category = 'how_others_see_me')
);

UPDATE knowledge_items
SET text = '(how_others_see_me) Акцент знака: aquarius.', priority = 102, is_active = 1, meta_json = '{}'
WHERE key = 'natal.sign.aquarius.present' AND locale = 'ru-RU' AND (topic_category = 'how_others_see_me');

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.sign.aquarius.present', 'how_others_see_me', 'ru-RU', '(how_others_see_me) Акцент знака: aquarius.', 102, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.sign.aquarius.present' AND locale = 'ru-RU' AND (topic_category = 'how_others_see_me')
);

UPDATE knowledge_items
SET text = '(how_others_see_me) Акцент знака: pisces.', priority = 102, is_active = 1, meta_json = '{}'
WHERE key = 'natal.sign.pisces.present' AND locale = 'ru-RU' AND (topic_category = 'how_others_see_me');

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.sign.pisces.present', 'how_others_see_me', 'ru-RU', '(how_others_see_me) Акцент знака: pisces.', 102, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.sign.pisces.present' AND locale = 'ru-RU' AND (topic_category = 'how_others_see_me')
);

UPDATE knowledge_items
SET text = '(karmic_tasks) Акцент знака: aries.', priority = 102, is_active = 1, meta_json = '{}'
WHERE key = 'natal.sign.aries.present' AND locale = 'ru-RU' AND (topic_category = 'karmic_tasks');

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.sign.aries.present', 'karmic_tasks', 'ru-RU', '(karmic_tasks) Акцент знака: aries.', 102, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.sign.aries.present' AND locale = 'ru-RU' AND (topic_category = 'karmic_tasks')
);

UPDATE knowledge_items
SET text = '(karmic_tasks) Акцент знака: taurus.', priority = 102, is_active = 1, meta_json = '{}'
WHERE key = 'natal.sign.taurus.present' AND locale = 'ru-RU' AND (topic_category = 'karmic_tasks');

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.sign.taurus.present', 'karmic_tasks', 'ru-RU', '(karmic_tasks) Акцент знака: taurus.', 102, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.sign.taurus.present' AND locale = 'ru-RU' AND (topic_category = 'karmic_tasks')
);

UPDATE knowledge_items
SET text = '(karmic_tasks) Акцент знака: gemini.', priority = 102, is_active = 1, meta_json = '{}'
WHERE key = 'natal.sign.gemini.present' AND locale = 'ru-RU' AND (topic_category = 'karmic_tasks');

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.sign.gemini.present', 'karmic_tasks', 'ru-RU', '(karmic_tasks) Акцент знака: gemini.', 102, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.sign.gemini.present' AND locale = 'ru-RU' AND (topic_category = 'karmic_tasks')
);

UPDATE knowledge_items
SET text = '(karmic_tasks) Акцент знака: cancer.', priority = 102, is_active = 1, meta_json = '{}'
WHERE key = 'natal.sign.cancer.present' AND locale = 'ru-RU' AND (topic_category = 'karmic_tasks');

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.sign.cancer.present', 'karmic_tasks', 'ru-RU', '(karmic_tasks) Акцент знака: cancer.', 102, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.sign.cancer.present' AND locale = 'ru-RU' AND (topic_category = 'karmic_tasks')
);

UPDATE knowledge_items
SET text = '(karmic_tasks) Акцент знака: leo.', priority = 102, is_active = 1, meta_json = '{}'
WHERE key = 'natal.sign.leo.present' AND locale = 'ru-RU' AND (topic_category = 'karmic_tasks');

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.sign.leo.present', 'karmic_tasks', 'ru-RU', '(karmic_tasks) Акцент знака: leo.', 102, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.sign.leo.present' AND locale = 'ru-RU' AND (topic_category = 'karmic_tasks')
);

UPDATE knowledge_items
SET text = '(karmic_tasks) Акцент знака: virgo.', priority = 102, is_active = 1, meta_json = '{}'
WHERE key = 'natal.sign.virgo.present' AND locale = 'ru-RU' AND (topic_category = 'karmic_tasks');

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.sign.virgo.present', 'karmic_tasks', 'ru-RU', '(karmic_tasks) Акцент знака: virgo.', 102, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.sign.virgo.present' AND locale = 'ru-RU' AND (topic_category = 'karmic_tasks')
);

UPDATE knowledge_items
SET text = '(karmic_tasks) Акцент знака: libra.', priority = 102, is_active = 1, meta_json = '{}'
WHERE key = 'natal.sign.libra.present' AND locale = 'ru-RU' AND (topic_category = 'karmic_tasks');

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.sign.libra.present', 'karmic_tasks', 'ru-RU', '(karmic_tasks) Акцент знака: libra.', 102, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.sign.libra.present' AND locale = 'ru-RU' AND (topic_category = 'karmic_tasks')
);

UPDATE knowledge_items
SET text = '(karmic_tasks) Акцент знака: scorpio.', priority = 102, is_active = 1, meta_json = '{}'
WHERE key = 'natal.sign.scorpio.present' AND locale = 'ru-RU' AND (topic_category = 'karmic_tasks');

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.sign.scorpio.present', 'karmic_tasks', 'ru-RU', '(karmic_tasks) Акцент знака: scorpio.', 102, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.sign.scorpio.present' AND locale = 'ru-RU' AND (topic_category = 'karmic_tasks')
);

UPDATE knowledge_items
SET text = '(karmic_tasks) Акцент знака: sagittarius.', priority = 102, is_active = 1, meta_json = '{}'
WHERE key = 'natal.sign.sagittarius.present' AND locale = 'ru-RU' AND (topic_category = 'karmic_tasks');

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.sign.sagittarius.present', 'karmic_tasks', 'ru-RU', '(karmic_tasks) Акцент знака: sagittarius.', 102, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.sign.sagittarius.present' AND locale = 'ru-RU' AND (topic_category = 'karmic_tasks')
);

UPDATE knowledge_items
SET text = '(karmic_tasks) Акцент знака: capricorn.', priority = 102, is_active = 1, meta_json = '{}'
WHERE key = 'natal.sign.capricorn.present' AND locale = 'ru-RU' AND (topic_category = 'karmic_tasks');

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.sign.capricorn.present', 'karmic_tasks', 'ru-RU', '(karmic_tasks) Акцент знака: capricorn.', 102, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.sign.capricorn.present' AND locale = 'ru-RU' AND (topic_category = 'karmic_tasks')
);

UPDATE knowledge_items
SET text = '(karmic_tasks) Акцент знака: aquarius.', priority = 102, is_active = 1, meta_json = '{}'
WHERE key = 'natal.sign.aquarius.present' AND locale = 'ru-RU' AND (topic_category = 'karmic_tasks');

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.sign.aquarius.present', 'karmic_tasks', 'ru-RU', '(karmic_tasks) Акцент знака: aquarius.', 102, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.sign.aquarius.present' AND locale = 'ru-RU' AND (topic_category = 'karmic_tasks')
);

UPDATE knowledge_items
SET text = '(karmic_tasks) Акцент знака: pisces.', priority = 102, is_active = 1, meta_json = '{}'
WHERE key = 'natal.sign.pisces.present' AND locale = 'ru-RU' AND (topic_category = 'karmic_tasks');

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.sign.pisces.present', 'karmic_tasks', 'ru-RU', '(karmic_tasks) Акцент знака: pisces.', 102, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.sign.pisces.present' AND locale = 'ru-RU' AND (topic_category = 'karmic_tasks')
);

UPDATE knowledge_items
SET text = '(love_intimacy) Акцент знака: aries.', priority = 102, is_active = 1, meta_json = '{}'
WHERE key = 'natal.sign.aries.present' AND locale = 'ru-RU' AND (topic_category = 'love_intimacy');

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.sign.aries.present', 'love_intimacy', 'ru-RU', '(love_intimacy) Акцент знака: aries.', 102, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.sign.aries.present' AND locale = 'ru-RU' AND (topic_category = 'love_intimacy')
);

UPDATE knowledge_items
SET text = '(love_intimacy) Акцент знака: taurus.', priority = 102, is_active = 1, meta_json = '{}'
WHERE key = 'natal.sign.taurus.present' AND locale = 'ru-RU' AND (topic_category = 'love_intimacy');

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.sign.taurus.present', 'love_intimacy', 'ru-RU', '(love_intimacy) Акцент знака: taurus.', 102, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.sign.taurus.present' AND locale = 'ru-RU' AND (topic_category = 'love_intimacy')
);

UPDATE knowledge_items
SET text = '(love_intimacy) Акцент знака: gemini.', priority = 102, is_active = 1, meta_json = '{}'
WHERE key = 'natal.sign.gemini.present' AND locale = 'ru-RU' AND (topic_category = 'love_intimacy');

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.sign.gemini.present', 'love_intimacy', 'ru-RU', '(love_intimacy) Акцент знака: gemini.', 102, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.sign.gemini.present' AND locale = 'ru-RU' AND (topic_category = 'love_intimacy')
);

UPDATE knowledge_items
SET text = '(love_intimacy) Акцент знака: cancer.', priority = 102, is_active = 1, meta_json = '{}'
WHERE key = 'natal.sign.cancer.present' AND locale = 'ru-RU' AND (topic_category = 'love_intimacy');

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.sign.cancer.present', 'love_intimacy', 'ru-RU', '(love_intimacy) Акцент знака: cancer.', 102, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.sign.cancer.present' AND locale = 'ru-RU' AND (topic_category = 'love_intimacy')
);

UPDATE knowledge_items
SET text = '(love_intimacy) Акцент знака: leo.', priority = 102, is_active = 1, meta_json = '{}'
WHERE key = 'natal.sign.leo.present' AND locale = 'ru-RU' AND (topic_category = 'love_intimacy');

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.sign.leo.present', 'love_intimacy', 'ru-RU', '(love_intimacy) Акцент знака: leo.', 102, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.sign.leo.present' AND locale = 'ru-RU' AND (topic_category = 'love_intimacy')
);

UPDATE knowledge_items
SET text = '(love_intimacy) Акцент знака: virgo.', priority = 102, is_active = 1, meta_json = '{}'
WHERE key = 'natal.sign.virgo.present' AND locale = 'ru-RU' AND (topic_category = 'love_intimacy');

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.sign.virgo.present', 'love_intimacy', 'ru-RU', '(love_intimacy) Акцент знака: virgo.', 102, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.sign.virgo.present' AND locale = 'ru-RU' AND (topic_category = 'love_intimacy')
);

UPDATE knowledge_items
SET text = '(love_intimacy) Акцент знака: libra.', priority = 102, is_active = 1, meta_json = '{}'
WHERE key = 'natal.sign.libra.present' AND locale = 'ru-RU' AND (topic_category = 'love_intimacy');

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.sign.libra.present', 'love_intimacy', 'ru-RU', '(love_intimacy) Акцент знака: libra.', 102, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.sign.libra.present' AND locale = 'ru-RU' AND (topic_category = 'love_intimacy')
);

UPDATE knowledge_items
SET text = '(love_intimacy) Акцент знака: scorpio.', priority = 102, is_active = 1, meta_json = '{}'
WHERE key = 'natal.sign.scorpio.present' AND locale = 'ru-RU' AND (topic_category = 'love_intimacy');

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.sign.scorpio.present', 'love_intimacy', 'ru-RU', '(love_intimacy) Акцент знака: scorpio.', 102, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.sign.scorpio.present' AND locale = 'ru-RU' AND (topic_category = 'love_intimacy')
);

UPDATE knowledge_items
SET text = '(love_intimacy) Акцент знака: sagittarius.', priority = 102, is_active = 1, meta_json = '{}'
WHERE key = 'natal.sign.sagittarius.present' AND locale = 'ru-RU' AND (topic_category = 'love_intimacy');

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.sign.sagittarius.present', 'love_intimacy', 'ru-RU', '(love_intimacy) Акцент знака: sagittarius.', 102, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.sign.sagittarius.present' AND locale = 'ru-RU' AND (topic_category = 'love_intimacy')
);

UPDATE knowledge_items
SET text = '(love_intimacy) Акцент знака: capricorn.', priority = 102, is_active = 1, meta_json = '{}'
WHERE key = 'natal.sign.capricorn.present' AND locale = 'ru-RU' AND (topic_category = 'love_intimacy');

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.sign.capricorn.present', 'love_intimacy', 'ru-RU', '(love_intimacy) Акцент знака: capricorn.', 102, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.sign.capricorn.present' AND locale = 'ru-RU' AND (topic_category = 'love_intimacy')
);

UPDATE knowledge_items
SET text = '(love_intimacy) Акцент знака: aquarius.', priority = 102, is_active = 1, meta_json = '{}'
WHERE key = 'natal.sign.aquarius.present' AND locale = 'ru-RU' AND (topic_category = 'love_intimacy');

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.sign.aquarius.present', 'love_intimacy', 'ru-RU', '(love_intimacy) Акцент знака: aquarius.', 102, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.sign.aquarius.present' AND locale = 'ru-RU' AND (topic_category = 'love_intimacy')
);

UPDATE knowledge_items
SET text = '(love_intimacy) Акцент знака: pisces.', priority = 102, is_active = 1, meta_json = '{}'
WHERE key = 'natal.sign.pisces.present' AND locale = 'ru-RU' AND (topic_category = 'love_intimacy');

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.sign.pisces.present', 'love_intimacy', 'ru-RU', '(love_intimacy) Акцент знака: pisces.', 102, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.sign.pisces.present' AND locale = 'ru-RU' AND (topic_category = 'love_intimacy')
);

UPDATE knowledge_items
SET text = '(money) Акцент знака: aries.', priority = 102, is_active = 1, meta_json = '{}'
WHERE key = 'natal.sign.aries.present' AND locale = 'ru-RU' AND (topic_category = 'money');

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.sign.aries.present', 'money', 'ru-RU', '(money) Акцент знака: aries.', 102, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.sign.aries.present' AND locale = 'ru-RU' AND (topic_category = 'money')
);

UPDATE knowledge_items
SET text = '(money) Акцент знака: taurus.', priority = 102, is_active = 1, meta_json = '{}'
WHERE key = 'natal.sign.taurus.present' AND locale = 'ru-RU' AND (topic_category = 'money');

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.sign.taurus.present', 'money', 'ru-RU', '(money) Акцент знака: taurus.', 102, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.sign.taurus.present' AND locale = 'ru-RU' AND (topic_category = 'money')
);

UPDATE knowledge_items
SET text = '(money) Акцент знака: gemini.', priority = 102, is_active = 1, meta_json = '{}'
WHERE key = 'natal.sign.gemini.present' AND locale = 'ru-RU' AND (topic_category = 'money');

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.sign.gemini.present', 'money', 'ru-RU', '(money) Акцент знака: gemini.', 102, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.sign.gemini.present' AND locale = 'ru-RU' AND (topic_category = 'money')
);

UPDATE knowledge_items
SET text = '(money) Акцент знака: cancer.', priority = 102, is_active = 1, meta_json = '{}'
WHERE key = 'natal.sign.cancer.present' AND locale = 'ru-RU' AND (topic_category = 'money');

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.sign.cancer.present', 'money', 'ru-RU', '(money) Акцент знака: cancer.', 102, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.sign.cancer.present' AND locale = 'ru-RU' AND (topic_category = 'money')
);

UPDATE knowledge_items
SET text = '(money) Акцент знака: leo.', priority = 102, is_active = 1, meta_json = '{}'
WHERE key = 'natal.sign.leo.present' AND locale = 'ru-RU' AND (topic_category = 'money');

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.sign.leo.present', 'money', 'ru-RU', '(money) Акцент знака: leo.', 102, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.sign.leo.present' AND locale = 'ru-RU' AND (topic_category = 'money')
);

UPDATE knowledge_items
SET text = '(money) Акцент знака: virgo.', priority = 102, is_active = 1, meta_json = '{}'
WHERE key = 'natal.sign.virgo.present' AND locale = 'ru-RU' AND (topic_category = 'money');

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.sign.virgo.present', 'money', 'ru-RU', '(money) Акцент знака: virgo.', 102, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.sign.virgo.present' AND locale = 'ru-RU' AND (topic_category = 'money')
);

UPDATE knowledge_items
SET text = '(money) Акцент знака: libra.', priority = 102, is_active = 1, meta_json = '{}'
WHERE key = 'natal.sign.libra.present' AND locale = 'ru-RU' AND (topic_category = 'money');

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.sign.libra.present', 'money', 'ru-RU', '(money) Акцент знака: libra.', 102, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.sign.libra.present' AND locale = 'ru-RU' AND (topic_category = 'money')
);

UPDATE knowledge_items
SET text = '(money) Акцент знака: scorpio.', priority = 102, is_active = 1, meta_json = '{}'
WHERE key = 'natal.sign.scorpio.present' AND locale = 'ru-RU' AND (topic_category = 'money');

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.sign.scorpio.present', 'money', 'ru-RU', '(money) Акцент знака: scorpio.', 102, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.sign.scorpio.present' AND locale = 'ru-RU' AND (topic_category = 'money')
);

UPDATE knowledge_items
SET text = '(money) Акцент знака: sagittarius.', priority = 102, is_active = 1, meta_json = '{}'
WHERE key = 'natal.sign.sagittarius.present' AND locale = 'ru-RU' AND (topic_category = 'money');

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.sign.sagittarius.present', 'money', 'ru-RU', '(money) Акцент знака: sagittarius.', 102, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.sign.sagittarius.present' AND locale = 'ru-RU' AND (topic_category = 'money')
);

UPDATE knowledge_items
SET text = '(money) Акцент знака: capricorn.', priority = 102, is_active = 1, meta_json = '{}'
WHERE key = 'natal.sign.capricorn.present' AND locale = 'ru-RU' AND (topic_category = 'money');

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.sign.capricorn.present', 'money', 'ru-RU', '(money) Акцент знака: capricorn.', 102, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.sign.capricorn.present' AND locale = 'ru-RU' AND (topic_category = 'money')
);

UPDATE knowledge_items
SET text = '(money) Акцент знака: aquarius.', priority = 102, is_active = 1, meta_json = '{}'
WHERE key = 'natal.sign.aquarius.present' AND locale = 'ru-RU' AND (topic_category = 'money');

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.sign.aquarius.present', 'money', 'ru-RU', '(money) Акцент знака: aquarius.', 102, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.sign.aquarius.present' AND locale = 'ru-RU' AND (topic_category = 'money')
);

UPDATE knowledge_items
SET text = '(money) Акцент знака: pisces.', priority = 102, is_active = 1, meta_json = '{}'
WHERE key = 'natal.sign.pisces.present' AND locale = 'ru-RU' AND (topic_category = 'money');

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.sign.pisces.present', 'money', 'ru-RU', '(money) Акцент знака: pisces.', 102, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.sign.pisces.present' AND locale = 'ru-RU' AND (topic_category = 'money')
);

UPDATE knowledge_items
SET text = '(partnership_marriage) Акцент знака: aries.', priority = 102, is_active = 1, meta_json = '{}'
WHERE key = 'natal.sign.aries.present' AND locale = 'ru-RU' AND (topic_category = 'partnership_marriage');

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.sign.aries.present', 'partnership_marriage', 'ru-RU', '(partnership_marriage) Акцент знака: aries.', 102, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.sign.aries.present' AND locale = 'ru-RU' AND (topic_category = 'partnership_marriage')
);

UPDATE knowledge_items
SET text = '(partnership_marriage) Акцент знака: taurus.', priority = 102, is_active = 1, meta_json = '{}'
WHERE key = 'natal.sign.taurus.present' AND locale = 'ru-RU' AND (topic_category = 'partnership_marriage');

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.sign.taurus.present', 'partnership_marriage', 'ru-RU', '(partnership_marriage) Акцент знака: taurus.', 102, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.sign.taurus.present' AND locale = 'ru-RU' AND (topic_category = 'partnership_marriage')
);

UPDATE knowledge_items
SET text = '(partnership_marriage) Акцент знака: gemini.', priority = 102, is_active = 1, meta_json = '{}'
WHERE key = 'natal.sign.gemini.present' AND locale = 'ru-RU' AND (topic_category = 'partnership_marriage');

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.sign.gemini.present', 'partnership_marriage', 'ru-RU', '(partnership_marriage) Акцент знака: gemini.', 102, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.sign.gemini.present' AND locale = 'ru-RU' AND (topic_category = 'partnership_marriage')
);

UPDATE knowledge_items
SET text = '(partnership_marriage) Акцент знака: cancer.', priority = 102, is_active = 1, meta_json = '{}'
WHERE key = 'natal.sign.cancer.present' AND locale = 'ru-RU' AND (topic_category = 'partnership_marriage');

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.sign.cancer.present', 'partnership_marriage', 'ru-RU', '(partnership_marriage) Акцент знака: cancer.', 102, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.sign.cancer.present' AND locale = 'ru-RU' AND (topic_category = 'partnership_marriage')
);

UPDATE knowledge_items
SET text = '(partnership_marriage) Акцент знака: leo.', priority = 102, is_active = 1, meta_json = '{}'
WHERE key = 'natal.sign.leo.present' AND locale = 'ru-RU' AND (topic_category = 'partnership_marriage');

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.sign.leo.present', 'partnership_marriage', 'ru-RU', '(partnership_marriage) Акцент знака: leo.', 102, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.sign.leo.present' AND locale = 'ru-RU' AND (topic_category = 'partnership_marriage')
);

UPDATE knowledge_items
SET text = '(partnership_marriage) Акцент знака: virgo.', priority = 102, is_active = 1, meta_json = '{}'
WHERE key = 'natal.sign.virgo.present' AND locale = 'ru-RU' AND (topic_category = 'partnership_marriage');

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.sign.virgo.present', 'partnership_marriage', 'ru-RU', '(partnership_marriage) Акцент знака: virgo.', 102, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.sign.virgo.present' AND locale = 'ru-RU' AND (topic_category = 'partnership_marriage')
);

UPDATE knowledge_items
SET text = '(partnership_marriage) Акцент знака: libra.', priority = 102, is_active = 1, meta_json = '{}'
WHERE key = 'natal.sign.libra.present' AND locale = 'ru-RU' AND (topic_category = 'partnership_marriage');

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.sign.libra.present', 'partnership_marriage', 'ru-RU', '(partnership_marriage) Акцент знака: libra.', 102, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.sign.libra.present' AND locale = 'ru-RU' AND (topic_category = 'partnership_marriage')
);

UPDATE knowledge_items
SET text = '(partnership_marriage) Акцент знака: scorpio.', priority = 102, is_active = 1, meta_json = '{}'
WHERE key = 'natal.sign.scorpio.present' AND locale = 'ru-RU' AND (topic_category = 'partnership_marriage');

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.sign.scorpio.present', 'partnership_marriage', 'ru-RU', '(partnership_marriage) Акцент знака: scorpio.', 102, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.sign.scorpio.present' AND locale = 'ru-RU' AND (topic_category = 'partnership_marriage')
);

UPDATE knowledge_items
SET text = '(partnership_marriage) Акцент знака: sagittarius.', priority = 102, is_active = 1, meta_json = '{}'
WHERE key = 'natal.sign.sagittarius.present' AND locale = 'ru-RU' AND (topic_category = 'partnership_marriage');

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.sign.sagittarius.present', 'partnership_marriage', 'ru-RU', '(partnership_marriage) Акцент знака: sagittarius.', 102, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.sign.sagittarius.present' AND locale = 'ru-RU' AND (topic_category = 'partnership_marriage')
);

UPDATE knowledge_items
SET text = '(partnership_marriage) Акцент знака: capricorn.', priority = 102, is_active = 1, meta_json = '{}'
WHERE key = 'natal.sign.capricorn.present' AND locale = 'ru-RU' AND (topic_category = 'partnership_marriage');

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.sign.capricorn.present', 'partnership_marriage', 'ru-RU', '(partnership_marriage) Акцент знака: capricorn.', 102, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.sign.capricorn.present' AND locale = 'ru-RU' AND (topic_category = 'partnership_marriage')
);

UPDATE knowledge_items
SET text = '(partnership_marriage) Акцент знака: aquarius.', priority = 102, is_active = 1, meta_json = '{}'
WHERE key = 'natal.sign.aquarius.present' AND locale = 'ru-RU' AND (topic_category = 'partnership_marriage');

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.sign.aquarius.present', 'partnership_marriage', 'ru-RU', '(partnership_marriage) Акцент знака: aquarius.', 102, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.sign.aquarius.present' AND locale = 'ru-RU' AND (topic_category = 'partnership_marriage')
);

UPDATE knowledge_items
SET text = '(partnership_marriage) Акцент знака: pisces.', priority = 102, is_active = 1, meta_json = '{}'
WHERE key = 'natal.sign.pisces.present' AND locale = 'ru-RU' AND (topic_category = 'partnership_marriage');

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.sign.pisces.present', 'partnership_marriage', 'ru-RU', '(partnership_marriage) Акцент знака: pisces.', 102, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.sign.pisces.present' AND locale = 'ru-RU' AND (topic_category = 'partnership_marriage')
);

UPDATE knowledge_items
SET text = '(past_lives_symbolic) Акцент знака: aries.', priority = 102, is_active = 1, meta_json = '{}'
WHERE key = 'natal.sign.aries.present' AND locale = 'ru-RU' AND (topic_category = 'past_lives_symbolic');

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.sign.aries.present', 'past_lives_symbolic', 'ru-RU', '(past_lives_symbolic) Акцент знака: aries.', 102, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.sign.aries.present' AND locale = 'ru-RU' AND (topic_category = 'past_lives_symbolic')
);

UPDATE knowledge_items
SET text = '(past_lives_symbolic) Акцент знака: taurus.', priority = 102, is_active = 1, meta_json = '{}'
WHERE key = 'natal.sign.taurus.present' AND locale = 'ru-RU' AND (topic_category = 'past_lives_symbolic');

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.sign.taurus.present', 'past_lives_symbolic', 'ru-RU', '(past_lives_symbolic) Акцент знака: taurus.', 102, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.sign.taurus.present' AND locale = 'ru-RU' AND (topic_category = 'past_lives_symbolic')
);

UPDATE knowledge_items
SET text = '(past_lives_symbolic) Акцент знака: gemini.', priority = 102, is_active = 1, meta_json = '{}'
WHERE key = 'natal.sign.gemini.present' AND locale = 'ru-RU' AND (topic_category = 'past_lives_symbolic');

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.sign.gemini.present', 'past_lives_symbolic', 'ru-RU', '(past_lives_symbolic) Акцент знака: gemini.', 102, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.sign.gemini.present' AND locale = 'ru-RU' AND (topic_category = 'past_lives_symbolic')
);

UPDATE knowledge_items
SET text = '(past_lives_symbolic) Акцент знака: cancer.', priority = 102, is_active = 1, meta_json = '{}'
WHERE key = 'natal.sign.cancer.present' AND locale = 'ru-RU' AND (topic_category = 'past_lives_symbolic');

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.sign.cancer.present', 'past_lives_symbolic', 'ru-RU', '(past_lives_symbolic) Акцент знака: cancer.', 102, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.sign.cancer.present' AND locale = 'ru-RU' AND (topic_category = 'past_lives_symbolic')
);

UPDATE knowledge_items
SET text = '(past_lives_symbolic) Акцент знака: leo.', priority = 102, is_active = 1, meta_json = '{}'
WHERE key = 'natal.sign.leo.present' AND locale = 'ru-RU' AND (topic_category = 'past_lives_symbolic');

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.sign.leo.present', 'past_lives_symbolic', 'ru-RU', '(past_lives_symbolic) Акцент знака: leo.', 102, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.sign.leo.present' AND locale = 'ru-RU' AND (topic_category = 'past_lives_symbolic')
);

UPDATE knowledge_items
SET text = '(past_lives_symbolic) Акцент знака: virgo.', priority = 102, is_active = 1, meta_json = '{}'
WHERE key = 'natal.sign.virgo.present' AND locale = 'ru-RU' AND (topic_category = 'past_lives_symbolic');

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.sign.virgo.present', 'past_lives_symbolic', 'ru-RU', '(past_lives_symbolic) Акцент знака: virgo.', 102, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.sign.virgo.present' AND locale = 'ru-RU' AND (topic_category = 'past_lives_symbolic')
);

UPDATE knowledge_items
SET text = '(past_lives_symbolic) Акцент знака: libra.', priority = 102, is_active = 1, meta_json = '{}'
WHERE key = 'natal.sign.libra.present' AND locale = 'ru-RU' AND (topic_category = 'past_lives_symbolic');

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.sign.libra.present', 'past_lives_symbolic', 'ru-RU', '(past_lives_symbolic) Акцент знака: libra.', 102, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.sign.libra.present' AND locale = 'ru-RU' AND (topic_category = 'past_lives_symbolic')
);

UPDATE knowledge_items
SET text = '(past_lives_symbolic) Акцент знака: scorpio.', priority = 102, is_active = 1, meta_json = '{}'
WHERE key = 'natal.sign.scorpio.present' AND locale = 'ru-RU' AND (topic_category = 'past_lives_symbolic');

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.sign.scorpio.present', 'past_lives_symbolic', 'ru-RU', '(past_lives_symbolic) Акцент знака: scorpio.', 102, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.sign.scorpio.present' AND locale = 'ru-RU' AND (topic_category = 'past_lives_symbolic')
);

UPDATE knowledge_items
SET text = '(past_lives_symbolic) Акцент знака: sagittarius.', priority = 102, is_active = 1, meta_json = '{}'
WHERE key = 'natal.sign.sagittarius.present' AND locale = 'ru-RU' AND (topic_category = 'past_lives_symbolic');

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.sign.sagittarius.present', 'past_lives_symbolic', 'ru-RU', '(past_lives_symbolic) Акцент знака: sagittarius.', 102, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.sign.sagittarius.present' AND locale = 'ru-RU' AND (topic_category = 'past_lives_symbolic')
);

UPDATE knowledge_items
SET text = '(past_lives_symbolic) Акцент знака: capricorn.', priority = 102, is_active = 1, meta_json = '{}'
WHERE key = 'natal.sign.capricorn.present' AND locale = 'ru-RU' AND (topic_category = 'past_lives_symbolic');

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.sign.capricorn.present', 'past_lives_symbolic', 'ru-RU', '(past_lives_symbolic) Акцент знака: capricorn.', 102, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.sign.capricorn.present' AND locale = 'ru-RU' AND (topic_category = 'past_lives_symbolic')
);

UPDATE knowledge_items
SET text = '(past_lives_symbolic) Акцент знака: aquarius.', priority = 102, is_active = 1, meta_json = '{}'
WHERE key = 'natal.sign.aquarius.present' AND locale = 'ru-RU' AND (topic_category = 'past_lives_symbolic');

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.sign.aquarius.present', 'past_lives_symbolic', 'ru-RU', '(past_lives_symbolic) Акцент знака: aquarius.', 102, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.sign.aquarius.present' AND locale = 'ru-RU' AND (topic_category = 'past_lives_symbolic')
);

UPDATE knowledge_items
SET text = '(past_lives_symbolic) Акцент знака: pisces.', priority = 102, is_active = 1, meta_json = '{}'
WHERE key = 'natal.sign.pisces.present' AND locale = 'ru-RU' AND (topic_category = 'past_lives_symbolic');

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.sign.pisces.present', 'past_lives_symbolic', 'ru-RU', '(past_lives_symbolic) Акцент знака: pisces.', 102, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.sign.pisces.present' AND locale = 'ru-RU' AND (topic_category = 'past_lives_symbolic')
);

UPDATE knowledge_items
SET text = '(personality_core) Акцент знака: aries.', priority = 102, is_active = 1, meta_json = '{}'
WHERE key = 'natal.sign.aries.present' AND locale = 'ru-RU' AND (topic_category = 'personality_core');

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.sign.aries.present', 'personality_core', 'ru-RU', '(personality_core) Акцент знака: aries.', 102, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.sign.aries.present' AND locale = 'ru-RU' AND (topic_category = 'personality_core')
);

UPDATE knowledge_items
SET text = '(personality_core) Акцент знака: taurus.', priority = 102, is_active = 1, meta_json = '{}'
WHERE key = 'natal.sign.taurus.present' AND locale = 'ru-RU' AND (topic_category = 'personality_core');

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.sign.taurus.present', 'personality_core', 'ru-RU', '(personality_core) Акцент знака: taurus.', 102, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.sign.taurus.present' AND locale = 'ru-RU' AND (topic_category = 'personality_core')
);

UPDATE knowledge_items
SET text = '(personality_core) Акцент знака: gemini.', priority = 102, is_active = 1, meta_json = '{}'
WHERE key = 'natal.sign.gemini.present' AND locale = 'ru-RU' AND (topic_category = 'personality_core');

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.sign.gemini.present', 'personality_core', 'ru-RU', '(personality_core) Акцент знака: gemini.', 102, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.sign.gemini.present' AND locale = 'ru-RU' AND (topic_category = 'personality_core')
);

UPDATE knowledge_items
SET text = '(personality_core) Акцент знака: cancer.', priority = 102, is_active = 1, meta_json = '{}'
WHERE key = 'natal.sign.cancer.present' AND locale = 'ru-RU' AND (topic_category = 'personality_core');

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.sign.cancer.present', 'personality_core', 'ru-RU', '(personality_core) Акцент знака: cancer.', 102, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.sign.cancer.present' AND locale = 'ru-RU' AND (topic_category = 'personality_core')
);

UPDATE knowledge_items
SET text = '(personality_core) Акцент знака: leo.', priority = 102, is_active = 1, meta_json = '{}'
WHERE key = 'natal.sign.leo.present' AND locale = 'ru-RU' AND (topic_category = 'personality_core');

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.sign.leo.present', 'personality_core', 'ru-RU', '(personality_core) Акцент знака: leo.', 102, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.sign.leo.present' AND locale = 'ru-RU' AND (topic_category = 'personality_core')
);

UPDATE knowledge_items
SET text = '(personality_core) Акцент знака: virgo.', priority = 102, is_active = 1, meta_json = '{}'
WHERE key = 'natal.sign.virgo.present' AND locale = 'ru-RU' AND (topic_category = 'personality_core');

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.sign.virgo.present', 'personality_core', 'ru-RU', '(personality_core) Акцент знака: virgo.', 102, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.sign.virgo.present' AND locale = 'ru-RU' AND (topic_category = 'personality_core')
);

UPDATE knowledge_items
SET text = '(personality_core) Акцент знака: libra.', priority = 102, is_active = 1, meta_json = '{}'
WHERE key = 'natal.sign.libra.present' AND locale = 'ru-RU' AND (topic_category = 'personality_core');

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.sign.libra.present', 'personality_core', 'ru-RU', '(personality_core) Акцент знака: libra.', 102, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.sign.libra.present' AND locale = 'ru-RU' AND (topic_category = 'personality_core')
);

UPDATE knowledge_items
SET text = '(personality_core) Акцент знака: scorpio.', priority = 102, is_active = 1, meta_json = '{}'
WHERE key = 'natal.sign.scorpio.present' AND locale = 'ru-RU' AND (topic_category = 'personality_core');

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.sign.scorpio.present', 'personality_core', 'ru-RU', '(personality_core) Акцент знака: scorpio.', 102, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.sign.scorpio.present' AND locale = 'ru-RU' AND (topic_category = 'personality_core')
);

UPDATE knowledge_items
SET text = '(personality_core) Акцент знака: sagittarius.', priority = 102, is_active = 1, meta_json = '{}'
WHERE key = 'natal.sign.sagittarius.present' AND locale = 'ru-RU' AND (topic_category = 'personality_core');

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.sign.sagittarius.present', 'personality_core', 'ru-RU', '(personality_core) Акцент знака: sagittarius.', 102, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.sign.sagittarius.present' AND locale = 'ru-RU' AND (topic_category = 'personality_core')
);

UPDATE knowledge_items
SET text = '(personality_core) Акцент знака: capricorn.', priority = 102, is_active = 1, meta_json = '{}'
WHERE key = 'natal.sign.capricorn.present' AND locale = 'ru-RU' AND (topic_category = 'personality_core');

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.sign.capricorn.present', 'personality_core', 'ru-RU', '(personality_core) Акцент знака: capricorn.', 102, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.sign.capricorn.present' AND locale = 'ru-RU' AND (topic_category = 'personality_core')
);

UPDATE knowledge_items
SET text = '(personality_core) Акцент знака: aquarius.', priority = 102, is_active = 1, meta_json = '{}'
WHERE key = 'natal.sign.aquarius.present' AND locale = 'ru-RU' AND (topic_category = 'personality_core');

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.sign.aquarius.present', 'personality_core', 'ru-RU', '(personality_core) Акцент знака: aquarius.', 102, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.sign.aquarius.present' AND locale = 'ru-RU' AND (topic_category = 'personality_core')
);

UPDATE knowledge_items
SET text = '(personality_core) Акцент знака: pisces.', priority = 102, is_active = 1, meta_json = '{}'
WHERE key = 'natal.sign.pisces.present' AND locale = 'ru-RU' AND (topic_category = 'personality_core');

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.sign.pisces.present', 'personality_core', 'ru-RU', '(personality_core) Акцент знака: pisces.', 102, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.sign.pisces.present' AND locale = 'ru-RU' AND (topic_category = 'personality_core')
);

UPDATE knowledge_items
SET text = '(psychology) Акцент знака: aries.', priority = 102, is_active = 1, meta_json = '{}'
WHERE key = 'natal.sign.aries.present' AND locale = 'ru-RU' AND (topic_category = 'psychology');

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.sign.aries.present', 'psychology', 'ru-RU', '(psychology) Акцент знака: aries.', 102, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.sign.aries.present' AND locale = 'ru-RU' AND (topic_category = 'psychology')
);

UPDATE knowledge_items
SET text = '(psychology) Акцент знака: taurus.', priority = 102, is_active = 1, meta_json = '{}'
WHERE key = 'natal.sign.taurus.present' AND locale = 'ru-RU' AND (topic_category = 'psychology');

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.sign.taurus.present', 'psychology', 'ru-RU', '(psychology) Акцент знака: taurus.', 102, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.sign.taurus.present' AND locale = 'ru-RU' AND (topic_category = 'psychology')
);

UPDATE knowledge_items
SET text = '(psychology) Акцент знака: gemini.', priority = 102, is_active = 1, meta_json = '{}'
WHERE key = 'natal.sign.gemini.present' AND locale = 'ru-RU' AND (topic_category = 'psychology');

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.sign.gemini.present', 'psychology', 'ru-RU', '(psychology) Акцент знака: gemini.', 102, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.sign.gemini.present' AND locale = 'ru-RU' AND (topic_category = 'psychology')
);

UPDATE knowledge_items
SET text = '(psychology) Акцент знака: cancer.', priority = 102, is_active = 1, meta_json = '{}'
WHERE key = 'natal.sign.cancer.present' AND locale = 'ru-RU' AND (topic_category = 'psychology');

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.sign.cancer.present', 'psychology', 'ru-RU', '(psychology) Акцент знака: cancer.', 102, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.sign.cancer.present' AND locale = 'ru-RU' AND (topic_category = 'psychology')
);

UPDATE knowledge_items
SET text = '(psychology) Акцент знака: leo.', priority = 102, is_active = 1, meta_json = '{}'
WHERE key = 'natal.sign.leo.present' AND locale = 'ru-RU' AND (topic_category = 'psychology');

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.sign.leo.present', 'psychology', 'ru-RU', '(psychology) Акцент знака: leo.', 102, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.sign.leo.present' AND locale = 'ru-RU' AND (topic_category = 'psychology')
);

UPDATE knowledge_items
SET text = '(psychology) Акцент знака: virgo.', priority = 102, is_active = 1, meta_json = '{}'
WHERE key = 'natal.sign.virgo.present' AND locale = 'ru-RU' AND (topic_category = 'psychology');

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.sign.virgo.present', 'psychology', 'ru-RU', '(psychology) Акцент знака: virgo.', 102, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.sign.virgo.present' AND locale = 'ru-RU' AND (topic_category = 'psychology')
);

UPDATE knowledge_items
SET text = '(psychology) Акцент знака: libra.', priority = 102, is_active = 1, meta_json = '{}'
WHERE key = 'natal.sign.libra.present' AND locale = 'ru-RU' AND (topic_category = 'psychology');

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.sign.libra.present', 'psychology', 'ru-RU', '(psychology) Акцент знака: libra.', 102, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.sign.libra.present' AND locale = 'ru-RU' AND (topic_category = 'psychology')
);

UPDATE knowledge_items
SET text = '(psychology) Акцент знака: scorpio.', priority = 102, is_active = 1, meta_json = '{}'
WHERE key = 'natal.sign.scorpio.present' AND locale = 'ru-RU' AND (topic_category = 'psychology');

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.sign.scorpio.present', 'psychology', 'ru-RU', '(psychology) Акцент знака: scorpio.', 102, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.sign.scorpio.present' AND locale = 'ru-RU' AND (topic_category = 'psychology')
);

UPDATE knowledge_items
SET text = '(psychology) Акцент знака: sagittarius.', priority = 102, is_active = 1, meta_json = '{}'
WHERE key = 'natal.sign.sagittarius.present' AND locale = 'ru-RU' AND (topic_category = 'psychology');

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.sign.sagittarius.present', 'psychology', 'ru-RU', '(psychology) Акцент знака: sagittarius.', 102, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.sign.sagittarius.present' AND locale = 'ru-RU' AND (topic_category = 'psychology')
);

UPDATE knowledge_items
SET text = '(psychology) Акцент знака: capricorn.', priority = 102, is_active = 1, meta_json = '{}'
WHERE key = 'natal.sign.capricorn.present' AND locale = 'ru-RU' AND (topic_category = 'psychology');

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.sign.capricorn.present', 'psychology', 'ru-RU', '(psychology) Акцент знака: capricorn.', 102, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.sign.capricorn.present' AND locale = 'ru-RU' AND (topic_category = 'psychology')
);

UPDATE knowledge_items
SET text = '(psychology) Акцент знака: aquarius.', priority = 102, is_active = 1, meta_json = '{}'
WHERE key = 'natal.sign.aquarius.present' AND locale = 'ru-RU' AND (topic_category = 'psychology');

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.sign.aquarius.present', 'psychology', 'ru-RU', '(psychology) Акцент знака: aquarius.', 102, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.sign.aquarius.present' AND locale = 'ru-RU' AND (topic_category = 'psychology')
);

UPDATE knowledge_items
SET text = '(psychology) Акцент знака: pisces.', priority = 102, is_active = 1, meta_json = '{}'
WHERE key = 'natal.sign.pisces.present' AND locale = 'ru-RU' AND (topic_category = 'psychology');

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.sign.pisces.present', 'psychology', 'ru-RU', '(psychology) Акцент знака: pisces.', 102, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.sign.pisces.present' AND locale = 'ru-RU' AND (topic_category = 'psychology')
);

UPDATE knowledge_items
SET text = '(purpose_path) Акцент знака: aries.', priority = 102, is_active = 1, meta_json = '{}'
WHERE key = 'natal.sign.aries.present' AND locale = 'ru-RU' AND (topic_category = 'purpose_path');

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.sign.aries.present', 'purpose_path', 'ru-RU', '(purpose_path) Акцент знака: aries.', 102, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.sign.aries.present' AND locale = 'ru-RU' AND (topic_category = 'purpose_path')
);

UPDATE knowledge_items
SET text = '(purpose_path) Акцент знака: taurus.', priority = 102, is_active = 1, meta_json = '{}'
WHERE key = 'natal.sign.taurus.present' AND locale = 'ru-RU' AND (topic_category = 'purpose_path');

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.sign.taurus.present', 'purpose_path', 'ru-RU', '(purpose_path) Акцент знака: taurus.', 102, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.sign.taurus.present' AND locale = 'ru-RU' AND (topic_category = 'purpose_path')
);

UPDATE knowledge_items
SET text = '(purpose_path) Акцент знака: gemini.', priority = 102, is_active = 1, meta_json = '{}'
WHERE key = 'natal.sign.gemini.present' AND locale = 'ru-RU' AND (topic_category = 'purpose_path');

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.sign.gemini.present', 'purpose_path', 'ru-RU', '(purpose_path) Акцент знака: gemini.', 102, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.sign.gemini.present' AND locale = 'ru-RU' AND (topic_category = 'purpose_path')
);

UPDATE knowledge_items
SET text = '(purpose_path) Акцент знака: cancer.', priority = 102, is_active = 1, meta_json = '{}'
WHERE key = 'natal.sign.cancer.present' AND locale = 'ru-RU' AND (topic_category = 'purpose_path');

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.sign.cancer.present', 'purpose_path', 'ru-RU', '(purpose_path) Акцент знака: cancer.', 102, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.sign.cancer.present' AND locale = 'ru-RU' AND (topic_category = 'purpose_path')
);

UPDATE knowledge_items
SET text = '(purpose_path) Акцент знака: leo.', priority = 102, is_active = 1, meta_json = '{}'
WHERE key = 'natal.sign.leo.present' AND locale = 'ru-RU' AND (topic_category = 'purpose_path');

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.sign.leo.present', 'purpose_path', 'ru-RU', '(purpose_path) Акцент знака: leo.', 102, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.sign.leo.present' AND locale = 'ru-RU' AND (topic_category = 'purpose_path')
);

UPDATE knowledge_items
SET text = '(purpose_path) Акцент знака: virgo.', priority = 102, is_active = 1, meta_json = '{}'
WHERE key = 'natal.sign.virgo.present' AND locale = 'ru-RU' AND (topic_category = 'purpose_path');

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.sign.virgo.present', 'purpose_path', 'ru-RU', '(purpose_path) Акцент знака: virgo.', 102, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.sign.virgo.present' AND locale = 'ru-RU' AND (topic_category = 'purpose_path')
);

UPDATE knowledge_items
SET text = '(purpose_path) Акцент знака: libra.', priority = 102, is_active = 1, meta_json = '{}'
WHERE key = 'natal.sign.libra.present' AND locale = 'ru-RU' AND (topic_category = 'purpose_path');

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.sign.libra.present', 'purpose_path', 'ru-RU', '(purpose_path) Акцент знака: libra.', 102, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.sign.libra.present' AND locale = 'ru-RU' AND (topic_category = 'purpose_path')
);

UPDATE knowledge_items
SET text = '(purpose_path) Акцент знака: scorpio.', priority = 102, is_active = 1, meta_json = '{}'
WHERE key = 'natal.sign.scorpio.present' AND locale = 'ru-RU' AND (topic_category = 'purpose_path');

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.sign.scorpio.present', 'purpose_path', 'ru-RU', '(purpose_path) Акцент знака: scorpio.', 102, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.sign.scorpio.present' AND locale = 'ru-RU' AND (topic_category = 'purpose_path')
);

UPDATE knowledge_items
SET text = '(purpose_path) Акцент знака: sagittarius.', priority = 102, is_active = 1, meta_json = '{}'
WHERE key = 'natal.sign.sagittarius.present' AND locale = 'ru-RU' AND (topic_category = 'purpose_path');

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.sign.sagittarius.present', 'purpose_path', 'ru-RU', '(purpose_path) Акцент знака: sagittarius.', 102, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.sign.sagittarius.present' AND locale = 'ru-RU' AND (topic_category = 'purpose_path')
);

UPDATE knowledge_items
SET text = '(purpose_path) Акцент знака: capricorn.', priority = 102, is_active = 1, meta_json = '{}'
WHERE key = 'natal.sign.capricorn.present' AND locale = 'ru-RU' AND (topic_category = 'purpose_path');

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.sign.capricorn.present', 'purpose_path', 'ru-RU', '(purpose_path) Акцент знака: capricorn.', 102, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.sign.capricorn.present' AND locale = 'ru-RU' AND (topic_category = 'purpose_path')
);

UPDATE knowledge_items
SET text = '(purpose_path) Акцент знака: aquarius.', priority = 102, is_active = 1, meta_json = '{}'
WHERE key = 'natal.sign.aquarius.present' AND locale = 'ru-RU' AND (topic_category = 'purpose_path');

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.sign.aquarius.present', 'purpose_path', 'ru-RU', '(purpose_path) Акцент знака: aquarius.', 102, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.sign.aquarius.present' AND locale = 'ru-RU' AND (topic_category = 'purpose_path')
);

UPDATE knowledge_items
SET text = '(purpose_path) Акцент знака: pisces.', priority = 102, is_active = 1, meta_json = '{}'
WHERE key = 'natal.sign.pisces.present' AND locale = 'ru-RU' AND (topic_category = 'purpose_path');

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.sign.pisces.present', 'purpose_path', 'ru-RU', '(purpose_path) Акцент знака: pisces.', 102, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.sign.pisces.present' AND locale = 'ru-RU' AND (topic_category = 'purpose_path')
);

UPDATE knowledge_items
SET text = '(self_esteem) Акцент знака: aries.', priority = 102, is_active = 1, meta_json = '{}'
WHERE key = 'natal.sign.aries.present' AND locale = 'ru-RU' AND (topic_category = 'self_esteem');

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.sign.aries.present', 'self_esteem', 'ru-RU', '(self_esteem) Акцент знака: aries.', 102, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.sign.aries.present' AND locale = 'ru-RU' AND (topic_category = 'self_esteem')
);

UPDATE knowledge_items
SET text = '(self_esteem) Акцент знака: taurus.', priority = 102, is_active = 1, meta_json = '{}'
WHERE key = 'natal.sign.taurus.present' AND locale = 'ru-RU' AND (topic_category = 'self_esteem');

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.sign.taurus.present', 'self_esteem', 'ru-RU', '(self_esteem) Акцент знака: taurus.', 102, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.sign.taurus.present' AND locale = 'ru-RU' AND (topic_category = 'self_esteem')
);

UPDATE knowledge_items
SET text = '(self_esteem) Акцент знака: gemini.', priority = 102, is_active = 1, meta_json = '{}'
WHERE key = 'natal.sign.gemini.present' AND locale = 'ru-RU' AND (topic_category = 'self_esteem');

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.sign.gemini.present', 'self_esteem', 'ru-RU', '(self_esteem) Акцент знака: gemini.', 102, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.sign.gemini.present' AND locale = 'ru-RU' AND (topic_category = 'self_esteem')
);

UPDATE knowledge_items
SET text = '(self_esteem) Акцент знака: cancer.', priority = 102, is_active = 1, meta_json = '{}'
WHERE key = 'natal.sign.cancer.present' AND locale = 'ru-RU' AND (topic_category = 'self_esteem');

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.sign.cancer.present', 'self_esteem', 'ru-RU', '(self_esteem) Акцент знака: cancer.', 102, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.sign.cancer.present' AND locale = 'ru-RU' AND (topic_category = 'self_esteem')
);

UPDATE knowledge_items
SET text = '(self_esteem) Акцент знака: leo.', priority = 102, is_active = 1, meta_json = '{}'
WHERE key = 'natal.sign.leo.present' AND locale = 'ru-RU' AND (topic_category = 'self_esteem');

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.sign.leo.present', 'self_esteem', 'ru-RU', '(self_esteem) Акцент знака: leo.', 102, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.sign.leo.present' AND locale = 'ru-RU' AND (topic_category = 'self_esteem')
);

UPDATE knowledge_items
SET text = '(self_esteem) Акцент знака: virgo.', priority = 102, is_active = 1, meta_json = '{}'
WHERE key = 'natal.sign.virgo.present' AND locale = 'ru-RU' AND (topic_category = 'self_esteem');

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.sign.virgo.present', 'self_esteem', 'ru-RU', '(self_esteem) Акцент знака: virgo.', 102, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.sign.virgo.present' AND locale = 'ru-RU' AND (topic_category = 'self_esteem')
);

UPDATE knowledge_items
SET text = '(self_esteem) Акцент знака: libra.', priority = 102, is_active = 1, meta_json = '{}'
WHERE key = 'natal.sign.libra.present' AND locale = 'ru-RU' AND (topic_category = 'self_esteem');

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.sign.libra.present', 'self_esteem', 'ru-RU', '(self_esteem) Акцент знака: libra.', 102, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.sign.libra.present' AND locale = 'ru-RU' AND (topic_category = 'self_esteem')
);

UPDATE knowledge_items
SET text = '(self_esteem) Акцент знака: scorpio.', priority = 102, is_active = 1, meta_json = '{}'
WHERE key = 'natal.sign.scorpio.present' AND locale = 'ru-RU' AND (topic_category = 'self_esteem');

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.sign.scorpio.present', 'self_esteem', 'ru-RU', '(self_esteem) Акцент знака: scorpio.', 102, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.sign.scorpio.present' AND locale = 'ru-RU' AND (topic_category = 'self_esteem')
);

UPDATE knowledge_items
SET text = '(self_esteem) Акцент знака: sagittarius.', priority = 102, is_active = 1, meta_json = '{}'
WHERE key = 'natal.sign.sagittarius.present' AND locale = 'ru-RU' AND (topic_category = 'self_esteem');

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.sign.sagittarius.present', 'self_esteem', 'ru-RU', '(self_esteem) Акцент знака: sagittarius.', 102, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.sign.sagittarius.present' AND locale = 'ru-RU' AND (topic_category = 'self_esteem')
);

UPDATE knowledge_items
SET text = '(self_esteem) Акцент знака: capricorn.', priority = 102, is_active = 1, meta_json = '{}'
WHERE key = 'natal.sign.capricorn.present' AND locale = 'ru-RU' AND (topic_category = 'self_esteem');

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.sign.capricorn.present', 'self_esteem', 'ru-RU', '(self_esteem) Акцент знака: capricorn.', 102, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.sign.capricorn.present' AND locale = 'ru-RU' AND (topic_category = 'self_esteem')
);

UPDATE knowledge_items
SET text = '(self_esteem) Акцент знака: aquarius.', priority = 102, is_active = 1, meta_json = '{}'
WHERE key = 'natal.sign.aquarius.present' AND locale = 'ru-RU' AND (topic_category = 'self_esteem');

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.sign.aquarius.present', 'self_esteem', 'ru-RU', '(self_esteem) Акцент знака: aquarius.', 102, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.sign.aquarius.present' AND locale = 'ru-RU' AND (topic_category = 'self_esteem')
);

UPDATE knowledge_items
SET text = '(self_esteem) Акцент знака: pisces.', priority = 102, is_active = 1, meta_json = '{}'
WHERE key = 'natal.sign.pisces.present' AND locale = 'ru-RU' AND (topic_category = 'self_esteem');

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.sign.pisces.present', 'self_esteem', 'ru-RU', '(self_esteem) Акцент знака: pisces.', 102, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.sign.pisces.present' AND locale = 'ru-RU' AND (topic_category = 'self_esteem')
);

UPDATE knowledge_items
SET text = '(strengths_weaknesses) Акцент знака: aries.', priority = 102, is_active = 1, meta_json = '{}'
WHERE key = 'natal.sign.aries.present' AND locale = 'ru-RU' AND (topic_category = 'strengths_weaknesses');

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.sign.aries.present', 'strengths_weaknesses', 'ru-RU', '(strengths_weaknesses) Акцент знака: aries.', 102, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.sign.aries.present' AND locale = 'ru-RU' AND (topic_category = 'strengths_weaknesses')
);

UPDATE knowledge_items
SET text = '(strengths_weaknesses) Акцент знака: taurus.', priority = 102, is_active = 1, meta_json = '{}'
WHERE key = 'natal.sign.taurus.present' AND locale = 'ru-RU' AND (topic_category = 'strengths_weaknesses');

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.sign.taurus.present', 'strengths_weaknesses', 'ru-RU', '(strengths_weaknesses) Акцент знака: taurus.', 102, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.sign.taurus.present' AND locale = 'ru-RU' AND (topic_category = 'strengths_weaknesses')
);

UPDATE knowledge_items
SET text = '(strengths_weaknesses) Акцент знака: gemini.', priority = 102, is_active = 1, meta_json = '{}'
WHERE key = 'natal.sign.gemini.present' AND locale = 'ru-RU' AND (topic_category = 'strengths_weaknesses');

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.sign.gemini.present', 'strengths_weaknesses', 'ru-RU', '(strengths_weaknesses) Акцент знака: gemini.', 102, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.sign.gemini.present' AND locale = 'ru-RU' AND (topic_category = 'strengths_weaknesses')
);

UPDATE knowledge_items
SET text = '(strengths_weaknesses) Акцент знака: cancer.', priority = 102, is_active = 1, meta_json = '{}'
WHERE key = 'natal.sign.cancer.present' AND locale = 'ru-RU' AND (topic_category = 'strengths_weaknesses');

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.sign.cancer.present', 'strengths_weaknesses', 'ru-RU', '(strengths_weaknesses) Акцент знака: cancer.', 102, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.sign.cancer.present' AND locale = 'ru-RU' AND (topic_category = 'strengths_weaknesses')
);

UPDATE knowledge_items
SET text = '(strengths_weaknesses) Акцент знака: leo.', priority = 102, is_active = 1, meta_json = '{}'
WHERE key = 'natal.sign.leo.present' AND locale = 'ru-RU' AND (topic_category = 'strengths_weaknesses');

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.sign.leo.present', 'strengths_weaknesses', 'ru-RU', '(strengths_weaknesses) Акцент знака: leo.', 102, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.sign.leo.present' AND locale = 'ru-RU' AND (topic_category = 'strengths_weaknesses')
);

UPDATE knowledge_items
SET text = '(strengths_weaknesses) Акцент знака: virgo.', priority = 102, is_active = 1, meta_json = '{}'
WHERE key = 'natal.sign.virgo.present' AND locale = 'ru-RU' AND (topic_category = 'strengths_weaknesses');

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.sign.virgo.present', 'strengths_weaknesses', 'ru-RU', '(strengths_weaknesses) Акцент знака: virgo.', 102, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.sign.virgo.present' AND locale = 'ru-RU' AND (topic_category = 'strengths_weaknesses')
);

UPDATE knowledge_items
SET text = '(strengths_weaknesses) Акцент знака: libra.', priority = 102, is_active = 1, meta_json = '{}'
WHERE key = 'natal.sign.libra.present' AND locale = 'ru-RU' AND (topic_category = 'strengths_weaknesses');

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.sign.libra.present', 'strengths_weaknesses', 'ru-RU', '(strengths_weaknesses) Акцент знака: libra.', 102, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.sign.libra.present' AND locale = 'ru-RU' AND (topic_category = 'strengths_weaknesses')
);

UPDATE knowledge_items
SET text = '(strengths_weaknesses) Акцент знака: scorpio.', priority = 102, is_active = 1, meta_json = '{}'
WHERE key = 'natal.sign.scorpio.present' AND locale = 'ru-RU' AND (topic_category = 'strengths_weaknesses');

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.sign.scorpio.present', 'strengths_weaknesses', 'ru-RU', '(strengths_weaknesses) Акцент знака: scorpio.', 102, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.sign.scorpio.present' AND locale = 'ru-RU' AND (topic_category = 'strengths_weaknesses')
);

UPDATE knowledge_items
SET text = '(strengths_weaknesses) Акцент знака: sagittarius.', priority = 102, is_active = 1, meta_json = '{}'
WHERE key = 'natal.sign.sagittarius.present' AND locale = 'ru-RU' AND (topic_category = 'strengths_weaknesses');

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.sign.sagittarius.present', 'strengths_weaknesses', 'ru-RU', '(strengths_weaknesses) Акцент знака: sagittarius.', 102, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.sign.sagittarius.present' AND locale = 'ru-RU' AND (topic_category = 'strengths_weaknesses')
);

UPDATE knowledge_items
SET text = '(strengths_weaknesses) Акцент знака: capricorn.', priority = 102, is_active = 1, meta_json = '{}'
WHERE key = 'natal.sign.capricorn.present' AND locale = 'ru-RU' AND (topic_category = 'strengths_weaknesses');

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.sign.capricorn.present', 'strengths_weaknesses', 'ru-RU', '(strengths_weaknesses) Акцент знака: capricorn.', 102, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.sign.capricorn.present' AND locale = 'ru-RU' AND (topic_category = 'strengths_weaknesses')
);

UPDATE knowledge_items
SET text = '(strengths_weaknesses) Акцент знака: aquarius.', priority = 102, is_active = 1, meta_json = '{}'
WHERE key = 'natal.sign.aquarius.present' AND locale = 'ru-RU' AND (topic_category = 'strengths_weaknesses');

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.sign.aquarius.present', 'strengths_weaknesses', 'ru-RU', '(strengths_weaknesses) Акцент знака: aquarius.', 102, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.sign.aquarius.present' AND locale = 'ru-RU' AND (topic_category = 'strengths_weaknesses')
);

UPDATE knowledge_items
SET text = '(strengths_weaknesses) Акцент знака: pisces.', priority = 102, is_active = 1, meta_json = '{}'
WHERE key = 'natal.sign.pisces.present' AND locale = 'ru-RU' AND (topic_category = 'strengths_weaknesses');

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.sign.pisces.present', 'strengths_weaknesses', 'ru-RU', '(strengths_weaknesses) Акцент знака: pisces.', 102, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.sign.pisces.present' AND locale = 'ru-RU' AND (topic_category = 'strengths_weaknesses')
);

UPDATE knowledge_items
SET text = '(talents) Акцент знака: aries.', priority = 102, is_active = 1, meta_json = '{}'
WHERE key = 'natal.sign.aries.present' AND locale = 'ru-RU' AND (topic_category = 'talents');

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.sign.aries.present', 'talents', 'ru-RU', '(talents) Акцент знака: aries.', 102, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.sign.aries.present' AND locale = 'ru-RU' AND (topic_category = 'talents')
);

UPDATE knowledge_items
SET text = '(talents) Акцент знака: taurus.', priority = 102, is_active = 1, meta_json = '{}'
WHERE key = 'natal.sign.taurus.present' AND locale = 'ru-RU' AND (topic_category = 'talents');

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.sign.taurus.present', 'talents', 'ru-RU', '(talents) Акцент знака: taurus.', 102, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.sign.taurus.present' AND locale = 'ru-RU' AND (topic_category = 'talents')
);

UPDATE knowledge_items
SET text = '(talents) Акцент знака: gemini.', priority = 102, is_active = 1, meta_json = '{}'
WHERE key = 'natal.sign.gemini.present' AND locale = 'ru-RU' AND (topic_category = 'talents');

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.sign.gemini.present', 'talents', 'ru-RU', '(talents) Акцент знака: gemini.', 102, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.sign.gemini.present' AND locale = 'ru-RU' AND (topic_category = 'talents')
);

UPDATE knowledge_items
SET text = '(talents) Акцент знака: cancer.', priority = 102, is_active = 1, meta_json = '{}'
WHERE key = 'natal.sign.cancer.present' AND locale = 'ru-RU' AND (topic_category = 'talents');

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.sign.cancer.present', 'talents', 'ru-RU', '(talents) Акцент знака: cancer.', 102, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.sign.cancer.present' AND locale = 'ru-RU' AND (topic_category = 'talents')
);

UPDATE knowledge_items
SET text = '(talents) Акцент знака: leo.', priority = 102, is_active = 1, meta_json = '{}'
WHERE key = 'natal.sign.leo.present' AND locale = 'ru-RU' AND (topic_category = 'talents');

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.sign.leo.present', 'talents', 'ru-RU', '(talents) Акцент знака: leo.', 102, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.sign.leo.present' AND locale = 'ru-RU' AND (topic_category = 'talents')
);

UPDATE knowledge_items
SET text = '(talents) Акцент знака: virgo.', priority = 102, is_active = 1, meta_json = '{}'
WHERE key = 'natal.sign.virgo.present' AND locale = 'ru-RU' AND (topic_category = 'talents');

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.sign.virgo.present', 'talents', 'ru-RU', '(talents) Акцент знака: virgo.', 102, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.sign.virgo.present' AND locale = 'ru-RU' AND (topic_category = 'talents')
);

UPDATE knowledge_items
SET text = '(talents) Акцент знака: libra.', priority = 102, is_active = 1, meta_json = '{}'
WHERE key = 'natal.sign.libra.present' AND locale = 'ru-RU' AND (topic_category = 'talents');

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.sign.libra.present', 'talents', 'ru-RU', '(talents) Акцент знака: libra.', 102, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.sign.libra.present' AND locale = 'ru-RU' AND (topic_category = 'talents')
);

UPDATE knowledge_items
SET text = '(talents) Акцент знака: scorpio.', priority = 102, is_active = 1, meta_json = '{}'
WHERE key = 'natal.sign.scorpio.present' AND locale = 'ru-RU' AND (topic_category = 'talents');

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.sign.scorpio.present', 'talents', 'ru-RU', '(talents) Акцент знака: scorpio.', 102, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.sign.scorpio.present' AND locale = 'ru-RU' AND (topic_category = 'talents')
);

UPDATE knowledge_items
SET text = '(talents) Акцент знака: sagittarius.', priority = 102, is_active = 1, meta_json = '{}'
WHERE key = 'natal.sign.sagittarius.present' AND locale = 'ru-RU' AND (topic_category = 'talents');

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.sign.sagittarius.present', 'talents', 'ru-RU', '(talents) Акцент знака: sagittarius.', 102, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.sign.sagittarius.present' AND locale = 'ru-RU' AND (topic_category = 'talents')
);

UPDATE knowledge_items
SET text = '(talents) Акцент знака: capricorn.', priority = 102, is_active = 1, meta_json = '{}'
WHERE key = 'natal.sign.capricorn.present' AND locale = 'ru-RU' AND (topic_category = 'talents');

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.sign.capricorn.present', 'talents', 'ru-RU', '(talents) Акцент знака: capricorn.', 102, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.sign.capricorn.present' AND locale = 'ru-RU' AND (topic_category = 'talents')
);

UPDATE knowledge_items
SET text = '(talents) Акцент знака: aquarius.', priority = 102, is_active = 1, meta_json = '{}'
WHERE key = 'natal.sign.aquarius.present' AND locale = 'ru-RU' AND (topic_category = 'talents');

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.sign.aquarius.present', 'talents', 'ru-RU', '(talents) Акцент знака: aquarius.', 102, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.sign.aquarius.present' AND locale = 'ru-RU' AND (topic_category = 'talents')
);

UPDATE knowledge_items
SET text = '(talents) Акцент знака: pisces.', priority = 102, is_active = 1, meta_json = '{}'
WHERE key = 'natal.sign.pisces.present' AND locale = 'ru-RU' AND (topic_category = 'talents');

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.sign.pisces.present', 'talents', 'ru-RU', '(talents) Акцент знака: pisces.', 102, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.sign.pisces.present' AND locale = 'ru-RU' AND (topic_category = 'talents')
);

COMMIT;

