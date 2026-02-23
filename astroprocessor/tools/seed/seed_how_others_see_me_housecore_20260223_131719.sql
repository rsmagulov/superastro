-- AUTO-GENERATED. DO NOT EDIT BY HAND.

-- Career overrides from debug shortest used blocks (topic_category=how_others_see_me)

-- Source JSON: C:/Projects/superastro/debug_how_others_see_me_ru_160_20260223_131719_mini_housecore.json

-- Filter: len(text)<= 450, max_keys=250

BEGIN;

UPDATE knowledge_items
SET text = 'Куспид 1-й дом (самопрезентация/инициатива) в Стрелец задаёт стиль решения задач по теме дома. Практика: подстрой окружение (роль, процессы, KPI), чтобы стиль знака усиливал результат, а не создавал лишние конфликты.', is_active = 1, priority = 140, meta_json = '{}'
WHERE key = 'natal.house.1.cusp.sign.sagittarius' AND locale = 'ru-RU' AND topic_category = 'how_others_see_me';

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.1.cusp.sign.sagittarius', 'how_others_see_me', 'ru-RU', 'Куспид 1-й дом (самопрезентация/инициатива) в Стрелец задаёт стиль решения задач по теме дома. Практика: подстрой окружение (роль, процессы, KPI), чтобы стиль знака усиливал результат, а не создавал лишние конфликты.', 140, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.1.cusp.sign.sagittarius' AND locale = 'ru-RU' AND topic_category = 'how_others_see_me'
);

UPDATE knowledge_items
SET text = 'Куспид 1-й дом (самопрезентация/инициатива): знак не уточнён (any). В карьере важнее управление темой дома, чем стиль знака. Практика: выдели 1–2 навыка по теме дома и составь план на 4 недели (задачи, метрики, ритм).', is_active = 1, priority = 140, meta_json = '{}'
WHERE key = 'natal.house.1.cusp.sign.any' AND locale = 'ru-RU' AND topic_category = 'how_others_see_me';

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.1.cusp.sign.any', 'how_others_see_me', 'ru-RU', 'Куспид 1-й дом (самопрезентация/инициатива): знак не уточнён (any). В карьере важнее управление темой дома, чем стиль знака. Практика: выдели 1–2 навыка по теме дома и составь план на 4 недели (задачи, метрики, ритм).', 140, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.1.cusp.sign.any' AND locale = 'ru-RU' AND topic_category = 'how_others_see_me'
);

UPDATE knowledge_items
SET text = 'Карьерный маркер: показывает, где проще получить результат и что мешает стабильности. Практика: выбери 1 конкретный навык/процесс на 2 недели (приоритеты, дедлайны, коммуникации, контроль качества) и замерь эффект по метрикам: скорость, качество, доход, устойчивость.', is_active = 1, priority = 140, meta_json = '{}'
WHERE key = 'natal.angle.asc' AND locale = 'ru-RU' AND topic_category = 'how_others_see_me';

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.angle.asc', 'how_others_see_me', 'ru-RU', 'Карьерный маркер: показывает, где проще получить результат и что мешает стабильности. Практика: выбери 1 конкретный навык/процесс на 2 недели (приоритеты, дедлайны, коммуникации, контроль качества) и замерь эффект по метрикам: скорость, качество, доход, устойчивость.', 140, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.angle.asc' AND locale = 'ru-RU' AND topic_category = 'how_others_see_me'
);

UPDATE knowledge_items
SET text = 'Карьерный маркер: показывает, где проще получить результат и что мешает стабильности. Практика: выбери 1 конкретный навык/процесс на 2 недели (приоритеты, дедлайны, коммуникации, контроль качества) и замерь эффект по метрикам: скорость, качество, доход, устойчивость.', is_active = 1, priority = 140, meta_json = '{}'
WHERE key = 'natal.house.1.planet.mercury' AND locale = 'ru-RU' AND topic_category = 'how_others_see_me';

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.1.planet.mercury', 'how_others_see_me', 'ru-RU', 'Карьерный маркер: показывает, где проще получить результат и что мешает стабильности. Практика: выбери 1 конкретный навык/процесс на 2 недели (приоритеты, дедлайны, коммуникации, контроль качества) и замерь эффект по метрикам: скорость, качество, доход, устойчивость.', 140, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.1.planet.mercury' AND locale = 'ru-RU' AND topic_category = 'how_others_see_me'
);

