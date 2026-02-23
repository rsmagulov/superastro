-- AUTO-GENERATED. DO NOT EDIT BY HAND.

-- GLOBAL exact missing keys for personality_core

BEGIN;

UPDATE knowledge_items
SET text = 'Солнце в «Козерог» (дом любой): общий смысл связки «планета+знак».', priority = 90, is_active = 1, meta_json = '{}'
WHERE key = 'natal.planet.sun.sign.capricorn.house.any' AND locale = 'ru-RU'
  AND (topic_category = '' OR topic_category IS NULL)
  AND (text IS NULL OR LENGTH(TRIM(text))=0);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.planet.sun.sign.capricorn.house.any', '', 'ru-RU', 'Солнце в «Козерог» (дом любой): общий смысл связки «планета+знак».', 90, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.planet.sun.sign.capricorn.house.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Солнце в знаке: общий стиль проявления качеств Солнце.', priority = 90, is_active = 1, meta_json = '{}'
WHERE key = 'natal.planet.sun.sign.any' AND locale = 'ru-RU'
  AND (topic_category = '' OR topic_category IS NULL)
  AND (text IS NULL OR LENGTH(TRIM(text))=0);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.planet.sun.sign.any', '', 'ru-RU', 'Солнце в знаке: общий стиль проявления качеств Солнце.', 90, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.planet.sun.sign.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Солнце: базовый смысл планеты как функции и мотива.', priority = 90, is_active = 1, meta_json = '{}'
WHERE key = 'natal.planet.sun' AND locale = 'ru-RU'
  AND (topic_category = '' OR topic_category IS NULL)
  AND (text IS NULL OR LENGTH(TRIM(text))=0);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.planet.sun', '', 'ru-RU', 'Солнце: базовый смысл планеты как функции и мотива.', 90, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.planet.sun' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Луна в «Рыбы» (дом любой): общий смысл связки «планета+знак».', priority = 90, is_active = 1, meta_json = '{}'
WHERE key = 'natal.planet.moon.sign.pisces.house.any' AND locale = 'ru-RU'
  AND (topic_category = '' OR topic_category IS NULL)
  AND (text IS NULL OR LENGTH(TRIM(text))=0);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.planet.moon.sign.pisces.house.any', '', 'ru-RU', 'Луна в «Рыбы» (дом любой): общий смысл связки «планета+знак».', 90, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.planet.moon.sign.pisces.house.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Луна в знаке: общий стиль проявления качеств Луна.', priority = 90, is_active = 1, meta_json = '{}'
WHERE key = 'natal.planet.moon.sign.any' AND locale = 'ru-RU'
  AND (topic_category = '' OR topic_category IS NULL)
  AND (text IS NULL OR LENGTH(TRIM(text))=0);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.planet.moon.sign.any', '', 'ru-RU', 'Луна в знаке: общий стиль проявления качеств Луна.', 90, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.planet.moon.sign.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Луна: базовый смысл планеты как функции и мотива.', priority = 90, is_active = 1, meta_json = '{}'
WHERE key = 'natal.planet.moon' AND locale = 'ru-RU'
  AND (topic_category = '' OR topic_category IS NULL)
  AND (text IS NULL OR LENGTH(TRIM(text))=0);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.planet.moon', '', 'ru-RU', 'Луна: базовый смысл планеты как функции и мотива.', 90, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.planet.moon' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Меркурий в «Козерог» в 11-м доме: базовый смысл связки «планета+знак+дом».', priority = 90, is_active = 1, meta_json = '{}'
WHERE key = 'natal.planet.mercury.sign.capricorn.house.11' AND locale = 'ru-RU'
  AND (topic_category = '' OR topic_category IS NULL)
  AND (text IS NULL OR LENGTH(TRIM(text))=0);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.planet.mercury.sign.capricorn.house.11', '', 'ru-RU', 'Меркурий в «Козерог» в 11-м доме: базовый смысл связки «планета+знак+дом».', 90, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.planet.mercury.sign.capricorn.house.11' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Меркурий в «Козерог» (дом любой): общий смысл связки «планета+знак».', priority = 90, is_active = 1, meta_json = '{}'
