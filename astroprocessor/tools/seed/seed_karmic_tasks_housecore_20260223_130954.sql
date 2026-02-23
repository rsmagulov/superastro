-- AUTO-GENERATED. DO NOT EDIT BY HAND.

-- Career overrides from debug shortest used blocks (topic_category=karmic_tasks)

-- Source JSON: C:/Projects/superastro/debug_karmic_tasks_ru_160_20260223_130954_mini_housecore.json

-- Filter: len(text)<= 450, max_keys=250

BEGIN;

UPDATE knowledge_items
SET text = 'Куспид 8-й дом в Лев задаёт стиль решения задач по теме дома. Практика: подстрой окружение (роль, процессы, KPI), чтобы стиль знака усиливал результат, а не создавал лишние конфликты.', is_active = 1, priority = 140, meta_json = '{}'
WHERE key = 'natal.house.8.cusp.sign.leo' AND locale = 'ru-RU' AND topic_category = 'karmic_tasks';

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.8.cusp.sign.leo', 'karmic_tasks', 'ru-RU', 'Куспид 8-й дом в Лев задаёт стиль решения задач по теме дома. Практика: подстрой окружение (роль, процессы, KPI), чтобы стиль знака усиливал результат, а не создавал лишние конфликты.', 140, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.8.cusp.sign.leo' AND locale = 'ru-RU' AND topic_category = 'karmic_tasks'
);

UPDATE knowledge_items
SET text = 'Куспид 8-й дом: знак не уточнён (any). В карьере важнее управление темой дома, чем стиль знака. Практика: выдели 1–2 навыка по теме дома и составь план на 4 недели (задачи, метрики, ритм).', is_active = 1, priority = 140, meta_json = '{}'
WHERE key = 'natal.house.8.cusp.sign.any' AND locale = 'ru-RU' AND topic_category = 'karmic_tasks';

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.8.cusp.sign.any', 'karmic_tasks', 'ru-RU', 'Куспид 8-й дом: знак не уточнён (any). В карьере важнее управление темой дома, чем стиль знака. Практика: выдели 1–2 навыка по теме дома и составь план на 4 недели (задачи, метрики, ритм).', 140, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.8.cusp.sign.any' AND locale = 'ru-RU' AND topic_category = 'karmic_tasks'
);

UPDATE knowledge_items
SET text = 'Куспид 12-й дом (закулисье/служение/психогигиена): знак не уточнён (any). В карьере важнее управление темой дома, чем стиль знака. Практика: выдели 1–2 навыка по теме дома и составь план на 4 недели (задачи, метрики, ритм).', is_active = 1, priority = 140, meta_json = '{}'
WHERE key = 'natal.house.12.cusp.sign.any' AND locale = 'ru-RU' AND topic_category = 'karmic_tasks';

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.12.cusp.sign.any', 'karmic_tasks', 'ru-RU', 'Куспид 12-й дом (закулисье/служение/психогигиена): знак не уточнён (any). В карьере важнее управление темой дома, чем стиль знака. Практика: выдели 1–2 навыка по теме дома и составь план на 4 недели (задачи, метрики, ритм).', 140, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.12.cusp.sign.any' AND locale = 'ru-RU' AND topic_category = 'karmic_tasks'
);

UPDATE knowledge_items
SET text = 'Куспид 12-й дом (закулисье/служение/психогигиена) в Стрелец задаёт стиль решения задач по теме дома. Практика: подстрой окружение (роль, процессы, KPI), чтобы стиль знака усиливал результат, а не создавал лишние конфликты.', is_active = 1, priority = 140, meta_json = '{}'
WHERE key = 'natal.house.12.cusp.sign.sagittarius' AND locale = 'ru-RU' AND topic_category = 'karmic_tasks';

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.12.cusp.sign.sagittarius', 'karmic_tasks', 'ru-RU', 'Куспид 12-й дом (закулисье/служение/психогигиена) в Стрелец задаёт стиль решения задач по теме дома. Практика: подстрой окружение (роль, процессы, KPI), чтобы стиль знака усиливал результат, а не создавал лишние конфликты.', 140, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.12.cusp.sign.sagittarius' AND locale = 'ru-RU' AND topic_category = 'karmic_tasks'
);

