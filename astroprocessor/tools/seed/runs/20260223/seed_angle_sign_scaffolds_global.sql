-- AUTO-GENERATED. DO NOT EDIT BY HAND.

-- GLOBAL angle scaffolds

BEGIN;

UPDATE knowledge_items
SET text = 'Угол ASC: важная точка карты, описывает ось опыта и внешнего проявления.', priority = 86, is_active = 1, meta_json = '{}'
WHERE key = 'natal.angle.asc' AND locale = 'ru-RU'
  AND (topic_category = '' OR topic_category IS NULL)
  AND (text IS NULL OR LENGTH(TRIM(text))=0);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.angle.asc', '', 'ru-RU', 'Угол ASC: важная точка карты, описывает ось опыта и внешнего проявления.', 86, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.angle.asc' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Угол ASC в знаке: задаёт стиль проявления этой оси (как это выглядит и ощущается).', priority = 86, is_active = 1, meta_json = '{}'
WHERE key = 'natal.angle.asc.sign.any' AND locale = 'ru-RU'
  AND (topic_category = '' OR topic_category IS NULL)
  AND (text IS NULL OR LENGTH(TRIM(text))=0);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.angle.asc.sign.any', '', 'ru-RU', 'Угол ASC в знаке: задаёт стиль проявления этой оси (как это выглядит и ощущается).', 86, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.angle.asc.sign.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Угол ASC в «Овен»: стиль проявления оси через качества «Овен».', priority = 88, is_active = 1, meta_json = '{}'
WHERE key = 'natal.angle.asc.sign.aries' AND locale = 'ru-RU'
  AND (topic_category = '' OR topic_category IS NULL)
  AND (text IS NULL OR LENGTH(TRIM(text))=0);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.angle.asc.sign.aries', '', 'ru-RU', 'Угол ASC в «Овен»: стиль проявления оси через качества «Овен».', 88, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.angle.asc.sign.aries' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Угол ASC в «Телец»: стиль проявления оси через качества «Телец».', priority = 88, is_active = 1, meta_json = '{}'
WHERE key = 'natal.angle.asc.sign.taurus' AND locale = 'ru-RU'
  AND (topic_category = '' OR topic_category IS NULL)
  AND (text IS NULL OR LENGTH(TRIM(text))=0);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.angle.asc.sign.taurus', '', 'ru-RU', 'Угол ASC в «Телец»: стиль проявления оси через качества «Телец».', 88, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.angle.asc.sign.taurus' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Угол ASC в «Близнецы»: стиль проявления оси через качества «Близнецы».', priority = 88, is_active = 1, meta_json = '{}'
WHERE key = 'natal.angle.asc.sign.gemini' AND locale = 'ru-RU'
  AND (topic_category = '' OR topic_category IS NULL)
  AND (text IS NULL OR LENGTH(TRIM(text))=0);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.angle.asc.sign.gemini', '', 'ru-RU', 'Угол ASC в «Близнецы»: стиль проявления оси через качества «Близнецы».', 88, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.angle.asc.sign.gemini' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Угол ASC в «Рак»: стиль проявления оси через качества «Рак».', priority = 88, is_active = 1, meta_json = '{}'
WHERE key = 'natal.angle.asc.sign.cancer' AND locale = 'ru-RU'
  AND (topic_category = '' OR topic_category IS NULL)
  AND (text IS NULL OR LENGTH(TRIM(text))=0);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.angle.asc.sign.cancer', '', 'ru-RU', 'Угол ASC в «Рак»: стиль проявления оси через качества «Рак».', 88, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.angle.asc.sign.cancer' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Угол ASC в «Лев»: стиль проявления оси через качества «Лев».', priority = 88, is_active = 1, meta_json = '{}'
