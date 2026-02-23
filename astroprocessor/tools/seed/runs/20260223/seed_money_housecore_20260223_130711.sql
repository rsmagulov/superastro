-- AUTO-GENERATED. DO NOT EDIT BY HAND.

-- Career overrides from debug shortest used blocks (topic_category=money)

-- Source JSON: C:/Projects/superastro/debug_money_ru_160_20260223_130711_mini_housecore.json

-- Filter: len(text)<= 450, max_keys=250

BEGIN;

UPDATE knowledge_items
SET text = 'Куспид 8-й дом в Лев задаёт стиль решения задач по теме дома. Практика: подстрой окружение (роль, процессы, KPI), чтобы стиль знака усиливал результат, а не создавал лишние конфликты.', is_active = 1, priority = 140, meta_json = '{}'
WHERE key = 'natal.house.8.cusp.sign.leo' AND locale = 'ru-RU' AND topic_category = 'money';

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.8.cusp.sign.leo', 'money', 'ru-RU', 'Куспид 8-й дом в Лев задаёт стиль решения задач по теме дома. Практика: подстрой окружение (роль, процессы, KPI), чтобы стиль знака усиливал результат, а не создавал лишние конфликты.', 140, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.8.cusp.sign.leo' AND locale = 'ru-RU' AND topic_category = 'money'
);

UPDATE knowledge_items
SET text = 'Куспид 8-й дом: знак не уточнён (any). В карьере важнее управление темой дома, чем стиль знака. Практика: выдели 1–2 навыка по теме дома и составь план на 4 недели (задачи, метрики, ритм).', is_active = 1, priority = 140, meta_json = '{}'
WHERE key = 'natal.house.8.cusp.sign.any' AND locale = 'ru-RU' AND topic_category = 'money';

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.8.cusp.sign.any', 'money', 'ru-RU', 'Куспид 8-й дом: знак не уточнён (any). В карьере важнее управление темой дома, чем стиль знака. Практика: выдели 1–2 навыка по теме дома и составь план на 4 недели (задачи, метрики, ритм).', 140, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.8.cusp.sign.any' AND locale = 'ru-RU' AND topic_category = 'money'
);

UPDATE knowledge_items
SET text = 'Куспид 2-й дом (деньги/ресурсы/монетизация) в Водолей задаёт стиль решения задач по теме дома. Практика: подстрой окружение (роль, процессы, KPI), чтобы стиль знака усиливал результат, а не создавал лишние конфликты.', is_active = 1, priority = 140, meta_json = '{}'
WHERE key = 'natal.house.2.cusp.sign.aquarius' AND locale = 'ru-RU' AND topic_category = 'money';

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.2.cusp.sign.aquarius', 'money', 'ru-RU', 'Куспид 2-й дом (деньги/ресурсы/монетизация) в Водолей задаёт стиль решения задач по теме дома. Практика: подстрой окружение (роль, процессы, KPI), чтобы стиль знака усиливал результат, а не создавал лишние конфликты.', 140, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.2.cusp.sign.aquarius' AND locale = 'ru-RU' AND topic_category = 'money'
);

UPDATE knowledge_items
SET text = 'Куспид 2-й дом (деньги/ресурсы/монетизация): знак не уточнён (any). В карьере важнее управление темой дома, чем стиль знака. Практика: выдели 1–2 навыка по теме дома и составь план на 4 недели (задачи, метрики, ритм).', is_active = 1, priority = 140, meta_json = '{}'
WHERE key = 'natal.house.2.cusp.sign.any' AND locale = 'ru-RU' AND topic_category = 'money';

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.2.cusp.sign.any', 'money', 'ru-RU', 'Куспид 2-й дом (деньги/ресурсы/монетизация): знак не уточнён (any). В карьере важнее управление темой дома, чем стиль знака. Практика: выдели 1–2 навыка по теме дома и составь план на 4 недели (задачи, метрики, ритм).', 140, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.2.cusp.sign.any' AND locale = 'ru-RU' AND topic_category = 'money'
);

