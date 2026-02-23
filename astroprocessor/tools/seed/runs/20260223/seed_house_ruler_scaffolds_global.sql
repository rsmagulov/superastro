-- AUTO-GENERATED. DO NOT EDIT BY HAND.

-- GLOBAL house ruler scaffolds

BEGIN;

UPDATE knowledge_items
SET text = 'Управитель 1-го дома: планета, которая показывает «как» и «через что» реализуется тема 1-го дома.', priority = 84, is_active = 1, meta_json = '{}'
WHERE key = 'natal.house.1.ruler.any' AND locale = 'ru-RU'
  AND (topic_category = '' OR topic_category IS NULL)
  AND (text IS NULL OR LENGTH(TRIM(text))=0);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.1.ruler.any', '', 'ru-RU', 'Управитель 1-го дома: планета, которая показывает «как» и «через что» реализуется тема 1-го дома.', 84, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.1.ruler.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Управитель 1-го дома — Солнце: его положение (знак/дом/аспекты) уточняет стиль и стратегию по теме 1-го дома.', priority = 84, is_active = 1, meta_json = '{}'
WHERE key = 'natal.house.1.ruler.sun' AND locale = 'ru-RU'
  AND (topic_category = '' OR topic_category IS NULL)
  AND (text IS NULL OR LENGTH(TRIM(text))=0);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.1.ruler.sun', '', 'ru-RU', 'Управитель 1-го дома — Солнце: его положение (знак/дом/аспекты) уточняет стиль и стратегию по теме 1-го дома.', 84, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.1.ruler.sun' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Управитель 1-го дома — Луна: его положение (знак/дом/аспекты) уточняет стиль и стратегию по теме 1-го дома.', priority = 84, is_active = 1, meta_json = '{}'
WHERE key = 'natal.house.1.ruler.moon' AND locale = 'ru-RU'
  AND (topic_category = '' OR topic_category IS NULL)
  AND (text IS NULL OR LENGTH(TRIM(text))=0);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.1.ruler.moon', '', 'ru-RU', 'Управитель 1-го дома — Луна: его положение (знак/дом/аспекты) уточняет стиль и стратегию по теме 1-го дома.', 84, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.1.ruler.moon' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Управитель 1-го дома — Меркурий: его положение (знак/дом/аспекты) уточняет стиль и стратегию по теме 1-го дома.', priority = 84, is_active = 1, meta_json = '{}'
WHERE key = 'natal.house.1.ruler.mercury' AND locale = 'ru-RU'
  AND (topic_category = '' OR topic_category IS NULL)
  AND (text IS NULL OR LENGTH(TRIM(text))=0);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.1.ruler.mercury', '', 'ru-RU', 'Управитель 1-го дома — Меркурий: его положение (знак/дом/аспекты) уточняет стиль и стратегию по теме 1-го дома.', 84, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.1.ruler.mercury' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Управитель 1-го дома — Венера: его положение (знак/дом/аспекты) уточняет стиль и стратегию по теме 1-го дома.', priority = 84, is_active = 1, meta_json = '{}'
WHERE key = 'natal.house.1.ruler.venus' AND locale = 'ru-RU'
  AND (topic_category = '' OR topic_category IS NULL)
  AND (text IS NULL OR LENGTH(TRIM(text))=0);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.1.ruler.venus', '', 'ru-RU', 'Управитель 1-го дома — Венера: его положение (знак/дом/аспекты) уточняет стиль и стратегию по теме 1-го дома.', 84, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.1.ruler.venus' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Управитель 1-го дома — Марс: его положение (знак/дом/аспекты) уточняет стиль и стратегию по теме 1-го дома.', priority = 84, is_active = 1, meta_json = '{}'
WHERE key = 'natal.house.1.ruler.mars' AND locale = 'ru-RU'
  AND (topic_category = '' OR topic_category IS NULL)
  AND (text IS NULL OR LENGTH(TRIM(text))=0);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.1.ruler.mars', '', 'ru-RU', 'Управитель 1-го дома — Марс: его положение (знак/дом/аспекты) уточняет стиль и стратегию по теме 1-го дома.', 84, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.1.ruler.mars' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Управитель 1-го дома — Юпитер: его положение (знак/дом/аспекты) уточняет стиль и стратегию по теме 1-го дома.', priority = 84, is_active = 1, meta_json = '{}'
WHERE key = 'natal.house.1.ruler.jupiter' AND locale = 'ru-RU'
  AND (topic_category = '' OR topic_category IS NULL)
  AND (text IS NULL OR LENGTH(TRIM(text))=0);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.1.ruler.jupiter', '', 'ru-RU', 'Управитель 1-го дома — Юпитер: его положение (знак/дом/аспекты) уточняет стиль и стратегию по теме 1-го дома.', 84, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.1.ruler.jupiter' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Управитель 1-го дома — Сатурн: его положение (знак/дом/аспекты) уточняет стиль и стратегию по теме 1-го дома.', priority = 84, is_active = 1, meta_json = '{}'
WHERE key = 'natal.house.1.ruler.saturn' AND locale = 'ru-RU'
  AND (topic_category = '' OR topic_category IS NULL)
  AND (text IS NULL OR LENGTH(TRIM(text))=0);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.1.ruler.saturn', '', 'ru-RU', 'Управитель 1-го дома — Сатурн: его положение (знак/дом/аспекты) уточняет стиль и стратегию по теме 1-го дома.', 84, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.1.ruler.saturn' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Управитель 1-го дома — Уран: его положение (знак/дом/аспекты) уточняет стиль и стратегию по теме 1-го дома.', priority = 84, is_active = 1, meta_json = '{}'
WHERE key = 'natal.house.1.ruler.uranus' AND locale = 'ru-RU'
  AND (topic_category = '' OR topic_category IS NULL)
  AND (text IS NULL OR LENGTH(TRIM(text))=0);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.1.ruler.uranus', '', 'ru-RU', 'Управитель 1-го дома — Уран: его положение (знак/дом/аспекты) уточняет стиль и стратегию по теме 1-го дома.', 84, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.1.ruler.uranus' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Управитель 1-го дома — Нептун: его положение (знак/дом/аспекты) уточняет стиль и стратегию по теме 1-го дома.', priority = 84, is_active = 1, meta_json = '{}'
WHERE key = 'natal.house.1.ruler.neptune' AND locale = 'ru-RU'
  AND (topic_category = '' OR topic_category IS NULL)
  AND (text IS NULL OR LENGTH(TRIM(text))=0);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.1.ruler.neptune', '', 'ru-RU', 'Управитель 1-го дома — Нептун: его положение (знак/дом/аспекты) уточняет стиль и стратегию по теме 1-го дома.', 84, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.1.ruler.neptune' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Управитель 1-го дома — Плутон: его положение (знак/дом/аспекты) уточняет стиль и стратегию по теме 1-го дома.', priority = 84, is_active = 1, meta_json = '{}'
WHERE key = 'natal.house.1.ruler.pluto' AND locale = 'ru-RU'
  AND (topic_category = '' OR topic_category IS NULL)
  AND (text IS NULL OR LENGTH(TRIM(text))=0);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.1.ruler.pluto', '', 'ru-RU', 'Управитель 1-го дома — Плутон: его положение (знак/дом/аспекты) уточняет стиль и стратегию по теме 1-го дома.', 84, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.1.ruler.pluto' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Управитель 2-го дома: планета, которая показывает «как» и «через что» реализуется тема 2-го дома.', priority = 84, is_active = 1, meta_json = '{}'
WHERE key = 'natal.house.2.ruler.any' AND locale = 'ru-RU'
  AND (topic_category = '' OR topic_category IS NULL)
  AND (text IS NULL OR LENGTH(TRIM(text))=0);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.2.ruler.any', '', 'ru-RU', 'Управитель 2-го дома: планета, которая показывает «как» и «через что» реализуется тема 2-го дома.', 84, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.2.ruler.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Управитель 2-го дома — Солнце: его положение (знак/дом/аспекты) уточняет стиль и стратегию по теме 2-го дома.', priority = 84, is_active = 1, meta_json = '{}'
WHERE key = 'natal.house.2.ruler.sun' AND locale = 'ru-RU'
  AND (topic_category = '' OR topic_category IS NULL)
  AND (text IS NULL OR LENGTH(TRIM(text))=0);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.2.ruler.sun', '', 'ru-RU', 'Управитель 2-го дома — Солнце: его положение (знак/дом/аспекты) уточняет стиль и стратегию по теме 2-го дома.', 84, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.2.ruler.sun' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Управитель 2-го дома — Луна: его положение (знак/дом/аспекты) уточняет стиль и стратегию по теме 2-го дома.', priority = 84, is_active = 1, meta_json = '{}'
WHERE key = 'natal.house.2.ruler.moon' AND locale = 'ru-RU'
  AND (topic_category = '' OR topic_category IS NULL)
  AND (text IS NULL OR LENGTH(TRIM(text))=0);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.2.ruler.moon', '', 'ru-RU', 'Управитель 2-го дома — Луна: его положение (знак/дом/аспекты) уточняет стиль и стратегию по теме 2-го дома.', 84, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.2.ruler.moon' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Управитель 2-го дома — Меркурий: его положение (знак/дом/аспекты) уточняет стиль и стратегию по теме 2-го дома.', priority = 84, is_active = 1, meta_json = '{}'
WHERE key = 'natal.house.2.ruler.mercury' AND locale = 'ru-RU'
  AND (topic_category = '' OR topic_category IS NULL)
  AND (text IS NULL OR LENGTH(TRIM(text))=0);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.2.ruler.mercury', '', 'ru-RU', 'Управитель 2-го дома — Меркурий: его положение (знак/дом/аспекты) уточняет стиль и стратегию по теме 2-го дома.', 84, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.2.ruler.mercury' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Управитель 2-го дома — Венера: его положение (знак/дом/аспекты) уточняет стиль и стратегию по теме 2-го дома.', priority = 84, is_active = 1, meta_json = '{}'
WHERE key = 'natal.house.2.ruler.venus' AND locale = 'ru-RU'
  AND (topic_category = '' OR topic_category IS NULL)
  AND (text IS NULL OR LENGTH(TRIM(text))=0);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.2.ruler.venus', '', 'ru-RU', 'Управитель 2-го дома — Венера: его положение (знак/дом/аспекты) уточняет стиль и стратегию по теме 2-го дома.', 84, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.2.ruler.venus' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Управитель 2-го дома — Марс: его положение (знак/дом/аспекты) уточняет стиль и стратегию по теме 2-го дома.', priority = 84, is_active = 1, meta_json = '{}'
