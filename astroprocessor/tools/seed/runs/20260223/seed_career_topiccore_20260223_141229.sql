-- AUTO-GENERATED. DO NOT EDIT BY HAND.

-- Overrides from debug shortest used blocks (topic_category=career)

-- Source JSON: C:/Projects/superastro/debug_career_ru_160_20260223_141229_mini_topiccore.json

-- Filter: len(text)<= 420, max_keys=250

BEGIN;

UPDATE knowledge_items
SET text = 'MC (Середина Неба) — вектор карьеры и общественного образа: как ты хочешь быть видим(а) и за что тебя ценят «снаружи». Он связан с направлением роста, статусом и типом задач, где проще получать признание. Практика: сформулируй 1 фразу «за что я хочу быть известен(на)» и проверь, какие действия реально поддерживают её каждую неделю.', is_active = 1, priority = 140, meta_json = '{}'
WHERE key = 'natal.angle.mc' AND locale = 'ru-RU' AND topic_category = 'career';

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.angle.mc', 'career', 'ru-RU', 'MC (Середина Неба) — вектор карьеры и общественного образа: как ты хочешь быть видим(а) и за что тебя ценят «снаружи». Он связан с направлением роста, статусом и типом задач, где проще получать признание. Практика: сформулируй 1 фразу «за что я хочу быть известен(на)» и проверь, какие действия реально поддерживают её каждую неделю.', 140, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.angle.mc' AND locale = 'ru-RU' AND topic_category = 'career'
);

UPDATE knowledge_items
SET text = 'MC в знаке Стрелец: карьерный стиль и способ заявлять о результате окрашены качествами знака. Сильная сторона: широта взглядов, смысл, честность, рост. Риск: прямолинейность, обещания без расчёта, беспокойство. Практика: выбери 1 KPI результата (качество/скорость/доход/влияние) и веди его 14 дней, удерживая сильную сторону без перегиба.', is_active = 1, priority = 140, meta_json = '{}'
WHERE key = 'natal.angle.mc.sign.sagittarius' AND locale = 'ru-RU' AND topic_category = 'career';

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.angle.mc.sign.sagittarius', 'career', 'ru-RU', 'MC в знаке Стрелец: карьерный стиль и способ заявлять о результате окрашены качествами знака. Сильная сторона: широта взглядов, смысл, честность, рост. Риск: прямолинейность, обещания без расчёта, беспокойство. Практика: выбери 1 KPI результата (качество/скорость/доход/влияние) и веди его 14 дней, удерживая сильную сторону без перегиба.', 140, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.angle.mc.sign.sagittarius' AND locale = 'ru-RU' AND topic_category = 'career'
);

UPDATE knowledge_items
SET text = 'Карьерный маркер: показывает, где проще получить результат и что мешает стабильности. Практика: выбери 1 конкретный навык/процесс на 2 недели (приоритеты, дедлайны, коммуникации, контроль качества) и замерь эффект по метрикам: скорость, качество, доход, устойчивость.', is_active = 1, priority = 140, meta_json = '{}'
WHERE key = 'natal.career.generic' AND locale = 'ru-RU' AND topic_category = 'career';

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.career.generic', 'career', 'ru-RU', 'Карьерный маркер: показывает, где проще получить результат и что мешает стабильности. Практика: выбери 1 конкретный навык/процесс на 2 недели (приоритеты, дедлайны, коммуникации, контроль качества) и замерь эффект по метрикам: скорость, качество, доход, устойчивость.', 140, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.career.generic' AND locale = 'ru-RU' AND topic_category = 'career'
);

UPDATE knowledge_items
SET text = '10 дом — зона карьеры, статуса и видимого результата: то, как ты строишь достижения и какие роли легче закрепляются. Это не только работа, но и репутация: за что тебя считают «надёжным(ой)» и где ожидают ответственности. Практика: выдели 1 ключевой результат на месяц и привяжи к нему еженедельный шаг (план → выполнение → обзор).', is_active = 1, priority = 140, meta_json = '{}'
WHERE key = 'natal.house.10' AND locale = 'ru-RU' AND topic_category = 'career';

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.10', 'career', 'ru-RU', '10 дом — зона карьеры, статуса и видимого результата: то, как ты строишь достижения и какие роли легче закрепляются. Это не только работа, но и репутация: за что тебя считают «надёжным(ой)» и где ожидают ответственности. Практика: выдели 1 ключевой результат на месяц и привяжи к нему еженедельный шаг (план → выполнение → обзор).', 140, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.10' AND locale = 'ru-RU' AND topic_category = 'career'
);

