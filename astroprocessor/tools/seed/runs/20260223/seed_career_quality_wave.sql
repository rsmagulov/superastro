-- AUTO-GENERATED. DO NOT EDIT BY HAND.

-- Career overrides from debug shortest used blocks (topic_category=career)

-- Source JSON: debug_career_160_100k.json

-- Filter: len(text)<= 220, max_keys=50

BEGIN;

UPDATE knowledge_items
SET text = 'Управитель 10-го дома не уточнён (any). Сфокусируйся на теме 10-го дома: статус, видимый результат и ответственность. Практика: 1 KPI + 1 дедлайн + 1 регулярный отчёт (еженедельно) на 2–4 недели — и смотри, что сильнее всего двигает карьеру.', is_active = 1, priority = 140, meta_json = '{}'
WHERE key = 'natal.house.10.ruler.any' AND locale = 'ru-RU' AND topic_category = 'career';

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.10.ruler.any', 'career', 'ru-RU', 'Управитель 10-го дома не уточнён (any). Сфокусируйся на теме 10-го дома: статус, видимый результат и ответственность. Практика: 1 KPI + 1 дедлайн + 1 регулярный отчёт (еженедельно) на 2–4 недели — и смотри, что сильнее всего двигает карьеру.', 140, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.10.ruler.any' AND locale = 'ru-RU' AND topic_category = 'career'
);

UPDATE knowledge_items
SET text = 'Карьерный маркер: показывает, где проще получить результат и что мешает стабильности. Практика: выбери 1 конкретный навык/процесс на 2 недели (приоритеты, дедлайны, коммуникации, контроль качества) и замерь эффект по метрикам: скорость, качество, доход, устойчивость.', is_active = 1, priority = 140, meta_json = '{}'
WHERE key = 'natal.sign.virgo.present' AND locale = 'ru-RU' AND topic_category = 'career';

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.sign.virgo.present', 'career', 'ru-RU', 'Карьерный маркер: показывает, где проще получить результат и что мешает стабильности. Практика: выбери 1 конкретный навык/процесс на 2 недели (приоритеты, дедлайны, коммуникации, контроль качества) и замерь эффект по метрикам: скорость, качество, доход, устойчивость.', 140, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.sign.virgo.present' AND locale = 'ru-RU' AND topic_category = 'career'
);

UPDATE knowledge_items
SET text = 'MC (Средина Неба) — вектор карьеры: к какому статусу и типу результата ты стремишься, что должно быть «видно рынку». Практика: сформулируй 1 образ результата (роль/уровень/ценность) и 2 KPI на 30 дней; под них выбери один проект-носитель.', is_active = 1, priority = 140, meta_json = '{}'
WHERE key = 'natal.angle.mc' AND locale = 'ru-RU' AND topic_category = 'career';

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.angle.mc', 'career', 'ru-RU', 'MC (Средина Неба) — вектор карьеры: к какому статусу и типу результата ты стремишься, что должно быть «видно рынку». Практика: сформулируй 1 образ результата (роль/уровень/ценность) и 2 KPI на 30 дней; под них выбери один проект-носитель.', 140, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.angle.mc' AND locale = 'ru-RU' AND topic_category = 'career'
);

UPDATE knowledge_items
SET text = 'Карьерный маркер: показывает, где проще получить результат и что мешает стабильности. Практика: выбери 1 конкретный навык/процесс на 2 недели (приоритеты, дедлайны, коммуникации, контроль качества) и замерь эффект по метрикам: скорость, качество, доход, устойчивость.', is_active = 1, priority = 140, meta_json = '{}'
WHERE key = 'natal.sign.capricorn.present' AND locale = 'ru-RU' AND topic_category = 'career';

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.sign.capricorn.present', 'career', 'ru-RU', 'Карьерный маркер: показывает, где проще получить результат и что мешает стабильности. Практика: выбери 1 конкретный навык/процесс на 2 недели (приоритеты, дедлайны, коммуникации, контроль качества) и замерь эффект по метрикам: скорость, качество, доход, устойчивость.', 140, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.sign.capricorn.present' AND locale = 'ru-RU' AND topic_category = 'career'
);

