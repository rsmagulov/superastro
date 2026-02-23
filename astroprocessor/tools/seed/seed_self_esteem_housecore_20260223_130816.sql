-- AUTO-GENERATED. DO NOT EDIT BY HAND.

-- Career overrides from debug shortest used blocks (topic_category=self_esteem)

-- Source JSON: C:/Projects/superastro/debug_self_esteem_ru_160_20260223_130816_mini_housecore.json

-- Filter: len(text)<= 450, max_keys=250

BEGIN;

UPDATE knowledge_items
SET text = 'Куспид 1-й дом (самопрезентация/инициатива): знак не уточнён (any). В карьере важнее управление темой дома, чем стиль знака. Практика: выдели 1–2 навыка по теме дома и составь план на 4 недели (задачи, метрики, ритм).', is_active = 1, priority = 140, meta_json = '{}'
WHERE key = 'natal.house.1.cusp.sign.any' AND locale = 'ru-RU' AND topic_category = 'self_esteem';

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.1.cusp.sign.any', 'self_esteem', 'ru-RU', 'Куспид 1-й дом (самопрезентация/инициатива): знак не уточнён (any). В карьере важнее управление темой дома, чем стиль знака. Практика: выдели 1–2 навыка по теме дома и составь план на 4 недели (задачи, метрики, ритм).', 140, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.1.cusp.sign.any' AND locale = 'ru-RU' AND topic_category = 'self_esteem'
);

UPDATE knowledge_items
SET text = 'Куспид 2-й дом (деньги/ресурсы/монетизация): знак не уточнён (any). В карьере важнее управление темой дома, чем стиль знака. Практика: выдели 1–2 навыка по теме дома и составь план на 4 недели (задачи, метрики, ритм).', is_active = 1, priority = 140, meta_json = '{}'
WHERE key = 'natal.house.2.cusp.sign.any' AND locale = 'ru-RU' AND topic_category = 'self_esteem';

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.2.cusp.sign.any', 'self_esteem', 'ru-RU', 'Куспид 2-й дом (деньги/ресурсы/монетизация): знак не уточнён (any). В карьере важнее управление темой дома, чем стиль знака. Практика: выдели 1–2 навыка по теме дома и составь план на 4 недели (задачи, метрики, ритм).', 140, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.2.cusp.sign.any' AND locale = 'ru-RU' AND topic_category = 'self_esteem'
);

UPDATE knowledge_items
SET text = 'Куспид 1-й дом (самопрезентация/инициатива) в Стрелец задаёт стиль решения задач по теме дома. Практика: подстрой окружение (роль, процессы, KPI), чтобы стиль знака усиливал результат, а не создавал лишние конфликты.', is_active = 1, priority = 140, meta_json = '{}'
WHERE key = 'natal.house.1.cusp.sign.sagittarius' AND locale = 'ru-RU' AND topic_category = 'self_esteem';

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.1.cusp.sign.sagittarius', 'self_esteem', 'ru-RU', 'Куспид 1-й дом (самопрезентация/инициатива) в Стрелец задаёт стиль решения задач по теме дома. Практика: подстрой окружение (роль, процессы, KPI), чтобы стиль знака усиливал результат, а не создавал лишние конфликты.', 140, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.1.cusp.sign.sagittarius' AND locale = 'ru-RU' AND topic_category = 'self_esteem'
);

UPDATE knowledge_items
SET text = 'Куспид 2-й дом (деньги/ресурсы/монетизация) в Водолей задаёт стиль решения задач по теме дома. Практика: подстрой окружение (роль, процессы, KPI), чтобы стиль знака усиливал результат, а не создавал лишние конфликты.', is_active = 1, priority = 140, meta_json = '{}'
WHERE key = 'natal.house.2.cusp.sign.aquarius' AND locale = 'ru-RU' AND topic_category = 'self_esteem';

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.2.cusp.sign.aquarius', 'self_esteem', 'ru-RU', 'Куспид 2-й дом (деньги/ресурсы/монетизация) в Водолей задаёт стиль решения задач по теме дома. Практика: подстрой окружение (роль, процессы, KPI), чтобы стиль знака усиливал результат, а не создавал лишние конфликты.', 140, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.2.cusp.sign.aquarius' AND locale = 'ru-RU' AND topic_category = 'self_esteem'
);

