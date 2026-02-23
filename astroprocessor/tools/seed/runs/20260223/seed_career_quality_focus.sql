-- AUTO-GENERATED. DO NOT EDIT BY HAND.

-- Career overrides from debug shortest used blocks (topic_category=career)

-- Source JSON: C:/Projects/superastro/debug_career_mini_quality_focus.json

-- Filter: len(text)<= 400, max_keys=80

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
SET text = 'MC (Средина Неба) — вектор карьеры: к какому статусу и типу результата ты стремишься, что должно быть «видно рынку». Практика: сформулируй 1 образ результата (роль/уровень/ценность) и 2 KPI на 30 дней; под них выбери один проект-носитель.', is_active = 1, priority = 140, meta_json = '{}'
WHERE key = 'natal.angle.mc' AND locale = 'ru-RU' AND topic_category = 'career';

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.angle.mc', 'career', 'ru-RU', 'MC (Средина Неба) — вектор карьеры: к какому статусу и типу результата ты стремишься, что должно быть «видно рынку». Практика: сформулируй 1 образ результата (роль/уровень/ценность) и 2 KPI на 30 дней; под них выбери один проект-носитель.', 140, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.angle.mc' AND locale = 'ru-RU' AND topic_category = 'career'
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
SET text = 'MC в знаке Весы: карьерный рост через партнёрства, репутацию и баланс интересов. Практика: выбери формат работы и окружение, где этот стиль — преимущество (роль, KPI, переговоры, позиционирование), и закрепи 1 правило коммуникации/договорённостей, чтобы репутация работала на тебя.', is_active = 1, priority = 140, meta_json = '{}'
WHERE key = 'natal.angle.mc.sign.libra' AND locale = 'ru-RU' AND topic_category = 'career';

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.angle.mc.sign.libra', 'career', 'ru-RU', 'MC в знаке Весы: карьерный рост через партнёрства, репутацию и баланс интересов. Практика: выбери формат работы и окружение, где этот стиль — преимущество (роль, KPI, переговоры, позиционирование), и закрепи 1 правило коммуникации/договорённостей, чтобы репутация работала на тебя.', 140, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.angle.mc.sign.libra' AND locale = 'ru-RU' AND topic_category = 'career'
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
SET text = 'Куспид 10-й дом (карьера/статус/видимый результат) в Весы задаёт стиль решения задач по теме дома. Это влияет на темп, переговоры и то, как ты выбираешь среду. Практика: подстрой окружение (роль, процессы, KPI), чтобы стиль знака усиливал результат, а не создавал лишние конфликты.', is_active = 1, priority = 140, meta_json = '{}'
WHERE key = 'natal.house.10.cusp.sign.libra' AND locale = 'ru-RU' AND topic_category = 'career';

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.10.cusp.sign.libra', 'career', 'ru-RU', 'Куспид 10-й дом (карьера/статус/видимый результат) в Весы задаёт стиль решения задач по теме дома. Это влияет на темп, переговоры и то, как ты выбираешь среду. Практика: подстрой окружение (роль, процессы, KPI), чтобы стиль знака усиливал результат, а не создавал лишние конфликты.', 140, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.10.cusp.sign.libra' AND locale = 'ru-RU' AND topic_category = 'career'
);

UPDATE knowledge_items
SET text = 'Уран в Козерог в 1-й дом (самопрезентация/инициатива): показывает, как ты проявляешь инициативу и производишь первое впечатление. Планета — рычаг (инновации, свобода, технологии, нестандарт), знак — стиль действий, дом — зона монетизации/ответственности. Практика: выбери 1 тип задач, где это сильнее всего, и добавь опору процесса (ритм, KPI, договорённости, ревью), чтобы результат стал стабильным.', is_active = 1, priority = 140, meta_json = '{}'
WHERE key = 'natal.planet.uranus.sign.capricorn.house.1' AND locale = 'ru-RU' AND topic_category = 'career';

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.planet.uranus.sign.capricorn.house.1', 'career', 'ru-RU', 'Уран в Козерог в 1-й дом (самопрезентация/инициатива): показывает, как ты проявляешь инициативу и производишь первое впечатление. Планета — рычаг (инновации, свобода, технологии, нестандарт), знак — стиль действий, дом — зона монетизации/ответственности. Практика: выбери 1 тип задач, где это сильнее всего, и добавь опору процесса (ритм, KPI, договорённости, ревью), чтобы результат стал стабильным.', 140, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.planet.uranus.sign.capricorn.house.1' AND locale = 'ru-RU' AND topic_category = 'career'
);