WHERE key = 'natal.angle.asc.sign.leo' AND locale = 'ru-RU'
  AND (topic_category = '' OR topic_category IS NULL)
  AND (text IS NULL OR LENGTH(TRIM(text))=0);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.angle.asc.sign.leo', '', 'ru-RU', 'Угол ASC в «Лев»: стиль проявления оси через качества «Лев».', 88, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.angle.asc.sign.leo' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Угол ASC в «Дева»: стиль проявления оси через качества «Дева».', priority = 88, is_active = 1, meta_json = '{}'
WHERE key = 'natal.angle.asc.sign.virgo' AND locale = 'ru-RU'
  AND (topic_category = '' OR topic_category IS NULL)
  AND (text IS NULL OR LENGTH(TRIM(text))=0);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.angle.asc.sign.virgo', '', 'ru-RU', 'Угол ASC в «Дева»: стиль проявления оси через качества «Дева».', 88, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.angle.asc.sign.virgo' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Угол ASC в «Весы»: стиль проявления оси через качества «Весы».', priority = 88, is_active = 1, meta_json = '{}'
WHERE key = 'natal.angle.asc.sign.libra' AND locale = 'ru-RU'
  AND (topic_category = '' OR topic_category IS NULL)
  AND (text IS NULL OR LENGTH(TRIM(text))=0);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.angle.asc.sign.libra', '', 'ru-RU', 'Угол ASC в «Весы»: стиль проявления оси через качества «Весы».', 88, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.angle.asc.sign.libra' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Угол ASC в «Скорпион»: стиль проявления оси через качества «Скорпион».', priority = 88, is_active = 1, meta_json = '{}'
WHERE key = 'natal.angle.asc.sign.scorpio' AND locale = 'ru-RU'
  AND (topic_category = '' OR topic_category IS NULL)
  AND (text IS NULL OR LENGTH(TRIM(text))=0);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.angle.asc.sign.scorpio', '', 'ru-RU', 'Угол ASC в «Скорпион»: стиль проявления оси через качества «Скорпион».', 88, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.angle.asc.sign.scorpio' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Угол ASC в «Стрелец»: стиль проявления оси через качества «Стрелец».', priority = 88, is_active = 1, meta_json = '{}'
WHERE key = 'natal.angle.asc.sign.sagittarius' AND locale = 'ru-RU'
  AND (topic_category = '' OR topic_category IS NULL)
  AND (text IS NULL OR LENGTH(TRIM(text))=0);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.angle.asc.sign.sagittarius', '', 'ru-RU', 'Угол ASC в «Стрелец»: стиль проявления оси через качества «Стрелец».', 88, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.angle.asc.sign.sagittarius' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Угол ASC в «Козерог»: стиль проявления оси через качества «Козерог».', priority = 88, is_active = 1, meta_json = '{}'
WHERE key = 'natal.angle.asc.sign.capricorn' AND locale = 'ru-RU'
  AND (topic_category = '' OR topic_category IS NULL)
  AND (text IS NULL OR LENGTH(TRIM(text))=0);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.angle.asc.sign.capricorn', '', 'ru-RU', 'Угол ASC в «Козерог»: стиль проявления оси через качества «Козерог».', 88, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.angle.asc.sign.capricorn' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Угол ASC в «Водолей»: стиль проявления оси через качества «Водолей».', priority = 88, is_active = 1, meta_json = '{}'
WHERE key = 'natal.angle.asc.sign.aquarius' AND locale = 'ru-RU'
  AND (topic_category = '' OR topic_category IS NULL)
  AND (text IS NULL OR LENGTH(TRIM(text))=0);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.angle.asc.sign.aquarius', '', 'ru-RU', 'Угол ASC в «Водолей»: стиль проявления оси через качества «Водолей».', 88, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.angle.asc.sign.aquarius' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Угол ASC в «Рыбы»: стиль проявления оси через качества «Рыбы».', priority = 88, is_active = 1, meta_json = '{}'