WHERE key = 'natal.house.2.ruler.mars' AND locale = 'ru-RU'
  AND (topic_category = '' OR topic_category IS NULL)
  AND (text IS NULL OR LENGTH(TRIM(text))=0);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.2.ruler.mars', '', 'ru-RU', 'Управитель 2-го дома — Марс: его положение (знак/дом/аспекты) уточняет стиль и стратегию по теме 2-го дома.', 84, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.2.ruler.mars' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Управитель 2-го дома — Юпитер: его положение (знак/дом/аспекты) уточняет стиль и стратегию по теме 2-го дома.', priority = 84, is_active = 1, meta_json = '{}'
WHERE key = 'natal.house.2.ruler.jupiter' AND locale = 'ru-RU'
  AND (topic_category = '' OR topic_category IS NULL)
  AND (text IS NULL OR LENGTH(TRIM(text))=0);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.2.ruler.jupiter', '', 'ru-RU', 'Управитель 2-го дома — Юпитер: его положение (знак/дом/аспекты) уточняет стиль и стратегию по теме 2-го дома.', 84, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.2.ruler.jupiter' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Управитель 2-го дома — Сатурн: его положение (знак/дом/аспекты) уточняет стиль и стратегию по теме 2-го дома.', priority = 84, is_active = 1, meta_json = '{}'
WHERE key = 'natal.house.2.ruler.saturn' AND locale = 'ru-RU'
  AND (topic_category = '' OR topic_category IS NULL)
  AND (text IS NULL OR LENGTH(TRIM(text))=0);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.2.ruler.saturn', '', 'ru-RU', 'Управитель 2-го дома — Сатурн: его положение (знак/дом/аспекты) уточняет стиль и стратегию по теме 2-го дома.', 84, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.2.ruler.saturn' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Управитель 2-го дома — Уран: его положение (знак/дом/аспекты) уточняет стиль и стратегию по теме 2-го дома.', priority = 84, is_active = 1, meta_json = '{}'
WHERE key = 'natal.house.2.ruler.uranus' AND locale = 'ru-RU'
  AND (topic_category = '' OR topic_category IS NULL)
  AND (text IS NULL OR LENGTH(TRIM(text))=0);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.2.ruler.uranus', '', 'ru-RU', 'Управитель 2-го дома — Уран: его положение (знак/дом/аспекты) уточняет стиль и стратегию по теме 2-го дома.', 84, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.2.ruler.uranus' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Управитель 2-го дома — Нептун: его положение (знак/дом/аспекты) уточняет стиль и стратегию по теме 2-го дома.', priority = 84, is_active = 1, meta_json = '{}'
WHERE key = 'natal.house.2.ruler.neptune' AND locale = 'ru-RU'
  AND (topic_category = '' OR topic_category IS NULL)
  AND (text IS NULL OR LENGTH(TRIM(text))=0);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.2.ruler.neptune', '', 'ru-RU', 'Управитель 2-го дома — Нептун: его положение (знак/дом/аспекты) уточняет стиль и стратегию по теме 2-го дома.', 84, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.2.ruler.neptune' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Управитель 2-го дома — Плутон: его положение (знак/дом/аспекты) уточняет стиль и стратегию по теме 2-го дома.', priority = 84, is_active = 1, meta_json = '{}'
WHERE key = 'natal.house.2.ruler.pluto' AND locale = 'ru-RU'
  AND (topic_category = '' OR topic_category IS NULL)
  AND (text IS NULL OR LENGTH(TRIM(text))=0);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.2.ruler.pluto', '', 'ru-RU', 'Управитель 2-го дома — Плутон: его положение (знак/дом/аспекты) уточняет стиль и стратегию по теме 2-го дома.', 84, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.2.ruler.pluto' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Управитель 3-го дома: планета, которая показывает «как» и «через что» реализуется тема 3-го дома.', priority = 84, is_active = 1, meta_json = '{}'
WHERE key = 'natal.house.3.ruler.any' AND locale = 'ru-RU'
  AND (topic_category = '' OR topic_category IS NULL)
  AND (text IS NULL OR LENGTH(TRIM(text))=0);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.3.ruler.any', '', 'ru-RU', 'Управитель 3-го дома: планета, которая показывает «как» и «через что» реализуется тема 3-го дома.', 84, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.3.ruler.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Управитель 3-го дома — Солнце: его положение (знак/дом/аспекты) уточняет стиль и стратегию по теме 3-го дома.', priority = 84, is_active = 1, meta_json = '{}'
WHERE key = 'natal.house.3.ruler.sun' AND locale = 'ru-RU'
  AND (topic_category = '' OR topic_category IS NULL)
  AND (text IS NULL OR LENGTH(TRIM(text))=0);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.3.ruler.sun', '', 'ru-RU', 'Управитель 3-го дома — Солнце: его положение (знак/дом/аспекты) уточняет стиль и стратегию по теме 3-го дома.', 84, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.3.ruler.sun' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Управитель 3-го дома — Луна: его положение (знак/дом/аспекты) уточняет стиль и стратегию по теме 3-го дома.', priority = 84, is_active = 1, meta_json = '{}'
WHERE key = 'natal.house.3.ruler.moon' AND locale = 'ru-RU'
  AND (topic_category = '' OR topic_category IS NULL)
  AND (text IS NULL OR LENGTH(TRIM(text))=0);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.3.ruler.moon', '', 'ru-RU', 'Управитель 3-го дома — Луна: его положение (знак/дом/аспекты) уточняет стиль и стратегию по теме 3-го дома.', 84, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.3.ruler.moon' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Управитель 3-го дома — Меркурий: его положение (знак/дом/аспекты) уточняет стиль и стратегию по теме 3-го дома.', priority = 84, is_active = 1, meta_json = '{}'
WHERE key = 'natal.house.3.ruler.mercury' AND locale = 'ru-RU'
  AND (topic_category = '' OR topic_category IS NULL)
  AND (text IS NULL OR LENGTH(TRIM(text))=0);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.3.ruler.mercury', '', 'ru-RU', 'Управитель 3-го дома — Меркурий: его положение (знак/дом/аспекты) уточняет стиль и стратегию по теме 3-го дома.', 84, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.3.ruler.mercury' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Управитель 3-го дома — Венера: его положение (знак/дом/аспекты) уточняет стиль и стратегию по теме 3-го дома.', priority = 84, is_active = 1, meta_json = '{}'
WHERE key = 'natal.house.3.ruler.venus' AND locale = 'ru-RU'
  AND (topic_category = '' OR topic_category IS NULL)
  AND (text IS NULL OR LENGTH(TRIM(text))=0);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.3.ruler.venus', '', 'ru-RU', 'Управитель 3-го дома — Венера: его положение (знак/дом/аспекты) уточняет стиль и стратегию по теме 3-го дома.', 84, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.3.ruler.venus' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Управитель 3-го дома — Марс: его положение (знак/дом/аспекты) уточняет стиль и стратегию по теме 3-го дома.', priority = 84, is_active = 1, meta_json = '{}'
WHERE key = 'natal.house.3.ruler.mars' AND locale = 'ru-RU'
  AND (topic_category = '' OR topic_category IS NULL)
  AND (text IS NULL OR LENGTH(TRIM(text))=0);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.3.ruler.mars', '', 'ru-RU', 'Управитель 3-го дома — Марс: его положение (знак/дом/аспекты) уточняет стиль и стратегию по теме 3-го дома.', 84, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.3.ruler.mars' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Управитель 3-го дома — Юпитер: его положение (знак/дом/аспекты) уточняет стиль и стратегию по теме 3-го дома.', priority = 84, is_active = 1, meta_json = '{}'
WHERE key = 'natal.house.3.ruler.jupiter' AND locale = 'ru-RU'
  AND (topic_category = '' OR topic_category IS NULL)
  AND (text IS NULL OR LENGTH(TRIM(text))=0);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.3.ruler.jupiter', '', 'ru-RU', 'Управитель 3-го дома — Юпитер: его положение (знак/дом/аспекты) уточняет стиль и стратегию по теме 3-го дома.', 84, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.3.ruler.jupiter' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Управитель 3-го дома — Сатурн: его положение (знак/дом/аспекты) уточняет стиль и стратегию по теме 3-го дома.', priority = 84, is_active = 1, meta_json = '{}'
WHERE key = 'natal.house.3.ruler.saturn' AND locale = 'ru-RU'
  AND (topic_category = '' OR topic_category IS NULL)
  AND (text IS NULL OR LENGTH(TRIM(text))=0);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.3.ruler.saturn', '', 'ru-RU', 'Управитель 3-го дома — Сатурн: его положение (знак/дом/аспекты) уточняет стиль и стратегию по теме 3-го дома.', 84, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.3.ruler.saturn' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Управитель 3-го дома — Уран: его положение (знак/дом/аспекты) уточняет стиль и стратегию по теме 3-го дома.', priority = 84, is_active = 1, meta_json = '{}'
WHERE key = 'natal.house.3.ruler.uranus' AND locale = 'ru-RU'
  AND (topic_category = '' OR topic_category IS NULL)
  AND (text IS NULL OR LENGTH(TRIM(text))=0);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.3.ruler.uranus', '', 'ru-RU', 'Управитель 3-го дома — Уран: его положение (знак/дом/аспекты) уточняет стиль и стратегию по теме 3-го дома.', 84, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.3.ruler.uranus' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Управитель 3-го дома — Нептун: его положение (знак/дом/аспекты) уточняет стиль и стратегию по теме 3-го дома.', priority = 84, is_active = 1, meta_json = '{}'
WHERE key = 'natal.house.3.ruler.neptune' AND locale = 'ru-RU'
  AND (topic_category = '' OR topic_category IS NULL)
  AND (text IS NULL OR LENGTH(TRIM(text))=0);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.3.ruler.neptune', '', 'ru-RU', 'Управитель 3-го дома — Нептун: его положение (знак/дом/аспекты) уточняет стиль и стратегию по теме 3-го дома.', 84, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.3.ruler.neptune' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Управитель 3-го дома — Плутон: его положение (знак/дом/аспекты) уточняет стиль и стратегию по теме 3-го дома.', priority = 84, is_active = 1, meta_json = '{}'
