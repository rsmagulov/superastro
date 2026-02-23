-- AUTO-GENERATED. DO NOT EDIT BY HAND.

-- Career overrides from debug shortest used blocks (topic_category=career)

-- Source JSON: C:/Projects/superastro/debug_career_mini_candidates.json

-- Filter: len(text)<= 200, max_keys=50

BEGIN;

UPDATE knowledge_items
SET text = 'Управитель 6-й дом (работа/рутина/процессы и навыки) — Меркурий. В карьере это главный «рычаг»: через Меркурий ты запускаешь прогресс по теме дома. Практика: посмотри, какие задачи/роли активируют эту планету (коммуникации, управление, продажи, аналитика), и добавь регулярный ритуал (планирование, отчёт, тренировка навыка).', is_active = 1, priority = 140, meta_json = '{}'
WHERE key = 'natal.house.6.ruler.mercury' AND locale = 'ru-RU' AND topic_category = 'career';

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.6.ruler.mercury', 'career', 'ru-RU', 'Управитель 6-й дом (работа/рутина/процессы и навыки) — Меркурий. В карьере это главный «рычаг»: через Меркурий ты запускаешь прогресс по теме дома. Практика: посмотри, какие задачи/роли активируют эту планету (коммуникации, управление, продажи, аналитика), и добавь регулярный ритуал (планирование, отчёт, тренировка навыка).', 140, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.6.ruler.mercury' AND locale = 'ru-RU' AND topic_category = 'career'
);

UPDATE knowledge_items
SET text = 'Уран как управитель 2-й дом (деньги/ресурсы/монетизация): знак не уточнён (sign.any). Для карьеры важнее сама функция планеты и то, где ты её применяешь. Практика: зафиксируй 2 поведения, которые усиливают Уран в работе (например, системность/переговоры/инициатива), и проверь эффект по результатам недели.', is_active = 1, priority = 140, meta_json = '{}'
WHERE key = 'natal.house.2.ruler.uranus.sign.any' AND locale = 'ru-RU' AND topic_category = 'career';

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.2.ruler.uranus.sign.any', 'career', 'ru-RU', 'Уран как управитель 2-й дом (деньги/ресурсы/монетизация): знак не уточнён (sign.any). Для карьеры важнее сама функция планеты и то, где ты её применяешь. Практика: зафиксируй 2 поведения, которые усиливают Уран в работе (например, системность/переговоры/инициатива), и проверь эффект по результатам недели.', 140, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.2.ruler.uranus.sign.any' AND locale = 'ru-RU' AND topic_category = 'career'
);

UPDATE knowledge_items
SET text = 'Управитель 6-й дом (работа/рутина/процессы и навыки): не определён (any). В карьере это сигнал: сначала уточни базовые условия успеха по теме дома (цели, роли, критерии качества), а уже потом усложняй стратегию. Практика: 1 чек-лист и 1 метрика на 2 недели.', is_active = 1, priority = 140, meta_json = '{}'
WHERE key = 'natal.house.6.ruler.any' AND locale = 'ru-RU' AND topic_category = 'career';

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.6.ruler.any', 'career', 'ru-RU', 'Управитель 6-й дом (работа/рутина/процессы и навыки): не определён (any). В карьере это сигнал: сначала уточни базовые условия успеха по теме дома (цели, роли, критерии качества), а уже потом усложняй стратегию. Практика: 1 чек-лист и 1 метрика на 2 недели.', 140, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.6.ruler.any' AND locale = 'ru-RU' AND topic_category = 'career'
);

UPDATE knowledge_items
SET text = 'Управитель 2-й дом (деньги/ресурсы/монетизация) — Сатурн. В карьере это главный «рычаг»: через Сатурн ты запускаешь прогресс по теме дома. Практика: посмотри, какие задачи/роли активируют эту планету (коммуникации, управление, продажи, аналитика), и добавь регулярный ритуал (планирование, отчёт, тренировка навыка).', is_active = 1, priority = 140, meta_json = '{}'
WHERE key = 'natal.house.2.ruler.saturn' AND locale = 'ru-RU' AND topic_category = 'career';

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.2.ruler.saturn', 'career', 'ru-RU', 'Управитель 2-й дом (деньги/ресурсы/монетизация) — Сатурн. В карьере это главный «рычаг»: через Сатурн ты запускаешь прогресс по теме дома. Практика: посмотри, какие задачи/роли активируют эту планету (коммуникации, управление, продажи, аналитика), и добавь регулярный ритуал (планирование, отчёт, тренировка навыка).', 140, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.2.ruler.saturn' AND locale = 'ru-RU' AND topic_category = 'career'
);