UPDATE knowledge_items
SET text = 'Куспид 10 дома в Стрелец: способ добиваться статуса и результата идёт через качества Стрелец. Сильная сторона: широта взглядов, смысл, честность, рост. Риск: прямолинейность, обещания без расчёта, беспокойство. Практика: выбери 1 привычку «по знаку» и закрепи её как рабочий стандарт (как принимаю решения, как сдаю результат, как общаюсь).', is_active = 1, priority = 140, meta_json = '{}'
WHERE key = 'natal.house.10.cusp.sign.sagittarius' AND locale = 'ru-RU' AND topic_category = 'career';

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.10.cusp.sign.sagittarius', 'career', 'ru-RU', 'Куспид 10 дома в Стрелец: способ добиваться статуса и результата идёт через качества Стрелец. Сильная сторона: широта взглядов, смысл, честность, рост. Риск: прямолинейность, обещания без расчёта, беспокойство. Практика: выбери 1 привычку «по знаку» и закрепи её как рабочий стандарт (как принимаю решения, как сдаю результат, как общаюсь).', 140, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.10.cusp.sign.sagittarius' AND locale = 'ru-RU' AND topic_category = 'career'
);

UPDATE knowledge_items
SET text = 'Меркурий в 10 доме усиливает видимость этой функции в карьере: люди считывают тебя через коммуникации, анализ, тексты, переговоры. Сильная сторона — проще получать признание за результаты по этой теме. Риск — перегружаться ожиданиями или застревать в роли. Практика: выбери 1 стандарт качества/границ (что делаю всегда, а что не беру) и закрепи его как правило.', is_active = 1, priority = 140, meta_json = '{}'
WHERE key = 'natal.house.10.planet.mercury' AND locale = 'ru-RU' AND topic_category = 'career';

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.10.planet.mercury', 'career', 'ru-RU', 'Меркурий в 10 доме усиливает видимость этой функции в карьере: люди считывают тебя через коммуникации, анализ, тексты, переговоры. Сильная сторона — проще получать признание за результаты по этой теме. Риск — перегружаться ожиданиями или застревать в роли. Практика: выбери 1 стандарт качества/границ (что делаю всегда, а что не беру) и закрепи его как правило.', 140, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.10.planet.mercury' AND locale = 'ru-RU' AND topic_category = 'career'
);

UPDATE knowledge_items
SET text = 'Солнце в 10 доме усиливает видимость этой функции в карьере: люди считывают тебя через лидерство, видимость, роль и ответственность. Сильная сторона — проще получать признание за результаты по этой теме. Риск — перегружаться ожиданиями или застревать в роли. Практика: выбери 1 стандарт качества/границ (что делаю всегда, а что не беру) и закрепи его как правило.', is_active = 1, priority = 140, meta_json = '{}'
WHERE key = 'natal.house.10.planet.sun' AND locale = 'ru-RU' AND topic_category = 'career';

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.10.planet.sun', 'career', 'ru-RU', 'Солнце в 10 доме усиливает видимость этой функции в карьере: люди считывают тебя через лидерство, видимость, роль и ответственность. Сильная сторона — проще получать признание за результаты по этой теме. Риск — перегружаться ожиданиями или застревать в роли. Практика: выбери 1 стандарт качества/границ (что делаю всегда, а что не беру) и закрепи его как правило.', 140, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.10.planet.sun' AND locale = 'ru-RU' AND topic_category = 'career'
);