UPDATE knowledge_items
SET text = 'Аспект Юпитер — оппозиция — Солнце: связь функций «рост, масштаб, наставничество, международность» и «роль и лидерство». В карьере это даёт напряжение и рост: важно управлять рисками, границами и приоритетами. Практика: выбери одну настройку — правило коммуникации, буфер времени, чек-лист качества или прозрачный критерий успеха — и проверь эффект за 2 недели.', is_active = 1, priority = 140, meta_json = '{}'
WHERE key = 'natal.aspect.jupiter.opposition.sun' AND locale = 'ru-RU' AND topic_category = 'career';

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.aspect.jupiter.opposition.sun', 'career', 'ru-RU', 'Аспект Юпитер — оппозиция — Солнце: связь функций «рост, масштаб, наставничество, международность» и «роль и лидерство». В карьере это даёт напряжение и рост: важно управлять рисками, границами и приоритетами. Практика: выбери одну настройку — правило коммуникации, буфер времени, чек-лист качества или прозрачный критерий успеха — и проверь эффект за 2 недели.', 140, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.aspect.jupiter.opposition.sun' AND locale = 'ru-RU' AND topic_category = 'career'
);

UPDATE knowledge_items
SET text = 'Аспект Юпитер — оппозиция — Уран: связь функций «рост, масштаб, наставничество, международность» и «инновации, свобода, технологии, нестандарт». В карьере это даёт напряжение и рост: важно управлять рисками, границами и приоритетами. Практика: выбери одну настройку — правило коммуникации, буфер времени, чек-лист качества или прозрачный критерий успеха — и проверь эффект за 2 недели.', is_active = 1, priority = 140, meta_json = '{}'
WHERE key = 'natal.aspect.jupiter.opposition.uranus' AND locale = 'ru-RU' AND topic_category = 'career';

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.aspect.jupiter.opposition.uranus', 'career', 'ru-RU', 'Аспект Юпитер — оппозиция — Уран: связь функций «рост, масштаб, наставничество, международность» и «инновации, свобода, технологии, нестандарт». В карьере это даёт напряжение и рост: важно управлять рисками, границами и приоритетами. Практика: выбери одну настройку — правило коммуникации, буфер времени, чек-лист качества или прозрачный критерий успеха — и проверь эффект за 2 недели.', 140, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.aspect.jupiter.opposition.uranus' AND locale = 'ru-RU' AND topic_category = 'career'
);

UPDATE knowledge_items
SET text = 'Аспект Марс — секстиль — Венера: связь функций «инициатива, скорость, конкурентность, запуск» и «ценность, отношения, переговоры, эстетика/бренд». В карьере это легче согласовать усилия и быстрее конвертировать в навык/результат. Практика: выбери одну настройку — правило коммуникации, буфер времени, чек-лист качества или прозрачный критерий успеха — и проверь эффект за 2 недели.', is_active = 1, priority = 140, meta_json = '{}'
WHERE key = 'natal.aspect.mars.sextile.venus' AND locale = 'ru-RU' AND topic_category = 'career';

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.aspect.mars.sextile.venus', 'career', 'ru-RU', 'Аспект Марс — секстиль — Венера: связь функций «инициатива, скорость, конкурентность, запуск» и «ценность, отношения, переговоры, эстетика/бренд». В карьере это легче согласовать усилия и быстрее конвертировать в навык/результат. Практика: выбери одну настройку — правило коммуникации, буфер времени, чек-лист качества или прозрачный критерий успеха — и проверь эффект за 2 недели.', 140, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.aspect.mars.sextile.venus' AND locale = 'ru-RU' AND topic_category = 'career'
);

