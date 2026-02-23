-- AUTO-GENERATED. DO NOT EDIT BY HAND.

-- GLOBAL house cusp sign scaffolds

BEGIN;

UPDATE knowledge_items
SET text = 'Куспид 1-го дома в знаке: задаёт тон и стиль проявления темы 1-го дома.', priority = 85, is_active = 1, meta_json = '{}'
WHERE key = 'natal.house.1.cusp.sign.any' AND locale = 'ru-RU'
  AND (topic_category = '' OR topic_category IS NULL)
  AND (text IS NULL OR LENGTH(TRIM(text))=0);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.1.cusp.sign.any', '', 'ru-RU', 'Куспид 1-го дома в знаке: задаёт тон и стиль проявления темы 1-го дома.', 85, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.1.cusp.sign.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Куспид 1-го дома в «Овен»: стиль темы 1-го дома через качества «Овен».', priority = 86, is_active = 1, meta_json = '{}'
WHERE key = 'natal.house.1.cusp.sign.aries' AND locale = 'ru-RU'
  AND (topic_category = '' OR topic_category IS NULL)
  AND (text IS NULL OR LENGTH(TRIM(text))=0);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.1.cusp.sign.aries', '', 'ru-RU', 'Куспид 1-го дома в «Овен»: стиль темы 1-го дома через качества «Овен».', 86, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.1.cusp.sign.aries' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Куспид 1-го дома в «Телец»: стиль темы 1-го дома через качества «Телец».', priority = 86, is_active = 1, meta_json = '{}'
WHERE key = 'natal.house.1.cusp.sign.taurus' AND locale = 'ru-RU'
  AND (topic_category = '' OR topic_category IS NULL)
  AND (text IS NULL OR LENGTH(TRIM(text))=0);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.1.cusp.sign.taurus', '', 'ru-RU', 'Куспид 1-го дома в «Телец»: стиль темы 1-го дома через качества «Телец».', 86, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.1.cusp.sign.taurus' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Куспид 1-го дома в «Близнецы»: стиль темы 1-го дома через качества «Близнецы».', priority = 86, is_active = 1, meta_json = '{}'
WHERE key = 'natal.house.1.cusp.sign.gemini' AND locale = 'ru-RU'
  AND (topic_category = '' OR topic_category IS NULL)
  AND (text IS NULL OR LENGTH(TRIM(text))=0);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.1.cusp.sign.gemini', '', 'ru-RU', 'Куспид 1-го дома в «Близнецы»: стиль темы 1-го дома через качества «Близнецы».', 86, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.1.cusp.sign.gemini' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Куспид 1-го дома в «Рак»: стиль темы 1-го дома через качества «Рак».', priority = 86, is_active = 1, meta_json = '{}'
WHERE key = 'natal.house.1.cusp.sign.cancer' AND locale = 'ru-RU'
  AND (topic_category = '' OR topic_category IS NULL)
  AND (text IS NULL OR LENGTH(TRIM(text))=0);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.1.cusp.sign.cancer', '', 'ru-RU', 'Куспид 1-го дома в «Рак»: стиль темы 1-го дома через качества «Рак».', 86, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.1.cusp.sign.cancer' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Куспид 1-го дома в «Лев»: стиль темы 1-го дома через качества «Лев».', priority = 86, is_active = 1, meta_json = '{}'
WHERE key = 'natal.house.1.cusp.sign.leo' AND locale = 'ru-RU'
  AND (topic_category = '' OR topic_category IS NULL)
  AND (text IS NULL OR LENGTH(TRIM(text))=0);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.1.cusp.sign.leo', '', 'ru-RU', 'Куспид 1-го дома в «Лев»: стиль темы 1-го дома через качества «Лев».', 86, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.1.cusp.sign.leo' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Куспид 1-го дома в «Дева»: стиль темы 1-го дома через качества «Дева».', priority = 86, is_active = 1, meta_json = '{}'
WHERE key = 'natal.house.1.cusp.sign.virgo' AND locale = 'ru-RU'
  AND (topic_category = '' OR topic_category IS NULL)
  AND (text IS NULL OR LENGTH(TRIM(text))=0);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.1.cusp.sign.virgo', '', 'ru-RU', 'Куспид 1-го дома в «Дева»: стиль темы 1-го дома через качества «Дева».', 86, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.1.cusp.sign.virgo' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Куспид 1-го дома в «Весы»: стиль темы 1-го дома через качества «Весы».', priority = 86, is_active = 1, meta_json = '{}'
WHERE key = 'natal.house.1.cusp.sign.libra' AND locale = 'ru-RU'
  AND (topic_category = '' OR topic_category IS NULL)
  AND (text IS NULL OR LENGTH(TRIM(text))=0);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.1.cusp.sign.libra', '', 'ru-RU', 'Куспид 1-го дома в «Весы»: стиль темы 1-го дома через качества «Весы».', 86, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.1.cusp.sign.libra' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Куспид 1-го дома в «Скорпион»: стиль темы 1-го дома через качества «Скорпион».', priority = 86, is_active = 1, meta_json = '{}'
WHERE key = 'natal.house.1.cusp.sign.scorpio' AND locale = 'ru-RU'
  AND (topic_category = '' OR topic_category IS NULL)
  AND (text IS NULL OR LENGTH(TRIM(text))=0);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.1.cusp.sign.scorpio', '', 'ru-RU', 'Куспид 1-го дома в «Скорпион»: стиль темы 1-го дома через качества «Скорпион».', 86, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.1.cusp.sign.scorpio' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Куспид 1-го дома в «Стрелец»: стиль темы 1-го дома через качества «Стрелец».', priority = 86, is_active = 1, meta_json = '{}'
WHERE key = 'natal.house.1.cusp.sign.sagittarius' AND locale = 'ru-RU'
  AND (topic_category = '' OR topic_category IS NULL)
  AND (text IS NULL OR LENGTH(TRIM(text))=0);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.1.cusp.sign.sagittarius', '', 'ru-RU', 'Куспид 1-го дома в «Стрелец»: стиль темы 1-го дома через качества «Стрелец».', 86, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.1.cusp.sign.sagittarius' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Куспид 1-го дома в «Козерог»: стиль темы 1-го дома через качества «Козерог».', priority = 86, is_active = 1, meta_json = '{}'
WHERE key = 'natal.house.1.cusp.sign.capricorn' AND locale = 'ru-RU'
  AND (topic_category = '' OR topic_category IS NULL)
  AND (text IS NULL OR LENGTH(TRIM(text))=0);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.1.cusp.sign.capricorn', '', 'ru-RU', 'Куспид 1-го дома в «Козерог»: стиль темы 1-го дома через качества «Козерог».', 86, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.1.cusp.sign.capricorn' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Куспид 1-го дома в «Водолей»: стиль темы 1-го дома через качества «Водолей».', priority = 86, is_active = 1, meta_json = '{}'
WHERE key = 'natal.house.1.cusp.sign.aquarius' AND locale = 'ru-RU'
  AND (topic_category = '' OR topic_category IS NULL)
  AND (text IS NULL OR LENGTH(TRIM(text))=0);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.1.cusp.sign.aquarius', '', 'ru-RU', 'Куспид 1-го дома в «Водолей»: стиль темы 1-го дома через качества «Водолей».', 86, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.1.cusp.sign.aquarius' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Куспид 1-го дома в «Рыбы»: стиль темы 1-го дома через качества «Рыбы».', priority = 86, is_active = 1, meta_json = '{}'
WHERE key = 'natal.house.1.cusp.sign.pisces' AND locale = 'ru-RU'
  AND (topic_category = '' OR topic_category IS NULL)
  AND (text IS NULL OR LENGTH(TRIM(text))=0);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.1.cusp.sign.pisces', '', 'ru-RU', 'Куспид 1-го дома в «Рыбы»: стиль темы 1-го дома через качества «Рыбы».', 86, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.1.cusp.sign.pisces' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Куспид 2-го дома в знаке: задаёт тон и стиль проявления темы 2-го дома.', priority = 85, is_active = 1, meta_json = '{}'
WHERE key = 'natal.house.2.cusp.sign.any' AND locale = 'ru-RU'
  AND (topic_category = '' OR topic_category IS NULL)
  AND (text IS NULL OR LENGTH(TRIM(text))=0);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.2.cusp.sign.any', '', 'ru-RU', 'Куспид 2-го дома в знаке: задаёт тон и стиль проявления темы 2-го дома.', 85, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.2.cusp.sign.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Куспид 2-го дома в «Овен»: стиль темы 2-го дома через качества «Овен».', priority = 86, is_active = 1, meta_json = '{}'
WHERE key = 'natal.house.2.cusp.sign.aries' AND locale = 'ru-RU'
  AND (topic_category = '' OR topic_category IS NULL)
  AND (text IS NULL OR LENGTH(TRIM(text))=0);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.2.cusp.sign.aries', '', 'ru-RU', 'Куспид 2-го дома в «Овен»: стиль темы 2-го дома через качества «Овен».', 86, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.2.cusp.sign.aries' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Куспид 2-го дома в «Телец»: стиль темы 2-го дома через качества «Телец».', priority = 86, is_active = 1, meta_json = '{}'
WHERE key = 'natal.house.2.cusp.sign.taurus' AND locale = 'ru-RU'
  AND (topic_category = '' OR topic_category IS NULL)
  AND (text IS NULL OR LENGTH(TRIM(text))=0);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.2.cusp.sign.taurus', '', 'ru-RU', 'Куспид 2-го дома в «Телец»: стиль темы 2-го дома через качества «Телец».', 86, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.2.cusp.sign.taurus' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Куспид 2-го дома в «Близнецы»: стиль темы 2-го дома через качества «Близнецы».', priority = 86, is_active = 1, meta_json = '{}'
WHERE key = 'natal.house.2.cusp.sign.gemini' AND locale = 'ru-RU'
  AND (topic_category = '' OR topic_category IS NULL)
  AND (text IS NULL OR LENGTH(TRIM(text))=0);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.2.cusp.sign.gemini', '', 'ru-RU', 'Куспид 2-го дома в «Близнецы»: стиль темы 2-го дома через качества «Близнецы».', 86, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.2.cusp.sign.gemini' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Куспид 2-го дома в «Рак»: стиль темы 2-го дома через качества «Рак».', priority = 86, is_active = 1, meta_json = '{}'
WHERE key = 'natal.house.2.cusp.sign.cancer' AND locale = 'ru-RU'
  AND (topic_category = '' OR topic_category IS NULL)
  AND (text IS NULL OR LENGTH(TRIM(text))=0);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.2.cusp.sign.cancer', '', 'ru-RU', 'Куспид 2-го дома в «Рак»: стиль темы 2-го дома через качества «Рак».', 86, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.2.cusp.sign.cancer' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Куспид 2-го дома в «Лев»: стиль темы 2-го дома через качества «Лев».', priority = 86, is_active = 1, meta_json = '{}'
WHERE key = 'natal.house.2.cusp.sign.leo' AND locale = 'ru-RU'
  AND (topic_category = '' OR topic_category IS NULL)
  AND (text IS NULL OR LENGTH(TRIM(text))=0);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.2.cusp.sign.leo', '', 'ru-RU', 'Куспид 2-го дома в «Лев»: стиль темы 2-го дома через качества «Лев».', 86, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.2.cusp.sign.leo' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Куспид 2-го дома в «Дева»: стиль темы 2-го дома через качества «Дева».', priority = 86, is_active = 1, meta_json = '{}'