UPDATE knowledge_items
SET text = 'Управитель 10 дома — ключ к карьерной траектории: через какие мотивы и навыки ты выходишь на статус и признание. Он показывает, что укрепляет репутацию и какие условия делают рост стабильным. Практика: найди 1 повторяющийся карьерный сценарий (успех/ошибка) и выдели правило, которое ты готов(а) соблюдать всегда.', is_active = 1, priority = 140, meta_json = '{}'
WHERE key = 'natal.house.10.ruler.any' AND locale = 'ru-RU' AND topic_category = 'career';

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.10.ruler.any', 'career', 'ru-RU', 'Управитель 10 дома — ключ к карьерной траектории: через какие мотивы и навыки ты выходишь на статус и признание. Он показывает, что укрепляет репутацию и какие условия делают рост стабильным. Практика: найди 1 повторяющийся карьерный сценарий (успех/ошибка) и выдели правило, которое ты готов(а) соблюдать всегда.', 140, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.10.ruler.any' AND locale = 'ru-RU' AND topic_category = 'career'
);

UPDATE knowledge_items
SET text = 'Управитель 10 дома — Юпитер: карьерный рост лучше идёт через масштаб, наставничество, репутация. Сильная сторона — можно сознательно развивать эту функцию как главный рычаг. Риск — перегибать роль (например, давить, спасать, слишком контролировать). Практика: выбери 1 навык по этой планете и прокачай его 14 дней с измеримой метрикой.', is_active = 1, priority = 140, meta_json = '{}'
WHERE key = 'natal.house.10.ruler.jupiter' AND locale = 'ru-RU' AND topic_category = 'career';

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.10.ruler.jupiter', 'career', 'ru-RU', 'Управитель 10 дома — Юпитер: карьерный рост лучше идёт через масштаб, наставничество, репутация. Сильная сторона — можно сознательно развивать эту функцию как главный рычаг. Риск — перегибать роль (например, давить, спасать, слишком контролировать). Практика: выбери 1 навык по этой планете и прокачай его 14 дней с измеримой метрикой.', 140, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.10.ruler.jupiter' AND locale = 'ru-RU' AND topic_category = 'career'
);

UPDATE knowledge_items
SET text = 'Управитель 10 дома (Юпитер) в аспекте секстиль с Марс: это влияет на карьерные решения и стиль достижения. Обычно это даёт ресурс и проще превращается в навык/результат. Практика: опиши 1 повторяющийся карьерный сценарий (триггер → реакция → результат) и добавь одно правило, которое стабилизирует итог.', is_active = 1, priority = 140, meta_json = '{}'
WHERE key = 'natal.house.10.ruler.jupiter.aspect.sextile.mars' AND locale = 'ru-RU' AND topic_category = 'career';

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.10.ruler.jupiter.aspect.sextile.mars', 'career', 'ru-RU', 'Управитель 10 дома (Юпитер) в аспекте секстиль с Марс: это влияет на карьерные решения и стиль достижения. Обычно это даёт ресурс и проще превращается в навык/результат. Практика: опиши 1 повторяющийся карьерный сценарий (триггер → реакция → результат) и добавь одно правило, которое стабилизирует итог.', 140, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.10.ruler.jupiter.aspect.sextile.mars' AND locale = 'ru-RU' AND topic_category = 'career'
);

UPDATE knowledge_items
SET text = 'Аспекты управителя 10 дома (Юпитер) показывают, что усиливает или усложняет карьерную реализацию. Гармоничные аспекты дают естественный ресурс, напряжённые требуют стратегии и навыка управления рисками. Практика: выбери 1 стрессовую точку (дедлайн/конфликт/неясные ожидания) и заранее задай правило, как ты действуешь в таких ситуациях.', is_active = 1, priority = 140, meta_json = '{}'
WHERE key = 'natal.house.10.ruler.jupiter.aspects.present' AND locale = 'ru-RU' AND topic_category = 'career';

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.10.ruler.jupiter.aspects.present', 'career', 'ru-RU', 'Аспекты управителя 10 дома (Юпитер) показывают, что усиливает или усложняет карьерную реализацию. Гармоничные аспекты дают естественный ресурс, напряжённые требуют стратегии и навыка управления рисками. Практика: выбери 1 стрессовую точку (дедлайн/конфликт/неясные ожидания) и заранее задай правило, как ты действуешь в таких ситуациях.', 140, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.10.ruler.jupiter.aspects.present' AND locale = 'ru-RU' AND topic_category = 'career'
);