UPDATE knowledge_items
SET text = 'Аспект Нептун — соединение — Сатурн: связь функций «видение, смысл, креатив, эмпатия, риск тумана» и «структура, дисциплина, ответственность, долгий цикл». В карьере это сильная сцепка функций: тема становится «центром тяжести» в карьере. Практика: выбери одну настройку — правило коммуникации, буфер времени, чек-лист качества или прозрачный критерий успеха — и проверь эффект за 2 недели.', is_active = 1, priority = 140, meta_json = '{}'
WHERE key = 'natal.aspect.neptune.conjunction.saturn' AND locale = 'ru-RU' AND topic_category = 'career';

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.aspect.neptune.conjunction.saturn', 'career', 'ru-RU', 'Аспект Нептун — соединение — Сатурн: связь функций «видение, смысл, креатив, эмпатия, риск тумана» и «структура, дисциплина, ответственность, долгий цикл». В карьере это сильная сцепка функций: тема становится «центром тяжести» в карьере. Практика: выбери одну настройку — правило коммуникации, буфер времени, чек-лист качества или прозрачный критерий успеха — и проверь эффект за 2 недели.', 140, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.aspect.neptune.conjunction.saturn' AND locale = 'ru-RU' AND topic_category = 'career'
);

UPDATE knowledge_items
SET text = 'Аспект Нептун — соединение — Солнце: связь функций «видение, смысл, креатив, эмпатия, риск тумана» и «роль и лидерство». В карьере это сильная сцепка функций: тема становится «центром тяжести» в карьере. Практика: выбери одну настройку — правило коммуникации, буфер времени, чек-лист качества или прозрачный критерий успеха — и проверь эффект за 2 недели.', is_active = 1, priority = 140, meta_json = '{}'
WHERE key = 'natal.aspect.neptune.conjunction.sun' AND locale = 'ru-RU' AND topic_category = 'career';

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.aspect.neptune.conjunction.sun', 'career', 'ru-RU', 'Аспект Нептун — соединение — Солнце: связь функций «видение, смысл, креатив, эмпатия, риск тумана» и «роль и лидерство». В карьере это сильная сцепка функций: тема становится «центром тяжести» в карьере. Практика: выбери одну настройку — правило коммуникации, буфер времени, чек-лист качества или прозрачный критерий успеха — и проверь эффект за 2 недели.', 140, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.aspect.neptune.conjunction.sun' AND locale = 'ru-RU' AND topic_category = 'career'
);

UPDATE knowledge_items
SET text = 'Аспект Нептун — секстиль — Плутон: связь функций «видение, смысл, креатив, эмпатия, риск тумана» и «влияние, трансформация, кризис-менеджмент». В карьере это легче согласовать усилия и быстрее конвертировать в навык/результат. Практика: выбери одну настройку — правило коммуникации, буфер времени, чек-лист качества или прозрачный критерий успеха — и проверь эффект за 2 недели.', is_active = 1, priority = 140, meta_json = '{}'
WHERE key = 'natal.aspect.neptune.sextile.pluto' AND locale = 'ru-RU' AND topic_category = 'career';

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.aspect.neptune.sextile.pluto', 'career', 'ru-RU', 'Аспект Нептун — секстиль — Плутон: связь функций «видение, смысл, креатив, эмпатия, риск тумана» и «влияние, трансформация, кризис-менеджмент». В карьере это легче согласовать усилия и быстрее конвертировать в навык/результат. Практика: выбери одну настройку — правило коммуникации, буфер времени, чек-лист качества или прозрачный критерий успеха — и проверь эффект за 2 недели.', 140, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.aspect.neptune.sextile.pluto' AND locale = 'ru-RU' AND topic_category = 'career'
);

UPDATE knowledge_items
SET text = 'Аспект Плутон — секстиль — Сатурн: связь функций «влияние, трансформация, кризис-менеджмент» и «структура, дисциплина, ответственность, долгий цикл». В карьере это легче согласовать усилия и быстрее конвертировать в навык/результат. Практика: выбери одну настройку — правило коммуникации, буфер времени, чек-лист качества или прозрачный критерий успеха — и проверь эффект за 2 недели.', is_active = 1, priority = 140, meta_json = '{}'
WHERE key = 'natal.aspect.pluto.sextile.saturn' AND locale = 'ru-RU' AND topic_category = 'career';

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.aspect.pluto.sextile.saturn', 'career', 'ru-RU', 'Аспект Плутон — секстиль — Сатурн: связь функций «влияние, трансформация, кризис-менеджмент» и «структура, дисциплина, ответственность, долгий цикл». В карьере это легче согласовать усилия и быстрее конвертировать в навык/результат. Практика: выбери одну настройку — правило коммуникации, буфер времени, чек-лист качества или прозрачный критерий успеха — и проверь эффект за 2 недели.', 140, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.aspect.pluto.sextile.saturn' AND locale = 'ru-RU' AND topic_category = 'career'
);