UPDATE knowledge_items
SET text = 'Аспекты управителя 8-й дом (Солнце) — это каналы, через которые тема дома связана с карьерными событиями. Практика: найди 2 повторяющихся кейса и настрой процесс (договора, дедлайны, контроль качества, роли), чтобы переводить динамику аспектов в прогнозируемый результат.', is_active = 1, priority = 140, meta_json = '{}'
WHERE key = 'natal.house.8.ruler.sun.aspects.present' AND locale = 'ru-RU' AND topic_category = 'karmic_tasks';

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.8.ruler.sun.aspects.present', 'karmic_tasks', 'ru-RU', 'Аспекты управителя 8-й дом (Солнце) — это каналы, через которые тема дома связана с карьерными событиями. Практика: найди 2 повторяющихся кейса и настрой процесс (договора, дедлайны, контроль качества, роли), чтобы переводить динамику аспектов в прогнозируемый результат.', 140, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.8.ruler.sun.aspects.present' AND locale = 'ru-RU' AND topic_category = 'karmic_tasks'
);

UPDATE knowledge_items
SET text = 'Аспекты управителя 12-й дом (закулисье/служение/психогигиена) (Юпитер) — это каналы, через которые тема дома связана с карьерными событиями. Практика: найди 2 повторяющихся кейса и настрой процесс (договора, дедлайны, контроль качества, роли), чтобы переводить динамику аспектов в прогнозируемый результат.', is_active = 1, priority = 140, meta_json = '{}'
WHERE key = 'natal.house.12.ruler.jupiter.aspects.present' AND locale = 'ru-RU' AND topic_category = 'karmic_tasks';

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.12.ruler.jupiter.aspects.present', 'karmic_tasks', 'ru-RU', 'Аспекты управителя 12-й дом (закулисье/служение/психогигиена) (Юпитер) — это каналы, через которые тема дома связана с карьерными событиями. Практика: найди 2 повторяющихся кейса и настрой процесс (договора, дедлайны, контроль качества, роли), чтобы переводить динамику аспектов в прогнозируемый результат.', 140, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.12.ruler.jupiter.aspects.present' AND locale = 'ru-RU' AND topic_category = 'karmic_tasks'
);

UPDATE knowledge_items
SET text = 'Карьерный маркер: показывает, где проще получить результат и что мешает стабильности. Практика: выбери 1 конкретный навык/процесс на 2 недели (приоритеты, дедлайны, коммуникации, контроль качества) и замерь эффект по метрикам: скорость, качество, доход, устойчивость.', is_active = 1, priority = 140, meta_json = '{}'
WHERE key = 'natal.house.8.ruler.any' AND locale = 'ru-RU' AND topic_category = 'karmic_tasks';

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.8.ruler.any', 'karmic_tasks', 'ru-RU', 'Карьерный маркер: показывает, где проще получить результат и что мешает стабильности. Практика: выбери 1 конкретный навык/процесс на 2 недели (приоритеты, дедлайны, коммуникации, контроль качества) и замерь эффект по метрикам: скорость, качество, доход, устойчивость.', 140, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.8.ruler.any' AND locale = 'ru-RU' AND topic_category = 'karmic_tasks'
);

UPDATE knowledge_items
SET text = 'Карьерный маркер: показывает, где проще получить результат и что мешает стабильности. Практика: выбери 1 конкретный навык/процесс на 2 недели (приоритеты, дедлайны, коммуникации, контроль качества) и замерь эффект по метрикам: скорость, качество, доход, устойчивость.', is_active = 1, priority = 140, meta_json = '{}'
WHERE key = 'natal.house.12.ruler.any' AND locale = 'ru-RU' AND topic_category = 'karmic_tasks';

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.12.ruler.any', 'karmic_tasks', 'ru-RU', 'Карьерный маркер: показывает, где проще получить результат и что мешает стабильности. Практика: выбери 1 конкретный навык/процесс на 2 недели (приоритеты, дедлайны, коммуникации, контроль качества) и замерь эффект по метрикам: скорость, качество, доход, устойчивость.', 140, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.12.ruler.any' AND locale = 'ru-RU' AND topic_category = 'karmic_tasks'
);

