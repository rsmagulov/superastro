-- astroprocessor/tools/seed/seed_house_ruler_aspects_cleanup.sql
-- Cleanup typo key + normalize priorities for house 7 ruler aspect scaffolds

BEGIN;

-- 1) Удаляем опечатку "harmonious" (оставляем только "harmonic")
DELETE FROM knowledge_items
WHERE key = 'natal.house.7.ruler.aspect.class.harmonious'
  AND locale = 'ru-RU'
  AND topic_category IN ('love_intimacy', 'partnership_marriage');

-- 2) Нормализуем приоритеты love_intimacy до целевых (как в scaffold)
UPDATE knowledge_items
SET priority = 92, is_active = 1
WHERE key = 'natal.house.7.ruler.aspect.class.tense'
  AND locale = 'ru-RU'
  AND topic_category = 'love_intimacy';

UPDATE knowledge_items
SET priority = 92, is_active = 1
WHERE key = 'natal.house.7.ruler.aspect.class.harmonic'
  AND locale = 'ru-RU'
  AND topic_category = 'love_intimacy';

UPDATE knowledge_items
SET priority = 94, is_active = 1
WHERE key = 'natal.house.7.ruler.aspect.with.angle.dsc'
  AND locale = 'ru-RU'
  AND topic_category = 'love_intimacy';

COMMIT;