WHERE key = 'natal.angle.asc.sign.pisces' AND locale = 'ru-RU'
  AND (topic_category = '' OR topic_category IS NULL)
  AND (text IS NULL OR LENGTH(TRIM(text))=0);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.angle.asc.sign.pisces', '', 'ru-RU', 'Угол ASC в «Рыбы»: стиль проявления оси через качества «Рыбы».', 88, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.angle.asc.sign.pisces' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Угол MC: важная точка карты, описывает ось опыта и внешнего проявления.', priority = 86, is_active = 1, meta_json = '{}'
WHERE key = 'natal.angle.mc' AND locale = 'ru-RU'
  AND (topic_category = '' OR topic_category IS NULL)
  AND (text IS NULL OR LENGTH(TRIM(text))=0);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.angle.mc', '', 'ru-RU', 'Угол MC: важная точка карты, описывает ось опыта и внешнего проявления.', 86, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.angle.mc' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Угол MC в знаке: задаёт стиль проявления этой оси (как это выглядит и ощущается).', priority = 86, is_active = 1, meta_json = '{}'
WHERE key = 'natal.angle.mc.sign.any' AND locale = 'ru-RU'
  AND (topic_category = '' OR topic_category IS NULL)
  AND (text IS NULL OR LENGTH(TRIM(text))=0);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.angle.mc.sign.any', '', 'ru-RU', 'Угол MC в знаке: задаёт стиль проявления этой оси (как это выглядит и ощущается).', 86, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.angle.mc.sign.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Угол MC в «Овен»: стиль проявления оси через качества «Овен».', priority = 88, is_active = 1, meta_json = '{}'
WHERE key = 'natal.angle.mc.sign.aries' AND locale = 'ru-RU'
  AND (topic_category = '' OR topic_category IS NULL)
  AND (text IS NULL OR LENGTH(TRIM(text))=0);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.angle.mc.sign.aries', '', 'ru-RU', 'Угол MC в «Овен»: стиль проявления оси через качества «Овен».', 88, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.angle.mc.sign.aries' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Угол MC в «Телец»: стиль проявления оси через качества «Телец».', priority = 88, is_active = 1, meta_json = '{}'
WHERE key = 'natal.angle.mc.sign.taurus' AND locale = 'ru-RU'
  AND (topic_category = '' OR topic_category IS NULL)
  AND (text IS NULL OR LENGTH(TRIM(text))=0);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.angle.mc.sign.taurus', '', 'ru-RU', 'Угол MC в «Телец»: стиль проявления оси через качества «Телец».', 88, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.angle.mc.sign.taurus' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Угол MC в «Близнецы»: стиль проявления оси через качества «Близнецы».', priority = 88, is_active = 1, meta_json = '{}'
WHERE key = 'natal.angle.mc.sign.gemini' AND locale = 'ru-RU'
  AND (topic_category = '' OR topic_category IS NULL)
  AND (text IS NULL OR LENGTH(TRIM(text))=0);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.angle.mc.sign.gemini', '', 'ru-RU', 'Угол MC в «Близнецы»: стиль проявления оси через качества «Близнецы».', 88, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.angle.mc.sign.gemini' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Угол MC в «Рак»: стиль проявления оси через качества «Рак».', priority = 88, is_active = 1, meta_json = '{}'
WHERE key = 'natal.angle.mc.sign.cancer' AND locale = 'ru-RU'
  AND (topic_category = '' OR topic_category IS NULL)
  AND (text IS NULL OR LENGTH(TRIM(text))=0);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.angle.mc.sign.cancer', '', 'ru-RU', 'Угол MC в «Рак»: стиль проявления оси через качества «Рак».', 88, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.angle.mc.sign.cancer' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Угол MC в «Лев»: стиль проявления оси через качества «Лев».', priority = 88, is_active = 1, meta_json = '{}'
WHERE key = 'natal.angle.mc.sign.leo' AND locale = 'ru-RU'
  AND (topic_category = '' OR topic_category IS NULL)
  AND (text IS NULL OR LENGTH(TRIM(text))=0);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.angle.mc.sign.leo', '', 'ru-RU', 'Угол MC в «Лев»: стиль проявления оси через качества «Лев».', 88, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.angle.mc.sign.leo' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Угол MC в «Дева»: стиль проявления оси через качества «Дева».', priority = 88, is_active = 1, meta_json = '{}'
