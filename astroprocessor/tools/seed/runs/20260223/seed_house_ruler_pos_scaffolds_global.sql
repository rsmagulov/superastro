-- AUTO-GENERATED. DO NOT EDIT BY HAND.

-- GLOBAL scaffolds for house ruler position keys.

BEGIN;

UPDATE knowledge_items
SET text = 'Управитель 1-го дома (Солнце) стоит в определённом знаке: это задаёт стиль проявления темы 1-го дома.', priority = 86, is_active = 1, meta_json = '{}'
WHERE key = 'natal.house.1.ruler.sun.sign.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.1.ruler.sun.sign.any', '', 'ru-RU', 'Управитель 1-го дома (Солнце) стоит в определённом знаке: это задаёт стиль проявления темы 1-го дома.', 86, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.1.ruler.sun.sign.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Управитель 1-го дома (Солнце) расположен в некотором доме: это показывает, где именно «включается» тема 1-го дома.', priority = 86, is_active = 1, meta_json = '{}'
WHERE key = 'natal.house.1.ruler.sun.house.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.1.ruler.sun.house.any', '', 'ru-RU', 'Управитель 1-го дома (Солнце) расположен в некотором доме: это показывает, где именно «включается» тема 1-го дома.', 86, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.1.ruler.sun.house.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Управитель 1-го дома — Солнце: важны условия, где твои решения по теме дома становятся устойчивыми. Смотри, в каком знаке и доме стоит Солнце: это подсказывает стиль и среду реализации.', priority = 86, is_active = 1, meta_json = '{}'
WHERE key = 'natal.house.1.ruler.sun.sign.any.house.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.1.ruler.sun.sign.any.house.any', '', 'ru-RU', 'Управитель 1-го дома — Солнце: важны условия, где твои решения по теме дома становятся устойчивыми. Смотри, в каком знаке и доме стоит Солнце: это подсказывает стиль и среду реализации.', 86, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.1.ruler.sun.sign.any.house.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Управитель 1-го дома (Луна) стоит в определённом знаке: это задаёт стиль проявления темы 1-го дома.', priority = 86, is_active = 1, meta_json = '{}'
WHERE key = 'natal.house.1.ruler.moon.sign.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.1.ruler.moon.sign.any', '', 'ru-RU', 'Управитель 1-го дома (Луна) стоит в определённом знаке: это задаёт стиль проявления темы 1-го дома.', 86, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.1.ruler.moon.sign.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Управитель 1-го дома (Луна) расположен в некотором доме: это показывает, где именно «включается» тема 1-го дома.', priority = 86, is_active = 1, meta_json = '{}'
WHERE key = 'natal.house.1.ruler.moon.house.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.1.ruler.moon.house.any', '', 'ru-RU', 'Управитель 1-го дома (Луна) расположен в некотором доме: это показывает, где именно «включается» тема 1-го дома.', 86, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.1.ruler.moon.house.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Управитель 1-го дома — Луна: важны условия, где твои решения по теме дома становятся устойчивыми. Смотри, в каком знаке и доме стоит Луна: это подсказывает стиль и среду реализации.', priority = 86, is_active = 1, meta_json = '{}'
WHERE key = 'natal.house.1.ruler.moon.sign.any.house.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.1.ruler.moon.sign.any.house.any', '', 'ru-RU', 'Управитель 1-го дома — Луна: важны условия, где твои решения по теме дома становятся устойчивыми. Смотри, в каком знаке и доме стоит Луна: это подсказывает стиль и среду реализации.', 86, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.1.ruler.moon.sign.any.house.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Управитель 1-го дома (Меркурий) стоит в определённом знаке: это задаёт стиль проявления темы 1-го дома.', priority = 86, is_active = 1, meta_json = '{}'
WHERE key = 'natal.house.1.ruler.mercury.sign.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.1.ruler.mercury.sign.any', '', 'ru-RU', 'Управитель 1-го дома (Меркурий) стоит в определённом знаке: это задаёт стиль проявления темы 1-го дома.', 86, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.1.ruler.mercury.sign.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Управитель 1-го дома (Меркурий) расположен в некотором доме: это показывает, где именно «включается» тема 1-го дома.', priority = 86, is_active = 1, meta_json = '{}'
WHERE key = 'natal.house.1.ruler.mercury.house.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.1.ruler.mercury.house.any', '', 'ru-RU', 'Управитель 1-го дома (Меркурий) расположен в некотором доме: это показывает, где именно «включается» тема 1-го дома.', 86, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.1.ruler.mercury.house.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Управитель 1-го дома — Меркурий: важны условия, где твои решения по теме дома становятся устойчивыми. Смотри, в каком знаке и доме стоит Меркурий: это подсказывает стиль и среду реализации.', priority = 86, is_active = 1, meta_json = '{}'
WHERE key = 'natal.house.1.ruler.mercury.sign.any.house.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.1.ruler.mercury.sign.any.house.any', '', 'ru-RU', 'Управитель 1-го дома — Меркурий: важны условия, где твои решения по теме дома становятся устойчивыми. Смотри, в каком знаке и доме стоит Меркурий: это подсказывает стиль и среду реализации.', 86, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.1.ruler.mercury.sign.any.house.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Управитель 1-го дома (Венера) стоит в определённом знаке: это задаёт стиль проявления темы 1-го дома.', priority = 86, is_active = 1, meta_json = '{}'
WHERE key = 'natal.house.1.ruler.venus.sign.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.1.ruler.venus.sign.any', '', 'ru-RU', 'Управитель 1-го дома (Венера) стоит в определённом знаке: это задаёт стиль проявления темы 1-го дома.', 86, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.1.ruler.venus.sign.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Управитель 1-го дома (Венера) расположен в некотором доме: это показывает, где именно «включается» тема 1-го дома.', priority = 86, is_active = 1, meta_json = '{}'
WHERE key = 'natal.house.1.ruler.venus.house.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.1.ruler.venus.house.any', '', 'ru-RU', 'Управитель 1-го дома (Венера) расположен в некотором доме: это показывает, где именно «включается» тема 1-го дома.', 86, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.1.ruler.venus.house.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Управитель 1-го дома — Венера: важны условия, где твои решения по теме дома становятся устойчивыми. Смотри, в каком знаке и доме стоит Венера: это подсказывает стиль и среду реализации.', priority = 86, is_active = 1, meta_json = '{}'
WHERE key = 'natal.house.1.ruler.venus.sign.any.house.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.1.ruler.venus.sign.any.house.any', '', 'ru-RU', 'Управитель 1-го дома — Венера: важны условия, где твои решения по теме дома становятся устойчивыми. Смотри, в каком знаке и доме стоит Венера: это подсказывает стиль и среду реализации.', 86, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.1.ruler.venus.sign.any.house.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Управитель 1-го дома (Марс) стоит в определённом знаке: это задаёт стиль проявления темы 1-го дома.', priority = 86, is_active = 1, meta_json = '{}'
WHERE key = 'natal.house.1.ruler.mars.sign.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.1.ruler.mars.sign.any', '', 'ru-RU', 'Управитель 1-го дома (Марс) стоит в определённом знаке: это задаёт стиль проявления темы 1-го дома.', 86, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.1.ruler.mars.sign.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Управитель 1-го дома (Марс) расположен в некотором доме: это показывает, где именно «включается» тема 1-го дома.', priority = 86, is_active = 1, meta_json = '{}'
WHERE key = 'natal.house.1.ruler.mars.house.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.1.ruler.mars.house.any', '', 'ru-RU', 'Управитель 1-го дома (Марс) расположен в некотором доме: это показывает, где именно «включается» тема 1-го дома.', 86, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.1.ruler.mars.house.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Управитель 1-го дома — Марс: важны условия, где твои решения по теме дома становятся устойчивыми. Смотри, в каком знаке и доме стоит Марс: это подсказывает стиль и среду реализации.', priority = 86, is_active = 1, meta_json = '{}'
WHERE key = 'natal.house.1.ruler.mars.sign.any.house.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.1.ruler.mars.sign.any.house.any', '', 'ru-RU', 'Управитель 1-го дома — Марс: важны условия, где твои решения по теме дома становятся устойчивыми. Смотри, в каком знаке и доме стоит Марс: это подсказывает стиль и среду реализации.', 86, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.1.ruler.mars.sign.any.house.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Управитель 1-го дома (Юпитер) стоит в определённом знаке: это задаёт стиль проявления темы 1-го дома.', priority = 86, is_active = 1, meta_json = '{}'
WHERE key = 'natal.house.1.ruler.jupiter.sign.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.1.ruler.jupiter.sign.any', '', 'ru-RU', 'Управитель 1-го дома (Юпитер) стоит в определённом знаке: это задаёт стиль проявления темы 1-го дома.', 86, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.1.ruler.jupiter.sign.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Управитель 1-го дома (Юпитер) расположен в некотором доме: это показывает, где именно «включается» тема 1-го дома.', priority = 86, is_active = 1, meta_json = '{}'
WHERE key = 'natal.house.1.ruler.jupiter.house.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.1.ruler.jupiter.house.any', '', 'ru-RU', 'Управитель 1-го дома (Юпитер) расположен в некотором доме: это показывает, где именно «включается» тема 1-го дома.', 86, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.1.ruler.jupiter.house.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Управитель 1-го дома — Юпитер: важны условия, где твои решения по теме дома становятся устойчивыми. Смотри, в каком знаке и доме стоит Юпитер: это подсказывает стиль и среду реализации.', priority = 86, is_active = 1, meta_json = '{}'
WHERE key = 'natal.house.1.ruler.jupiter.sign.any.house.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.1.ruler.jupiter.sign.any.house.any', '', 'ru-RU', 'Управитель 1-го дома — Юпитер: важны условия, где твои решения по теме дома становятся устойчивыми. Смотри, в каком знаке и доме стоит Юпитер: это подсказывает стиль и среду реализации.', 86, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.1.ruler.jupiter.sign.any.house.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Управитель 1-го дома (Сатурн) стоит в определённом знаке: это задаёт стиль проявления темы 1-го дома.', priority = 86, is_active = 1, meta_json = '{}'
WHERE key = 'natal.house.1.ruler.saturn.sign.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.1.ruler.saturn.sign.any', '', 'ru-RU', 'Управитель 1-го дома (Сатурн) стоит в определённом знаке: это задаёт стиль проявления темы 1-го дома.', 86, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.1.ruler.saturn.sign.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Управитель 1-го дома (Сатурн) расположен в некотором доме: это показывает, где именно «включается» тема 1-го дома.', priority = 86, is_active = 1, meta_json = '{}'
WHERE key = 'natal.house.1.ruler.saturn.house.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.1.ruler.saturn.house.any', '', 'ru-RU', 'Управитель 1-го дома (Сатурн) расположен в некотором доме: это показывает, где именно «включается» тема 1-го дома.', 86, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.1.ruler.saturn.house.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Управитель 1-го дома — Сатурн: важны условия, где твои решения по теме дома становятся устойчивыми. Смотри, в каком знаке и доме стоит Сатурн: это подсказывает стиль и среду реализации.', priority = 86, is_active = 1, meta_json = '{}'
WHERE key = 'natal.house.1.ruler.saturn.sign.any.house.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.1.ruler.saturn.sign.any.house.any', '', 'ru-RU', 'Управитель 1-го дома — Сатурн: важны условия, где твои решения по теме дома становятся устойчивыми. Смотри, в каком знаке и доме стоит Сатурн: это подсказывает стиль и среду реализации.', 86, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.1.ruler.saturn.sign.any.house.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Управитель 1-го дома (Уран) стоит в определённом знаке: это задаёт стиль проявления темы 1-го дома.', priority = 86, is_active = 1, meta_json = '{}'
WHERE key = 'natal.house.1.ruler.uranus.sign.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.1.ruler.uranus.sign.any', '', 'ru-RU', 'Управитель 1-го дома (Уран) стоит в определённом знаке: это задаёт стиль проявления темы 1-го дома.', 86, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.1.ruler.uranus.sign.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Управитель 1-го дома (Уран) расположен в некотором доме: это показывает, где именно «включается» тема 1-го дома.', priority = 86, is_active = 1, meta_json = '{}'
WHERE key = 'natal.house.1.ruler.uranus.house.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.1.ruler.uranus.house.any', '', 'ru-RU', 'Управитель 1-го дома (Уран) расположен в некотором доме: это показывает, где именно «включается» тема 1-го дома.', 86, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.1.ruler.uranus.house.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Управитель 1-го дома — Уран: важны условия, где твои решения по теме дома становятся устойчивыми. Смотри, в каком знаке и доме стоит Уран: это подсказывает стиль и среду реализации.', priority = 86, is_active = 1, meta_json = '{}'
WHERE key = 'natal.house.1.ruler.uranus.sign.any.house.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.1.ruler.uranus.sign.any.house.any', '', 'ru-RU', 'Управитель 1-го дома — Уран: важны условия, где твои решения по теме дома становятся устойчивыми. Смотри, в каком знаке и доме стоит Уран: это подсказывает стиль и среду реализации.', 86, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.1.ruler.uranus.sign.any.house.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Управитель 1-го дома (Нептун) стоит в определённом знаке: это задаёт стиль проявления темы 1-го дома.', priority = 86, is_active = 1, meta_json = '{}'
WHERE key = 'natal.house.1.ruler.neptune.sign.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.1.ruler.neptune.sign.any', '', 'ru-RU', 'Управитель 1-го дома (Нептун) стоит в определённом знаке: это задаёт стиль проявления темы 1-го дома.', 86, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.1.ruler.neptune.sign.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Управитель 1-го дома (Нептун) расположен в некотором доме: это показывает, где именно «включается» тема 1-го дома.', priority = 86, is_active = 1, meta_json = '{}'
WHERE key = 'natal.house.1.ruler.neptune.house.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.1.ruler.neptune.house.any', '', 'ru-RU', 'Управитель 1-го дома (Нептун) расположен в некотором доме: это показывает, где именно «включается» тема 1-го дома.', 86, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.1.ruler.neptune.house.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Управитель 1-го дома — Нептун: важны условия, где твои решения по теме дома становятся устойчивыми. Смотри, в каком знаке и доме стоит Нептун: это подсказывает стиль и среду реализации.', priority = 86, is_active = 1, meta_json = '{}'
WHERE key = 'natal.house.1.ruler.neptune.sign.any.house.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.1.ruler.neptune.sign.any.house.any', '', 'ru-RU', 'Управитель 1-го дома — Нептун: важны условия, где твои решения по теме дома становятся устойчивыми. Смотри, в каком знаке и доме стоит Нептун: это подсказывает стиль и среду реализации.', 86, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.1.ruler.neptune.sign.any.house.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Управитель 1-го дома (Плутон) стоит в определённом знаке: это задаёт стиль проявления темы 1-го дома.', priority = 86, is_active = 1, meta_json = '{}'
WHERE key = 'natal.house.1.ruler.pluto.sign.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.1.ruler.pluto.sign.any', '', 'ru-RU', 'Управитель 1-го дома (Плутон) стоит в определённом знаке: это задаёт стиль проявления темы 1-го дома.', 86, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.1.ruler.pluto.sign.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Управитель 1-го дома (Плутон) расположен в некотором доме: это показывает, где именно «включается» тема 1-го дома.', priority = 86, is_active = 1, meta_json = '{}'
WHERE key = 'natal.house.1.ruler.pluto.house.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.1.ruler.pluto.house.any', '', 'ru-RU', 'Управитель 1-го дома (Плутон) расположен в некотором доме: это показывает, где именно «включается» тема 1-го дома.', 86, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.1.ruler.pluto.house.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Управитель 1-го дома — Плутон: важны условия, где твои решения по теме дома становятся устойчивыми. Смотри, в каком знаке и доме стоит Плутон: это подсказывает стиль и среду реализации.', priority = 86, is_active = 1, meta_json = '{}'
WHERE key = 'natal.house.1.ruler.pluto.sign.any.house.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.1.ruler.pluto.sign.any.house.any', '', 'ru-RU', 'Управитель 1-го дома — Плутон: важны условия, где твои решения по теме дома становятся устойчивыми. Смотри, в каком знаке и доме стоит Плутон: это подсказывает стиль и среду реализации.', 86, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.1.ruler.pluto.sign.any.house.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Управитель 2-го дома (Солнце) стоит в определённом знаке: это задаёт стиль проявления темы 2-го дома.', priority = 86, is_active = 1, meta_json = '{}'
WHERE key = 'natal.house.2.ruler.sun.sign.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.2.ruler.sun.sign.any', '', 'ru-RU', 'Управитель 2-го дома (Солнце) стоит в определённом знаке: это задаёт стиль проявления темы 2-го дома.', 86, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.2.ruler.sun.sign.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Управитель 2-го дома (Солнце) расположен в некотором доме: это показывает, где именно «включается» тема 2-го дома.', priority = 86, is_active = 1, meta_json = '{}'
WHERE key = 'natal.house.2.ruler.sun.house.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.2.ruler.sun.house.any', '', 'ru-RU', 'Управитель 2-го дома (Солнце) расположен в некотором доме: это показывает, где именно «включается» тема 2-го дома.', 86, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.2.ruler.sun.house.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Управитель 2-го дома — Солнце: важны условия, где твои решения по теме дома становятся устойчивыми. Смотри, в каком знаке и доме стоит Солнце: это подсказывает стиль и среду реализации.', priority = 86, is_active = 1, meta_json = '{}'
WHERE key = 'natal.house.2.ruler.sun.sign.any.house.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.2.ruler.sun.sign.any.house.any', '', 'ru-RU', 'Управитель 2-го дома — Солнце: важны условия, где твои решения по теме дома становятся устойчивыми. Смотри, в каком знаке и доме стоит Солнце: это подсказывает стиль и среду реализации.', 86, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.2.ruler.sun.sign.any.house.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Управитель 2-го дома (Луна) стоит в определённом знаке: это задаёт стиль проявления темы 2-го дома.', priority = 86, is_active = 1, meta_json = '{}'
WHERE key = 'natal.house.2.ruler.moon.sign.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.2.ruler.moon.sign.any', '', 'ru-RU', 'Управитель 2-го дома (Луна) стоит в определённом знаке: это задаёт стиль проявления темы 2-го дома.', 86, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.2.ruler.moon.sign.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Управитель 2-го дома (Луна) расположен в некотором доме: это показывает, где именно «включается» тема 2-го дома.', priority = 86, is_active = 1, meta_json = '{}'
WHERE key = 'natal.house.2.ruler.moon.house.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.2.ruler.moon.house.any', '', 'ru-RU', 'Управитель 2-го дома (Луна) расположен в некотором доме: это показывает, где именно «включается» тема 2-го дома.', 86, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.2.ruler.moon.house.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Управитель 2-го дома — Луна: важны условия, где твои решения по теме дома становятся устойчивыми. Смотри, в каком знаке и доме стоит Луна: это подсказывает стиль и среду реализации.', priority = 86, is_active = 1, meta_json = '{}'
WHERE key = 'natal.house.2.ruler.moon.sign.any.house.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.2.ruler.moon.sign.any.house.any', '', 'ru-RU', 'Управитель 2-го дома — Луна: важны условия, где твои решения по теме дома становятся устойчивыми. Смотри, в каком знаке и доме стоит Луна: это подсказывает стиль и среду реализации.', 86, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.2.ruler.moon.sign.any.house.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Управитель 2-го дома (Меркурий) стоит в определённом знаке: это задаёт стиль проявления темы 2-го дома.', priority = 86, is_active = 1, meta_json = '{}'
WHERE key = 'natal.house.2.ruler.mercury.sign.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.2.ruler.mercury.sign.any', '', 'ru-RU', 'Управитель 2-го дома (Меркурий) стоит в определённом знаке: это задаёт стиль проявления темы 2-го дома.', 86, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.2.ruler.mercury.sign.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Управитель 2-го дома (Меркурий) расположен в некотором доме: это показывает, где именно «включается» тема 2-го дома.', priority = 86, is_active = 1, meta_json = '{}'
WHERE key = 'natal.house.2.ruler.mercury.house.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.2.ruler.mercury.house.any', '', 'ru-RU', 'Управитель 2-го дома (Меркурий) расположен в некотором доме: это показывает, где именно «включается» тема 2-го дома.', 86, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.2.ruler.mercury.house.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Управитель 2-го дома — Меркурий: важны условия, где твои решения по теме дома становятся устойчивыми. Смотри, в каком знаке и доме стоит Меркурий: это подсказывает стиль и среду реализации.', priority = 86, is_active = 1, meta_json = '{}'
WHERE key = 'natal.house.2.ruler.mercury.sign.any.house.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.2.ruler.mercury.sign.any.house.any', '', 'ru-RU', 'Управитель 2-го дома — Меркурий: важны условия, где твои решения по теме дома становятся устойчивыми. Смотри, в каком знаке и доме стоит Меркурий: это подсказывает стиль и среду реализации.', 86, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.2.ruler.mercury.sign.any.house.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Управитель 2-го дома (Венера) стоит в определённом знаке: это задаёт стиль проявления темы 2-го дома.', priority = 86, is_active = 1, meta_json = '{}'
WHERE key = 'natal.house.2.ruler.venus.sign.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.2.ruler.venus.sign.any', '', 'ru-RU', 'Управитель 2-го дома (Венера) стоит в определённом знаке: это задаёт стиль проявления темы 2-го дома.', 86, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.2.ruler.venus.sign.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Управитель 2-го дома (Венера) расположен в некотором доме: это показывает, где именно «включается» тема 2-го дома.', priority = 86, is_active = 1, meta_json = '{}'
WHERE key = 'natal.house.2.ruler.venus.house.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.2.ruler.venus.house.any', '', 'ru-RU', 'Управитель 2-го дома (Венера) расположен в некотором доме: это показывает, где именно «включается» тема 2-го дома.', 86, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.2.ruler.venus.house.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Управитель 2-го дома — Венера: важны условия, где твои решения по теме дома становятся устойчивыми. Смотри, в каком знаке и доме стоит Венера: это подсказывает стиль и среду реализации.', priority = 86, is_active = 1, meta_json = '{}'
WHERE key = 'natal.house.2.ruler.venus.sign.any.house.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.2.ruler.venus.sign.any.house.any', '', 'ru-RU', 'Управитель 2-го дома — Венера: важны условия, где твои решения по теме дома становятся устойчивыми. Смотри, в каком знаке и доме стоит Венера: это подсказывает стиль и среду реализации.', 86, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.2.ruler.venus.sign.any.house.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Управитель 2-го дома (Марс) стоит в определённом знаке: это задаёт стиль проявления темы 2-го дома.', priority = 86, is_active = 1, meta_json = '{}'
WHERE key = 'natal.house.2.ruler.mars.sign.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.2.ruler.mars.sign.any', '', 'ru-RU', 'Управитель 2-го дома (Марс) стоит в определённом знаке: это задаёт стиль проявления темы 2-го дома.', 86, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.2.ruler.mars.sign.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Управитель 2-го дома (Марс) расположен в некотором доме: это показывает, где именно «включается» тема 2-го дома.', priority = 86, is_active = 1, meta_json = '{}'
WHERE key = 'natal.house.2.ruler.mars.house.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.2.ruler.mars.house.any', '', 'ru-RU', 'Управитель 2-го дома (Марс) расположен в некотором доме: это показывает, где именно «включается» тема 2-го дома.', 86, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.2.ruler.mars.house.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Управитель 2-го дома — Марс: важны условия, где твои решения по теме дома становятся устойчивыми. Смотри, в каком знаке и доме стоит Марс: это подсказывает стиль и среду реализации.', priority = 86, is_active = 1, meta_json = '{}'
WHERE key = 'natal.house.2.ruler.mars.sign.any.house.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.2.ruler.mars.sign.any.house.any', '', 'ru-RU', 'Управитель 2-го дома — Марс: важны условия, где твои решения по теме дома становятся устойчивыми. Смотри, в каком знаке и доме стоит Марс: это подсказывает стиль и среду реализации.', 86, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.2.ruler.mars.sign.any.house.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Управитель 2-го дома (Юпитер) стоит в определённом знаке: это задаёт стиль проявления темы 2-го дома.', priority = 86, is_active = 1, meta_json = '{}'
WHERE key = 'natal.house.2.ruler.jupiter.sign.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.2.ruler.jupiter.sign.any', '', 'ru-RU', 'Управитель 2-го дома (Юпитер) стоит в определённом знаке: это задаёт стиль проявления темы 2-го дома.', 86, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.2.ruler.jupiter.sign.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Управитель 2-го дома (Юпитер) расположен в некотором доме: это показывает, где именно «включается» тема 2-го дома.', priority = 86, is_active = 1, meta_json = '{}'
WHERE key = 'natal.house.2.ruler.jupiter.house.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.2.ruler.jupiter.house.any', '', 'ru-RU', 'Управитель 2-го дома (Юпитер) расположен в некотором доме: это показывает, где именно «включается» тема 2-го дома.', 86, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.2.ruler.jupiter.house.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Управитель 2-го дома — Юпитер: важны условия, где твои решения по теме дома становятся устойчивыми. Смотри, в каком знаке и доме стоит Юпитер: это подсказывает стиль и среду реализации.', priority = 86, is_active = 1, meta_json = '{}'
WHERE key = 'natal.house.2.ruler.jupiter.sign.any.house.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.2.ruler.jupiter.sign.any.house.any', '', 'ru-RU', 'Управитель 2-го дома — Юпитер: важны условия, где твои решения по теме дома становятся устойчивыми. Смотри, в каком знаке и доме стоит Юпитер: это подсказывает стиль и среду реализации.', 86, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.2.ruler.jupiter.sign.any.house.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Управитель 2-го дома (Сатурн) стоит в определённом знаке: это задаёт стиль проявления темы 2-го дома.', priority = 86, is_active = 1, meta_json = '{}'
WHERE key = 'natal.house.2.ruler.saturn.sign.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.2.ruler.saturn.sign.any', '', 'ru-RU', 'Управитель 2-го дома (Сатурн) стоит в определённом знаке: это задаёт стиль проявления темы 2-го дома.', 86, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.2.ruler.saturn.sign.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Управитель 2-го дома (Сатурн) расположен в некотором доме: это показывает, где именно «включается» тема 2-го дома.', priority = 86, is_active = 1, meta_json = '{}'
WHERE key = 'natal.house.2.ruler.saturn.house.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.2.ruler.saturn.house.any', '', 'ru-RU', 'Управитель 2-го дома (Сатурн) расположен в некотором доме: это показывает, где именно «включается» тема 2-го дома.', 86, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.2.ruler.saturn.house.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Управитель 2-го дома — Сатурн: важны условия, где твои решения по теме дома становятся устойчивыми. Смотри, в каком знаке и доме стоит Сатурн: это подсказывает стиль и среду реализации.', priority = 86, is_active = 1, meta_json = '{}'
WHERE key = 'natal.house.2.ruler.saturn.sign.any.house.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.2.ruler.saturn.sign.any.house.any', '', 'ru-RU', 'Управитель 2-го дома — Сатурн: важны условия, где твои решения по теме дома становятся устойчивыми. Смотри, в каком знаке и доме стоит Сатурн: это подсказывает стиль и среду реализации.', 86, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.2.ruler.saturn.sign.any.house.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Управитель 2-го дома (Уран) стоит в определённом знаке: это задаёт стиль проявления темы 2-го дома.', priority = 86, is_active = 1, meta_json = '{}'
WHERE key = 'natal.house.2.ruler.uranus.sign.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.2.ruler.uranus.sign.any', '', 'ru-RU', 'Управитель 2-го дома (Уран) стоит в определённом знаке: это задаёт стиль проявления темы 2-го дома.', 86, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.2.ruler.uranus.sign.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Управитель 2-го дома (Уран) расположен в некотором доме: это показывает, где именно «включается» тема 2-го дома.', priority = 86, is_active = 1, meta_json = '{}'
WHERE key = 'natal.house.2.ruler.uranus.house.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.2.ruler.uranus.house.any', '', 'ru-RU', 'Управитель 2-го дома (Уран) расположен в некотором доме: это показывает, где именно «включается» тема 2-го дома.', 86, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.2.ruler.uranus.house.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Управитель 2-го дома — Уран: важны условия, где твои решения по теме дома становятся устойчивыми. Смотри, в каком знаке и доме стоит Уран: это подсказывает стиль и среду реализации.', priority = 86, is_active = 1, meta_json = '{}'
WHERE key = 'natal.house.2.ruler.uranus.sign.any.house.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.2.ruler.uranus.sign.any.house.any', '', 'ru-RU', 'Управитель 2-го дома — Уран: важны условия, где твои решения по теме дома становятся устойчивыми. Смотри, в каком знаке и доме стоит Уран: это подсказывает стиль и среду реализации.', 86, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.2.ruler.uranus.sign.any.house.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Управитель 2-го дома (Нептун) стоит в определённом знаке: это задаёт стиль проявления темы 2-го дома.', priority = 86, is_active = 1, meta_json = '{}'
WHERE key = 'natal.house.2.ruler.neptune.sign.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.2.ruler.neptune.sign.any', '', 'ru-RU', 'Управитель 2-го дома (Нептун) стоит в определённом знаке: это задаёт стиль проявления темы 2-го дома.', 86, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.2.ruler.neptune.sign.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Управитель 2-го дома (Нептун) расположен в некотором доме: это показывает, где именно «включается» тема 2-го дома.', priority = 86, is_active = 1, meta_json = '{}'
WHERE key = 'natal.house.2.ruler.neptune.house.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.2.ruler.neptune.house.any', '', 'ru-RU', 'Управитель 2-го дома (Нептун) расположен в некотором доме: это показывает, где именно «включается» тема 2-го дома.', 86, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.2.ruler.neptune.house.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Управитель 2-го дома — Нептун: важны условия, где твои решения по теме дома становятся устойчивыми. Смотри, в каком знаке и доме стоит Нептун: это подсказывает стиль и среду реализации.', priority = 86, is_active = 1, meta_json = '{}'
WHERE key = 'natal.house.2.ruler.neptune.sign.any.house.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.2.ruler.neptune.sign.any.house.any', '', 'ru-RU', 'Управитель 2-го дома — Нептун: важны условия, где твои решения по теме дома становятся устойчивыми. Смотри, в каком знаке и доме стоит Нептун: это подсказывает стиль и среду реализации.', 86, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.2.ruler.neptune.sign.any.house.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Управитель 2-го дома (Плутон) стоит в определённом знаке: это задаёт стиль проявления темы 2-го дома.', priority = 86, is_active = 1, meta_json = '{}'
WHERE key = 'natal.house.2.ruler.pluto.sign.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.2.ruler.pluto.sign.any', '', 'ru-RU', 'Управитель 2-го дома (Плутон) стоит в определённом знаке: это задаёт стиль проявления темы 2-го дома.', 86, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.2.ruler.pluto.sign.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Управитель 2-го дома (Плутон) расположен в некотором доме: это показывает, где именно «включается» тема 2-го дома.', priority = 86, is_active = 1, meta_json = '{}'
WHERE key = 'natal.house.2.ruler.pluto.house.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.2.ruler.pluto.house.any', '', 'ru-RU', 'Управитель 2-го дома (Плутон) расположен в некотором доме: это показывает, где именно «включается» тема 2-го дома.', 86, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.2.ruler.pluto.house.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Управитель 2-го дома — Плутон: важны условия, где твои решения по теме дома становятся устойчивыми. Смотри, в каком знаке и доме стоит Плутон: это подсказывает стиль и среду реализации.', priority = 86, is_active = 1, meta_json = '{}'
WHERE key = 'natal.house.2.ruler.pluto.sign.any.house.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.2.ruler.pluto.sign.any.house.any', '', 'ru-RU', 'Управитель 2-го дома — Плутон: важны условия, где твои решения по теме дома становятся устойчивыми. Смотри, в каком знаке и доме стоит Плутон: это подсказывает стиль и среду реализации.', 86, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.2.ruler.pluto.sign.any.house.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Управитель 3-го дома (Солнце) стоит в определённом знаке: это задаёт стиль проявления темы 3-го дома.', priority = 86, is_active = 1, meta_json = '{}'
WHERE key = 'natal.house.3.ruler.sun.sign.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.3.ruler.sun.sign.any', '', 'ru-RU', 'Управитель 3-го дома (Солнце) стоит в определённом знаке: это задаёт стиль проявления темы 3-го дома.', 86, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.3.ruler.sun.sign.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Управитель 3-го дома (Солнце) расположен в некотором доме: это показывает, где именно «включается» тема 3-го дома.', priority = 86, is_active = 1, meta_json = '{}'
WHERE key = 'natal.house.3.ruler.sun.house.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.3.ruler.sun.house.any', '', 'ru-RU', 'Управитель 3-го дома (Солнце) расположен в некотором доме: это показывает, где именно «включается» тема 3-го дома.', 86, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.3.ruler.sun.house.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Управитель 3-го дома — Солнце: важны условия, где твои решения по теме дома становятся устойчивыми. Смотри, в каком знаке и доме стоит Солнце: это подсказывает стиль и среду реализации.', priority = 86, is_active = 1, meta_json = '{}'
WHERE key = 'natal.house.3.ruler.sun.sign.any.house.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.3.ruler.sun.sign.any.house.any', '', 'ru-RU', 'Управитель 3-го дома — Солнце: важны условия, где твои решения по теме дома становятся устойчивыми. Смотри, в каком знаке и доме стоит Солнце: это подсказывает стиль и среду реализации.', 86, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.3.ruler.sun.sign.any.house.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Управитель 3-го дома (Луна) стоит в определённом знаке: это задаёт стиль проявления темы 3-го дома.', priority = 86, is_active = 1, meta_json = '{}'
WHERE key = 'natal.house.3.ruler.moon.sign.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.3.ruler.moon.sign.any', '', 'ru-RU', 'Управитель 3-го дома (Луна) стоит в определённом знаке: это задаёт стиль проявления темы 3-го дома.', 86, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.3.ruler.moon.sign.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Управитель 3-го дома (Луна) расположен в некотором доме: это показывает, где именно «включается» тема 3-го дома.', priority = 86, is_active = 1, meta_json = '{}'
WHERE key = 'natal.house.3.ruler.moon.house.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.3.ruler.moon.house.any', '', 'ru-RU', 'Управитель 3-го дома (Луна) расположен в некотором доме: это показывает, где именно «включается» тема 3-го дома.', 86, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.3.ruler.moon.house.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Управитель 3-го дома — Луна: важны условия, где твои решения по теме дома становятся устойчивыми. Смотри, в каком знаке и доме стоит Луна: это подсказывает стиль и среду реализации.', priority = 86, is_active = 1, meta_json = '{}'
WHERE key = 'natal.house.3.ruler.moon.sign.any.house.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.3.ruler.moon.sign.any.house.any', '', 'ru-RU', 'Управитель 3-го дома — Луна: важны условия, где твои решения по теме дома становятся устойчивыми. Смотри, в каком знаке и доме стоит Луна: это подсказывает стиль и среду реализации.', 86, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.3.ruler.moon.sign.any.house.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Управитель 3-го дома (Меркурий) стоит в определённом знаке: это задаёт стиль проявления темы 3-го дома.', priority = 86, is_active = 1, meta_json = '{}'
WHERE key = 'natal.house.3.ruler.mercury.sign.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.3.ruler.mercury.sign.any', '', 'ru-RU', 'Управитель 3-го дома (Меркурий) стоит в определённом знаке: это задаёт стиль проявления темы 3-го дома.', 86, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.3.ruler.mercury.sign.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Управитель 3-го дома (Меркурий) расположен в некотором доме: это показывает, где именно «включается» тема 3-го дома.', priority = 86, is_active = 1, meta_json = '{}'
WHERE key = 'natal.house.3.ruler.mercury.house.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.3.ruler.mercury.house.any', '', 'ru-RU', 'Управитель 3-го дома (Меркурий) расположен в некотором доме: это показывает, где именно «включается» тема 3-го дома.', 86, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.3.ruler.mercury.house.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Управитель 3-го дома — Меркурий: важны условия, где твои решения по теме дома становятся устойчивыми. Смотри, в каком знаке и доме стоит Меркурий: это подсказывает стиль и среду реализации.', priority = 86, is_active = 1, meta_json = '{}'
WHERE key = 'natal.house.3.ruler.mercury.sign.any.house.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.3.ruler.mercury.sign.any.house.any', '', 'ru-RU', 'Управитель 3-го дома — Меркурий: важны условия, где твои решения по теме дома становятся устойчивыми. Смотри, в каком знаке и доме стоит Меркурий: это подсказывает стиль и среду реализации.', 86, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.3.ruler.mercury.sign.any.house.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Управитель 3-го дома (Венера) стоит в определённом знаке: это задаёт стиль проявления темы 3-го дома.', priority = 86, is_active = 1, meta_json = '{}'
WHERE key = 'natal.house.3.ruler.venus.sign.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.3.ruler.venus.sign.any', '', 'ru-RU', 'Управитель 3-го дома (Венера) стоит в определённом знаке: это задаёт стиль проявления темы 3-го дома.', 86, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.3.ruler.venus.sign.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Управитель 3-го дома (Венера) расположен в некотором доме: это показывает, где именно «включается» тема 3-го дома.', priority = 86, is_active = 1, meta_json = '{}'
WHERE key = 'natal.house.3.ruler.venus.house.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.3.ruler.venus.house.any', '', 'ru-RU', 'Управитель 3-го дома (Венера) расположен в некотором доме: это показывает, где именно «включается» тема 3-го дома.', 86, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.3.ruler.venus.house.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Управитель 3-го дома — Венера: важны условия, где твои решения по теме дома становятся устойчивыми. Смотри, в каком знаке и доме стоит Венера: это подсказывает стиль и среду реализации.', priority = 86, is_active = 1, meta_json = '{}'
WHERE key = 'natal.house.3.ruler.venus.sign.any.house.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.3.ruler.venus.sign.any.house.any', '', 'ru-RU', 'Управитель 3-го дома — Венера: важны условия, где твои решения по теме дома становятся устойчивыми. Смотри, в каком знаке и доме стоит Венера: это подсказывает стиль и среду реализации.', 86, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.3.ruler.venus.sign.any.house.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Управитель 3-го дома (Марс) стоит в определённом знаке: это задаёт стиль проявления темы 3-го дома.', priority = 86, is_active = 1, meta_json = '{}'
WHERE key = 'natal.house.3.ruler.mars.sign.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.3.ruler.mars.sign.any', '', 'ru-RU', 'Управитель 3-го дома (Марс) стоит в определённом знаке: это задаёт стиль проявления темы 3-го дома.', 86, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.3.ruler.mars.sign.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Управитель 3-го дома (Марс) расположен в некотором доме: это показывает, где именно «включается» тема 3-го дома.', priority = 86, is_active = 1, meta_json = '{}'
WHERE key = 'natal.house.3.ruler.mars.house.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.3.ruler.mars.house.any', '', 'ru-RU', 'Управитель 3-го дома (Марс) расположен в некотором доме: это показывает, где именно «включается» тема 3-го дома.', 86, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.3.ruler.mars.house.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Управитель 3-го дома — Марс: важны условия, где твои решения по теме дома становятся устойчивыми. Смотри, в каком знаке и доме стоит Марс: это подсказывает стиль и среду реализации.', priority = 86, is_active = 1, meta_json = '{}'
WHERE key = 'natal.house.3.ruler.mars.sign.any.house.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.3.ruler.mars.sign.any.house.any', '', 'ru-RU', 'Управитель 3-го дома — Марс: важны условия, где твои решения по теме дома становятся устойчивыми. Смотри, в каком знаке и доме стоит Марс: это подсказывает стиль и среду реализации.', 86, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.3.ruler.mars.sign.any.house.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Управитель 3-го дома (Юпитер) стоит в определённом знаке: это задаёт стиль проявления темы 3-го дома.', priority = 86, is_active = 1, meta_json = '{}'
WHERE key = 'natal.house.3.ruler.jupiter.sign.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.3.ruler.jupiter.sign.any', '', 'ru-RU', 'Управитель 3-го дома (Юпитер) стоит в определённом знаке: это задаёт стиль проявления темы 3-го дома.', 86, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.3.ruler.jupiter.sign.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Управитель 3-го дома (Юпитер) расположен в некотором доме: это показывает, где именно «включается» тема 3-го дома.', priority = 86, is_active = 1, meta_json = '{}'
WHERE key = 'natal.house.3.ruler.jupiter.house.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.3.ruler.jupiter.house.any', '', 'ru-RU', 'Управитель 3-го дома (Юпитер) расположен в некотором доме: это показывает, где именно «включается» тема 3-го дома.', 86, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.3.ruler.jupiter.house.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Управитель 3-го дома — Юпитер: важны условия, где твои решения по теме дома становятся устойчивыми. Смотри, в каком знаке и доме стоит Юпитер: это подсказывает стиль и среду реализации.', priority = 86, is_active = 1, meta_json = '{}'
WHERE key = 'natal.house.3.ruler.jupiter.sign.any.house.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.3.ruler.jupiter.sign.any.house.any', '', 'ru-RU', 'Управитель 3-го дома — Юпитер: важны условия, где твои решения по теме дома становятся устойчивыми. Смотри, в каком знаке и доме стоит Юпитер: это подсказывает стиль и среду реализации.', 86, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.3.ruler.jupiter.sign.any.house.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Управитель 3-го дома (Сатурн) стоит в определённом знаке: это задаёт стиль проявления темы 3-го дома.', priority = 86, is_active = 1, meta_json = '{}'
WHERE key = 'natal.house.3.ruler.saturn.sign.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.3.ruler.saturn.sign.any', '', 'ru-RU', 'Управитель 3-го дома (Сатурн) стоит в определённом знаке: это задаёт стиль проявления темы 3-го дома.', 86, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.3.ruler.saturn.sign.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Управитель 3-го дома (Сатурн) расположен в некотором доме: это показывает, где именно «включается» тема 3-го дома.', priority = 86, is_active = 1, meta_json = '{}'
WHERE key = 'natal.house.3.ruler.saturn.house.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.3.ruler.saturn.house.any', '', 'ru-RU', 'Управитель 3-го дома (Сатурн) расположен в некотором доме: это показывает, где именно «включается» тема 3-го дома.', 86, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.3.ruler.saturn.house.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Управитель 3-го дома — Сатурн: важны условия, где твои решения по теме дома становятся устойчивыми. Смотри, в каком знаке и доме стоит Сатурн: это подсказывает стиль и среду реализации.', priority = 86, is_active = 1, meta_json = '{}'
WHERE key = 'natal.house.3.ruler.saturn.sign.any.house.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.3.ruler.saturn.sign.any.house.any', '', 'ru-RU', 'Управитель 3-го дома — Сатурн: важны условия, где твои решения по теме дома становятся устойчивыми. Смотри, в каком знаке и доме стоит Сатурн: это подсказывает стиль и среду реализации.', 86, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.3.ruler.saturn.sign.any.house.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Управитель 3-го дома (Уран) стоит в определённом знаке: это задаёт стиль проявления темы 3-го дома.', priority = 86, is_active = 1, meta_json = '{}'
WHERE key = 'natal.house.3.ruler.uranus.sign.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.3.ruler.uranus.sign.any', '', 'ru-RU', 'Управитель 3-го дома (Уран) стоит в определённом знаке: это задаёт стиль проявления темы 3-го дома.', 86, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.3.ruler.uranus.sign.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Управитель 3-го дома (Уран) расположен в некотором доме: это показывает, где именно «включается» тема 3-го дома.', priority = 86, is_active = 1, meta_json = '{}'
WHERE key = 'natal.house.3.ruler.uranus.house.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.3.ruler.uranus.house.any', '', 'ru-RU', 'Управитель 3-го дома (Уран) расположен в некотором доме: это показывает, где именно «включается» тема 3-го дома.', 86, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.3.ruler.uranus.house.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Управитель 3-го дома — Уран: важны условия, где твои решения по теме дома становятся устойчивыми. Смотри, в каком знаке и доме стоит Уран: это подсказывает стиль и среду реализации.', priority = 86, is_active = 1, meta_json = '{}'
WHERE key = 'natal.house.3.ruler.uranus.sign.any.house.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.3.ruler.uranus.sign.any.house.any', '', 'ru-RU', 'Управитель 3-го дома — Уран: важны условия, где твои решения по теме дома становятся устойчивыми. Смотри, в каком знаке и доме стоит Уран: это подсказывает стиль и среду реализации.', 86, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.3.ruler.uranus.sign.any.house.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Управитель 3-го дома (Нептун) стоит в определённом знаке: это задаёт стиль проявления темы 3-го дома.', priority = 86, is_active = 1, meta_json = '{}'
WHERE key = 'natal.house.3.ruler.neptune.sign.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.3.ruler.neptune.sign.any', '', 'ru-RU', 'Управитель 3-го дома (Нептун) стоит в определённом знаке: это задаёт стиль проявления темы 3-го дома.', 86, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.3.ruler.neptune.sign.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Управитель 3-го дома (Нептун) расположен в некотором доме: это показывает, где именно «включается» тема 3-го дома.', priority = 86, is_active = 1, meta_json = '{}'
WHERE key = 'natal.house.3.ruler.neptune.house.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.3.ruler.neptune.house.any', '', 'ru-RU', 'Управитель 3-го дома (Нептун) расположен в некотором доме: это показывает, где именно «включается» тема 3-го дома.', 86, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.3.ruler.neptune.house.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Управитель 3-го дома — Нептун: важны условия, где твои решения по теме дома становятся устойчивыми. Смотри, в каком знаке и доме стоит Нептун: это подсказывает стиль и среду реализации.', priority = 86, is_active = 1, meta_json = '{}'
WHERE key = 'natal.house.3.ruler.neptune.sign.any.house.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.3.ruler.neptune.sign.any.house.any', '', 'ru-RU', 'Управитель 3-го дома — Нептун: важны условия, где твои решения по теме дома становятся устойчивыми. Смотри, в каком знаке и доме стоит Нептун: это подсказывает стиль и среду реализации.', 86, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.3.ruler.neptune.sign.any.house.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Управитель 3-го дома (Плутон) стоит в определённом знаке: это задаёт стиль проявления темы 3-го дома.', priority = 86, is_active = 1, meta_json = '{}'
WHERE key = 'natal.house.3.ruler.pluto.sign.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.3.ruler.pluto.sign.any', '', 'ru-RU', 'Управитель 3-го дома (Плутон) стоит в определённом знаке: это задаёт стиль проявления темы 3-го дома.', 86, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.3.ruler.pluto.sign.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Управитель 3-го дома (Плутон) расположен в некотором доме: это показывает, где именно «включается» тема 3-го дома.', priority = 86, is_active = 1, meta_json = '{}'
WHERE key = 'natal.house.3.ruler.pluto.house.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.3.ruler.pluto.house.any', '', 'ru-RU', 'Управитель 3-го дома (Плутон) расположен в некотором доме: это показывает, где именно «включается» тема 3-го дома.', 86, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.3.ruler.pluto.house.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Управитель 3-го дома — Плутон: важны условия, где твои решения по теме дома становятся устойчивыми. Смотри, в каком знаке и доме стоит Плутон: это подсказывает стиль и среду реализации.', priority = 86, is_active = 1, meta_json = '{}'
WHERE key = 'natal.house.3.ruler.pluto.sign.any.house.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.3.ruler.pluto.sign.any.house.any', '', 'ru-RU', 'Управитель 3-го дома — Плутон: важны условия, где твои решения по теме дома становятся устойчивыми. Смотри, в каком знаке и доме стоит Плутон: это подсказывает стиль и среду реализации.', 86, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.3.ruler.pluto.sign.any.house.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Управитель 4-го дома (Солнце) стоит в определённом знаке: это задаёт стиль проявления темы 4-го дома.', priority = 86, is_active = 1, meta_json = '{}'
WHERE key = 'natal.house.4.ruler.sun.sign.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.4.ruler.sun.sign.any', '', 'ru-RU', 'Управитель 4-го дома (Солнце) стоит в определённом знаке: это задаёт стиль проявления темы 4-го дома.', 86, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.4.ruler.sun.sign.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Управитель 4-го дома (Солнце) расположен в некотором доме: это показывает, где именно «включается» тема 4-го дома.', priority = 86, is_active = 1, meta_json = '{}'
WHERE key = 'natal.house.4.ruler.sun.house.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.4.ruler.sun.house.any', '', 'ru-RU', 'Управитель 4-го дома (Солнце) расположен в некотором доме: это показывает, где именно «включается» тема 4-го дома.', 86, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.4.ruler.sun.house.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Управитель 4-го дома — Солнце: важны условия, где твои решения по теме дома становятся устойчивыми. Смотри, в каком знаке и доме стоит Солнце: это подсказывает стиль и среду реализации.', priority = 86, is_active = 1, meta_json = '{}'
WHERE key = 'natal.house.4.ruler.sun.sign.any.house.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.4.ruler.sun.sign.any.house.any', '', 'ru-RU', 'Управитель 4-го дома — Солнце: важны условия, где твои решения по теме дома становятся устойчивыми. Смотри, в каком знаке и доме стоит Солнце: это подсказывает стиль и среду реализации.', 86, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.4.ruler.sun.sign.any.house.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Управитель 4-го дома (Луна) стоит в определённом знаке: это задаёт стиль проявления темы 4-го дома.', priority = 86, is_active = 1, meta_json = '{}'
WHERE key = 'natal.house.4.ruler.moon.sign.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.4.ruler.moon.sign.any', '', 'ru-RU', 'Управитель 4-го дома (Луна) стоит в определённом знаке: это задаёт стиль проявления темы 4-го дома.', 86, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.4.ruler.moon.sign.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Управитель 4-го дома (Луна) расположен в некотором доме: это показывает, где именно «включается» тема 4-го дома.', priority = 86, is_active = 1, meta_json = '{}'
WHERE key = 'natal.house.4.ruler.moon.house.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.4.ruler.moon.house.any', '', 'ru-RU', 'Управитель 4-го дома (Луна) расположен в некотором доме: это показывает, где именно «включается» тема 4-го дома.', 86, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.4.ruler.moon.house.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Управитель 4-го дома — Луна: важны условия, где твои решения по теме дома становятся устойчивыми. Смотри, в каком знаке и доме стоит Луна: это подсказывает стиль и среду реализации.', priority = 86, is_active = 1, meta_json = '{}'
WHERE key = 'natal.house.4.ruler.moon.sign.any.house.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.4.ruler.moon.sign.any.house.any', '', 'ru-RU', 'Управитель 4-го дома — Луна: важны условия, где твои решения по теме дома становятся устойчивыми. Смотри, в каком знаке и доме стоит Луна: это подсказывает стиль и среду реализации.', 86, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.4.ruler.moon.sign.any.house.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Управитель 4-го дома (Меркурий) стоит в определённом знаке: это задаёт стиль проявления темы 4-го дома.', priority = 86, is_active = 1, meta_json = '{}'
WHERE key = 'natal.house.4.ruler.mercury.sign.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.4.ruler.mercury.sign.any', '', 'ru-RU', 'Управитель 4-го дома (Меркурий) стоит в определённом знаке: это задаёт стиль проявления темы 4-го дома.', 86, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.4.ruler.mercury.sign.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Управитель 4-го дома (Меркурий) расположен в некотором доме: это показывает, где именно «включается» тема 4-го дома.', priority = 86, is_active = 1, meta_json = '{}'
WHERE key = 'natal.house.4.ruler.mercury.house.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.4.ruler.mercury.house.any', '', 'ru-RU', 'Управитель 4-го дома (Меркурий) расположен в некотором доме: это показывает, где именно «включается» тема 4-го дома.', 86, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.4.ruler.mercury.house.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Управитель 4-го дома — Меркурий: важны условия, где твои решения по теме дома становятся устойчивыми. Смотри, в каком знаке и доме стоит Меркурий: это подсказывает стиль и среду реализации.', priority = 86, is_active = 1, meta_json = '{}'
WHERE key = 'natal.house.4.ruler.mercury.sign.any.house.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.4.ruler.mercury.sign.any.house.any', '', 'ru-RU', 'Управитель 4-го дома — Меркурий: важны условия, где твои решения по теме дома становятся устойчивыми. Смотри, в каком знаке и доме стоит Меркурий: это подсказывает стиль и среду реализации.', 86, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.4.ruler.mercury.sign.any.house.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Управитель 4-го дома (Венера) стоит в определённом знаке: это задаёт стиль проявления темы 4-го дома.', priority = 86, is_active = 1, meta_json = '{}'
WHERE key = 'natal.house.4.ruler.venus.sign.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.4.ruler.venus.sign.any', '', 'ru-RU', 'Управитель 4-го дома (Венера) стоит в определённом знаке: это задаёт стиль проявления темы 4-го дома.', 86, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.4.ruler.venus.sign.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Управитель 4-го дома (Венера) расположен в некотором доме: это показывает, где именно «включается» тема 4-го дома.', priority = 86, is_active = 1, meta_json = '{}'
WHERE key = 'natal.house.4.ruler.venus.house.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.4.ruler.venus.house.any', '', 'ru-RU', 'Управитель 4-го дома (Венера) расположен в некотором доме: это показывает, где именно «включается» тема 4-го дома.', 86, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.4.ruler.venus.house.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Управитель 4-го дома — Венера: важны условия, где твои решения по теме дома становятся устойчивыми. Смотри, в каком знаке и доме стоит Венера: это подсказывает стиль и среду реализации.', priority = 86, is_active = 1, meta_json = '{}'
WHERE key = 'natal.house.4.ruler.venus.sign.any.house.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.4.ruler.venus.sign.any.house.any', '', 'ru-RU', 'Управитель 4-го дома — Венера: важны условия, где твои решения по теме дома становятся устойчивыми. Смотри, в каком знаке и доме стоит Венера: это подсказывает стиль и среду реализации.', 86, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.4.ruler.venus.sign.any.house.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Управитель 4-го дома (Марс) стоит в определённом знаке: это задаёт стиль проявления темы 4-го дома.', priority = 86, is_active = 1, meta_json = '{}'
WHERE key = 'natal.house.4.ruler.mars.sign.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.4.ruler.mars.sign.any', '', 'ru-RU', 'Управитель 4-го дома (Марс) стоит в определённом знаке: это задаёт стиль проявления темы 4-го дома.', 86, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.4.ruler.mars.sign.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Управитель 4-го дома (Марс) расположен в некотором доме: это показывает, где именно «включается» тема 4-го дома.', priority = 86, is_active = 1, meta_json = '{}'
WHERE key = 'natal.house.4.ruler.mars.house.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.4.ruler.mars.house.any', '', 'ru-RU', 'Управитель 4-го дома (Марс) расположен в некотором доме: это показывает, где именно «включается» тема 4-го дома.', 86, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.4.ruler.mars.house.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Управитель 4-го дома — Марс: важны условия, где твои решения по теме дома становятся устойчивыми. Смотри, в каком знаке и доме стоит Марс: это подсказывает стиль и среду реализации.', priority = 86, is_active = 1, meta_json = '{}'
WHERE key = 'natal.house.4.ruler.mars.sign.any.house.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.4.ruler.mars.sign.any.house.any', '', 'ru-RU', 'Управитель 4-го дома — Марс: важны условия, где твои решения по теме дома становятся устойчивыми. Смотри, в каком знаке и доме стоит Марс: это подсказывает стиль и среду реализации.', 86, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.4.ruler.mars.sign.any.house.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Управитель 4-го дома (Юпитер) стоит в определённом знаке: это задаёт стиль проявления темы 4-го дома.', priority = 86, is_active = 1, meta_json = '{}'
WHERE key = 'natal.house.4.ruler.jupiter.sign.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.4.ruler.jupiter.sign.any', '', 'ru-RU', 'Управитель 4-го дома (Юпитер) стоит в определённом знаке: это задаёт стиль проявления темы 4-го дома.', 86, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.4.ruler.jupiter.sign.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Управитель 4-го дома (Юпитер) расположен в некотором доме: это показывает, где именно «включается» тема 4-го дома.', priority = 86, is_active = 1, meta_json = '{}'
WHERE key = 'natal.house.4.ruler.jupiter.house.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.4.ruler.jupiter.house.any', '', 'ru-RU', 'Управитель 4-го дома (Юпитер) расположен в некотором доме: это показывает, где именно «включается» тема 4-го дома.', 86, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.4.ruler.jupiter.house.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Управитель 4-го дома — Юпитер: важны условия, где твои решения по теме дома становятся устойчивыми. Смотри, в каком знаке и доме стоит Юпитер: это подсказывает стиль и среду реализации.', priority = 86, is_active = 1, meta_json = '{}'
WHERE key = 'natal.house.4.ruler.jupiter.sign.any.house.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.4.ruler.jupiter.sign.any.house.any', '', 'ru-RU', 'Управитель 4-го дома — Юпитер: важны условия, где твои решения по теме дома становятся устойчивыми. Смотри, в каком знаке и доме стоит Юпитер: это подсказывает стиль и среду реализации.', 86, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.4.ruler.jupiter.sign.any.house.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Управитель 4-го дома (Сатурн) стоит в определённом знаке: это задаёт стиль проявления темы 4-го дома.', priority = 86, is_active = 1, meta_json = '{}'
WHERE key = 'natal.house.4.ruler.saturn.sign.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.4.ruler.saturn.sign.any', '', 'ru-RU', 'Управитель 4-го дома (Сатурн) стоит в определённом знаке: это задаёт стиль проявления темы 4-го дома.', 86, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.4.ruler.saturn.sign.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Управитель 4-го дома (Сатурн) расположен в некотором доме: это показывает, где именно «включается» тема 4-го дома.', priority = 86, is_active = 1, meta_json = '{}'
WHERE key = 'natal.house.4.ruler.saturn.house.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.4.ruler.saturn.house.any', '', 'ru-RU', 'Управитель 4-го дома (Сатурн) расположен в некотором доме: это показывает, где именно «включается» тема 4-го дома.', 86, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.4.ruler.saturn.house.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Управитель 4-го дома — Сатурн: важны условия, где твои решения по теме дома становятся устойчивыми. Смотри, в каком знаке и доме стоит Сатурн: это подсказывает стиль и среду реализации.', priority = 86, is_active = 1, meta_json = '{}'
WHERE key = 'natal.house.4.ruler.saturn.sign.any.house.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.4.ruler.saturn.sign.any.house.any', '', 'ru-RU', 'Управитель 4-го дома — Сатурн: важны условия, где твои решения по теме дома становятся устойчивыми. Смотри, в каком знаке и доме стоит Сатурн: это подсказывает стиль и среду реализации.', 86, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.4.ruler.saturn.sign.any.house.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Управитель 4-го дома (Уран) стоит в определённом знаке: это задаёт стиль проявления темы 4-го дома.', priority = 86, is_active = 1, meta_json = '{}'
WHERE key = 'natal.house.4.ruler.uranus.sign.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.4.ruler.uranus.sign.any', '', 'ru-RU', 'Управитель 4-го дома (Уран) стоит в определённом знаке: это задаёт стиль проявления темы 4-го дома.', 86, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.4.ruler.uranus.sign.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Управитель 4-го дома (Уран) расположен в некотором доме: это показывает, где именно «включается» тема 4-го дома.', priority = 86, is_active = 1, meta_json = '{}'
WHERE key = 'natal.house.4.ruler.uranus.house.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.4.ruler.uranus.house.any', '', 'ru-RU', 'Управитель 4-го дома (Уран) расположен в некотором доме: это показывает, где именно «включается» тема 4-го дома.', 86, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.4.ruler.uranus.house.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Управитель 4-го дома — Уран: важны условия, где твои решения по теме дома становятся устойчивыми. Смотри, в каком знаке и доме стоит Уран: это подсказывает стиль и среду реализации.', priority = 86, is_active = 1, meta_json = '{}'
WHERE key = 'natal.house.4.ruler.uranus.sign.any.house.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.4.ruler.uranus.sign.any.house.any', '', 'ru-RU', 'Управитель 4-го дома — Уран: важны условия, где твои решения по теме дома становятся устойчивыми. Смотри, в каком знаке и доме стоит Уран: это подсказывает стиль и среду реализации.', 86, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.4.ruler.uranus.sign.any.house.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Управитель 4-го дома (Нептун) стоит в определённом знаке: это задаёт стиль проявления темы 4-го дома.', priority = 86, is_active = 1, meta_json = '{}'
WHERE key = 'natal.house.4.ruler.neptune.sign.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.4.ruler.neptune.sign.any', '', 'ru-RU', 'Управитель 4-го дома (Нептун) стоит в определённом знаке: это задаёт стиль проявления темы 4-го дома.', 86, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.4.ruler.neptune.sign.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Управитель 4-го дома (Нептун) расположен в некотором доме: это показывает, где именно «включается» тема 4-го дома.', priority = 86, is_active = 1, meta_json = '{}'
WHERE key = 'natal.house.4.ruler.neptune.house.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.4.ruler.neptune.house.any', '', 'ru-RU', 'Управитель 4-го дома (Нептун) расположен в некотором доме: это показывает, где именно «включается» тема 4-го дома.', 86, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.4.ruler.neptune.house.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Управитель 4-го дома — Нептун: важны условия, где твои решения по теме дома становятся устойчивыми. Смотри, в каком знаке и доме стоит Нептун: это подсказывает стиль и среду реализации.', priority = 86, is_active = 1, meta_json = '{}'
WHERE key = 'natal.house.4.ruler.neptune.sign.any.house.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.4.ruler.neptune.sign.any.house.any', '', 'ru-RU', 'Управитель 4-го дома — Нептун: важны условия, где твои решения по теме дома становятся устойчивыми. Смотри, в каком знаке и доме стоит Нептун: это подсказывает стиль и среду реализации.', 86, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.4.ruler.neptune.sign.any.house.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Управитель 4-го дома (Плутон) стоит в определённом знаке: это задаёт стиль проявления темы 4-го дома.', priority = 86, is_active = 1, meta_json = '{}'
WHERE key = 'natal.house.4.ruler.pluto.sign.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.4.ruler.pluto.sign.any', '', 'ru-RU', 'Управитель 4-го дома (Плутон) стоит в определённом знаке: это задаёт стиль проявления темы 4-го дома.', 86, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.4.ruler.pluto.sign.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Управитель 4-го дома (Плутон) расположен в некотором доме: это показывает, где именно «включается» тема 4-го дома.', priority = 86, is_active = 1, meta_json = '{}'
WHERE key = 'natal.house.4.ruler.pluto.house.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.4.ruler.pluto.house.any', '', 'ru-RU', 'Управитель 4-го дома (Плутон) расположен в некотором доме: это показывает, где именно «включается» тема 4-го дома.', 86, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.4.ruler.pluto.house.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Управитель 4-го дома — Плутон: важны условия, где твои решения по теме дома становятся устойчивыми. Смотри, в каком знаке и доме стоит Плутон: это подсказывает стиль и среду реализации.', priority = 86, is_active = 1, meta_json = '{}'
WHERE key = 'natal.house.4.ruler.pluto.sign.any.house.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.4.ruler.pluto.sign.any.house.any', '', 'ru-RU', 'Управитель 4-го дома — Плутон: важны условия, где твои решения по теме дома становятся устойчивыми. Смотри, в каком знаке и доме стоит Плутон: это подсказывает стиль и среду реализации.', 86, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.4.ruler.pluto.sign.any.house.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Управитель 5-го дома (Солнце) стоит в определённом знаке: это задаёт стиль проявления темы 5-го дома.', priority = 86, is_active = 1, meta_json = '{}'
WHERE key = 'natal.house.5.ruler.sun.sign.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.5.ruler.sun.sign.any', '', 'ru-RU', 'Управитель 5-го дома (Солнце) стоит в определённом знаке: это задаёт стиль проявления темы 5-го дома.', 86, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.5.ruler.sun.sign.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Управитель 5-го дома (Солнце) расположен в некотором доме: это показывает, где именно «включается» тема 5-го дома.', priority = 86, is_active = 1, meta_json = '{}'
WHERE key = 'natal.house.5.ruler.sun.house.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.5.ruler.sun.house.any', '', 'ru-RU', 'Управитель 5-го дома (Солнце) расположен в некотором доме: это показывает, где именно «включается» тема 5-го дома.', 86, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.5.ruler.sun.house.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Управитель 5-го дома — Солнце: важны условия, где твои решения по теме дома становятся устойчивыми. Смотри, в каком знаке и доме стоит Солнце: это подсказывает стиль и среду реализации.', priority = 86, is_active = 1, meta_json = '{}'
WHERE key = 'natal.house.5.ruler.sun.sign.any.house.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.5.ruler.sun.sign.any.house.any', '', 'ru-RU', 'Управитель 5-го дома — Солнце: важны условия, где твои решения по теме дома становятся устойчивыми. Смотри, в каком знаке и доме стоит Солнце: это подсказывает стиль и среду реализации.', 86, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.5.ruler.sun.sign.any.house.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Управитель 5-го дома (Луна) стоит в определённом знаке: это задаёт стиль проявления темы 5-го дома.', priority = 86, is_active = 1, meta_json = '{}'
WHERE key = 'natal.house.5.ruler.moon.sign.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.5.ruler.moon.sign.any', '', 'ru-RU', 'Управитель 5-го дома (Луна) стоит в определённом знаке: это задаёт стиль проявления темы 5-го дома.', 86, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.5.ruler.moon.sign.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Управитель 5-го дома (Луна) расположен в некотором доме: это показывает, где именно «включается» тема 5-го дома.', priority = 86, is_active = 1, meta_json = '{}'
WHERE key = 'natal.house.5.ruler.moon.house.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.5.ruler.moon.house.any', '', 'ru-RU', 'Управитель 5-го дома (Луна) расположен в некотором доме: это показывает, где именно «включается» тема 5-го дома.', 86, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.5.ruler.moon.house.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Управитель 5-го дома — Луна: важны условия, где твои решения по теме дома становятся устойчивыми. Смотри, в каком знаке и доме стоит Луна: это подсказывает стиль и среду реализации.', priority = 86, is_active = 1, meta_json = '{}'
WHERE key = 'natal.house.5.ruler.moon.sign.any.house.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.5.ruler.moon.sign.any.house.any', '', 'ru-RU', 'Управитель 5-го дома — Луна: важны условия, где твои решения по теме дома становятся устойчивыми. Смотри, в каком знаке и доме стоит Луна: это подсказывает стиль и среду реализации.', 86, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.5.ruler.moon.sign.any.house.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Управитель 5-го дома (Меркурий) стоит в определённом знаке: это задаёт стиль проявления темы 5-го дома.', priority = 86, is_active = 1, meta_json = '{}'
WHERE key = 'natal.house.5.ruler.mercury.sign.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.5.ruler.mercury.sign.any', '', 'ru-RU', 'Управитель 5-го дома (Меркурий) стоит в определённом знаке: это задаёт стиль проявления темы 5-го дома.', 86, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.5.ruler.mercury.sign.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Управитель 5-го дома (Меркурий) расположен в некотором доме: это показывает, где именно «включается» тема 5-го дома.', priority = 86, is_active = 1, meta_json = '{}'
WHERE key = 'natal.house.5.ruler.mercury.house.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.5.ruler.mercury.house.any', '', 'ru-RU', 'Управитель 5-го дома (Меркурий) расположен в некотором доме: это показывает, где именно «включается» тема 5-го дома.', 86, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.5.ruler.mercury.house.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Управитель 5-го дома — Меркурий: важны условия, где твои решения по теме дома становятся устойчивыми. Смотри, в каком знаке и доме стоит Меркурий: это подсказывает стиль и среду реализации.', priority = 86, is_active = 1, meta_json = '{}'
WHERE key = 'natal.house.5.ruler.mercury.sign.any.house.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.5.ruler.mercury.sign.any.house.any', '', 'ru-RU', 'Управитель 5-го дома — Меркурий: важны условия, где твои решения по теме дома становятся устойчивыми. Смотри, в каком знаке и доме стоит Меркурий: это подсказывает стиль и среду реализации.', 86, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.5.ruler.mercury.sign.any.house.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Управитель 5-го дома (Венера) стоит в определённом знаке: это задаёт стиль проявления темы 5-го дома.', priority = 86, is_active = 1, meta_json = '{}'
WHERE key = 'natal.house.5.ruler.venus.sign.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.5.ruler.venus.sign.any', '', 'ru-RU', 'Управитель 5-го дома (Венера) стоит в определённом знаке: это задаёт стиль проявления темы 5-го дома.', 86, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.5.ruler.venus.sign.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Управитель 5-го дома (Венера) расположен в некотором доме: это показывает, где именно «включается» тема 5-го дома.', priority = 86, is_active = 1, meta_json = '{}'
WHERE key = 'natal.house.5.ruler.venus.house.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.5.ruler.venus.house.any', '', 'ru-RU', 'Управитель 5-го дома (Венера) расположен в некотором доме: это показывает, где именно «включается» тема 5-го дома.', 86, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.5.ruler.venus.house.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Управитель 5-го дома — Венера: важны условия, где твои решения по теме дома становятся устойчивыми. Смотри, в каком знаке и доме стоит Венера: это подсказывает стиль и среду реализации.', priority = 86, is_active = 1, meta_json = '{}'
WHERE key = 'natal.house.5.ruler.venus.sign.any.house.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.5.ruler.venus.sign.any.house.any', '', 'ru-RU', 'Управитель 5-го дома — Венера: важны условия, где твои решения по теме дома становятся устойчивыми. Смотри, в каком знаке и доме стоит Венера: это подсказывает стиль и среду реализации.', 86, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.5.ruler.venus.sign.any.house.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Управитель 5-го дома (Марс) стоит в определённом знаке: это задаёт стиль проявления темы 5-го дома.', priority = 86, is_active = 1, meta_json = '{}'
WHERE key = 'natal.house.5.ruler.mars.sign.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.5.ruler.mars.sign.any', '', 'ru-RU', 'Управитель 5-го дома (Марс) стоит в определённом знаке: это задаёт стиль проявления темы 5-го дома.', 86, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.5.ruler.mars.sign.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Управитель 5-го дома (Марс) расположен в некотором доме: это показывает, где именно «включается» тема 5-го дома.', priority = 86, is_active = 1, meta_json = '{}'
WHERE key = 'natal.house.5.ruler.mars.house.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.5.ruler.mars.house.any', '', 'ru-RU', 'Управитель 5-го дома (Марс) расположен в некотором доме: это показывает, где именно «включается» тема 5-го дома.', 86, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.5.ruler.mars.house.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Управитель 5-го дома — Марс: важны условия, где твои решения по теме дома становятся устойчивыми. Смотри, в каком знаке и доме стоит Марс: это подсказывает стиль и среду реализации.', priority = 86, is_active = 1, meta_json = '{}'
WHERE key = 'natal.house.5.ruler.mars.sign.any.house.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.5.ruler.mars.sign.any.house.any', '', 'ru-RU', 'Управитель 5-го дома — Марс: важны условия, где твои решения по теме дома становятся устойчивыми. Смотри, в каком знаке и доме стоит Марс: это подсказывает стиль и среду реализации.', 86, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.5.ruler.mars.sign.any.house.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Управитель 5-го дома (Юпитер) стоит в определённом знаке: это задаёт стиль проявления темы 5-го дома.', priority = 86, is_active = 1, meta_json = '{}'
WHERE key = 'natal.house.5.ruler.jupiter.sign.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.5.ruler.jupiter.sign.any', '', 'ru-RU', 'Управитель 5-го дома (Юпитер) стоит в определённом знаке: это задаёт стиль проявления темы 5-го дома.', 86, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.5.ruler.jupiter.sign.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Управитель 5-го дома (Юпитер) расположен в некотором доме: это показывает, где именно «включается» тема 5-го дома.', priority = 86, is_active = 1, meta_json = '{}'
WHERE key = 'natal.house.5.ruler.jupiter.house.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.5.ruler.jupiter.house.any', '', 'ru-RU', 'Управитель 5-го дома (Юпитер) расположен в некотором доме: это показывает, где именно «включается» тема 5-го дома.', 86, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.5.ruler.jupiter.house.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Управитель 5-го дома — Юпитер: важны условия, где твои решения по теме дома становятся устойчивыми. Смотри, в каком знаке и доме стоит Юпитер: это подсказывает стиль и среду реализации.', priority = 86, is_active = 1, meta_json = '{}'
WHERE key = 'natal.house.5.ruler.jupiter.sign.any.house.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.5.ruler.jupiter.sign.any.house.any', '', 'ru-RU', 'Управитель 5-го дома — Юпитер: важны условия, где твои решения по теме дома становятся устойчивыми. Смотри, в каком знаке и доме стоит Юпитер: это подсказывает стиль и среду реализации.', 86, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.5.ruler.jupiter.sign.any.house.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Управитель 5-го дома (Сатурн) стоит в определённом знаке: это задаёт стиль проявления темы 5-го дома.', priority = 86, is_active = 1, meta_json = '{}'
WHERE key = 'natal.house.5.ruler.saturn.sign.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.5.ruler.saturn.sign.any', '', 'ru-RU', 'Управитель 5-го дома (Сатурн) стоит в определённом знаке: это задаёт стиль проявления темы 5-го дома.', 86, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.5.ruler.saturn.sign.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Управитель 5-го дома (Сатурн) расположен в некотором доме: это показывает, где именно «включается» тема 5-го дома.', priority = 86, is_active = 1, meta_json = '{}'
WHERE key = 'natal.house.5.ruler.saturn.house.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.5.ruler.saturn.house.any', '', 'ru-RU', 'Управитель 5-го дома (Сатурн) расположен в некотором доме: это показывает, где именно «включается» тема 5-го дома.', 86, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.5.ruler.saturn.house.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Управитель 5-го дома — Сатурн: важны условия, где твои решения по теме дома становятся устойчивыми. Смотри, в каком знаке и доме стоит Сатурн: это подсказывает стиль и среду реализации.', priority = 86, is_active = 1, meta_json = '{}'
WHERE key = 'natal.house.5.ruler.saturn.sign.any.house.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.5.ruler.saturn.sign.any.house.any', '', 'ru-RU', 'Управитель 5-го дома — Сатурн: важны условия, где твои решения по теме дома становятся устойчивыми. Смотри, в каком знаке и доме стоит Сатурн: это подсказывает стиль и среду реализации.', 86, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.5.ruler.saturn.sign.any.house.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Управитель 5-го дома (Уран) стоит в определённом знаке: это задаёт стиль проявления темы 5-го дома.', priority = 86, is_active = 1, meta_json = '{}'
WHERE key = 'natal.house.5.ruler.uranus.sign.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.5.ruler.uranus.sign.any', '', 'ru-RU', 'Управитель 5-го дома (Уран) стоит в определённом знаке: это задаёт стиль проявления темы 5-го дома.', 86, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.5.ruler.uranus.sign.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Управитель 5-го дома (Уран) расположен в некотором доме: это показывает, где именно «включается» тема 5-го дома.', priority = 86, is_active = 1, meta_json = '{}'
WHERE key = 'natal.house.5.ruler.uranus.house.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.5.ruler.uranus.house.any', '', 'ru-RU', 'Управитель 5-го дома (Уран) расположен в некотором доме: это показывает, где именно «включается» тема 5-го дома.', 86, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.5.ruler.uranus.house.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Управитель 5-го дома — Уран: важны условия, где твои решения по теме дома становятся устойчивыми. Смотри, в каком знаке и доме стоит Уран: это подсказывает стиль и среду реализации.', priority = 86, is_active = 1, meta_json = '{}'
WHERE key = 'natal.house.5.ruler.uranus.sign.any.house.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.5.ruler.uranus.sign.any.house.any', '', 'ru-RU', 'Управитель 5-го дома — Уран: важны условия, где твои решения по теме дома становятся устойчивыми. Смотри, в каком знаке и доме стоит Уран: это подсказывает стиль и среду реализации.', 86, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.5.ruler.uranus.sign.any.house.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Управитель 5-го дома (Нептун) стоит в определённом знаке: это задаёт стиль проявления темы 5-го дома.', priority = 86, is_active = 1, meta_json = '{}'
WHERE key = 'natal.house.5.ruler.neptune.sign.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.5.ruler.neptune.sign.any', '', 'ru-RU', 'Управитель 5-го дома (Нептун) стоит в определённом знаке: это задаёт стиль проявления темы 5-го дома.', 86, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.5.ruler.neptune.sign.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Управитель 5-го дома (Нептун) расположен в некотором доме: это показывает, где именно «включается» тема 5-го дома.', priority = 86, is_active = 1, meta_json = '{}'
WHERE key = 'natal.house.5.ruler.neptune.house.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.5.ruler.neptune.house.any', '', 'ru-RU', 'Управитель 5-го дома (Нептун) расположен в некотором доме: это показывает, где именно «включается» тема 5-го дома.', 86, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.5.ruler.neptune.house.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Управитель 5-го дома — Нептун: важны условия, где твои решения по теме дома становятся устойчивыми. Смотри, в каком знаке и доме стоит Нептун: это подсказывает стиль и среду реализации.', priority = 86, is_active = 1, meta_json = '{}'
WHERE key = 'natal.house.5.ruler.neptune.sign.any.house.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.5.ruler.neptune.sign.any.house.any', '', 'ru-RU', 'Управитель 5-го дома — Нептун: важны условия, где твои решения по теме дома становятся устойчивыми. Смотри, в каком знаке и доме стоит Нептун: это подсказывает стиль и среду реализации.', 86, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.5.ruler.neptune.sign.any.house.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Управитель 5-го дома (Плутон) стоит в определённом знаке: это задаёт стиль проявления темы 5-го дома.', priority = 86, is_active = 1, meta_json = '{}'
WHERE key = 'natal.house.5.ruler.pluto.sign.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.5.ruler.pluto.sign.any', '', 'ru-RU', 'Управитель 5-го дома (Плутон) стоит в определённом знаке: это задаёт стиль проявления темы 5-го дома.', 86, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.5.ruler.pluto.sign.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Управитель 5-го дома (Плутон) расположен в некотором доме: это показывает, где именно «включается» тема 5-го дома.', priority = 86, is_active = 1, meta_json = '{}'
WHERE key = 'natal.house.5.ruler.pluto.house.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.5.ruler.pluto.house.any', '', 'ru-RU', 'Управитель 5-го дома (Плутон) расположен в некотором доме: это показывает, где именно «включается» тема 5-го дома.', 86, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.5.ruler.pluto.house.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Управитель 5-го дома — Плутон: важны условия, где твои решения по теме дома становятся устойчивыми. Смотри, в каком знаке и доме стоит Плутон: это подсказывает стиль и среду реализации.', priority = 86, is_active = 1, meta_json = '{}'
WHERE key = 'natal.house.5.ruler.pluto.sign.any.house.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.5.ruler.pluto.sign.any.house.any', '', 'ru-RU', 'Управитель 5-го дома — Плутон: важны условия, где твои решения по теме дома становятся устойчивыми. Смотри, в каком знаке и доме стоит Плутон: это подсказывает стиль и среду реализации.', 86, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.5.ruler.pluto.sign.any.house.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Управитель 6-го дома (Солнце) стоит в определённом знаке: это задаёт стиль проявления темы 6-го дома.', priority = 86, is_active = 1, meta_json = '{}'
WHERE key = 'natal.house.6.ruler.sun.sign.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.6.ruler.sun.sign.any', '', 'ru-RU', 'Управитель 6-го дома (Солнце) стоит в определённом знаке: это задаёт стиль проявления темы 6-го дома.', 86, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.6.ruler.sun.sign.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Управитель 6-го дома (Солнце) расположен в некотором доме: это показывает, где именно «включается» тема 6-го дома.', priority = 86, is_active = 1, meta_json = '{}'
WHERE key = 'natal.house.6.ruler.sun.house.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.6.ruler.sun.house.any', '', 'ru-RU', 'Управитель 6-го дома (Солнце) расположен в некотором доме: это показывает, где именно «включается» тема 6-го дома.', 86, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.6.ruler.sun.house.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Управитель 6-го дома — Солнце: важны условия, где твои решения по теме дома становятся устойчивыми. Смотри, в каком знаке и доме стоит Солнце: это подсказывает стиль и среду реализации.', priority = 86, is_active = 1, meta_json = '{}'
WHERE key = 'natal.house.6.ruler.sun.sign.any.house.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.6.ruler.sun.sign.any.house.any', '', 'ru-RU', 'Управитель 6-го дома — Солнце: важны условия, где твои решения по теме дома становятся устойчивыми. Смотри, в каком знаке и доме стоит Солнце: это подсказывает стиль и среду реализации.', 86, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.6.ruler.sun.sign.any.house.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Управитель 6-го дома (Луна) стоит в определённом знаке: это задаёт стиль проявления темы 6-го дома.', priority = 86, is_active = 1, meta_json = '{}'
WHERE key = 'natal.house.6.ruler.moon.sign.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.6.ruler.moon.sign.any', '', 'ru-RU', 'Управитель 6-го дома (Луна) стоит в определённом знаке: это задаёт стиль проявления темы 6-го дома.', 86, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.6.ruler.moon.sign.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Управитель 6-го дома (Луна) расположен в некотором доме: это показывает, где именно «включается» тема 6-го дома.', priority = 86, is_active = 1, meta_json = '{}'
WHERE key = 'natal.house.6.ruler.moon.house.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.6.ruler.moon.house.any', '', 'ru-RU', 'Управитель 6-го дома (Луна) расположен в некотором доме: это показывает, где именно «включается» тема 6-го дома.', 86, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.6.ruler.moon.house.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Управитель 6-го дома — Луна: важны условия, где твои решения по теме дома становятся устойчивыми. Смотри, в каком знаке и доме стоит Луна: это подсказывает стиль и среду реализации.', priority = 86, is_active = 1, meta_json = '{}'
WHERE key = 'natal.house.6.ruler.moon.sign.any.house.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.6.ruler.moon.sign.any.house.any', '', 'ru-RU', 'Управитель 6-го дома — Луна: важны условия, где твои решения по теме дома становятся устойчивыми. Смотри, в каком знаке и доме стоит Луна: это подсказывает стиль и среду реализации.', 86, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.6.ruler.moon.sign.any.house.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Управитель 6-го дома (Меркурий) стоит в определённом знаке: это задаёт стиль проявления темы 6-го дома.', priority = 86, is_active = 1, meta_json = '{}'
WHERE key = 'natal.house.6.ruler.mercury.sign.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.6.ruler.mercury.sign.any', '', 'ru-RU', 'Управитель 6-го дома (Меркурий) стоит в определённом знаке: это задаёт стиль проявления темы 6-го дома.', 86, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.6.ruler.mercury.sign.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Управитель 6-го дома (Меркурий) расположен в некотором доме: это показывает, где именно «включается» тема 6-го дома.', priority = 86, is_active = 1, meta_json = '{}'
WHERE key = 'natal.house.6.ruler.mercury.house.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.6.ruler.mercury.house.any', '', 'ru-RU', 'Управитель 6-го дома (Меркурий) расположен в некотором доме: это показывает, где именно «включается» тема 6-го дома.', 86, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.6.ruler.mercury.house.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Управитель 6-го дома — Меркурий: важны условия, где твои решения по теме дома становятся устойчивыми. Смотри, в каком знаке и доме стоит Меркурий: это подсказывает стиль и среду реализации.', priority = 86, is_active = 1, meta_json = '{}'
WHERE key = 'natal.house.6.ruler.mercury.sign.any.house.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.6.ruler.mercury.sign.any.house.any', '', 'ru-RU', 'Управитель 6-го дома — Меркурий: важны условия, где твои решения по теме дома становятся устойчивыми. Смотри, в каком знаке и доме стоит Меркурий: это подсказывает стиль и среду реализации.', 86, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.6.ruler.mercury.sign.any.house.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Управитель 6-го дома (Венера) стоит в определённом знаке: это задаёт стиль проявления темы 6-го дома.', priority = 86, is_active = 1, meta_json = '{}'
WHERE key = 'natal.house.6.ruler.venus.sign.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.6.ruler.venus.sign.any', '', 'ru-RU', 'Управитель 6-го дома (Венера) стоит в определённом знаке: это задаёт стиль проявления темы 6-го дома.', 86, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.6.ruler.venus.sign.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Управитель 6-го дома (Венера) расположен в некотором доме: это показывает, где именно «включается» тема 6-го дома.', priority = 86, is_active = 1, meta_json = '{}'
WHERE key = 'natal.house.6.ruler.venus.house.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.6.ruler.venus.house.any', '', 'ru-RU', 'Управитель 6-го дома (Венера) расположен в некотором доме: это показывает, где именно «включается» тема 6-го дома.', 86, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.6.ruler.venus.house.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Управитель 6-го дома — Венера: важны условия, где твои решения по теме дома становятся устойчивыми. Смотри, в каком знаке и доме стоит Венера: это подсказывает стиль и среду реализации.', priority = 86, is_active = 1, meta_json = '{}'
WHERE key = 'natal.house.6.ruler.venus.sign.any.house.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.6.ruler.venus.sign.any.house.any', '', 'ru-RU', 'Управитель 6-го дома — Венера: важны условия, где твои решения по теме дома становятся устойчивыми. Смотри, в каком знаке и доме стоит Венера: это подсказывает стиль и среду реализации.', 86, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.6.ruler.venus.sign.any.house.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Управитель 6-го дома (Марс) стоит в определённом знаке: это задаёт стиль проявления темы 6-го дома.', priority = 86, is_active = 1, meta_json = '{}'
WHERE key = 'natal.house.6.ruler.mars.sign.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.6.ruler.mars.sign.any', '', 'ru-RU', 'Управитель 6-го дома (Марс) стоит в определённом знаке: это задаёт стиль проявления темы 6-го дома.', 86, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.6.ruler.mars.sign.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Управитель 6-го дома (Марс) расположен в некотором доме: это показывает, где именно «включается» тема 6-го дома.', priority = 86, is_active = 1, meta_json = '{}'
WHERE key = 'natal.house.6.ruler.mars.house.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.6.ruler.mars.house.any', '', 'ru-RU', 'Управитель 6-го дома (Марс) расположен в некотором доме: это показывает, где именно «включается» тема 6-го дома.', 86, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.6.ruler.mars.house.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Управитель 6-го дома — Марс: важны условия, где твои решения по теме дома становятся устойчивыми. Смотри, в каком знаке и доме стоит Марс: это подсказывает стиль и среду реализации.', priority = 86, is_active = 1, meta_json = '{}'
WHERE key = 'natal.house.6.ruler.mars.sign.any.house.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.6.ruler.mars.sign.any.house.any', '', 'ru-RU', 'Управитель 6-го дома — Марс: важны условия, где твои решения по теме дома становятся устойчивыми. Смотри, в каком знаке и доме стоит Марс: это подсказывает стиль и среду реализации.', 86, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.6.ruler.mars.sign.any.house.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Управитель 6-го дома (Юпитер) стоит в определённом знаке: это задаёт стиль проявления темы 6-го дома.', priority = 86, is_active = 1, meta_json = '{}'
WHERE key = 'natal.house.6.ruler.jupiter.sign.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.6.ruler.jupiter.sign.any', '', 'ru-RU', 'Управитель 6-го дома (Юпитер) стоит в определённом знаке: это задаёт стиль проявления темы 6-го дома.', 86, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.6.ruler.jupiter.sign.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Управитель 6-го дома (Юпитер) расположен в некотором доме: это показывает, где именно «включается» тема 6-го дома.', priority = 86, is_active = 1, meta_json = '{}'
WHERE key = 'natal.house.6.ruler.jupiter.house.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.6.ruler.jupiter.house.any', '', 'ru-RU', 'Управитель 6-го дома (Юпитер) расположен в некотором доме: это показывает, где именно «включается» тема 6-го дома.', 86, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.6.ruler.jupiter.house.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Управитель 6-го дома — Юпитер: важны условия, где твои решения по теме дома становятся устойчивыми. Смотри, в каком знаке и доме стоит Юпитер: это подсказывает стиль и среду реализации.', priority = 86, is_active = 1, meta_json = '{}'
WHERE key = 'natal.house.6.ruler.jupiter.sign.any.house.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.6.ruler.jupiter.sign.any.house.any', '', 'ru-RU', 'Управитель 6-го дома — Юпитер: важны условия, где твои решения по теме дома становятся устойчивыми. Смотри, в каком знаке и доме стоит Юпитер: это подсказывает стиль и среду реализации.', 86, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.6.ruler.jupiter.sign.any.house.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Управитель 6-го дома (Сатурн) стоит в определённом знаке: это задаёт стиль проявления темы 6-го дома.', priority = 86, is_active = 1, meta_json = '{}'
WHERE key = 'natal.house.6.ruler.saturn.sign.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.6.ruler.saturn.sign.any', '', 'ru-RU', 'Управитель 6-го дома (Сатурн) стоит в определённом знаке: это задаёт стиль проявления темы 6-го дома.', 86, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.6.ruler.saturn.sign.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Управитель 6-го дома (Сатурн) расположен в некотором доме: это показывает, где именно «включается» тема 6-го дома.', priority = 86, is_active = 1, meta_json = '{}'
WHERE key = 'natal.house.6.ruler.saturn.house.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.6.ruler.saturn.house.any', '', 'ru-RU', 'Управитель 6-го дома (Сатурн) расположен в некотором доме: это показывает, где именно «включается» тема 6-го дома.', 86, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.6.ruler.saturn.house.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Управитель 6-го дома — Сатурн: важны условия, где твои решения по теме дома становятся устойчивыми. Смотри, в каком знаке и доме стоит Сатурн: это подсказывает стиль и среду реализации.', priority = 86, is_active = 1, meta_json = '{}'
WHERE key = 'natal.house.6.ruler.saturn.sign.any.house.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.6.ruler.saturn.sign.any.house.any', '', 'ru-RU', 'Управитель 6-го дома — Сатурн: важны условия, где твои решения по теме дома становятся устойчивыми. Смотри, в каком знаке и доме стоит Сатурн: это подсказывает стиль и среду реализации.', 86, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.6.ruler.saturn.sign.any.house.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Управитель 6-го дома (Уран) стоит в определённом знаке: это задаёт стиль проявления темы 6-го дома.', priority = 86, is_active = 1, meta_json = '{}'
WHERE key = 'natal.house.6.ruler.uranus.sign.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.6.ruler.uranus.sign.any', '', 'ru-RU', 'Управитель 6-го дома (Уран) стоит в определённом знаке: это задаёт стиль проявления темы 6-го дома.', 86, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.6.ruler.uranus.sign.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Управитель 6-го дома (Уран) расположен в некотором доме: это показывает, где именно «включается» тема 6-го дома.', priority = 86, is_active = 1, meta_json = '{}'
WHERE key = 'natal.house.6.ruler.uranus.house.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.6.ruler.uranus.house.any', '', 'ru-RU', 'Управитель 6-го дома (Уран) расположен в некотором доме: это показывает, где именно «включается» тема 6-го дома.', 86, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.6.ruler.uranus.house.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Управитель 6-го дома — Уран: важны условия, где твои решения по теме дома становятся устойчивыми. Смотри, в каком знаке и доме стоит Уран: это подсказывает стиль и среду реализации.', priority = 86, is_active = 1, meta_json = '{}'
WHERE key = 'natal.house.6.ruler.uranus.sign.any.house.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.6.ruler.uranus.sign.any.house.any', '', 'ru-RU', 'Управитель 6-го дома — Уран: важны условия, где твои решения по теме дома становятся устойчивыми. Смотри, в каком знаке и доме стоит Уран: это подсказывает стиль и среду реализации.', 86, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.6.ruler.uranus.sign.any.house.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Управитель 6-го дома (Нептун) стоит в определённом знаке: это задаёт стиль проявления темы 6-го дома.', priority = 86, is_active = 1, meta_json = '{}'
WHERE key = 'natal.house.6.ruler.neptune.sign.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.6.ruler.neptune.sign.any', '', 'ru-RU', 'Управитель 6-го дома (Нептун) стоит в определённом знаке: это задаёт стиль проявления темы 6-го дома.', 86, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.6.ruler.neptune.sign.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Управитель 6-го дома (Нептун) расположен в некотором доме: это показывает, где именно «включается» тема 6-го дома.', priority = 86, is_active = 1, meta_json = '{}'
WHERE key = 'natal.house.6.ruler.neptune.house.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.6.ruler.neptune.house.any', '', 'ru-RU', 'Управитель 6-го дома (Нептун) расположен в некотором доме: это показывает, где именно «включается» тема 6-го дома.', 86, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.6.ruler.neptune.house.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Управитель 6-го дома — Нептун: важны условия, где твои решения по теме дома становятся устойчивыми. Смотри, в каком знаке и доме стоит Нептун: это подсказывает стиль и среду реализации.', priority = 86, is_active = 1, meta_json = '{}'
WHERE key = 'natal.house.6.ruler.neptune.sign.any.house.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.6.ruler.neptune.sign.any.house.any', '', 'ru-RU', 'Управитель 6-го дома — Нептун: важны условия, где твои решения по теме дома становятся устойчивыми. Смотри, в каком знаке и доме стоит Нептун: это подсказывает стиль и среду реализации.', 86, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.6.ruler.neptune.sign.any.house.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Управитель 6-го дома (Плутон) стоит в определённом знаке: это задаёт стиль проявления темы 6-го дома.', priority = 86, is_active = 1, meta_json = '{}'
WHERE key = 'natal.house.6.ruler.pluto.sign.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.6.ruler.pluto.sign.any', '', 'ru-RU', 'Управитель 6-го дома (Плутон) стоит в определённом знаке: это задаёт стиль проявления темы 6-го дома.', 86, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.6.ruler.pluto.sign.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Управитель 6-го дома (Плутон) расположен в некотором доме: это показывает, где именно «включается» тема 6-го дома.', priority = 86, is_active = 1, meta_json = '{}'
WHERE key = 'natal.house.6.ruler.pluto.house.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.6.ruler.pluto.house.any', '', 'ru-RU', 'Управитель 6-го дома (Плутон) расположен в некотором доме: это показывает, где именно «включается» тема 6-го дома.', 86, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.6.ruler.pluto.house.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Управитель 6-го дома — Плутон: важны условия, где твои решения по теме дома становятся устойчивыми. Смотри, в каком знаке и доме стоит Плутон: это подсказывает стиль и среду реализации.', priority = 86, is_active = 1, meta_json = '{}'
WHERE key = 'natal.house.6.ruler.pluto.sign.any.house.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.6.ruler.pluto.sign.any.house.any', '', 'ru-RU', 'Управитель 6-го дома — Плутон: важны условия, где твои решения по теме дома становятся устойчивыми. Смотри, в каком знаке и доме стоит Плутон: это подсказывает стиль и среду реализации.', 86, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.6.ruler.pluto.sign.any.house.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Управитель 7-го дома (Солнце) стоит в определённом знаке: это задаёт стиль проявления темы 7-го дома.', priority = 86, is_active = 1, meta_json = '{}'
WHERE key = 'natal.house.7.ruler.sun.sign.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.7.ruler.sun.sign.any', '', 'ru-RU', 'Управитель 7-го дома (Солнце) стоит в определённом знаке: это задаёт стиль проявления темы 7-го дома.', 86, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.7.ruler.sun.sign.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Управитель 7-го дома (Солнце) расположен в некотором доме: это показывает, где именно «включается» тема 7-го дома.', priority = 86, is_active = 1, meta_json = '{}'
WHERE key = 'natal.house.7.ruler.sun.house.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.7.ruler.sun.house.any', '', 'ru-RU', 'Управитель 7-го дома (Солнце) расположен в некотором доме: это показывает, где именно «включается» тема 7-го дома.', 86, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.7.ruler.sun.house.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Управитель 7-го дома — Солнце: важны условия, где твои решения по теме дома становятся устойчивыми. Смотри, в каком знаке и доме стоит Солнце: это подсказывает стиль и среду реализации.', priority = 86, is_active = 1, meta_json = '{}'
WHERE key = 'natal.house.7.ruler.sun.sign.any.house.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.7.ruler.sun.sign.any.house.any', '', 'ru-RU', 'Управитель 7-го дома — Солнце: важны условия, где твои решения по теме дома становятся устойчивыми. Смотри, в каком знаке и доме стоит Солнце: это подсказывает стиль и среду реализации.', 86, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.7.ruler.sun.sign.any.house.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Управитель 7-го дома (Луна) стоит в определённом знаке: это задаёт стиль проявления темы 7-го дома.', priority = 86, is_active = 1, meta_json = '{}'
WHERE key = 'natal.house.7.ruler.moon.sign.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.7.ruler.moon.sign.any', '', 'ru-RU', 'Управитель 7-го дома (Луна) стоит в определённом знаке: это задаёт стиль проявления темы 7-го дома.', 86, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.7.ruler.moon.sign.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Управитель 7-го дома (Луна) расположен в некотором доме: это показывает, где именно «включается» тема 7-го дома.', priority = 86, is_active = 1, meta_json = '{}'
WHERE key = 'natal.house.7.ruler.moon.house.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.7.ruler.moon.house.any', '', 'ru-RU', 'Управитель 7-го дома (Луна) расположен в некотором доме: это показывает, где именно «включается» тема 7-го дома.', 86, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.7.ruler.moon.house.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Управитель 7-го дома — Луна: важны условия, где твои решения по теме дома становятся устойчивыми. Смотри, в каком знаке и доме стоит Луна: это подсказывает стиль и среду реализации.', priority = 86, is_active = 1, meta_json = '{}'
WHERE key = 'natal.house.7.ruler.moon.sign.any.house.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.7.ruler.moon.sign.any.house.any', '', 'ru-RU', 'Управитель 7-го дома — Луна: важны условия, где твои решения по теме дома становятся устойчивыми. Смотри, в каком знаке и доме стоит Луна: это подсказывает стиль и среду реализации.', 86, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.7.ruler.moon.sign.any.house.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Управитель 7-го дома (Меркурий) стоит в определённом знаке: это задаёт стиль проявления темы 7-го дома.', priority = 86, is_active = 1, meta_json = '{}'
WHERE key = 'natal.house.7.ruler.mercury.sign.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.7.ruler.mercury.sign.any', '', 'ru-RU', 'Управитель 7-го дома (Меркурий) стоит в определённом знаке: это задаёт стиль проявления темы 7-го дома.', 86, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.7.ruler.mercury.sign.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Управитель 7-го дома (Меркурий) расположен в некотором доме: это показывает, где именно «включается» тема 7-го дома.', priority = 86, is_active = 1, meta_json = '{}'
WHERE key = 'natal.house.7.ruler.mercury.house.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.7.ruler.mercury.house.any', '', 'ru-RU', 'Управитель 7-го дома (Меркурий) расположен в некотором доме: это показывает, где именно «включается» тема 7-го дома.', 86, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.7.ruler.mercury.house.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Управитель 7-го дома — Меркурий: важны условия, где твои решения по теме дома становятся устойчивыми. Смотри, в каком знаке и доме стоит Меркурий: это подсказывает стиль и среду реализации.', priority = 86, is_active = 1, meta_json = '{}'
WHERE key = 'natal.house.7.ruler.mercury.sign.any.house.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.7.ruler.mercury.sign.any.house.any', '', 'ru-RU', 'Управитель 7-го дома — Меркурий: важны условия, где твои решения по теме дома становятся устойчивыми. Смотри, в каком знаке и доме стоит Меркурий: это подсказывает стиль и среду реализации.', 86, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.7.ruler.mercury.sign.any.house.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Управитель 7-го дома (Венера) стоит в определённом знаке: это задаёт стиль проявления темы 7-го дома.', priority = 86, is_active = 1, meta_json = '{}'
WHERE key = 'natal.house.7.ruler.venus.sign.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.7.ruler.venus.sign.any', '', 'ru-RU', 'Управитель 7-го дома (Венера) стоит в определённом знаке: это задаёт стиль проявления темы 7-го дома.', 86, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.7.ruler.venus.sign.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Управитель 7-го дома (Венера) расположен в некотором доме: это показывает, где именно «включается» тема 7-го дома.', priority = 86, is_active = 1, meta_json = '{}'
WHERE key = 'natal.house.7.ruler.venus.house.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.7.ruler.venus.house.any', '', 'ru-RU', 'Управитель 7-го дома (Венера) расположен в некотором доме: это показывает, где именно «включается» тема 7-го дома.', 86, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.7.ruler.venus.house.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Управитель 7-го дома — Венера: важны условия, где твои решения по теме дома становятся устойчивыми. Смотри, в каком знаке и доме стоит Венера: это подсказывает стиль и среду реализации.', priority = 86, is_active = 1, meta_json = '{}'
WHERE key = 'natal.house.7.ruler.venus.sign.any.house.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.7.ruler.venus.sign.any.house.any', '', 'ru-RU', 'Управитель 7-го дома — Венера: важны условия, где твои решения по теме дома становятся устойчивыми. Смотри, в каком знаке и доме стоит Венера: это подсказывает стиль и среду реализации.', 86, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.7.ruler.venus.sign.any.house.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Управитель 7-го дома (Марс) стоит в определённом знаке: это задаёт стиль проявления темы 7-го дома.', priority = 86, is_active = 1, meta_json = '{}'
WHERE key = 'natal.house.7.ruler.mars.sign.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.7.ruler.mars.sign.any', '', 'ru-RU', 'Управитель 7-го дома (Марс) стоит в определённом знаке: это задаёт стиль проявления темы 7-го дома.', 86, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.7.ruler.mars.sign.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Управитель 7-го дома (Марс) расположен в некотором доме: это показывает, где именно «включается» тема 7-го дома.', priority = 86, is_active = 1, meta_json = '{}'
WHERE key = 'natal.house.7.ruler.mars.house.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.7.ruler.mars.house.any', '', 'ru-RU', 'Управитель 7-го дома (Марс) расположен в некотором доме: это показывает, где именно «включается» тема 7-го дома.', 86, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.7.ruler.mars.house.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Управитель 7-го дома — Марс: важны условия, где твои решения по теме дома становятся устойчивыми. Смотри, в каком знаке и доме стоит Марс: это подсказывает стиль и среду реализации.', priority = 86, is_active = 1, meta_json = '{}'
WHERE key = 'natal.house.7.ruler.mars.sign.any.house.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.7.ruler.mars.sign.any.house.any', '', 'ru-RU', 'Управитель 7-го дома — Марс: важны условия, где твои решения по теме дома становятся устойчивыми. Смотри, в каком знаке и доме стоит Марс: это подсказывает стиль и среду реализации.', 86, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.7.ruler.mars.sign.any.house.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Управитель 7-го дома (Юпитер) стоит в определённом знаке: это задаёт стиль проявления темы 7-го дома.', priority = 86, is_active = 1, meta_json = '{}'
WHERE key = 'natal.house.7.ruler.jupiter.sign.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.7.ruler.jupiter.sign.any', '', 'ru-RU', 'Управитель 7-го дома (Юпитер) стоит в определённом знаке: это задаёт стиль проявления темы 7-го дома.', 86, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.7.ruler.jupiter.sign.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Управитель 7-го дома (Юпитер) расположен в некотором доме: это показывает, где именно «включается» тема 7-го дома.', priority = 86, is_active = 1, meta_json = '{}'
WHERE key = 'natal.house.7.ruler.jupiter.house.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.7.ruler.jupiter.house.any', '', 'ru-RU', 'Управитель 7-го дома (Юпитер) расположен в некотором доме: это показывает, где именно «включается» тема 7-го дома.', 86, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.7.ruler.jupiter.house.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Управитель 7-го дома — Юпитер: важны условия, где твои решения по теме дома становятся устойчивыми. Смотри, в каком знаке и доме стоит Юпитер: это подсказывает стиль и среду реализации.', priority = 86, is_active = 1, meta_json = '{}'
WHERE key = 'natal.house.7.ruler.jupiter.sign.any.house.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.7.ruler.jupiter.sign.any.house.any', '', 'ru-RU', 'Управитель 7-го дома — Юпитер: важны условия, где твои решения по теме дома становятся устойчивыми. Смотри, в каком знаке и доме стоит Юпитер: это подсказывает стиль и среду реализации.', 86, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.7.ruler.jupiter.sign.any.house.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Управитель 7-го дома (Сатурн) стоит в определённом знаке: это задаёт стиль проявления темы 7-го дома.', priority = 86, is_active = 1, meta_json = '{}'
WHERE key = 'natal.house.7.ruler.saturn.sign.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.7.ruler.saturn.sign.any', '', 'ru-RU', 'Управитель 7-го дома (Сатурн) стоит в определённом знаке: это задаёт стиль проявления темы 7-го дома.', 86, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.7.ruler.saturn.sign.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Управитель 7-го дома (Сатурн) расположен в некотором доме: это показывает, где именно «включается» тема 7-го дома.', priority = 86, is_active = 1, meta_json = '{}'
WHERE key = 'natal.house.7.ruler.saturn.house.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.7.ruler.saturn.house.any', '', 'ru-RU', 'Управитель 7-го дома (Сатурн) расположен в некотором доме: это показывает, где именно «включается» тема 7-го дома.', 86, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.7.ruler.saturn.house.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Управитель 7-го дома — Сатурн: важны условия, где твои решения по теме дома становятся устойчивыми. Смотри, в каком знаке и доме стоит Сатурн: это подсказывает стиль и среду реализации.', priority = 86, is_active = 1, meta_json = '{}'
WHERE key = 'natal.house.7.ruler.saturn.sign.any.house.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.7.ruler.saturn.sign.any.house.any', '', 'ru-RU', 'Управитель 7-го дома — Сатурн: важны условия, где твои решения по теме дома становятся устойчивыми. Смотри, в каком знаке и доме стоит Сатурн: это подсказывает стиль и среду реализации.', 86, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.7.ruler.saturn.sign.any.house.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Управитель 7-го дома (Уран) стоит в определённом знаке: это задаёт стиль проявления темы 7-го дома.', priority = 86, is_active = 1, meta_json = '{}'
WHERE key = 'natal.house.7.ruler.uranus.sign.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.7.ruler.uranus.sign.any', '', 'ru-RU', 'Управитель 7-го дома (Уран) стоит в определённом знаке: это задаёт стиль проявления темы 7-го дома.', 86, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.7.ruler.uranus.sign.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Управитель 7-го дома (Уран) расположен в некотором доме: это показывает, где именно «включается» тема 7-го дома.', priority = 86, is_active = 1, meta_json = '{}'
WHERE key = 'natal.house.7.ruler.uranus.house.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.7.ruler.uranus.house.any', '', 'ru-RU', 'Управитель 7-го дома (Уран) расположен в некотором доме: это показывает, где именно «включается» тема 7-го дома.', 86, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.7.ruler.uranus.house.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Управитель 7-го дома — Уран: важны условия, где твои решения по теме дома становятся устойчивыми. Смотри, в каком знаке и доме стоит Уран: это подсказывает стиль и среду реализации.', priority = 86, is_active = 1, meta_json = '{}'
WHERE key = 'natal.house.7.ruler.uranus.sign.any.house.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.7.ruler.uranus.sign.any.house.any', '', 'ru-RU', 'Управитель 7-го дома — Уран: важны условия, где твои решения по теме дома становятся устойчивыми. Смотри, в каком знаке и доме стоит Уран: это подсказывает стиль и среду реализации.', 86, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.7.ruler.uranus.sign.any.house.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Управитель 7-го дома (Нептун) стоит в определённом знаке: это задаёт стиль проявления темы 7-го дома.', priority = 86, is_active = 1, meta_json = '{}'
WHERE key = 'natal.house.7.ruler.neptune.sign.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.7.ruler.neptune.sign.any', '', 'ru-RU', 'Управитель 7-го дома (Нептун) стоит в определённом знаке: это задаёт стиль проявления темы 7-го дома.', 86, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.7.ruler.neptune.sign.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Управитель 7-го дома (Нептун) расположен в некотором доме: это показывает, где именно «включается» тема 7-го дома.', priority = 86, is_active = 1, meta_json = '{}'
WHERE key = 'natal.house.7.ruler.neptune.house.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.7.ruler.neptune.house.any', '', 'ru-RU', 'Управитель 7-го дома (Нептун) расположен в некотором доме: это показывает, где именно «включается» тема 7-го дома.', 86, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.7.ruler.neptune.house.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Управитель 7-го дома — Нептун: важны условия, где твои решения по теме дома становятся устойчивыми. Смотри, в каком знаке и доме стоит Нептун: это подсказывает стиль и среду реализации.', priority = 86, is_active = 1, meta_json = '{}'
WHERE key = 'natal.house.7.ruler.neptune.sign.any.house.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.7.ruler.neptune.sign.any.house.any', '', 'ru-RU', 'Управитель 7-го дома — Нептун: важны условия, где твои решения по теме дома становятся устойчивыми. Смотри, в каком знаке и доме стоит Нептун: это подсказывает стиль и среду реализации.', 86, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.7.ruler.neptune.sign.any.house.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Управитель 7-го дома (Плутон) стоит в определённом знаке: это задаёт стиль проявления темы 7-го дома.', priority = 86, is_active = 1, meta_json = '{}'
WHERE key = 'natal.house.7.ruler.pluto.sign.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.7.ruler.pluto.sign.any', '', 'ru-RU', 'Управитель 7-го дома (Плутон) стоит в определённом знаке: это задаёт стиль проявления темы 7-го дома.', 86, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.7.ruler.pluto.sign.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Управитель 7-го дома (Плутон) расположен в некотором доме: это показывает, где именно «включается» тема 7-го дома.', priority = 86, is_active = 1, meta_json = '{}'
WHERE key = 'natal.house.7.ruler.pluto.house.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.7.ruler.pluto.house.any', '', 'ru-RU', 'Управитель 7-го дома (Плутон) расположен в некотором доме: это показывает, где именно «включается» тема 7-го дома.', 86, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.7.ruler.pluto.house.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Управитель 7-го дома — Плутон: важны условия, где твои решения по теме дома становятся устойчивыми. Смотри, в каком знаке и доме стоит Плутон: это подсказывает стиль и среду реализации.', priority = 86, is_active = 1, meta_json = '{}'
WHERE key = 'natal.house.7.ruler.pluto.sign.any.house.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.7.ruler.pluto.sign.any.house.any', '', 'ru-RU', 'Управитель 7-го дома — Плутон: важны условия, где твои решения по теме дома становятся устойчивыми. Смотри, в каком знаке и доме стоит Плутон: это подсказывает стиль и среду реализации.', 86, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.7.ruler.pluto.sign.any.house.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Управитель 8-го дома (Солнце) стоит в определённом знаке: это задаёт стиль проявления темы 8-го дома.', priority = 86, is_active = 1, meta_json = '{}'
WHERE key = 'natal.house.8.ruler.sun.sign.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.8.ruler.sun.sign.any', '', 'ru-RU', 'Управитель 8-го дома (Солнце) стоит в определённом знаке: это задаёт стиль проявления темы 8-го дома.', 86, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.8.ruler.sun.sign.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Управитель 8-го дома (Солнце) расположен в некотором доме: это показывает, где именно «включается» тема 8-го дома.', priority = 86, is_active = 1, meta_json = '{}'
WHERE key = 'natal.house.8.ruler.sun.house.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.8.ruler.sun.house.any', '', 'ru-RU', 'Управитель 8-го дома (Солнце) расположен в некотором доме: это показывает, где именно «включается» тема 8-го дома.', 86, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.8.ruler.sun.house.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Управитель 8-го дома — Солнце: важны условия, где твои решения по теме дома становятся устойчивыми. Смотри, в каком знаке и доме стоит Солнце: это подсказывает стиль и среду реализации.', priority = 86, is_active = 1, meta_json = '{}'
WHERE key = 'natal.house.8.ruler.sun.sign.any.house.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.8.ruler.sun.sign.any.house.any', '', 'ru-RU', 'Управитель 8-го дома — Солнце: важны условия, где твои решения по теме дома становятся устойчивыми. Смотри, в каком знаке и доме стоит Солнце: это подсказывает стиль и среду реализации.', 86, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.8.ruler.sun.sign.any.house.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Управитель 8-го дома (Луна) стоит в определённом знаке: это задаёт стиль проявления темы 8-го дома.', priority = 86, is_active = 1, meta_json = '{}'
WHERE key = 'natal.house.8.ruler.moon.sign.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.8.ruler.moon.sign.any', '', 'ru-RU', 'Управитель 8-го дома (Луна) стоит в определённом знаке: это задаёт стиль проявления темы 8-го дома.', 86, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.8.ruler.moon.sign.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Управитель 8-го дома (Луна) расположен в некотором доме: это показывает, где именно «включается» тема 8-го дома.', priority = 86, is_active = 1, meta_json = '{}'
WHERE key = 'natal.house.8.ruler.moon.house.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.8.ruler.moon.house.any', '', 'ru-RU', 'Управитель 8-го дома (Луна) расположен в некотором доме: это показывает, где именно «включается» тема 8-го дома.', 86, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.8.ruler.moon.house.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Управитель 8-го дома — Луна: важны условия, где твои решения по теме дома становятся устойчивыми. Смотри, в каком знаке и доме стоит Луна: это подсказывает стиль и среду реализации.', priority = 86, is_active = 1, meta_json = '{}'
WHERE key = 'natal.house.8.ruler.moon.sign.any.house.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.8.ruler.moon.sign.any.house.any', '', 'ru-RU', 'Управитель 8-го дома — Луна: важны условия, где твои решения по теме дома становятся устойчивыми. Смотри, в каком знаке и доме стоит Луна: это подсказывает стиль и среду реализации.', 86, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.8.ruler.moon.sign.any.house.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Управитель 8-го дома (Меркурий) стоит в определённом знаке: это задаёт стиль проявления темы 8-го дома.', priority = 86, is_active = 1, meta_json = '{}'
WHERE key = 'natal.house.8.ruler.mercury.sign.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.8.ruler.mercury.sign.any', '', 'ru-RU', 'Управитель 8-го дома (Меркурий) стоит в определённом знаке: это задаёт стиль проявления темы 8-го дома.', 86, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.8.ruler.mercury.sign.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Управитель 8-го дома (Меркурий) расположен в некотором доме: это показывает, где именно «включается» тема 8-го дома.', priority = 86, is_active = 1, meta_json = '{}'
WHERE key = 'natal.house.8.ruler.mercury.house.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.8.ruler.mercury.house.any', '', 'ru-RU', 'Управитель 8-го дома (Меркурий) расположен в некотором доме: это показывает, где именно «включается» тема 8-го дома.', 86, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.8.ruler.mercury.house.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Управитель 8-го дома — Меркурий: важны условия, где твои решения по теме дома становятся устойчивыми. Смотри, в каком знаке и доме стоит Меркурий: это подсказывает стиль и среду реализации.', priority = 86, is_active = 1, meta_json = '{}'
WHERE key = 'natal.house.8.ruler.mercury.sign.any.house.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.8.ruler.mercury.sign.any.house.any', '', 'ru-RU', 'Управитель 8-го дома — Меркурий: важны условия, где твои решения по теме дома становятся устойчивыми. Смотри, в каком знаке и доме стоит Меркурий: это подсказывает стиль и среду реализации.', 86, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.8.ruler.mercury.sign.any.house.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Управитель 8-го дома (Венера) стоит в определённом знаке: это задаёт стиль проявления темы 8-го дома.', priority = 86, is_active = 1, meta_json = '{}'
WHERE key = 'natal.house.8.ruler.venus.sign.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.8.ruler.venus.sign.any', '', 'ru-RU', 'Управитель 8-го дома (Венера) стоит в определённом знаке: это задаёт стиль проявления темы 8-го дома.', 86, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.8.ruler.venus.sign.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Управитель 8-го дома (Венера) расположен в некотором доме: это показывает, где именно «включается» тема 8-го дома.', priority = 86, is_active = 1, meta_json = '{}'
WHERE key = 'natal.house.8.ruler.venus.house.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.8.ruler.venus.house.any', '', 'ru-RU', 'Управитель 8-го дома (Венера) расположен в некотором доме: это показывает, где именно «включается» тема 8-го дома.', 86, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.8.ruler.venus.house.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Управитель 8-го дома — Венера: важны условия, где твои решения по теме дома становятся устойчивыми. Смотри, в каком знаке и доме стоит Венера: это подсказывает стиль и среду реализации.', priority = 86, is_active = 1, meta_json = '{}'
WHERE key = 'natal.house.8.ruler.venus.sign.any.house.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.8.ruler.venus.sign.any.house.any', '', 'ru-RU', 'Управитель 8-го дома — Венера: важны условия, где твои решения по теме дома становятся устойчивыми. Смотри, в каком знаке и доме стоит Венера: это подсказывает стиль и среду реализации.', 86, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.8.ruler.venus.sign.any.house.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Управитель 8-го дома (Марс) стоит в определённом знаке: это задаёт стиль проявления темы 8-го дома.', priority = 86, is_active = 1, meta_json = '{}'
WHERE key = 'natal.house.8.ruler.mars.sign.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.8.ruler.mars.sign.any', '', 'ru-RU', 'Управитель 8-го дома (Марс) стоит в определённом знаке: это задаёт стиль проявления темы 8-го дома.', 86, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.8.ruler.mars.sign.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Управитель 8-го дома (Марс) расположен в некотором доме: это показывает, где именно «включается» тема 8-го дома.', priority = 86, is_active = 1, meta_json = '{}'
WHERE key = 'natal.house.8.ruler.mars.house.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.8.ruler.mars.house.any', '', 'ru-RU', 'Управитель 8-го дома (Марс) расположен в некотором доме: это показывает, где именно «включается» тема 8-го дома.', 86, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.8.ruler.mars.house.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Управитель 8-го дома — Марс: важны условия, где твои решения по теме дома становятся устойчивыми. Смотри, в каком знаке и доме стоит Марс: это подсказывает стиль и среду реализации.', priority = 86, is_active = 1, meta_json = '{}'
WHERE key = 'natal.house.8.ruler.mars.sign.any.house.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.8.ruler.mars.sign.any.house.any', '', 'ru-RU', 'Управитель 8-го дома — Марс: важны условия, где твои решения по теме дома становятся устойчивыми. Смотри, в каком знаке и доме стоит Марс: это подсказывает стиль и среду реализации.', 86, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.8.ruler.mars.sign.any.house.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Управитель 8-го дома (Юпитер) стоит в определённом знаке: это задаёт стиль проявления темы 8-го дома.', priority = 86, is_active = 1, meta_json = '{}'
WHERE key = 'natal.house.8.ruler.jupiter.sign.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.8.ruler.jupiter.sign.any', '', 'ru-RU', 'Управитель 8-го дома (Юпитер) стоит в определённом знаке: это задаёт стиль проявления темы 8-го дома.', 86, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.8.ruler.jupiter.sign.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Управитель 8-го дома (Юпитер) расположен в некотором доме: это показывает, где именно «включается» тема 8-го дома.', priority = 86, is_active = 1, meta_json = '{}'
WHERE key = 'natal.house.8.ruler.jupiter.house.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.8.ruler.jupiter.house.any', '', 'ru-RU', 'Управитель 8-го дома (Юпитер) расположен в некотором доме: это показывает, где именно «включается» тема 8-го дома.', 86, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.8.ruler.jupiter.house.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Управитель 8-го дома — Юпитер: важны условия, где твои решения по теме дома становятся устойчивыми. Смотри, в каком знаке и доме стоит Юпитер: это подсказывает стиль и среду реализации.', priority = 86, is_active = 1, meta_json = '{}'
WHERE key = 'natal.house.8.ruler.jupiter.sign.any.house.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.8.ruler.jupiter.sign.any.house.any', '', 'ru-RU', 'Управитель 8-го дома — Юпитер: важны условия, где твои решения по теме дома становятся устойчивыми. Смотри, в каком знаке и доме стоит Юпитер: это подсказывает стиль и среду реализации.', 86, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.8.ruler.jupiter.sign.any.house.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Управитель 8-го дома (Сатурн) стоит в определённом знаке: это задаёт стиль проявления темы 8-го дома.', priority = 86, is_active = 1, meta_json = '{}'
WHERE key = 'natal.house.8.ruler.saturn.sign.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.8.ruler.saturn.sign.any', '', 'ru-RU', 'Управитель 8-го дома (Сатурн) стоит в определённом знаке: это задаёт стиль проявления темы 8-го дома.', 86, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.8.ruler.saturn.sign.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Управитель 8-го дома (Сатурн) расположен в некотором доме: это показывает, где именно «включается» тема 8-го дома.', priority = 86, is_active = 1, meta_json = '{}'
WHERE key = 'natal.house.8.ruler.saturn.house.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.8.ruler.saturn.house.any', '', 'ru-RU', 'Управитель 8-го дома (Сатурн) расположен в некотором доме: это показывает, где именно «включается» тема 8-го дома.', 86, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.8.ruler.saturn.house.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Управитель 8-го дома — Сатурн: важны условия, где твои решения по теме дома становятся устойчивыми. Смотри, в каком знаке и доме стоит Сатурн: это подсказывает стиль и среду реализации.', priority = 86, is_active = 1, meta_json = '{}'
WHERE key = 'natal.house.8.ruler.saturn.sign.any.house.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.8.ruler.saturn.sign.any.house.any', '', 'ru-RU', 'Управитель 8-го дома — Сатурн: важны условия, где твои решения по теме дома становятся устойчивыми. Смотри, в каком знаке и доме стоит Сатурн: это подсказывает стиль и среду реализации.', 86, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.8.ruler.saturn.sign.any.house.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Управитель 8-го дома (Уран) стоит в определённом знаке: это задаёт стиль проявления темы 8-го дома.', priority = 86, is_active = 1, meta_json = '{}'
WHERE key = 'natal.house.8.ruler.uranus.sign.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.8.ruler.uranus.sign.any', '', 'ru-RU', 'Управитель 8-го дома (Уран) стоит в определённом знаке: это задаёт стиль проявления темы 8-го дома.', 86, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.8.ruler.uranus.sign.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Управитель 8-го дома (Уран) расположен в некотором доме: это показывает, где именно «включается» тема 8-го дома.', priority = 86, is_active = 1, meta_json = '{}'
WHERE key = 'natal.house.8.ruler.uranus.house.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.8.ruler.uranus.house.any', '', 'ru-RU', 'Управитель 8-го дома (Уран) расположен в некотором доме: это показывает, где именно «включается» тема 8-го дома.', 86, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.8.ruler.uranus.house.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Управитель 8-го дома — Уран: важны условия, где твои решения по теме дома становятся устойчивыми. Смотри, в каком знаке и доме стоит Уран: это подсказывает стиль и среду реализации.', priority = 86, is_active = 1, meta_json = '{}'
WHERE key = 'natal.house.8.ruler.uranus.sign.any.house.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.8.ruler.uranus.sign.any.house.any', '', 'ru-RU', 'Управитель 8-го дома — Уран: важны условия, где твои решения по теме дома становятся устойчивыми. Смотри, в каком знаке и доме стоит Уран: это подсказывает стиль и среду реализации.', 86, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.8.ruler.uranus.sign.any.house.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Управитель 8-го дома (Нептун) стоит в определённом знаке: это задаёт стиль проявления темы 8-го дома.', priority = 86, is_active = 1, meta_json = '{}'
WHERE key = 'natal.house.8.ruler.neptune.sign.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.8.ruler.neptune.sign.any', '', 'ru-RU', 'Управитель 8-го дома (Нептун) стоит в определённом знаке: это задаёт стиль проявления темы 8-го дома.', 86, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.8.ruler.neptune.sign.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Управитель 8-го дома (Нептун) расположен в некотором доме: это показывает, где именно «включается» тема 8-го дома.', priority = 86, is_active = 1, meta_json = '{}'
WHERE key = 'natal.house.8.ruler.neptune.house.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.8.ruler.neptune.house.any', '', 'ru-RU', 'Управитель 8-го дома (Нептун) расположен в некотором доме: это показывает, где именно «включается» тема 8-го дома.', 86, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.8.ruler.neptune.house.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Управитель 8-го дома — Нептун: важны условия, где твои решения по теме дома становятся устойчивыми. Смотри, в каком знаке и доме стоит Нептун: это подсказывает стиль и среду реализации.', priority = 86, is_active = 1, meta_json = '{}'
WHERE key = 'natal.house.8.ruler.neptune.sign.any.house.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.8.ruler.neptune.sign.any.house.any', '', 'ru-RU', 'Управитель 8-го дома — Нептун: важны условия, где твои решения по теме дома становятся устойчивыми. Смотри, в каком знаке и доме стоит Нептун: это подсказывает стиль и среду реализации.', 86, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.8.ruler.neptune.sign.any.house.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Управитель 8-го дома (Плутон) стоит в определённом знаке: это задаёт стиль проявления темы 8-го дома.', priority = 86, is_active = 1, meta_json = '{}'
WHERE key = 'natal.house.8.ruler.pluto.sign.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.8.ruler.pluto.sign.any', '', 'ru-RU', 'Управитель 8-го дома (Плутон) стоит в определённом знаке: это задаёт стиль проявления темы 8-го дома.', 86, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.8.ruler.pluto.sign.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Управитель 8-го дома (Плутон) расположен в некотором доме: это показывает, где именно «включается» тема 8-го дома.', priority = 86, is_active = 1, meta_json = '{}'
WHERE key = 'natal.house.8.ruler.pluto.house.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.8.ruler.pluto.house.any', '', 'ru-RU', 'Управитель 8-го дома (Плутон) расположен в некотором доме: это показывает, где именно «включается» тема 8-го дома.', 86, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.8.ruler.pluto.house.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Управитель 8-го дома — Плутон: важны условия, где твои решения по теме дома становятся устойчивыми. Смотри, в каком знаке и доме стоит Плутон: это подсказывает стиль и среду реализации.', priority = 86, is_active = 1, meta_json = '{}'
WHERE key = 'natal.house.8.ruler.pluto.sign.any.house.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.8.ruler.pluto.sign.any.house.any', '', 'ru-RU', 'Управитель 8-го дома — Плутон: важны условия, где твои решения по теме дома становятся устойчивыми. Смотри, в каком знаке и доме стоит Плутон: это подсказывает стиль и среду реализации.', 86, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.8.ruler.pluto.sign.any.house.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Управитель 9-го дома (Солнце) стоит в определённом знаке: это задаёт стиль проявления темы 9-го дома.', priority = 86, is_active = 1, meta_json = '{}'
WHERE key = 'natal.house.9.ruler.sun.sign.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.9.ruler.sun.sign.any', '', 'ru-RU', 'Управитель 9-го дома (Солнце) стоит в определённом знаке: это задаёт стиль проявления темы 9-го дома.', 86, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.9.ruler.sun.sign.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Управитель 9-го дома (Солнце) расположен в некотором доме: это показывает, где именно «включается» тема 9-го дома.', priority = 86, is_active = 1, meta_json = '{}'
WHERE key = 'natal.house.9.ruler.sun.house.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.9.ruler.sun.house.any', '', 'ru-RU', 'Управитель 9-го дома (Солнце) расположен в некотором доме: это показывает, где именно «включается» тема 9-го дома.', 86, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.9.ruler.sun.house.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Управитель 9-го дома — Солнце: важны условия, где твои решения по теме дома становятся устойчивыми. Смотри, в каком знаке и доме стоит Солнце: это подсказывает стиль и среду реализации.', priority = 86, is_active = 1, meta_json = '{}'
WHERE key = 'natal.house.9.ruler.sun.sign.any.house.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.9.ruler.sun.sign.any.house.any', '', 'ru-RU', 'Управитель 9-го дома — Солнце: важны условия, где твои решения по теме дома становятся устойчивыми. Смотри, в каком знаке и доме стоит Солнце: это подсказывает стиль и среду реализации.', 86, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.9.ruler.sun.sign.any.house.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Управитель 9-го дома (Луна) стоит в определённом знаке: это задаёт стиль проявления темы 9-го дома.', priority = 86, is_active = 1, meta_json = '{}'
WHERE key = 'natal.house.9.ruler.moon.sign.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.9.ruler.moon.sign.any', '', 'ru-RU', 'Управитель 9-го дома (Луна) стоит в определённом знаке: это задаёт стиль проявления темы 9-го дома.', 86, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.9.ruler.moon.sign.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Управитель 9-го дома (Луна) расположен в некотором доме: это показывает, где именно «включается» тема 9-го дома.', priority = 86, is_active = 1, meta_json = '{}'
WHERE key = 'natal.house.9.ruler.moon.house.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.9.ruler.moon.house.any', '', 'ru-RU', 'Управитель 9-го дома (Луна) расположен в некотором доме: это показывает, где именно «включается» тема 9-го дома.', 86, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.9.ruler.moon.house.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Управитель 9-го дома — Луна: важны условия, где твои решения по теме дома становятся устойчивыми. Смотри, в каком знаке и доме стоит Луна: это подсказывает стиль и среду реализации.', priority = 86, is_active = 1, meta_json = '{}'
WHERE key = 'natal.house.9.ruler.moon.sign.any.house.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.9.ruler.moon.sign.any.house.any', '', 'ru-RU', 'Управитель 9-го дома — Луна: важны условия, где твои решения по теме дома становятся устойчивыми. Смотри, в каком знаке и доме стоит Луна: это подсказывает стиль и среду реализации.', 86, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.9.ruler.moon.sign.any.house.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Управитель 9-го дома (Меркурий) стоит в определённом знаке: это задаёт стиль проявления темы 9-го дома.', priority = 86, is_active = 1, meta_json = '{}'
WHERE key = 'natal.house.9.ruler.mercury.sign.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.9.ruler.mercury.sign.any', '', 'ru-RU', 'Управитель 9-го дома (Меркурий) стоит в определённом знаке: это задаёт стиль проявления темы 9-го дома.', 86, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.9.ruler.mercury.sign.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Управитель 9-го дома (Меркурий) расположен в некотором доме: это показывает, где именно «включается» тема 9-го дома.', priority = 86, is_active = 1, meta_json = '{}'
WHERE key = 'natal.house.9.ruler.mercury.house.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.9.ruler.mercury.house.any', '', 'ru-RU', 'Управитель 9-го дома (Меркурий) расположен в некотором доме: это показывает, где именно «включается» тема 9-го дома.', 86, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.9.ruler.mercury.house.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Управитель 9-го дома — Меркурий: важны условия, где твои решения по теме дома становятся устойчивыми. Смотри, в каком знаке и доме стоит Меркурий: это подсказывает стиль и среду реализации.', priority = 86, is_active = 1, meta_json = '{}'
WHERE key = 'natal.house.9.ruler.mercury.sign.any.house.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.9.ruler.mercury.sign.any.house.any', '', 'ru-RU', 'Управитель 9-го дома — Меркурий: важны условия, где твои решения по теме дома становятся устойчивыми. Смотри, в каком знаке и доме стоит Меркурий: это подсказывает стиль и среду реализации.', 86, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.9.ruler.mercury.sign.any.house.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Управитель 9-го дома (Венера) стоит в определённом знаке: это задаёт стиль проявления темы 9-го дома.', priority = 86, is_active = 1, meta_json = '{}'
WHERE key = 'natal.house.9.ruler.venus.sign.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.9.ruler.venus.sign.any', '', 'ru-RU', 'Управитель 9-го дома (Венера) стоит в определённом знаке: это задаёт стиль проявления темы 9-го дома.', 86, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.9.ruler.venus.sign.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Управитель 9-го дома (Венера) расположен в некотором доме: это показывает, где именно «включается» тема 9-го дома.', priority = 86, is_active = 1, meta_json = '{}'
WHERE key = 'natal.house.9.ruler.venus.house.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.9.ruler.venus.house.any', '', 'ru-RU', 'Управитель 9-го дома (Венера) расположен в некотором доме: это показывает, где именно «включается» тема 9-го дома.', 86, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.9.ruler.venus.house.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Управитель 9-го дома — Венера: важны условия, где твои решения по теме дома становятся устойчивыми. Смотри, в каком знаке и доме стоит Венера: это подсказывает стиль и среду реализации.', priority = 86, is_active = 1, meta_json = '{}'
WHERE key = 'natal.house.9.ruler.venus.sign.any.house.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.9.ruler.venus.sign.any.house.any', '', 'ru-RU', 'Управитель 9-го дома — Венера: важны условия, где твои решения по теме дома становятся устойчивыми. Смотри, в каком знаке и доме стоит Венера: это подсказывает стиль и среду реализации.', 86, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.9.ruler.venus.sign.any.house.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Управитель 9-го дома (Марс) стоит в определённом знаке: это задаёт стиль проявления темы 9-го дома.', priority = 86, is_active = 1, meta_json = '{}'
WHERE key = 'natal.house.9.ruler.mars.sign.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.9.ruler.mars.sign.any', '', 'ru-RU', 'Управитель 9-го дома (Марс) стоит в определённом знаке: это задаёт стиль проявления темы 9-го дома.', 86, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.9.ruler.mars.sign.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Управитель 9-го дома (Марс) расположен в некотором доме: это показывает, где именно «включается» тема 9-го дома.', priority = 86, is_active = 1, meta_json = '{}'
WHERE key = 'natal.house.9.ruler.mars.house.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.9.ruler.mars.house.any', '', 'ru-RU', 'Управитель 9-го дома (Марс) расположен в некотором доме: это показывает, где именно «включается» тема 9-го дома.', 86, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.9.ruler.mars.house.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Управитель 9-го дома — Марс: важны условия, где твои решения по теме дома становятся устойчивыми. Смотри, в каком знаке и доме стоит Марс: это подсказывает стиль и среду реализации.', priority = 86, is_active = 1, meta_json = '{}'
WHERE key = 'natal.house.9.ruler.mars.sign.any.house.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.9.ruler.mars.sign.any.house.any', '', 'ru-RU', 'Управитель 9-го дома — Марс: важны условия, где твои решения по теме дома становятся устойчивыми. Смотри, в каком знаке и доме стоит Марс: это подсказывает стиль и среду реализации.', 86, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.9.ruler.mars.sign.any.house.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Управитель 9-го дома (Юпитер) стоит в определённом знаке: это задаёт стиль проявления темы 9-го дома.', priority = 86, is_active = 1, meta_json = '{}'
WHERE key = 'natal.house.9.ruler.jupiter.sign.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.9.ruler.jupiter.sign.any', '', 'ru-RU', 'Управитель 9-го дома (Юпитер) стоит в определённом знаке: это задаёт стиль проявления темы 9-го дома.', 86, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.9.ruler.jupiter.sign.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Управитель 9-го дома (Юпитер) расположен в некотором доме: это показывает, где именно «включается» тема 9-го дома.', priority = 86, is_active = 1, meta_json = '{}'
WHERE key = 'natal.house.9.ruler.jupiter.house.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.9.ruler.jupiter.house.any', '', 'ru-RU', 'Управитель 9-го дома (Юпитер) расположен в некотором доме: это показывает, где именно «включается» тема 9-го дома.', 86, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.9.ruler.jupiter.house.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Управитель 9-го дома — Юпитер: важны условия, где твои решения по теме дома становятся устойчивыми. Смотри, в каком знаке и доме стоит Юпитер: это подсказывает стиль и среду реализации.', priority = 86, is_active = 1, meta_json = '{}'
WHERE key = 'natal.house.9.ruler.jupiter.sign.any.house.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.9.ruler.jupiter.sign.any.house.any', '', 'ru-RU', 'Управитель 9-го дома — Юпитер: важны условия, где твои решения по теме дома становятся устойчивыми. Смотри, в каком знаке и доме стоит Юпитер: это подсказывает стиль и среду реализации.', 86, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.9.ruler.jupiter.sign.any.house.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Управитель 9-го дома (Сатурн) стоит в определённом знаке: это задаёт стиль проявления темы 9-го дома.', priority = 86, is_active = 1, meta_json = '{}'
WHERE key = 'natal.house.9.ruler.saturn.sign.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.9.ruler.saturn.sign.any', '', 'ru-RU', 'Управитель 9-го дома (Сатурн) стоит в определённом знаке: это задаёт стиль проявления темы 9-го дома.', 86, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.9.ruler.saturn.sign.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Управитель 9-го дома (Сатурн) расположен в некотором доме: это показывает, где именно «включается» тема 9-го дома.', priority = 86, is_active = 1, meta_json = '{}'
WHERE key = 'natal.house.9.ruler.saturn.house.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.9.ruler.saturn.house.any', '', 'ru-RU', 'Управитель 9-го дома (Сатурн) расположен в некотором доме: это показывает, где именно «включается» тема 9-го дома.', 86, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.9.ruler.saturn.house.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Управитель 9-го дома — Сатурн: важны условия, где твои решения по теме дома становятся устойчивыми. Смотри, в каком знаке и доме стоит Сатурн: это подсказывает стиль и среду реализации.', priority = 86, is_active = 1, meta_json = '{}'
WHERE key = 'natal.house.9.ruler.saturn.sign.any.house.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.9.ruler.saturn.sign.any.house.any', '', 'ru-RU', 'Управитель 9-го дома — Сатурн: важны условия, где твои решения по теме дома становятся устойчивыми. Смотри, в каком знаке и доме стоит Сатурн: это подсказывает стиль и среду реализации.', 86, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.9.ruler.saturn.sign.any.house.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Управитель 9-го дома (Уран) стоит в определённом знаке: это задаёт стиль проявления темы 9-го дома.', priority = 86, is_active = 1, meta_json = '{}'
WHERE key = 'natal.house.9.ruler.uranus.sign.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.9.ruler.uranus.sign.any', '', 'ru-RU', 'Управитель 9-го дома (Уран) стоит в определённом знаке: это задаёт стиль проявления темы 9-го дома.', 86, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.9.ruler.uranus.sign.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Управитель 9-го дома (Уран) расположен в некотором доме: это показывает, где именно «включается» тема 9-го дома.', priority = 86, is_active = 1, meta_json = '{}'
WHERE key = 'natal.house.9.ruler.uranus.house.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.9.ruler.uranus.house.any', '', 'ru-RU', 'Управитель 9-го дома (Уран) расположен в некотором доме: это показывает, где именно «включается» тема 9-го дома.', 86, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.9.ruler.uranus.house.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Управитель 9-го дома — Уран: важны условия, где твои решения по теме дома становятся устойчивыми. Смотри, в каком знаке и доме стоит Уран: это подсказывает стиль и среду реализации.', priority = 86, is_active = 1, meta_json = '{}'
WHERE key = 'natal.house.9.ruler.uranus.sign.any.house.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.9.ruler.uranus.sign.any.house.any', '', 'ru-RU', 'Управитель 9-го дома — Уран: важны условия, где твои решения по теме дома становятся устойчивыми. Смотри, в каком знаке и доме стоит Уран: это подсказывает стиль и среду реализации.', 86, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.9.ruler.uranus.sign.any.house.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Управитель 9-го дома (Нептун) стоит в определённом знаке: это задаёт стиль проявления темы 9-го дома.', priority = 86, is_active = 1, meta_json = '{}'
WHERE key = 'natal.house.9.ruler.neptune.sign.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.9.ruler.neptune.sign.any', '', 'ru-RU', 'Управитель 9-го дома (Нептун) стоит в определённом знаке: это задаёт стиль проявления темы 9-го дома.', 86, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.9.ruler.neptune.sign.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Управитель 9-го дома (Нептун) расположен в некотором доме: это показывает, где именно «включается» тема 9-го дома.', priority = 86, is_active = 1, meta_json = '{}'
WHERE key = 'natal.house.9.ruler.neptune.house.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.9.ruler.neptune.house.any', '', 'ru-RU', 'Управитель 9-го дома (Нептун) расположен в некотором доме: это показывает, где именно «включается» тема 9-го дома.', 86, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.9.ruler.neptune.house.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Управитель 9-го дома — Нептун: важны условия, где твои решения по теме дома становятся устойчивыми. Смотри, в каком знаке и доме стоит Нептун: это подсказывает стиль и среду реализации.', priority = 86, is_active = 1, meta_json = '{}'
WHERE key = 'natal.house.9.ruler.neptune.sign.any.house.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.9.ruler.neptune.sign.any.house.any', '', 'ru-RU', 'Управитель 9-го дома — Нептун: важны условия, где твои решения по теме дома становятся устойчивыми. Смотри, в каком знаке и доме стоит Нептун: это подсказывает стиль и среду реализации.', 86, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.9.ruler.neptune.sign.any.house.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Управитель 9-го дома (Плутон) стоит в определённом знаке: это задаёт стиль проявления темы 9-го дома.', priority = 86, is_active = 1, meta_json = '{}'
WHERE key = 'natal.house.9.ruler.pluto.sign.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.9.ruler.pluto.sign.any', '', 'ru-RU', 'Управитель 9-го дома (Плутон) стоит в определённом знаке: это задаёт стиль проявления темы 9-го дома.', 86, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.9.ruler.pluto.sign.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Управитель 9-го дома (Плутон) расположен в некотором доме: это показывает, где именно «включается» тема 9-го дома.', priority = 86, is_active = 1, meta_json = '{}'
WHERE key = 'natal.house.9.ruler.pluto.house.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.9.ruler.pluto.house.any', '', 'ru-RU', 'Управитель 9-го дома (Плутон) расположен в некотором доме: это показывает, где именно «включается» тема 9-го дома.', 86, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.9.ruler.pluto.house.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Управитель 9-го дома — Плутон: важны условия, где твои решения по теме дома становятся устойчивыми. Смотри, в каком знаке и доме стоит Плутон: это подсказывает стиль и среду реализации.', priority = 86, is_active = 1, meta_json = '{}'
WHERE key = 'natal.house.9.ruler.pluto.sign.any.house.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.9.ruler.pluto.sign.any.house.any', '', 'ru-RU', 'Управитель 9-го дома — Плутон: важны условия, где твои решения по теме дома становятся устойчивыми. Смотри, в каком знаке и доме стоит Плутон: это подсказывает стиль и среду реализации.', 86, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.9.ruler.pluto.sign.any.house.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Управитель 10-го дома (Солнце) стоит в определённом знаке: это задаёт стиль проявления темы 10-го дома.', priority = 86, is_active = 1, meta_json = '{}'
WHERE key = 'natal.house.10.ruler.sun.sign.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.10.ruler.sun.sign.any', '', 'ru-RU', 'Управитель 10-го дома (Солнце) стоит в определённом знаке: это задаёт стиль проявления темы 10-го дома.', 86, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.10.ruler.sun.sign.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Управитель 10-го дома (Солнце) расположен в некотором доме: это показывает, где именно «включается» тема 10-го дома.', priority = 86, is_active = 1, meta_json = '{}'
WHERE key = 'natal.house.10.ruler.sun.house.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.10.ruler.sun.house.any', '', 'ru-RU', 'Управитель 10-го дома (Солнце) расположен в некотором доме: это показывает, где именно «включается» тема 10-го дома.', 86, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.10.ruler.sun.house.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Управитель 10-го дома — Солнце: важны условия, где твои решения по теме дома становятся устойчивыми. Смотри, в каком знаке и доме стоит Солнце: это подсказывает стиль и среду реализации.', priority = 86, is_active = 1, meta_json = '{}'
WHERE key = 'natal.house.10.ruler.sun.sign.any.house.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.10.ruler.sun.sign.any.house.any', '', 'ru-RU', 'Управитель 10-го дома — Солнце: важны условия, где твои решения по теме дома становятся устойчивыми. Смотри, в каком знаке и доме стоит Солнце: это подсказывает стиль и среду реализации.', 86, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.10.ruler.sun.sign.any.house.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Управитель 10-го дома (Луна) стоит в определённом знаке: это задаёт стиль проявления темы 10-го дома.', priority = 86, is_active = 1, meta_json = '{}'
WHERE key = 'natal.house.10.ruler.moon.sign.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.10.ruler.moon.sign.any', '', 'ru-RU', 'Управитель 10-го дома (Луна) стоит в определённом знаке: это задаёт стиль проявления темы 10-го дома.', 86, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.10.ruler.moon.sign.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Управитель 10-го дома (Луна) расположен в некотором доме: это показывает, где именно «включается» тема 10-го дома.', priority = 86, is_active = 1, meta_json = '{}'
WHERE key = 'natal.house.10.ruler.moon.house.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.10.ruler.moon.house.any', '', 'ru-RU', 'Управитель 10-го дома (Луна) расположен в некотором доме: это показывает, где именно «включается» тема 10-го дома.', 86, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.10.ruler.moon.house.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Управитель 10-го дома — Луна: важны условия, где твои решения по теме дома становятся устойчивыми. Смотри, в каком знаке и доме стоит Луна: это подсказывает стиль и среду реализации.', priority = 86, is_active = 1, meta_json = '{}'
WHERE key = 'natal.house.10.ruler.moon.sign.any.house.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.10.ruler.moon.sign.any.house.any', '', 'ru-RU', 'Управитель 10-го дома — Луна: важны условия, где твои решения по теме дома становятся устойчивыми. Смотри, в каком знаке и доме стоит Луна: это подсказывает стиль и среду реализации.', 86, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.10.ruler.moon.sign.any.house.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Управитель 10-го дома (Меркурий) стоит в определённом знаке: это задаёт стиль проявления темы 10-го дома.', priority = 86, is_active = 1, meta_json = '{}'
WHERE key = 'natal.house.10.ruler.mercury.sign.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.10.ruler.mercury.sign.any', '', 'ru-RU', 'Управитель 10-го дома (Меркурий) стоит в определённом знаке: это задаёт стиль проявления темы 10-го дома.', 86, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.10.ruler.mercury.sign.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Управитель 10-го дома (Меркурий) расположен в некотором доме: это показывает, где именно «включается» тема 10-го дома.', priority = 86, is_active = 1, meta_json = '{}'
WHERE key = 'natal.house.10.ruler.mercury.house.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.10.ruler.mercury.house.any', '', 'ru-RU', 'Управитель 10-го дома (Меркурий) расположен в некотором доме: это показывает, где именно «включается» тема 10-го дома.', 86, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.10.ruler.mercury.house.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Управитель 10-го дома — Меркурий: важны условия, где твои решения по теме дома становятся устойчивыми. Смотри, в каком знаке и доме стоит Меркурий: это подсказывает стиль и среду реализации.', priority = 86, is_active = 1, meta_json = '{}'
WHERE key = 'natal.house.10.ruler.mercury.sign.any.house.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.10.ruler.mercury.sign.any.house.any', '', 'ru-RU', 'Управитель 10-го дома — Меркурий: важны условия, где твои решения по теме дома становятся устойчивыми. Смотри, в каком знаке и доме стоит Меркурий: это подсказывает стиль и среду реализации.', 86, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.10.ruler.mercury.sign.any.house.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Управитель 10-го дома (Венера) стоит в определённом знаке: это задаёт стиль проявления темы 10-го дома.', priority = 86, is_active = 1, meta_json = '{}'
WHERE key = 'natal.house.10.ruler.venus.sign.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.10.ruler.venus.sign.any', '', 'ru-RU', 'Управитель 10-го дома (Венера) стоит в определённом знаке: это задаёт стиль проявления темы 10-го дома.', 86, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.10.ruler.venus.sign.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Управитель 10-го дома (Венера) расположен в некотором доме: это показывает, где именно «включается» тема 10-го дома.', priority = 86, is_active = 1, meta_json = '{}'
WHERE key = 'natal.house.10.ruler.venus.house.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.10.ruler.venus.house.any', '', 'ru-RU', 'Управитель 10-го дома (Венера) расположен в некотором доме: это показывает, где именно «включается» тема 10-го дома.', 86, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.10.ruler.venus.house.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Управитель 10-го дома — Венера: важны условия, где твои решения по теме дома становятся устойчивыми. Смотри, в каком знаке и доме стоит Венера: это подсказывает стиль и среду реализации.', priority = 86, is_active = 1, meta_json = '{}'
WHERE key = 'natal.house.10.ruler.venus.sign.any.house.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.10.ruler.venus.sign.any.house.any', '', 'ru-RU', 'Управитель 10-го дома — Венера: важны условия, где твои решения по теме дома становятся устойчивыми. Смотри, в каком знаке и доме стоит Венера: это подсказывает стиль и среду реализации.', 86, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.10.ruler.venus.sign.any.house.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Управитель 10-го дома (Марс) стоит в определённом знаке: это задаёт стиль проявления темы 10-го дома.', priority = 86, is_active = 1, meta_json = '{}'
WHERE key = 'natal.house.10.ruler.mars.sign.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.10.ruler.mars.sign.any', '', 'ru-RU', 'Управитель 10-го дома (Марс) стоит в определённом знаке: это задаёт стиль проявления темы 10-го дома.', 86, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.10.ruler.mars.sign.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Управитель 10-го дома (Марс) расположен в некотором доме: это показывает, где именно «включается» тема 10-го дома.', priority = 86, is_active = 1, meta_json = '{}'
WHERE key = 'natal.house.10.ruler.mars.house.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.10.ruler.mars.house.any', '', 'ru-RU', 'Управитель 10-го дома (Марс) расположен в некотором доме: это показывает, где именно «включается» тема 10-го дома.', 86, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.10.ruler.mars.house.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Управитель 10-го дома — Марс: важны условия, где твои решения по теме дома становятся устойчивыми. Смотри, в каком знаке и доме стоит Марс: это подсказывает стиль и среду реализации.', priority = 86, is_active = 1, meta_json = '{}'
WHERE key = 'natal.house.10.ruler.mars.sign.any.house.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.10.ruler.mars.sign.any.house.any', '', 'ru-RU', 'Управитель 10-го дома — Марс: важны условия, где твои решения по теме дома становятся устойчивыми. Смотри, в каком знаке и доме стоит Марс: это подсказывает стиль и среду реализации.', 86, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.10.ruler.mars.sign.any.house.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Управитель 10-го дома (Юпитер) стоит в определённом знаке: это задаёт стиль проявления темы 10-го дома.', priority = 86, is_active = 1, meta_json = '{}'
WHERE key = 'natal.house.10.ruler.jupiter.sign.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.10.ruler.jupiter.sign.any', '', 'ru-RU', 'Управитель 10-го дома (Юпитер) стоит в определённом знаке: это задаёт стиль проявления темы 10-го дома.', 86, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.10.ruler.jupiter.sign.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Управитель 10-го дома (Юпитер) расположен в некотором доме: это показывает, где именно «включается» тема 10-го дома.', priority = 86, is_active = 1, meta_json = '{}'
WHERE key = 'natal.house.10.ruler.jupiter.house.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.10.ruler.jupiter.house.any', '', 'ru-RU', 'Управитель 10-го дома (Юпитер) расположен в некотором доме: это показывает, где именно «включается» тема 10-го дома.', 86, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.10.ruler.jupiter.house.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Управитель 10-го дома — Юпитер: важны условия, где твои решения по теме дома становятся устойчивыми. Смотри, в каком знаке и доме стоит Юпитер: это подсказывает стиль и среду реализации.', priority = 86, is_active = 1, meta_json = '{}'
WHERE key = 'natal.house.10.ruler.jupiter.sign.any.house.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.10.ruler.jupiter.sign.any.house.any', '', 'ru-RU', 'Управитель 10-го дома — Юпитер: важны условия, где твои решения по теме дома становятся устойчивыми. Смотри, в каком знаке и доме стоит Юпитер: это подсказывает стиль и среду реализации.', 86, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.10.ruler.jupiter.sign.any.house.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Управитель 10-го дома (Сатурн) стоит в определённом знаке: это задаёт стиль проявления темы 10-го дома.', priority = 86, is_active = 1, meta_json = '{}'
WHERE key = 'natal.house.10.ruler.saturn.sign.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.10.ruler.saturn.sign.any', '', 'ru-RU', 'Управитель 10-го дома (Сатурн) стоит в определённом знаке: это задаёт стиль проявления темы 10-го дома.', 86, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.10.ruler.saturn.sign.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Управитель 10-го дома (Сатурн) расположен в некотором доме: это показывает, где именно «включается» тема 10-го дома.', priority = 86, is_active = 1, meta_json = '{}'
WHERE key = 'natal.house.10.ruler.saturn.house.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.10.ruler.saturn.house.any', '', 'ru-RU', 'Управитель 10-го дома (Сатурн) расположен в некотором доме: это показывает, где именно «включается» тема 10-го дома.', 86, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.10.ruler.saturn.house.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Управитель 10-го дома — Сатурн: важны условия, где твои решения по теме дома становятся устойчивыми. Смотри, в каком знаке и доме стоит Сатурн: это подсказывает стиль и среду реализации.', priority = 86, is_active = 1, meta_json = '{}'
WHERE key = 'natal.house.10.ruler.saturn.sign.any.house.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.10.ruler.saturn.sign.any.house.any', '', 'ru-RU', 'Управитель 10-го дома — Сатурн: важны условия, где твои решения по теме дома становятся устойчивыми. Смотри, в каком знаке и доме стоит Сатурн: это подсказывает стиль и среду реализации.', 86, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.10.ruler.saturn.sign.any.house.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Управитель 10-го дома (Уран) стоит в определённом знаке: это задаёт стиль проявления темы 10-го дома.', priority = 86, is_active = 1, meta_json = '{}'
WHERE key = 'natal.house.10.ruler.uranus.sign.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.10.ruler.uranus.sign.any', '', 'ru-RU', 'Управитель 10-го дома (Уран) стоит в определённом знаке: это задаёт стиль проявления темы 10-го дома.', 86, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.10.ruler.uranus.sign.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Управитель 10-го дома (Уран) расположен в некотором доме: это показывает, где именно «включается» тема 10-го дома.', priority = 86, is_active = 1, meta_json = '{}'
WHERE key = 'natal.house.10.ruler.uranus.house.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.10.ruler.uranus.house.any', '', 'ru-RU', 'Управитель 10-го дома (Уран) расположен в некотором доме: это показывает, где именно «включается» тема 10-го дома.', 86, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.10.ruler.uranus.house.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Управитель 10-го дома — Уран: важны условия, где твои решения по теме дома становятся устойчивыми. Смотри, в каком знаке и доме стоит Уран: это подсказывает стиль и среду реализации.', priority = 86, is_active = 1, meta_json = '{}'
WHERE key = 'natal.house.10.ruler.uranus.sign.any.house.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.10.ruler.uranus.sign.any.house.any', '', 'ru-RU', 'Управитель 10-го дома — Уран: важны условия, где твои решения по теме дома становятся устойчивыми. Смотри, в каком знаке и доме стоит Уран: это подсказывает стиль и среду реализации.', 86, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.10.ruler.uranus.sign.any.house.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Управитель 10-го дома (Нептун) стоит в определённом знаке: это задаёт стиль проявления темы 10-го дома.', priority = 86, is_active = 1, meta_json = '{}'
WHERE key = 'natal.house.10.ruler.neptune.sign.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.10.ruler.neptune.sign.any', '', 'ru-RU', 'Управитель 10-го дома (Нептун) стоит в определённом знаке: это задаёт стиль проявления темы 10-го дома.', 86, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.10.ruler.neptune.sign.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Управитель 10-го дома (Нептун) расположен в некотором доме: это показывает, где именно «включается» тема 10-го дома.', priority = 86, is_active = 1, meta_json = '{}'
WHERE key = 'natal.house.10.ruler.neptune.house.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.10.ruler.neptune.house.any', '', 'ru-RU', 'Управитель 10-го дома (Нептун) расположен в некотором доме: это показывает, где именно «включается» тема 10-го дома.', 86, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.10.ruler.neptune.house.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Управитель 10-го дома — Нептун: важны условия, где твои решения по теме дома становятся устойчивыми. Смотри, в каком знаке и доме стоит Нептун: это подсказывает стиль и среду реализации.', priority = 86, is_active = 1, meta_json = '{}'
WHERE key = 'natal.house.10.ruler.neptune.sign.any.house.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.10.ruler.neptune.sign.any.house.any', '', 'ru-RU', 'Управитель 10-го дома — Нептун: важны условия, где твои решения по теме дома становятся устойчивыми. Смотри, в каком знаке и доме стоит Нептун: это подсказывает стиль и среду реализации.', 86, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.10.ruler.neptune.sign.any.house.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Управитель 10-го дома (Плутон) стоит в определённом знаке: это задаёт стиль проявления темы 10-го дома.', priority = 86, is_active = 1, meta_json = '{}'
WHERE key = 'natal.house.10.ruler.pluto.sign.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.10.ruler.pluto.sign.any', '', 'ru-RU', 'Управитель 10-го дома (Плутон) стоит в определённом знаке: это задаёт стиль проявления темы 10-го дома.', 86, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.10.ruler.pluto.sign.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Управитель 10-го дома (Плутон) расположен в некотором доме: это показывает, где именно «включается» тема 10-го дома.', priority = 86, is_active = 1, meta_json = '{}'
WHERE key = 'natal.house.10.ruler.pluto.house.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.10.ruler.pluto.house.any', '', 'ru-RU', 'Управитель 10-го дома (Плутон) расположен в некотором доме: это показывает, где именно «включается» тема 10-го дома.', 86, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.10.ruler.pluto.house.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Управитель 10-го дома — Плутон: важны условия, где твои решения по теме дома становятся устойчивыми. Смотри, в каком знаке и доме стоит Плутон: это подсказывает стиль и среду реализации.', priority = 86, is_active = 1, meta_json = '{}'
WHERE key = 'natal.house.10.ruler.pluto.sign.any.house.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.10.ruler.pluto.sign.any.house.any', '', 'ru-RU', 'Управитель 10-го дома — Плутон: важны условия, где твои решения по теме дома становятся устойчивыми. Смотри, в каком знаке и доме стоит Плутон: это подсказывает стиль и среду реализации.', 86, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.10.ruler.pluto.sign.any.house.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Управитель 11-го дома (Солнце) стоит в определённом знаке: это задаёт стиль проявления темы 11-го дома.', priority = 86, is_active = 1, meta_json = '{}'
WHERE key = 'natal.house.11.ruler.sun.sign.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.11.ruler.sun.sign.any', '', 'ru-RU', 'Управитель 11-го дома (Солнце) стоит в определённом знаке: это задаёт стиль проявления темы 11-го дома.', 86, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.11.ruler.sun.sign.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Управитель 11-го дома (Солнце) расположен в некотором доме: это показывает, где именно «включается» тема 11-го дома.', priority = 86, is_active = 1, meta_json = '{}'
WHERE key = 'natal.house.11.ruler.sun.house.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.11.ruler.sun.house.any', '', 'ru-RU', 'Управитель 11-го дома (Солнце) расположен в некотором доме: это показывает, где именно «включается» тема 11-го дома.', 86, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.11.ruler.sun.house.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Управитель 11-го дома — Солнце: важны условия, где твои решения по теме дома становятся устойчивыми. Смотри, в каком знаке и доме стоит Солнце: это подсказывает стиль и среду реализации.', priority = 86, is_active = 1, meta_json = '{}'
WHERE key = 'natal.house.11.ruler.sun.sign.any.house.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.11.ruler.sun.sign.any.house.any', '', 'ru-RU', 'Управитель 11-го дома — Солнце: важны условия, где твои решения по теме дома становятся устойчивыми. Смотри, в каком знаке и доме стоит Солнце: это подсказывает стиль и среду реализации.', 86, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.11.ruler.sun.sign.any.house.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Управитель 11-го дома (Луна) стоит в определённом знаке: это задаёт стиль проявления темы 11-го дома.', priority = 86, is_active = 1, meta_json = '{}'
WHERE key = 'natal.house.11.ruler.moon.sign.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.11.ruler.moon.sign.any', '', 'ru-RU', 'Управитель 11-го дома (Луна) стоит в определённом знаке: это задаёт стиль проявления темы 11-го дома.', 86, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.11.ruler.moon.sign.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Управитель 11-го дома (Луна) расположен в некотором доме: это показывает, где именно «включается» тема 11-го дома.', priority = 86, is_active = 1, meta_json = '{}'
WHERE key = 'natal.house.11.ruler.moon.house.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.11.ruler.moon.house.any', '', 'ru-RU', 'Управитель 11-го дома (Луна) расположен в некотором доме: это показывает, где именно «включается» тема 11-го дома.', 86, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.11.ruler.moon.house.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Управитель 11-го дома — Луна: важны условия, где твои решения по теме дома становятся устойчивыми. Смотри, в каком знаке и доме стоит Луна: это подсказывает стиль и среду реализации.', priority = 86, is_active = 1, meta_json = '{}'
WHERE key = 'natal.house.11.ruler.moon.sign.any.house.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.11.ruler.moon.sign.any.house.any', '', 'ru-RU', 'Управитель 11-го дома — Луна: важны условия, где твои решения по теме дома становятся устойчивыми. Смотри, в каком знаке и доме стоит Луна: это подсказывает стиль и среду реализации.', 86, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.11.ruler.moon.sign.any.house.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Управитель 11-го дома (Меркурий) стоит в определённом знаке: это задаёт стиль проявления темы 11-го дома.', priority = 86, is_active = 1, meta_json = '{}'
WHERE key = 'natal.house.11.ruler.mercury.sign.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.11.ruler.mercury.sign.any', '', 'ru-RU', 'Управитель 11-го дома (Меркурий) стоит в определённом знаке: это задаёт стиль проявления темы 11-го дома.', 86, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.11.ruler.mercury.sign.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Управитель 11-го дома (Меркурий) расположен в некотором доме: это показывает, где именно «включается» тема 11-го дома.', priority = 86, is_active = 1, meta_json = '{}'
WHERE key = 'natal.house.11.ruler.mercury.house.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.11.ruler.mercury.house.any', '', 'ru-RU', 'Управитель 11-го дома (Меркурий) расположен в некотором доме: это показывает, где именно «включается» тема 11-го дома.', 86, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.11.ruler.mercury.house.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Управитель 11-го дома — Меркурий: важны условия, где твои решения по теме дома становятся устойчивыми. Смотри, в каком знаке и доме стоит Меркурий: это подсказывает стиль и среду реализации.', priority = 86, is_active = 1, meta_json = '{}'
WHERE key = 'natal.house.11.ruler.mercury.sign.any.house.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.11.ruler.mercury.sign.any.house.any', '', 'ru-RU', 'Управитель 11-го дома — Меркурий: важны условия, где твои решения по теме дома становятся устойчивыми. Смотри, в каком знаке и доме стоит Меркурий: это подсказывает стиль и среду реализации.', 86, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.11.ruler.mercury.sign.any.house.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Управитель 11-го дома (Венера) стоит в определённом знаке: это задаёт стиль проявления темы 11-го дома.', priority = 86, is_active = 1, meta_json = '{}'
WHERE key = 'natal.house.11.ruler.venus.sign.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.11.ruler.venus.sign.any', '', 'ru-RU', 'Управитель 11-го дома (Венера) стоит в определённом знаке: это задаёт стиль проявления темы 11-го дома.', 86, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.11.ruler.venus.sign.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Управитель 11-го дома (Венера) расположен в некотором доме: это показывает, где именно «включается» тема 11-го дома.', priority = 86, is_active = 1, meta_json = '{}'
WHERE key = 'natal.house.11.ruler.venus.house.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.11.ruler.venus.house.any', '', 'ru-RU', 'Управитель 11-го дома (Венера) расположен в некотором доме: это показывает, где именно «включается» тема 11-го дома.', 86, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.11.ruler.venus.house.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Управитель 11-го дома — Венера: важны условия, где твои решения по теме дома становятся устойчивыми. Смотри, в каком знаке и доме стоит Венера: это подсказывает стиль и среду реализации.', priority = 86, is_active = 1, meta_json = '{}'
WHERE key = 'natal.house.11.ruler.venus.sign.any.house.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.11.ruler.venus.sign.any.house.any', '', 'ru-RU', 'Управитель 11-го дома — Венера: важны условия, где твои решения по теме дома становятся устойчивыми. Смотри, в каком знаке и доме стоит Венера: это подсказывает стиль и среду реализации.', 86, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.11.ruler.venus.sign.any.house.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Управитель 11-го дома (Марс) стоит в определённом знаке: это задаёт стиль проявления темы 11-го дома.', priority = 86, is_active = 1, meta_json = '{}'
WHERE key = 'natal.house.11.ruler.mars.sign.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.11.ruler.mars.sign.any', '', 'ru-RU', 'Управитель 11-го дома (Марс) стоит в определённом знаке: это задаёт стиль проявления темы 11-го дома.', 86, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.11.ruler.mars.sign.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Управитель 11-го дома (Марс) расположен в некотором доме: это показывает, где именно «включается» тема 11-го дома.', priority = 86, is_active = 1, meta_json = '{}'
WHERE key = 'natal.house.11.ruler.mars.house.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.11.ruler.mars.house.any', '', 'ru-RU', 'Управитель 11-го дома (Марс) расположен в некотором доме: это показывает, где именно «включается» тема 11-го дома.', 86, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.11.ruler.mars.house.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Управитель 11-го дома — Марс: важны условия, где твои решения по теме дома становятся устойчивыми. Смотри, в каком знаке и доме стоит Марс: это подсказывает стиль и среду реализации.', priority = 86, is_active = 1, meta_json = '{}'
WHERE key = 'natal.house.11.ruler.mars.sign.any.house.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.11.ruler.mars.sign.any.house.any', '', 'ru-RU', 'Управитель 11-го дома — Марс: важны условия, где твои решения по теме дома становятся устойчивыми. Смотри, в каком знаке и доме стоит Марс: это подсказывает стиль и среду реализации.', 86, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.11.ruler.mars.sign.any.house.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Управитель 11-го дома (Юпитер) стоит в определённом знаке: это задаёт стиль проявления темы 11-го дома.', priority = 86, is_active = 1, meta_json = '{}'
WHERE key = 'natal.house.11.ruler.jupiter.sign.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.11.ruler.jupiter.sign.any', '', 'ru-RU', 'Управитель 11-го дома (Юпитер) стоит в определённом знаке: это задаёт стиль проявления темы 11-го дома.', 86, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.11.ruler.jupiter.sign.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Управитель 11-го дома (Юпитер) расположен в некотором доме: это показывает, где именно «включается» тема 11-го дома.', priority = 86, is_active = 1, meta_json = '{}'
WHERE key = 'natal.house.11.ruler.jupiter.house.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.11.ruler.jupiter.house.any', '', 'ru-RU', 'Управитель 11-го дома (Юпитер) расположен в некотором доме: это показывает, где именно «включается» тема 11-го дома.', 86, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.11.ruler.jupiter.house.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Управитель 11-го дома — Юпитер: важны условия, где твои решения по теме дома становятся устойчивыми. Смотри, в каком знаке и доме стоит Юпитер: это подсказывает стиль и среду реализации.', priority = 86, is_active = 1, meta_json = '{}'
WHERE key = 'natal.house.11.ruler.jupiter.sign.any.house.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.11.ruler.jupiter.sign.any.house.any', '', 'ru-RU', 'Управитель 11-го дома — Юпитер: важны условия, где твои решения по теме дома становятся устойчивыми. Смотри, в каком знаке и доме стоит Юпитер: это подсказывает стиль и среду реализации.', 86, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.11.ruler.jupiter.sign.any.house.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Управитель 11-го дома (Сатурн) стоит в определённом знаке: это задаёт стиль проявления темы 11-го дома.', priority = 86, is_active = 1, meta_json = '{}'
WHERE key = 'natal.house.11.ruler.saturn.sign.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.11.ruler.saturn.sign.any', '', 'ru-RU', 'Управитель 11-го дома (Сатурн) стоит в определённом знаке: это задаёт стиль проявления темы 11-го дома.', 86, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.11.ruler.saturn.sign.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Управитель 11-го дома (Сатурн) расположен в некотором доме: это показывает, где именно «включается» тема 11-го дома.', priority = 86, is_active = 1, meta_json = '{}'
WHERE key = 'natal.house.11.ruler.saturn.house.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.11.ruler.saturn.house.any', '', 'ru-RU', 'Управитель 11-го дома (Сатурн) расположен в некотором доме: это показывает, где именно «включается» тема 11-го дома.', 86, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.11.ruler.saturn.house.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Управитель 11-го дома — Сатурн: важны условия, где твои решения по теме дома становятся устойчивыми. Смотри, в каком знаке и доме стоит Сатурн: это подсказывает стиль и среду реализации.', priority = 86, is_active = 1, meta_json = '{}'
WHERE key = 'natal.house.11.ruler.saturn.sign.any.house.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.11.ruler.saturn.sign.any.house.any', '', 'ru-RU', 'Управитель 11-го дома — Сатурн: важны условия, где твои решения по теме дома становятся устойчивыми. Смотри, в каком знаке и доме стоит Сатурн: это подсказывает стиль и среду реализации.', 86, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.11.ruler.saturn.sign.any.house.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Управитель 11-го дома (Уран) стоит в определённом знаке: это задаёт стиль проявления темы 11-го дома.', priority = 86, is_active = 1, meta_json = '{}'
WHERE key = 'natal.house.11.ruler.uranus.sign.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.11.ruler.uranus.sign.any', '', 'ru-RU', 'Управитель 11-го дома (Уран) стоит в определённом знаке: это задаёт стиль проявления темы 11-го дома.', 86, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.11.ruler.uranus.sign.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Управитель 11-го дома (Уран) расположен в некотором доме: это показывает, где именно «включается» тема 11-го дома.', priority = 86, is_active = 1, meta_json = '{}'
WHERE key = 'natal.house.11.ruler.uranus.house.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.11.ruler.uranus.house.any', '', 'ru-RU', 'Управитель 11-го дома (Уран) расположен в некотором доме: это показывает, где именно «включается» тема 11-го дома.', 86, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.11.ruler.uranus.house.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Управитель 11-го дома — Уран: важны условия, где твои решения по теме дома становятся устойчивыми. Смотри, в каком знаке и доме стоит Уран: это подсказывает стиль и среду реализации.', priority = 86, is_active = 1, meta_json = '{}'
WHERE key = 'natal.house.11.ruler.uranus.sign.any.house.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.11.ruler.uranus.sign.any.house.any', '', 'ru-RU', 'Управитель 11-го дома — Уран: важны условия, где твои решения по теме дома становятся устойчивыми. Смотри, в каком знаке и доме стоит Уран: это подсказывает стиль и среду реализации.', 86, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.11.ruler.uranus.sign.any.house.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Управитель 11-го дома (Нептун) стоит в определённом знаке: это задаёт стиль проявления темы 11-го дома.', priority = 86, is_active = 1, meta_json = '{}'
WHERE key = 'natal.house.11.ruler.neptune.sign.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.11.ruler.neptune.sign.any', '', 'ru-RU', 'Управитель 11-го дома (Нептун) стоит в определённом знаке: это задаёт стиль проявления темы 11-го дома.', 86, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.11.ruler.neptune.sign.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Управитель 11-го дома (Нептун) расположен в некотором доме: это показывает, где именно «включается» тема 11-го дома.', priority = 86, is_active = 1, meta_json = '{}'
WHERE key = 'natal.house.11.ruler.neptune.house.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.11.ruler.neptune.house.any', '', 'ru-RU', 'Управитель 11-го дома (Нептун) расположен в некотором доме: это показывает, где именно «включается» тема 11-го дома.', 86, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.11.ruler.neptune.house.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Управитель 11-го дома — Нептун: важны условия, где твои решения по теме дома становятся устойчивыми. Смотри, в каком знаке и доме стоит Нептун: это подсказывает стиль и среду реализации.', priority = 86, is_active = 1, meta_json = '{}'
WHERE key = 'natal.house.11.ruler.neptune.sign.any.house.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.11.ruler.neptune.sign.any.house.any', '', 'ru-RU', 'Управитель 11-го дома — Нептун: важны условия, где твои решения по теме дома становятся устойчивыми. Смотри, в каком знаке и доме стоит Нептун: это подсказывает стиль и среду реализации.', 86, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.11.ruler.neptune.sign.any.house.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Управитель 11-го дома (Плутон) стоит в определённом знаке: это задаёт стиль проявления темы 11-го дома.', priority = 86, is_active = 1, meta_json = '{}'
WHERE key = 'natal.house.11.ruler.pluto.sign.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.11.ruler.pluto.sign.any', '', 'ru-RU', 'Управитель 11-го дома (Плутон) стоит в определённом знаке: это задаёт стиль проявления темы 11-го дома.', 86, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.11.ruler.pluto.sign.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Управитель 11-го дома (Плутон) расположен в некотором доме: это показывает, где именно «включается» тема 11-го дома.', priority = 86, is_active = 1, meta_json = '{}'
WHERE key = 'natal.house.11.ruler.pluto.house.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.11.ruler.pluto.house.any', '', 'ru-RU', 'Управитель 11-го дома (Плутон) расположен в некотором доме: это показывает, где именно «включается» тема 11-го дома.', 86, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.11.ruler.pluto.house.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Управитель 11-го дома — Плутон: важны условия, где твои решения по теме дома становятся устойчивыми. Смотри, в каком знаке и доме стоит Плутон: это подсказывает стиль и среду реализации.', priority = 86, is_active = 1, meta_json = '{}'
WHERE key = 'natal.house.11.ruler.pluto.sign.any.house.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.11.ruler.pluto.sign.any.house.any', '', 'ru-RU', 'Управитель 11-го дома — Плутон: важны условия, где твои решения по теме дома становятся устойчивыми. Смотри, в каком знаке и доме стоит Плутон: это подсказывает стиль и среду реализации.', 86, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.11.ruler.pluto.sign.any.house.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Управитель 12-го дома (Солнце) стоит в определённом знаке: это задаёт стиль проявления темы 12-го дома.', priority = 86, is_active = 1, meta_json = '{}'
WHERE key = 'natal.house.12.ruler.sun.sign.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.12.ruler.sun.sign.any', '', 'ru-RU', 'Управитель 12-го дома (Солнце) стоит в определённом знаке: это задаёт стиль проявления темы 12-го дома.', 86, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.12.ruler.sun.sign.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Управитель 12-го дома (Солнце) расположен в некотором доме: это показывает, где именно «включается» тема 12-го дома.', priority = 86, is_active = 1, meta_json = '{}'
WHERE key = 'natal.house.12.ruler.sun.house.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.12.ruler.sun.house.any', '', 'ru-RU', 'Управитель 12-го дома (Солнце) расположен в некотором доме: это показывает, где именно «включается» тема 12-го дома.', 86, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.12.ruler.sun.house.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Управитель 12-го дома — Солнце: важны условия, где твои решения по теме дома становятся устойчивыми. Смотри, в каком знаке и доме стоит Солнце: это подсказывает стиль и среду реализации.', priority = 86, is_active = 1, meta_json = '{}'
WHERE key = 'natal.house.12.ruler.sun.sign.any.house.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.12.ruler.sun.sign.any.house.any', '', 'ru-RU', 'Управитель 12-го дома — Солнце: важны условия, где твои решения по теме дома становятся устойчивыми. Смотри, в каком знаке и доме стоит Солнце: это подсказывает стиль и среду реализации.', 86, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.12.ruler.sun.sign.any.house.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Управитель 12-го дома (Луна) стоит в определённом знаке: это задаёт стиль проявления темы 12-го дома.', priority = 86, is_active = 1, meta_json = '{}'
WHERE key = 'natal.house.12.ruler.moon.sign.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.12.ruler.moon.sign.any', '', 'ru-RU', 'Управитель 12-го дома (Луна) стоит в определённом знаке: это задаёт стиль проявления темы 12-го дома.', 86, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.12.ruler.moon.sign.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Управитель 12-го дома (Луна) расположен в некотором доме: это показывает, где именно «включается» тема 12-го дома.', priority = 86, is_active = 1, meta_json = '{}'
WHERE key = 'natal.house.12.ruler.moon.house.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.12.ruler.moon.house.any', '', 'ru-RU', 'Управитель 12-го дома (Луна) расположен в некотором доме: это показывает, где именно «включается» тема 12-го дома.', 86, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.12.ruler.moon.house.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Управитель 12-го дома — Луна: важны условия, где твои решения по теме дома становятся устойчивыми. Смотри, в каком знаке и доме стоит Луна: это подсказывает стиль и среду реализации.', priority = 86, is_active = 1, meta_json = '{}'
WHERE key = 'natal.house.12.ruler.moon.sign.any.house.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.12.ruler.moon.sign.any.house.any', '', 'ru-RU', 'Управитель 12-го дома — Луна: важны условия, где твои решения по теме дома становятся устойчивыми. Смотри, в каком знаке и доме стоит Луна: это подсказывает стиль и среду реализации.', 86, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.12.ruler.moon.sign.any.house.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Управитель 12-го дома (Меркурий) стоит в определённом знаке: это задаёт стиль проявления темы 12-го дома.', priority = 86, is_active = 1, meta_json = '{}'
WHERE key = 'natal.house.12.ruler.mercury.sign.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.12.ruler.mercury.sign.any', '', 'ru-RU', 'Управитель 12-го дома (Меркурий) стоит в определённом знаке: это задаёт стиль проявления темы 12-го дома.', 86, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.12.ruler.mercury.sign.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Управитель 12-го дома (Меркурий) расположен в некотором доме: это показывает, где именно «включается» тема 12-го дома.', priority = 86, is_active = 1, meta_json = '{}'
WHERE key = 'natal.house.12.ruler.mercury.house.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.12.ruler.mercury.house.any', '', 'ru-RU', 'Управитель 12-го дома (Меркурий) расположен в некотором доме: это показывает, где именно «включается» тема 12-го дома.', 86, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.12.ruler.mercury.house.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Управитель 12-го дома — Меркурий: важны условия, где твои решения по теме дома становятся устойчивыми. Смотри, в каком знаке и доме стоит Меркурий: это подсказывает стиль и среду реализации.', priority = 86, is_active = 1, meta_json = '{}'
WHERE key = 'natal.house.12.ruler.mercury.sign.any.house.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.12.ruler.mercury.sign.any.house.any', '', 'ru-RU', 'Управитель 12-го дома — Меркурий: важны условия, где твои решения по теме дома становятся устойчивыми. Смотри, в каком знаке и доме стоит Меркурий: это подсказывает стиль и среду реализации.', 86, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.12.ruler.mercury.sign.any.house.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Управитель 12-го дома (Венера) стоит в определённом знаке: это задаёт стиль проявления темы 12-го дома.', priority = 86, is_active = 1, meta_json = '{}'
WHERE key = 'natal.house.12.ruler.venus.sign.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.12.ruler.venus.sign.any', '', 'ru-RU', 'Управитель 12-го дома (Венера) стоит в определённом знаке: это задаёт стиль проявления темы 12-го дома.', 86, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.12.ruler.venus.sign.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Управитель 12-го дома (Венера) расположен в некотором доме: это показывает, где именно «включается» тема 12-го дома.', priority = 86, is_active = 1, meta_json = '{}'
WHERE key = 'natal.house.12.ruler.venus.house.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.12.ruler.venus.house.any', '', 'ru-RU', 'Управитель 12-го дома (Венера) расположен в некотором доме: это показывает, где именно «включается» тема 12-го дома.', 86, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.12.ruler.venus.house.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Управитель 12-го дома — Венера: важны условия, где твои решения по теме дома становятся устойчивыми. Смотри, в каком знаке и доме стоит Венера: это подсказывает стиль и среду реализации.', priority = 86, is_active = 1, meta_json = '{}'
WHERE key = 'natal.house.12.ruler.venus.sign.any.house.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.12.ruler.venus.sign.any.house.any', '', 'ru-RU', 'Управитель 12-го дома — Венера: важны условия, где твои решения по теме дома становятся устойчивыми. Смотри, в каком знаке и доме стоит Венера: это подсказывает стиль и среду реализации.', 86, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.12.ruler.venus.sign.any.house.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Управитель 12-го дома (Марс) стоит в определённом знаке: это задаёт стиль проявления темы 12-го дома.', priority = 86, is_active = 1, meta_json = '{}'
WHERE key = 'natal.house.12.ruler.mars.sign.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.12.ruler.mars.sign.any', '', 'ru-RU', 'Управитель 12-го дома (Марс) стоит в определённом знаке: это задаёт стиль проявления темы 12-го дома.', 86, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.12.ruler.mars.sign.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Управитель 12-го дома (Марс) расположен в некотором доме: это показывает, где именно «включается» тема 12-го дома.', priority = 86, is_active = 1, meta_json = '{}'
WHERE key = 'natal.house.12.ruler.mars.house.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.12.ruler.mars.house.any', '', 'ru-RU', 'Управитель 12-го дома (Марс) расположен в некотором доме: это показывает, где именно «включается» тема 12-го дома.', 86, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.12.ruler.mars.house.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Управитель 12-го дома — Марс: важны условия, где твои решения по теме дома становятся устойчивыми. Смотри, в каком знаке и доме стоит Марс: это подсказывает стиль и среду реализации.', priority = 86, is_active = 1, meta_json = '{}'
WHERE key = 'natal.house.12.ruler.mars.sign.any.house.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.12.ruler.mars.sign.any.house.any', '', 'ru-RU', 'Управитель 12-го дома — Марс: важны условия, где твои решения по теме дома становятся устойчивыми. Смотри, в каком знаке и доме стоит Марс: это подсказывает стиль и среду реализации.', 86, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.12.ruler.mars.sign.any.house.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Управитель 12-го дома (Юпитер) стоит в определённом знаке: это задаёт стиль проявления темы 12-го дома.', priority = 86, is_active = 1, meta_json = '{}'
WHERE key = 'natal.house.12.ruler.jupiter.sign.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.12.ruler.jupiter.sign.any', '', 'ru-RU', 'Управитель 12-го дома (Юпитер) стоит в определённом знаке: это задаёт стиль проявления темы 12-го дома.', 86, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.12.ruler.jupiter.sign.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Управитель 12-го дома (Юпитер) расположен в некотором доме: это показывает, где именно «включается» тема 12-го дома.', priority = 86, is_active = 1, meta_json = '{}'
WHERE key = 'natal.house.12.ruler.jupiter.house.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.12.ruler.jupiter.house.any', '', 'ru-RU', 'Управитель 12-го дома (Юпитер) расположен в некотором доме: это показывает, где именно «включается» тема 12-го дома.', 86, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.12.ruler.jupiter.house.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Управитель 12-го дома — Юпитер: важны условия, где твои решения по теме дома становятся устойчивыми. Смотри, в каком знаке и доме стоит Юпитер: это подсказывает стиль и среду реализации.', priority = 86, is_active = 1, meta_json = '{}'
WHERE key = 'natal.house.12.ruler.jupiter.sign.any.house.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.12.ruler.jupiter.sign.any.house.any', '', 'ru-RU', 'Управитель 12-го дома — Юпитер: важны условия, где твои решения по теме дома становятся устойчивыми. Смотри, в каком знаке и доме стоит Юпитер: это подсказывает стиль и среду реализации.', 86, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.12.ruler.jupiter.sign.any.house.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Управитель 12-го дома (Сатурн) стоит в определённом знаке: это задаёт стиль проявления темы 12-го дома.', priority = 86, is_active = 1, meta_json = '{}'
WHERE key = 'natal.house.12.ruler.saturn.sign.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.12.ruler.saturn.sign.any', '', 'ru-RU', 'Управитель 12-го дома (Сатурн) стоит в определённом знаке: это задаёт стиль проявления темы 12-го дома.', 86, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.12.ruler.saturn.sign.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Управитель 12-го дома (Сатурн) расположен в некотором доме: это показывает, где именно «включается» тема 12-го дома.', priority = 86, is_active = 1, meta_json = '{}'
WHERE key = 'natal.house.12.ruler.saturn.house.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.12.ruler.saturn.house.any', '', 'ru-RU', 'Управитель 12-го дома (Сатурн) расположен в некотором доме: это показывает, где именно «включается» тема 12-го дома.', 86, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.12.ruler.saturn.house.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Управитель 12-го дома — Сатурн: важны условия, где твои решения по теме дома становятся устойчивыми. Смотри, в каком знаке и доме стоит Сатурн: это подсказывает стиль и среду реализации.', priority = 86, is_active = 1, meta_json = '{}'
WHERE key = 'natal.house.12.ruler.saturn.sign.any.house.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.12.ruler.saturn.sign.any.house.any', '', 'ru-RU', 'Управитель 12-го дома — Сатурн: важны условия, где твои решения по теме дома становятся устойчивыми. Смотри, в каком знаке и доме стоит Сатурн: это подсказывает стиль и среду реализации.', 86, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.12.ruler.saturn.sign.any.house.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Управитель 12-го дома (Уран) стоит в определённом знаке: это задаёт стиль проявления темы 12-го дома.', priority = 86, is_active = 1, meta_json = '{}'
WHERE key = 'natal.house.12.ruler.uranus.sign.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.12.ruler.uranus.sign.any', '', 'ru-RU', 'Управитель 12-го дома (Уран) стоит в определённом знаке: это задаёт стиль проявления темы 12-го дома.', 86, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.12.ruler.uranus.sign.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Управитель 12-го дома (Уран) расположен в некотором доме: это показывает, где именно «включается» тема 12-го дома.', priority = 86, is_active = 1, meta_json = '{}'
WHERE key = 'natal.house.12.ruler.uranus.house.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.12.ruler.uranus.house.any', '', 'ru-RU', 'Управитель 12-го дома (Уран) расположен в некотором доме: это показывает, где именно «включается» тема 12-го дома.', 86, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.12.ruler.uranus.house.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Управитель 12-го дома — Уран: важны условия, где твои решения по теме дома становятся устойчивыми. Смотри, в каком знаке и доме стоит Уран: это подсказывает стиль и среду реализации.', priority = 86, is_active = 1, meta_json = '{}'
WHERE key = 'natal.house.12.ruler.uranus.sign.any.house.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.12.ruler.uranus.sign.any.house.any', '', 'ru-RU', 'Управитель 12-го дома — Уран: важны условия, где твои решения по теме дома становятся устойчивыми. Смотри, в каком знаке и доме стоит Уран: это подсказывает стиль и среду реализации.', 86, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.12.ruler.uranus.sign.any.house.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Управитель 12-го дома (Нептун) стоит в определённом знаке: это задаёт стиль проявления темы 12-го дома.', priority = 86, is_active = 1, meta_json = '{}'
WHERE key = 'natal.house.12.ruler.neptune.sign.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.12.ruler.neptune.sign.any', '', 'ru-RU', 'Управитель 12-го дома (Нептун) стоит в определённом знаке: это задаёт стиль проявления темы 12-го дома.', 86, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.12.ruler.neptune.sign.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Управитель 12-го дома (Нептун) расположен в некотором доме: это показывает, где именно «включается» тема 12-го дома.', priority = 86, is_active = 1, meta_json = '{}'
WHERE key = 'natal.house.12.ruler.neptune.house.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.12.ruler.neptune.house.any', '', 'ru-RU', 'Управитель 12-го дома (Нептун) расположен в некотором доме: это показывает, где именно «включается» тема 12-го дома.', 86, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.12.ruler.neptune.house.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Управитель 12-го дома — Нептун: важны условия, где твои решения по теме дома становятся устойчивыми. Смотри, в каком знаке и доме стоит Нептун: это подсказывает стиль и среду реализации.', priority = 86, is_active = 1, meta_json = '{}'
WHERE key = 'natal.house.12.ruler.neptune.sign.any.house.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.12.ruler.neptune.sign.any.house.any', '', 'ru-RU', 'Управитель 12-го дома — Нептун: важны условия, где твои решения по теме дома становятся устойчивыми. Смотри, в каком знаке и доме стоит Нептун: это подсказывает стиль и среду реализации.', 86, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.12.ruler.neptune.sign.any.house.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Управитель 12-го дома (Плутон) стоит в определённом знаке: это задаёт стиль проявления темы 12-го дома.', priority = 86, is_active = 1, meta_json = '{}'
WHERE key = 'natal.house.12.ruler.pluto.sign.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.12.ruler.pluto.sign.any', '', 'ru-RU', 'Управитель 12-го дома (Плутон) стоит в определённом знаке: это задаёт стиль проявления темы 12-го дома.', 86, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.12.ruler.pluto.sign.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Управитель 12-го дома (Плутон) расположен в некотором доме: это показывает, где именно «включается» тема 12-го дома.', priority = 86, is_active = 1, meta_json = '{}'
WHERE key = 'natal.house.12.ruler.pluto.house.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.12.ruler.pluto.house.any', '', 'ru-RU', 'Управитель 12-го дома (Плутон) расположен в некотором доме: это показывает, где именно «включается» тема 12-го дома.', 86, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.12.ruler.pluto.house.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Управитель 12-го дома — Плутон: важны условия, где твои решения по теме дома становятся устойчивыми. Смотри, в каком знаке и доме стоит Плутон: это подсказывает стиль и среду реализации.', priority = 86, is_active = 1, meta_json = '{}'
WHERE key = 'natal.house.12.ruler.pluto.sign.any.house.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.12.ruler.pluto.sign.any.house.any', '', 'ru-RU', 'Управитель 12-го дома — Плутон: важны условия, где твои решения по теме дома становятся устойчивыми. Смотри, в каком знаке и доме стоит Плутон: это подсказывает стиль и среду реализации.', 86, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.12.ruler.pluto.sign.any.house.any' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

COMMIT;