UPDATE knowledge_items
SET text = 'Юпитер как управитель 10 дома: стиль карьеры зависит от того, в каком «режиме» проявляется Юпитер (знак/аспекты). Сильная сторона — можно точнее настроить позиционирование и рабочий стиль. Практика: перед важной задачей выбери 1 настройку поведения (структура/темп/диалог/видимость) и удерживай её до сдачи результата.', is_active = 1, priority = 140, meta_json = '{}'
WHERE key = 'natal.house.10.ruler.jupiter.sign.any' AND locale = 'ru-RU' AND topic_category = 'career';

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.10.ruler.jupiter.sign.any', 'career', 'ru-RU', 'Юпитер как управитель 10 дома: стиль карьеры зависит от того, в каком «режиме» проявляется Юпитер (знак/аспекты). Сильная сторона — можно точнее настроить позиционирование и рабочий стиль. Практика: перед важной задачей выбери 1 настройку поведения (структура/темп/диалог/видимость) и удерживай её до сдачи результата.', 140, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.10.ruler.jupiter.sign.any' AND locale = 'ru-RU' AND topic_category = 'career'
);

UPDATE knowledge_items
SET text = 'Доминирует стихия Огонь: она чаще всего ведёт тебя к решениям. Сильная сторона — быстро включаешься в «родной» стиль. Риск — недооценивать противоположные подходы. Практика: добавь один компенсирующий шаг из другой стихии (план/контакт/чувства/действие) перед финальным выбором.', is_active = 1, priority = 140, meta_json = '{}'
WHERE key = 'natal.elements.dominant.fire' AND locale = 'ru-RU' AND topic_category = 'career';

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.elements.dominant.fire', 'career', 'ru-RU', 'Доминирует стихия Огонь: она чаще всего ведёт тебя к решениям. Сильная сторона — быстро включаешься в «родной» стиль. Риск — недооценивать противоположные подходы. Практика: добавь один компенсирующий шаг из другой стихии (план/контакт/чувства/действие) перед финальным выбором.', 140, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.elements.dominant.fire' AND locale = 'ru-RU' AND topic_category = 'career'
);

UPDATE knowledge_items
SET text = 'Доминирует модальность фиксированная: сильные стороны — устойчивость, доведение до результата, верность выбранному. Риски — застревание, сопротивление переменам. Практика: выбери один процесс, где нужен баланс, и добавь недостающую стадию (старт/стабилизация/адаптация) на неделю.', is_active = 1, priority = 140, meta_json = '{}'
WHERE key = 'natal.modality.dominant.fixed' AND locale = 'ru-RU' AND topic_category = 'career';

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.modality.dominant.fixed', 'career', 'ru-RU', 'Доминирует модальность фиксированная: сильные стороны — устойчивость, доведение до результата, верность выбранному. Риски — застревание, сопротивление переменам. Практика: выбери один процесс, где нужен баланс, и добавь недостающую стадию (старт/стабилизация/адаптация) на неделю.', 140, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.modality.dominant.fixed' AND locale = 'ru-RU' AND topic_category = 'career'
);

UPDATE knowledge_items
SET text = 'Дефицит стихии Вода: этот способ реагирования может требовать сознательной тренировки. Не слабость, а зона развития: её легче встроить через простые ритуалы. Практика: выбери 1 привычку на 10 минут в день, которая добавляет {er} (например: телесная рутина, общение, эмоции, действие).', is_active = 1, priority = 140, meta_json = '{}'
WHERE key = 'natal.elements.deficient.water' AND locale = 'ru-RU' AND topic_category = 'career';

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.elements.deficient.water', 'career', 'ru-RU', 'Дефицит стихии Вода: этот способ реагирования может требовать сознательной тренировки. Не слабость, а зона развития: её легче встроить через простые ритуалы. Практика: выбери 1 привычку на 10 минут в день, которая добавляет {er} (например: телесная рутина, общение, эмоции, действие).', 140, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.elements.deficient.water' AND locale = 'ru-RU' AND topic_category = 'career'
);