WHERE key = 'natal.angle.mc.sign.virgo' AND locale = 'ru-RU'
  AND (topic_category = '' OR topic_category IS NULL)
  AND (text IS NULL OR LENGTH(TRIM(text))=0);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.angle.mc.sign.virgo', '', 'ru-RU', 'Угол MC в «Дева»: стиль проявления оси через качества «Дева».', 88, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.angle.mc.sign.virgo' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Угол MC в «Весы»: стиль проявления оси через качества «Весы».', priority = 88, is_active = 1, meta_json = '{}'
WHERE key = 'natal.angle.mc.sign.libra' AND locale = 'ru-RU'
  AND (topic_category = '' OR topic_category IS NULL)
  AND (text IS NULL OR LENGTH(TRIM(text))=0);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.angle.mc.sign.libra', '', 'ru-RU', 'Угол MC в «Весы»: стиль проявления оси через качества «Весы».', 88, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.angle.mc.sign.libra' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Угол MC в «Скорпион»: стиль проявления оси через качества «Скорпион».', priority = 88, is_active = 1, meta_json = '{}'
WHERE key = 'natal.angle.mc.sign.scorpio' AND locale = 'ru-RU'
  AND (topic_category = '' OR topic_category IS NULL)
  AND (text IS NULL OR LENGTH(TRIM(text))=0);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.angle.mc.sign.scorpio', '', 'ru-RU', 'Угол MC в «Скорпион»: стиль проявления оси через качества «Скорпион».', 88, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.angle.mc.sign.scorpio' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Угол MC в «Стрелец»: стиль проявления оси через качества «Стрелец».', priority = 88, is_active = 1, meta_json = '{}'
WHERE key = 'natal.angle.mc.sign.sagittarius' AND locale = 'ru-RU'
  AND (topic_category = '' OR topic_category IS NULL)
  AND (text IS NULL OR LENGTH(TRIM(text))=0);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.angle.mc.sign.sagittarius', '', 'ru-RU', 'Угол MC в «Стрелец»: стиль проявления оси через качества «Стрелец».', 88, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.angle.mc.sign.sagittarius' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Угол MC в «Козерог»: стиль проявления оси через качества «Козерог».', priority = 88, is_active = 1, meta_json = '{}'
WHERE key = 'natal.angle.mc.sign.capricorn' AND locale = 'ru-RU'
  AND (topic_category = '' OR topic_category IS NULL)
  AND (text IS NULL OR LENGTH(TRIM(text))=0);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.angle.mc.sign.capricorn', '', 'ru-RU', 'Угол MC в «Козерог»: стиль проявления оси через качества «Козерог».', 88, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.angle.mc.sign.capricorn' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Угол MC в «Водолей»: стиль проявления оси через качества «Водолей».', priority = 88, is_active = 1, meta_json = '{}'
WHERE key = 'natal.angle.mc.sign.aquarius' AND locale = 'ru-RU'
  AND (topic_category = '' OR topic_category IS NULL)
  AND (text IS NULL OR LENGTH(TRIM(text))=0);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.angle.mc.sign.aquarius', '', 'ru-RU', 'Угол MC в «Водолей»: стиль проявления оси через качества «Водолей».', 88, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.angle.mc.sign.aquarius' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Угол MC в «Рыбы»: стиль проявления оси через качества «Рыбы».', priority = 88, is_active = 1, meta_json = '{}'
WHERE key = 'natal.angle.mc.sign.pisces' AND locale = 'ru-RU'
  AND (topic_category = '' OR topic_category IS NULL)
  AND (text IS NULL OR LENGTH(TRIM(text))=0);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.angle.mc.sign.pisces', '', 'ru-RU', 'Угол MC в «Рыбы»: стиль проявления оси через качества «Рыбы».', 88, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.angle.mc.sign.pisces' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Угол DSC: важная точка карты, описывает ось опыта и внешнего проявления.', priority = 86, is_active = 1, meta_json = '{}'