UPDATE knowledge_items
SET text = 'Карьерный маркер: показывает, где проще получить результат и что мешает стабильности. Практика: выбери 1 конкретный навык/процесс на 2 недели (приоритеты, дедлайны, коммуникации, контроль качества) и замерь эффект по метрикам: скорость, качество, доход, устойчивость.', is_active = 1, priority = 140, meta_json = '{}'
WHERE key = 'natal.house.8.ruler.sun.sign.any' AND locale = 'ru-RU' AND topic_category = 'karmic_tasks';

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.8.ruler.sun.sign.any', 'karmic_tasks', 'ru-RU', 'Карьерный маркер: показывает, где проще получить результат и что мешает стабильности. Практика: выбери 1 конкретный навык/процесс на 2 недели (приоритеты, дедлайны, коммуникации, контроль качества) и замерь эффект по метрикам: скорость, качество, доход, устойчивость.', 140, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.8.ruler.sun.sign.any' AND locale = 'ru-RU' AND topic_category = 'karmic_tasks'
);

UPDATE knowledge_items
SET text = 'Карьерный маркер: показывает, где проще получить результат и что мешает стабильности. Практика: выбери 1 конкретный навык/процесс на 2 недели (приоритеты, дедлайны, коммуникации, контроль качества) и замерь эффект по метрикам: скорость, качество, доход, устойчивость.', is_active = 1, priority = 140, meta_json = '{}'
WHERE key = 'natal.house.12.ruler.jupiter.sign.any' AND locale = 'ru-RU' AND topic_category = 'karmic_tasks';

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.12.ruler.jupiter.sign.any', 'karmic_tasks', 'ru-RU', 'Карьерный маркер: показывает, где проще получить результат и что мешает стабильности. Практика: выбери 1 конкретный навык/процесс на 2 недели (приоритеты, дедлайны, коммуникации, контроль качества) и замерь эффект по метрикам: скорость, качество, доход, устойчивость.', 140, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.12.ruler.jupiter.sign.any' AND locale = 'ru-RU' AND topic_category = 'karmic_tasks'
);

UPDATE knowledge_items
SET text = 'Управитель 8-й дом (Солнце) в аспекте «соединение» с Уран показывает механику результата. Это создаёт сильную сцепку функций: тема становится центральной в карьере. Практика: закрепи 1 правило процесса (приоритеты, дедлайны, формат договорённостей) и 1 метрику, чтобы повторять успех и снижать риски.', is_active = 1, priority = 140, meta_json = '{}'
WHERE key = 'natal.house.8.ruler.sun.aspect.conjunction.uranus' AND locale = 'ru-RU' AND topic_category = 'karmic_tasks';

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.8.ruler.sun.aspect.conjunction.uranus', 'karmic_tasks', 'ru-RU', 'Управитель 8-й дом (Солнце) в аспекте «соединение» с Уран показывает механику результата. Это создаёт сильную сцепку функций: тема становится центральной в карьере. Практика: закрепи 1 правило процесса (приоритеты, дедлайны, формат договорённостей) и 1 метрику, чтобы повторять успех и снижать риски.', 140, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.8.ruler.sun.aspect.conjunction.uranus' AND locale = 'ru-RU' AND topic_category = 'karmic_tasks'
);

UPDATE knowledge_items
SET text = 'Управитель 12-й дом (закулисье/служение/психогигиена) (Юпитер) в аспекте «оппозиция» с Уран показывает механику результата. Это даёт напряжение и рост: нужно управлять рисками, границами и приоритетами. Практика: закрепи 1 правило процесса (приоритеты, дедлайны, формат договорённостей) и 1 метрику, чтобы повторять успех и снижать риски.', is_active = 1, priority = 140, meta_json = '{}'
WHERE key = 'natal.house.12.ruler.jupiter.aspect.opposition.uranus' AND locale = 'ru-RU' AND topic_category = 'karmic_tasks';

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.12.ruler.jupiter.aspect.opposition.uranus', 'karmic_tasks', 'ru-RU', 'Управитель 12-й дом (закулисье/служение/психогигиена) (Юпитер) в аспекте «оппозиция» с Уран показывает механику результата. Это даёт напряжение и рост: нужно управлять рисками, границами и приоритетами. Практика: закрепи 1 правило процесса (приоритеты, дедлайны, формат договорённостей) и 1 метрику, чтобы повторять успех и снижать риски.', 140, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.12.ruler.jupiter.aspect.opposition.uranus' AND locale = 'ru-RU' AND topic_category = 'karmic_tasks'
);

