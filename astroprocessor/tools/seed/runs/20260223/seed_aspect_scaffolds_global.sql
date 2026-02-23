-- AUTO-GENERATED. DO NOT EDIT BY HAND.

-- GLOBAL aspect scaffolds (class/present/hard)

BEGIN;

UPDATE knowledge_items
SET text = 'Гармоничные аспекты (трин/секстиль): поддержка, лёгкость включения и естественные таланты.', priority = 90, is_active = 1, meta_json = '{}'
WHERE key = 'natal.aspect.class.harmonic' AND locale = 'ru-RU'
  AND (topic_category = '' OR topic_category IS NULL)
  AND (text IS NULL OR LENGTH(TRIM(text))=0);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.aspect.class.harmonic', '', 'ru-RU', 'Гармоничные аспекты (трин/секстиль): поддержка, лёгкость включения и естественные таланты.', 90, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.aspect.class.harmonic' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Напряжённые аспекты (квадрат/оппозиция): зоны роста, вызовы и необходимость учиться балансировать.', priority = 90, is_active = 1, meta_json = '{}'
WHERE key = 'natal.aspect.class.tense' AND locale = 'ru-RU'
  AND (topic_category = '' OR topic_category IS NULL)
  AND (text IS NULL OR LENGTH(TRIM(text))=0);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.aspect.class.tense', '', 'ru-RU', 'Напряжённые аспекты (квадрат/оппозиция): зоны роста, вызовы и необходимость учиться балансировать.', 90, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.aspect.class.tense' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Есть жёсткие аспекты: это усиливает внутреннюю динамику и повышает требовательность к зрелым решениям.', priority = 90, is_active = 1, meta_json = '{}'
WHERE key = 'natal.aspect.hard.present' AND locale = 'ru-RU'
  AND (topic_category = '' OR topic_category IS NULL)
  AND (text IS NULL OR LENGTH(TRIM(text))=0);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.aspect.hard.present', '', 'ru-RU', 'Есть жёсткие аспекты: это усиливает внутреннюю динамику и повышает требовательность к зрелым решениям.', 90, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.aspect.hard.present' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Аспект conjunction: значимая связка между темами планет, влияющая на стиль взаимодействия качеств в карте.', priority = 90, is_active = 1, meta_json = '{}'
WHERE key = 'natal.aspect.conjunction.present' AND locale = 'ru-RU'
  AND (topic_category = '' OR topic_category IS NULL)
  AND (text IS NULL OR LENGTH(TRIM(text))=0);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.aspect.conjunction.present', '', 'ru-RU', 'Аспект conjunction: значимая связка между темами планет, влияющая на стиль взаимодействия качеств в карте.', 90, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.aspect.conjunction.present' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Аспект sextile: значимая связка между темами планет, влияющая на стиль взаимодействия качеств в карте.', priority = 90, is_active = 1, meta_json = '{}'
WHERE key = 'natal.aspect.sextile.present' AND locale = 'ru-RU'
  AND (topic_category = '' OR topic_category IS NULL)
  AND (text IS NULL OR LENGTH(TRIM(text))=0);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.aspect.sextile.present', '', 'ru-RU', 'Аспект sextile: значимая связка между темами планет, влияющая на стиль взаимодействия качеств в карте.', 90, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.aspect.sextile.present' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Аспект trine: значимая связка между темами планет, влияющая на стиль взаимодействия качеств в карте.', priority = 90, is_active = 1, meta_json = '{}'
WHERE key = 'natal.aspect.trine.present' AND locale = 'ru-RU'
  AND (topic_category = '' OR topic_category IS NULL)
  AND (text IS NULL OR LENGTH(TRIM(text))=0);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.aspect.trine.present', '', 'ru-RU', 'Аспект trine: значимая связка между темами планет, влияющая на стиль взаимодействия качеств в карте.', 90, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.aspect.trine.present' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Аспект square: значимая связка между темами планет, влияющая на стиль взаимодействия качеств в карте.', priority = 90, is_active = 1, meta_json = '{}'
WHERE key = 'natal.aspect.square.present' AND locale = 'ru-RU'
  AND (topic_category = '' OR topic_category IS NULL)
  AND (text IS NULL OR LENGTH(TRIM(text))=0);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.aspect.square.present', '', 'ru-RU', 'Аспект square: значимая связка между темами планет, влияющая на стиль взаимодействия качеств в карте.', 90, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.aspect.square.present' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Аспект opposition: значимая связка между темами планет, влияющая на стиль взаимодействия качеств в карте.', priority = 90, is_active = 1, meta_json = '{}'
WHERE key = 'natal.aspect.opposition.present' AND locale = 'ru-RU'
  AND (topic_category = '' OR topic_category IS NULL)
  AND (text IS NULL OR LENGTH(TRIM(text))=0);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.aspect.opposition.present', '', 'ru-RU', 'Аспект opposition: значимая связка между темами планет, влияющая на стиль взаимодействия качеств в карте.', 90, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.aspect.opposition.present' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Квадраты: напряжение, которое требует действия и перестройки.', priority = 90, is_active = 1, meta_json = '{}'
WHERE key = 'natal.aspect.square.present' AND locale = 'ru-RU'
  AND (topic_category = '' OR topic_category IS NULL)
  AND (text IS NULL OR LENGTH(TRIM(text))=0);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.aspect.square.present', '', 'ru-RU', 'Квадраты: напряжение, которое требует действия и перестройки.', 90, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.aspect.square.present' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Оппозиции: полярности, которые важно согласовать и удерживать баланс.', priority = 90, is_active = 1, meta_json = '{}'
WHERE key = 'natal.aspect.opposition.present' AND locale = 'ru-RU'
  AND (topic_category = '' OR topic_category IS NULL)
  AND (text IS NULL OR LENGTH(TRIM(text))=0);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.aspect.opposition.present', '', 'ru-RU', 'Оппозиции: полярности, которые важно согласовать и удерживать баланс.', 90, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.aspect.opposition.present' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

COMMIT;

