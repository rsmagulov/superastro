-- AUTO-GENERATED. DO NOT EDIT BY HAND.

-- GLOBAL planet scaffolds

BEGIN;

UPDATE knowledge_items
SET text = 'Солнце: базовый смысл планеты как психологической функции и мотива.', priority = 82, is_active = 1, meta_json = '{}'
WHERE key = 'natal.planet.sun' AND locale = 'ru-RU'
  AND (topic_category = '' OR topic_category IS NULL)
  AND (text IS NULL OR LENGTH(TRIM(text))=0);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.planet.sun', '', 'ru-RU', 'Солнце: базовый смысл планеты как психологической функции и мотива.', 82, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.planet.sun' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Солнце в знаке: показывает стиль проявления качества Солнце (как это «делается»).', priority = 83, is_active = 1, meta_json = '{}'
WHERE key = 'natal.planet.sun.sign.any' AND locale = 'ru-RU'
  AND (topic_category = '' OR topic_category IS NULL)
  AND (text IS NULL OR LENGTH(TRIM(text))=0);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.planet.sun.sign.any', '', 'ru-RU', 'Солнце в знаке: показывает стиль проявления качества Солнце (как это «делается»).', 83, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.planet.sun.sign.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Солнце в доме: показывает сферу жизни, где тема Солнце включается чаще и заметнее.', priority = 83, is_active = 1, meta_json = '{}'
WHERE key = 'natal.planet.sun.house.any' AND locale = 'ru-RU'
  AND (topic_category = '' OR topic_category IS NULL)
  AND (text IS NULL OR LENGTH(TRIM(text))=0);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.planet.sun.house.any', '', 'ru-RU', 'Солнце в доме: показывает сферу жизни, где тема Солнце включается чаще и заметнее.', 83, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.planet.sun.house.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Луна: базовый смысл планеты как психологической функции и мотива.', priority = 82, is_active = 1, meta_json = '{}'
WHERE key = 'natal.planet.moon' AND locale = 'ru-RU'
  AND (topic_category = '' OR topic_category IS NULL)
  AND (text IS NULL OR LENGTH(TRIM(text))=0);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.planet.moon', '', 'ru-RU', 'Луна: базовый смысл планеты как психологической функции и мотива.', 82, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.planet.moon' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Луна в знаке: показывает стиль проявления качества Луна (как это «делается»).', priority = 83, is_active = 1, meta_json = '{}'
WHERE key = 'natal.planet.moon.sign.any' AND locale = 'ru-RU'
  AND (topic_category = '' OR topic_category IS NULL)
  AND (text IS NULL OR LENGTH(TRIM(text))=0);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.planet.moon.sign.any', '', 'ru-RU', 'Луна в знаке: показывает стиль проявления качества Луна (как это «делается»).', 83, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.planet.moon.sign.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Луна в доме: показывает сферу жизни, где тема Луна включается чаще и заметнее.', priority = 83, is_active = 1, meta_json = '{}'
WHERE key = 'natal.planet.moon.house.any' AND locale = 'ru-RU'
  AND (topic_category = '' OR topic_category IS NULL)
  AND (text IS NULL OR LENGTH(TRIM(text))=0);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.planet.moon.house.any', '', 'ru-RU', 'Луна в доме: показывает сферу жизни, где тема Луна включается чаще и заметнее.', 83, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.planet.moon.house.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Меркурий: базовый смысл планеты как психологической функции и мотива.', priority = 82, is_active = 1, meta_json = '{}'
WHERE key = 'natal.planet.mercury' AND locale = 'ru-RU'
  AND (topic_category = '' OR topic_category IS NULL)
  AND (text IS NULL OR LENGTH(TRIM(text))=0);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.planet.mercury', '', 'ru-RU', 'Меркурий: базовый смысл планеты как психологической функции и мотива.', 82, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.planet.mercury' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Меркурий в знаке: показывает стиль проявления качества Меркурий (как это «делается»).', priority = 83, is_active = 1, meta_json = '{}'