UPDATE knowledge_items
SET text = 'Аспект Сатурн — соединение — Солнце: связь функций «структура, дисциплина, ответственность, долгий цикл» и «роль и лидерство». В карьере это сильная сцепка функций: тема становится «центром тяжести» в карьере. Практика: выбери одну настройку — правило коммуникации, буфер времени, чек-лист качества или прозрачный критерий успеха — и проверь эффект за 2 недели.', is_active = 1, priority = 140, meta_json = '{}'
WHERE key = 'natal.aspect.saturn.conjunction.sun' AND locale = 'ru-RU' AND topic_category = 'career';

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.aspect.saturn.conjunction.sun', 'career', 'ru-RU', 'Аспект Сатурн — соединение — Солнце: связь функций «структура, дисциплина, ответственность, долгий цикл» и «роль и лидерство». В карьере это сильная сцепка функций: тема становится «центром тяжести» в карьере. Практика: выбери одну настройку — правило коммуникации, буфер времени, чек-лист качества или прозрачный критерий успеха — и проверь эффект за 2 недели.', 140, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.aspect.saturn.conjunction.sun' AND locale = 'ru-RU' AND topic_category = 'career'
);

UPDATE knowledge_items
SET text = 'Аспект Солнце — соединение — Уран: связь функций «роль и лидерство» и «инновации, свобода, технологии, нестандарт». В карьере это сильная сцепка функций: тема становится «центром тяжести» в карьере. Практика: выбери одну настройку — правило коммуникации, буфер времени, чек-лист качества или прозрачный критерий успеха — и проверь эффект за 2 недели.', is_active = 1, priority = 140, meta_json = '{}'
WHERE key = 'natal.aspect.sun.conjunction.uranus' AND locale = 'ru-RU' AND topic_category = 'career';

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.aspect.sun.conjunction.uranus', 'career', 'ru-RU', 'Аспект Солнце — соединение — Уран: связь функций «роль и лидерство» и «инновации, свобода, технологии, нестандарт». В карьере это сильная сцепка функций: тема становится «центром тяжести» в карьере. Практика: выбери одну настройку — правило коммуникации, буфер времени, чек-лист качества или прозрачный критерий успеха — и проверь эффект за 2 недели.', 140, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.aspect.sun.conjunction.uranus' AND locale = 'ru-RU' AND topic_category = 'career'
);

UPDATE knowledge_items
SET text = 'Управитель 10-й дом (карьера/статус/видимый результат) (Венера) в аспекте «секстиль» с Марс показывает механику результата: как ресурсы/работа/карьера связываются с функцией Марс. Это легче согласовать усилия и быстрее конвертировать в навык/результат. Практика: закрепи 1 правило процесса (приоритеты, дедлайны, формат договорённостей) и 1 метрику, чтобы повторять успех и снижать риски.', is_active = 1, priority = 140, meta_json = '{}'
WHERE key = 'natal.house.10.ruler.venus.aspect.sextile.mars' AND locale = 'ru-RU' AND topic_category = 'career';

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.10.ruler.venus.aspect.sextile.mars', 'career', 'ru-RU', 'Управитель 10-й дом (карьера/статус/видимый результат) (Венера) в аспекте «секстиль» с Марс показывает механику результата: как ресурсы/работа/карьера связываются с функцией Марс. Это легче согласовать усилия и быстрее конвертировать в навык/результат. Практика: закрепи 1 правило процесса (приоритеты, дедлайны, формат договорённостей) и 1 метрику, чтобы повторять успех и снижать риски.', 140, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.10.ruler.venus.aspect.sextile.mars' AND locale = 'ru-RU' AND topic_category = 'career'
);