UPDATE knowledge_items
SET text = 'Карьерный маркер: показывает, где проще получить результат и что мешает стабильности. Практика: выбери 1 конкретный навык/процесс на 2 недели (приоритеты, дедлайны, коммуникации, контроль качества) и замерь эффект по метрикам: скорость, качество, доход, устойчивость.', is_active = 1, priority = 140, meta_json = '{}'
WHERE key = 'natal.house.1.planet.neptune' AND locale = 'ru-RU' AND topic_category = 'how_others_see_me';

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.1.planet.neptune', 'how_others_see_me', 'ru-RU', 'Карьерный маркер: показывает, где проще получить результат и что мешает стабильности. Практика: выбери 1 конкретный навык/процесс на 2 недели (приоритеты, дедлайны, коммуникации, контроль качества) и замерь эффект по метрикам: скорость, качество, доход, устойчивость.', 140, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.1.planet.neptune' AND locale = 'ru-RU' AND topic_category = 'how_others_see_me'
);

UPDATE knowledge_items
SET text = 'Карьерный маркер: показывает, где проще получить результат и что мешает стабильности. Практика: выбери 1 конкретный навык/процесс на 2 недели (приоритеты, дедлайны, коммуникации, контроль качества) и замерь эффект по метрикам: скорость, качество, доход, устойчивость.', is_active = 1, priority = 140, meta_json = '{}'
WHERE key = 'natal.house.1.planet.saturn' AND locale = 'ru-RU' AND topic_category = 'how_others_see_me';

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.1.planet.saturn', 'how_others_see_me', 'ru-RU', 'Карьерный маркер: показывает, где проще получить результат и что мешает стабильности. Практика: выбери 1 конкретный навык/процесс на 2 недели (приоритеты, дедлайны, коммуникации, контроль качества) и замерь эффект по метрикам: скорость, качество, доход, устойчивость.', 140, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.1.planet.saturn' AND locale = 'ru-RU' AND topic_category = 'how_others_see_me'
);

UPDATE knowledge_items
SET text = 'Карьерный маркер: показывает, где проще получить результат и что мешает стабильности. Практика: выбери 1 конкретный навык/процесс на 2 недели (приоритеты, дедлайны, коммуникации, контроль качества) и замерь эффект по метрикам: скорость, качество, доход, устойчивость.', is_active = 1, priority = 140, meta_json = '{}'
WHERE key = 'natal.house.1.planet.sun' AND locale = 'ru-RU' AND topic_category = 'how_others_see_me';

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.1.planet.sun', 'how_others_see_me', 'ru-RU', 'Карьерный маркер: показывает, где проще получить результат и что мешает стабильности. Практика: выбери 1 конкретный навык/процесс на 2 недели (приоритеты, дедлайны, коммуникации, контроль качества) и замерь эффект по метрикам: скорость, качество, доход, устойчивость.', 140, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.1.planet.sun' AND locale = 'ru-RU' AND topic_category = 'how_others_see_me'
);

UPDATE knowledge_items
SET text = 'Карьерный маркер: показывает, где проще получить результат и что мешает стабильности. Практика: выбери 1 конкретный навык/процесс на 2 недели (приоритеты, дедлайны, коммуникации, контроль качества) и замерь эффект по метрикам: скорость, качество, доход, устойчивость.', is_active = 1, priority = 140, meta_json = '{}'
WHERE key = 'natal.house.1.planet.uranus' AND locale = 'ru-RU' AND topic_category = 'how_others_see_me';

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.1.planet.uranus', 'how_others_see_me', 'ru-RU', 'Карьерный маркер: показывает, где проще получить результат и что мешает стабильности. Практика: выбери 1 конкретный навык/процесс на 2 недели (приоритеты, дедлайны, коммуникации, контроль качества) и замерь эффект по метрикам: скорость, качество, доход, устойчивость.', 140, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.1.planet.uranus' AND locale = 'ru-RU' AND topic_category = 'how_others_see_me'
);