UPDATE knowledge_items
SET text = 'Аспекты управителя 2-й дом (деньги/ресурсы/монетизация) (Уран) — это каналы, через которые тема дома связана с карьерными событиями. Практика: найди 2 повторяющихся кейса и настрой процесс (договора, дедлайны, контроль качества, роли), чтобы переводить динамику аспектов в прогнозируемый результат.', is_active = 1, priority = 140, meta_json = '{}'
WHERE key = 'natal.house.2.ruler.uranus.aspects.present' AND locale = 'ru-RU' AND topic_category = 'self_esteem';

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.2.ruler.uranus.aspects.present', 'self_esteem', 'ru-RU', 'Аспекты управителя 2-й дом (деньги/ресурсы/монетизация) (Уран) — это каналы, через которые тема дома связана с карьерными событиями. Практика: найди 2 повторяющихся кейса и настрой процесс (договора, дедлайны, контроль качества, роли), чтобы переводить динамику аспектов в прогнозируемый результат.', 140, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.2.ruler.uranus.aspects.present' AND locale = 'ru-RU' AND topic_category = 'self_esteem'
);

UPDATE knowledge_items
SET text = 'Аспекты управителя 1-й дом (самопрезентация/инициатива) (Юпитер) — это каналы, через которые тема дома связана с карьерными событиями. Практика: найди 2 повторяющихся кейса и настрой процесс (договора, дедлайны, контроль качества, роли), чтобы переводить динамику аспектов в прогнозируемый результат.', is_active = 1, priority = 140, meta_json = '{}'
WHERE key = 'natal.house.1.ruler.jupiter.aspects.present' AND locale = 'ru-RU' AND topic_category = 'self_esteem';

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.1.ruler.jupiter.aspects.present', 'self_esteem', 'ru-RU', 'Аспекты управителя 1-й дом (самопрезентация/инициатива) (Юпитер) — это каналы, через которые тема дома связана с карьерными событиями. Практика: найди 2 повторяющихся кейса и настрой процесс (договора, дедлайны, контроль качества, роли), чтобы переводить динамику аспектов в прогнозируемый результат.', 140, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.1.ruler.jupiter.aspects.present' AND locale = 'ru-RU' AND topic_category = 'self_esteem'
);

UPDATE knowledge_items
SET text = 'Аспекты управителя 2-й дом (деньги/ресурсы/монетизация) (Сатурн) — это каналы, через которые тема дома связана с карьерными событиями. Практика: найди 2 повторяющихся кейса и настрой процесс (договора, дедлайны, контроль качества, роли), чтобы переводить динамику аспектов в прогнозируемый результат.', is_active = 1, priority = 140, meta_json = '{}'
WHERE key = 'natal.house.2.ruler.saturn.aspects.present' AND locale = 'ru-RU' AND topic_category = 'self_esteem';

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.2.ruler.saturn.aspects.present', 'self_esteem', 'ru-RU', 'Аспекты управителя 2-й дом (деньги/ресурсы/монетизация) (Сатурн) — это каналы, через которые тема дома связана с карьерными событиями. Практика: найди 2 повторяющихся кейса и настрой процесс (договора, дедлайны, контроль качества, роли), чтобы переводить динамику аспектов в прогнозируемый результат.', 140, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.2.ruler.saturn.aspects.present' AND locale = 'ru-RU' AND topic_category = 'self_esteem'
);