WHERE key = 'natal.house.3.ruler.pluto' AND locale = 'ru-RU'
  AND (topic_category = '' OR topic_category IS NULL)
  AND (text IS NULL OR LENGTH(TRIM(text))=0);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.3.ruler.pluto', '', 'ru-RU', 'Управитель 3-го дома — Плутон: его положение (знак/дом/аспекты) уточняет стиль и стратегию по теме 3-го дома.', 84, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.3.ruler.pluto' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Управитель 4-го дома: планета, которая показывает «как» и «через что» реализуется тема 4-го дома.', priority = 84, is_active = 1, meta_json = '{}'
WHERE key = 'natal.house.4.ruler.any' AND locale = 'ru-RU'
  AND (topic_category = '' OR topic_category IS NULL)
  AND (text IS NULL OR LENGTH(TRIM(text))=0);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.4.ruler.any', '', 'ru-RU', 'Управитель 4-го дома: планета, которая показывает «как» и «через что» реализуется тема 4-го дома.', 84, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.4.ruler.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Управитель 4-го дома — Солнце: его положение (знак/дом/аспекты) уточняет стиль и стратегию по теме 4-го дома.', priority = 84, is_active = 1, meta_json = '{}'
WHERE key = 'natal.house.4.ruler.sun' AND locale = 'ru-RU'
  AND (topic_category = '' OR topic_category IS NULL)
  AND (text IS NULL OR LENGTH(TRIM(text))=0);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.4.ruler.sun', '', 'ru-RU', 'Управитель 4-го дома — Солнце: его положение (знак/дом/аспекты) уточняет стиль и стратегию по теме 4-го дома.', 84, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.4.ruler.sun' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Управитель 4-го дома — Луна: его положение (знак/дом/аспекты) уточняет стиль и стратегию по теме 4-го дома.', priority = 84, is_active = 1, meta_json = '{}'
WHERE key = 'natal.house.4.ruler.moon' AND locale = 'ru-RU'
  AND (topic_category = '' OR topic_category IS NULL)
  AND (text IS NULL OR LENGTH(TRIM(text))=0);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.4.ruler.moon', '', 'ru-RU', 'Управитель 4-го дома — Луна: его положение (знак/дом/аспекты) уточняет стиль и стратегию по теме 4-го дома.', 84, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.4.ruler.moon' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Управитель 4-го дома — Меркурий: его положение (знак/дом/аспекты) уточняет стиль и стратегию по теме 4-го дома.', priority = 84, is_active = 1, meta_json = '{}'
WHERE key = 'natal.house.4.ruler.mercury' AND locale = 'ru-RU'
  AND (topic_category = '' OR topic_category IS NULL)
  AND (text IS NULL OR LENGTH(TRIM(text))=0);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.4.ruler.mercury', '', 'ru-RU', 'Управитель 4-го дома — Меркурий: его положение (знак/дом/аспекты) уточняет стиль и стратегию по теме 4-го дома.', 84, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.4.ruler.mercury' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Управитель 4-го дома — Венера: его положение (знак/дом/аспекты) уточняет стиль и стратегию по теме 4-го дома.', priority = 84, is_active = 1, meta_json = '{}'
WHERE key = 'natal.house.4.ruler.venus' AND locale = 'ru-RU'
  AND (topic_category = '' OR topic_category IS NULL)
  AND (text IS NULL OR LENGTH(TRIM(text))=0);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.4.ruler.venus', '', 'ru-RU', 'Управитель 4-го дома — Венера: его положение (знак/дом/аспекты) уточняет стиль и стратегию по теме 4-го дома.', 84, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.4.ruler.venus' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Управитель 4-го дома — Марс: его положение (знак/дом/аспекты) уточняет стиль и стратегию по теме 4-го дома.', priority = 84, is_active = 1, meta_json = '{}'
WHERE key = 'natal.house.4.ruler.mars' AND locale = 'ru-RU'
  AND (topic_category = '' OR topic_category IS NULL)
  AND (text IS NULL OR LENGTH(TRIM(text))=0);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.4.ruler.mars', '', 'ru-RU', 'Управитель 4-го дома — Марс: его положение (знак/дом/аспекты) уточняет стиль и стратегию по теме 4-го дома.', 84, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.4.ruler.mars' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Управитель 4-го дома — Юпитер: его положение (знак/дом/аспекты) уточняет стиль и стратегию по теме 4-го дома.', priority = 84, is_active = 1, meta_json = '{}'
WHERE key = 'natal.house.4.ruler.jupiter' AND locale = 'ru-RU'
  AND (topic_category = '' OR topic_category IS NULL)
  AND (text IS NULL OR LENGTH(TRIM(text))=0);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.4.ruler.jupiter', '', 'ru-RU', 'Управитель 4-го дома — Юпитер: его положение (знак/дом/аспекты) уточняет стиль и стратегию по теме 4-го дома.', 84, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.4.ruler.jupiter' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Управитель 4-го дома — Сатурн: его положение (знак/дом/аспекты) уточняет стиль и стратегию по теме 4-го дома.', priority = 84, is_active = 1, meta_json = '{}'
WHERE key = 'natal.house.4.ruler.saturn' AND locale = 'ru-RU'
  AND (topic_category = '' OR topic_category IS NULL)
  AND (text IS NULL OR LENGTH(TRIM(text))=0);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.4.ruler.saturn', '', 'ru-RU', 'Управитель 4-го дома — Сатурн: его положение (знак/дом/аспекты) уточняет стиль и стратегию по теме 4-го дома.', 84, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.4.ruler.saturn' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Управитель 4-го дома — Уран: его положение (знак/дом/аспекты) уточняет стиль и стратегию по теме 4-го дома.', priority = 84, is_active = 1, meta_json = '{}'
WHERE key = 'natal.house.4.ruler.uranus' AND locale = 'ru-RU'
  AND (topic_category = '' OR topic_category IS NULL)
  AND (text IS NULL OR LENGTH(TRIM(text))=0);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.4.ruler.uranus', '', 'ru-RU', 'Управитель 4-го дома — Уран: его положение (знак/дом/аспекты) уточняет стиль и стратегию по теме 4-го дома.', 84, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.4.ruler.uranus' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Управитель 4-го дома — Нептун: его положение (знак/дом/аспекты) уточняет стиль и стратегию по теме 4-го дома.', priority = 84, is_active = 1, meta_json = '{}'
WHERE key = 'natal.house.4.ruler.neptune' AND locale = 'ru-RU'
  AND (topic_category = '' OR topic_category IS NULL)
  AND (text IS NULL OR LENGTH(TRIM(text))=0);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.4.ruler.neptune', '', 'ru-RU', 'Управитель 4-го дома — Нептун: его положение (знак/дом/аспекты) уточняет стиль и стратегию по теме 4-го дома.', 84, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.4.ruler.neptune' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Управитель 4-го дома — Плутон: его положение (знак/дом/аспекты) уточняет стиль и стратегию по теме 4-го дома.', priority = 84, is_active = 1, meta_json = '{}'
WHERE key = 'natal.house.4.ruler.pluto' AND locale = 'ru-RU'
  AND (topic_category = '' OR topic_category IS NULL)
  AND (text IS NULL OR LENGTH(TRIM(text))=0);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.4.ruler.pluto', '', 'ru-RU', 'Управитель 4-го дома — Плутон: его положение (знак/дом/аспекты) уточняет стиль и стратегию по теме 4-го дома.', 84, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.4.ruler.pluto' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Управитель 5-го дома: планета, которая показывает «как» и «через что» реализуется тема 5-го дома.', priority = 84, is_active = 1, meta_json = '{}'
WHERE key = 'natal.house.5.ruler.any' AND locale = 'ru-RU'
  AND (topic_category = '' OR topic_category IS NULL)
  AND (text IS NULL OR LENGTH(TRIM(text))=0);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.5.ruler.any', '', 'ru-RU', 'Управитель 5-го дома: планета, которая показывает «как» и «через что» реализуется тема 5-го дома.', 84, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.5.ruler.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Управитель 5-го дома — Солнце: его положение (знак/дом/аспекты) уточняет стиль и стратегию по теме 5-го дома.', priority = 84, is_active = 1, meta_json = '{}'
WHERE key = 'natal.house.5.ruler.sun' AND locale = 'ru-RU'
  AND (topic_category = '' OR topic_category IS NULL)
  AND (text IS NULL OR LENGTH(TRIM(text))=0);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.5.ruler.sun', '', 'ru-RU', 'Управитель 5-го дома — Солнце: его положение (знак/дом/аспекты) уточняет стиль и стратегию по теме 5-го дома.', 84, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.5.ruler.sun' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Управитель 5-го дома — Луна: его положение (знак/дом/аспекты) уточняет стиль и стратегию по теме 5-го дома.', priority = 84, is_active = 1, meta_json = '{}'
WHERE key = 'natal.house.5.ruler.moon' AND locale = 'ru-RU'
  AND (topic_category = '' OR topic_category IS NULL)
  AND (text IS NULL OR LENGTH(TRIM(text))=0);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.5.ruler.moon', '', 'ru-RU', 'Управитель 5-го дома — Луна: его положение (знак/дом/аспекты) уточняет стиль и стратегию по теме 5-го дома.', 84, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.5.ruler.moon' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Управитель 5-го дома — Меркурий: его положение (знак/дом/аспекты) уточняет стиль и стратегию по теме 5-го дома.', priority = 84, is_active = 1, meta_json = '{}'
WHERE key = 'natal.house.5.ruler.mercury' AND locale = 'ru-RU'
  AND (topic_category = '' OR topic_category IS NULL)
  AND (text IS NULL OR LENGTH(TRIM(text))=0);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.5.ruler.mercury', '', 'ru-RU', 'Управитель 5-го дома — Меркурий: его положение (знак/дом/аспекты) уточняет стиль и стратегию по теме 5-го дома.', 84, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.5.ruler.mercury' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Управитель 5-го дома — Венера: его положение (знак/дом/аспекты) уточняет стиль и стратегию по теме 5-го дома.', priority = 84, is_active = 1, meta_json = '{}'
WHERE key = 'natal.house.5.ruler.venus' AND locale = 'ru-RU'
  AND (topic_category = '' OR topic_category IS NULL)
  AND (text IS NULL OR LENGTH(TRIM(text))=0);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.5.ruler.venus', '', 'ru-RU', 'Управитель 5-го дома — Венера: его положение (знак/дом/аспекты) уточняет стиль и стратегию по теме 5-го дома.', 84, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.5.ruler.venus' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Управитель 5-го дома — Марс: его положение (знак/дом/аспекты) уточняет стиль и стратегию по теме 5-го дома.', priority = 84, is_active = 1, meta_json = '{}'
