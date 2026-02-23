-- AUTO-GENERATED. DO NOT EDIT BY HAND.

-- Career overrides from debug shortest used blocks (topic_category=purpose_path)

-- Source JSON: C:/Projects/superastro/debug_purpose_path_ru_160_20260223_130919_mini_housecore.json

-- Filter: len(text)<= 450, max_keys=250

BEGIN;

UPDATE knowledge_items
SET text = 'Куспид 9-й дом в Дева задаёт стиль решения задач по теме дома. Практика: подстрой окружение (роль, процессы, KPI), чтобы стиль знака усиливал результат, а не создавал лишние конфликты.', is_active = 1, priority = 140, meta_json = '{}'
WHERE key = 'natal.house.9.cusp.sign.virgo' AND locale = 'ru-RU' AND topic_category = 'purpose_path';

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.9.cusp.sign.virgo', 'purpose_path', 'ru-RU', 'Куспид 9-й дом в Дева задаёт стиль решения задач по теме дома. Практика: подстрой окружение (роль, процессы, KPI), чтобы стиль знака усиливал результат, а не создавал лишние конфликты.', 140, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.9.cusp.sign.virgo' AND locale = 'ru-RU' AND topic_category = 'purpose_path'
);

UPDATE knowledge_items
SET text = 'MC (Средина Неба) — вектор карьеры: к какому статусу и типу результата ты стремишься и что должно быть видно рынку. Практика: сформулируй образ результата (роль/уровень/ценность) и 2 KPI на 30 дней; под них выбери один проект-носитель.', is_active = 1, priority = 140, meta_json = '{}'
WHERE key = 'natal.angle.mc' AND locale = 'ru-RU' AND topic_category = 'purpose_path';

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.angle.mc', 'purpose_path', 'ru-RU', 'MC (Средина Неба) — вектор карьеры: к какому статусу и типу результата ты стремишься и что должно быть видно рынку. Практика: сформулируй образ результата (роль/уровень/ценность) и 2 KPI на 30 дней; под них выбери один проект-носитель.', 140, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.angle.mc' AND locale = 'ru-RU' AND topic_category = 'purpose_path'
);

UPDATE knowledge_items
SET text = 'Куспид 9-й дом: знак не уточнён (any). В карьере важнее управление темой дома, чем стиль знака. Практика: выдели 1–2 навыка по теме дома и составь план на 4 недели (задачи, метрики, ритм).', is_active = 1, priority = 140, meta_json = '{}'
WHERE key = 'natal.house.9.cusp.sign.any' AND locale = 'ru-RU' AND topic_category = 'purpose_path';

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.9.cusp.sign.any', 'purpose_path', 'ru-RU', 'Куспид 9-й дом: знак не уточнён (any). В карьере важнее управление темой дома, чем стиль знака. Практика: выдели 1–2 навыка по теме дома и составь план на 4 недели (задачи, метрики, ритм).', 140, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.9.cusp.sign.any' AND locale = 'ru-RU' AND topic_category = 'purpose_path'
);

UPDATE knowledge_items
SET text = 'Куспид 10-й дом (карьера/статус/видимый результат) в Весы задаёт стиль решения задач по теме дома. Практика: подстрой окружение (роль, процессы, KPI), чтобы стиль знака усиливал результат, а не создавал лишние конфликты.', is_active = 1, priority = 140, meta_json = '{}'
WHERE key = 'natal.house.10.cusp.sign.libra' AND locale = 'ru-RU' AND topic_category = 'purpose_path';

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.10.cusp.sign.libra', 'purpose_path', 'ru-RU', 'Куспид 10-й дом (карьера/статус/видимый результат) в Весы задаёт стиль решения задач по теме дома. Практика: подстрой окружение (роль, процессы, KPI), чтобы стиль знака усиливал результат, а не создавал лишние конфликты.', 140, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.10.cusp.sign.libra' AND locale = 'ru-RU' AND topic_category = 'purpose_path'
);