UPDATE knowledge_items
SET text = 'Карьерный маркер: показывает, где проще получить результат и что мешает стабильности. Практика: выбери 1 конкретный навык/процесс на 2 недели (приоритеты, дедлайны, коммуникации, контроль качества) и замерь эффект по метрикам: скорость, качество, доход, устойчивость.', is_active = 1, priority = 140, meta_json = '{}'
WHERE key = 'natal.house.1.ruler.any' AND locale = 'ru-RU' AND topic_category = 'self_esteem';

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.1.ruler.any', 'self_esteem', 'ru-RU', 'Карьерный маркер: показывает, где проще получить результат и что мешает стабильности. Практика: выбери 1 конкретный навык/процесс на 2 недели (приоритеты, дедлайны, коммуникации, контроль качества) и замерь эффект по метрикам: скорость, качество, доход, устойчивость.', 140, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.1.ruler.any' AND locale = 'ru-RU' AND topic_category = 'self_esteem'
);

UPDATE knowledge_items
SET text = 'Карьерный маркер: показывает, где проще получить результат и что мешает стабильности. Практика: выбери 1 конкретный навык/процесс на 2 недели (приоритеты, дедлайны, коммуникации, контроль качества) и замерь эффект по метрикам: скорость, качество, доход, устойчивость.', is_active = 1, priority = 140, meta_json = '{}'
WHERE key = 'natal.house.2.ruler.any' AND locale = 'ru-RU' AND topic_category = 'self_esteem';

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.2.ruler.any', 'self_esteem', 'ru-RU', 'Карьерный маркер: показывает, где проще получить результат и что мешает стабильности. Практика: выбери 1 конкретный навык/процесс на 2 недели (приоритеты, дедлайны, коммуникации, контроль качества) и замерь эффект по метрикам: скорость, качество, доход, устойчивость.', 140, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.2.ruler.any' AND locale = 'ru-RU' AND topic_category = 'self_esteem'
);

UPDATE knowledge_items
SET text = 'Карьерный маркер: показывает, где проще получить результат и что мешает стабильности. Практика: выбери 1 конкретный навык/процесс на 2 недели (приоритеты, дедлайны, коммуникации, контроль качества) и замерь эффект по метрикам: скорость, качество, доход, устойчивость.', is_active = 1, priority = 140, meta_json = '{}'
WHERE key = 'natal.house.2.ruler.uranus.sign.any' AND locale = 'ru-RU' AND topic_category = 'self_esteem';

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.2.ruler.uranus.sign.any', 'self_esteem', 'ru-RU', 'Карьерный маркер: показывает, где проще получить результат и что мешает стабильности. Практика: выбери 1 конкретный навык/процесс на 2 недели (приоритеты, дедлайны, коммуникации, контроль качества) и замерь эффект по метрикам: скорость, качество, доход, устойчивость.', 140, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.2.ruler.uranus.sign.any' AND locale = 'ru-RU' AND topic_category = 'self_esteem'
);

UPDATE knowledge_items
SET text = 'Карьерный маркер: показывает, где проще получить результат и что мешает стабильности. Практика: выбери 1 конкретный навык/процесс на 2 недели (приоритеты, дедлайны, коммуникации, контроль качества) и замерь эффект по метрикам: скорость, качество, доход, устойчивость.', is_active = 1, priority = 140, meta_json = '{}'
WHERE key = 'natal.house.1.ruler.jupiter.sign.any' AND locale = 'ru-RU' AND topic_category = 'self_esteem';

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.1.ruler.jupiter.sign.any', 'self_esteem', 'ru-RU', 'Карьерный маркер: показывает, где проще получить результат и что мешает стабильности. Практика: выбери 1 конкретный навык/процесс на 2 недели (приоритеты, дедлайны, коммуникации, контроль качества) и замерь эффект по метрикам: скорость, качество, доход, устойчивость.', 140, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.1.ruler.jupiter.sign.any' AND locale = 'ru-RU' AND topic_category = 'self_esteem'
);