UPDATE knowledge_items
SET text = 'Карьерный маркер: показывает, где проще получить результат и что мешает стабильности. Практика: выбери 1 конкретный навык/процесс на 2 недели (приоритеты, дедлайны, коммуникации, контроль качества) и замерь эффект по метрикам: скорость, качество, доход, устойчивость.', is_active = 1, priority = 140, meta_json = '{}'
WHERE key = 'natal.house.1.ruler.any' AND locale = 'ru-RU' AND topic_category = 'how_others_see_me';

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.1.ruler.any', 'how_others_see_me', 'ru-RU', 'Карьерный маркер: показывает, где проще получить результат и что мешает стабильности. Практика: выбери 1 конкретный навык/процесс на 2 недели (приоритеты, дедлайны, коммуникации, контроль качества) и замерь эффект по метрикам: скорость, качество, доход, устойчивость.', 140, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.1.ruler.any' AND locale = 'ru-RU' AND topic_category = 'how_others_see_me'
);

UPDATE knowledge_items
SET text = 'Карьерный маркер: показывает, где проще получить результат и что мешает стабильности. Практика: выбери 1 конкретный навык/процесс на 2 недели (приоритеты, дедлайны, коммуникации, контроль качества) и замерь эффект по метрикам: скорость, качество, доход, устойчивость.', is_active = 1, priority = 140, meta_json = '{}'
WHERE key = 'natal.house.1.ruler.jupiter' AND locale = 'ru-RU' AND topic_category = 'how_others_see_me';

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.1.ruler.jupiter', 'how_others_see_me', 'ru-RU', 'Карьерный маркер: показывает, где проще получить результат и что мешает стабильности. Практика: выбери 1 конкретный навык/процесс на 2 недели (приоритеты, дедлайны, коммуникации, контроль качества) и замерь эффект по метрикам: скорость, качество, доход, устойчивость.', 140, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.1.ruler.jupiter' AND locale = 'ru-RU' AND topic_category = 'how_others_see_me'
);

UPDATE knowledge_items
SET text = 'Карьерный маркер: показывает, где проще получить результат и что мешает стабильности. Практика: выбери 1 конкретный навык/процесс на 2 недели (приоритеты, дедлайны, коммуникации, контроль качества) и замерь эффект по метрикам: скорость, качество, доход, устойчивость.', is_active = 1, priority = 140, meta_json = '{}'
WHERE key = 'natal.house.1.ruler.jupiter.sign.any' AND locale = 'ru-RU' AND topic_category = 'how_others_see_me';

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.1.ruler.jupiter.sign.any', 'how_others_see_me', 'ru-RU', 'Карьерный маркер: показывает, где проще получить результат и что мешает стабильности. Практика: выбери 1 конкретный навык/процесс на 2 недели (приоритеты, дедлайны, коммуникации, контроль качества) и замерь эффект по метрикам: скорость, качество, доход, устойчивость.', 140, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.1.ruler.jupiter.sign.any' AND locale = 'ru-RU' AND topic_category = 'how_others_see_me'
);

UPDATE knowledge_items
SET text = 'Карьерный маркер: показывает, где проще получить результат и что мешает стабильности. Практика: выбери 1 конкретный навык/процесс на 2 недели (приоритеты, дедлайны, коммуникации, контроль качества) и замерь эффект по метрикам: скорость, качество, доход, устойчивость.', is_active = 1, priority = 140, meta_json = '{}'
WHERE key = 'natal.how_others_see_me.generic' AND locale = 'ru-RU' AND topic_category = 'how_others_see_me';

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.how_others_see_me.generic', 'how_others_see_me', 'ru-RU', 'Карьерный маркер: показывает, где проще получить результат и что мешает стабильности. Практика: выбери 1 конкретный навык/процесс на 2 недели (приоритеты, дедлайны, коммуникации, контроль качества) и замерь эффект по метрикам: скорость, качество, доход, устойчивость.', 140, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.how_others_see_me.generic' AND locale = 'ru-RU' AND topic_category = 'how_others_see_me'
);