WHERE key = 'natal.angle.dsc' AND locale = 'ru-RU'
  AND (topic_category = '' OR topic_category IS NULL)
  AND (text IS NULL OR LENGTH(TRIM(text))=0);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.angle.dsc', '', 'ru-RU', 'Угол DSC: важная точка карты, описывает ось опыта и внешнего проявления.', 86, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.angle.dsc' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Угол DSC в знаке: задаёт стиль проявления этой оси (как это выглядит и ощущается).', priority = 86, is_active = 1, meta_json = '{}'
WHERE key = 'natal.angle.dsc.sign.any' AND locale = 'ru-RU'
  AND (topic_category = '' OR topic_category IS NULL)
  AND (text IS NULL OR LENGTH(TRIM(text))=0);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.angle.dsc.sign.any', '', 'ru-RU', 'Угол DSC в знаке: задаёт стиль проявления этой оси (как это выглядит и ощущается).', 86, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.angle.dsc.sign.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Угол DSC в «Овен»: стиль проявления оси через качества «Овен».', priority = 88, is_active = 1, meta_json = '{}'
WHERE key = 'natal.angle.dsc.sign.aries' AND locale = 'ru-RU'
  AND (topic_category = '' OR topic_category IS NULL)
  AND (text IS NULL OR LENGTH(TRIM(text))=0);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.angle.dsc.sign.aries', '', 'ru-RU', 'Угол DSC в «Овен»: стиль проявления оси через качества «Овен».', 88, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.angle.dsc.sign.aries' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Угол DSC в «Телец»: стиль проявления оси через качества «Телец».', priority = 88, is_active = 1, meta_json = '{}'
WHERE key = 'natal.angle.dsc.sign.taurus' AND locale = 'ru-RU'
  AND (topic_category = '' OR topic_category IS NULL)
  AND (text IS NULL OR LENGTH(TRIM(text))=0);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.angle.dsc.sign.taurus', '', 'ru-RU', 'Угол DSC в «Телец»: стиль проявления оси через качества «Телец».', 88, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.angle.dsc.sign.taurus' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Угол DSC в «Близнецы»: стиль проявления оси через качества «Близнецы».', priority = 88, is_active = 1, meta_json = '{}'
WHERE key = 'natal.angle.dsc.sign.gemini' AND locale = 'ru-RU'
  AND (topic_category = '' OR topic_category IS NULL)
  AND (text IS NULL OR LENGTH(TRIM(text))=0);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.angle.dsc.sign.gemini', '', 'ru-RU', 'Угол DSC в «Близнецы»: стиль проявления оси через качества «Близнецы».', 88, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.angle.dsc.sign.gemini' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Угол DSC в «Рак»: стиль проявления оси через качества «Рак».', priority = 88, is_active = 1, meta_json = '{}'
WHERE key = 'natal.angle.dsc.sign.cancer' AND locale = 'ru-RU'
  AND (topic_category = '' OR topic_category IS NULL)
  AND (text IS NULL OR LENGTH(TRIM(text))=0);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.angle.dsc.sign.cancer', '', 'ru-RU', 'Угол DSC в «Рак»: стиль проявления оси через качества «Рак».', 88, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.angle.dsc.sign.cancer' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Угол DSC в «Лев»: стиль проявления оси через качества «Лев».', priority = 88, is_active = 1, meta_json = '{}'
WHERE key = 'natal.angle.dsc.sign.leo' AND locale = 'ru-RU'
  AND (topic_category = '' OR topic_category IS NULL)
  AND (text IS NULL OR LENGTH(TRIM(text))=0);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.angle.dsc.sign.leo', '', 'ru-RU', 'Угол DSC в «Лев»: стиль проявления оси через качества «Лев».', 88, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.angle.dsc.sign.leo' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Угол DSC в «Дева»: стиль проявления оси через качества «Дева».', priority = 88, is_active = 1, meta_json = '{}'