UPDATE knowledge_items
SET text = 'Аспекты управителя 10-го дома (Венера) показывают, через какие темы карьера «включается» сильнее: союзы, конфликты, рост, ограничения. Практика: выпиши 2 повторяющихся сюжета в работе (с кем/где/почему), и выбери управление: границы, формат коммуникации, сроки, критерии.', is_active = 1, priority = 140, meta_json = '{}'
WHERE key = 'natal.house.10.ruler.venus.aspects.present' AND locale = 'ru-RU' AND topic_category = 'career';

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.10.ruler.venus.aspects.present', 'career', 'ru-RU', 'Аспекты управителя 10-го дома (Венера) показывают, через какие темы карьера «включается» сильнее: союзы, конфликты, рост, ограничения. Практика: выпиши 2 повторяющихся сюжета в работе (с кем/где/почему), и выбери управление: границы, формат коммуникации, сроки, критерии.', 140, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.10.ruler.venus.aspects.present' AND locale = 'ru-RU' AND topic_category = 'career'
);

UPDATE knowledge_items
SET text = 'Юпитер в Рак в 7-й дом (партнёрства/клиенты/союзы): показывает, как ты строишь партнёрства и удерживаешь клиентов. Планета — рычаг (рост, масштаб, наставничество, международность), знак — стиль действий, дом — зона монетизации/ответственности. Практика: выбери 1 тип задач, где это сильнее всего, и добавь опору процесса (ритм, KPI, договорённости, ревью), чтобы результат стал стабильным.', is_active = 1, priority = 140, meta_json = '{}'
WHERE key = 'natal.planet.jupiter.sign.cancer.house.7' AND locale = 'ru-RU' AND topic_category = 'career';

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.planet.jupiter.sign.cancer.house.7', 'career', 'ru-RU', 'Юпитер в Рак в 7-й дом (партнёрства/клиенты/союзы): показывает, как ты строишь партнёрства и удерживаешь клиентов. Планета — рычаг (рост, масштаб, наставничество, международность), знак — стиль действий, дом — зона монетизации/ответственности. Практика: выбери 1 тип задач, где это сильнее всего, и добавь опору процесса (ритм, KPI, договорённости, ревью), чтобы результат стал стабильным.', 140, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.planet.jupiter.sign.cancer.house.7' AND locale = 'ru-RU' AND topic_category = 'career'
);

UPDATE knowledge_items
SET text = 'Марс в Стрелец в 12-й дом (закулисье/служение/психогигиена): показывает, как ты работаешь «за кадром» и поддерживаешь психогигиену. Планета — рычаг (инициатива, скорость, конкурентность, запуск), знак — стиль действий, дом — зона монетизации/ответственности. Практика: выбери 1 тип задач, где это сильнее всего, и добавь опору процесса (ритм, KPI, договорённости, ревью), чтобы результат стал стабильным.', is_active = 1, priority = 140, meta_json = '{}'
WHERE key = 'natal.planet.mars.sign.sagittarius.house.12' AND locale = 'ru-RU' AND topic_category = 'career';

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.planet.mars.sign.sagittarius.house.12', 'career', 'ru-RU', 'Марс в Стрелец в 12-й дом (закулисье/служение/психогигиена): показывает, как ты работаешь «за кадром» и поддерживаешь психогигиену. Планета — рычаг (инициатива, скорость, конкурентность, запуск), знак — стиль действий, дом — зона монетизации/ответственности. Практика: выбери 1 тип задач, где это сильнее всего, и добавь опору процесса (ритм, KPI, договорённости, ревью), чтобы результат стал стабильным.', 140, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.planet.mars.sign.sagittarius.house.12' AND locale = 'ru-RU' AND topic_category = 'career'
);

UPDATE knowledge_items
SET text = 'Меркурий в Козерог в 1-й дом (самопрезентация/инициатива): показывает, как ты проявляешь инициативу и производишь первое впечатление. Планета — рычаг (коммуникации, обучение, документы, аналитика), знак — стиль действий, дом — зона монетизации/ответственности. Практика: выбери 1 тип задач, где это сильнее всего, и добавь опору процесса (ритм, KPI, договорённости, ревью), чтобы результат стал стабильным.', is_active = 1, priority = 140, meta_json = '{}'
WHERE key = 'natal.planet.mercury.sign.capricorn.house.1' AND locale = 'ru-RU' AND topic_category = 'career';

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.planet.mercury.sign.capricorn.house.1', 'career', 'ru-RU', 'Меркурий в Козерог в 1-й дом (самопрезентация/инициатива): показывает, как ты проявляешь инициативу и производишь первое впечатление. Планета — рычаг (коммуникации, обучение, документы, аналитика), знак — стиль действий, дом — зона монетизации/ответственности. Практика: выбери 1 тип задач, где это сильнее всего, и добавь опору процесса (ритм, KPI, договорённости, ревью), чтобы результат стал стабильным.', 140, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.planet.mercury.sign.capricorn.house.1' AND locale = 'ru-RU' AND topic_category = 'career'
);