UPDATE knowledge_items
SET text = 'Аспекты управителя 1-й дом (самопрезентация/инициатива) (Юпитер) — это каналы, через которые тема дома связана с карьерными событиями. Практика: найди 2 повторяющихся кейса и настрой процесс (договора, дедлайны, контроль качества, роли), чтобы переводить динамику аспектов в прогнозируемый результат.', is_active = 1, priority = 140, meta_json = '{}'
WHERE key = 'natal.house.1.ruler.jupiter.aspects.present' AND locale = 'ru-RU' AND topic_category = 'how_others_see_me';

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.1.ruler.jupiter.aspects.present', 'how_others_see_me', 'ru-RU', 'Аспекты управителя 1-й дом (самопрезентация/инициатива) (Юпитер) — это каналы, через которые тема дома связана с карьерными событиями. Практика: найди 2 повторяющихся кейса и настрой процесс (договора, дедлайны, контроль качества, роли), чтобы переводить динамику аспектов в прогнозируемый результат.', 140, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.1.ruler.jupiter.aspects.present' AND locale = 'ru-RU' AND topic_category = 'how_others_see_me'
);

UPDATE knowledge_items
SET text = 'Управитель 1-й дом (самопрезентация/инициатива) (Юпитер) в аспекте «оппозиция» с Уран показывает механику результата. Это даёт напряжение и рост: нужно управлять рисками, границами и приоритетами. Практика: закрепи 1 правило процесса (приоритеты, дедлайны, формат договорённостей) и 1 метрику, чтобы повторять успех и снижать риски.', is_active = 1, priority = 140, meta_json = '{}'
WHERE key = 'natal.house.1.ruler.jupiter.aspect.opposition.uranus' AND locale = 'ru-RU' AND topic_category = 'how_others_see_me';

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.1.ruler.jupiter.aspect.opposition.uranus', 'how_others_see_me', 'ru-RU', 'Управитель 1-й дом (самопрезентация/инициатива) (Юпитер) в аспекте «оппозиция» с Уран показывает механику результата. Это даёт напряжение и рост: нужно управлять рисками, границами и приоритетами. Практика: закрепи 1 правило процесса (приоритеты, дедлайны, формат договорённостей) и 1 метрику, чтобы повторять успех и снижать риски.', 140, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.1.ruler.jupiter.aspect.opposition.uranus' AND locale = 'ru-RU' AND topic_category = 'how_others_see_me'
);

UPDATE knowledge_items
SET text = 'Управитель 1-й дом (самопрезентация/инициатива) (Юпитер) в аспекте «оппозиция» с Солнце показывает механику результата. Это даёт напряжение и рост: нужно управлять рисками, границами и приоритетами. Практика: закрепи 1 правило процесса (приоритеты, дедлайны, формат договорённостей) и 1 метрику, чтобы повторять успех и снижать риски.', is_active = 1, priority = 140, meta_json = '{}'
WHERE key = 'natal.house.1.ruler.jupiter.aspect.opposition.sun' AND locale = 'ru-RU' AND topic_category = 'how_others_see_me';

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.1.ruler.jupiter.aspect.opposition.sun', 'how_others_see_me', 'ru-RU', 'Управитель 1-й дом (самопрезентация/инициатива) (Юпитер) в аспекте «оппозиция» с Солнце показывает механику результата. Это даёт напряжение и рост: нужно управлять рисками, границами и приоритетами. Практика: закрепи 1 правило процесса (приоритеты, дедлайны, формат договорённостей) и 1 метрику, чтобы повторять успех и снижать риски.', 140, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.1.ruler.jupiter.aspect.opposition.sun' AND locale = 'ru-RU' AND topic_category = 'how_others_see_me'
);

COMMIT;