WHERE key = 'natal.house.2.cusp.sign.virgo' AND locale = 'ru-RU'
  AND (topic_category = '' OR topic_category IS NULL)
  AND (text IS NULL OR LENGTH(TRIM(text))=0);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.2.cusp.sign.virgo', '', 'ru-RU', 'Куспид 2-го дома в «Дева»: стиль темы 2-го дома через качества «Дева».', 86, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.2.cusp.sign.virgo' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Куспид 2-го дома в «Весы»: стиль темы 2-го дома через качества «Весы».', priority = 86, is_active = 1, meta_json = '{}'
WHERE key = 'natal.house.2.cusp.sign.libra' AND locale = 'ru-RU'
  AND (topic_category = '' OR topic_category IS NULL)
  AND (text IS NULL OR LENGTH(TRIM(text))=0);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.2.cusp.sign.libra', '', 'ru-RU', 'Куспид 2-го дома в «Весы»: стиль темы 2-го дома через качества «Весы».', 86, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.2.cusp.sign.libra' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Куспид 2-го дома в «Скорпион»: стиль темы 2-го дома через качества «Скорпион».', priority = 86, is_active = 1, meta_json = '{}'
WHERE key = 'natal.house.2.cusp.sign.scorpio' AND locale = 'ru-RU'
  AND (topic_category = '' OR topic_category IS NULL)
  AND (text IS NULL OR LENGTH(TRIM(text))=0);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.2.cusp.sign.scorpio', '', 'ru-RU', 'Куспид 2-го дома в «Скорпион»: стиль темы 2-го дома через качества «Скорпион».', 86, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.2.cusp.sign.scorpio' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Куспид 2-го дома в «Стрелец»: стиль темы 2-го дома через качества «Стрелец».', priority = 86, is_active = 1, meta_json = '{}'
WHERE key = 'natal.house.2.cusp.sign.sagittarius' AND locale = 'ru-RU'
  AND (topic_category = '' OR topic_category IS NULL)
  AND (text IS NULL OR LENGTH(TRIM(text))=0);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.2.cusp.sign.sagittarius', '', 'ru-RU', 'Куспид 2-го дома в «Стрелец»: стиль темы 2-го дома через качества «Стрелец».', 86, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.2.cusp.sign.sagittarius' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Куспид 2-го дома в «Козерог»: стиль темы 2-го дома через качества «Козерог».', priority = 86, is_active = 1, meta_json = '{}'
WHERE key = 'natal.house.2.cusp.sign.capricorn' AND locale = 'ru-RU'
  AND (topic_category = '' OR topic_category IS NULL)
  AND (text IS NULL OR LENGTH(TRIM(text))=0);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.2.cusp.sign.capricorn', '', 'ru-RU', 'Куспид 2-го дома в «Козерог»: стиль темы 2-го дома через качества «Козерог».', 86, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.2.cusp.sign.capricorn' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Куспид 2-го дома в «Водолей»: стиль темы 2-го дома через качества «Водолей».', priority = 86, is_active = 1, meta_json = '{}'
WHERE key = 'natal.house.2.cusp.sign.aquarius' AND locale = 'ru-RU'
  AND (topic_category = '' OR topic_category IS NULL)
  AND (text IS NULL OR LENGTH(TRIM(text))=0);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.2.cusp.sign.aquarius', '', 'ru-RU', 'Куспид 2-го дома в «Водолей»: стиль темы 2-го дома через качества «Водолей».', 86, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.2.cusp.sign.aquarius' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Куспид 2-го дома в «Рыбы»: стиль темы 2-го дома через качества «Рыбы».', priority = 86, is_active = 1, meta_json = '{}'
WHERE key = 'natal.house.2.cusp.sign.pisces' AND locale = 'ru-RU'
  AND (topic_category = '' OR topic_category IS NULL)
  AND (text IS NULL OR LENGTH(TRIM(text))=0);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.2.cusp.sign.pisces', '', 'ru-RU', 'Куспид 2-го дома в «Рыбы»: стиль темы 2-го дома через качества «Рыбы».', 86, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.2.cusp.sign.pisces' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Куспид 3-го дома в знаке: задаёт тон и стиль проявления темы 3-го дома.', priority = 85, is_active = 1, meta_json = '{}'
WHERE key = 'natal.house.3.cusp.sign.any' AND locale = 'ru-RU'
  AND (topic_category = '' OR topic_category IS NULL)
  AND (text IS NULL OR LENGTH(TRIM(text))=0);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.3.cusp.sign.any', '', 'ru-RU', 'Куспид 3-го дома в знаке: задаёт тон и стиль проявления темы 3-го дома.', 85, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.3.cusp.sign.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Куспид 3-го дома в «Овен»: стиль темы 3-го дома через качества «Овен».', priority = 86, is_active = 1, meta_json = '{}'
WHERE key = 'natal.house.3.cusp.sign.aries' AND locale = 'ru-RU'
  AND (topic_category = '' OR topic_category IS NULL)
  AND (text IS NULL OR LENGTH(TRIM(text))=0);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.3.cusp.sign.aries', '', 'ru-RU', 'Куспид 3-го дома в «Овен»: стиль темы 3-го дома через качества «Овен».', 86, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.3.cusp.sign.aries' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Куспид 3-го дома в «Телец»: стиль темы 3-го дома через качества «Телец».', priority = 86, is_active = 1, meta_json = '{}'
WHERE key = 'natal.house.3.cusp.sign.taurus' AND locale = 'ru-RU'
  AND (topic_category = '' OR topic_category IS NULL)
  AND (text IS NULL OR LENGTH(TRIM(text))=0);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.3.cusp.sign.taurus', '', 'ru-RU', 'Куспид 3-го дома в «Телец»: стиль темы 3-го дома через качества «Телец».', 86, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.3.cusp.sign.taurus' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Куспид 3-го дома в «Близнецы»: стиль темы 3-го дома через качества «Близнецы».', priority = 86, is_active = 1, meta_json = '{}'
WHERE key = 'natal.house.3.cusp.sign.gemini' AND locale = 'ru-RU'
  AND (topic_category = '' OR topic_category IS NULL)
  AND (text IS NULL OR LENGTH(TRIM(text))=0);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.3.cusp.sign.gemini', '', 'ru-RU', 'Куспид 3-го дома в «Близнецы»: стиль темы 3-го дома через качества «Близнецы».', 86, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.3.cusp.sign.gemini' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Куспид 3-го дома в «Рак»: стиль темы 3-го дома через качества «Рак».', priority = 86, is_active = 1, meta_json = '{}'
WHERE key = 'natal.house.3.cusp.sign.cancer' AND locale = 'ru-RU'
  AND (topic_category = '' OR topic_category IS NULL)
  AND (text IS NULL OR LENGTH(TRIM(text))=0);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.3.cusp.sign.cancer', '', 'ru-RU', 'Куспид 3-го дома в «Рак»: стиль темы 3-го дома через качества «Рак».', 86, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.3.cusp.sign.cancer' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Куспид 3-го дома в «Лев»: стиль темы 3-го дома через качества «Лев».', priority = 86, is_active = 1, meta_json = '{}'
WHERE key = 'natal.house.3.cusp.sign.leo' AND locale = 'ru-RU'
  AND (topic_category = '' OR topic_category IS NULL)
  AND (text IS NULL OR LENGTH(TRIM(text))=0);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.3.cusp.sign.leo', '', 'ru-RU', 'Куспид 3-го дома в «Лев»: стиль темы 3-го дома через качества «Лев».', 86, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.3.cusp.sign.leo' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Куспид 3-го дома в «Дева»: стиль темы 3-го дома через качества «Дева».', priority = 86, is_active = 1, meta_json = '{}'
WHERE key = 'natal.house.3.cusp.sign.virgo' AND locale = 'ru-RU'
  AND (topic_category = '' OR topic_category IS NULL)
  AND (text IS NULL OR LENGTH(TRIM(text))=0);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.3.cusp.sign.virgo', '', 'ru-RU', 'Куспид 3-го дома в «Дева»: стиль темы 3-го дома через качества «Дева».', 86, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.3.cusp.sign.virgo' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Куспид 3-го дома в «Весы»: стиль темы 3-го дома через качества «Весы».', priority = 86, is_active = 1, meta_json = '{}'
WHERE key = 'natal.house.3.cusp.sign.libra' AND locale = 'ru-RU'
  AND (topic_category = '' OR topic_category IS NULL)
  AND (text IS NULL OR LENGTH(TRIM(text))=0);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.3.cusp.sign.libra', '', 'ru-RU', 'Куспид 3-го дома в «Весы»: стиль темы 3-го дома через качества «Весы».', 86, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.3.cusp.sign.libra' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Куспид 3-го дома в «Скорпион»: стиль темы 3-го дома через качества «Скорпион».', priority = 86, is_active = 1, meta_json = '{}'
WHERE key = 'natal.house.3.cusp.sign.scorpio' AND locale = 'ru-RU'
  AND (topic_category = '' OR topic_category IS NULL)
  AND (text IS NULL OR LENGTH(TRIM(text))=0);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.3.cusp.sign.scorpio', '', 'ru-RU', 'Куспид 3-го дома в «Скорпион»: стиль темы 3-го дома через качества «Скорпион».', 86, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.3.cusp.sign.scorpio' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Куспид 3-го дома в «Стрелец»: стиль темы 3-го дома через качества «Стрелец».', priority = 86, is_active = 1, meta_json = '{}'
WHERE key = 'natal.house.3.cusp.sign.sagittarius' AND locale = 'ru-RU'
  AND (topic_category = '' OR topic_category IS NULL)
  AND (text IS NULL OR LENGTH(TRIM(text))=0);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.3.cusp.sign.sagittarius', '', 'ru-RU', 'Куспид 3-го дома в «Стрелец»: стиль темы 3-го дома через качества «Стрелец».', 86, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.3.cusp.sign.sagittarius' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Куспид 3-го дома в «Козерог»: стиль темы 3-го дома через качества «Козерог».', priority = 86, is_active = 1, meta_json = '{}'
WHERE key = 'natal.house.3.cusp.sign.capricorn' AND locale = 'ru-RU'
  AND (topic_category = '' OR topic_category IS NULL)
  AND (text IS NULL OR LENGTH(TRIM(text))=0);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.3.cusp.sign.capricorn', '', 'ru-RU', 'Куспид 3-го дома в «Козерог»: стиль темы 3-го дома через качества «Козерог».', 86, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.3.cusp.sign.capricorn' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Куспид 3-го дома в «Водолей»: стиль темы 3-го дома через качества «Водолей».', priority = 86, is_active = 1, meta_json = '{}'
WHERE key = 'natal.house.3.cusp.sign.aquarius' AND locale = 'ru-RU'
  AND (topic_category = '' OR topic_category IS NULL)
  AND (text IS NULL OR LENGTH(TRIM(text))=0);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.3.cusp.sign.aquarius', '', 'ru-RU', 'Куспид 3-го дома в «Водолей»: стиль темы 3-го дома через качества «Водолей».', 86, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.3.cusp.sign.aquarius' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Куспид 3-го дома в «Рыбы»: стиль темы 3-го дома через качества «Рыбы».', priority = 86, is_active = 1, meta_json = '{}'