WHERE key = 'natal.house.5.ruler.mars' AND locale = 'ru-RU'
  AND (topic_category = '' OR topic_category IS NULL)
  AND (text IS NULL OR LENGTH(TRIM(text))=0);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.5.ruler.mars', '', 'ru-RU', 'Управитель 5-го дома — Марс: его положение (знак/дом/аспекты) уточняет стиль и стратегию по теме 5-го дома.', 84, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.5.ruler.mars' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Управитель 5-го дома — Юпитер: его положение (знак/дом/аспекты) уточняет стиль и стратегию по теме 5-го дома.', priority = 84, is_active = 1, meta_json = '{}'
WHERE key = 'natal.house.5.ruler.jupiter' AND locale = 'ru-RU'
  AND (topic_category = '' OR topic_category IS NULL)
  AND (text IS NULL OR LENGTH(TRIM(text))=0);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.5.ruler.jupiter', '', 'ru-RU', 'Управитель 5-го дома — Юпитер: его положение (знак/дом/аспекты) уточняет стиль и стратегию по теме 5-го дома.', 84, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.5.ruler.jupiter' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Управитель 5-го дома — Сатурн: его положение (знак/дом/аспекты) уточняет стиль и стратегию по теме 5-го дома.', priority = 84, is_active = 1, meta_json = '{}'
WHERE key = 'natal.house.5.ruler.saturn' AND locale = 'ru-RU'
  AND (topic_category = '' OR topic_category IS NULL)
  AND (text IS NULL OR LENGTH(TRIM(text))=0);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.5.ruler.saturn', '', 'ru-RU', 'Управитель 5-го дома — Сатурн: его положение (знак/дом/аспекты) уточняет стиль и стратегию по теме 5-го дома.', 84, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.5.ruler.saturn' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Управитель 5-го дома — Уран: его положение (знак/дом/аспекты) уточняет стиль и стратегию по теме 5-го дома.', priority = 84, is_active = 1, meta_json = '{}'
WHERE key = 'natal.house.5.ruler.uranus' AND locale = 'ru-RU'
  AND (topic_category = '' OR topic_category IS NULL)
  AND (text IS NULL OR LENGTH(TRIM(text))=0);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.5.ruler.uranus', '', 'ru-RU', 'Управитель 5-го дома — Уран: его положение (знак/дом/аспекты) уточняет стиль и стратегию по теме 5-го дома.', 84, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.5.ruler.uranus' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Управитель 5-го дома — Нептун: его положение (знак/дом/аспекты) уточняет стиль и стратегию по теме 5-го дома.', priority = 84, is_active = 1, meta_json = '{}'
WHERE key = 'natal.house.5.ruler.neptune' AND locale = 'ru-RU'
  AND (topic_category = '' OR topic_category IS NULL)
  AND (text IS NULL OR LENGTH(TRIM(text))=0);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.5.ruler.neptune', '', 'ru-RU', 'Управитель 5-го дома — Нептун: его положение (знак/дом/аспекты) уточняет стиль и стратегию по теме 5-го дома.', 84, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.5.ruler.neptune' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Управитель 5-го дома — Плутон: его положение (знак/дом/аспекты) уточняет стиль и стратегию по теме 5-го дома.', priority = 84, is_active = 1, meta_json = '{}'
WHERE key = 'natal.house.5.ruler.pluto' AND locale = 'ru-RU'
  AND (topic_category = '' OR topic_category IS NULL)
  AND (text IS NULL OR LENGTH(TRIM(text))=0);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.5.ruler.pluto', '', 'ru-RU', 'Управитель 5-го дома — Плутон: его положение (знак/дом/аспекты) уточняет стиль и стратегию по теме 5-го дома.', 84, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.5.ruler.pluto' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Управитель 6-го дома: планета, которая показывает «как» и «через что» реализуется тема 6-го дома.', priority = 84, is_active = 1, meta_json = '{}'
WHERE key = 'natal.house.6.ruler.any' AND locale = 'ru-RU'
  AND (topic_category = '' OR topic_category IS NULL)
  AND (text IS NULL OR LENGTH(TRIM(text))=0);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.6.ruler.any', '', 'ru-RU', 'Управитель 6-го дома: планета, которая показывает «как» и «через что» реализуется тема 6-го дома.', 84, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.6.ruler.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Управитель 6-го дома — Солнце: его положение (знак/дом/аспекты) уточняет стиль и стратегию по теме 6-го дома.', priority = 84, is_active = 1, meta_json = '{}'
WHERE key = 'natal.house.6.ruler.sun' AND locale = 'ru-RU'
  AND (topic_category = '' OR topic_category IS NULL)
  AND (text IS NULL OR LENGTH(TRIM(text))=0);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.6.ruler.sun', '', 'ru-RU', 'Управитель 6-го дома — Солнце: его положение (знак/дом/аспекты) уточняет стиль и стратегию по теме 6-го дома.', 84, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.6.ruler.sun' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Управитель 6-го дома — Луна: его положение (знак/дом/аспекты) уточняет стиль и стратегию по теме 6-го дома.', priority = 84, is_active = 1, meta_json = '{}'
WHERE key = 'natal.house.6.ruler.moon' AND locale = 'ru-RU'
  AND (topic_category = '' OR topic_category IS NULL)
  AND (text IS NULL OR LENGTH(TRIM(text))=0);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.6.ruler.moon', '', 'ru-RU', 'Управитель 6-го дома — Луна: его положение (знак/дом/аспекты) уточняет стиль и стратегию по теме 6-го дома.', 84, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.6.ruler.moon' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Управитель 6-го дома — Меркурий: его положение (знак/дом/аспекты) уточняет стиль и стратегию по теме 6-го дома.', priority = 84, is_active = 1, meta_json = '{}'
WHERE key = 'natal.house.6.ruler.mercury' AND locale = 'ru-RU'
  AND (topic_category = '' OR topic_category IS NULL)
  AND (text IS NULL OR LENGTH(TRIM(text))=0);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.6.ruler.mercury', '', 'ru-RU', 'Управитель 6-го дома — Меркурий: его положение (знак/дом/аспекты) уточняет стиль и стратегию по теме 6-го дома.', 84, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.6.ruler.mercury' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Управитель 6-го дома — Венера: его положение (знак/дом/аспекты) уточняет стиль и стратегию по теме 6-го дома.', priority = 84, is_active = 1, meta_json = '{}'
WHERE key = 'natal.house.6.ruler.venus' AND locale = 'ru-RU'
  AND (topic_category = '' OR topic_category IS NULL)
  AND (text IS NULL OR LENGTH(TRIM(text))=0);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.6.ruler.venus', '', 'ru-RU', 'Управитель 6-го дома — Венера: его положение (знак/дом/аспекты) уточняет стиль и стратегию по теме 6-го дома.', 84, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.6.ruler.venus' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Управитель 6-го дома — Марс: его положение (знак/дом/аспекты) уточняет стиль и стратегию по теме 6-го дома.', priority = 84, is_active = 1, meta_json = '{}'
WHERE key = 'natal.house.6.ruler.mars' AND locale = 'ru-RU'
  AND (topic_category = '' OR topic_category IS NULL)
  AND (text IS NULL OR LENGTH(TRIM(text))=0);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.6.ruler.mars', '', 'ru-RU', 'Управитель 6-го дома — Марс: его положение (знак/дом/аспекты) уточняет стиль и стратегию по теме 6-го дома.', 84, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.6.ruler.mars' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Управитель 6-го дома — Юпитер: его положение (знак/дом/аспекты) уточняет стиль и стратегию по теме 6-го дома.', priority = 84, is_active = 1, meta_json = '{}'
WHERE key = 'natal.house.6.ruler.jupiter' AND locale = 'ru-RU'
  AND (topic_category = '' OR topic_category IS NULL)
  AND (text IS NULL OR LENGTH(TRIM(text))=0);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.6.ruler.jupiter', '', 'ru-RU', 'Управитель 6-го дома — Юпитер: его положение (знак/дом/аспекты) уточняет стиль и стратегию по теме 6-го дома.', 84, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.6.ruler.jupiter' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Управитель 6-го дома — Сатурн: его положение (знак/дом/аспекты) уточняет стиль и стратегию по теме 6-го дома.', priority = 84, is_active = 1, meta_json = '{}'
WHERE key = 'natal.house.6.ruler.saturn' AND locale = 'ru-RU'
  AND (topic_category = '' OR topic_category IS NULL)
  AND (text IS NULL OR LENGTH(TRIM(text))=0);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.6.ruler.saturn', '', 'ru-RU', 'Управитель 6-го дома — Сатурн: его положение (знак/дом/аспекты) уточняет стиль и стратегию по теме 6-го дома.', 84, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.6.ruler.saturn' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Управитель 6-го дома — Уран: его положение (знак/дом/аспекты) уточняет стиль и стратегию по теме 6-го дома.', priority = 84, is_active = 1, meta_json = '{}'
WHERE key = 'natal.house.6.ruler.uranus' AND locale = 'ru-RU'
  AND (topic_category = '' OR topic_category IS NULL)
  AND (text IS NULL OR LENGTH(TRIM(text))=0);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.6.ruler.uranus', '', 'ru-RU', 'Управитель 6-го дома — Уран: его положение (знак/дом/аспекты) уточняет стиль и стратегию по теме 6-го дома.', 84, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.6.ruler.uranus' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Управитель 6-го дома — Нептун: его положение (знак/дом/аспекты) уточняет стиль и стратегию по теме 6-го дома.', priority = 84, is_active = 1, meta_json = '{}'
WHERE key = 'natal.house.6.ruler.neptune' AND locale = 'ru-RU'
  AND (topic_category = '' OR topic_category IS NULL)
  AND (text IS NULL OR LENGTH(TRIM(text))=0);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.6.ruler.neptune', '', 'ru-RU', 'Управитель 6-го дома — Нептун: его положение (знак/дом/аспекты) уточняет стиль и стратегию по теме 6-го дома.', 84, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.6.ruler.neptune' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Управитель 6-го дома — Плутон: его положение (знак/дом/аспекты) уточняет стиль и стратегию по теме 6-го дома.', priority = 84, is_active = 1, meta_json = '{}'