UPDATE knowledge_items
SET text = 'Стихия Вода выражена на уровне 1. Это задаёт привычный способ включаться в жизнь: через смысл/действие (Огонь), практику/материальность (Земля), идеи/контакты (Воздух), чувства/интуицию (Вода). Практика: в сложной ситуации попробуй «перевести» задачу на язык этой стихии и посмотри, что упростится.', is_active = 1, priority = 140, meta_json = '{}'
WHERE key = 'natal.elements.water.count.1' AND locale = 'ru-RU' AND topic_category = 'career';

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.elements.water.count.1', 'career', 'ru-RU', 'Стихия Вода выражена на уровне 1. Это задаёт привычный способ включаться в жизнь: через смысл/действие (Огонь), практику/материальность (Земля), идеи/контакты (Воздух), чувства/интуицию (Вода). Практика: в сложной ситуации попробуй «перевести» задачу на язык этой стихии и посмотри, что упростится.', 140, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.elements.water.count.1' AND locale = 'ru-RU' AND topic_category = 'career'
);

UPDATE knowledge_items
SET text = 'Стихия Земля выражена на уровне 3. Это задаёт привычный способ включаться в жизнь: через смысл/действие (Огонь), практику/материальность (Земля), идеи/контакты (Воздух), чувства/интуицию (Вода). Практика: в сложной ситуации попробуй «перевести» задачу на язык этой стихии и посмотри, что упростится.', is_active = 1, priority = 140, meta_json = '{}'
WHERE key = 'natal.elements.earth.count.3' AND locale = 'ru-RU' AND topic_category = 'career';

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.elements.earth.count.3', 'career', 'ru-RU', 'Стихия Земля выражена на уровне 3. Это задаёт привычный способ включаться в жизнь: через смысл/действие (Огонь), практику/материальность (Земля), идеи/контакты (Воздух), чувства/интуицию (Вода). Практика: в сложной ситуации попробуй «перевести» задачу на язык этой стихии и посмотри, что упростится.', 140, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.elements.earth.count.3' AND locale = 'ru-RU' AND topic_category = 'career'
);

UPDATE knowledge_items
SET text = 'Стихия Огонь выражена на уровне 3. Это задаёт привычный способ включаться в жизнь: через смысл/действие (Огонь), практику/материальность (Земля), идеи/контакты (Воздух), чувства/интуицию (Вода). Практика: в сложной ситуации попробуй «перевести» задачу на язык этой стихии и посмотри, что упростится.', is_active = 1, priority = 140, meta_json = '{}'
WHERE key = 'natal.elements.fire.count.3' AND locale = 'ru-RU' AND topic_category = 'career';

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.elements.fire.count.3', 'career', 'ru-RU', 'Стихия Огонь выражена на уровне 3. Это задаёт привычный способ включаться в жизнь: через смысл/действие (Огонь), практику/материальность (Земля), идеи/контакты (Воздух), чувства/интуицию (Вода). Практика: в сложной ситуации попробуй «перевести» задачу на язык этой стихии и посмотри, что упростится.', 140, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.elements.fire.count.3' AND locale = 'ru-RU' AND topic_category = 'career'
);

UPDATE knowledge_items
SET text = 'Стихия Воздух выражена на уровне 3. Это задаёт привычный способ включаться в жизнь: через смысл/действие (Огонь), практику/материальность (Земля), идеи/контакты (Воздух), чувства/интуицию (Вода). Практика: в сложной ситуации попробуй «перевести» задачу на язык этой стихии и посмотри, что упростится.', is_active = 1, priority = 140, meta_json = '{}'
WHERE key = 'natal.elements.air.count.3' AND locale = 'ru-RU' AND topic_category = 'career';

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.elements.air.count.3', 'career', 'ru-RU', 'Стихия Воздух выражена на уровне 3. Это задаёт привычный способ включаться в жизнь: через смысл/действие (Огонь), практику/материальность (Земля), идеи/контакты (Воздух), чувства/интуицию (Вода). Практика: в сложной ситуации попробуй «перевести» задачу на язык этой стихии и посмотри, что упростится.', 140, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.elements.air.count.3' AND locale = 'ru-RU' AND topic_category = 'career'
);