WHERE key = 'natal.angle.dsc.sign.virgo' AND locale = 'ru-RU'
  AND (topic_category = '' OR topic_category IS NULL)
  AND (text IS NULL OR LENGTH(TRIM(text))=0);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.angle.dsc.sign.virgo', '', 'ru-RU', 'Угол DSC в «Дева»: стиль проявления оси через качества «Дева».', 88, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.angle.dsc.sign.virgo' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Угол DSC в «Весы»: стиль проявления оси через качества «Весы».', priority = 88, is_active = 1, meta_json = '{}'
WHERE key = 'natal.angle.dsc.sign.libra' AND locale = 'ru-RU'
  AND (topic_category = '' OR topic_category IS NULL)
  AND (text IS NULL OR LENGTH(TRIM(text))=0);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.angle.dsc.sign.libra', '', 'ru-RU', 'Угол DSC в «Весы»: стиль проявления оси через качества «Весы».', 88, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.angle.dsc.sign.libra' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Угол DSC в «Скорпион»: стиль проявления оси через качества «Скорпион».', priority = 88, is_active = 1, meta_json = '{}'
WHERE key = 'natal.angle.dsc.sign.scorpio' AND locale = 'ru-RU'
  AND (topic_category = '' OR topic_category IS NULL)
  AND (text IS NULL OR LENGTH(TRIM(text))=0);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.angle.dsc.sign.scorpio', '', 'ru-RU', 'Угол DSC в «Скорпион»: стиль проявления оси через качества «Скорпион».', 88, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.angle.dsc.sign.scorpio' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Угол DSC в «Стрелец»: стиль проявления оси через качества «Стрелец».', priority = 88, is_active = 1, meta_json = '{}'
WHERE key = 'natal.angle.dsc.sign.sagittarius' AND locale = 'ru-RU'
  AND (topic_category = '' OR topic_category IS NULL)
  AND (text IS NULL OR LENGTH(TRIM(text))=0);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.angle.dsc.sign.sagittarius', '', 'ru-RU', 'Угол DSC в «Стрелец»: стиль проявления оси через качества «Стрелец».', 88, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.angle.dsc.sign.sagittarius' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Угол DSC в «Козерог»: стиль проявления оси через качества «Козерог».', priority = 88, is_active = 1, meta_json = '{}'
WHERE key = 'natal.angle.dsc.sign.capricorn' AND locale = 'ru-RU'
  AND (topic_category = '' OR topic_category IS NULL)
  AND (text IS NULL OR LENGTH(TRIM(text))=0);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.angle.dsc.sign.capricorn', '', 'ru-RU', 'Угол DSC в «Козерог»: стиль проявления оси через качества «Козерог».', 88, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.angle.dsc.sign.capricorn' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Угол DSC в «Водолей»: стиль проявления оси через качества «Водолей».', priority = 88, is_active = 1, meta_json = '{}'
WHERE key = 'natal.angle.dsc.sign.aquarius' AND locale = 'ru-RU'
  AND (topic_category = '' OR topic_category IS NULL)
  AND (text IS NULL OR LENGTH(TRIM(text))=0);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.angle.dsc.sign.aquarius', '', 'ru-RU', 'Угол DSC в «Водолей»: стиль проявления оси через качества «Водолей».', 88, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.angle.dsc.sign.aquarius' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Угол DSC в «Рыбы»: стиль проявления оси через качества «Рыбы».', priority = 88, is_active = 1, meta_json = '{}'
WHERE key = 'natal.angle.dsc.sign.pisces' AND locale = 'ru-RU'
  AND (topic_category = '' OR topic_category IS NULL)
  AND (text IS NULL OR LENGTH(TRIM(text))=0);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.angle.dsc.sign.pisces', '', 'ru-RU', 'Угол DSC в «Рыбы»: стиль проявления оси через качества «Рыбы».', 88, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.angle.dsc.sign.pisces' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Угол IC: важная точка карты, описывает ось опыта и внешнего проявления.', priority = 86, is_active = 1, meta_json = '{}'