WHERE key = 'natal.house.6.ruler.pluto' AND locale = 'ru-RU'
  AND (topic_category = '' OR topic_category IS NULL)
  AND (text IS NULL OR LENGTH(TRIM(text))=0);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.6.ruler.pluto', '', 'ru-RU', 'Управитель 6-го дома — Плутон: его положение (знак/дом/аспекты) уточняет стиль и стратегию по теме 6-го дома.', 84, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.6.ruler.pluto' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Управитель 7-го дома: планета, которая показывает «как» и «через что» реализуется тема 7-го дома.', priority = 84, is_active = 1, meta_json = '{}'
WHERE key = 'natal.house.7.ruler.any' AND locale = 'ru-RU'
  AND (topic_category = '' OR topic_category IS NULL)
  AND (text IS NULL OR LENGTH(TRIM(text))=0);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.7.ruler.any', '', 'ru-RU', 'Управитель 7-го дома: планета, которая показывает «как» и «через что» реализуется тема 7-го дома.', 84, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.7.ruler.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Управитель 7-го дома — Солнце: его положение (знак/дом/аспекты) уточняет стиль и стратегию по теме 7-го дома.', priority = 84, is_active = 1, meta_json = '{}'
WHERE key = 'natal.house.7.ruler.sun' AND locale = 'ru-RU'
  AND (topic_category = '' OR topic_category IS NULL)
  AND (text IS NULL OR LENGTH(TRIM(text))=0);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.7.ruler.sun', '', 'ru-RU', 'Управитель 7-го дома — Солнце: его положение (знак/дом/аспекты) уточняет стиль и стратегию по теме 7-го дома.', 84, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.7.ruler.sun' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Управитель 7-го дома — Луна: его положение (знак/дом/аспекты) уточняет стиль и стратегию по теме 7-го дома.', priority = 84, is_active = 1, meta_json = '{}'
WHERE key = 'natal.house.7.ruler.moon' AND locale = 'ru-RU'
  AND (topic_category = '' OR topic_category IS NULL)
  AND (text IS NULL OR LENGTH(TRIM(text))=0);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.7.ruler.moon', '', 'ru-RU', 'Управитель 7-го дома — Луна: его положение (знак/дом/аспекты) уточняет стиль и стратегию по теме 7-го дома.', 84, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.7.ruler.moon' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Управитель 7-го дома — Меркурий: его положение (знак/дом/аспекты) уточняет стиль и стратегию по теме 7-го дома.', priority = 84, is_active = 1, meta_json = '{}'
WHERE key = 'natal.house.7.ruler.mercury' AND locale = 'ru-RU'
  AND (topic_category = '' OR topic_category IS NULL)
  AND (text IS NULL OR LENGTH(TRIM(text))=0);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.7.ruler.mercury', '', 'ru-RU', 'Управитель 7-го дома — Меркурий: его положение (знак/дом/аспекты) уточняет стиль и стратегию по теме 7-го дома.', 84, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.7.ruler.mercury' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Управитель 7-го дома — Венера: его положение (знак/дом/аспекты) уточняет стиль и стратегию по теме 7-го дома.', priority = 84, is_active = 1, meta_json = '{}'
WHERE key = 'natal.house.7.ruler.venus' AND locale = 'ru-RU'
  AND (topic_category = '' OR topic_category IS NULL)
  AND (text IS NULL OR LENGTH(TRIM(text))=0);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.7.ruler.venus', '', 'ru-RU', 'Управитель 7-го дома — Венера: его положение (знак/дом/аспекты) уточняет стиль и стратегию по теме 7-го дома.', 84, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.7.ruler.venus' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Управитель 7-го дома — Марс: его положение (знак/дом/аспекты) уточняет стиль и стратегию по теме 7-го дома.', priority = 84, is_active = 1, meta_json = '{}'
WHERE key = 'natal.house.7.ruler.mars' AND locale = 'ru-RU'
  AND (topic_category = '' OR topic_category IS NULL)
  AND (text IS NULL OR LENGTH(TRIM(text))=0);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.7.ruler.mars', '', 'ru-RU', 'Управитель 7-го дома — Марс: его положение (знак/дом/аспекты) уточняет стиль и стратегию по теме 7-го дома.', 84, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.7.ruler.mars' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Управитель 7-го дома — Юпитер: его положение (знак/дом/аспекты) уточняет стиль и стратегию по теме 7-го дома.', priority = 84, is_active = 1, meta_json = '{}'
WHERE key = 'natal.house.7.ruler.jupiter' AND locale = 'ru-RU'
  AND (topic_category = '' OR topic_category IS NULL)
  AND (text IS NULL OR LENGTH(TRIM(text))=0);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.7.ruler.jupiter', '', 'ru-RU', 'Управитель 7-го дома — Юпитер: его положение (знак/дом/аспекты) уточняет стиль и стратегию по теме 7-го дома.', 84, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.7.ruler.jupiter' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Управитель 7-го дома — Сатурн: его положение (знак/дом/аспекты) уточняет стиль и стратегию по теме 7-го дома.', priority = 84, is_active = 1, meta_json = '{}'
WHERE key = 'natal.house.7.ruler.saturn' AND locale = 'ru-RU'
  AND (topic_category = '' OR topic_category IS NULL)
  AND (text IS NULL OR LENGTH(TRIM(text))=0);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.7.ruler.saturn', '', 'ru-RU', 'Управитель 7-го дома — Сатурн: его положение (знак/дом/аспекты) уточняет стиль и стратегию по теме 7-го дома.', 84, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.7.ruler.saturn' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Управитель 7-го дома — Уран: его положение (знак/дом/аспекты) уточняет стиль и стратегию по теме 7-го дома.', priority = 84, is_active = 1, meta_json = '{}'
WHERE key = 'natal.house.7.ruler.uranus' AND locale = 'ru-RU'
  AND (topic_category = '' OR topic_category IS NULL)
  AND (text IS NULL OR LENGTH(TRIM(text))=0);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.7.ruler.uranus', '', 'ru-RU', 'Управитель 7-го дома — Уран: его положение (знак/дом/аспекты) уточняет стиль и стратегию по теме 7-го дома.', 84, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.7.ruler.uranus' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Управитель 7-го дома — Нептун: его положение (знак/дом/аспекты) уточняет стиль и стратегию по теме 7-го дома.', priority = 84, is_active = 1, meta_json = '{}'
WHERE key = 'natal.house.7.ruler.neptune' AND locale = 'ru-RU'
  AND (topic_category = '' OR topic_category IS NULL)
  AND (text IS NULL OR LENGTH(TRIM(text))=0);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.7.ruler.neptune', '', 'ru-RU', 'Управитель 7-го дома — Нептун: его положение (знак/дом/аспекты) уточняет стиль и стратегию по теме 7-го дома.', 84, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.7.ruler.neptune' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Управитель 7-го дома — Плутон: его положение (знак/дом/аспекты) уточняет стиль и стратегию по теме 7-го дома.', priority = 84, is_active = 1, meta_json = '{}'
WHERE key = 'natal.house.7.ruler.pluto' AND locale = 'ru-RU'
  AND (topic_category = '' OR topic_category IS NULL)
  AND (text IS NULL OR LENGTH(TRIM(text))=0);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.7.ruler.pluto', '', 'ru-RU', 'Управитель 7-го дома — Плутон: его положение (знак/дом/аспекты) уточняет стиль и стратегию по теме 7-го дома.', 84, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.7.ruler.pluto' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Управитель 8-го дома: планета, которая показывает «как» и «через что» реализуется тема 8-го дома.', priority = 84, is_active = 1, meta_json = '{}'
WHERE key = 'natal.house.8.ruler.any' AND locale = 'ru-RU'
  AND (topic_category = '' OR topic_category IS NULL)
  AND (text IS NULL OR LENGTH(TRIM(text))=0);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.8.ruler.any', '', 'ru-RU', 'Управитель 8-го дома: планета, которая показывает «как» и «через что» реализуется тема 8-го дома.', 84, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.8.ruler.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Управитель 8-го дома — Солнце: его положение (знак/дом/аспекты) уточняет стиль и стратегию по теме 8-го дома.', priority = 84, is_active = 1, meta_json = '{}'
WHERE key = 'natal.house.8.ruler.sun' AND locale = 'ru-RU'
  AND (topic_category = '' OR topic_category IS NULL)
  AND (text IS NULL OR LENGTH(TRIM(text))=0);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.8.ruler.sun', '', 'ru-RU', 'Управитель 8-го дома — Солнце: его положение (знак/дом/аспекты) уточняет стиль и стратегию по теме 8-го дома.', 84, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.8.ruler.sun' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Управитель 8-го дома — Луна: его положение (знак/дом/аспекты) уточняет стиль и стратегию по теме 8-го дома.', priority = 84, is_active = 1, meta_json = '{}'
WHERE key = 'natal.house.8.ruler.moon' AND locale = 'ru-RU'
  AND (topic_category = '' OR topic_category IS NULL)
  AND (text IS NULL OR LENGTH(TRIM(text))=0);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.8.ruler.moon', '', 'ru-RU', 'Управитель 8-го дома — Луна: его положение (знак/дом/аспекты) уточняет стиль и стратегию по теме 8-го дома.', 84, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.8.ruler.moon' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Управитель 8-го дома — Меркурий: его положение (знак/дом/аспекты) уточняет стиль и стратегию по теме 8-го дома.', priority = 84, is_active = 1, meta_json = '{}'
WHERE key = 'natal.house.8.ruler.mercury' AND locale = 'ru-RU'
  AND (topic_category = '' OR topic_category IS NULL)
  AND (text IS NULL OR LENGTH(TRIM(text))=0);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.8.ruler.mercury', '', 'ru-RU', 'Управитель 8-го дома — Меркурий: его положение (знак/дом/аспекты) уточняет стиль и стратегию по теме 8-го дома.', 84, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.8.ruler.mercury' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Управитель 8-го дома — Венера: его положение (знак/дом/аспекты) уточняет стиль и стратегию по теме 8-го дома.', priority = 84, is_active = 1, meta_json = '{}'
WHERE key = 'natal.house.8.ruler.venus' AND locale = 'ru-RU'
  AND (topic_category = '' OR topic_category IS NULL)
  AND (text IS NULL OR LENGTH(TRIM(text))=0);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.8.ruler.venus', '', 'ru-RU', 'Управитель 8-го дома — Венера: его положение (знак/дом/аспекты) уточняет стиль и стратегию по теме 8-го дома.', 84, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.8.ruler.venus' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Управитель 8-го дома — Марс: его положение (знак/дом/аспекты) уточняет стиль и стратегию по теме 8-го дома.', priority = 84, is_active = 1, meta_json = '{}'