UPDATE knowledge_items
SET text = 'Карьерный маркер: показывает, где проще получить результат и что мешает стабильности. Практика: выбери 1 конкретный навык/процесс на 2 недели (приоритеты, дедлайны, коммуникации, контроль качества) и замерь эффект по метрикам: скорость, качество, доход, устойчивость.', is_active = 1, priority = 140, meta_json = '{}'
WHERE key = 'natal.house.2.ruler.saturn.sign.any' AND locale = 'ru-RU' AND topic_category = 'self_esteem';

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.2.ruler.saturn.sign.any', 'self_esteem', 'ru-RU', 'Карьерный маркер: показывает, где проще получить результат и что мешает стабильности. Практика: выбери 1 конкретный навык/процесс на 2 недели (приоритеты, дедлайны, коммуникации, контроль качества) и замерь эффект по метрикам: скорость, качество, доход, устойчивость.', 140, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.2.ruler.saturn.sign.any' AND locale = 'ru-RU' AND topic_category = 'self_esteem'
);

UPDATE knowledge_items
SET text = 'Управитель 1-й дом (самопрезентация/инициатива) (Юпитер) в аспекте «оппозиция» с Уран показывает механику результата. Это даёт напряжение и рост: нужно управлять рисками, границами и приоритетами. Практика: закрепи 1 правило процесса (приоритеты, дедлайны, формат договорённостей) и 1 метрику, чтобы повторять успех и снижать риски.', is_active = 1, priority = 140, meta_json = '{}'
WHERE key = 'natal.house.1.ruler.jupiter.aspect.opposition.uranus' AND locale = 'ru-RU' AND topic_category = 'self_esteem';

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.1.ruler.jupiter.aspect.opposition.uranus', 'self_esteem', 'ru-RU', 'Управитель 1-й дом (самопрезентация/инициатива) (Юпитер) в аспекте «оппозиция» с Уран показывает механику результата. Это даёт напряжение и рост: нужно управлять рисками, границами и приоритетами. Практика: закрепи 1 правило процесса (приоритеты, дедлайны, формат договорённостей) и 1 метрику, чтобы повторять успех и снижать риски.', 140, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.1.ruler.jupiter.aspect.opposition.uranus' AND locale = 'ru-RU' AND topic_category = 'self_esteem'
);

UPDATE knowledge_items
SET text = 'Управитель 2-й дом (деньги/ресурсы/монетизация) (Уран) в аспекте «оппозиция» с Юпитер показывает механику результата. Это даёт напряжение и рост: нужно управлять рисками, границами и приоритетами. Практика: закрепи 1 правило процесса (приоритеты, дедлайны, формат договорённостей) и 1 метрику, чтобы повторять успех и снижать риски.', is_active = 1, priority = 140, meta_json = '{}'
WHERE key = 'natal.house.2.ruler.uranus.aspect.opposition.jupiter' AND locale = 'ru-RU' AND topic_category = 'self_esteem';

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.2.ruler.uranus.aspect.opposition.jupiter', 'self_esteem', 'ru-RU', 'Управитель 2-й дом (деньги/ресурсы/монетизация) (Уран) в аспекте «оппозиция» с Юпитер показывает механику результата. Это даёт напряжение и рост: нужно управлять рисками, границами и приоритетами. Практика: закрепи 1 правило процесса (приоритеты, дедлайны, формат договорённостей) и 1 метрику, чтобы повторять успех и снижать риски.', 140, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.2.ruler.uranus.aspect.opposition.jupiter' AND locale = 'ru-RU' AND topic_category = 'self_esteem'
);