WHERE key = 'natal.planet.mercury.sign.any' AND locale = 'ru-RU'
  AND (topic_category = '' OR topic_category IS NULL)
  AND (text IS NULL OR LENGTH(TRIM(text))=0);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.planet.mercury.sign.any', '', 'ru-RU', 'Меркурий в знаке: показывает стиль проявления качества Меркурий (как это «делается»).', 83, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.planet.mercury.sign.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Меркурий в доме: показывает сферу жизни, где тема Меркурий включается чаще и заметнее.', priority = 83, is_active = 1, meta_json = '{}'
WHERE key = 'natal.planet.mercury.house.any' AND locale = 'ru-RU'
  AND (topic_category = '' OR topic_category IS NULL)
  AND (text IS NULL OR LENGTH(TRIM(text))=0);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.planet.mercury.house.any', '', 'ru-RU', 'Меркурий в доме: показывает сферу жизни, где тема Меркурий включается чаще и заметнее.', 83, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.planet.mercury.house.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Венера: базовый смысл планеты как психологической функции и мотива.', priority = 82, is_active = 1, meta_json = '{}'
WHERE key = 'natal.planet.venus' AND locale = 'ru-RU'
  AND (topic_category = '' OR topic_category IS NULL)
  AND (text IS NULL OR LENGTH(TRIM(text))=0);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.planet.venus', '', 'ru-RU', 'Венера: базовый смысл планеты как психологической функции и мотива.', 82, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.planet.venus' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Венера в знаке: показывает стиль проявления качества Венера (как это «делается»).', priority = 83, is_active = 1, meta_json = '{}'
WHERE key = 'natal.planet.venus.sign.any' AND locale = 'ru-RU'
  AND (topic_category = '' OR topic_category IS NULL)
  AND (text IS NULL OR LENGTH(TRIM(text))=0);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.planet.venus.sign.any', '', 'ru-RU', 'Венера в знаке: показывает стиль проявления качества Венера (как это «делается»).', 83, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.planet.venus.sign.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Венера в доме: показывает сферу жизни, где тема Венера включается чаще и заметнее.', priority = 83, is_active = 1, meta_json = '{}'
WHERE key = 'natal.planet.venus.house.any' AND locale = 'ru-RU'
  AND (topic_category = '' OR topic_category IS NULL)
  AND (text IS NULL OR LENGTH(TRIM(text))=0);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.planet.venus.house.any', '', 'ru-RU', 'Венера в доме: показывает сферу жизни, где тема Венера включается чаще и заметнее.', 83, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.planet.venus.house.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Марс: базовый смысл планеты как психологической функции и мотива.', priority = 82, is_active = 1, meta_json = '{}'
WHERE key = 'natal.planet.mars' AND locale = 'ru-RU'
  AND (topic_category = '' OR topic_category IS NULL)
  AND (text IS NULL OR LENGTH(TRIM(text))=0);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.planet.mars', '', 'ru-RU', 'Марс: базовый смысл планеты как психологической функции и мотива.', 82, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.planet.mars' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Марс в знаке: показывает стиль проявления качества Марс (как это «делается»).', priority = 83, is_active = 1, meta_json = '{}'
WHERE key = 'natal.planet.mars.sign.any' AND locale = 'ru-RU'
  AND (topic_category = '' OR topic_category IS NULL)
  AND (text IS NULL OR LENGTH(TRIM(text))=0);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.planet.mars.sign.any', '', 'ru-RU', 'Марс в знаке: показывает стиль проявления качества Марс (как это «делается»).', 83, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.planet.mars.sign.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Марс в доме: показывает сферу жизни, где тема Марс включается чаще и заметнее.', priority = 83, is_active = 1, meta_json = '{}'