UPDATE knowledge_items
SET text = 'Карьерный маркер: показывает, где проще получить результат и что мешает стабильности. Практика: выбери 1 конкретный навык/процесс на 2 недели (приоритеты, дедлайны, коммуникации, контроль качества) и замерь эффект по метрикам: скорость, качество, доход, устойчивость.', is_active = 1, priority = 140, meta_json = '{}'
WHERE key = 'natal.house.2.planet.moon' AND locale = 'ru-RU' AND topic_category = 'money';

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.2.planet.moon', 'money', 'ru-RU', 'Карьерный маркер: показывает, где проще получить результат и что мешает стабильности. Практика: выбери 1 конкретный навык/процесс на 2 недели (приоритеты, дедлайны, коммуникации, контроль качества) и замерь эффект по метрикам: скорость, качество, доход, устойчивость.', 140, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.2.planet.moon' AND locale = 'ru-RU' AND topic_category = 'money'
);

UPDATE knowledge_items
SET text = 'Карьерный маркер: показывает, где проще получить результат и что мешает стабильности. Практика: выбери 1 конкретный навык/процесс на 2 недели (приоритеты, дедлайны, коммуникации, контроль качества) и замерь эффект по метрикам: скорость, качество, доход, устойчивость.', is_active = 1, priority = 140, meta_json = '{}'
WHERE key = 'natal.house.2.planet.venus' AND locale = 'ru-RU' AND topic_category = 'money';

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.2.planet.venus', 'money', 'ru-RU', 'Карьерный маркер: показывает, где проще получить результат и что мешает стабильности. Практика: выбери 1 конкретный навык/процесс на 2 недели (приоритеты, дедлайны, коммуникации, контроль качества) и замерь эффект по метрикам: скорость, качество, доход, устойчивость.', 140, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.2.planet.venus' AND locale = 'ru-RU' AND topic_category = 'money'
);

UPDATE knowledge_items
SET text = 'Карьерный маркер: показывает, где проще получить результат и что мешает стабильности. Практика: выбери 1 конкретный навык/процесс на 2 недели (приоритеты, дедлайны, коммуникации, контроль качества) и замерь эффект по метрикам: скорость, качество, доход, устойчивость.', is_active = 1, priority = 140, meta_json = '{}'
WHERE key = 'natal.house.2.ruler.any' AND locale = 'ru-RU' AND topic_category = 'money';

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.2.ruler.any', 'money', 'ru-RU', 'Карьерный маркер: показывает, где проще получить результат и что мешает стабильности. Практика: выбери 1 конкретный навык/процесс на 2 недели (приоритеты, дедлайны, коммуникации, контроль качества) и замерь эффект по метрикам: скорость, качество, доход, устойчивость.', 140, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.2.ruler.any' AND locale = 'ru-RU' AND topic_category = 'money'
);

UPDATE knowledge_items
SET text = 'Карьерный маркер: показывает, где проще получить результат и что мешает стабильности. Практика: выбери 1 конкретный навык/процесс на 2 недели (приоритеты, дедлайны, коммуникации, контроль качества) и замерь эффект по метрикам: скорость, качество, доход, устойчивость.', is_active = 1, priority = 140, meta_json = '{}'
WHERE key = 'natal.house.2.ruler.saturn' AND locale = 'ru-RU' AND topic_category = 'money';

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.2.ruler.saturn', 'money', 'ru-RU', 'Карьерный маркер: показывает, где проще получить результат и что мешает стабильности. Практика: выбери 1 конкретный навык/процесс на 2 недели (приоритеты, дедлайны, коммуникации, контроль качества) и замерь эффект по метрикам: скорость, качество, доход, устойчивость.', 140, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.2.ruler.saturn' AND locale = 'ru-RU' AND topic_category = 'money'
);