WHERE key = 'natal.angle.ic' AND locale = 'ru-RU'
  AND (topic_category = '' OR topic_category IS NULL)
  AND (text IS NULL OR LENGTH(TRIM(text))=0);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.angle.ic', '', 'ru-RU', 'Угол IC: важная точка карты, описывает ось опыта и внешнего проявления.', 86, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.angle.ic' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Угол IC в знаке: задаёт стиль проявления этой оси (как это выглядит и ощущается).', priority = 86, is_active = 1, meta_json = '{}'
WHERE key = 'natal.angle.ic.sign.any' AND locale = 'ru-RU'
  AND (topic_category = '' OR topic_category IS NULL)
  AND (text IS NULL OR LENGTH(TRIM(text))=0);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.angle.ic.sign.any', '', 'ru-RU', 'Угол IC в знаке: задаёт стиль проявления этой оси (как это выглядит и ощущается).', 86, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.angle.ic.sign.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Угол IC в «Овен»: стиль проявления оси через качества «Овен».', priority = 88, is_active = 1, meta_json = '{}'
WHERE key = 'natal.angle.ic.sign.aries' AND locale = 'ru-RU'
  AND (topic_category = '' OR topic_category IS NULL)
  AND (text IS NULL OR LENGTH(TRIM(text))=0);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.angle.ic.sign.aries', '', 'ru-RU', 'Угол IC в «Овен»: стиль проявления оси через качества «Овен».', 88, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.angle.ic.sign.aries' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Угол IC в «Телец»: стиль проявления оси через качества «Телец».', priority = 88, is_active = 1, meta_json = '{}'
WHERE key = 'natal.angle.ic.sign.taurus' AND locale = 'ru-RU'
  AND (topic_category = '' OR topic_category IS NULL)
  AND (text IS NULL OR LENGTH(TRIM(text))=0);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.angle.ic.sign.taurus', '', 'ru-RU', 'Угол IC в «Телец»: стиль проявления оси через качества «Телец».', 88, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.angle.ic.sign.taurus' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Угол IC в «Близнецы»: стиль проявления оси через качества «Близнецы».', priority = 88, is_active = 1, meta_json = '{}'
WHERE key = 'natal.angle.ic.sign.gemini' AND locale = 'ru-RU'
  AND (topic_category = '' OR topic_category IS NULL)
  AND (text IS NULL OR LENGTH(TRIM(text))=0);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.angle.ic.sign.gemini', '', 'ru-RU', 'Угол IC в «Близнецы»: стиль проявления оси через качества «Близнецы».', 88, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.angle.ic.sign.gemini' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Угол IC в «Рак»: стиль проявления оси через качества «Рак».', priority = 88, is_active = 1, meta_json = '{}'
WHERE key = 'natal.angle.ic.sign.cancer' AND locale = 'ru-RU'
  AND (topic_category = '' OR topic_category IS NULL)
  AND (text IS NULL OR LENGTH(TRIM(text))=0);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.angle.ic.sign.cancer', '', 'ru-RU', 'Угол IC в «Рак»: стиль проявления оси через качества «Рак».', 88, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.angle.ic.sign.cancer' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Угол IC в «Лев»: стиль проявления оси через качества «Лев».', priority = 88, is_active = 1, meta_json = '{}'
WHERE key = 'natal.angle.ic.sign.leo' AND locale = 'ru-RU'
  AND (topic_category = '' OR topic_category IS NULL)
  AND (text IS NULL OR LENGTH(TRIM(text))=0);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.angle.ic.sign.leo', '', 'ru-RU', 'Угол IC в «Лев»: стиль проявления оси через качества «Лев».', 88, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.angle.ic.sign.leo' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Угол IC в «Дева»: стиль проявления оси через качества «Дева».', priority = 88, is_active = 1, meta_json = '{}'