WHERE key = 'natal.planet.mars.house.any' AND locale = 'ru-RU'
  AND (topic_category = '' OR topic_category IS NULL)
  AND (text IS NULL OR LENGTH(TRIM(text))=0);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.planet.mars.house.any', '', 'ru-RU', 'Марс в доме: показывает сферу жизни, где тема Марс включается чаще и заметнее.', 83, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.planet.mars.house.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Юпитер: базовый смысл планеты как психологической функции и мотива.', priority = 82, is_active = 1, meta_json = '{}'
WHERE key = 'natal.planet.jupiter' AND locale = 'ru-RU'
  AND (topic_category = '' OR topic_category IS NULL)
  AND (text IS NULL OR LENGTH(TRIM(text))=0);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.planet.jupiter', '', 'ru-RU', 'Юпитер: базовый смысл планеты как психологической функции и мотива.', 82, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.planet.jupiter' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Юпитер в знаке: показывает стиль проявления качества Юпитер (как это «делается»).', priority = 83, is_active = 1, meta_json = '{}'
WHERE key = 'natal.planet.jupiter.sign.any' AND locale = 'ru-RU'
  AND (topic_category = '' OR topic_category IS NULL)
  AND (text IS NULL OR LENGTH(TRIM(text))=0);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.planet.jupiter.sign.any', '', 'ru-RU', 'Юпитер в знаке: показывает стиль проявления качества Юпитер (как это «делается»).', 83, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.planet.jupiter.sign.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Юпитер в доме: показывает сферу жизни, где тема Юпитер включается чаще и заметнее.', priority = 83, is_active = 1, meta_json = '{}'
WHERE key = 'natal.planet.jupiter.house.any' AND locale = 'ru-RU'
  AND (topic_category = '' OR topic_category IS NULL)
  AND (text IS NULL OR LENGTH(TRIM(text))=0);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.planet.jupiter.house.any', '', 'ru-RU', 'Юпитер в доме: показывает сферу жизни, где тема Юпитер включается чаще и заметнее.', 83, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.planet.jupiter.house.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Сатурн: базовый смысл планеты как психологической функции и мотива.', priority = 82, is_active = 1, meta_json = '{}'
WHERE key = 'natal.planet.saturn' AND locale = 'ru-RU'
  AND (topic_category = '' OR topic_category IS NULL)
  AND (text IS NULL OR LENGTH(TRIM(text))=0);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.planet.saturn', '', 'ru-RU', 'Сатурн: базовый смысл планеты как психологической функции и мотива.', 82, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.planet.saturn' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Сатурн в знаке: показывает стиль проявления качества Сатурн (как это «делается»).', priority = 83, is_active = 1, meta_json = '{}'
WHERE key = 'natal.planet.saturn.sign.any' AND locale = 'ru-RU'
  AND (topic_category = '' OR topic_category IS NULL)
  AND (text IS NULL OR LENGTH(TRIM(text))=0);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.planet.saturn.sign.any', '', 'ru-RU', 'Сатурн в знаке: показывает стиль проявления качества Сатурн (как это «делается»).', 83, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.planet.saturn.sign.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Сатурн в доме: показывает сферу жизни, где тема Сатурн включается чаще и заметнее.', priority = 83, is_active = 1, meta_json = '{}'
WHERE key = 'natal.planet.saturn.house.any' AND locale = 'ru-RU'
  AND (topic_category = '' OR topic_category IS NULL)
  AND (text IS NULL OR LENGTH(TRIM(text))=0);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.planet.saturn.house.any', '', 'ru-RU', 'Сатурн в доме: показывает сферу жизни, где тема Сатурн включается чаще и заметнее.', 83, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.planet.saturn.house.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Уран: базовый смысл планеты как психологической функции и мотива.', priority = 82, is_active = 1, meta_json = '{}'
WHERE key = 'natal.planet.uranus' AND locale = 'ru-RU'
  AND (topic_category = '' OR topic_category IS NULL)
  AND (text IS NULL OR LENGTH(TRIM(text))=0);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.planet.uranus', '', 'ru-RU', 'Уран: базовый смысл планеты как психологической функции и мотива.', 82, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.planet.uranus' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Уран в знаке: показывает стиль проявления качества Уран (как это «делается»).', priority = 83, is_active = 1, meta_json = '{}'
