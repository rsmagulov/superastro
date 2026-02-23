-- AUTO-GENERATED. DO NOT EDIT BY HAND.

-- Career overrides from debug shortest used blocks (topic_category=creativity)

-- Source JSON: C:/Projects/superastro/debug_creativity_ru_160_20260223_130908_mini_housecore.json

-- Filter: len(text)<= 450, max_keys=250

BEGIN;

UPDATE knowledge_items
SET text = 'Куспид 5-й дом: знак не уточнён (any). В карьере важнее управление темой дома, чем стиль знака. Практика: выдели 1–2 навыка по теме дома и составь план на 4 недели (задачи, метрики, ритм).', is_active = 1, priority = 140, meta_json = '{}'
WHERE key = 'natal.house.5.cusp.sign.any' AND locale = 'ru-RU' AND topic_category = 'creativity';

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.5.cusp.sign.any', 'creativity', 'ru-RU', 'Куспид 5-й дом: знак не уточнён (any). В карьере важнее управление темой дома, чем стиль знака. Практика: выдели 1–2 навыка по теме дома и составь план на 4 недели (задачи, метрики, ритм).', 140, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.5.cusp.sign.any' AND locale = 'ru-RU' AND topic_category = 'creativity'
);

UPDATE knowledge_items
SET text = 'Куспид 5-й дом в Телец задаёт стиль решения задач по теме дома. Практика: подстрой окружение (роль, процессы, KPI), чтобы стиль знака усиливал результат, а не создавал лишние конфликты.', is_active = 1, priority = 140, meta_json = '{}'
WHERE key = 'natal.house.5.cusp.sign.taurus' AND locale = 'ru-RU' AND topic_category = 'creativity';

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.5.cusp.sign.taurus', 'creativity', 'ru-RU', 'Куспид 5-й дом в Телец задаёт стиль решения задач по теме дома. Практика: подстрой окружение (роль, процессы, KPI), чтобы стиль знака усиливал результат, а не создавал лишние конфликты.', 140, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.5.cusp.sign.taurus' AND locale = 'ru-RU' AND topic_category = 'creativity'
);

UPDATE knowledge_items
SET text = 'Аспекты управителя 5-й дом (Венера) — это каналы, через которые тема дома связана с карьерными событиями. Практика: найди 2 повторяющихся кейса и настрой процесс (договора, дедлайны, контроль качества, роли), чтобы переводить динамику аспектов в прогнозируемый результат.', is_active = 1, priority = 140, meta_json = '{}'
WHERE key = 'natal.house.5.ruler.venus.aspects.present' AND locale = 'ru-RU' AND topic_category = 'creativity';

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.5.ruler.venus.aspects.present', 'creativity', 'ru-RU', 'Аспекты управителя 5-й дом (Венера) — это каналы, через которые тема дома связана с карьерными событиями. Практика: найди 2 повторяющихся кейса и настрой процесс (договора, дедлайны, контроль качества, роли), чтобы переводить динамику аспектов в прогнозируемый результат.', 140, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.5.ruler.venus.aspects.present' AND locale = 'ru-RU' AND topic_category = 'creativity'
);

UPDATE knowledge_items
SET text = 'Карьерный маркер: показывает, где проще получить результат и что мешает стабильности. Практика: выбери 1 конкретный навык/процесс на 2 недели (приоритеты, дедлайны, коммуникации, контроль качества) и замерь эффект по метрикам: скорость, качество, доход, устойчивость.', is_active = 1, priority = 140, meta_json = '{}'
WHERE key = 'natal.house.5.ruler.any' AND locale = 'ru-RU' AND topic_category = 'creativity';

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.5.ruler.any', 'creativity', 'ru-RU', 'Карьерный маркер: показывает, где проще получить результат и что мешает стабильности. Практика: выбери 1 конкретный навык/процесс на 2 недели (приоритеты, дедлайны, коммуникации, контроль качества) и замерь эффект по метрикам: скорость, качество, доход, устойчивость.', 140, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.5.ruler.any' AND locale = 'ru-RU' AND topic_category = 'creativity'
);

UPDATE knowledge_items
SET text = 'Карьерный маркер: показывает, где проще получить результат и что мешает стабильности. Практика: выбери 1 конкретный навык/процесс на 2 недели (приоритеты, дедлайны, коммуникации, контроль качества) и замерь эффект по метрикам: скорость, качество, доход, устойчивость.', is_active = 1, priority = 140, meta_json = '{}'
WHERE key = 'natal.house.5.ruler.venus.sign.any' AND locale = 'ru-RU' AND topic_category = 'creativity';

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.5.ruler.venus.sign.any', 'creativity', 'ru-RU', 'Карьерный маркер: показывает, где проще получить результат и что мешает стабильности. Практика: выбери 1 конкретный навык/процесс на 2 недели (приоритеты, дедлайны, коммуникации, контроль качества) и замерь эффект по метрикам: скорость, качество, доход, устойчивость.', 140, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.5.ruler.venus.sign.any' AND locale = 'ru-RU' AND topic_category = 'creativity'
);

UPDATE knowledge_items
SET text = 'Управитель 5-й дом (Венера) в аспекте «секстиль» с Марс показывает механику результата. Это даёт ресурс и проще превращается в навык/результат. Практика: закрепи 1 правило процесса (приоритеты, дедлайны, формат договорённостей) и 1 метрику, чтобы повторять успех и снижать риски.', is_active = 1, priority = 140, meta_json = '{}'
WHERE key = 'natal.house.5.ruler.venus.aspect.sextile.mars' AND locale = 'ru-RU' AND topic_category = 'creativity';

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.5.ruler.venus.aspect.sextile.mars', 'creativity', 'ru-RU', 'Управитель 5-й дом (Венера) в аспекте «секстиль» с Марс показывает механику результата. Это даёт ресурс и проще превращается в навык/результат. Практика: закрепи 1 правило процесса (приоритеты, дедлайны, формат договорённостей) и 1 метрику, чтобы повторять успех и снижать риски.', 140, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.5.ruler.venus.aspect.sextile.mars' AND locale = 'ru-RU' AND topic_category = 'creativity'
);

UPDATE knowledge_items
SET text = 'Карьерный маркер: показывает, где проще получить результат и что мешает стабильности. Практика: выбери 1 конкретный навык/процесс на 2 недели (приоритеты, дедлайны, коммуникации, контроль качества) и замерь эффект по метрикам: скорость, качество, доход, устойчивость.', is_active = 1, priority = 140, meta_json = '{}'
WHERE key = 'natal.house.5.ruler.venus' AND locale = 'ru-RU' AND topic_category = 'creativity';

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.5.ruler.venus', 'creativity', 'ru-RU', 'Карьерный маркер: показывает, где проще получить результат и что мешает стабильности. Практика: выбери 1 конкретный навык/процесс на 2 недели (приоритеты, дедлайны, коммуникации, контроль качества) и замерь эффект по метрикам: скорость, качество, доход, устойчивость.', 140, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.5.ruler.venus' AND locale = 'ru-RU' AND topic_category = 'creativity'
);

COMMIT;