UPDATE knowledge_items
SET text = 'Управитель 2-й дом (деньги/ресурсы/монетизация): не определён (any). В карьере это сигнал: сначала уточни базовые условия успеха по теме дома (цели, роли, критерии качества), а уже потом усложняй стратегию. Практика: 1 чек-лист и 1 метрика на 2 недели.', is_active = 1, priority = 140, meta_json = '{}'
WHERE key = 'natal.house.2.ruler.any' AND locale = 'ru-RU' AND topic_category = 'career';

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.2.ruler.any', 'career', 'ru-RU', 'Управитель 2-й дом (деньги/ресурсы/монетизация): не определён (any). В карьере это сигнал: сначала уточни базовые условия успеха по теме дома (цели, роли, критерии качества), а уже потом усложняй стратегию. Практика: 1 чек-лист и 1 метрика на 2 недели.', 140, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.2.ruler.any' AND locale = 'ru-RU' AND topic_category = 'career'
);

UPDATE knowledge_items
SET text = 'Управитель 2-й дом (деньги/ресурсы/монетизация) — Уран. В карьере это главный «рычаг»: через Уран ты запускаешь прогресс по теме дома. Практика: посмотри, какие задачи/роли активируют эту планету (коммуникации, управление, продажи, аналитика), и добавь регулярный ритуал (планирование, отчёт, тренировка навыка).', is_active = 1, priority = 140, meta_json = '{}'
WHERE key = 'natal.house.2.ruler.uranus' AND locale = 'ru-RU' AND topic_category = 'career';

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.2.ruler.uranus', 'career', 'ru-RU', 'Управитель 2-й дом (деньги/ресурсы/монетизация) — Уран. В карьере это главный «рычаг»: через Уран ты запускаешь прогресс по теме дома. Практика: посмотри, какие задачи/роли активируют эту планету (коммуникации, управление, продажи, аналитика), и добавь регулярный ритуал (планирование, отчёт, тренировка навыка).', 140, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.2.ruler.uranus' AND locale = 'ru-RU' AND topic_category = 'career'
);

UPDATE knowledge_items
SET text = 'Луна в 2-й дом (деньги/ресурсы/монетизация) — это прямая подсказка, где у тебя есть энергия/фокус и что может давать деньги или рост компетенции. Практика: выпиши 3 задачи по теме дома, где Луна проявляется сильнее всего, и сделай одну ставку на ближайшие 10 дней (маленький проект/улучшение процесса/переговоры).', is_active = 1, priority = 140, meta_json = '{}'
WHERE key = 'natal.house.2.planet.moon' AND locale = 'ru-RU' AND topic_category = 'career';

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.2.planet.moon', 'career', 'ru-RU', 'Луна в 2-й дом (деньги/ресурсы/монетизация) — это прямая подсказка, где у тебя есть энергия/фокус и что может давать деньги или рост компетенции. Практика: выпиши 3 задачи по теме дома, где Луна проявляется сильнее всего, и сделай одну ставку на ближайшие 10 дней (маленький проект/улучшение процесса/переговоры).', 140, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.2.planet.moon' AND locale = 'ru-RU' AND topic_category = 'career'
);

UPDATE knowledge_items
SET text = 'Венера в 2-й дом (деньги/ресурсы/монетизация) — это прямая подсказка, где у тебя есть энергия/фокус и что может давать деньги или рост компетенции. Практика: выпиши 3 задачи по теме дома, где Венера проявляется сильнее всего, и сделай одну ставку на ближайшие 10 дней (маленький проект/улучшение процесса/переговоры).', is_active = 1, priority = 140, meta_json = '{}'
WHERE key = 'natal.house.2.planet.venus' AND locale = 'ru-RU' AND topic_category = 'career';

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.2.planet.venus', 'career', 'ru-RU', 'Венера в 2-й дом (деньги/ресурсы/монетизация) — это прямая подсказка, где у тебя есть энергия/фокус и что может давать деньги или рост компетенции. Практика: выпиши 3 задачи по теме дома, где Венера проявляется сильнее всего, и сделай одну ставку на ближайшие 10 дней (маленький проект/улучшение процесса/переговоры).', 140, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.2.planet.venus' AND locale = 'ru-RU' AND topic_category = 'career'
);

COMMIT;