WHERE key = 'natal.planet.uranus.sign.any' AND locale = 'ru-RU'
  AND (topic_category = '' OR topic_category IS NULL)
  AND (text IS NULL OR LENGTH(TRIM(text))=0);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.planet.uranus.sign.any', '', 'ru-RU', 'Уран в знаке: показывает стиль проявления качества Уран (как это «делается»).', 83, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.planet.uranus.sign.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Уран в доме: показывает сферу жизни, где тема Уран включается чаще и заметнее.', priority = 83, is_active = 1, meta_json = '{}'
WHERE key = 'natal.planet.uranus.house.any' AND locale = 'ru-RU'
  AND (topic_category = '' OR topic_category IS NULL)
  AND (text IS NULL OR LENGTH(TRIM(text))=0);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.planet.uranus.house.any', '', 'ru-RU', 'Уран в доме: показывает сферу жизни, где тема Уран включается чаще и заметнее.', 83, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.planet.uranus.house.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Нептун: базовый смысл планеты как психологической функции и мотива.', priority = 82, is_active = 1, meta_json = '{}'
WHERE key = 'natal.planet.neptune' AND locale = 'ru-RU'
  AND (topic_category = '' OR topic_category IS NULL)
  AND (text IS NULL OR LENGTH(TRIM(text))=0);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.planet.neptune', '', 'ru-RU', 'Нептун: базовый смысл планеты как психологической функции и мотива.', 82, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.planet.neptune' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Нептун в знаке: показывает стиль проявления качества Нептун (как это «делается»).', priority = 83, is_active = 1, meta_json = '{}'
WHERE key = 'natal.planet.neptune.sign.any' AND locale = 'ru-RU'
  AND (topic_category = '' OR topic_category IS NULL)
  AND (text IS NULL OR LENGTH(TRIM(text))=0);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.planet.neptune.sign.any', '', 'ru-RU', 'Нептун в знаке: показывает стиль проявления качества Нептун (как это «делается»).', 83, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.planet.neptune.sign.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Нептун в доме: показывает сферу жизни, где тема Нептун включается чаще и заметнее.', priority = 83, is_active = 1, meta_json = '{}'
WHERE key = 'natal.planet.neptune.house.any' AND locale = 'ru-RU'
  AND (topic_category = '' OR topic_category IS NULL)
  AND (text IS NULL OR LENGTH(TRIM(text))=0);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.planet.neptune.house.any', '', 'ru-RU', 'Нептун в доме: показывает сферу жизни, где тема Нептун включается чаще и заметнее.', 83, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.planet.neptune.house.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Плутон: базовый смысл планеты как психологической функции и мотива.', priority = 82, is_active = 1, meta_json = '{}'
WHERE key = 'natal.planet.pluto' AND locale = 'ru-RU'
  AND (topic_category = '' OR topic_category IS NULL)
  AND (text IS NULL OR LENGTH(TRIM(text))=0);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.planet.pluto', '', 'ru-RU', 'Плутон: базовый смысл планеты как психологической функции и мотива.', 82, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.planet.pluto' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Плутон в знаке: показывает стиль проявления качества Плутон (как это «делается»).', priority = 83, is_active = 1, meta_json = '{}'
WHERE key = 'natal.planet.pluto.sign.any' AND locale = 'ru-RU'
  AND (topic_category = '' OR topic_category IS NULL)
  AND (text IS NULL OR LENGTH(TRIM(text))=0);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.planet.pluto.sign.any', '', 'ru-RU', 'Плутон в знаке: показывает стиль проявления качества Плутон (как это «делается»).', 83, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.planet.pluto.sign.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Плутон в доме: показывает сферу жизни, где тема Плутон включается чаще и заметнее.', priority = 83, is_active = 1, meta_json = '{}'