WHERE key = 'natal.house.3.cusp.sign.pisces' AND locale = 'ru-RU'
  AND (topic_category = '' OR topic_category IS NULL)
  AND (text IS NULL OR LENGTH(TRIM(text))=0);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.3.cusp.sign.pisces', '', 'ru-RU', 'Куспид 3-го дома в «Рыбы»: стиль темы 3-го дома через качества «Рыбы».', 86, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.3.cusp.sign.pisces' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Куспид 4-го дома в знаке: задаёт тон и стиль проявления темы 4-го дома.', priority = 85, is_active = 1, meta_json = '{}'
WHERE key = 'natal.house.4.cusp.sign.any' AND locale = 'ru-RU'
  AND (topic_category = '' OR topic_category IS NULL)
  AND (text IS NULL OR LENGTH(TRIM(text))=0);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.4.cusp.sign.any', '', 'ru-RU', 'Куспид 4-го дома в знаке: задаёт тон и стиль проявления темы 4-го дома.', 85, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.4.cusp.sign.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Куспид 4-го дома в «Овен»: стиль темы 4-го дома через качества «Овен».', priority = 86, is_active = 1, meta_json = '{}'
WHERE key = 'natal.house.4.cusp.sign.aries' AND locale = 'ru-RU'
  AND (topic_category = '' OR topic_category IS NULL)
  AND (text IS NULL OR LENGTH(TRIM(text))=0);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.4.cusp.sign.aries', '', 'ru-RU', 'Куспид 4-го дома в «Овен»: стиль темы 4-го дома через качества «Овен».', 86, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.4.cusp.sign.aries' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Куспид 4-го дома в «Телец»: стиль темы 4-го дома через качества «Телец».', priority = 86, is_active = 1, meta_json = '{}'
WHERE key = 'natal.house.4.cusp.sign.taurus' AND locale = 'ru-RU'
  AND (topic_category = '' OR topic_category IS NULL)
  AND (text IS NULL OR LENGTH(TRIM(text))=0);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.4.cusp.sign.taurus', '', 'ru-RU', 'Куспид 4-го дома в «Телец»: стиль темы 4-го дома через качества «Телец».', 86, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.4.cusp.sign.taurus' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Куспид 4-го дома в «Близнецы»: стиль темы 4-го дома через качества «Близнецы».', priority = 86, is_active = 1, meta_json = '{}'
WHERE key = 'natal.house.4.cusp.sign.gemini' AND locale = 'ru-RU'
  AND (topic_category = '' OR topic_category IS NULL)
  AND (text IS NULL OR LENGTH(TRIM(text))=0);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.4.cusp.sign.gemini', '', 'ru-RU', 'Куспид 4-го дома в «Близнецы»: стиль темы 4-го дома через качества «Близнецы».', 86, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.4.cusp.sign.gemini' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Куспид 4-го дома в «Рак»: стиль темы 4-го дома через качества «Рак».', priority = 86, is_active = 1, meta_json = '{}'
WHERE key = 'natal.house.4.cusp.sign.cancer' AND locale = 'ru-RU'
  AND (topic_category = '' OR topic_category IS NULL)
  AND (text IS NULL OR LENGTH(TRIM(text))=0);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.4.cusp.sign.cancer', '', 'ru-RU', 'Куспид 4-го дома в «Рак»: стиль темы 4-го дома через качества «Рак».', 86, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.4.cusp.sign.cancer' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Куспид 4-го дома в «Лев»: стиль темы 4-го дома через качества «Лев».', priority = 86, is_active = 1, meta_json = '{}'
WHERE key = 'natal.house.4.cusp.sign.leo' AND locale = 'ru-RU'
  AND (topic_category = '' OR topic_category IS NULL)
  AND (text IS NULL OR LENGTH(TRIM(text))=0);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.4.cusp.sign.leo', '', 'ru-RU', 'Куспид 4-го дома в «Лев»: стиль темы 4-го дома через качества «Лев».', 86, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.4.cusp.sign.leo' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Куспид 4-го дома в «Дева»: стиль темы 4-го дома через качества «Дева».', priority = 86, is_active = 1, meta_json = '{}'
WHERE key = 'natal.house.4.cusp.sign.virgo' AND locale = 'ru-RU'
  AND (topic_category = '' OR topic_category IS NULL)
  AND (text IS NULL OR LENGTH(TRIM(text))=0);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.4.cusp.sign.virgo', '', 'ru-RU', 'Куспид 4-го дома в «Дева»: стиль темы 4-го дома через качества «Дева».', 86, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.4.cusp.sign.virgo' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Куспид 4-го дома в «Весы»: стиль темы 4-го дома через качества «Весы».', priority = 86, is_active = 1, meta_json = '{}'
WHERE key = 'natal.house.4.cusp.sign.libra' AND locale = 'ru-RU'
  AND (topic_category = '' OR topic_category IS NULL)
  AND (text IS NULL OR LENGTH(TRIM(text))=0);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.4.cusp.sign.libra', '', 'ru-RU', 'Куспид 4-го дома в «Весы»: стиль темы 4-го дома через качества «Весы».', 86, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.4.cusp.sign.libra' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Куспид 4-го дома в «Скорпион»: стиль темы 4-го дома через качества «Скорпион».', priority = 86, is_active = 1, meta_json = '{}'
WHERE key = 'natal.house.4.cusp.sign.scorpio' AND locale = 'ru-RU'
  AND (topic_category = '' OR topic_category IS NULL)
  AND (text IS NULL OR LENGTH(TRIM(text))=0);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.4.cusp.sign.scorpio', '', 'ru-RU', 'Куспид 4-го дома в «Скорпион»: стиль темы 4-го дома через качества «Скорпион».', 86, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.4.cusp.sign.scorpio' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Куспид 4-го дома в «Стрелец»: стиль темы 4-го дома через качества «Стрелец».', priority = 86, is_active = 1, meta_json = '{}'
WHERE key = 'natal.house.4.cusp.sign.sagittarius' AND locale = 'ru-RU'
  AND (topic_category = '' OR topic_category IS NULL)
  AND (text IS NULL OR LENGTH(TRIM(text))=0);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.4.cusp.sign.sagittarius', '', 'ru-RU', 'Куспид 4-го дома в «Стрелец»: стиль темы 4-го дома через качества «Стрелец».', 86, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.4.cusp.sign.sagittarius' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Куспид 4-го дома в «Козерог»: стиль темы 4-го дома через качества «Козерог».', priority = 86, is_active = 1, meta_json = '{}'
WHERE key = 'natal.house.4.cusp.sign.capricorn' AND locale = 'ru-RU'
  AND (topic_category = '' OR topic_category IS NULL)
  AND (text IS NULL OR LENGTH(TRIM(text))=0);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.4.cusp.sign.capricorn', '', 'ru-RU', 'Куспид 4-го дома в «Козерог»: стиль темы 4-го дома через качества «Козерог».', 86, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.4.cusp.sign.capricorn' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Куспид 4-го дома в «Водолей»: стиль темы 4-го дома через качества «Водолей».', priority = 86, is_active = 1, meta_json = '{}'
WHERE key = 'natal.house.4.cusp.sign.aquarius' AND locale = 'ru-RU'
  AND (topic_category = '' OR topic_category IS NULL)
  AND (text IS NULL OR LENGTH(TRIM(text))=0);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.4.cusp.sign.aquarius', '', 'ru-RU', 'Куспид 4-го дома в «Водолей»: стиль темы 4-го дома через качества «Водолей».', 86, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.4.cusp.sign.aquarius' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Куспид 4-го дома в «Рыбы»: стиль темы 4-го дома через качества «Рыбы».', priority = 86, is_active = 1, meta_json = '{}'
WHERE key = 'natal.house.4.cusp.sign.pisces' AND locale = 'ru-RU'
  AND (topic_category = '' OR topic_category IS NULL)
  AND (text IS NULL OR LENGTH(TRIM(text))=0);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.4.cusp.sign.pisces', '', 'ru-RU', 'Куспид 4-го дома в «Рыбы»: стиль темы 4-го дома через качества «Рыбы».', 86, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.4.cusp.sign.pisces' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Куспид 5-го дома в знаке: задаёт тон и стиль проявления темы 5-го дома.', priority = 85, is_active = 1, meta_json = '{}'
WHERE key = 'natal.house.5.cusp.sign.any' AND locale = 'ru-RU'
  AND (topic_category = '' OR topic_category IS NULL)
  AND (text IS NULL OR LENGTH(TRIM(text))=0);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.5.cusp.sign.any', '', 'ru-RU', 'Куспид 5-го дома в знаке: задаёт тон и стиль проявления темы 5-го дома.', 85, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.5.cusp.sign.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Куспид 5-го дома в «Овен»: стиль темы 5-го дома через качества «Овен».', priority = 86, is_active = 1, meta_json = '{}'
WHERE key = 'natal.house.5.cusp.sign.aries' AND locale = 'ru-RU'
  AND (topic_category = '' OR topic_category IS NULL)
  AND (text IS NULL OR LENGTH(TRIM(text))=0);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.5.cusp.sign.aries', '', 'ru-RU', 'Куспид 5-го дома в «Овен»: стиль темы 5-го дома через качества «Овен».', 86, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.5.cusp.sign.aries' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Куспид 5-го дома в «Телец»: стиль темы 5-го дома через качества «Телец».', priority = 86, is_active = 1, meta_json = '{}'
WHERE key = 'natal.house.5.cusp.sign.taurus' AND locale = 'ru-RU'
  AND (topic_category = '' OR topic_category IS NULL)
  AND (text IS NULL OR LENGTH(TRIM(text))=0);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.5.cusp.sign.taurus', '', 'ru-RU', 'Куспид 5-го дома в «Телец»: стиль темы 5-го дома через качества «Телец».', 86, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.5.cusp.sign.taurus' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Куспид 5-го дома в «Близнецы»: стиль темы 5-го дома через качества «Близнецы».', priority = 86, is_active = 1, meta_json = '{}'
WHERE key = 'natal.house.5.cusp.sign.gemini' AND locale = 'ru-RU'
  AND (topic_category = '' OR topic_category IS NULL)
  AND (text IS NULL OR LENGTH(TRIM(text))=0);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.5.cusp.sign.gemini', '', 'ru-RU', 'Куспид 5-го дома в «Близнецы»: стиль темы 5-го дома через качества «Близнецы».', 86, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.5.cusp.sign.gemini' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Куспид 5-го дома в «Рак»: стиль темы 5-го дома через качества «Рак».', priority = 86, is_active = 1, meta_json = '{}'
WHERE key = 'natal.house.5.cusp.sign.cancer' AND locale = 'ru-RU'
  AND (topic_category = '' OR topic_category IS NULL)
  AND (text IS NULL OR LENGTH(TRIM(text))=0);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.5.cusp.sign.cancer', '', 'ru-RU', 'Куспид 5-го дома в «Рак»: стиль темы 5-го дома через качества «Рак».', 86, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.5.cusp.sign.cancer' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Куспид 5-го дома в «Лев»: стиль темы 5-го дома через качества «Лев».', priority = 86, is_active = 1, meta_json = '{}'
WHERE key = 'natal.house.5.cusp.sign.leo' AND locale = 'ru-RU'
  AND (topic_category = '' OR topic_category IS NULL)
  AND (text IS NULL OR LENGTH(TRIM(text))=0);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.5.cusp.sign.leo', '', 'ru-RU', 'Куспид 5-го дома в «Лев»: стиль темы 5-го дома через качества «Лев».', 86, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.5.cusp.sign.leo' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Куспид 5-го дома в «Дева»: стиль темы 5-го дома через качества «Дева».', priority = 86, is_active = 1, meta_json = '{}'