UPDATE knowledge_items
SET text = 'Управитель 2-й дом (деньги/ресурсы/монетизация) (Сатурн) в аспекте «секстиль» с Плутон показывает механику результата. Это даёт ресурс и проще превращается в навык/результат. Практика: закрепи 1 правило процесса (приоритеты, дедлайны, формат договорённостей) и 1 метрику, чтобы повторять успех и снижать риски.', is_active = 1, priority = 140, meta_json = '{}'
WHERE key = 'natal.house.2.ruler.saturn.aspect.sextile.pluto' AND locale = 'ru-RU' AND topic_category = 'self_esteem';

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.2.ruler.saturn.aspect.sextile.pluto', 'self_esteem', 'ru-RU', 'Управитель 2-й дом (деньги/ресурсы/монетизация) (Сатурн) в аспекте «секстиль» с Плутон показывает механику результата. Это даёт ресурс и проще превращается в навык/результат. Практика: закрепи 1 правило процесса (приоритеты, дедлайны, формат договорённостей) и 1 метрику, чтобы повторять успех и снижать риски.', 140, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.2.ruler.saturn.aspect.sextile.pluto' AND locale = 'ru-RU' AND topic_category = 'self_esteem'
);

UPDATE knowledge_items
SET text = 'Управитель 2-й дом (деньги/ресурсы/монетизация) (Уран) в аспекте «соединение» с Солнце показывает механику результата. Это создаёт сильную сцепку функций: тема становится центральной в карьере. Практика: закрепи 1 правило процесса (приоритеты, дедлайны, формат договорённостей) и 1 метрику, чтобы повторять успех и снижать риски.', is_active = 1, priority = 140, meta_json = '{}'
WHERE key = 'natal.house.2.ruler.uranus.aspect.conjunction.sun' AND locale = 'ru-RU' AND topic_category = 'self_esteem';

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.2.ruler.uranus.aspect.conjunction.sun', 'self_esteem', 'ru-RU', 'Управитель 2-й дом (деньги/ресурсы/монетизация) (Уран) в аспекте «соединение» с Солнце показывает механику результата. Это создаёт сильную сцепку функций: тема становится центральной в карьере. Практика: закрепи 1 правило процесса (приоритеты, дедлайны, формат договорённостей) и 1 метрику, чтобы повторять успех и снижать риски.', 140, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.2.ruler.uranus.aspect.conjunction.sun' AND locale = 'ru-RU' AND topic_category = 'self_esteem'
);

UPDATE knowledge_items
SET text = 'Управитель 1-й дом (самопрезентация/инициатива) (Юпитер) в аспекте «оппозиция» с Солнце показывает механику результата. Это даёт напряжение и рост: нужно управлять рисками, границами и приоритетами. Практика: закрепи 1 правило процесса (приоритеты, дедлайны, формат договорённостей) и 1 метрику, чтобы повторять успех и снижать риски.', is_active = 1, priority = 140, meta_json = '{}'
WHERE key = 'natal.house.1.ruler.jupiter.aspect.opposition.sun' AND locale = 'ru-RU' AND topic_category = 'self_esteem';

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.1.ruler.jupiter.aspect.opposition.sun', 'self_esteem', 'ru-RU', 'Управитель 1-й дом (самопрезентация/инициатива) (Юпитер) в аспекте «оппозиция» с Солнце показывает механику результата. Это даёт напряжение и рост: нужно управлять рисками, границами и приоритетами. Практика: закрепи 1 правило процесса (приоритеты, дедлайны, формат договорённостей) и 1 метрику, чтобы повторять успех и снижать риски.', 140, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.1.ruler.jupiter.aspect.opposition.sun' AND locale = 'ru-RU' AND topic_category = 'self_esteem'
);

UPDATE knowledge_items
SET text = 'Карьерный маркер: показывает, где проще получить результат и что мешает стабильности. Практика: выбери 1 конкретный навык/процесс на 2 недели (приоритеты, дедлайны, коммуникации, контроль качества) и замерь эффект по метрикам: скорость, качество, доход, устойчивость.', is_active = 1, priority = 140, meta_json = '{}'
WHERE key = 'natal.house.2.ruler.uranus' AND locale = 'ru-RU' AND topic_category = 'self_esteem';

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.2.ruler.uranus', 'self_esteem', 'ru-RU', 'Карьерный маркер: показывает, где проще получить результат и что мешает стабильности. Практика: выбери 1 конкретный навык/процесс на 2 недели (приоритеты, дедлайны, коммуникации, контроль качества) и замерь эффект по метрикам: скорость, качество, доход, устойчивость.', 140, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.2.ruler.uranus' AND locale = 'ru-RU' AND topic_category = 'self_esteem'
);