UPDATE knowledge_items
SET text = 'Карьерный маркер: показывает, где проще получить результат и что мешает стабильности. Практика: выбери 1 конкретный навык/процесс на 2 недели (приоритеты, дедлайны, коммуникации, контроль качества) и замерь эффект по метрикам: скорость, качество, доход, устойчивость.', is_active = 1, priority = 140, meta_json = '{}'
WHERE key = 'natal.house.2.ruler.saturn.sign.any' AND locale = 'ru-RU' AND topic_category = 'money';

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.2.ruler.saturn.sign.any', 'money', 'ru-RU', 'Карьерный маркер: показывает, где проще получить результат и что мешает стабильности. Практика: выбери 1 конкретный навык/процесс на 2 недели (приоритеты, дедлайны, коммуникации, контроль качества) и замерь эффект по метрикам: скорость, качество, доход, устойчивость.', 140, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.2.ruler.saturn.sign.any' AND locale = 'ru-RU' AND topic_category = 'money'
);

UPDATE knowledge_items
SET text = 'Карьерный маркер: показывает, где проще получить результат и что мешает стабильности. Практика: выбери 1 конкретный навык/процесс на 2 недели (приоритеты, дедлайны, коммуникации, контроль качества) и замерь эффект по метрикам: скорость, качество, доход, устойчивость.', is_active = 1, priority = 140, meta_json = '{}'
WHERE key = 'natal.house.2.ruler.uranus' AND locale = 'ru-RU' AND topic_category = 'money';

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.2.ruler.uranus', 'money', 'ru-RU', 'Карьерный маркер: показывает, где проще получить результат и что мешает стабильности. Практика: выбери 1 конкретный навык/процесс на 2 недели (приоритеты, дедлайны, коммуникации, контроль качества) и замерь эффект по метрикам: скорость, качество, доход, устойчивость.', 140, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.2.ruler.uranus' AND locale = 'ru-RU' AND topic_category = 'money'
);

UPDATE knowledge_items
SET text = 'Карьерный маркер: показывает, где проще получить результат и что мешает стабильности. Практика: выбери 1 конкретный навык/процесс на 2 недели (приоритеты, дедлайны, коммуникации, контроль качества) и замерь эффект по метрикам: скорость, качество, доход, устойчивость.', is_active = 1, priority = 140, meta_json = '{}'
WHERE key = 'natal.house.2.ruler.uranus.sign.any' AND locale = 'ru-RU' AND topic_category = 'money';

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.2.ruler.uranus.sign.any', 'money', 'ru-RU', 'Карьерный маркер: показывает, где проще получить результат и что мешает стабильности. Практика: выбери 1 конкретный навык/процесс на 2 недели (приоритеты, дедлайны, коммуникации, контроль качества) и замерь эффект по метрикам: скорость, качество, доход, устойчивость.', 140, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.2.ruler.uranus.sign.any' AND locale = 'ru-RU' AND topic_category = 'money'
);

UPDATE knowledge_items
SET text = 'Карьерный маркер: показывает, где проще получить результат и что мешает стабильности. Практика: выбери 1 конкретный навык/процесс на 2 недели (приоритеты, дедлайны, коммуникации, контроль качества) и замерь эффект по метрикам: скорость, качество, доход, устойчивость.', is_active = 1, priority = 140, meta_json = '{}'
WHERE key = 'natal.house.8.ruler.any' AND locale = 'ru-RU' AND topic_category = 'money';

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.8.ruler.any', 'money', 'ru-RU', 'Карьерный маркер: показывает, где проще получить результат и что мешает стабильности. Практика: выбери 1 конкретный навык/процесс на 2 недели (приоритеты, дедлайны, коммуникации, контроль качества) и замерь эффект по метрикам: скорость, качество, доход, устойчивость.', 140, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.8.ruler.any' AND locale = 'ru-RU' AND topic_category = 'money'
);