WHERE key = 'natal.house.5.cusp.sign.virgo' AND locale = 'ru-RU'
  AND (topic_category = '' OR topic_category IS NULL)
  AND (text IS NULL OR LENGTH(TRIM(text))=0);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.5.cusp.sign.virgo', '', 'ru-RU', 'Куспид 5-го дома в «Дева»: стиль темы 5-го дома через качества «Дева».', 86, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.5.cusp.sign.virgo' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Куспид 5-го дома в «Весы»: стиль темы 5-го дома через качества «Весы».', priority = 86, is_active = 1, meta_json = '{}'
WHERE key = 'natal.house.5.cusp.sign.libra' AND locale = 'ru-RU'
  AND (topic_category = '' OR topic_category IS NULL)
  AND (text IS NULL OR LENGTH(TRIM(text))=0);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.5.cusp.sign.libra', '', 'ru-RU', 'Куспид 5-го дома в «Весы»: стиль темы 5-го дома через качества «Весы».', 86, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.5.cusp.sign.libra' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Куспид 5-го дома в «Скорпион»: стиль темы 5-го дома через качества «Скорпион».', priority = 86, is_active = 1, meta_json = '{}'
WHERE key = 'natal.house.5.cusp.sign.scorpio' AND locale = 'ru-RU'
  AND (topic_category = '' OR topic_category IS NULL)
  AND (text IS NULL OR LENGTH(TRIM(text))=0);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.5.cusp.sign.scorpio', '', 'ru-RU', 'Куспид 5-го дома в «Скорпион»: стиль темы 5-го дома через качества «Скорпион».', 86, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.5.cusp.sign.scorpio' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Куспид 5-го дома в «Стрелец»: стиль темы 5-го дома через качества «Стрелец».', priority = 86, is_active = 1, meta_json = '{}'
WHERE key = 'natal.house.5.cusp.sign.sagittarius' AND locale = 'ru-RU'
  AND (topic_category = '' OR topic_category IS NULL)
  AND (text IS NULL OR LENGTH(TRIM(text))=0);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.5.cusp.sign.sagittarius', '', 'ru-RU', 'Куспид 5-го дома в «Стрелец»: стиль темы 5-го дома через качества «Стрелец».', 86, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.5.cusp.sign.sagittarius' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Куспид 5-го дома в «Козерог»: стиль темы 5-го дома через качества «Козерог».', priority = 86, is_active = 1, meta_json = '{}'
WHERE key = 'natal.house.5.cusp.sign.capricorn' AND locale = 'ru-RU'
  AND (topic_category = '' OR topic_category IS NULL)
  AND (text IS NULL OR LENGTH(TRIM(text))=0);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.5.cusp.sign.capricorn', '', 'ru-RU', 'Куспид 5-го дома в «Козерог»: стиль темы 5-го дома через качества «Козерог».', 86, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.5.cusp.sign.capricorn' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Куспид 5-го дома в «Водолей»: стиль темы 5-го дома через качества «Водолей».', priority = 86, is_active = 1, meta_json = '{}'
WHERE key = 'natal.house.5.cusp.sign.aquarius' AND locale = 'ru-RU'
  AND (topic_category = '' OR topic_category IS NULL)
  AND (text IS NULL OR LENGTH(TRIM(text))=0);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.5.cusp.sign.aquarius', '', 'ru-RU', 'Куспид 5-го дома в «Водолей»: стиль темы 5-го дома через качества «Водолей».', 86, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.5.cusp.sign.aquarius' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Куспид 5-го дома в «Рыбы»: стиль темы 5-го дома через качества «Рыбы».', priority = 86, is_active = 1, meta_json = '{}'
WHERE key = 'natal.house.5.cusp.sign.pisces' AND locale = 'ru-RU'
  AND (topic_category = '' OR topic_category IS NULL)
  AND (text IS NULL OR LENGTH(TRIM(text))=0);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.5.cusp.sign.pisces', '', 'ru-RU', 'Куспид 5-го дома в «Рыбы»: стиль темы 5-го дома через качества «Рыбы».', 86, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.5.cusp.sign.pisces' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Куспид 6-го дома в знаке: задаёт тон и стиль проявления темы 6-го дома.', priority = 85, is_active = 1, meta_json = '{}'
WHERE key = 'natal.house.6.cusp.sign.any' AND locale = 'ru-RU'
  AND (topic_category = '' OR topic_category IS NULL)
  AND (text IS NULL OR LENGTH(TRIM(text))=0);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.6.cusp.sign.any', '', 'ru-RU', 'Куспид 6-го дома в знаке: задаёт тон и стиль проявления темы 6-го дома.', 85, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.6.cusp.sign.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Куспид 6-го дома в «Овен»: стиль темы 6-го дома через качества «Овен».', priority = 86, is_active = 1, meta_json = '{}'
WHERE key = 'natal.house.6.cusp.sign.aries' AND locale = 'ru-RU'
  AND (topic_category = '' OR topic_category IS NULL)
  AND (text IS NULL OR LENGTH(TRIM(text))=0);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.6.cusp.sign.aries', '', 'ru-RU', 'Куспид 6-го дома в «Овен»: стиль темы 6-го дома через качества «Овен».', 86, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.6.cusp.sign.aries' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Куспид 6-го дома в «Телец»: стиль темы 6-го дома через качества «Телец».', priority = 86, is_active = 1, meta_json = '{}'
WHERE key = 'natal.house.6.cusp.sign.taurus' AND locale = 'ru-RU'
  AND (topic_category = '' OR topic_category IS NULL)
  AND (text IS NULL OR LENGTH(TRIM(text))=0);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.6.cusp.sign.taurus', '', 'ru-RU', 'Куспид 6-го дома в «Телец»: стиль темы 6-го дома через качества «Телец».', 86, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.6.cusp.sign.taurus' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Куспид 6-го дома в «Близнецы»: стиль темы 6-го дома через качества «Близнецы».', priority = 86, is_active = 1, meta_json = '{}'
WHERE key = 'natal.house.6.cusp.sign.gemini' AND locale = 'ru-RU'
  AND (topic_category = '' OR topic_category IS NULL)
  AND (text IS NULL OR LENGTH(TRIM(text))=0);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.6.cusp.sign.gemini', '', 'ru-RU', 'Куспид 6-го дома в «Близнецы»: стиль темы 6-го дома через качества «Близнецы».', 86, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.6.cusp.sign.gemini' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Куспид 6-го дома в «Рак»: стиль темы 6-го дома через качества «Рак».', priority = 86, is_active = 1, meta_json = '{}'
WHERE key = 'natal.house.6.cusp.sign.cancer' AND locale = 'ru-RU'
  AND (topic_category = '' OR topic_category IS NULL)
  AND (text IS NULL OR LENGTH(TRIM(text))=0);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.6.cusp.sign.cancer', '', 'ru-RU', 'Куспид 6-го дома в «Рак»: стиль темы 6-го дома через качества «Рак».', 86, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.6.cusp.sign.cancer' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Куспид 6-го дома в «Лев»: стиль темы 6-го дома через качества «Лев».', priority = 86, is_active = 1, meta_json = '{}'
WHERE key = 'natal.house.6.cusp.sign.leo' AND locale = 'ru-RU'
  AND (topic_category = '' OR topic_category IS NULL)
  AND (text IS NULL OR LENGTH(TRIM(text))=0);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.6.cusp.sign.leo', '', 'ru-RU', 'Куспид 6-го дома в «Лев»: стиль темы 6-го дома через качества «Лев».', 86, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.6.cusp.sign.leo' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Куспид 6-го дома в «Дева»: стиль темы 6-го дома через качества «Дева».', priority = 86, is_active = 1, meta_json = '{}'
WHERE key = 'natal.house.6.cusp.sign.virgo' AND locale = 'ru-RU'
  AND (topic_category = '' OR topic_category IS NULL)
  AND (text IS NULL OR LENGTH(TRIM(text))=0);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.6.cusp.sign.virgo', '', 'ru-RU', 'Куспид 6-го дома в «Дева»: стиль темы 6-го дома через качества «Дева».', 86, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.6.cusp.sign.virgo' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Куспид 6-го дома в «Весы»: стиль темы 6-го дома через качества «Весы».', priority = 86, is_active = 1, meta_json = '{}'
WHERE key = 'natal.house.6.cusp.sign.libra' AND locale = 'ru-RU'
  AND (topic_category = '' OR topic_category IS NULL)
  AND (text IS NULL OR LENGTH(TRIM(text))=0);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.6.cusp.sign.libra', '', 'ru-RU', 'Куспид 6-го дома в «Весы»: стиль темы 6-го дома через качества «Весы».', 86, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.6.cusp.sign.libra' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Куспид 6-го дома в «Скорпион»: стиль темы 6-го дома через качества «Скорпион».', priority = 86, is_active = 1, meta_json = '{}'
WHERE key = 'natal.house.6.cusp.sign.scorpio' AND locale = 'ru-RU'
  AND (topic_category = '' OR topic_category IS NULL)
  AND (text IS NULL OR LENGTH(TRIM(text))=0);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.6.cusp.sign.scorpio', '', 'ru-RU', 'Куспид 6-го дома в «Скорпион»: стиль темы 6-го дома через качества «Скорпион».', 86, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.6.cusp.sign.scorpio' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Куспид 6-го дома в «Стрелец»: стиль темы 6-го дома через качества «Стрелец».', priority = 86, is_active = 1, meta_json = '{}'
WHERE key = 'natal.house.6.cusp.sign.sagittarius' AND locale = 'ru-RU'
  AND (topic_category = '' OR topic_category IS NULL)
  AND (text IS NULL OR LENGTH(TRIM(text))=0);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.6.cusp.sign.sagittarius', '', 'ru-RU', 'Куспид 6-го дома в «Стрелец»: стиль темы 6-го дома через качества «Стрелец».', 86, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.6.cusp.sign.sagittarius' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Куспид 6-го дома в «Козерог»: стиль темы 6-го дома через качества «Козерог».', priority = 86, is_active = 1, meta_json = '{}'
WHERE key = 'natal.house.6.cusp.sign.capricorn' AND locale = 'ru-RU'
  AND (topic_category = '' OR topic_category IS NULL)
  AND (text IS NULL OR LENGTH(TRIM(text))=0);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.6.cusp.sign.capricorn', '', 'ru-RU', 'Куспид 6-го дома в «Козерог»: стиль темы 6-го дома через качества «Козерог».', 86, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.6.cusp.sign.capricorn' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Куспид 6-го дома в «Водолей»: стиль темы 6-го дома через качества «Водолей».', priority = 86, is_active = 1, meta_json = '{}'
WHERE key = 'natal.house.6.cusp.sign.aquarius' AND locale = 'ru-RU'
  AND (topic_category = '' OR topic_category IS NULL)
  AND (text IS NULL OR LENGTH(TRIM(text))=0);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.6.cusp.sign.aquarius', '', 'ru-RU', 'Куспид 6-го дома в «Водолей»: стиль темы 6-го дома через качества «Водолей».', 86, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.6.cusp.sign.aquarius' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Куспид 6-го дома в «Рыбы»: стиль темы 6-го дома через качества «Рыбы».', priority = 86, is_active = 1, meta_json = '{}'
WHERE key = 'natal.house.6.cusp.sign.pisces' AND locale = 'ru-RU'
  AND (topic_category = '' OR topic_category IS NULL)
  AND (text IS NULL OR LENGTH(TRIM(text))=0);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.6.cusp.sign.pisces', '', 'ru-RU', 'Куспид 6-го дома в «Рыбы»: стиль темы 6-го дома через качества «Рыбы».', 86, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.6.cusp.sign.pisces' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Куспид 7-го дома в знаке: задаёт тон и стиль проявления темы 7-го дома.', priority = 85, is_active = 1, meta_json = '{}'