WHERE key = 'natal.angle.ic.sign.virgo' AND locale = 'ru-RU'
  AND (topic_category = '' OR topic_category IS NULL)
  AND (text IS NULL OR LENGTH(TRIM(text))=0);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.angle.ic.sign.virgo', '', 'ru-RU', 'Угол IC в «Дева»: стиль проявления оси через качества «Дева».', 88, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.angle.ic.sign.virgo' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Угол IC в «Весы»: стиль проявления оси через качества «Весы».', priority = 88, is_active = 1, meta_json = '{}'
WHERE key = 'natal.angle.ic.sign.libra' AND locale = 'ru-RU'
  AND (topic_category = '' OR topic_category IS NULL)
  AND (text IS NULL OR LENGTH(TRIM(text))=0);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.angle.ic.sign.libra', '', 'ru-RU', 'Угол IC в «Весы»: стиль проявления оси через качества «Весы».', 88, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.angle.ic.sign.libra' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Угол IC в «Скорпион»: стиль проявления оси через качества «Скорпион».', priority = 88, is_active = 1, meta_json = '{}'
WHERE key = 'natal.angle.ic.sign.scorpio' AND locale = 'ru-RU'
  AND (topic_category = '' OR topic_category IS NULL)
  AND (text IS NULL OR LENGTH(TRIM(text))=0);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.angle.ic.sign.scorpio', '', 'ru-RU', 'Угол IC в «Скорпион»: стиль проявления оси через качества «Скорпион».', 88, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.angle.ic.sign.scorpio' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Угол IC в «Стрелец»: стиль проявления оси через качества «Стрелец».', priority = 88, is_active = 1, meta_json = '{}'
WHERE key = 'natal.angle.ic.sign.sagittarius' AND locale = 'ru-RU'
  AND (topic_category = '' OR topic_category IS NULL)
  AND (text IS NULL OR LENGTH(TRIM(text))=0);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.angle.ic.sign.sagittarius', '', 'ru-RU', 'Угол IC в «Стрелец»: стиль проявления оси через качества «Стрелец».', 88, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.angle.ic.sign.sagittarius' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Угол IC в «Козерог»: стиль проявления оси через качества «Козерог».', priority = 88, is_active = 1, meta_json = '{}'
WHERE key = 'natal.angle.ic.sign.capricorn' AND locale = 'ru-RU'
  AND (topic_category = '' OR topic_category IS NULL)
  AND (text IS NULL OR LENGTH(TRIM(text))=0);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.angle.ic.sign.capricorn', '', 'ru-RU', 'Угол IC в «Козерог»: стиль проявления оси через качества «Козерог».', 88, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.angle.ic.sign.capricorn' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Угол IC в «Водолей»: стиль проявления оси через качества «Водолей».', priority = 88, is_active = 1, meta_json = '{}'
WHERE key = 'natal.angle.ic.sign.aquarius' AND locale = 'ru-RU'
  AND (topic_category = '' OR topic_category IS NULL)
  AND (text IS NULL OR LENGTH(TRIM(text))=0);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.angle.ic.sign.aquarius', '', 'ru-RU', 'Угол IC в «Водолей»: стиль проявления оси через качества «Водолей».', 88, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.angle.ic.sign.aquarius' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Угол IC в «Рыбы»: стиль проявления оси через качества «Рыбы».', priority = 88, is_active = 1, meta_json = '{}'
WHERE key = 'natal.angle.ic.sign.pisces' AND locale = 'ru-RU'
  AND (topic_category = '' OR topic_category IS NULL)
  AND (text IS NULL OR LENGTH(TRIM(text))=0);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.angle.ic.sign.pisces', '', 'ru-RU', 'Угол IC в «Рыбы»: стиль проявления оси через качества «Рыбы».', 88, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.angle.ic.sign.pisces' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

COMMIT;

