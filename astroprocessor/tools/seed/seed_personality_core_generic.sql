-- Baseline fallback for personality_core: natal.generic (ru-RU)
-- - Inserts if missing
-- - If exists: ensure active, ensure non-empty text, ensure decent priority

BEGIN;

-- 1) Try to update existing record(s)
UPDATE knowledge_items
SET
  is_active = 1,
  priority = CASE WHEN priority < 50 THEN 50 ELSE priority END,
  text = CASE
    WHEN text IS NULL OR LENGTH(TRIM(text)) = 0 THEN
      'Базовый блок personality_core. Используется как fallback, когда специфические ключи недоступны. Дай нейтральную, фактическую интерпретацию без обращения на «ты», без коучинга, без эмоций; коротко, структурировано.'
    ELSE text
  END
WHERE topic_category = 'personality_core'
  AND key = 'natal.generic'
  AND locale = 'ru-RU';

-- 2) Insert if still missing
INSERT INTO knowledge_items (topic_category, locale, key, priority, text, is_active, created_at)
SELECT
  'personality_core',
  'ru-RU',
  'natal.generic',
  50,
  'Базовый блок personality_core. Используется как fallback, когда специфические ключи недоступны. Дай нейтральную, фактическую интерпретацию без обращения на «ты», без коучинга, без эмоций; коротко, структурировано.',
  1,
  CAST(strftime('%s','now') AS INTEGER)
WHERE NOT EXISTS (
  SELECT 1
  FROM knowledge_items
  WHERE topic_category = 'personality_core'
    AND key = 'natal.generic'
    AND locale = 'ru-RU'
);

COMMIT;