WHERE key = 'natal.house.7.cusp.sign.any' AND locale = 'ru-RU'
  AND (topic_category = '' OR topic_category IS NULL)
  AND (text IS NULL OR LENGTH(TRIM(text))=0);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.7.cusp.sign.any', '', 'ru-RU', 'Куспид 7-го дома в знаке: задаёт тон и стиль проявления темы 7-го дома.', 85, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.7.cusp.sign.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Куспид 7-го дома в «Овен»: стиль темы 7-го дома через качества «Овен».', priority = 86, is_active = 1, meta_json = '{}'
WHERE key = 'natal.house.7.cusp.sign.aries' AND locale = 'ru-RU'
  AND (topic_category = '' OR topic_category IS NULL)
  AND (text IS NULL OR LENGTH(TRIM(text))=0);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.7.cusp.sign.aries', '', 'ru-RU', 'Куспид 7-го дома в «Овен»: стиль темы 7-го дома через качества «Овен».', 86, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.7.cusp.sign.aries' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Куспид 7-го дома в «Телец»: стиль темы 7-го дома через качества «Телец».', priority = 86, is_active = 1, meta_json = '{}'
WHERE key = 'natal.house.7.cusp.sign.taurus' AND locale = 'ru-RU'
  AND (topic_category = '' OR topic_category IS NULL)
  AND (text IS NULL OR LENGTH(TRIM(text))=0);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.7.cusp.sign.taurus', '', 'ru-RU', 'Куспид 7-го дома в «Телец»: стиль темы 7-го дома через качества «Телец».', 86, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.7.cusp.sign.taurus' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Куспид 7-го дома в «Близнецы»: стиль темы 7-го дома через качества «Близнецы».', priority = 86, is_active = 1, meta_json = '{}'
WHERE key = 'natal.house.7.cusp.sign.gemini' AND locale = 'ru-RU'
  AND (topic_category = '' OR topic_category IS NULL)
  AND (text IS NULL OR LENGTH(TRIM(text))=0);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.7.cusp.sign.gemini', '', 'ru-RU', 'Куспид 7-го дома в «Близнецы»: стиль темы 7-го дома через качества «Близнецы».', 86, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.7.cusp.sign.gemini' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Куспид 7-го дома в «Рак»: стиль темы 7-го дома через качества «Рак».', priority = 86, is_active = 1, meta_json = '{}'
WHERE key = 'natal.house.7.cusp.sign.cancer' AND locale = 'ru-RU'
  AND (topic_category = '' OR topic_category IS NULL)
  AND (text IS NULL OR LENGTH(TRIM(text))=0);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.7.cusp.sign.cancer', '', 'ru-RU', 'Куспид 7-го дома в «Рак»: стиль темы 7-го дома через качества «Рак».', 86, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.7.cusp.sign.cancer' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Куспид 7-го дома в «Лев»: стиль темы 7-го дома через качества «Лев».', priority = 86, is_active = 1, meta_json = '{}'
WHERE key = 'natal.house.7.cusp.sign.leo' AND locale = 'ru-RU'
  AND (topic_category = '' OR topic_category IS NULL)
  AND (text IS NULL OR LENGTH(TRIM(text))=0);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.7.cusp.sign.leo', '', 'ru-RU', 'Куспид 7-го дома в «Лев»: стиль темы 7-го дома через качества «Лев».', 86, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.7.cusp.sign.leo' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Куспид 7-го дома в «Дева»: стиль темы 7-го дома через качества «Дева».', priority = 86, is_active = 1, meta_json = '{}'
WHERE key = 'natal.house.7.cusp.sign.virgo' AND locale = 'ru-RU'
  AND (topic_category = '' OR topic_category IS NULL)
  AND (text IS NULL OR LENGTH(TRIM(text))=0);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.7.cusp.sign.virgo', '', 'ru-RU', 'Куспид 7-го дома в «Дева»: стиль темы 7-го дома через качества «Дева».', 86, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.7.cusp.sign.virgo' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Куспид 7-го дома в «Весы»: стиль темы 7-го дома через качества «Весы».', priority = 86, is_active = 1, meta_json = '{}'
WHERE key = 'natal.house.7.cusp.sign.libra' AND locale = 'ru-RU'
  AND (topic_category = '' OR topic_category IS NULL)
  AND (text IS NULL OR LENGTH(TRIM(text))=0);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.7.cusp.sign.libra', '', 'ru-RU', 'Куспид 7-го дома в «Весы»: стиль темы 7-го дома через качества «Весы».', 86, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.7.cusp.sign.libra' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Куспид 7-го дома в «Скорпион»: стиль темы 7-го дома через качества «Скорпион».', priority = 86, is_active = 1, meta_json = '{}'
WHERE key = 'natal.house.7.cusp.sign.scorpio' AND locale = 'ru-RU'
  AND (topic_category = '' OR topic_category IS NULL)
  AND (text IS NULL OR LENGTH(TRIM(text))=0);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.7.cusp.sign.scorpio', '', 'ru-RU', 'Куспид 7-го дома в «Скорпион»: стиль темы 7-го дома через качества «Скорпион».', 86, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.7.cusp.sign.scorpio' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Куспид 7-го дома в «Стрелец»: стиль темы 7-го дома через качества «Стрелец».', priority = 86, is_active = 1, meta_json = '{}'
WHERE key = 'natal.house.7.cusp.sign.sagittarius' AND locale = 'ru-RU'
  AND (topic_category = '' OR topic_category IS NULL)
  AND (text IS NULL OR LENGTH(TRIM(text))=0);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.7.cusp.sign.sagittarius', '', 'ru-RU', 'Куспид 7-го дома в «Стрелец»: стиль темы 7-го дома через качества «Стрелец».', 86, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.7.cusp.sign.sagittarius' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Куспид 7-го дома в «Козерог»: стиль темы 7-го дома через качества «Козерог».', priority = 86, is_active = 1, meta_json = '{}'
WHERE key = 'natal.house.7.cusp.sign.capricorn' AND locale = 'ru-RU'
  AND (topic_category = '' OR topic_category IS NULL)
  AND (text IS NULL OR LENGTH(TRIM(text))=0);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.7.cusp.sign.capricorn', '', 'ru-RU', 'Куспид 7-го дома в «Козерог»: стиль темы 7-го дома через качества «Козерог».', 86, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.7.cusp.sign.capricorn' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Куспид 7-го дома в «Водолей»: стиль темы 7-го дома через качества «Водолей».', priority = 86, is_active = 1, meta_json = '{}'
WHERE key = 'natal.house.7.cusp.sign.aquarius' AND locale = 'ru-RU'
  AND (topic_category = '' OR topic_category IS NULL)
  AND (text IS NULL OR LENGTH(TRIM(text))=0);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.7.cusp.sign.aquarius', '', 'ru-RU', 'Куспид 7-го дома в «Водолей»: стиль темы 7-го дома через качества «Водолей».', 86, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.7.cusp.sign.aquarius' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Куспид 7-го дома в «Рыбы»: стиль темы 7-го дома через качества «Рыбы».', priority = 86, is_active = 1, meta_json = '{}'
WHERE key = 'natal.house.7.cusp.sign.pisces' AND locale = 'ru-RU'
  AND (topic_category = '' OR topic_category IS NULL)
  AND (text IS NULL OR LENGTH(TRIM(text))=0);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.7.cusp.sign.pisces', '', 'ru-RU', 'Куспид 7-го дома в «Рыбы»: стиль темы 7-го дома через качества «Рыбы».', 86, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.7.cusp.sign.pisces' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Куспид 8-го дома в знаке: задаёт тон и стиль проявления темы 8-го дома.', priority = 85, is_active = 1, meta_json = '{}'
WHERE key = 'natal.house.8.cusp.sign.any' AND locale = 'ru-RU'
  AND (topic_category = '' OR topic_category IS NULL)
  AND (text IS NULL OR LENGTH(TRIM(text))=0);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.8.cusp.sign.any', '', 'ru-RU', 'Куспид 8-го дома в знаке: задаёт тон и стиль проявления темы 8-го дома.', 85, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.8.cusp.sign.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Куспид 8-го дома в «Овен»: стиль темы 8-го дома через качества «Овен».', priority = 86, is_active = 1, meta_json = '{}'
WHERE key = 'natal.house.8.cusp.sign.aries' AND locale = 'ru-RU'
  AND (topic_category = '' OR topic_category IS NULL)
  AND (text IS NULL OR LENGTH(TRIM(text))=0);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.8.cusp.sign.aries', '', 'ru-RU', 'Куспид 8-го дома в «Овен»: стиль темы 8-го дома через качества «Овен».', 86, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.8.cusp.sign.aries' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Куспид 8-го дома в «Телец»: стиль темы 8-го дома через качества «Телец».', priority = 86, is_active = 1, meta_json = '{}'
WHERE key = 'natal.house.8.cusp.sign.taurus' AND locale = 'ru-RU'
  AND (topic_category = '' OR topic_category IS NULL)
  AND (text IS NULL OR LENGTH(TRIM(text))=0);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.8.cusp.sign.taurus', '', 'ru-RU', 'Куспид 8-го дома в «Телец»: стиль темы 8-го дома через качества «Телец».', 86, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.8.cusp.sign.taurus' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Куспид 8-го дома в «Близнецы»: стиль темы 8-го дома через качества «Близнецы».', priority = 86, is_active = 1, meta_json = '{}'
WHERE key = 'natal.house.8.cusp.sign.gemini' AND locale = 'ru-RU'
  AND (topic_category = '' OR topic_category IS NULL)
  AND (text IS NULL OR LENGTH(TRIM(text))=0);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.8.cusp.sign.gemini', '', 'ru-RU', 'Куспид 8-го дома в «Близнецы»: стиль темы 8-го дома через качества «Близнецы».', 86, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.8.cusp.sign.gemini' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Куспид 8-го дома в «Рак»: стиль темы 8-го дома через качества «Рак».', priority = 86, is_active = 1, meta_json = '{}'
WHERE key = 'natal.house.8.cusp.sign.cancer' AND locale = 'ru-RU'
  AND (topic_category = '' OR topic_category IS NULL)
  AND (text IS NULL OR LENGTH(TRIM(text))=0);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.8.cusp.sign.cancer', '', 'ru-RU', 'Куспид 8-го дома в «Рак»: стиль темы 8-го дома через качества «Рак».', 86, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.8.cusp.sign.cancer' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Куспид 8-го дома в «Лев»: стиль темы 8-го дома через качества «Лев».', priority = 86, is_active = 1, meta_json = '{}'
WHERE key = 'natal.house.8.cusp.sign.leo' AND locale = 'ru-RU'
  AND (topic_category = '' OR topic_category IS NULL)
  AND (text IS NULL OR LENGTH(TRIM(text))=0);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.8.cusp.sign.leo', '', 'ru-RU', 'Куспид 8-го дома в «Лев»: стиль темы 8-го дома через качества «Лев».', 86, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.8.cusp.sign.leo' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Куспид 8-го дома в «Дева»: стиль темы 8-го дома через качества «Дева».', priority = 86, is_active = 1, meta_json = '{}'