UPDATE knowledge_items
SET text = 'Карьерный маркер: показывает, где проще получить результат и что мешает стабильности. Практика: выбери 1 конкретный навык/процесс на 2 недели (приоритеты, дедлайны, коммуникации, контроль качества) и замерь эффект по метрикам: скорость, качество, доход, устойчивость.', is_active = 1, priority = 140, meta_json = '{}'
WHERE key = 'natal.house.8.ruler.sun' AND locale = 'ru-RU' AND topic_category = 'money';

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.8.ruler.sun', 'money', 'ru-RU', 'Карьерный маркер: показывает, где проще получить результат и что мешает стабильности. Практика: выбери 1 конкретный навык/процесс на 2 недели (приоритеты, дедлайны, коммуникации, контроль качества) и замерь эффект по метрикам: скорость, качество, доход, устойчивость.', 140, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.8.ruler.sun' AND locale = 'ru-RU' AND topic_category = 'money'
);

UPDATE knowledge_items
SET text = 'Карьерный маркер: показывает, где проще получить результат и что мешает стабильности. Практика: выбери 1 конкретный навык/процесс на 2 недели (приоритеты, дедлайны, коммуникации, контроль качества) и замерь эффект по метрикам: скорость, качество, доход, устойчивость.', is_active = 1, priority = 140, meta_json = '{}'
WHERE key = 'natal.house.8.ruler.sun.sign.any' AND locale = 'ru-RU' AND topic_category = 'money';

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.8.ruler.sun.sign.any', 'money', 'ru-RU', 'Карьерный маркер: показывает, где проще получить результат и что мешает стабильности. Практика: выбери 1 конкретный навык/процесс на 2 недели (приоритеты, дедлайны, коммуникации, контроль качества) и замерь эффект по метрикам: скорость, качество, доход, устойчивость.', 140, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.8.ruler.sun.sign.any' AND locale = 'ru-RU' AND topic_category = 'money'
);

UPDATE knowledge_items
SET text = 'Аспекты управителя 8-й дом (Солнце) — это каналы, через которые тема дома связана с карьерными событиями. Практика: найди 2 повторяющихся кейса и настрой процесс (договора, дедлайны, контроль качества, роли), чтобы переводить динамику аспектов в прогнозируемый результат.', is_active = 1, priority = 140, meta_json = '{}'
WHERE key = 'natal.house.8.ruler.sun.aspects.present' AND locale = 'ru-RU' AND topic_category = 'money';

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.8.ruler.sun.aspects.present', 'money', 'ru-RU', 'Аспекты управителя 8-й дом (Солнце) — это каналы, через которые тема дома связана с карьерными событиями. Практика: найди 2 повторяющихся кейса и настрой процесс (договора, дедлайны, контроль качества, роли), чтобы переводить динамику аспектов в прогнозируемый результат.', 140, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.8.ruler.sun.aspects.present' AND locale = 'ru-RU' AND topic_category = 'money'
);

UPDATE knowledge_items
SET text = 'Аспекты управителя 2-й дом (деньги/ресурсы/монетизация) (Уран) — это каналы, через которые тема дома связана с карьерными событиями. Практика: найди 2 повторяющихся кейса и настрой процесс (договора, дедлайны, контроль качества, роли), чтобы переводить динамику аспектов в прогнозируемый результат.', is_active = 1, priority = 140, meta_json = '{}'
WHERE key = 'natal.house.2.ruler.uranus.aspects.present' AND locale = 'ru-RU' AND topic_category = 'money';

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.2.ruler.uranus.aspects.present', 'money', 'ru-RU', 'Аспекты управителя 2-й дом (деньги/ресурсы/монетизация) (Уран) — это каналы, через которые тема дома связана с карьерными событиями. Практика: найди 2 повторяющихся кейса и настрой процесс (договора, дедлайны, контроль качества, роли), чтобы переводить динамику аспектов в прогнозируемый результат.', 140, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.2.ruler.uranus.aspects.present' AND locale = 'ru-RU' AND topic_category = 'money'
);