WHERE key = 'natal.house.8.ruler.mars' AND locale = 'ru-RU'
  AND (topic_category = '' OR topic_category IS NULL)
  AND (text IS NULL OR LENGTH(TRIM(text))=0);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.8.ruler.mars', '', 'ru-RU', 'Управитель 8-го дома — Марс: его положение (знак/дом/аспекты) уточняет стиль и стратегию по теме 8-го дома.', 84, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.8.ruler.mars' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Управитель 8-го дома — Юпитер: его положение (знак/дом/аспекты) уточняет стиль и стратегию по теме 8-го дома.', priority = 84, is_active = 1, meta_json = '{}'
WHERE key = 'natal.house.8.ruler.jupiter' AND locale = 'ru-RU'
  AND (topic_category = '' OR topic_category IS NULL)
  AND (text IS NULL OR LENGTH(TRIM(text))=0);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.8.ruler.jupiter', '', 'ru-RU', 'Управитель 8-го дома — Юпитер: его положение (знак/дом/аспекты) уточняет стиль и стратегию по теме 8-го дома.', 84, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.8.ruler.jupiter' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Управитель 8-го дома — Сатурн: его положение (знак/дом/аспекты) уточняет стиль и стратегию по теме 8-го дома.', priority = 84, is_active = 1, meta_json = '{}'
WHERE key = 'natal.house.8.ruler.saturn' AND locale = 'ru-RU'
  AND (topic_category = '' OR topic_category IS NULL)
  AND (text IS NULL OR LENGTH(TRIM(text))=0);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.8.ruler.saturn', '', 'ru-RU', 'Управитель 8-го дома — Сатурн: его положение (знак/дом/аспекты) уточняет стиль и стратегию по теме 8-го дома.', 84, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.8.ruler.saturn' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Управитель 8-го дома — Уран: его положение (знак/дом/аспекты) уточняет стиль и стратегию по теме 8-го дома.', priority = 84, is_active = 1, meta_json = '{}'
WHERE key = 'natal.house.8.ruler.uranus' AND locale = 'ru-RU'
  AND (topic_category = '' OR topic_category IS NULL)
  AND (text IS NULL OR LENGTH(TRIM(text))=0);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.8.ruler.uranus', '', 'ru-RU', 'Управитель 8-го дома — Уран: его положение (знак/дом/аспекты) уточняет стиль и стратегию по теме 8-го дома.', 84, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.8.ruler.uranus' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Управитель 8-го дома — Нептун: его положение (знак/дом/аспекты) уточняет стиль и стратегию по теме 8-го дома.', priority = 84, is_active = 1, meta_json = '{}'
WHERE key = 'natal.house.8.ruler.neptune' AND locale = 'ru-RU'
  AND (topic_category = '' OR topic_category IS NULL)
  AND (text IS NULL OR LENGTH(TRIM(text))=0);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.8.ruler.neptune', '', 'ru-RU', 'Управитель 8-го дома — Нептун: его положение (знак/дом/аспекты) уточняет стиль и стратегию по теме 8-го дома.', 84, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.8.ruler.neptune' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Управитель 8-го дома — Плутон: его положение (знак/дом/аспекты) уточняет стиль и стратегию по теме 8-го дома.', priority = 84, is_active = 1, meta_json = '{}'
WHERE key = 'natal.house.8.ruler.pluto' AND locale = 'ru-RU'
  AND (topic_category = '' OR topic_category IS NULL)
  AND (text IS NULL OR LENGTH(TRIM(text))=0);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.8.ruler.pluto', '', 'ru-RU', 'Управитель 8-го дома — Плутон: его положение (знак/дом/аспекты) уточняет стиль и стратегию по теме 8-го дома.', 84, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.8.ruler.pluto' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Управитель 9-го дома: планета, которая показывает «как» и «через что» реализуется тема 9-го дома.', priority = 84, is_active = 1, meta_json = '{}'
WHERE key = 'natal.house.9.ruler.any' AND locale = 'ru-RU'
  AND (topic_category = '' OR topic_category IS NULL)
  AND (text IS NULL OR LENGTH(TRIM(text))=0);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.9.ruler.any', '', 'ru-RU', 'Управитель 9-го дома: планета, которая показывает «как» и «через что» реализуется тема 9-го дома.', 84, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.9.ruler.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Управитель 9-го дома — Солнце: его положение (знак/дом/аспекты) уточняет стиль и стратегию по теме 9-го дома.', priority = 84, is_active = 1, meta_json = '{}'
WHERE key = 'natal.house.9.ruler.sun' AND locale = 'ru-RU'
  AND (topic_category = '' OR topic_category IS NULL)
  AND (text IS NULL OR LENGTH(TRIM(text))=0);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.9.ruler.sun', '', 'ru-RU', 'Управитель 9-го дома — Солнце: его положение (знак/дом/аспекты) уточняет стиль и стратегию по теме 9-го дома.', 84, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.9.ruler.sun' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Управитель 9-го дома — Луна: его положение (знак/дом/аспекты) уточняет стиль и стратегию по теме 9-го дома.', priority = 84, is_active = 1, meta_json = '{}'
WHERE key = 'natal.house.9.ruler.moon' AND locale = 'ru-RU'
  AND (topic_category = '' OR topic_category IS NULL)
  AND (text IS NULL OR LENGTH(TRIM(text))=0);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.9.ruler.moon', '', 'ru-RU', 'Управитель 9-го дома — Луна: его положение (знак/дом/аспекты) уточняет стиль и стратегию по теме 9-го дома.', 84, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.9.ruler.moon' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Управитель 9-го дома — Меркурий: его положение (знак/дом/аспекты) уточняет стиль и стратегию по теме 9-го дома.', priority = 84, is_active = 1, meta_json = '{}'
WHERE key = 'natal.house.9.ruler.mercury' AND locale = 'ru-RU'
  AND (topic_category = '' OR topic_category IS NULL)
  AND (text IS NULL OR LENGTH(TRIM(text))=0);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.9.ruler.mercury', '', 'ru-RU', 'Управитель 9-го дома — Меркурий: его положение (знак/дом/аспекты) уточняет стиль и стратегию по теме 9-го дома.', 84, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.9.ruler.mercury' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Управитель 9-го дома — Венера: его положение (знак/дом/аспекты) уточняет стиль и стратегию по теме 9-го дома.', priority = 84, is_active = 1, meta_json = '{}'
WHERE key = 'natal.house.9.ruler.venus' AND locale = 'ru-RU'
  AND (topic_category = '' OR topic_category IS NULL)
  AND (text IS NULL OR LENGTH(TRIM(text))=0);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.9.ruler.venus', '', 'ru-RU', 'Управитель 9-го дома — Венера: его положение (знак/дом/аспекты) уточняет стиль и стратегию по теме 9-го дома.', 84, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.9.ruler.venus' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Управитель 9-го дома — Марс: его положение (знак/дом/аспекты) уточняет стиль и стратегию по теме 9-го дома.', priority = 84, is_active = 1, meta_json = '{}'
WHERE key = 'natal.house.9.ruler.mars' AND locale = 'ru-RU'
  AND (topic_category = '' OR topic_category IS NULL)
  AND (text IS NULL OR LENGTH(TRIM(text))=0);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.9.ruler.mars', '', 'ru-RU', 'Управитель 9-го дома — Марс: его положение (знак/дом/аспекты) уточняет стиль и стратегию по теме 9-го дома.', 84, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.9.ruler.mars' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Управитель 9-го дома — Юпитер: его положение (знак/дом/аспекты) уточняет стиль и стратегию по теме 9-го дома.', priority = 84, is_active = 1, meta_json = '{}'
WHERE key = 'natal.house.9.ruler.jupiter' AND locale = 'ru-RU'
  AND (topic_category = '' OR topic_category IS NULL)
  AND (text IS NULL OR LENGTH(TRIM(text))=0);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.9.ruler.jupiter', '', 'ru-RU', 'Управитель 9-го дома — Юпитер: его положение (знак/дом/аспекты) уточняет стиль и стратегию по теме 9-го дома.', 84, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.9.ruler.jupiter' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Управитель 9-го дома — Сатурн: его положение (знак/дом/аспекты) уточняет стиль и стратегию по теме 9-го дома.', priority = 84, is_active = 1, meta_json = '{}'
WHERE key = 'natal.house.9.ruler.saturn' AND locale = 'ru-RU'
  AND (topic_category = '' OR topic_category IS NULL)
  AND (text IS NULL OR LENGTH(TRIM(text))=0);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.9.ruler.saturn', '', 'ru-RU', 'Управитель 9-го дома — Сатурн: его положение (знак/дом/аспекты) уточняет стиль и стратегию по теме 9-го дома.', 84, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.9.ruler.saturn' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Управитель 9-го дома — Уран: его положение (знак/дом/аспекты) уточняет стиль и стратегию по теме 9-го дома.', priority = 84, is_active = 1, meta_json = '{}'
WHERE key = 'natal.house.9.ruler.uranus' AND locale = 'ru-RU'
  AND (topic_category = '' OR topic_category IS NULL)
  AND (text IS NULL OR LENGTH(TRIM(text))=0);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.9.ruler.uranus', '', 'ru-RU', 'Управитель 9-го дома — Уран: его положение (знак/дом/аспекты) уточняет стиль и стратегию по теме 9-го дома.', 84, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.9.ruler.uranus' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Управитель 9-го дома — Нептун: его положение (знак/дом/аспекты) уточняет стиль и стратегию по теме 9-го дома.', priority = 84, is_active = 1, meta_json = '{}'
WHERE key = 'natal.house.9.ruler.neptune' AND locale = 'ru-RU'
  AND (topic_category = '' OR topic_category IS NULL)
  AND (text IS NULL OR LENGTH(TRIM(text))=0);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.9.ruler.neptune', '', 'ru-RU', 'Управитель 9-го дома — Нептун: его положение (знак/дом/аспекты) уточняет стиль и стратегию по теме 9-го дома.', 84, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.9.ruler.neptune' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Управитель 9-го дома — Плутон: его положение (знак/дом/аспекты) уточняет стиль и стратегию по теме 9-го дома.', priority = 84, is_active = 1, meta_json = '{}'
WHERE key = 'natal.house.9.ruler.pluto' AND locale = 'ru-RU'
  AND (topic_category = '' OR topic_category IS NULL)
  AND (text IS NULL OR LENGTH(TRIM(text))=0);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.9.ruler.pluto', '', 'ru-RU', 'Управитель 9-го дома — Плутон: его положение (знак/дом/аспекты) уточняет стиль и стратегию по теме 9-го дома.', 84, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.9.ruler.pluto' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Управитель 10-го дома: планета, которая показывает «как» и «через что» реализуется тема 10-го дома.', priority = 84, is_active = 1, meta_json = '{}'