WHERE key = 'natal.planet.pluto.house.any' AND locale = 'ru-RU'
  AND (topic_category = '' OR topic_category IS NULL)
  AND (text IS NULL OR LENGTH(TRIM(text))=0);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.planet.pluto.house.any', '', 'ru-RU', 'Плутон в доме: показывает сферу жизни, где тема Плутон включается чаще и заметнее.', 83, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.planet.pluto.house.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Юпитер в «Овен»: базовый стиль проявления через качества знака «Овен» (универсально для любой темы).', priority = 88, is_active = 1, meta_json = '{}'
WHERE key = 'natal.planet.jupiter.sign.aries' AND locale = 'ru-RU'
  AND (topic_category = '' OR topic_category IS NULL)
  AND (text IS NULL OR LENGTH(TRIM(text))=0);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.planet.jupiter.sign.aries', '', 'ru-RU', 'Юпитер в «Овен»: базовый стиль проявления через качества знака «Овен» (универсально для любой темы).', 88, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.planet.jupiter.sign.aries' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Юпитер в «Телец»: базовый стиль проявления через качества знака «Телец» (универсально для любой темы).', priority = 88, is_active = 1, meta_json = '{}'
WHERE key = 'natal.planet.jupiter.sign.taurus' AND locale = 'ru-RU'
  AND (topic_category = '' OR topic_category IS NULL)
  AND (text IS NULL OR LENGTH(TRIM(text))=0);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.planet.jupiter.sign.taurus', '', 'ru-RU', 'Юпитер в «Телец»: базовый стиль проявления через качества знака «Телец» (универсально для любой темы).', 88, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.planet.jupiter.sign.taurus' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Юпитер в «Близнецы»: базовый стиль проявления через качества знака «Близнецы» (универсально для любой темы).', priority = 88, is_active = 1, meta_json = '{}'
WHERE key = 'natal.planet.jupiter.sign.gemini' AND locale = 'ru-RU'
  AND (topic_category = '' OR topic_category IS NULL)
  AND (text IS NULL OR LENGTH(TRIM(text))=0);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.planet.jupiter.sign.gemini', '', 'ru-RU', 'Юпитер в «Близнецы»: базовый стиль проявления через качества знака «Близнецы» (универсально для любой темы).', 88, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.planet.jupiter.sign.gemini' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Юпитер в «Рак»: базовый стиль проявления через качества знака «Рак» (универсально для любой темы).', priority = 88, is_active = 1, meta_json = '{}'
WHERE key = 'natal.planet.jupiter.sign.cancer' AND locale = 'ru-RU'
  AND (topic_category = '' OR topic_category IS NULL)
  AND (text IS NULL OR LENGTH(TRIM(text))=0);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.planet.jupiter.sign.cancer', '', 'ru-RU', 'Юпитер в «Рак»: базовый стиль проявления через качества знака «Рак» (универсально для любой темы).', 88, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.planet.jupiter.sign.cancer' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Юпитер в «Лев»: базовый стиль проявления через качества знака «Лев» (универсально для любой темы).', priority = 88, is_active = 1, meta_json = '{}'
WHERE key = 'natal.planet.jupiter.sign.leo' AND locale = 'ru-RU'
  AND (topic_category = '' OR topic_category IS NULL)
  AND (text IS NULL OR LENGTH(TRIM(text))=0);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.planet.jupiter.sign.leo', '', 'ru-RU', 'Юпитер в «Лев»: базовый стиль проявления через качества знака «Лев» (универсально для любой темы).', 88, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.planet.jupiter.sign.leo' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Юпитер в «Дева»: базовый стиль проявления через качества знака «Дева» (универсально для любой темы).', priority = 88, is_active = 1, meta_json = '{}'