UPDATE knowledge_items
SET text = 'Управитель 8-й дом (Солнце) в аспекте «оппозиция» с Юпитер показывает механику результата. Это даёт напряжение и рост: нужно управлять рисками, границами и приоритетами. Практика: закрепи 1 правило процесса (приоритеты, дедлайны, формат договорённостей) и 1 метрику, чтобы повторять успех и снижать риски.', is_active = 1, priority = 140, meta_json = '{}'
WHERE key = 'natal.house.8.ruler.sun.aspect.opposition.jupiter' AND locale = 'ru-RU' AND topic_category = 'karmic_tasks';

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.8.ruler.sun.aspect.opposition.jupiter', 'karmic_tasks', 'ru-RU', 'Управитель 8-й дом (Солнце) в аспекте «оппозиция» с Юпитер показывает механику результата. Это даёт напряжение и рост: нужно управлять рисками, границами и приоритетами. Практика: закрепи 1 правило процесса (приоритеты, дедлайны, формат договорённостей) и 1 метрику, чтобы повторять успех и снижать риски.', 140, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.8.ruler.sun.aspect.opposition.jupiter' AND locale = 'ru-RU' AND topic_category = 'karmic_tasks'
);

UPDATE knowledge_items
SET text = 'Управитель 8-й дом (Солнце) в аспекте «соединение» с Нептун показывает механику результата. Это создаёт сильную сцепку функций: тема становится центральной в карьере. Практика: закрепи 1 правило процесса (приоритеты, дедлайны, формат договорённостей) и 1 метрику, чтобы повторять успех и снижать риски.', is_active = 1, priority = 140, meta_json = '{}'
WHERE key = 'natal.house.8.ruler.sun.aspect.conjunction.neptune' AND locale = 'ru-RU' AND topic_category = 'karmic_tasks';

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.8.ruler.sun.aspect.conjunction.neptune', 'karmic_tasks', 'ru-RU', 'Управитель 8-й дом (Солнце) в аспекте «соединение» с Нептун показывает механику результата. Это создаёт сильную сцепку функций: тема становится центральной в карьере. Практика: закрепи 1 правило процесса (приоритеты, дедлайны, формат договорённостей) и 1 метрику, чтобы повторять успех и снижать риски.', 140, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.8.ruler.sun.aspect.conjunction.neptune' AND locale = 'ru-RU' AND topic_category = 'karmic_tasks'
);

UPDATE knowledge_items
SET text = 'Управитель 8-й дом (Солнце) в аспекте «соединение» с Сатурн показывает механику результата. Это создаёт сильную сцепку функций: тема становится центральной в карьере. Практика: закрепи 1 правило процесса (приоритеты, дедлайны, формат договорённостей) и 1 метрику, чтобы повторять успех и снижать риски.', is_active = 1, priority = 140, meta_json = '{}'
WHERE key = 'natal.house.8.ruler.sun.aspect.conjunction.saturn' AND locale = 'ru-RU' AND topic_category = 'karmic_tasks';

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.8.ruler.sun.aspect.conjunction.saturn', 'karmic_tasks', 'ru-RU', 'Управитель 8-й дом (Солнце) в аспекте «соединение» с Сатурн показывает механику результата. Это создаёт сильную сцепку функций: тема становится центральной в карьере. Практика: закрепи 1 правило процесса (приоритеты, дедлайны, формат договорённостей) и 1 метрику, чтобы повторять успех и снижать риски.', 140, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.8.ruler.sun.aspect.conjunction.saturn' AND locale = 'ru-RU' AND topic_category = 'karmic_tasks'
);