UPDATE knowledge_items
SET text = 'Венера как управитель 10-го дома, знак не уточнён (sign.any). Важнее функция: ценность, отношения, переговоры, эстетика/бренд. Практика: заранее согласуй критерии качества и ценности результата, фиксируй договорённости письменно и усиливай демонстрацию результата (портфолио/кейсы/метрики).', is_active = 1, priority = 140, meta_json = '{}'
WHERE key = 'natal.house.10.ruler.venus.sign.any' AND locale = 'ru-RU' AND topic_category = 'career';

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.10.ruler.venus.sign.any', 'career', 'ru-RU', 'Венера как управитель 10-го дома, знак не уточнён (sign.any). Важнее функция: ценность, отношения, переговоры, эстетика/бренд. Практика: заранее согласуй критерии качества и ценности результата, фиксируй договорённости письменно и усиливай демонстрацию результата (портфолио/кейсы/метрики).', 140, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.10.ruler.venus.sign.any' AND locale = 'ru-RU' AND topic_category = 'career'
);

UPDATE knowledge_items
SET text = 'Управитель 10-го дома — Венера: карьерный рост через ценность, отношения, переговоры, эстетика/бренд. Практика: выбери 1 проект, где эта функция проявляется (переговоры/аналитика/управление/структура/инновации), и добавь ритуал результата: планирование, отчётность, улучшение качества, портфолио.', is_active = 1, priority = 140, meta_json = '{}'
WHERE key = 'natal.house.10.ruler.venus' AND locale = 'ru-RU' AND topic_category = 'career';

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.10.ruler.venus', 'career', 'ru-RU', 'Управитель 10-го дома — Венера: карьерный рост через ценность, отношения, переговоры, эстетика/бренд. Практика: выбери 1 проект, где эта функция проявляется (переговоры/аналитика/управление/структура/инновации), и добавь ритуал результата: планирование, отчётность, улучшение качества, портфолио.', 140, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.10.ruler.venus' AND locale = 'ru-RU' AND topic_category = 'career'
);

UPDATE knowledge_items
SET text = 'Карьерный маркер: показывает, где проще получить результат и что мешает стабильности. Практика: выбери 1 конкретный навык/процесс на 2 недели (приоритеты, дедлайны, коммуникации, контроль качества) и замерь эффект по метрикам: скорость, качество, доход, устойчивость.', is_active = 1, priority = 140, meta_json = '{}'
WHERE key = 'natal.sign.libra.present' AND locale = 'ru-RU' AND topic_category = 'career';

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.sign.libra.present', 'career', 'ru-RU', 'Карьерный маркер: показывает, где проще получить результат и что мешает стабильности. Практика: выбери 1 конкретный навык/процесс на 2 недели (приоритеты, дедлайны, коммуникации, контроль качества) и замерь эффект по метрикам: скорость, качество, доход, устойчивость.', 140, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.sign.libra.present' AND locale = 'ru-RU' AND topic_category = 'career'
);

UPDATE knowledge_items
SET text = 'Карьерный маркер: показывает, где проще получить результат и что мешает стабильности. Практика: выбери 1 конкретный навык/процесс на 2 недели (приоритеты, дедлайны, коммуникации, контроль качества) и замерь эффект по метрикам: скорость, качество, доход, устойчивость.', is_active = 1, priority = 140, meta_json = '{}'
WHERE key = 'natal.sign.sagittarius.present' AND locale = 'ru-RU' AND topic_category = 'career';

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.sign.sagittarius.present', 'career', 'ru-RU', 'Карьерный маркер: показывает, где проще получить результат и что мешает стабильности. Практика: выбери 1 конкретный навык/процесс на 2 недели (приоритеты, дедлайны, коммуникации, контроль качества) и замерь эффект по метрикам: скорость, качество, доход, устойчивость.', 140, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.sign.sagittarius.present' AND locale = 'ru-RU' AND topic_category = 'career'
);