WHERE key = 'natal.house.8.cusp.sign.virgo' AND locale = 'ru-RU'
  AND (topic_category = '' OR topic_category IS NULL)
  AND (text IS NULL OR LENGTH(TRIM(text))=0);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.8.cusp.sign.virgo', '', 'ru-RU', 'Куспид 8-го дома в «Дева»: стиль темы 8-го дома через качества «Дева».', 86, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.8.cusp.sign.virgo' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Куспид 8-го дома в «Весы»: стиль темы 8-го дома через качества «Весы».', priority = 86, is_active = 1, meta_json = '{}'
WHERE key = 'natal.house.8.cusp.sign.libra' AND locale = 'ru-RU'
  AND (topic_category = '' OR topic_category IS NULL)
  AND (text IS NULL OR LENGTH(TRIM(text))=0);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.8.cusp.sign.libra', '', 'ru-RU', 'Куспид 8-го дома в «Весы»: стиль темы 8-го дома через качества «Весы».', 86, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.8.cusp.sign.libra' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Куспид 8-го дома в «Скорпион»: стиль темы 8-го дома через качества «Скорпион».', priority = 86, is_active = 1, meta_json = '{}'
WHERE key = 'natal.house.8.cusp.sign.scorpio' AND locale = 'ru-RU'
  AND (topic_category = '' OR topic_category IS NULL)
  AND (text IS NULL OR LENGTH(TRIM(text))=0);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.8.cusp.sign.scorpio', '', 'ru-RU', 'Куспид 8-го дома в «Скорпион»: стиль темы 8-го дома через качества «Скорпион».', 86, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.8.cusp.sign.scorpio' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Куспид 8-го дома в «Стрелец»: стиль темы 8-го дома через качества «Стрелец».', priority = 86, is_active = 1, meta_json = '{}'
WHERE key = 'natal.house.8.cusp.sign.sagittarius' AND locale = 'ru-RU'
  AND (topic_category = '' OR topic_category IS NULL)
  AND (text IS NULL OR LENGTH(TRIM(text))=0);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.8.cusp.sign.sagittarius', '', 'ru-RU', 'Куспид 8-го дома в «Стрелец»: стиль темы 8-го дома через качества «Стрелец».', 86, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.8.cusp.sign.sagittarius' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Куспид 8-го дома в «Козерог»: стиль темы 8-го дома через качества «Козерог».', priority = 86, is_active = 1, meta_json = '{}'
WHERE key = 'natal.house.8.cusp.sign.capricorn' AND locale = 'ru-RU'
  AND (topic_category = '' OR topic_category IS NULL)
  AND (text IS NULL OR LENGTH(TRIM(text))=0);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.8.cusp.sign.capricorn', '', 'ru-RU', 'Куспид 8-го дома в «Козерог»: стиль темы 8-го дома через качества «Козерог».', 86, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.8.cusp.sign.capricorn' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Куспид 8-го дома в «Водолей»: стиль темы 8-го дома через качества «Водолей».', priority = 86, is_active = 1, meta_json = '{}'
WHERE key = 'natal.house.8.cusp.sign.aquarius' AND locale = 'ru-RU'
  AND (topic_category = '' OR topic_category IS NULL)
  AND (text IS NULL OR LENGTH(TRIM(text))=0);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.8.cusp.sign.aquarius', '', 'ru-RU', 'Куспид 8-го дома в «Водолей»: стиль темы 8-го дома через качества «Водолей».', 86, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.8.cusp.sign.aquarius' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Куспид 8-го дома в «Рыбы»: стиль темы 8-го дома через качества «Рыбы».', priority = 86, is_active = 1, meta_json = '{}'
WHERE key = 'natal.house.8.cusp.sign.pisces' AND locale = 'ru-RU'
  AND (topic_category = '' OR topic_category IS NULL)
  AND (text IS NULL OR LENGTH(TRIM(text))=0);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.8.cusp.sign.pisces', '', 'ru-RU', 'Куспид 8-го дома в «Рыбы»: стиль темы 8-го дома через качества «Рыбы».', 86, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.8.cusp.sign.pisces' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Куспид 9-го дома в знаке: задаёт тон и стиль проявления темы 9-го дома.', priority = 85, is_active = 1, meta_json = '{}'
WHERE key = 'natal.house.9.cusp.sign.any' AND locale = 'ru-RU'
  AND (topic_category = '' OR topic_category IS NULL)
  AND (text IS NULL OR LENGTH(TRIM(text))=0);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.9.cusp.sign.any', '', 'ru-RU', 'Куспид 9-го дома в знаке: задаёт тон и стиль проявления темы 9-го дома.', 85, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.9.cusp.sign.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Куспид 9-го дома в «Овен»: стиль темы 9-го дома через качества «Овен».', priority = 86, is_active = 1, meta_json = '{}'
WHERE key = 'natal.house.9.cusp.sign.aries' AND locale = 'ru-RU'
  AND (topic_category = '' OR topic_category IS NULL)
  AND (text IS NULL OR LENGTH(TRIM(text))=0);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.9.cusp.sign.aries', '', 'ru-RU', 'Куспид 9-го дома в «Овен»: стиль темы 9-го дома через качества «Овен».', 86, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.9.cusp.sign.aries' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Куспид 9-го дома в «Телец»: стиль темы 9-го дома через качества «Телец».', priority = 86, is_active = 1, meta_json = '{}'
WHERE key = 'natal.house.9.cusp.sign.taurus' AND locale = 'ru-RU'
  AND (topic_category = '' OR topic_category IS NULL)
  AND (text IS NULL OR LENGTH(TRIM(text))=0);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.9.cusp.sign.taurus', '', 'ru-RU', 'Куспид 9-го дома в «Телец»: стиль темы 9-го дома через качества «Телец».', 86, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.9.cusp.sign.taurus' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Куспид 9-го дома в «Близнецы»: стиль темы 9-го дома через качества «Близнецы».', priority = 86, is_active = 1, meta_json = '{}'
WHERE key = 'natal.house.9.cusp.sign.gemini' AND locale = 'ru-RU'
  AND (topic_category = '' OR topic_category IS NULL)
  AND (text IS NULL OR LENGTH(TRIM(text))=0);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.9.cusp.sign.gemini', '', 'ru-RU', 'Куспид 9-го дома в «Близнецы»: стиль темы 9-го дома через качества «Близнецы».', 86, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.9.cusp.sign.gemini' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Куспид 9-го дома в «Рак»: стиль темы 9-го дома через качества «Рак».', priority = 86, is_active = 1, meta_json = '{}'
WHERE key = 'natal.house.9.cusp.sign.cancer' AND locale = 'ru-RU'
  AND (topic_category = '' OR topic_category IS NULL)
  AND (text IS NULL OR LENGTH(TRIM(text))=0);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.9.cusp.sign.cancer', '', 'ru-RU', 'Куспид 9-го дома в «Рак»: стиль темы 9-го дома через качества «Рак».', 86, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.9.cusp.sign.cancer' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Куспид 9-го дома в «Лев»: стиль темы 9-го дома через качества «Лев».', priority = 86, is_active = 1, meta_json = '{}'
WHERE key = 'natal.house.9.cusp.sign.leo' AND locale = 'ru-RU'
  AND (topic_category = '' OR topic_category IS NULL)
  AND (text IS NULL OR LENGTH(TRIM(text))=0);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.9.cusp.sign.leo', '', 'ru-RU', 'Куспид 9-го дома в «Лев»: стиль темы 9-го дома через качества «Лев».', 86, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.9.cusp.sign.leo' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Куспид 9-го дома в «Дева»: стиль темы 9-го дома через качества «Дева».', priority = 86, is_active = 1, meta_json = '{}'
WHERE key = 'natal.house.9.cusp.sign.virgo' AND locale = 'ru-RU'
  AND (topic_category = '' OR topic_category IS NULL)
  AND (text IS NULL OR LENGTH(TRIM(text))=0);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.9.cusp.sign.virgo', '', 'ru-RU', 'Куспид 9-го дома в «Дева»: стиль темы 9-го дома через качества «Дева».', 86, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.9.cusp.sign.virgo' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Куспид 9-го дома в «Весы»: стиль темы 9-го дома через качества «Весы».', priority = 86, is_active = 1, meta_json = '{}'
WHERE key = 'natal.house.9.cusp.sign.libra' AND locale = 'ru-RU'
  AND (topic_category = '' OR topic_category IS NULL)
  AND (text IS NULL OR LENGTH(TRIM(text))=0);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.9.cusp.sign.libra', '', 'ru-RU', 'Куспид 9-го дома в «Весы»: стиль темы 9-го дома через качества «Весы».', 86, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.9.cusp.sign.libra' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Куспид 9-го дома в «Скорпион»: стиль темы 9-го дома через качества «Скорпион».', priority = 86, is_active = 1, meta_json = '{}'
WHERE key = 'natal.house.9.cusp.sign.scorpio' AND locale = 'ru-RU'
  AND (topic_category = '' OR topic_category IS NULL)
  AND (text IS NULL OR LENGTH(TRIM(text))=0);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.9.cusp.sign.scorpio', '', 'ru-RU', 'Куспид 9-го дома в «Скорпион»: стиль темы 9-го дома через качества «Скорпион».', 86, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.9.cusp.sign.scorpio' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Куспид 9-го дома в «Стрелец»: стиль темы 9-го дома через качества «Стрелец».', priority = 86, is_active = 1, meta_json = '{}'
WHERE key = 'natal.house.9.cusp.sign.sagittarius' AND locale = 'ru-RU'
  AND (topic_category = '' OR topic_category IS NULL)
  AND (text IS NULL OR LENGTH(TRIM(text))=0);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.9.cusp.sign.sagittarius', '', 'ru-RU', 'Куспид 9-го дома в «Стрелец»: стиль темы 9-го дома через качества «Стрелец».', 86, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.9.cusp.sign.sagittarius' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Куспид 9-го дома в «Козерог»: стиль темы 9-го дома через качества «Козерог».', priority = 86, is_active = 1, meta_json = '{}'
WHERE key = 'natal.house.9.cusp.sign.capricorn' AND locale = 'ru-RU'
  AND (topic_category = '' OR topic_category IS NULL)
  AND (text IS NULL OR LENGTH(TRIM(text))=0);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.9.cusp.sign.capricorn', '', 'ru-RU', 'Куспид 9-го дома в «Козерог»: стиль темы 9-го дома через качества «Козерог».', 86, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.9.cusp.sign.capricorn' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Куспид 9-го дома в «Водолей»: стиль темы 9-го дома через качества «Водолей».', priority = 86, is_active = 1, meta_json = '{}'
WHERE key = 'natal.house.9.cusp.sign.aquarius' AND locale = 'ru-RU'
  AND (topic_category = '' OR topic_category IS NULL)
  AND (text IS NULL OR LENGTH(TRIM(text))=0);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.9.cusp.sign.aquarius', '', 'ru-RU', 'Куспид 9-го дома в «Водолей»: стиль темы 9-го дома через качества «Водолей».', 86, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.9.cusp.sign.aquarius' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Куспид 9-го дома в «Рыбы»: стиль темы 9-го дома через качества «Рыбы».', priority = 86, is_active = 1, meta_json = '{}'
WHERE key = 'natal.house.9.cusp.sign.pisces' AND locale = 'ru-RU'
  AND (topic_category = '' OR topic_category IS NULL)
  AND (text IS NULL OR LENGTH(TRIM(text))=0);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.9.cusp.sign.pisces', '', 'ru-RU', 'Куспид 9-го дома в «Рыбы»: стиль темы 9-го дома через качества «Рыбы».', 86, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.9.cusp.sign.pisces' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Куспид 10-го дома в знаке: задаёт тон и стиль проявления темы 10-го дома.', priority = 85, is_active = 1, meta_json = '{}'