UPDATE knowledge_items
SET text = 'Аспекты управителя 2-й дом (деньги/ресурсы/монетизация) (Сатурн) — это каналы, через которые тема дома связана с карьерными событиями. Практика: найди 2 повторяющихся кейса и настрой процесс (договора, дедлайны, контроль качества, роли), чтобы переводить динамику аспектов в прогнозируемый результат.', is_active = 1, priority = 140, meta_json = '{}'
WHERE key = 'natal.house.2.ruler.saturn.aspects.present' AND locale = 'ru-RU' AND topic_category = 'money';

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.2.ruler.saturn.aspects.present', 'money', 'ru-RU', 'Аспекты управителя 2-й дом (деньги/ресурсы/монетизация) (Сатурн) — это каналы, через которые тема дома связана с карьерными событиями. Практика: найди 2 повторяющихся кейса и настрой процесс (договора, дедлайны, контроль качества, роли), чтобы переводить динамику аспектов в прогнозируемый результат.', 140, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.2.ruler.saturn.aspects.present' AND locale = 'ru-RU' AND topic_category = 'money'
);

UPDATE knowledge_items
SET text = 'Управитель 8-й дом (Солнце) в аспекте «соединение» с Уран показывает механику результата. Это создаёт сильную сцепку функций: тема становится центральной в карьере. Практика: закрепи 1 правило процесса (приоритеты, дедлайны, формат договорённостей) и 1 метрику, чтобы повторять успех и снижать риски.', is_active = 1, priority = 140, meta_json = '{}'
WHERE key = 'natal.house.8.ruler.sun.aspect.conjunction.uranus' AND locale = 'ru-RU' AND topic_category = 'money';

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.8.ruler.sun.aspect.conjunction.uranus', 'money', 'ru-RU', 'Управитель 8-й дом (Солнце) в аспекте «соединение» с Уран показывает механику результата. Это создаёт сильную сцепку функций: тема становится центральной в карьере. Практика: закрепи 1 правило процесса (приоритеты, дедлайны, формат договорённостей) и 1 метрику, чтобы повторять успех и снижать риски.', 140, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.8.ruler.sun.aspect.conjunction.uranus' AND locale = 'ru-RU' AND topic_category = 'money'
);

UPDATE knowledge_items
SET text = 'Управитель 8-й дом (Солнце) в аспекте «соединение» с Нептун показывает механику результата. Это создаёт сильную сцепку функций: тема становится центральной в карьере. Практика: закрепи 1 правило процесса (приоритеты, дедлайны, формат договорённостей) и 1 метрику, чтобы повторять успех и снижать риски.', is_active = 1, priority = 140, meta_json = '{}'
WHERE key = 'natal.house.8.ruler.sun.aspect.conjunction.neptune' AND locale = 'ru-RU' AND topic_category = 'money';

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.8.ruler.sun.aspect.conjunction.neptune', 'money', 'ru-RU', 'Управитель 8-й дом (Солнце) в аспекте «соединение» с Нептун показывает механику результата. Это создаёт сильную сцепку функций: тема становится центральной в карьере. Практика: закрепи 1 правило процесса (приоритеты, дедлайны, формат договорённостей) и 1 метрику, чтобы повторять успех и снижать риски.', 140, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.8.ruler.sun.aspect.conjunction.neptune' AND locale = 'ru-RU' AND topic_category = 'money'
);

UPDATE knowledge_items
SET text = 'Управитель 8-й дом (Солнце) в аспекте «соединение» с Сатурн показывает механику результата. Это создаёт сильную сцепку функций: тема становится центральной в карьере. Практика: закрепи 1 правило процесса (приоритеты, дедлайны, формат договорённостей) и 1 метрику, чтобы повторять успех и снижать риски.', is_active = 1, priority = 140, meta_json = '{}'
WHERE key = 'natal.house.8.ruler.sun.aspect.conjunction.saturn' AND locale = 'ru-RU' AND topic_category = 'money';

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.8.ruler.sun.aspect.conjunction.saturn', 'money', 'ru-RU', 'Управитель 8-й дом (Солнце) в аспекте «соединение» с Сатурн показывает механику результата. Это создаёт сильную сцепку функций: тема становится центральной в карьере. Практика: закрепи 1 правило процесса (приоритеты, дедлайны, формат договорённостей) и 1 метрику, чтобы повторять успех и снижать риски.', 140, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.8.ruler.sun.aspect.conjunction.saturn' AND locale = 'ru-RU' AND topic_category = 'money'
);