WHERE key = 'natal.planet.mercury.sign.capricorn.house.any' AND locale = 'ru-RU'
  AND (topic_category = '' OR topic_category IS NULL)
  AND (text IS NULL OR LENGTH(TRIM(text))=0);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.planet.mercury.sign.capricorn.house.any', '', 'ru-RU', 'Меркурий в «Козерог» (дом любой): общий смысл связки «планета+знак».', 90, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.planet.mercury.sign.capricorn.house.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Меркурий в знаке: общий стиль проявления качеств Меркурий.', priority = 90, is_active = 1, meta_json = '{}'
WHERE key = 'natal.planet.mercury.sign.any' AND locale = 'ru-RU'
  AND (topic_category = '' OR topic_category IS NULL)
  AND (text IS NULL OR LENGTH(TRIM(text))=0);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.planet.mercury.sign.any', '', 'ru-RU', 'Меркурий в знаке: общий стиль проявления качеств Меркурий.', 90, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.planet.mercury.sign.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Меркурий: базовый смысл планеты как функции и мотива.', priority = 90, is_active = 1, meta_json = '{}'
WHERE key = 'natal.planet.mercury' AND locale = 'ru-RU'
  AND (topic_category = '' OR topic_category IS NULL)
  AND (text IS NULL OR LENGTH(TRIM(text))=0);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.planet.mercury', '', 'ru-RU', 'Меркурий: базовый смысл планеты как функции и мотива.', 90, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.planet.mercury' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Венера в «Водолей» (дом любой): общий смысл связки «планета+знак».', priority = 90, is_active = 1, meta_json = '{}'
WHERE key = 'natal.planet.venus.sign.aquarius.house.any' AND locale = 'ru-RU'
  AND (topic_category = '' OR topic_category IS NULL)
  AND (text IS NULL OR LENGTH(TRIM(text))=0);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.planet.venus.sign.aquarius.house.any', '', 'ru-RU', 'Венера в «Водолей» (дом любой): общий смысл связки «планета+знак».', 90, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.planet.venus.sign.aquarius.house.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Венера в знаке: общий стиль проявления качеств Венера.', priority = 90, is_active = 1, meta_json = '{}'
WHERE key = 'natal.planet.venus.sign.any' AND locale = 'ru-RU'
  AND (topic_category = '' OR topic_category IS NULL)
  AND (text IS NULL OR LENGTH(TRIM(text))=0);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.planet.venus.sign.any', '', 'ru-RU', 'Венера в знаке: общий стиль проявления качеств Венера.', 90, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.planet.venus.sign.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Венера: базовый смысл планеты как функции и мотива.', priority = 90, is_active = 1, meta_json = '{}'
WHERE key = 'natal.planet.venus' AND locale = 'ru-RU'
  AND (topic_category = '' OR topic_category IS NULL)
  AND (text IS NULL OR LENGTH(TRIM(text))=0);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.planet.venus', '', 'ru-RU', 'Венера: базовый смысл планеты как функции и мотива.', 90, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.planet.venus' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Марс в «Стрелец» (дом любой): общий смысл связки «планета+знак».', priority = 90, is_active = 1, meta_json = '{}'
WHERE key = 'natal.planet.mars.sign.sagittarius.house.any' AND locale = 'ru-RU'
  AND (topic_category = '' OR topic_category IS NULL)
  AND (text IS NULL OR LENGTH(TRIM(text))=0);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.planet.mars.sign.sagittarius.house.any', '', 'ru-RU', 'Марс в «Стрелец» (дом любой): общий смысл связки «планета+знак».', 90, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.planet.mars.sign.sagittarius.house.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Марс в знаке: общий стиль проявления качеств Марс.', priority = 90, is_active = 1, meta_json = '{}'
WHERE key = 'natal.planet.mars.sign.any' AND locale = 'ru-RU'
  AND (topic_category = '' OR topic_category IS NULL)
  AND (text IS NULL OR LENGTH(TRIM(text))=0);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.planet.mars.sign.any', '', 'ru-RU', 'Марс в знаке: общий стиль проявления качеств Марс.', 90, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.planet.mars.sign.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Марс: базовый смысл планеты как функции и мотива.', priority = 90, is_active = 1, meta_json = '{}'
WHERE key = 'natal.planet.mars' AND locale = 'ru-RU'
  AND (topic_category = '' OR topic_category IS NULL)
  AND (text IS NULL OR LENGTH(TRIM(text))=0);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.planet.mars', '', 'ru-RU', 'Марс: базовый смысл планеты как функции и мотива.', 90, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.planet.mars' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

COMMIT;