UPDATE knowledge_items
SET text = 'Управитель 2-й дом (деньги/ресурсы/монетизация) (Сатурн) в аспекте «соединение» с Нептун показывает механику результата. Это создаёт сильную сцепку функций: тема становится центральной в карьере. Практика: закрепи 1 правило процесса (приоритеты, дедлайны, формат договорённостей) и 1 метрику, чтобы повторять успех и снижать риски.', is_active = 1, priority = 140, meta_json = '{}'
WHERE key = 'natal.house.2.ruler.saturn.aspect.conjunction.neptune' AND locale = 'ru-RU' AND topic_category = 'self_esteem';

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.2.ruler.saturn.aspect.conjunction.neptune', 'self_esteem', 'ru-RU', 'Управитель 2-й дом (деньги/ресурсы/монетизация) (Сатурн) в аспекте «соединение» с Нептун показывает механику результата. Это создаёт сильную сцепку функций: тема становится центральной в карьере. Практика: закрепи 1 правило процесса (приоритеты, дедлайны, формат договорённостей) и 1 метрику, чтобы повторять успех и снижать риски.', 140, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.2.ruler.saturn.aspect.conjunction.neptune' AND locale = 'ru-RU' AND topic_category = 'self_esteem'
);

UPDATE knowledge_items
SET text = 'Управитель 2-й дом (деньги/ресурсы/монетизация) (Сатурн) в аспекте «соединение» с Солнце показывает механику результата. Это создаёт сильную сцепку функций: тема становится центральной в карьере. Практика: закрепи 1 правило процесса (приоритеты, дедлайны, формат договорённостей) и 1 метрику, чтобы повторять успех и снижать риски.', is_active = 1, priority = 140, meta_json = '{}'
WHERE key = 'natal.house.2.ruler.saturn.aspect.conjunction.sun' AND locale = 'ru-RU' AND topic_category = 'self_esteem';

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.2.ruler.saturn.aspect.conjunction.sun', 'self_esteem', 'ru-RU', 'Управитель 2-й дом (деньги/ресурсы/монетизация) (Сатурн) в аспекте «соединение» с Солнце показывает механику результата. Это создаёт сильную сцепку функций: тема становится центральной в карьере. Практика: закрепи 1 правило процесса (приоритеты, дедлайны, формат договорённостей) и 1 метрику, чтобы повторять успех и снижать риски.', 140, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.2.ruler.saturn.aspect.conjunction.sun' AND locale = 'ru-RU' AND topic_category = 'self_esteem'
);

UPDATE knowledge_items
SET text = 'Карьерный маркер: показывает, где проще получить результат и что мешает стабильности. Практика: выбери 1 конкретный навык/процесс на 2 недели (приоритеты, дедлайны, коммуникации, контроль качества) и замерь эффект по метрикам: скорость, качество, доход, устойчивость.', is_active = 1, priority = 140, meta_json = '{}'
WHERE key = 'natal.house.1.ruler.jupiter' AND locale = 'ru-RU' AND topic_category = 'self_esteem';

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.1.ruler.jupiter', 'self_esteem', 'ru-RU', 'Карьерный маркер: показывает, где проще получить результат и что мешает стабильности. Практика: выбери 1 конкретный навык/процесс на 2 недели (приоритеты, дедлайны, коммуникации, контроль качества) и замерь эффект по метрикам: скорость, качество, доход, устойчивость.', 140, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.1.ruler.jupiter' AND locale = 'ru-RU' AND topic_category = 'self_esteem'
);