WHERE key = 'natal.house.10.cusp.sign.any' AND locale = 'ru-RU'
  AND (topic_category = '' OR topic_category IS NULL)
  AND (text IS NULL OR LENGTH(TRIM(text))=0);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.10.cusp.sign.any', '', 'ru-RU', 'Куспид 10-го дома в знаке: задаёт тон и стиль проявления темы 10-го дома.', 85, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.10.cusp.sign.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Куспид 10-го дома в «Овен»: стиль темы 10-го дома через качества «Овен».', priority = 86, is_active = 1, meta_json = '{}'
WHERE key = 'natal.house.10.cusp.sign.aries' AND locale = 'ru-RU'
  AND (topic_category = '' OR topic_category IS NULL)
  AND (text IS NULL OR LENGTH(TRIM(text))=0);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.10.cusp.sign.aries', '', 'ru-RU', 'Куспид 10-го дома в «Овен»: стиль темы 10-го дома через качества «Овен».', 86, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.10.cusp.sign.aries' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Куспид 10-го дома в «Телец»: стиль темы 10-го дома через качества «Телец».', priority = 86, is_active = 1, meta_json = '{}'
WHERE key = 'natal.house.10.cusp.sign.taurus' AND locale = 'ru-RU'
  AND (topic_category = '' OR topic_category IS NULL)
  AND (text IS NULL OR LENGTH(TRIM(text))=0);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.10.cusp.sign.taurus', '', 'ru-RU', 'Куспид 10-го дома в «Телец»: стиль темы 10-го дома через качества «Телец».', 86, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.10.cusp.sign.taurus' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Куспид 10-го дома в «Близнецы»: стиль темы 10-го дома через качества «Близнецы».', priority = 86, is_active = 1, meta_json = '{}'
WHERE key = 'natal.house.10.cusp.sign.gemini' AND locale = 'ru-RU'
  AND (topic_category = '' OR topic_category IS NULL)
  AND (text IS NULL OR LENGTH(TRIM(text))=0);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.10.cusp.sign.gemini', '', 'ru-RU', 'Куспид 10-го дома в «Близнецы»: стиль темы 10-го дома через качества «Близнецы».', 86, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.10.cusp.sign.gemini' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Куспид 10-го дома в «Рак»: стиль темы 10-го дома через качества «Рак».', priority = 86, is_active = 1, meta_json = '{}'
WHERE key = 'natal.house.10.cusp.sign.cancer' AND locale = 'ru-RU'
  AND (topic_category = '' OR topic_category IS NULL)
  AND (text IS NULL OR LENGTH(TRIM(text))=0);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.10.cusp.sign.cancer', '', 'ru-RU', 'Куспид 10-го дома в «Рак»: стиль темы 10-го дома через качества «Рак».', 86, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.10.cusp.sign.cancer' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Куспид 10-го дома в «Лев»: стиль темы 10-го дома через качества «Лев».', priority = 86, is_active = 1, meta_json = '{}'
WHERE key = 'natal.house.10.cusp.sign.leo' AND locale = 'ru-RU'
  AND (topic_category = '' OR topic_category IS NULL)
  AND (text IS NULL OR LENGTH(TRIM(text))=0);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.10.cusp.sign.leo', '', 'ru-RU', 'Куспид 10-го дома в «Лев»: стиль темы 10-го дома через качества «Лев».', 86, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.10.cusp.sign.leo' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Куспид 10-го дома в «Дева»: стиль темы 10-го дома через качества «Дева».', priority = 86, is_active = 1, meta_json = '{}'
WHERE key = 'natal.house.10.cusp.sign.virgo' AND locale = 'ru-RU'
  AND (topic_category = '' OR topic_category IS NULL)
  AND (text IS NULL OR LENGTH(TRIM(text))=0);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.10.cusp.sign.virgo', '', 'ru-RU', 'Куспид 10-го дома в «Дева»: стиль темы 10-го дома через качества «Дева».', 86, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.10.cusp.sign.virgo' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Куспид 10-го дома в «Весы»: стиль темы 10-го дома через качества «Весы».', priority = 86, is_active = 1, meta_json = '{}'
WHERE key = 'natal.house.10.cusp.sign.libra' AND locale = 'ru-RU'
  AND (topic_category = '' OR topic_category IS NULL)
  AND (text IS NULL OR LENGTH(TRIM(text))=0);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.10.cusp.sign.libra', '', 'ru-RU', 'Куспид 10-го дома в «Весы»: стиль темы 10-го дома через качества «Весы».', 86, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.10.cusp.sign.libra' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Куспид 10-го дома в «Скорпион»: стиль темы 10-го дома через качества «Скорпион».', priority = 86, is_active = 1, meta_json = '{}'
WHERE key = 'natal.house.10.cusp.sign.scorpio' AND locale = 'ru-RU'
  AND (topic_category = '' OR topic_category IS NULL)
  AND (text IS NULL OR LENGTH(TRIM(text))=0);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.10.cusp.sign.scorpio', '', 'ru-RU', 'Куспид 10-го дома в «Скорпион»: стиль темы 10-го дома через качества «Скорпион».', 86, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.10.cusp.sign.scorpio' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Куспид 10-го дома в «Стрелец»: стиль темы 10-го дома через качества «Стрелец».', priority = 86, is_active = 1, meta_json = '{}'
WHERE key = 'natal.house.10.cusp.sign.sagittarius' AND locale = 'ru-RU'
  AND (topic_category = '' OR topic_category IS NULL)
  AND (text IS NULL OR LENGTH(TRIM(text))=0);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.10.cusp.sign.sagittarius', '', 'ru-RU', 'Куспид 10-го дома в «Стрелец»: стиль темы 10-го дома через качества «Стрелец».', 86, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.10.cusp.sign.sagittarius' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Куспид 10-го дома в «Козерог»: стиль темы 10-го дома через качества «Козерог».', priority = 86, is_active = 1, meta_json = '{}'
WHERE key = 'natal.house.10.cusp.sign.capricorn' AND locale = 'ru-RU'
  AND (topic_category = '' OR topic_category IS NULL)
  AND (text IS NULL OR LENGTH(TRIM(text))=0);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.10.cusp.sign.capricorn', '', 'ru-RU', 'Куспид 10-го дома в «Козерог»: стиль темы 10-го дома через качества «Козерог».', 86, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.10.cusp.sign.capricorn' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Куспид 10-го дома в «Водолей»: стиль темы 10-го дома через качества «Водолей».', priority = 86, is_active = 1, meta_json = '{}'
WHERE key = 'natal.house.10.cusp.sign.aquarius' AND locale = 'ru-RU'
  AND (topic_category = '' OR topic_category IS NULL)
  AND (text IS NULL OR LENGTH(TRIM(text))=0);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.10.cusp.sign.aquarius', '', 'ru-RU', 'Куспид 10-го дома в «Водолей»: стиль темы 10-го дома через качества «Водолей».', 86, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.10.cusp.sign.aquarius' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Куспид 10-го дома в «Рыбы»: стиль темы 10-го дома через качества «Рыбы».', priority = 86, is_active = 1, meta_json = '{}'
WHERE key = 'natal.house.10.cusp.sign.pisces' AND locale = 'ru-RU'
  AND (topic_category = '' OR topic_category IS NULL)
  AND (text IS NULL OR LENGTH(TRIM(text))=0);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.10.cusp.sign.pisces', '', 'ru-RU', 'Куспид 10-го дома в «Рыбы»: стиль темы 10-го дома через качества «Рыбы».', 86, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.10.cusp.sign.pisces' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Куспид 11-го дома в знаке: задаёт тон и стиль проявления темы 11-го дома.', priority = 85, is_active = 1, meta_json = '{}'
WHERE key = 'natal.house.11.cusp.sign.any' AND locale = 'ru-RU'
  AND (topic_category = '' OR topic_category IS NULL)
  AND (text IS NULL OR LENGTH(TRIM(text))=0);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.11.cusp.sign.any', '', 'ru-RU', 'Куспид 11-го дома в знаке: задаёт тон и стиль проявления темы 11-го дома.', 85, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.11.cusp.sign.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Куспид 11-го дома в «Овен»: стиль темы 11-го дома через качества «Овен».', priority = 86, is_active = 1, meta_json = '{}'
WHERE key = 'natal.house.11.cusp.sign.aries' AND locale = 'ru-RU'
  AND (topic_category = '' OR topic_category IS NULL)
  AND (text IS NULL OR LENGTH(TRIM(text))=0);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.11.cusp.sign.aries', '', 'ru-RU', 'Куспид 11-го дома в «Овен»: стиль темы 11-го дома через качества «Овен».', 86, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.11.cusp.sign.aries' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Куспид 11-го дома в «Телец»: стиль темы 11-го дома через качества «Телец».', priority = 86, is_active = 1, meta_json = '{}'
WHERE key = 'natal.house.11.cusp.sign.taurus' AND locale = 'ru-RU'
  AND (topic_category = '' OR topic_category IS NULL)
  AND (text IS NULL OR LENGTH(TRIM(text))=0);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.11.cusp.sign.taurus', '', 'ru-RU', 'Куспид 11-го дома в «Телец»: стиль темы 11-го дома через качества «Телец».', 86, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.11.cusp.sign.taurus' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Куспид 11-го дома в «Близнецы»: стиль темы 11-го дома через качества «Близнецы».', priority = 86, is_active = 1, meta_json = '{}'
WHERE key = 'natal.house.11.cusp.sign.gemini' AND locale = 'ru-RU'
  AND (topic_category = '' OR topic_category IS NULL)
  AND (text IS NULL OR LENGTH(TRIM(text))=0);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.11.cusp.sign.gemini', '', 'ru-RU', 'Куспид 11-го дома в «Близнецы»: стиль темы 11-го дома через качества «Близнецы».', 86, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.11.cusp.sign.gemini' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Куспид 11-го дома в «Рак»: стиль темы 11-го дома через качества «Рак».', priority = 86, is_active = 1, meta_json = '{}'
WHERE key = 'natal.house.11.cusp.sign.cancer' AND locale = 'ru-RU'
  AND (topic_category = '' OR topic_category IS NULL)
  AND (text IS NULL OR LENGTH(TRIM(text))=0);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.11.cusp.sign.cancer', '', 'ru-RU', 'Куспид 11-го дома в «Рак»: стиль темы 11-го дома через качества «Рак».', 86, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.11.cusp.sign.cancer' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Куспид 11-го дома в «Лев»: стиль темы 11-го дома через качества «Лев».', priority = 86, is_active = 1, meta_json = '{}'
WHERE key = 'natal.house.11.cusp.sign.leo' AND locale = 'ru-RU'
  AND (topic_category = '' OR topic_category IS NULL)
  AND (text IS NULL OR LENGTH(TRIM(text))=0);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.11.cusp.sign.leo', '', 'ru-RU', 'Куспид 11-го дома в «Лев»: стиль темы 11-го дома через качества «Лев».', 86, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.11.cusp.sign.leo' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Куспид 11-го дома в «Дева»: стиль темы 11-го дома через качества «Дева».', priority = 86, is_active = 1, meta_json = '{}'