UPDATE knowledge_items
SET text = 'MC в знаке Весы: карьерный рост через партнёрства, репутацию и баланс интересов. Практика: выбери формат работы и окружение, где этот стиль — преимущество (роль, KPI, переговоры, позиционирование), и закрепи 1 правило коммуникации/договорённостей, чтобы репутация работала на тебя.', is_active = 1, priority = 140, meta_json = '{}'
WHERE key = 'natal.angle.mc.sign.libra' AND locale = 'ru-RU' AND topic_category = 'career';

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.angle.mc.sign.libra', 'career', 'ru-RU', 'MC в знаке Весы: карьерный рост через партнёрства, репутацию и баланс интересов. Практика: выбери формат работы и окружение, где этот стиль — преимущество (роль, KPI, переговоры, позиционирование), и закрепи 1 правило коммуникации/договорённостей, чтобы репутация работала на тебя.', 140, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.angle.mc.sign.libra' AND locale = 'ru-RU' AND topic_category = 'career'
);

UPDATE knowledge_items
SET text = 'Карьерный маркер: показывает, где проще получить результат и что мешает стабильности. Практика: выбери 1 конкретный навык/процесс на 2 недели (приоритеты, дедлайны, коммуникации, контроль качества) и замерь эффект по метрикам: скорость, качество, доход, устойчивость.', is_active = 1, priority = 140, meta_json = '{}'
WHERE key = 'natal.sign.aquarius.present' AND locale = 'ru-RU' AND topic_category = 'career';

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.sign.aquarius.present', 'career', 'ru-RU', 'Карьерный маркер: показывает, где проще получить результат и что мешает стабильности. Практика: выбери 1 конкретный навык/процесс на 2 недели (приоритеты, дедлайны, коммуникации, контроль качества) и замерь эффект по метрикам: скорость, качество, доход, устойчивость.', 140, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.sign.aquarius.present' AND locale = 'ru-RU' AND topic_category = 'career'
);

UPDATE knowledge_items
SET text = 'Карьерный маркер: показывает, где проще получить результат и что мешает стабильности. Практика: выбери 1 конкретный навык/процесс на 2 недели (приоритеты, дедлайны, коммуникации, контроль качества) и замерь эффект по метрикам: скорость, качество, доход, устойчивость.', is_active = 1, priority = 140, meta_json = '{}'
WHERE key = 'natal.sign.pisces.present' AND locale = 'ru-RU' AND topic_category = 'career';

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.sign.pisces.present', 'career', 'ru-RU', 'Карьерный маркер: показывает, где проще получить результат и что мешает стабильности. Практика: выбери 1 конкретный навык/процесс на 2 недели (приоритеты, дедлайны, коммуникации, контроль качества) и замерь эффект по метрикам: скорость, качество, доход, устойчивость.', 140, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.sign.pisces.present' AND locale = 'ru-RU' AND topic_category = 'career'
);

UPDATE knowledge_items
SET text = '10-й дом — карьера/статус/видимый результат: как тебя оценивают и за что повышают. Это про ответственность, публичность результата и управляемые KPI. Практика: определи «метрику статуса» (что должно быть видно) и выстрой трек: задачи → дедлайны → критерии качества → отчёт.', is_active = 1, priority = 140, meta_json = '{}'
WHERE key = 'natal.house.10' AND locale = 'ru-RU' AND topic_category = 'career';

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.10', 'career', 'ru-RU', '10-й дом — карьера/статус/видимый результат: как тебя оценивают и за что повышают. Это про ответственность, публичность результата и управляемые KPI. Практика: определи «метрику статуса» (что должно быть видно) и выстрой трек: задачи → дедлайны → критерии качества → отчёт.', 140, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.10' AND locale = 'ru-RU' AND topic_category = 'career'
);