UPDATE knowledge_items
SET text = 'Куспид 10-й дом (карьера/статус/видимый результат): знак не уточнён (any). В карьере важнее управление темой дома, чем стиль знака. Практика: выдели 1–2 навыка по теме дома и составь план на 4 недели (задачи, метрики, ритм).', is_active = 1, priority = 140, meta_json = '{}'
WHERE key = 'natal.house.10.cusp.sign.any' AND locale = 'ru-RU' AND topic_category = 'purpose_path';

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.10.cusp.sign.any', 'purpose_path', 'ru-RU', 'Куспид 10-й дом (карьера/статус/видимый результат): знак не уточнён (any). В карьере важнее управление темой дома, чем стиль знака. Практика: выдели 1–2 навыка по теме дома и составь план на 4 недели (задачи, метрики, ритм).', 140, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.10.cusp.sign.any' AND locale = 'ru-RU' AND topic_category = 'purpose_path'
);

UPDATE knowledge_items
SET text = 'Аспекты управителя 10-го дома (Венера) показывают, через какие темы карьера включается сильнее: союзы, конфликты, рост, ограничения. Практика: выпиши 2 повторяющихся сюжета и настрой управление: границы, формат коммуникации, сроки и критерии качества.', is_active = 1, priority = 140, meta_json = '{}'
WHERE key = 'natal.house.10.ruler.venus.aspects.present' AND locale = 'ru-RU' AND topic_category = 'purpose_path';

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.10.ruler.venus.aspects.present', 'purpose_path', 'ru-RU', 'Аспекты управителя 10-го дома (Венера) показывают, через какие темы карьера включается сильнее: союзы, конфликты, рост, ограничения. Практика: выпиши 2 повторяющихся сюжета и настрой управление: границы, формат коммуникации, сроки и критерии качества.', 140, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.10.ruler.venus.aspects.present' AND locale = 'ru-RU' AND topic_category = 'purpose_path'
);

UPDATE knowledge_items
SET text = 'Карьерный маркер: показывает, где проще получить результат и что мешает стабильности. Практика: выбери 1 конкретный навык/процесс на 2 недели (приоритеты, дедлайны, коммуникации, контроль качества) и замерь эффект по метрикам: скорость, качество, доход, устойчивость.', is_active = 1, priority = 140, meta_json = '{}'
WHERE key = 'natal.house.9.ruler.any' AND locale = 'ru-RU' AND topic_category = 'purpose_path';

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.9.ruler.any', 'purpose_path', 'ru-RU', 'Карьерный маркер: показывает, где проще получить результат и что мешает стабильности. Практика: выбери 1 конкретный навык/процесс на 2 недели (приоритеты, дедлайны, коммуникации, контроль качества) и замерь эффект по метрикам: скорость, качество, доход, устойчивость.', 140, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.9.ruler.any' AND locale = 'ru-RU' AND topic_category = 'purpose_path'
);

UPDATE knowledge_items
SET text = 'Управитель 10-го дома не уточнён (any). Сфокусируйся на теме 10-го дома: статус, видимый результат и ответственность. Практика: 1 KPI + 1 дедлайн + 1 еженедельный отчёт на 2–4 недели — и смотри, что сильнее всего двигает карьеру.', is_active = 1, priority = 140, meta_json = '{}'
WHERE key = 'natal.house.10.ruler.any' AND locale = 'ru-RU' AND topic_category = 'purpose_path';

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.10.ruler.any', 'purpose_path', 'ru-RU', 'Управитель 10-го дома не уточнён (any). Сфокусируйся на теме 10-го дома: статус, видимый результат и ответственность. Практика: 1 KPI + 1 дедлайн + 1 еженедельный отчёт на 2–4 недели — и смотри, что сильнее всего двигает карьеру.', 140, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.10.ruler.any' AND locale = 'ru-RU' AND topic_category = 'purpose_path'
);

UPDATE knowledge_items
SET text = 'Венера как управитель 10-го дома, знак не уточнён (sign.any). Важнее функция: ценность, переговоры, отношения, вкус/бренд. Практика: согласуй критерии качества до старта и фиксируй договорённости письменно — это ускоряет рост статуса.', is_active = 1, priority = 140, meta_json = '{}'
WHERE key = 'natal.house.10.ruler.venus.sign.any' AND locale = 'ru-RU' AND topic_category = 'purpose_path';

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.10.ruler.venus.sign.any', 'purpose_path', 'ru-RU', 'Венера как управитель 10-го дома, знак не уточнён (sign.any). Важнее функция: ценность, переговоры, отношения, вкус/бренд. Практика: согласуй критерии качества до старта и фиксируй договорённости письменно — это ускоряет рост статуса.', 140, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.10.ruler.venus.sign.any' AND locale = 'ru-RU' AND topic_category = 'purpose_path'
);