WHERE key = 'natal.planet.jupiter.sign.virgo' AND locale = 'ru-RU'
  AND (topic_category = '' OR topic_category IS NULL)
  AND (text IS NULL OR LENGTH(TRIM(text))=0);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.planet.jupiter.sign.virgo', '', 'ru-RU', 'Юпитер в «Дева»: базовый стиль проявления через качества знака «Дева» (универсально для любой темы).', 88, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.planet.jupiter.sign.virgo' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Юпитер в «Весы»: базовый стиль проявления через качества знака «Весы» (универсально для любой темы).', priority = 88, is_active = 1, meta_json = '{}'
WHERE key = 'natal.planet.jupiter.sign.libra' AND locale = 'ru-RU'
  AND (topic_category = '' OR topic_category IS NULL)
  AND (text IS NULL OR LENGTH(TRIM(text))=0);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.planet.jupiter.sign.libra', '', 'ru-RU', 'Юпитер в «Весы»: базовый стиль проявления через качества знака «Весы» (универсально для любой темы).', 88, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.planet.jupiter.sign.libra' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Юпитер в «Скорпион»: базовый стиль проявления через качества знака «Скорпион» (универсально для любой темы).', priority = 88, is_active = 1, meta_json = '{}'
WHERE key = 'natal.planet.jupiter.sign.scorpio' AND locale = 'ru-RU'
  AND (topic_category = '' OR topic_category IS NULL)
  AND (text IS NULL OR LENGTH(TRIM(text))=0);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.planet.jupiter.sign.scorpio', '', 'ru-RU', 'Юпитер в «Скорпион»: базовый стиль проявления через качества знака «Скорпион» (универсально для любой темы).', 88, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.planet.jupiter.sign.scorpio' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Юпитер в «Стрелец»: базовый стиль проявления через качества знака «Стрелец» (универсально для любой темы).', priority = 88, is_active = 1, meta_json = '{}'
WHERE key = 'natal.planet.jupiter.sign.sagittarius' AND locale = 'ru-RU'
  AND (topic_category = '' OR topic_category IS NULL)
  AND (text IS NULL OR LENGTH(TRIM(text))=0);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.planet.jupiter.sign.sagittarius', '', 'ru-RU', 'Юпитер в «Стрелец»: базовый стиль проявления через качества знака «Стрелец» (универсально для любой темы).', 88, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.planet.jupiter.sign.sagittarius' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Юпитер в «Козерог»: базовый стиль проявления через качества знака «Козерог» (универсально для любой темы).', priority = 88, is_active = 1, meta_json = '{}'
WHERE key = 'natal.planet.jupiter.sign.capricorn' AND locale = 'ru-RU'
  AND (topic_category = '' OR topic_category IS NULL)
  AND (text IS NULL OR LENGTH(TRIM(text))=0);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.planet.jupiter.sign.capricorn', '', 'ru-RU', 'Юпитер в «Козерог»: базовый стиль проявления через качества знака «Козерог» (универсально для любой темы).', 88, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.planet.jupiter.sign.capricorn' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Юпитер в «Водолей»: базовый стиль проявления через качества знака «Водолей» (универсально для любой темы).', priority = 88, is_active = 1, meta_json = '{}'
WHERE key = 'natal.planet.jupiter.sign.aquarius' AND locale = 'ru-RU'
  AND (topic_category = '' OR topic_category IS NULL)
  AND (text IS NULL OR LENGTH(TRIM(text))=0);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.planet.jupiter.sign.aquarius', '', 'ru-RU', 'Юпитер в «Водолей»: базовый стиль проявления через качества знака «Водолей» (универсально для любой темы).', 88, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.planet.jupiter.sign.aquarius' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Юпитер в «Рыбы»: базовый стиль проявления через качества знака «Рыбы» (универсально для любой темы).', priority = 88, is_active = 1, meta_json = '{}'