UPDATE knowledge_items
SET text = 'Карьерный маркер: показывает, где проще получить результат и что мешает стабильности. Практика: выбери 1 конкретный навык/процесс на 2 недели (приоритеты, дедлайны, коммуникации, контроль качества) и замерь эффект по метрикам: скорость, качество, доход, устойчивость.', is_active = 1, priority = 140, meta_json = '{}'
WHERE key = 'natal.house.2.ruler.saturn' AND locale = 'ru-RU' AND topic_category = 'self_esteem';

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.2.ruler.saturn', 'self_esteem', 'ru-RU', 'Карьерный маркер: показывает, где проще получить результат и что мешает стабильности. Практика: выбери 1 конкретный навык/процесс на 2 недели (приоритеты, дедлайны, коммуникации, контроль качества) и замерь эффект по метрикам: скорость, качество, доход, устойчивость.', 140, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.2.ruler.saturn' AND locale = 'ru-RU' AND topic_category = 'self_esteem'
);

UPDATE knowledge_items
SET text = 'Карьерный маркер: показывает, где проще получить результат и что мешает стабильности. Практика: выбери 1 конкретный навык/процесс на 2 недели (приоритеты, дедлайны, коммуникации, контроль качества) и замерь эффект по метрикам: скорость, качество, доход, устойчивость.', is_active = 1, priority = 140, meta_json = '{}'
WHERE key = 'natal.house.1.planet.uranus' AND locale = 'ru-RU' AND topic_category = 'self_esteem';

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.1.planet.uranus', 'self_esteem', 'ru-RU', 'Карьерный маркер: показывает, где проще получить результат и что мешает стабильности. Практика: выбери 1 конкретный навык/процесс на 2 недели (приоритеты, дедлайны, коммуникации, контроль качества) и замерь эффект по метрикам: скорость, качество, доход, устойчивость.', 140, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.1.planet.uranus' AND locale = 'ru-RU' AND topic_category = 'self_esteem'
);

UPDATE knowledge_items
SET text = 'Карьерный маркер: показывает, где проще получить результат и что мешает стабильности. Практика: выбери 1 конкретный навык/процесс на 2 недели (приоритеты, дедлайны, коммуникации, контроль качества) и замерь эффект по метрикам: скорость, качество, доход, устойчивость.', is_active = 1, priority = 140, meta_json = '{}'
WHERE key = 'natal.house.2.planet.moon' AND locale = 'ru-RU' AND topic_category = 'self_esteem';

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.2.planet.moon', 'self_esteem', 'ru-RU', 'Карьерный маркер: показывает, где проще получить результат и что мешает стабильности. Практика: выбери 1 конкретный навык/процесс на 2 недели (приоритеты, дедлайны, коммуникации, контроль качества) и замерь эффект по метрикам: скорость, качество, доход, устойчивость.', 140, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.2.planet.moon' AND locale = 'ru-RU' AND topic_category = 'self_esteem'
);

UPDATE knowledge_items
SET text = 'Карьерный маркер: показывает, где проще получить результат и что мешает стабильности. Практика: выбери 1 конкретный навык/процесс на 2 недели (приоритеты, дедлайны, коммуникации, контроль качества) и замерь эффект по метрикам: скорость, качество, доход, устойчивость.', is_active = 1, priority = 140, meta_json = '{}'
WHERE key = 'natal.house.1.planet.neptune' AND locale = 'ru-RU' AND topic_category = 'self_esteem';

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.1.planet.neptune', 'self_esteem', 'ru-RU', 'Карьерный маркер: показывает, где проще получить результат и что мешает стабильности. Практика: выбери 1 конкретный навык/процесс на 2 недели (приоритеты, дедлайны, коммуникации, контроль качества) и замерь эффект по метрикам: скорость, качество, доход, устойчивость.', 140, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.1.planet.neptune' AND locale = 'ru-RU' AND topic_category = 'self_esteem'
);