UPDATE knowledge_items
SET text = 'Луна в Водолей в 2-й дом (деньги/ресурсы/монетизация): показывает, как ты монетизируешь навыки и управляешь ресурсами. Планета — рычаг (устойчивость, забота о ресурсе и клиентов), знак — стиль действий, дом — зона монетизации/ответственности. Практика: выбери 1 тип задач, где это сильнее всего, и добавь опору процесса (ритм, KPI, договорённости, ревью), чтобы результат стал стабильным.', is_active = 1, priority = 140, meta_json = '{}'
WHERE key = 'natal.planet.moon.sign.aquarius.house.2' AND locale = 'ru-RU' AND topic_category = 'career';

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.planet.moon.sign.aquarius.house.2', 'career', 'ru-RU', 'Луна в Водолей в 2-й дом (деньги/ресурсы/монетизация): показывает, как ты монетизируешь навыки и управляешь ресурсами. Планета — рычаг (устойчивость, забота о ресурсе и клиентов), знак — стиль действий, дом — зона монетизации/ответственности. Практика: выбери 1 тип задач, где это сильнее всего, и добавь опору процесса (ритм, KPI, договорённости, ревью), чтобы результат стал стабильным.', 140, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.planet.moon.sign.aquarius.house.2' AND locale = 'ru-RU' AND topic_category = 'career'
);

UPDATE knowledge_items
SET text = 'Нептун в Козерог в 1-й дом (самопрезентация/инициатива): показывает, как ты проявляешь инициативу и производишь первое впечатление. Планета — рычаг (видение, смысл, креатив, эмпатия, риск тумана), знак — стиль действий, дом — зона монетизации/ответственности. Практика: выбери 1 тип задач, где это сильнее всего, и добавь опору процесса (ритм, KPI, договорённости, ревью), чтобы результат стал стабильным.', is_active = 1, priority = 140, meta_json = '{}'
WHERE key = 'natal.planet.neptune.sign.capricorn.house.1' AND locale = 'ru-RU' AND topic_category = 'career';

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.planet.neptune.sign.capricorn.house.1', 'career', 'ru-RU', 'Нептун в Козерог в 1-й дом (самопрезентация/инициатива): показывает, как ты проявляешь инициативу и производишь первое впечатление. Планета — рычаг (видение, смысл, креатив, эмпатия, риск тумана), знак — стиль действий, дом — зона монетизации/ответственности. Практика: выбери 1 тип задач, где это сильнее всего, и добавь опору процесса (ритм, KPI, договорённости, ревью), чтобы результат стал стабильным.', 140, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.planet.neptune.sign.capricorn.house.1' AND locale = 'ru-RU' AND topic_category = 'career'
);

UPDATE knowledge_items
SET text = 'Плутон в Скорпион в 11-й дом (сеть/команды/сообщество): показывает, как ты работаешь с сетью, командой и рынком. Планета — рычаг (влияние, трансформация, кризис-менеджмент), знак — стиль действий, дом — зона монетизации/ответственности. Практика: выбери 1 тип задач, где это сильнее всего, и добавь опору процесса (ритм, KPI, договорённости, ревью), чтобы результат стал стабильным.', is_active = 1, priority = 140, meta_json = '{}'
WHERE key = 'natal.planet.pluto.sign.scorpio.house.11' AND locale = 'ru-RU' AND topic_category = 'career';

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.planet.pluto.sign.scorpio.house.11', 'career', 'ru-RU', 'Плутон в Скорпион в 11-й дом (сеть/команды/сообщество): показывает, как ты работаешь с сетью, командой и рынком. Планета — рычаг (влияние, трансформация, кризис-менеджмент), знак — стиль действий, дом — зона монетизации/ответственности. Практика: выбери 1 тип задач, где это сильнее всего, и добавь опору процесса (ритм, KPI, договорённости, ревью), чтобы результат стал стабильным.', 140, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.planet.pluto.sign.scorpio.house.11' AND locale = 'ru-RU' AND topic_category = 'career'
);