WHERE key = 'natal.house.10.ruler.any' AND locale = 'ru-RU'
  AND (topic_category = '' OR topic_category IS NULL)
  AND (text IS NULL OR LENGTH(TRIM(text))=0);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.10.ruler.any', '', 'ru-RU', 'Управитель 10-го дома: планета, которая показывает «как» и «через что» реализуется тема 10-го дома.', 84, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.10.ruler.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Управитель 10-го дома — Солнце: его положение (знак/дом/аспекты) уточняет стиль и стратегию по теме 10-го дома.', priority = 84, is_active = 1, meta_json = '{}'
WHERE key = 'natal.house.10.ruler.sun' AND locale = 'ru-RU'
  AND (topic_category = '' OR topic_category IS NULL)
  AND (text IS NULL OR LENGTH(TRIM(text))=0);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.10.ruler.sun', '', 'ru-RU', 'Управитель 10-го дома — Солнце: его положение (знак/дом/аспекты) уточняет стиль и стратегию по теме 10-го дома.', 84, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.10.ruler.sun' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Управитель 10-го дома — Луна: его положение (знак/дом/аспекты) уточняет стиль и стратегию по теме 10-го дома.', priority = 84, is_active = 1, meta_json = '{}'
WHERE key = 'natal.house.10.ruler.moon' AND locale = 'ru-RU'
  AND (topic_category = '' OR topic_category IS NULL)
  AND (text IS NULL OR LENGTH(TRIM(text))=0);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.10.ruler.moon', '', 'ru-RU', 'Управитель 10-го дома — Луна: его положение (знак/дом/аспекты) уточняет стиль и стратегию по теме 10-го дома.', 84, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.10.ruler.moon' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Управитель 10-го дома — Меркурий: его положение (знак/дом/аспекты) уточняет стиль и стратегию по теме 10-го дома.', priority = 84, is_active = 1, meta_json = '{}'
WHERE key = 'natal.house.10.ruler.mercury' AND locale = 'ru-RU'
  AND (topic_category = '' OR topic_category IS NULL)
  AND (text IS NULL OR LENGTH(TRIM(text))=0);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.10.ruler.mercury', '', 'ru-RU', 'Управитель 10-го дома — Меркурий: его положение (знак/дом/аспекты) уточняет стиль и стратегию по теме 10-го дома.', 84, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.10.ruler.mercury' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Управитель 10-го дома — Венера: его положение (знак/дом/аспекты) уточняет стиль и стратегию по теме 10-го дома.', priority = 84, is_active = 1, meta_json = '{}'
WHERE key = 'natal.house.10.ruler.venus' AND locale = 'ru-RU'
  AND (topic_category = '' OR topic_category IS NULL)
  AND (text IS NULL OR LENGTH(TRIM(text))=0);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.10.ruler.venus', '', 'ru-RU', 'Управитель 10-го дома — Венера: его положение (знак/дом/аспекты) уточняет стиль и стратегию по теме 10-го дома.', 84, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.10.ruler.venus' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Управитель 10-го дома — Марс: его положение (знак/дом/аспекты) уточняет стиль и стратегию по теме 10-го дома.', priority = 84, is_active = 1, meta_json = '{}'
WHERE key = 'natal.house.10.ruler.mars' AND locale = 'ru-RU'
  AND (topic_category = '' OR topic_category IS NULL)
  AND (text IS NULL OR LENGTH(TRIM(text))=0);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.10.ruler.mars', '', 'ru-RU', 'Управитель 10-го дома — Марс: его положение (знак/дом/аспекты) уточняет стиль и стратегию по теме 10-го дома.', 84, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.10.ruler.mars' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Управитель 10-го дома — Юпитер: его положение (знак/дом/аспекты) уточняет стиль и стратегию по теме 10-го дома.', priority = 84, is_active = 1, meta_json = '{}'
WHERE key = 'natal.house.10.ruler.jupiter' AND locale = 'ru-RU'
  AND (topic_category = '' OR topic_category IS NULL)
  AND (text IS NULL OR LENGTH(TRIM(text))=0);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.10.ruler.jupiter', '', 'ru-RU', 'Управитель 10-го дома — Юпитер: его положение (знак/дом/аспекты) уточняет стиль и стратегию по теме 10-го дома.', 84, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.10.ruler.jupiter' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Управитель 10-го дома — Сатурн: его положение (знак/дом/аспекты) уточняет стиль и стратегию по теме 10-го дома.', priority = 84, is_active = 1, meta_json = '{}'
WHERE key = 'natal.house.10.ruler.saturn' AND locale = 'ru-RU'
  AND (topic_category = '' OR topic_category IS NULL)
  AND (text IS NULL OR LENGTH(TRIM(text))=0);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.10.ruler.saturn', '', 'ru-RU', 'Управитель 10-го дома — Сатурн: его положение (знак/дом/аспекты) уточняет стиль и стратегию по теме 10-го дома.', 84, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.10.ruler.saturn' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Управитель 10-го дома — Уран: его положение (знак/дом/аспекты) уточняет стиль и стратегию по теме 10-го дома.', priority = 84, is_active = 1, meta_json = '{}'
WHERE key = 'natal.house.10.ruler.uranus' AND locale = 'ru-RU'
  AND (topic_category = '' OR topic_category IS NULL)
  AND (text IS NULL OR LENGTH(TRIM(text))=0);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.10.ruler.uranus', '', 'ru-RU', 'Управитель 10-го дома — Уран: его положение (знак/дом/аспекты) уточняет стиль и стратегию по теме 10-го дома.', 84, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.10.ruler.uranus' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Управитель 10-го дома — Нептун: его положение (знак/дом/аспекты) уточняет стиль и стратегию по теме 10-го дома.', priority = 84, is_active = 1, meta_json = '{}'
WHERE key = 'natal.house.10.ruler.neptune' AND locale = 'ru-RU'
  AND (topic_category = '' OR topic_category IS NULL)
  AND (text IS NULL OR LENGTH(TRIM(text))=0);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.10.ruler.neptune', '', 'ru-RU', 'Управитель 10-го дома — Нептун: его положение (знак/дом/аспекты) уточняет стиль и стратегию по теме 10-го дома.', 84, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.10.ruler.neptune' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Управитель 10-го дома — Плутон: его положение (знак/дом/аспекты) уточняет стиль и стратегию по теме 10-го дома.', priority = 84, is_active = 1, meta_json = '{}'
WHERE key = 'natal.house.10.ruler.pluto' AND locale = 'ru-RU'
  AND (topic_category = '' OR topic_category IS NULL)
  AND (text IS NULL OR LENGTH(TRIM(text))=0);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.10.ruler.pluto', '', 'ru-RU', 'Управитель 10-го дома — Плутон: его положение (знак/дом/аспекты) уточняет стиль и стратегию по теме 10-го дома.', 84, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.10.ruler.pluto' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Управитель 11-го дома: планета, которая показывает «как» и «через что» реализуется тема 11-го дома.', priority = 84, is_active = 1, meta_json = '{}'
WHERE key = 'natal.house.11.ruler.any' AND locale = 'ru-RU'
  AND (topic_category = '' OR topic_category IS NULL)
  AND (text IS NULL OR LENGTH(TRIM(text))=0);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.11.ruler.any', '', 'ru-RU', 'Управитель 11-го дома: планета, которая показывает «как» и «через что» реализуется тема 11-го дома.', 84, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.11.ruler.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Управитель 11-го дома — Солнце: его положение (знак/дом/аспекты) уточняет стиль и стратегию по теме 11-го дома.', priority = 84, is_active = 1, meta_json = '{}'
WHERE key = 'natal.house.11.ruler.sun' AND locale = 'ru-RU'
  AND (topic_category = '' OR topic_category IS NULL)
  AND (text IS NULL OR LENGTH(TRIM(text))=0);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.11.ruler.sun', '', 'ru-RU', 'Управитель 11-го дома — Солнце: его положение (знак/дом/аспекты) уточняет стиль и стратегию по теме 11-го дома.', 84, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.11.ruler.sun' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Управитель 11-го дома — Луна: его положение (знак/дом/аспекты) уточняет стиль и стратегию по теме 11-го дома.', priority = 84, is_active = 1, meta_json = '{}'
WHERE key = 'natal.house.11.ruler.moon' AND locale = 'ru-RU'
  AND (topic_category = '' OR topic_category IS NULL)
  AND (text IS NULL OR LENGTH(TRIM(text))=0);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.11.ruler.moon', '', 'ru-RU', 'Управитель 11-го дома — Луна: его положение (знак/дом/аспекты) уточняет стиль и стратегию по теме 11-го дома.', 84, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.11.ruler.moon' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Управитель 11-го дома — Меркурий: его положение (знак/дом/аспекты) уточняет стиль и стратегию по теме 11-го дома.', priority = 84, is_active = 1, meta_json = '{}'
WHERE key = 'natal.house.11.ruler.mercury' AND locale = 'ru-RU'
  AND (topic_category = '' OR topic_category IS NULL)
  AND (text IS NULL OR LENGTH(TRIM(text))=0);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.11.ruler.mercury', '', 'ru-RU', 'Управитель 11-го дома — Меркурий: его положение (знак/дом/аспекты) уточняет стиль и стратегию по теме 11-го дома.', 84, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.11.ruler.mercury' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Управитель 11-го дома — Венера: его положение (знак/дом/аспекты) уточняет стиль и стратегию по теме 11-го дома.', priority = 84, is_active = 1, meta_json = '{}'
WHERE key = 'natal.house.11.ruler.venus' AND locale = 'ru-RU'
  AND (topic_category = '' OR topic_category IS NULL)
  AND (text IS NULL OR LENGTH(TRIM(text))=0);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.11.ruler.venus', '', 'ru-RU', 'Управитель 11-го дома — Венера: его положение (знак/дом/аспекты) уточняет стиль и стратегию по теме 11-го дома.', 84, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.11.ruler.venus' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Управитель 11-го дома — Марс: его положение (знак/дом/аспекты) уточняет стиль и стратегию по теме 11-го дома.', priority = 84, is_active = 1, meta_json = '{}'