UPDATE knowledge_items
SET text = 'Карьерный маркер: показывает, где проще получить результат и что мешает стабильности. Практика: выбери 1 конкретный навык/процесс на 2 недели (приоритеты, дедлайны, коммуникации, контроль качества) и замерь эффект по метрикам: скорость, качество, доход, устойчивость.', is_active = 1, priority = 140, meta_json = '{}'
WHERE key = 'natal.sign.scorpio.present' AND locale = 'ru-RU' AND topic_category = 'career';

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.sign.scorpio.present', 'career', 'ru-RU', 'Карьерный маркер: показывает, где проще получить результат и что мешает стабильности. Практика: выбери 1 конкретный навык/процесс на 2 недели (приоритеты, дедлайны, коммуникации, контроль качества) и замерь эффект по метрикам: скорость, качество, доход, устойчивость.', 140, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.sign.scorpio.present' AND locale = 'ru-RU' AND topic_category = 'career'
);

UPDATE knowledge_items
SET text = 'Карьерный маркер: показывает, где проще получить результат и что мешает стабильности. Практика: выбери 1 конкретный навык/процесс на 2 недели (приоритеты, дедлайны, коммуникации, контроль качества) и замерь эффект по метрикам: скорость, качество, доход, устойчивость.', is_active = 1, priority = 140, meta_json = '{}'
WHERE key = 'natal.sign.taurus.present' AND locale = 'ru-RU' AND topic_category = 'career';

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.sign.taurus.present', 'career', 'ru-RU', 'Карьерный маркер: показывает, где проще получить результат и что мешает стабильности. Практика: выбери 1 конкретный навык/процесс на 2 недели (приоритеты, дедлайны, коммуникации, контроль качества) и замерь эффект по метрикам: скорость, качество, доход, устойчивость.', 140, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.sign.taurus.present' AND locale = 'ru-RU' AND topic_category = 'career'
);

UPDATE knowledge_items
SET text = 'Карьерный маркер: показывает, где проще получить результат и что мешает стабильности. Практика: выбери 1 конкретный навык/процесс на 2 недели (приоритеты, дедлайны, коммуникации, контроль качества) и замерь эффект по метрикам: скорость, качество, доход, устойчивость.', is_active = 1, priority = 140, meta_json = '{}'
WHERE key = 'natal.sign.gemini.present' AND locale = 'ru-RU' AND topic_category = 'career';

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.sign.gemini.present', 'career', 'ru-RU', 'Карьерный маркер: показывает, где проще получить результат и что мешает стабильности. Практика: выбери 1 конкретный навык/процесс на 2 недели (приоритеты, дедлайны, коммуникации, контроль качества) и замерь эффект по метрикам: скорость, качество, доход, устойчивость.', 140, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.sign.gemini.present' AND locale = 'ru-RU' AND topic_category = 'career'
);

UPDATE knowledge_items
SET text = 'Карьерный маркер: показывает, где проще получить результат и что мешает стабильности. Практика: выбери 1 конкретный навык/процесс на 2 недели (приоритеты, дедлайны, коммуникации, контроль качества) и замерь эффект по метрикам: скорость, качество, доход, устойчивость.', is_active = 1, priority = 140, meta_json = '{}'
WHERE key = 'natal.sign.leo.present' AND locale = 'ru-RU' AND topic_category = 'career';

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.sign.leo.present', 'career', 'ru-RU', 'Карьерный маркер: показывает, где проще получить результат и что мешает стабильности. Практика: выбери 1 конкретный навык/процесс на 2 недели (приоритеты, дедлайны, коммуникации, контроль качества) и замерь эффект по метрикам: скорость, качество, доход, устойчивость.', 140, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.sign.leo.present' AND locale = 'ru-RU' AND topic_category = 'career'
);

COMMIT;

