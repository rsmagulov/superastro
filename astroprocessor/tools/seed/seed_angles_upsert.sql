-- astroprocessor/tools/seed/seed_angles_upsert.sql
-- Clean, sqlite-safe idempotent seed (no PowerShell, no ON CONFLICT).
-- Upserts:
-- - natal.angle.mc.sign.any: global + career
-- - natal.angle.dsc.sign.any: global + love_intimacy + partnership_marriage
--
-- Assumes table knowledge_items has columns:
-- (key, topic_category, locale, text, priority, created_at, is_active, meta_json)

BEGIN;

-- =========================
-- MC: global
-- =========================
UPDATE knowledge_items
SET
  text = 'MC: общий вектор карьеры, амбиций и социальной реализации.',
  priority = 110,
  is_active = 1,
  meta_json = '{}'
WHERE key = 'natal.angle.mc.sign.any'
  AND locale = 'ru-RU'
  AND (topic_category = '' OR topic_category IS NULL);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT
  'natal.angle.mc.sign.any',
  '',
  'ru-RU',
  'MC: общий вектор карьеры, амбиций и социальной реализации.',
  110,
  strftime('%s','now'),
  1,
  '{}'
WHERE NOT EXISTS (
  SELECT 1
  FROM knowledge_items
  WHERE key = 'natal.angle.mc.sign.any'
    AND locale = 'ru-RU'
    AND (topic_category = '' OR topic_category IS NULL)
);

-- =========================
-- MC: career
-- =========================
UPDATE knowledge_items
SET
  text = 'MC (карьера): где вы растёте в статусе, что приносит признание и какие амбиции лучше усиливать.',
  priority = 125,
  is_active = 1,
  meta_json = '{}'
WHERE key = 'natal.angle.mc.sign.any'
  AND locale = 'ru-RU'
  AND topic_category = 'career';

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT
  'natal.angle.mc.sign.any',
  'career',
  'ru-RU',
  'MC (карьера): где вы растёте в статусе, что приносит признание и какие амбиции лучше усиливать.',
  125,
  strftime('%s','now'),
  1,
  '{}'
WHERE NOT EXISTS (
  SELECT 1
  FROM knowledge_items
  WHERE key = 'natal.angle.mc.sign.any'
    AND locale = 'ru-RU'
    AND topic_category = 'career'
);

-- =========================
-- DSC: global
-- =========================
UPDATE knowledge_items
SET
  text = 'DSC: общий стиль партнёрства — какие качества вы ищете в людях и как строите “мы”.',
  priority = 110,
  is_active = 1,
  meta_json = '{}'
WHERE key = 'natal.angle.dsc.sign.any'
  AND locale = 'ru-RU'
  AND (topic_category = '' OR topic_category IS NULL);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT
  'natal.angle.dsc.sign.any',
  '',
  'ru-RU',
  'DSC: общий стиль партнёрства — какие качества вы ищете в людях и как строите “мы”.',
  110,
  strftime('%s','now'),
  1,
  '{}'
WHERE NOT EXISTS (
  SELECT 1
  FROM knowledge_items
  WHERE key = 'natal.angle.dsc.sign.any'
    AND locale = 'ru-RU'
    AND (topic_category = '' OR topic_category IS NULL)
);

-- =========================
-- DSC: love_intimacy
-- =========================
UPDATE knowledge_items
SET
  text = 'DSC (любовь/интимность): что для вас важно в близости, как выбираете партнёра и как проявляется притяжение.',
  priority = 125,
  is_active = 1,
  meta_json = '{}'
WHERE key = 'natal.angle.dsc.sign.any'
  AND locale = 'ru-RU'
  AND topic_category = 'love_intimacy';

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT
  'natal.angle.dsc.sign.any',
  'love_intimacy',
  'ru-RU',
  'DSC (любовь/интимность): что для вас важно в близости, как выбираете партнёра и как проявляется притяжение.',
  125,
  strftime('%s','now'),
  1,
  '{}'
WHERE NOT EXISTS (
  SELECT 1
  FROM knowledge_items
  WHERE key = 'natal.angle.dsc.sign.any'
    AND locale = 'ru-RU'
    AND topic_category = 'love_intimacy'
);

-- =========================
-- DSC: partnership_marriage
-- =========================
UPDATE knowledge_items
SET
  text = 'DSC (партнёрство/брак): модель союза, ожидания от “официальных” отношений и условия для долгосрочности.',
  priority = 125,
  is_active = 1,
  meta_json = '{}'
WHERE key = 'natal.angle.dsc.sign.any'
  AND locale = 'ru-RU'
  AND topic_category = 'partnership_marriage';

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT
  'natal.angle.dsc.sign.any',
  'partnership_marriage',
  'ru-RU',
  'DSC (партнёрство/брак): модель союза, ожидания от “официальных” отношений и условия для долгосрочности.',
  125,
  strftime('%s','now'),
  1,
  '{}'
WHERE NOT EXISTS (
  SELECT 1
  FROM knowledge_items
  WHERE key = 'natal.angle.dsc.sign.any'
    AND locale = 'ru-RU'
    AND topic_category = 'partnership_marriage'
);

COMMIT;