UPDATE knowledge_items
SET text = 'Карьерный маркер: показывает, где проще получить результат и что мешает стабильности. Практика: выбери 1 конкретный навык/процесс на 2 недели (приоритеты, дедлайны, коммуникации, контроль качества) и замерь эффект по метрикам: скорость, качество, доход, устойчивость.', is_active = 1, priority = 140, meta_json = '{}'
WHERE key = 'natal.house.9.ruler.mercury.sign.any' AND locale = 'ru-RU' AND topic_category = 'purpose_path';

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.9.ruler.mercury.sign.any', 'purpose_path', 'ru-RU', 'Карьерный маркер: показывает, где проще получить результат и что мешает стабильности. Практика: выбери 1 конкретный навык/процесс на 2 недели (приоритеты, дедлайны, коммуникации, контроль качества) и замерь эффект по метрикам: скорость, качество, доход, устойчивость.', 140, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.9.ruler.mercury.sign.any' AND locale = 'ru-RU' AND topic_category = 'purpose_path'
);

UPDATE knowledge_items
SET text = 'Управитель 10-й дом (карьера/статус/видимый результат) (Венера) в аспекте «секстиль» с Марс показывает механику результата. Это даёт ресурс и проще превращается в навык/результат. Практика: закрепи 1 правило процесса (приоритеты, дедлайны, формат договорённостей) и 1 метрику, чтобы повторять успех и снижать риски.', is_active = 1, priority = 140, meta_json = '{}'
WHERE key = 'natal.house.10.ruler.venus.aspect.sextile.mars' AND locale = 'ru-RU' AND topic_category = 'purpose_path';

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.10.ruler.venus.aspect.sextile.mars', 'purpose_path', 'ru-RU', 'Управитель 10-й дом (карьера/статус/видимый результат) (Венера) в аспекте «секстиль» с Марс показывает механику результата. Это даёт ресурс и проще превращается в навык/результат. Практика: закрепи 1 правило процесса (приоритеты, дедлайны, формат договорённостей) и 1 метрику, чтобы повторять успех и снижать риски.', 140, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.10.ruler.venus.aspect.sextile.mars' AND locale = 'ru-RU' AND topic_category = 'purpose_path'
);

UPDATE knowledge_items
SET text = 'Управитель 10-го дома — Венера: карьерный рост через ценность, переговоры, отношения, вкус/бренд. Практика: выбери 1 проект, где эта функция проявляется, и усили демонстрацию результата (кейсы, метрики, портфолио).', is_active = 1, priority = 140, meta_json = '{}'
WHERE key = 'natal.house.10.ruler.venus' AND locale = 'ru-RU' AND topic_category = 'purpose_path';

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.10.ruler.venus', 'purpose_path', 'ru-RU', 'Управитель 10-го дома — Венера: карьерный рост через ценность, переговоры, отношения, вкус/бренд. Практика: выбери 1 проект, где эта функция проявляется, и усили демонстрацию результата (кейсы, метрики, портфолио).', 140, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.10.ruler.venus' AND locale = 'ru-RU' AND topic_category = 'purpose_path'
);

UPDATE knowledge_items
SET text = 'Карьерный маркер: показывает, где проще получить результат и что мешает стабильности. Практика: выбери 1 конкретный навык/процесс на 2 недели (приоритеты, дедлайны, коммуникации, контроль качества) и замерь эффект по метрикам: скорость, качество, доход, устойчивость.', is_active = 1, priority = 140, meta_json = '{}'
WHERE key = 'natal.house.9.ruler.mercury' AND locale = 'ru-RU' AND topic_category = 'purpose_path';

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.9.ruler.mercury', 'purpose_path', 'ru-RU', 'Карьерный маркер: показывает, где проще получить результат и что мешает стабильности. Практика: выбери 1 конкретный навык/процесс на 2 недели (приоритеты, дедлайны, коммуникации, контроль качества) и замерь эффект по метрикам: скорость, качество, доход, устойчивость.', 140, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.9.ruler.mercury' AND locale = 'ru-RU' AND topic_category = 'purpose_path'
);

COMMIT;