UPDATE knowledge_items
SET text = 'Рак заметно проявлен в карте. Сильные стороны: эмпатия, забота, интуиция, память. Риски перекоса: ранимость, обидчивость, уход в защиту. Практика: выбери 1 сильную сторону и 1 риск и закрепи их в конкретном действии на неделю (что усиливаю, что ограничиваю, по каким признакам пойму, что баланс соблюдён).', is_active = 1, priority = 140, meta_json = '{}'
WHERE key = 'natal.sign.cancer.present' AND locale = 'ru-RU' AND topic_category = 'career';

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.sign.cancer.present', 'career', 'ru-RU', 'Рак заметно проявлен в карте. Сильные стороны: эмпатия, забота, интуиция, память. Риски перекоса: ранимость, обидчивость, уход в защиту. Практика: выбери 1 сильную сторону и 1 риск и закрепи их в конкретном действии на неделю (что усиливаю, что ограничиваю, по каким признакам пойму, что баланс соблюдён).', 140, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.sign.cancer.present' AND locale = 'ru-RU' AND topic_category = 'career'
);

UPDATE knowledge_items
SET text = 'Дева заметно проявлен в карте. Сильные стороны: точность, анализ, полезность, порядок. Риски перекоса: критичность, тревожность, перфекционизм. Практика: выбери 1 сильную сторону и 1 риск и закрепи их в конкретном действии на неделю (что усиливаю, что ограничиваю, по каким признакам пойму, что баланс соблюдён).', is_active = 1, priority = 140, meta_json = '{}'
WHERE key = 'natal.sign.virgo.present' AND locale = 'ru-RU' AND topic_category = 'career';

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.sign.virgo.present', 'career', 'ru-RU', 'Дева заметно проявлен в карте. Сильные стороны: точность, анализ, полезность, порядок. Риски перекоса: критичность, тревожность, перфекционизм. Практика: выбери 1 сильную сторону и 1 риск и закрепи их в конкретном действии на неделю (что усиливаю, что ограничиваю, по каким признакам пойму, что баланс соблюдён).', 140, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.sign.virgo.present' AND locale = 'ru-RU' AND topic_category = 'career'
);

UPDATE knowledge_items
SET text = 'Близнецы заметно проявлен в карте. Сильные стороны: гибкость ума, коммуникации, обучение. Риски перекоса: распыление, поверхностность, нервозность. Практика: выбери 1 сильную сторону и 1 риск и закрепи их в конкретном действии на неделю (что усиливаю, что ограничиваю, по каким признакам пойму, что баланс соблюдён).', is_active = 1, priority = 140, meta_json = '{}'
WHERE key = 'natal.sign.gemini.present' AND locale = 'ru-RU' AND topic_category = 'career';

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.sign.gemini.present', 'career', 'ru-RU', 'Близнецы заметно проявлен в карте. Сильные стороны: гибкость ума, коммуникации, обучение. Риски перекоса: распыление, поверхностность, нервозность. Практика: выбери 1 сильную сторону и 1 риск и закрепи их в конкретном действии на неделю (что усиливаю, что ограничиваю, по каким признакам пойму, что баланс соблюдён).', 140, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.sign.gemini.present' AND locale = 'ru-RU' AND topic_category = 'career'
);

UPDATE knowledge_items
SET text = 'Телец заметно проявлен в карте. Сильные стороны: устойчивость, практичность, вкус и качество. Риски перекоса: инертность, упрямство, страх перемен. Практика: выбери 1 сильную сторону и 1 риск и закрепи их в конкретном действии на неделю (что усиливаю, что ограничиваю, по каким признакам пойму, что баланс соблюдён).', is_active = 1, priority = 140, meta_json = '{}'
WHERE key = 'natal.sign.taurus.present' AND locale = 'ru-RU' AND topic_category = 'career';

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.sign.taurus.present', 'career', 'ru-RU', 'Телец заметно проявлен в карте. Сильные стороны: устойчивость, практичность, вкус и качество. Риски перекоса: инертность, упрямство, страх перемен. Практика: выбери 1 сильную сторону и 1 риск и закрепи их в конкретном действии на неделю (что усиливаю, что ограничиваю, по каким признакам пойму, что баланс соблюдён).', 140, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.sign.taurus.present' AND locale = 'ru-RU' AND topic_category = 'career'
);