UPDATE knowledge_items
SET text = 'Карьерный маркер: показывает, где проще получить результат и что мешает стабильности. Практика: выбери 1 конкретный навык/процесс на 2 недели (приоритеты, дедлайны, коммуникации, контроль качества) и замерь эффект по метрикам: скорость, качество, доход, устойчивость.', is_active = 1, priority = 140, meta_json = '{}'
WHERE key = 'natal.house.1.planet.saturn' AND locale = 'ru-RU' AND topic_category = 'self_esteem';

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.1.planet.saturn', 'self_esteem', 'ru-RU', 'Карьерный маркер: показывает, где проще получить результат и что мешает стабильности. Практика: выбери 1 конкретный навык/процесс на 2 недели (приоритеты, дедлайны, коммуникации, контроль качества) и замерь эффект по метрикам: скорость, качество, доход, устойчивость.', 140, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.1.planet.saturn' AND locale = 'ru-RU' AND topic_category = 'self_esteem'
);

UPDATE knowledge_items
SET text = 'Карьерный маркер: показывает, где проще получить результат и что мешает стабильности. Практика: выбери 1 конкретный навык/процесс на 2 недели (приоритеты, дедлайны, коммуникации, контроль качества) и замерь эффект по метрикам: скорость, качество, доход, устойчивость.', is_active = 1, priority = 140, meta_json = '{}'
WHERE key = 'natal.house.1.planet.sun' AND locale = 'ru-RU' AND topic_category = 'self_esteem';

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.1.planet.sun', 'self_esteem', 'ru-RU', 'Карьерный маркер: показывает, где проще получить результат и что мешает стабильности. Практика: выбери 1 конкретный навык/процесс на 2 недели (приоритеты, дедлайны, коммуникации, контроль качества) и замерь эффект по метрикам: скорость, качество, доход, устойчивость.', 140, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.1.planet.sun' AND locale = 'ru-RU' AND topic_category = 'self_esteem'
);

UPDATE knowledge_items
SET text = 'Карьерный маркер: показывает, где проще получить результат и что мешает стабильности. Практика: выбери 1 конкретный навык/процесс на 2 недели (приоритеты, дедлайны, коммуникации, контроль качества) и замерь эффект по метрикам: скорость, качество, доход, устойчивость.', is_active = 1, priority = 140, meta_json = '{}'
WHERE key = 'natal.house.2.planet.venus' AND locale = 'ru-RU' AND topic_category = 'self_esteem';

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.2.planet.venus', 'self_esteem', 'ru-RU', 'Карьерный маркер: показывает, где проще получить результат и что мешает стабильности. Практика: выбери 1 конкретный навык/процесс на 2 недели (приоритеты, дедлайны, коммуникации, контроль качества) и замерь эффект по метрикам: скорость, качество, доход, устойчивость.', 140, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.2.planet.venus' AND locale = 'ru-RU' AND topic_category = 'self_esteem'
);

UPDATE knowledge_items
SET text = 'Карьерный маркер: показывает, где проще получить результат и что мешает стабильности. Практика: выбери 1 конкретный навык/процесс на 2 недели (приоритеты, дедлайны, коммуникации, контроль качества) и замерь эффект по метрикам: скорость, качество, доход, устойчивость.', is_active = 1, priority = 140, meta_json = '{}'
WHERE key = 'natal.house.1.planet.mercury' AND locale = 'ru-RU' AND topic_category = 'self_esteem';

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.1.planet.mercury', 'self_esteem', 'ru-RU', 'Карьерный маркер: показывает, где проще получить результат и что мешает стабильности. Практика: выбери 1 конкретный навык/процесс на 2 недели (приоритеты, дедлайны, коммуникации, контроль качества) и замерь эффект по метрикам: скорость, качество, доход, устойчивость.', 140, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.1.planet.mercury' AND locale = 'ru-RU' AND topic_category = 'self_esteem'
);

COMMIT;