UPDATE knowledge_items
SET text = 'Управитель 12-й дом (закулисье/служение/психогигиена) (Юпитер) в аспекте «оппозиция» с Солнце показывает механику результата. Это даёт напряжение и рост: нужно управлять рисками, границами и приоритетами. Практика: закрепи 1 правило процесса (приоритеты, дедлайны, формат договорённостей) и 1 метрику, чтобы повторять успех и снижать риски.', is_active = 1, priority = 140, meta_json = '{}'
WHERE key = 'natal.house.12.ruler.jupiter.aspect.opposition.sun' AND locale = 'ru-RU' AND topic_category = 'karmic_tasks';

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.12.ruler.jupiter.aspect.opposition.sun', 'karmic_tasks', 'ru-RU', 'Управитель 12-й дом (закулисье/служение/психогигиена) (Юпитер) в аспекте «оппозиция» с Солнце показывает механику результата. Это даёт напряжение и рост: нужно управлять рисками, границами и приоритетами. Практика: закрепи 1 правило процесса (приоритеты, дедлайны, формат договорённостей) и 1 метрику, чтобы повторять успех и снижать риски.', 140, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.12.ruler.jupiter.aspect.opposition.sun' AND locale = 'ru-RU' AND topic_category = 'karmic_tasks'
);

UPDATE knowledge_items
SET text = 'Карьерный маркер: показывает, где проще получить результат и что мешает стабильности. Практика: выбери 1 конкретный навык/процесс на 2 недели (приоритеты, дедлайны, коммуникации, контроль качества) и замерь эффект по метрикам: скорость, качество, доход, устойчивость.', is_active = 1, priority = 140, meta_json = '{}'
WHERE key = 'natal.house.8.ruler.sun' AND locale = 'ru-RU' AND topic_category = 'karmic_tasks';

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.8.ruler.sun', 'karmic_tasks', 'ru-RU', 'Карьерный маркер: показывает, где проще получить результат и что мешает стабильности. Практика: выбери 1 конкретный навык/процесс на 2 недели (приоритеты, дедлайны, коммуникации, контроль качества) и замерь эффект по метрикам: скорость, качество, доход, устойчивость.', 140, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.8.ruler.sun' AND locale = 'ru-RU' AND topic_category = 'karmic_tasks'
);

UPDATE knowledge_items
SET text = 'Карьерный маркер: показывает, где проще получить результат и что мешает стабильности. Практика: выбери 1 конкретный навык/процесс на 2 недели (приоритеты, дедлайны, коммуникации, контроль качества) и замерь эффект по метрикам: скорость, качество, доход, устойчивость.', is_active = 1, priority = 140, meta_json = '{}'
WHERE key = 'natal.house.12.ruler.jupiter' AND locale = 'ru-RU' AND topic_category = 'karmic_tasks';

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.12.ruler.jupiter', 'karmic_tasks', 'ru-RU', 'Карьерный маркер: показывает, где проще получить результат и что мешает стабильности. Практика: выбери 1 конкретный навык/процесс на 2 недели (приоритеты, дедлайны, коммуникации, контроль качества) и замерь эффект по метрикам: скорость, качество, доход, устойчивость.', 140, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.12.ruler.jupiter' AND locale = 'ru-RU' AND topic_category = 'karmic_tasks'
);

UPDATE knowledge_items
SET text = 'Карьерный маркер: показывает, где проще получить результат и что мешает стабильности. Практика: выбери 1 конкретный навык/процесс на 2 недели (приоритеты, дедлайны, коммуникации, контроль качества) и замерь эффект по метрикам: скорость, качество, доход, устойчивость.', is_active = 1, priority = 140, meta_json = '{}'
WHERE key = 'natal.house.12.planet.mars' AND locale = 'ru-RU' AND topic_category = 'karmic_tasks';

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.12.planet.mars', 'karmic_tasks', 'ru-RU', 'Карьерный маркер: показывает, где проще получить результат и что мешает стабильности. Практика: выбери 1 конкретный навык/процесс на 2 недели (приоритеты, дедлайны, коммуникации, контроль качества) и замерь эффект по метрикам: скорость, качество, доход, устойчивость.', 140, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.12.planet.mars' AND locale = 'ru-RU' AND topic_category = 'karmic_tasks'
);

COMMIT;