UPDATE knowledge_items
SET text = 'Управитель 8-й дом (Солнце) в аспекте «оппозиция» с Юпитер показывает механику результата. Это даёт напряжение и рост: нужно управлять рисками, границами и приоритетами. Практика: закрепи 1 правило процесса (приоритеты, дедлайны, формат договорённостей) и 1 метрику, чтобы повторять успех и снижать риски.', is_active = 1, priority = 140, meta_json = '{}'
WHERE key = 'natal.house.8.ruler.sun.aspect.opposition.jupiter' AND locale = 'ru-RU' AND topic_category = 'money';

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.8.ruler.sun.aspect.opposition.jupiter', 'money', 'ru-RU', 'Управитель 8-й дом (Солнце) в аспекте «оппозиция» с Юпитер показывает механику результата. Это даёт напряжение и рост: нужно управлять рисками, границами и приоритетами. Практика: закрепи 1 правило процесса (приоритеты, дедлайны, формат договорённостей) и 1 метрику, чтобы повторять успех и снижать риски.', 140, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.8.ruler.sun.aspect.opposition.jupiter' AND locale = 'ru-RU' AND topic_category = 'money'
);

UPDATE knowledge_items
SET text = 'Управитель 2-й дом (деньги/ресурсы/монетизация) (Сатурн) в аспекте «секстиль» с Плутон показывает механику результата. Это даёт ресурс и проще превращается в навык/результат. Практика: закрепи 1 правило процесса (приоритеты, дедлайны, формат договорённостей) и 1 метрику, чтобы повторять успех и снижать риски.', is_active = 1, priority = 140, meta_json = '{}'
WHERE key = 'natal.house.2.ruler.saturn.aspect.sextile.pluto' AND locale = 'ru-RU' AND topic_category = 'money';

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.2.ruler.saturn.aspect.sextile.pluto', 'money', 'ru-RU', 'Управитель 2-й дом (деньги/ресурсы/монетизация) (Сатурн) в аспекте «секстиль» с Плутон показывает механику результата. Это даёт ресурс и проще превращается в навык/результат. Практика: закрепи 1 правило процесса (приоритеты, дедлайны, формат договорённостей) и 1 метрику, чтобы повторять успех и снижать риски.', 140, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.2.ruler.saturn.aspect.sextile.pluto' AND locale = 'ru-RU' AND topic_category = 'money'
);

UPDATE knowledge_items
SET text = 'Управитель 2-й дом (деньги/ресурсы/монетизация) (Уран) в аспекте «соединение» с Солнце показывает механику результата. Это создаёт сильную сцепку функций: тема становится центральной в карьере. Практика: закрепи 1 правило процесса (приоритеты, дедлайны, формат договорённостей) и 1 метрику, чтобы повторять успех и снижать риски.', is_active = 1, priority = 140, meta_json = '{}'
WHERE key = 'natal.house.2.ruler.uranus.aspect.conjunction.sun' AND locale = 'ru-RU' AND topic_category = 'money';

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.2.ruler.uranus.aspect.conjunction.sun', 'money', 'ru-RU', 'Управитель 2-й дом (деньги/ресурсы/монетизация) (Уран) в аспекте «соединение» с Солнце показывает механику результата. Это создаёт сильную сцепку функций: тема становится центральной в карьере. Практика: закрепи 1 правило процесса (приоритеты, дедлайны, формат договорённостей) и 1 метрику, чтобы повторять успех и снижать риски.', 140, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.2.ruler.uranus.aspect.conjunction.sun' AND locale = 'ru-RU' AND topic_category = 'money'
);