WHERE key = 'natal.planet.jupiter.sign.pisces' AND locale = 'ru-RU'
  AND (topic_category = '' OR topic_category IS NULL)
  AND (text IS NULL OR LENGTH(TRIM(text))=0);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.planet.jupiter.sign.pisces', '', 'ru-RU', 'Юпитер в «Рыбы»: базовый стиль проявления через качества знака «Рыбы» (универсально для любой темы).', 88, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.planet.jupiter.sign.pisces' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Сатурн в «Овен»: базовый стиль проявления через качества знака «Овен» (универсально для любой темы).', priority = 88, is_active = 1, meta_json = '{}'
WHERE key = 'natal.planet.saturn.sign.aries' AND locale = 'ru-RU'
  AND (topic_category = '' OR topic_category IS NULL)
  AND (text IS NULL OR LENGTH(TRIM(text))=0);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.planet.saturn.sign.aries', '', 'ru-RU', 'Сатурн в «Овен»: базовый стиль проявления через качества знака «Овен» (универсально для любой темы).', 88, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.planet.saturn.sign.aries' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Сатурн в «Телец»: базовый стиль проявления через качества знака «Телец» (универсально для любой темы).', priority = 88, is_active = 1, meta_json = '{}'
WHERE key = 'natal.planet.saturn.sign.taurus' AND locale = 'ru-RU'
  AND (topic_category = '' OR topic_category IS NULL)
  AND (text IS NULL OR LENGTH(TRIM(text))=0);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.planet.saturn.sign.taurus', '', 'ru-RU', 'Сатурн в «Телец»: базовый стиль проявления через качества знака «Телец» (универсально для любой темы).', 88, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.planet.saturn.sign.taurus' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Сатурн в «Близнецы»: базовый стиль проявления через качества знака «Близнецы» (универсально для любой темы).', priority = 88, is_active = 1, meta_json = '{}'
WHERE key = 'natal.planet.saturn.sign.gemini' AND locale = 'ru-RU'
  AND (topic_category = '' OR topic_category IS NULL)
  AND (text IS NULL OR LENGTH(TRIM(text))=0);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.planet.saturn.sign.gemini', '', 'ru-RU', 'Сатурн в «Близнецы»: базовый стиль проявления через качества знака «Близнецы» (универсально для любой темы).', 88, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.planet.saturn.sign.gemini' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Сатурн в «Рак»: базовый стиль проявления через качества знака «Рак» (универсально для любой темы).', priority = 88, is_active = 1, meta_json = '{}'
WHERE key = 'natal.planet.saturn.sign.cancer' AND locale = 'ru-RU'
  AND (topic_category = '' OR topic_category IS NULL)
  AND (text IS NULL OR LENGTH(TRIM(text))=0);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.planet.saturn.sign.cancer', '', 'ru-RU', 'Сатурн в «Рак»: базовый стиль проявления через качества знака «Рак» (универсально для любой темы).', 88, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.planet.saturn.sign.cancer' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Сатурн в «Лев»: базовый стиль проявления через качества знака «Лев» (универсально для любой темы).', priority = 88, is_active = 1, meta_json = '{}'
WHERE key = 'natal.planet.saturn.sign.leo' AND locale = 'ru-RU'
  AND (topic_category = '' OR topic_category IS NULL)
  AND (text IS NULL OR LENGTH(TRIM(text))=0);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.planet.saturn.sign.leo', '', 'ru-RU', 'Сатурн в «Лев»: базовый стиль проявления через качества знака «Лев» (универсально для любой темы).', 88, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.planet.saturn.sign.leo' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Сатурн в «Дева»: базовый стиль проявления через качества знака «Дева» (универсально для любой темы).', priority = 88, is_active = 1, meta_json = '{}'
WHERE key = 'natal.planet.saturn.sign.virgo' AND locale = 'ru-RU'
  AND (topic_category = '' OR topic_category IS NULL)
  AND (text IS NULL OR LENGTH(TRIM(text))=0);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.planet.saturn.sign.virgo', '', 'ru-RU', 'Сатурн в «Дева»: базовый стиль проявления через качества знака «Дева» (универсально для любой темы).', 88, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.planet.saturn.sign.virgo' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Сатурн в «Весы»: базовый стиль проявления через качества знака «Весы» (универсально для любой темы).', priority = 88, is_active = 1, meta_json = '{}'