WHERE key = 'natal.house.11.cusp.sign.virgo' AND locale = 'ru-RU'
  AND (topic_category = '' OR topic_category IS NULL)
  AND (text IS NULL OR LENGTH(TRIM(text))=0);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.11.cusp.sign.virgo', '', 'ru-RU', 'Куспид 11-го дома в «Дева»: стиль темы 11-го дома через качества «Дева».', 86, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.11.cusp.sign.virgo' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Куспид 11-го дома в «Весы»: стиль темы 11-го дома через качества «Весы».', priority = 86, is_active = 1, meta_json = '{}'
WHERE key = 'natal.house.11.cusp.sign.libra' AND locale = 'ru-RU'
  AND (topic_category = '' OR topic_category IS NULL)
  AND (text IS NULL OR LENGTH(TRIM(text))=0);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.11.cusp.sign.libra', '', 'ru-RU', 'Куспид 11-го дома в «Весы»: стиль темы 11-го дома через качества «Весы».', 86, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.11.cusp.sign.libra' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Куспид 11-го дома в «Скорпион»: стиль темы 11-го дома через качества «Скорпион».', priority = 86, is_active = 1, meta_json = '{}'
WHERE key = 'natal.house.11.cusp.sign.scorpio' AND locale = 'ru-RU'
  AND (topic_category = '' OR topic_category IS NULL)
  AND (text IS NULL OR LENGTH(TRIM(text))=0);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.11.cusp.sign.scorpio', '', 'ru-RU', 'Куспид 11-го дома в «Скорпион»: стиль темы 11-го дома через качества «Скорпион».', 86, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.11.cusp.sign.scorpio' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Куспид 11-го дома в «Стрелец»: стиль темы 11-го дома через качества «Стрелец».', priority = 86, is_active = 1, meta_json = '{}'
WHERE key = 'natal.house.11.cusp.sign.sagittarius' AND locale = 'ru-RU'
  AND (topic_category = '' OR topic_category IS NULL)
  AND (text IS NULL OR LENGTH(TRIM(text))=0);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.11.cusp.sign.sagittarius', '', 'ru-RU', 'Куспид 11-го дома в «Стрелец»: стиль темы 11-го дома через качества «Стрелец».', 86, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.11.cusp.sign.sagittarius' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Куспид 11-го дома в «Козерог»: стиль темы 11-го дома через качества «Козерог».', priority = 86, is_active = 1, meta_json = '{}'
WHERE key = 'natal.house.11.cusp.sign.capricorn' AND locale = 'ru-RU'
  AND (topic_category = '' OR topic_category IS NULL)
  AND (text IS NULL OR LENGTH(TRIM(text))=0);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.11.cusp.sign.capricorn', '', 'ru-RU', 'Куспид 11-го дома в «Козерог»: стиль темы 11-го дома через качества «Козерог».', 86, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.11.cusp.sign.capricorn' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Куспид 11-го дома в «Водолей»: стиль темы 11-го дома через качества «Водолей».', priority = 86, is_active = 1, meta_json = '{}'
WHERE key = 'natal.house.11.cusp.sign.aquarius' AND locale = 'ru-RU'
  AND (topic_category = '' OR topic_category IS NULL)
  AND (text IS NULL OR LENGTH(TRIM(text))=0);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.11.cusp.sign.aquarius', '', 'ru-RU', 'Куспид 11-го дома в «Водолей»: стиль темы 11-го дома через качества «Водолей».', 86, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.11.cusp.sign.aquarius' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Куспид 11-го дома в «Рыбы»: стиль темы 11-го дома через качества «Рыбы».', priority = 86, is_active = 1, meta_json = '{}'
WHERE key = 'natal.house.11.cusp.sign.pisces' AND locale = 'ru-RU'
  AND (topic_category = '' OR topic_category IS NULL)
  AND (text IS NULL OR LENGTH(TRIM(text))=0);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.11.cusp.sign.pisces', '', 'ru-RU', 'Куспид 11-го дома в «Рыбы»: стиль темы 11-го дома через качества «Рыбы».', 86, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.11.cusp.sign.pisces' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Куспид 12-го дома в знаке: задаёт тон и стиль проявления темы 12-го дома.', priority = 85, is_active = 1, meta_json = '{}'
WHERE key = 'natal.house.12.cusp.sign.any' AND locale = 'ru-RU'
  AND (topic_category = '' OR topic_category IS NULL)
  AND (text IS NULL OR LENGTH(TRIM(text))=0);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.12.cusp.sign.any', '', 'ru-RU', 'Куспид 12-го дома в знаке: задаёт тон и стиль проявления темы 12-го дома.', 85, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.12.cusp.sign.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Куспид 12-го дома в «Овен»: стиль темы 12-го дома через качества «Овен».', priority = 86, is_active = 1, meta_json = '{}'
WHERE key = 'natal.house.12.cusp.sign.aries' AND locale = 'ru-RU'
  AND (topic_category = '' OR topic_category IS NULL)
  AND (text IS NULL OR LENGTH(TRIM(text))=0);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.12.cusp.sign.aries', '', 'ru-RU', 'Куспид 12-го дома в «Овен»: стиль темы 12-го дома через качества «Овен».', 86, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.12.cusp.sign.aries' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Куспид 12-го дома в «Телец»: стиль темы 12-го дома через качества «Телец».', priority = 86, is_active = 1, meta_json = '{}'
WHERE key = 'natal.house.12.cusp.sign.taurus' AND locale = 'ru-RU'
  AND (topic_category = '' OR topic_category IS NULL)
  AND (text IS NULL OR LENGTH(TRIM(text))=0);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.12.cusp.sign.taurus', '', 'ru-RU', 'Куспид 12-го дома в «Телец»: стиль темы 12-го дома через качества «Телец».', 86, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.12.cusp.sign.taurus' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Куспид 12-го дома в «Близнецы»: стиль темы 12-го дома через качества «Близнецы».', priority = 86, is_active = 1, meta_json = '{}'
WHERE key = 'natal.house.12.cusp.sign.gemini' AND locale = 'ru-RU'
  AND (topic_category = '' OR topic_category IS NULL)
  AND (text IS NULL OR LENGTH(TRIM(text))=0);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.12.cusp.sign.gemini', '', 'ru-RU', 'Куспид 12-го дома в «Близнецы»: стиль темы 12-го дома через качества «Близнецы».', 86, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.12.cusp.sign.gemini' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Куспид 12-го дома в «Рак»: стиль темы 12-го дома через качества «Рак».', priority = 86, is_active = 1, meta_json = '{}'
WHERE key = 'natal.house.12.cusp.sign.cancer' AND locale = 'ru-RU'
  AND (topic_category = '' OR topic_category IS NULL)
  AND (text IS NULL OR LENGTH(TRIM(text))=0);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.12.cusp.sign.cancer', '', 'ru-RU', 'Куспид 12-го дома в «Рак»: стиль темы 12-го дома через качества «Рак».', 86, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.12.cusp.sign.cancer' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Куспид 12-го дома в «Лев»: стиль темы 12-го дома через качества «Лев».', priority = 86, is_active = 1, meta_json = '{}'
WHERE key = 'natal.house.12.cusp.sign.leo' AND locale = 'ru-RU'
  AND (topic_category = '' OR topic_category IS NULL)
  AND (text IS NULL OR LENGTH(TRIM(text))=0);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.12.cusp.sign.leo', '', 'ru-RU', 'Куспид 12-го дома в «Лев»: стиль темы 12-го дома через качества «Лев».', 86, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.12.cusp.sign.leo' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Куспид 12-го дома в «Дева»: стиль темы 12-го дома через качества «Дева».', priority = 86, is_active = 1, meta_json = '{}'
WHERE key = 'natal.house.12.cusp.sign.virgo' AND locale = 'ru-RU'
  AND (topic_category = '' OR topic_category IS NULL)
  AND (text IS NULL OR LENGTH(TRIM(text))=0);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.12.cusp.sign.virgo', '', 'ru-RU', 'Куспид 12-го дома в «Дева»: стиль темы 12-го дома через качества «Дева».', 86, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.12.cusp.sign.virgo' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Куспид 12-го дома в «Весы»: стиль темы 12-го дома через качества «Весы».', priority = 86, is_active = 1, meta_json = '{}'
WHERE key = 'natal.house.12.cusp.sign.libra' AND locale = 'ru-RU'
  AND (topic_category = '' OR topic_category IS NULL)
  AND (text IS NULL OR LENGTH(TRIM(text))=0);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.12.cusp.sign.libra', '', 'ru-RU', 'Куспид 12-го дома в «Весы»: стиль темы 12-го дома через качества «Весы».', 86, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.12.cusp.sign.libra' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Куспид 12-го дома в «Скорпион»: стиль темы 12-го дома через качества «Скорпион».', priority = 86, is_active = 1, meta_json = '{}'
WHERE key = 'natal.house.12.cusp.sign.scorpio' AND locale = 'ru-RU'
  AND (topic_category = '' OR topic_category IS NULL)
  AND (text IS NULL OR LENGTH(TRIM(text))=0);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.12.cusp.sign.scorpio', '', 'ru-RU', 'Куспид 12-го дома в «Скорпион»: стиль темы 12-го дома через качества «Скорпион».', 86, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.12.cusp.sign.scorpio' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Куспид 12-го дома в «Стрелец»: стиль темы 12-го дома через качества «Стрелец».', priority = 86, is_active = 1, meta_json = '{}'
WHERE key = 'natal.house.12.cusp.sign.sagittarius' AND locale = 'ru-RU'
  AND (topic_category = '' OR topic_category IS NULL)
  AND (text IS NULL OR LENGTH(TRIM(text))=0);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.12.cusp.sign.sagittarius', '', 'ru-RU', 'Куспид 12-го дома в «Стрелец»: стиль темы 12-го дома через качества «Стрелец».', 86, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.12.cusp.sign.sagittarius' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Куспид 12-го дома в «Козерог»: стиль темы 12-го дома через качества «Козерог».', priority = 86, is_active = 1, meta_json = '{}'
WHERE key = 'natal.house.12.cusp.sign.capricorn' AND locale = 'ru-RU'
  AND (topic_category = '' OR topic_category IS NULL)
  AND (text IS NULL OR LENGTH(TRIM(text))=0);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.12.cusp.sign.capricorn', '', 'ru-RU', 'Куспид 12-го дома в «Козерог»: стиль темы 12-го дома через качества «Козерог».', 86, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.12.cusp.sign.capricorn' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Куспид 12-го дома в «Водолей»: стиль темы 12-го дома через качества «Водолей».', priority = 86, is_active = 1, meta_json = '{}'
WHERE key = 'natal.house.12.cusp.sign.aquarius' AND locale = 'ru-RU'
  AND (topic_category = '' OR topic_category IS NULL)
  AND (text IS NULL OR LENGTH(TRIM(text))=0);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.12.cusp.sign.aquarius', '', 'ru-RU', 'Куспид 12-го дома в «Водолей»: стиль темы 12-го дома через качества «Водолей».', 86, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.12.cusp.sign.aquarius' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Куспид 12-го дома в «Рыбы»: стиль темы 12-го дома через качества «Рыбы».', priority = 86, is_active = 1, meta_json = '{}'
WHERE key = 'natal.house.12.cusp.sign.pisces' AND locale = 'ru-RU'
  AND (topic_category = '' OR topic_category IS NULL)
  AND (text IS NULL OR LENGTH(TRIM(text))=0);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.12.cusp.sign.pisces', '', 'ru-RU', 'Куспид 12-го дома в «Рыбы»: стиль темы 12-го дома через качества «Рыбы».', 86, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.12.cusp.sign.pisces' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

COMMIT;