UPDATE knowledge_items
SET text = 'Лев заметно проявлен в карте. Сильные стороны: самовыражение, лидерство, творчество. Риски перекоса: самолюбие, драматизация, зависимость от оценки. Практика: выбери 1 сильную сторону и 1 риск и закрепи их в конкретном действии на неделю (что усиливаю, что ограничиваю, по каким признакам пойму, что баланс соблюдён).', is_active = 1, priority = 140, meta_json = '{}'
WHERE key = 'natal.sign.leo.present' AND locale = 'ru-RU' AND topic_category = 'career';

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.sign.leo.present', 'career', 'ru-RU', 'Лев заметно проявлен в карте. Сильные стороны: самовыражение, лидерство, творчество. Риски перекоса: самолюбие, драматизация, зависимость от оценки. Практика: выбери 1 сильную сторону и 1 риск и закрепи их в конкретном действии на неделю (что усиливаю, что ограничиваю, по каким признакам пойму, что баланс соблюдён).', 140, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.sign.leo.present' AND locale = 'ru-RU' AND topic_category = 'career'
);

UPDATE knowledge_items
SET text = 'Рыбы заметно проявлен в карте. Сильные стороны: воображение, сострадание, тонкость, вдохновение. Риски перекоса: размытые границы, избегание, иллюзии. Практика: выбери 1 сильную сторону и 1 риск и закрепи их в конкретном действии на неделю (что усиливаю, что ограничиваю, по каким признакам пойму, что баланс соблюдён).', is_active = 1, priority = 140, meta_json = '{}'
WHERE key = 'natal.sign.pisces.present' AND locale = 'ru-RU' AND topic_category = 'career';

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.sign.pisces.present', 'career', 'ru-RU', 'Рыбы заметно проявлен в карте. Сильные стороны: воображение, сострадание, тонкость, вдохновение. Риски перекоса: размытые границы, избегание, иллюзии. Практика: выбери 1 сильную сторону и 1 риск и закрепи их в конкретном действии на неделю (что усиливаю, что ограничиваю, по каким признакам пойму, что баланс соблюдён).', 140, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.sign.pisces.present' AND locale = 'ru-RU' AND topic_category = 'career'
);

UPDATE knowledge_items
SET text = 'Козерог заметно проявлен в карте. Сильные стороны: ответственность, стратегия, дисциплина, результат. Риски перекоса: жёсткость, перегруз, страх ошибки. Практика: выбери 1 сильную сторону и 1 риск и закрепи их в конкретном действии на неделю (что усиливаю, что ограничиваю, по каким признакам пойму, что баланс соблюдён).', is_active = 1, priority = 140, meta_json = '{}'
WHERE key = 'natal.sign.capricorn.present' AND locale = 'ru-RU' AND topic_category = 'career';

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.sign.capricorn.present', 'career', 'ru-RU', 'Козерог заметно проявлен в карте. Сильные стороны: ответственность, стратегия, дисциплина, результат. Риски перекоса: жёсткость, перегруз, страх ошибки. Практика: выбери 1 сильную сторону и 1 риск и закрепи их в конкретном действии на неделю (что усиливаю, что ограничиваю, по каким признакам пойму, что баланс соблюдён).', 140, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.sign.capricorn.present' AND locale = 'ru-RU' AND topic_category = 'career'
);