WHERE key = 'natal.planet.saturn.sign.libra' AND locale = 'ru-RU'
  AND (topic_category = '' OR topic_category IS NULL)
  AND (text IS NULL OR LENGTH(TRIM(text))=0);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.planet.saturn.sign.libra', '', 'ru-RU', 'Сатурн в «Весы»: базовый стиль проявления через качества знака «Весы» (универсально для любой темы).', 88, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.planet.saturn.sign.libra' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Сатурн в «Скорпион»: базовый стиль проявления через качества знака «Скорпион» (универсально для любой темы).', priority = 88, is_active = 1, meta_json = '{}'
WHERE key = 'natal.planet.saturn.sign.scorpio' AND locale = 'ru-RU'
  AND (topic_category = '' OR topic_category IS NULL)
  AND (text IS NULL OR LENGTH(TRIM(text))=0);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.planet.saturn.sign.scorpio', '', 'ru-RU', 'Сатурн в «Скорпион»: базовый стиль проявления через качества знака «Скорпион» (универсально для любой темы).', 88, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.planet.saturn.sign.scorpio' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Сатурн в «Стрелец»: базовый стиль проявления через качества знака «Стрелец» (универсально для любой темы).', priority = 88, is_active = 1, meta_json = '{}'
WHERE key = 'natal.planet.saturn.sign.sagittarius' AND locale = 'ru-RU'
  AND (topic_category = '' OR topic_category IS NULL)
  AND (text IS NULL OR LENGTH(TRIM(text))=0);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.planet.saturn.sign.sagittarius', '', 'ru-RU', 'Сатурн в «Стрелец»: базовый стиль проявления через качества знака «Стрелец» (универсально для любой темы).', 88, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.planet.saturn.sign.sagittarius' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Сатурн в «Козерог»: базовый стиль проявления через качества знака «Козерог» (универсально для любой темы).', priority = 88, is_active = 1, meta_json = '{}'
WHERE key = 'natal.planet.saturn.sign.capricorn' AND locale = 'ru-RU'
  AND (topic_category = '' OR topic_category IS NULL)
  AND (text IS NULL OR LENGTH(TRIM(text))=0);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.planet.saturn.sign.capricorn', '', 'ru-RU', 'Сатурн в «Козерог»: базовый стиль проявления через качества знака «Козерог» (универсально для любой темы).', 88, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.planet.saturn.sign.capricorn' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Сатурн в «Водолей»: базовый стиль проявления через качества знака «Водолей» (универсально для любой темы).', priority = 88, is_active = 1, meta_json = '{}'
WHERE key = 'natal.planet.saturn.sign.aquarius' AND locale = 'ru-RU'
  AND (topic_category = '' OR topic_category IS NULL)
  AND (text IS NULL OR LENGTH(TRIM(text))=0);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.planet.saturn.sign.aquarius', '', 'ru-RU', 'Сатурн в «Водолей»: базовый стиль проявления через качества знака «Водолей» (универсально для любой темы).', 88, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.planet.saturn.sign.aquarius' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Сатурн в «Рыбы»: базовый стиль проявления через качества знака «Рыбы» (универсально для любой темы).', priority = 88, is_active = 1, meta_json = '{}'
WHERE key = 'natal.planet.saturn.sign.pisces' AND locale = 'ru-RU'
  AND (topic_category = '' OR topic_category IS NULL)
  AND (text IS NULL OR LENGTH(TRIM(text))=0);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.planet.saturn.sign.pisces', '', 'ru-RU', 'Сатурн в «Рыбы»: базовый стиль проявления через качества знака «Рыбы» (универсально для любой темы).', 88, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.planet.saturn.sign.pisces' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

COMMIT;