UPDATE knowledge_items
SET text = 'Управитель 2-й дом (деньги/ресурсы/монетизация) (Сатурн) в аспекте «соединение» с Нептун показывает механику результата. Это создаёт сильную сцепку функций: тема становится центральной в карьере. Практика: закрепи 1 правило процесса (приоритеты, дедлайны, формат договорённостей) и 1 метрику, чтобы повторять успех и снижать риски.', is_active = 1, priority = 140, meta_json = '{}'
WHERE key = 'natal.house.2.ruler.saturn.aspect.conjunction.neptune' AND locale = 'ru-RU' AND topic_category = 'money';

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.2.ruler.saturn.aspect.conjunction.neptune', 'money', 'ru-RU', 'Управитель 2-й дом (деньги/ресурсы/монетизация) (Сатурн) в аспекте «соединение» с Нептун показывает механику результата. Это создаёт сильную сцепку функций: тема становится центральной в карьере. Практика: закрепи 1 правило процесса (приоритеты, дедлайны, формат договорённостей) и 1 метрику, чтобы повторять успех и снижать риски.', 140, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.2.ruler.saturn.aspect.conjunction.neptune' AND locale = 'ru-RU' AND topic_category = 'money'
);

UPDATE knowledge_items
SET text = 'Управитель 2-й дом (деньги/ресурсы/монетизация) (Сатурн) в аспекте «соединение» с Солнце показывает механику результата. Это создаёт сильную сцепку функций: тема становится центральной в карьере. Практика: закрепи 1 правило процесса (приоритеты, дедлайны, формат договорённостей) и 1 метрику, чтобы повторять успех и снижать риски.', is_active = 1, priority = 140, meta_json = '{}'
WHERE key = 'natal.house.2.ruler.saturn.aspect.conjunction.sun' AND locale = 'ru-RU' AND topic_category = 'money';

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.2.ruler.saturn.aspect.conjunction.sun', 'money', 'ru-RU', 'Управитель 2-й дом (деньги/ресурсы/монетизация) (Сатурн) в аспекте «соединение» с Солнце показывает механику результата. Это создаёт сильную сцепку функций: тема становится центральной в карьере. Практика: закрепи 1 правило процесса (приоритеты, дедлайны, формат договорённостей) и 1 метрику, чтобы повторять успех и снижать риски.', 140, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.2.ruler.saturn.aspect.conjunction.sun' AND locale = 'ru-RU' AND topic_category = 'money'
);

UPDATE knowledge_items
SET text = 'Управитель 2-й дом (деньги/ресурсы/монетизация) (Уран) в аспекте «оппозиция» с Юпитер показывает механику результата. Это даёт напряжение и рост: нужно управлять рисками, границами и приоритетами. Практика: закрепи 1 правило процесса (приоритеты, дедлайны, формат договорённостей) и 1 метрику, чтобы повторять успех и снижать риски.', is_active = 1, priority = 140, meta_json = '{}'
WHERE key = 'natal.house.2.ruler.uranus.aspect.opposition.jupiter' AND locale = 'ru-RU' AND topic_category = 'money';

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.2.ruler.uranus.aspect.opposition.jupiter', 'money', 'ru-RU', 'Управитель 2-й дом (деньги/ресурсы/монетизация) (Уран) в аспекте «оппозиция» с Юпитер показывает механику результата. Это даёт напряжение и рост: нужно управлять рисками, границами и приоритетами. Практика: закрепи 1 правило процесса (приоритеты, дедлайны, формат договорённостей) и 1 метрику, чтобы повторять успех и снижать риски.', 140, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.2.ruler.uranus.aspect.opposition.jupiter' AND locale = 'ru-RU' AND topic_category = 'money'
);

COMMIT;