UPDATE knowledge_items
SET text = 'Сатурн в Козерог в 1-й дом (самопрезентация/инициатива): показывает, как ты проявляешь инициативу и производишь первое впечатление. Планета — рычаг (структура, дисциплина, ответственность, долгий цикл), знак — стиль действий, дом — зона монетизации/ответственности. Практика: выбери 1 тип задач, где это сильнее всего, и добавь опору процесса (ритм, KPI, договорённости, ревью), чтобы результат стал стабильным.', is_active = 1, priority = 140, meta_json = '{}'
WHERE key = 'natal.planet.saturn.sign.capricorn.house.1' AND locale = 'ru-RU' AND topic_category = 'career';

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.planet.saturn.sign.capricorn.house.1', 'career', 'ru-RU', 'Сатурн в Козерог в 1-й дом (самопрезентация/инициатива): показывает, как ты проявляешь инициативу и производишь первое впечатление. Планета — рычаг (структура, дисциплина, ответственность, долгий цикл), знак — стиль действий, дом — зона монетизации/ответственности. Практика: выбери 1 тип задач, где это сильнее всего, и добавь опору процесса (ритм, KPI, договорённости, ревью), чтобы результат стал стабильным.', 140, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.planet.saturn.sign.capricorn.house.1' AND locale = 'ru-RU' AND topic_category = 'career'
);

UPDATE knowledge_items
SET text = 'Солнце в Козерог в 1-й дом (самопрезентация/инициатива): показывает, как ты проявляешь инициативу и производишь первое впечатление. Планета — рычаг (роль и лидерство), знак — стиль действий, дом — зона монетизации/ответственности. Практика: выбери 1 тип задач, где это сильнее всего, и добавь опору процесса (ритм, KPI, договорённости, ревью), чтобы результат стал стабильным.', is_active = 1, priority = 140, meta_json = '{}'
WHERE key = 'natal.planet.sun.sign.capricorn.house.1' AND locale = 'ru-RU' AND topic_category = 'career';

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.planet.sun.sign.capricorn.house.1', 'career', 'ru-RU', 'Солнце в Козерог в 1-й дом (самопрезентация/инициатива): показывает, как ты проявляешь инициативу и производишь первое впечатление. Планета — рычаг (роль и лидерство), знак — стиль действий, дом — зона монетизации/ответственности. Практика: выбери 1 тип задач, где это сильнее всего, и добавь опору процесса (ритм, KPI, договорённости, ревью), чтобы результат стал стабильным.', 140, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.planet.sun.sign.capricorn.house.1' AND locale = 'ru-RU' AND topic_category = 'career'
);

UPDATE knowledge_items
SET text = 'Венера в Водолей в 2-й дом (деньги/ресурсы/монетизация): показывает, как ты монетизируешь навыки и управляешь ресурсами. Планета — рычаг (ценность, отношения, переговоры, эстетика/бренд), знак — стиль действий, дом — зона монетизации/ответственности. Практика: выбери 1 тип задач, где это сильнее всего, и добавь опору процесса (ритм, KPI, договорённости, ревью), чтобы результат стал стабильным.', is_active = 1, priority = 140, meta_json = '{}'
WHERE key = 'natal.planet.venus.sign.aquarius.house.2' AND locale = 'ru-RU' AND topic_category = 'career';

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.planet.venus.sign.aquarius.house.2', 'career', 'ru-RU', 'Венера в Водолей в 2-й дом (деньги/ресурсы/монетизация): показывает, как ты монетизируешь навыки и управляешь ресурсами. Планета — рычаг (ценность, отношения, переговоры, эстетика/бренд), знак — стиль действий, дом — зона монетизации/ответственности. Практика: выбери 1 тип задач, где это сильнее всего, и добавь опору процесса (ритм, KPI, договорённости, ревью), чтобы результат стал стабильным.', 140, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.planet.venus.sign.aquarius.house.2' AND locale = 'ru-RU' AND topic_category = 'career'
);