UPDATE knowledge_items
SET text = 'Скорпион заметно проявлен в карте. Сильные стороны: глубина, стойкость, концентрация, трансформация. Риски перекоса: контроль, подозрительность, крайности. Практика: выбери 1 сильную сторону и 1 риск и закрепи их в конкретном действии на неделю (что усиливаю, что ограничиваю, по каким признакам пойму, что баланс соблюдён).', is_active = 1, priority = 140, meta_json = '{}'
WHERE key = 'natal.sign.scorpio.present' AND locale = 'ru-RU' AND topic_category = 'career';

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.sign.scorpio.present', 'career', 'ru-RU', 'Скорпион заметно проявлен в карте. Сильные стороны: глубина, стойкость, концентрация, трансформация. Риски перекоса: контроль, подозрительность, крайности. Практика: выбери 1 сильную сторону и 1 риск и закрепи их в конкретном действии на неделю (что усиливаю, что ограничиваю, по каким признакам пойму, что баланс соблюдён).', 140, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.sign.scorpio.present' AND locale = 'ru-RU' AND topic_category = 'career'
);

UPDATE knowledge_items
SET text = 'Водолей заметно проявлен в карте. Сильные стороны: независимость, инновации, идеи, команда. Риски перекоса: отстранённость, упрямство идей, непредсказуемость. Практика: выбери 1 сильную сторону и 1 риск и закрепи их в конкретном действии на неделю (что усиливаю, что ограничиваю, по каким признакам пойму, что баланс соблюдён).', is_active = 1, priority = 140, meta_json = '{}'
WHERE key = 'natal.sign.aquarius.present' AND locale = 'ru-RU' AND topic_category = 'career';

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.sign.aquarius.present', 'career', 'ru-RU', 'Водолей заметно проявлен в карте. Сильные стороны: независимость, инновации, идеи, команда. Риски перекоса: отстранённость, упрямство идей, непредсказуемость. Практика: выбери 1 сильную сторону и 1 риск и закрепи их в конкретном действии на неделю (что усиливаю, что ограничиваю, по каким признакам пойму, что баланс соблюдён).', 140, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.sign.aquarius.present' AND locale = 'ru-RU' AND topic_category = 'career'
);

UPDATE knowledge_items
SET text = 'Стрелец заметно проявлен в карте. Сильные стороны: широта взглядов, смысл, честность, рост. Риски перекоса: прямолинейность, обещания без расчёта, беспокойство. Практика: выбери 1 сильную сторону и 1 риск и закрепи их в конкретном действии на неделю (что усиливаю, что ограничиваю, по каким признакам пойму, что баланс соблюдён).', is_active = 1, priority = 140, meta_json = '{}'
WHERE key = 'natal.sign.sagittarius.present' AND locale = 'ru-RU' AND topic_category = 'career';

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.sign.sagittarius.present', 'career', 'ru-RU', 'Стрелец заметно проявлен в карте. Сильные стороны: широта взглядов, смысл, честность, рост. Риски перекоса: прямолинейность, обещания без расчёта, беспокойство. Практика: выбери 1 сильную сторону и 1 риск и закрепи их в конкретном действии на неделю (что усиливаю, что ограничиваю, по каким признакам пойму, что баланс соблюдён).', 140, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.sign.sagittarius.present' AND locale = 'ru-RU' AND topic_category = 'career'
);

UPDATE knowledge_items
SET text = 'Баланс полярности смещён в Ян: легче включаться в действие, проявлять инициативу и брать роль. Риск — идти вперёд без пауз и не слышать сигналов усталости/отношений. Микро-пример: в дедлайне можно ускориться так, что качество и диалог проседают. Практика: добавь «стоп-проверку» перед решениями (пауза 60 секунд: цель, последствия, ресурс).', is_active = 1, priority = 140, meta_json = '{}'
WHERE key = 'natal.polarity.balance.yang' AND locale = 'ru-RU' AND topic_category = 'career';

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.polarity.balance.yang', 'career', 'ru-RU', 'Баланс полярности смещён в Ян: легче включаться в действие, проявлять инициативу и брать роль. Риск — идти вперёд без пауз и не слышать сигналов усталости/отношений. Микро-пример: в дедлайне можно ускориться так, что качество и диалог проседают. Практика: добавь «стоп-проверку» перед решениями (пауза 60 секунд: цель, последствия, ресурс).', 140, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.polarity.balance.yang' AND locale = 'ru-RU' AND topic_category = 'career'
);

COMMIT;