WHERE key = 'natal.house.11.ruler.mars' AND locale = 'ru-RU'
  AND (topic_category = '' OR topic_category IS NULL)
  AND (text IS NULL OR LENGTH(TRIM(text))=0);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.11.ruler.mars', '', 'ru-RU', 'Управитель 11-го дома — Марс: его положение (знак/дом/аспекты) уточняет стиль и стратегию по теме 11-го дома.', 84, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.11.ruler.mars' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Управитель 11-го дома — Юпитер: его положение (знак/дом/аспекты) уточняет стиль и стратегию по теме 11-го дома.', priority = 84, is_active = 1, meta_json = '{}'
WHERE key = 'natal.house.11.ruler.jupiter' AND locale = 'ru-RU'
  AND (topic_category = '' OR topic_category IS NULL)
  AND (text IS NULL OR LENGTH(TRIM(text))=0);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.11.ruler.jupiter', '', 'ru-RU', 'Управитель 11-го дома — Юпитер: его положение (знак/дом/аспекты) уточняет стиль и стратегию по теме 11-го дома.', 84, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.11.ruler.jupiter' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Управитель 11-го дома — Сатурн: его положение (знак/дом/аспекты) уточняет стиль и стратегию по теме 11-го дома.', priority = 84, is_active = 1, meta_json = '{}'
WHERE key = 'natal.house.11.ruler.saturn' AND locale = 'ru-RU'
  AND (topic_category = '' OR topic_category IS NULL)
  AND (text IS NULL OR LENGTH(TRIM(text))=0);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.11.ruler.saturn', '', 'ru-RU', 'Управитель 11-го дома — Сатурн: его положение (знак/дом/аспекты) уточняет стиль и стратегию по теме 11-го дома.', 84, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.11.ruler.saturn' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Управитель 11-го дома — Уран: его положение (знак/дом/аспекты) уточняет стиль и стратегию по теме 11-го дома.', priority = 84, is_active = 1, meta_json = '{}'
WHERE key = 'natal.house.11.ruler.uranus' AND locale = 'ru-RU'
  AND (topic_category = '' OR topic_category IS NULL)
  AND (text IS NULL OR LENGTH(TRIM(text))=0);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.11.ruler.uranus', '', 'ru-RU', 'Управитель 11-го дома — Уран: его положение (знак/дом/аспекты) уточняет стиль и стратегию по теме 11-го дома.', 84, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.11.ruler.uranus' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Управитель 11-го дома — Нептун: его положение (знак/дом/аспекты) уточняет стиль и стратегию по теме 11-го дома.', priority = 84, is_active = 1, meta_json = '{}'
WHERE key = 'natal.house.11.ruler.neptune' AND locale = 'ru-RU'
  AND (topic_category = '' OR topic_category IS NULL)
  AND (text IS NULL OR LENGTH(TRIM(text))=0);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.11.ruler.neptune', '', 'ru-RU', 'Управитель 11-го дома — Нептун: его положение (знак/дом/аспекты) уточняет стиль и стратегию по теме 11-го дома.', 84, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.11.ruler.neptune' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Управитель 11-го дома — Плутон: его положение (знак/дом/аспекты) уточняет стиль и стратегию по теме 11-го дома.', priority = 84, is_active = 1, meta_json = '{}'
WHERE key = 'natal.house.11.ruler.pluto' AND locale = 'ru-RU'
  AND (topic_category = '' OR topic_category IS NULL)
  AND (text IS NULL OR LENGTH(TRIM(text))=0);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.11.ruler.pluto', '', 'ru-RU', 'Управитель 11-го дома — Плутон: его положение (знак/дом/аспекты) уточняет стиль и стратегию по теме 11-го дома.', 84, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.11.ruler.pluto' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Управитель 12-го дома: планета, которая показывает «как» и «через что» реализуется тема 12-го дома.', priority = 84, is_active = 1, meta_json = '{}'
WHERE key = 'natal.house.12.ruler.any' AND locale = 'ru-RU'
  AND (topic_category = '' OR topic_category IS NULL)
  AND (text IS NULL OR LENGTH(TRIM(text))=0);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.12.ruler.any', '', 'ru-RU', 'Управитель 12-го дома: планета, которая показывает «как» и «через что» реализуется тема 12-го дома.', 84, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.12.ruler.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Управитель 12-го дома — Солнце: его положение (знак/дом/аспекты) уточняет стиль и стратегию по теме 12-го дома.', priority = 84, is_active = 1, meta_json = '{}'
WHERE key = 'natal.house.12.ruler.sun' AND locale = 'ru-RU'
  AND (topic_category = '' OR topic_category IS NULL)
  AND (text IS NULL OR LENGTH(TRIM(text))=0);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.12.ruler.sun', '', 'ru-RU', 'Управитель 12-го дома — Солнце: его положение (знак/дом/аспекты) уточняет стиль и стратегию по теме 12-го дома.', 84, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.12.ruler.sun' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Управитель 12-го дома — Луна: его положение (знак/дом/аспекты) уточняет стиль и стратегию по теме 12-го дома.', priority = 84, is_active = 1, meta_json = '{}'
WHERE key = 'natal.house.12.ruler.moon' AND locale = 'ru-RU'
  AND (topic_category = '' OR topic_category IS NULL)
  AND (text IS NULL OR LENGTH(TRIM(text))=0);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.12.ruler.moon', '', 'ru-RU', 'Управитель 12-го дома — Луна: его положение (знак/дом/аспекты) уточняет стиль и стратегию по теме 12-го дома.', 84, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.12.ruler.moon' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Управитель 12-го дома — Меркурий: его положение (знак/дом/аспекты) уточняет стиль и стратегию по теме 12-го дома.', priority = 84, is_active = 1, meta_json = '{}'
WHERE key = 'natal.house.12.ruler.mercury' AND locale = 'ru-RU'
  AND (topic_category = '' OR topic_category IS NULL)
  AND (text IS NULL OR LENGTH(TRIM(text))=0);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.12.ruler.mercury', '', 'ru-RU', 'Управитель 12-го дома — Меркурий: его положение (знак/дом/аспекты) уточняет стиль и стратегию по теме 12-го дома.', 84, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.12.ruler.mercury' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Управитель 12-го дома — Венера: его положение (знак/дом/аспекты) уточняет стиль и стратегию по теме 12-го дома.', priority = 84, is_active = 1, meta_json = '{}'
WHERE key = 'natal.house.12.ruler.venus' AND locale = 'ru-RU'
  AND (topic_category = '' OR topic_category IS NULL)
  AND (text IS NULL OR LENGTH(TRIM(text))=0);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.12.ruler.venus', '', 'ru-RU', 'Управитель 12-го дома — Венера: его положение (знак/дом/аспекты) уточняет стиль и стратегию по теме 12-го дома.', 84, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.12.ruler.venus' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Управитель 12-го дома — Марс: его положение (знак/дом/аспекты) уточняет стиль и стратегию по теме 12-го дома.', priority = 84, is_active = 1, meta_json = '{}'
WHERE key = 'natal.house.12.ruler.mars' AND locale = 'ru-RU'
  AND (topic_category = '' OR topic_category IS NULL)
  AND (text IS NULL OR LENGTH(TRIM(text))=0);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.12.ruler.mars', '', 'ru-RU', 'Управитель 12-го дома — Марс: его положение (знак/дом/аспекты) уточняет стиль и стратегию по теме 12-го дома.', 84, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.12.ruler.mars' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Управитель 12-го дома — Юпитер: его положение (знак/дом/аспекты) уточняет стиль и стратегию по теме 12-го дома.', priority = 84, is_active = 1, meta_json = '{}'
WHERE key = 'natal.house.12.ruler.jupiter' AND locale = 'ru-RU'
  AND (topic_category = '' OR topic_category IS NULL)
  AND (text IS NULL OR LENGTH(TRIM(text))=0);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.12.ruler.jupiter', '', 'ru-RU', 'Управитель 12-го дома — Юпитер: его положение (знак/дом/аспекты) уточняет стиль и стратегию по теме 12-го дома.', 84, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.12.ruler.jupiter' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Управитель 12-го дома — Сатурн: его положение (знак/дом/аспекты) уточняет стиль и стратегию по теме 12-го дома.', priority = 84, is_active = 1, meta_json = '{}'
WHERE key = 'natal.house.12.ruler.saturn' AND locale = 'ru-RU'
  AND (topic_category = '' OR topic_category IS NULL)
  AND (text IS NULL OR LENGTH(TRIM(text))=0);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.12.ruler.saturn', '', 'ru-RU', 'Управитель 12-го дома — Сатурн: его положение (знак/дом/аспекты) уточняет стиль и стратегию по теме 12-го дома.', 84, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.12.ruler.saturn' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Управитель 12-го дома — Уран: его положение (знак/дом/аспекты) уточняет стиль и стратегию по теме 12-го дома.', priority = 84, is_active = 1, meta_json = '{}'
WHERE key = 'natal.house.12.ruler.uranus' AND locale = 'ru-RU'
  AND (topic_category = '' OR topic_category IS NULL)
  AND (text IS NULL OR LENGTH(TRIM(text))=0);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.12.ruler.uranus', '', 'ru-RU', 'Управитель 12-го дома — Уран: его положение (знак/дом/аспекты) уточняет стиль и стратегию по теме 12-го дома.', 84, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.12.ruler.uranus' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Управитель 12-го дома — Нептун: его положение (знак/дом/аспекты) уточняет стиль и стратегию по теме 12-го дома.', priority = 84, is_active = 1, meta_json = '{}'
WHERE key = 'natal.house.12.ruler.neptune' AND locale = 'ru-RU'
  AND (topic_category = '' OR topic_category IS NULL)
  AND (text IS NULL OR LENGTH(TRIM(text))=0);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.12.ruler.neptune', '', 'ru-RU', 'Управитель 12-го дома — Нептун: его положение (знак/дом/аспекты) уточняет стиль и стратегию по теме 12-го дома.', 84, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.12.ruler.neptune' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Управитель 12-го дома — Плутон: его положение (знак/дом/аспекты) уточняет стиль и стратегию по теме 12-го дома.', priority = 84, is_active = 1, meta_json = '{}'
WHERE key = 'natal.house.12.ruler.pluto' AND locale = 'ru-RU'
  AND (topic_category = '' OR topic_category IS NULL)
  AND (text IS NULL OR LENGTH(TRIM(text))=0);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.12.ruler.pluto', '', 'ru-RU', 'Управитель 12-го дома — Плутон: его положение (знак/дом/аспекты) уточняет стиль и стратегию по теме 12-го дома.', 84, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.12.ruler.pluto' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

COMMIT;