UPDATE knowledge_items
SET text = 'Группа планет: личные (Меркурий/Венера/Марс) (кол-во = 3). В карьере это индикатор, какая «подсистема» чаще ведёт решения: мотивация и направление (светила), навыки и сделки (личные), структура и статус (социальные), инновации и видение (высшие). Практика: проверь, поддерживает ли текущая роль твою доминирующую подсистему.', is_active = 1, priority = 140, meta_json = '{}'
WHERE key = 'natal.planets.group.inner.count.3' AND locale = 'ru-RU' AND topic_category = 'career';

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.planets.group.inner.count.3', 'career', 'ru-RU', 'Группа планет: личные (Меркурий/Венера/Марс) (кол-во = 3). В карьере это индикатор, какая «подсистема» чаще ведёт решения: мотивация и направление (светила), навыки и сделки (личные), структура и статус (социальные), инновации и видение (высшие). Практика: проверь, поддерживает ли текущая роль твою доминирующую подсистему.', 140, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.planets.group.inner.count.3' AND locale = 'ru-RU' AND topic_category = 'career'
);

UPDATE knowledge_items
SET text = 'Группа планет: светила (Солнце+Луна) (кол-во = 2). В карьере это индикатор, какая «подсистема» чаще ведёт решения: мотивация и направление (светила), навыки и сделки (личные), структура и статус (социальные), инновации и видение (высшие). Практика: проверь, поддерживает ли текущая роль твою доминирующую подсистему.', is_active = 1, priority = 140, meta_json = '{}'
WHERE key = 'natal.planets.group.luminaries.count.2' AND locale = 'ru-RU' AND topic_category = 'career';

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.planets.group.luminaries.count.2', 'career', 'ru-RU', 'Группа планет: светила (Солнце+Луна) (кол-во = 2). В карьере это индикатор, какая «подсистема» чаще ведёт решения: мотивация и направление (светила), навыки и сделки (личные), структура и статус (социальные), инновации и видение (высшие). Практика: проверь, поддерживает ли текущая роль твою доминирующую подсистему.', 140, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.planets.group.luminaries.count.2' AND locale = 'ru-RU' AND topic_category = 'career'
);

UPDATE knowledge_items
SET text = 'Группа планет: высшие (Уран/Нептун/Плутон) (кол-во = 3). В карьере это индикатор, какая «подсистема» чаще ведёт решения: мотивация и направление (светила), навыки и сделки (личные), структура и статус (социальные), инновации и видение (высшие). Практика: проверь, поддерживает ли текущая роль твою доминирующую подсистему.', is_active = 1, priority = 140, meta_json = '{}'
WHERE key = 'natal.planets.group.outer.count.3' AND locale = 'ru-RU' AND topic_category = 'career';

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.planets.group.outer.count.3', 'career', 'ru-RU', 'Группа планет: высшие (Уран/Нептун/Плутон) (кол-во = 3). В карьере это индикатор, какая «подсистема» чаще ведёт решения: мотивация и направление (светила), навыки и сделки (личные), структура и статус (социальные), инновации и видение (высшие). Практика: проверь, поддерживает ли текущая роль твою доминирующую подсистему.', 140, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.planets.group.outer.count.3' AND locale = 'ru-RU' AND topic_category = 'career'
);

UPDATE knowledge_items
SET text = 'Группа планет: социальные (Юпитер/Сатурн) (кол-во = 2). В карьере это индикатор, какая «подсистема» чаще ведёт решения: мотивация и направление (светила), навыки и сделки (личные), структура и статус (социальные), инновации и видение (высшие). Практика: проверь, поддерживает ли текущая роль твою доминирующую подсистему.', is_active = 1, priority = 140, meta_json = '{}'
WHERE key = 'natal.planets.group.social.count.2' AND locale = 'ru-RU' AND topic_category = 'career';

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.planets.group.social.count.2', 'career', 'ru-RU', 'Группа планет: социальные (Юпитер/Сатурн) (кол-во = 2). В карьере это индикатор, какая «подсистема» чаще ведёт решения: мотивация и направление (светила), навыки и сделки (личные), структура и статус (социальные), инновации и видение (высшие). Практика: проверь, поддерживает ли текущая роль твою доминирующую подсистему.', 140, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.planets.group.social.count.2' AND locale = 'ru-RU' AND topic_category = 'career'
);

COMMIT;

