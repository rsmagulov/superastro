-- AUTO-GENERATED. DO NOT EDIT BY HAND.

-- Overrides from debug shortest used blocks (topic_category=talents)

-- Source JSON: C:/Projects/superastro/debug_talents_ru_160_20260223_144616_mini_topiccore.json

-- Filter: len(text)<= 420, max_keys=250

BEGIN;

UPDATE knowledge_items
SET text = 'Этот блок описывает таланты как повторяемые сильные стороны: что у тебя получается быстрее среднего и что даёт ощущение потока. Сильная сторона — можно собрать 1–2 ключевых навыка в устойчивую систему; риск — распыляться и не доводить до продукта. Практика: выбери один талант и за 14 дней преврати его в маленький результат (текст, проект, навык, портфолио) с конкретным критерием качества.', is_active = 1, priority = 140, meta_json = '{}'
WHERE key = 'natal.talents.generic' AND locale = 'ru-RU' AND topic_category = 'talents';

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.talents.generic', 'talents', 'ru-RU', 'Этот блок описывает таланты как повторяемые сильные стороны: что у тебя получается быстрее среднего и что даёт ощущение потока. Сильная сторона — можно собрать 1–2 ключевых навыка в устойчивую систему; риск — распыляться и не доводить до продукта. Практика: выбери один талант и за 14 дней преврати его в маленький результат (текст, проект, навык, портфолио) с конкретным критерием качества.', 140, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.talents.generic' AND locale = 'ru-RU' AND topic_category = 'talents'
);

UPDATE knowledge_items
SET text = 'Управитель 3 дома — ключ к навыкам, мышлению и коммуникациям: через что ты учишься, объясняешь и налаживаешь контакт. Он показывает, какие форматы обучения и общения дают быстрый прогресс, а какие перегружают или распыляют внимание. Практика: выбери 1 навык (письмо/языки/переговоры/логика) и тренируй 14 дней по 20 минут, фиксируя результат и обратную связь.', is_active = 1, priority = 140, meta_json = '{}'
WHERE key = 'natal.house.3.ruler.any' AND locale = 'ru-RU' AND topic_category = 'talents';

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.3.ruler.any', 'talents', 'ru-RU', 'Управитель 3 дома — ключ к навыкам, мышлению и коммуникациям: через что ты учишься, объясняешь и налаживаешь контакт. Он показывает, какие форматы обучения и общения дают быстрый прогресс, а какие перегружают или распыляют внимание. Практика: выбери 1 навык (письмо/языки/переговоры/логика) и тренируй 14 дней по 20 минут, фиксируя результат и обратную связь.', 140, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.3.ruler.any' AND locale = 'ru-RU' AND topic_category = 'talents'
);

UPDATE knowledge_items
SET text = 'Натальный маркер (natal.house.5.ruler.moon): это подсказка о стиле реакции и типичных сценариях. Практика: отследи, как это проявляется 7 дней (триггеры → реакция → результат) и выбери одну настройку поведения (границы, темп, коммуникация, режим восстановления).', is_active = 1, priority = 140, meta_json = '{}'
WHERE key = 'natal.house.5.ruler.moon' AND locale = 'ru-RU' AND topic_category = 'talents';

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.5.ruler.moon', 'talents', 'ru-RU', 'Натальный маркер (natal.house.5.ruler.moon): это подсказка о стиле реакции и типичных сценариях. Практика: отследи, как это проявляется 7 дней (триггеры → реакция → результат) и выбери одну настройку поведения (границы, темп, коммуникация, режим восстановления).', 140, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.5.ruler.moon' AND locale = 'ru-RU' AND topic_category = 'talents'
);

UPDATE knowledge_items
SET text = 'Натальный маркер (natal.house.3.cusp.sign.any): это подсказка о стиле реакции и типичных сценариях. Практика: отследи, как это проявляется 7 дней (триггеры → реакция → результат) и выбери одну настройку поведения (границы, темп, коммуникация, режим восстановления).', is_active = 1, priority = 140, meta_json = '{}'
WHERE key = 'natal.house.3.cusp.sign.any' AND locale = 'ru-RU' AND topic_category = 'talents';

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.3.cusp.sign.any', 'talents', 'ru-RU', 'Натальный маркер (natal.house.3.cusp.sign.any): это подсказка о стиле реакции и типичных сценариях. Практика: отследи, как это проявляется 7 дней (триггеры → реакция → результат) и выбери одну настройку поведения (границы, темп, коммуникация, режим восстановления).', 140, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.3.cusp.sign.any' AND locale = 'ru-RU' AND topic_category = 'talents'
);

UPDATE knowledge_items
SET text = 'Натальный маркер (natal.house.3.ruler.mercury): это подсказка о стиле реакции и типичных сценариях. Практика: отследи, как это проявляется 7 дней (триггеры → реакция → результат) и выбери одну настройку поведения (границы, темп, коммуникация, режим восстановления).', is_active = 1, priority = 140, meta_json = '{}'
WHERE key = 'natal.house.3.ruler.mercury' AND locale = 'ru-RU' AND topic_category = 'talents';

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.3.ruler.mercury', 'talents', 'ru-RU', 'Натальный маркер (natal.house.3.ruler.mercury): это подсказка о стиле реакции и типичных сценариях. Практика: отследи, как это проявляется 7 дней (триггеры → реакция → результат) и выбери одну настройку поведения (границы, темп, коммуникация, режим восстановления).', 140, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.3.ruler.mercury' AND locale = 'ru-RU' AND topic_category = 'talents'
);

UPDATE knowledge_items
SET text = 'Натальный маркер (natal.house.5.cusp.sign.any): это подсказка о стиле реакции и типичных сценариях. Практика: отследи, как это проявляется 7 дней (триггеры → реакция → результат) и выбери одну настройку поведения (границы, темп, коммуникация, режим восстановления).', is_active = 1, priority = 140, meta_json = '{}'
WHERE key = 'natal.house.5.cusp.sign.any' AND locale = 'ru-RU' AND topic_category = 'talents';

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.5.cusp.sign.any', 'talents', 'ru-RU', 'Натальный маркер (natal.house.5.cusp.sign.any): это подсказка о стиле реакции и типичных сценариях. Практика: отследи, как это проявляется 7 дней (триггеры → реакция → результат) и выбери одну настройку поведения (границы, темп, коммуникация, режим восстановления).', 140, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.5.cusp.sign.any' AND locale = 'ru-RU' AND topic_category = 'talents'
);

UPDATE knowledge_items
SET text = 'Натальный маркер (natal.house.3.cusp.sign.gemini): это подсказка о стиле реакции и типичных сценариях. Практика: отследи, как это проявляется 7 дней (триггеры → реакция → результат) и выбери одну настройку поведения (границы, темп, коммуникация, режим восстановления).', is_active = 1, priority = 140, meta_json = '{}'
WHERE key = 'natal.house.3.cusp.sign.gemini' AND locale = 'ru-RU' AND topic_category = 'talents';

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.3.cusp.sign.gemini', 'talents', 'ru-RU', 'Натальный маркер (natal.house.3.cusp.sign.gemini): это подсказка о стиле реакции и типичных сценариях. Практика: отследи, как это проявляется 7 дней (триггеры → реакция → результат) и выбери одну настройку поведения (границы, темп, коммуникация, режим восстановления).', 140, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.3.cusp.sign.gemini' AND locale = 'ru-RU' AND topic_category = 'talents'
);

UPDATE knowledge_items
SET text = 'Натальный маркер (natal.house.5.cusp.sign.cancer): это подсказка о стиле реакции и типичных сценариях. Практика: отследи, как это проявляется 7 дней (триггеры → реакция → результат) и выбери одну настройку поведения (границы, темп, коммуникация, режим восстановления).', is_active = 1, priority = 140, meta_json = '{}'
WHERE key = 'natal.house.5.cusp.sign.cancer' AND locale = 'ru-RU' AND topic_category = 'talents';

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.5.cusp.sign.cancer', 'talents', 'ru-RU', 'Натальный маркер (natal.house.5.cusp.sign.cancer): это подсказка о стиле реакции и типичных сценариях. Практика: отследи, как это проявляется 7 дней (триггеры → реакция → результат) и выбери одну настройку поведения (границы, темп, коммуникация, режим восстановления).', 140, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.5.cusp.sign.cancer' AND locale = 'ru-RU' AND topic_category = 'talents'
);

UPDATE knowledge_items
SET text = 'Натальный маркер (natal.house.5.ruler.moon.sign.any): это подсказка о стиле реакции и типичных сценариях. Практика: отследи, как это проявляется 7 дней (триггеры → реакция → результат) и выбери одну настройку поведения (границы, темп, коммуникация, режим восстановления).', is_active = 1, priority = 140, meta_json = '{}'
WHERE key = 'natal.house.5.ruler.moon.sign.any' AND locale = 'ru-RU' AND topic_category = 'talents';

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.5.ruler.moon.sign.any', 'talents', 'ru-RU', 'Натальный маркер (natal.house.5.ruler.moon.sign.any): это подсказка о стиле реакции и типичных сценариях. Практика: отследи, как это проявляется 7 дней (триггеры → реакция → результат) и выбери одну настройку поведения (границы, темп, коммуникация, режим восстановления).', 140, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.5.ruler.moon.sign.any' AND locale = 'ru-RU' AND topic_category = 'talents'
);

UPDATE knowledge_items
SET text = 'Натальный маркер (natal.house.3.ruler.mercury.sign.any): это подсказка о стиле реакции и типичных сценариях. Практика: отследи, как это проявляется 7 дней (триггеры → реакция → результат) и выбери одну настройку поведения (границы, темп, коммуникация, режим восстановления).', is_active = 1, priority = 140, meta_json = '{}'
WHERE key = 'natal.house.3.ruler.mercury.sign.any' AND locale = 'ru-RU' AND topic_category = 'talents';

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.3.ruler.mercury.sign.any', 'talents', 'ru-RU', 'Натальный маркер (natal.house.3.ruler.mercury.sign.any): это подсказка о стиле реакции и типичных сценариях. Практика: отследи, как это проявляется 7 дней (триггеры → реакция → результат) и выбери одну настройку поведения (границы, темп, коммуникация, режим восстановления).', 140, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.3.ruler.mercury.sign.any' AND locale = 'ru-RU' AND topic_category = 'talents'
);

UPDATE knowledge_items
SET text = 'Доминирует стихия Огонь: она чаще всего ведёт тебя к решениям. Сильная сторона — быстро включаешься в «родной» стиль. Риск — недооценивать противоположные подходы. Практика: добавь один компенсирующий шаг из другой стихии (план/контакт/чувства/действие) перед финальным выбором.', is_active = 1, priority = 140, meta_json = '{}'
WHERE key = 'natal.elements.dominant.fire' AND locale = 'ru-RU' AND topic_category = 'talents';

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.elements.dominant.fire', 'talents', 'ru-RU', 'Доминирует стихия Огонь: она чаще всего ведёт тебя к решениям. Сильная сторона — быстро включаешься в «родной» стиль. Риск — недооценивать противоположные подходы. Практика: добавь один компенсирующий шаг из другой стихии (план/контакт/чувства/действие) перед финальным выбором.', 140, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.elements.dominant.fire' AND locale = 'ru-RU' AND topic_category = 'talents'
);

UPDATE knowledge_items
SET text = 'Натальный маркер (natal.house.5.ruler.moon.aspects.present): это подсказка о стиле реакции и типичных сценариях. Практика: отследи, как это проявляется 7 дней (триггеры → реакция → результат) и выбери одну настройку поведения (границы, темп, коммуникация, режим восстановления).', is_active = 1, priority = 140, meta_json = '{}'
WHERE key = 'natal.house.5.ruler.moon.aspects.present' AND locale = 'ru-RU' AND topic_category = 'talents';

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.5.ruler.moon.aspects.present', 'talents', 'ru-RU', 'Натальный маркер (natal.house.5.ruler.moon.aspects.present): это подсказка о стиле реакции и типичных сценариях. Практика: отследи, как это проявляется 7 дней (триггеры → реакция → результат) и выбери одну настройку поведения (границы, темп, коммуникация, режим восстановления).', 140, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.5.ruler.moon.aspects.present' AND locale = 'ru-RU' AND topic_category = 'talents'
);

UPDATE knowledge_items
SET text = 'Доминирует модальность фиксированная: сильные стороны — устойчивость, доведение до результата, верность выбранному. Риски — застревание, сопротивление переменам. Практика: выбери один процесс, где нужен баланс, и добавь недостающую стадию (старт/стабилизация/адаптация) на неделю.', is_active = 1, priority = 140, meta_json = '{}'
WHERE key = 'natal.modality.dominant.fixed' AND locale = 'ru-RU' AND topic_category = 'talents';

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.modality.dominant.fixed', 'talents', 'ru-RU', 'Доминирует модальность фиксированная: сильные стороны — устойчивость, доведение до результата, верность выбранному. Риски — застревание, сопротивление переменам. Практика: выбери один процесс, где нужен баланс, и добавь недостающую стадию (старт/стабилизация/адаптация) на неделю.', 140, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.modality.dominant.fixed' AND locale = 'ru-RU' AND topic_category = 'talents'
);

UPDATE knowledge_items
SET text = 'Натальный маркер (natal.house.3.ruler.mercury.aspects.present): это подсказка о стиле реакции и типичных сценариях. Практика: отследи, как это проявляется 7 дней (триггеры → реакция → результат) и выбери одну настройку поведения (границы, темп, коммуникация, режим восстановления).', is_active = 1, priority = 140, meta_json = '{}'
WHERE key = 'natal.house.3.ruler.mercury.aspects.present' AND locale = 'ru-RU' AND topic_category = 'talents';

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.3.ruler.mercury.aspects.present', 'talents', 'ru-RU', 'Натальный маркер (natal.house.3.ruler.mercury.aspects.present): это подсказка о стиле реакции и типичных сценариях. Практика: отследи, как это проявляется 7 дней (триггеры → реакция → результат) и выбери одну настройку поведения (границы, темп, коммуникация, режим восстановления).', 140, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.3.ruler.mercury.aspects.present' AND locale = 'ru-RU' AND topic_category = 'talents'
);

UPDATE knowledge_items
SET text = 'Натальный маркер (natal.house.5.ruler.moon.aspect.sextile.sun): это подсказка о стиле реакции и типичных сценариях. Практика: отследи, как это проявляется 7 дней (триггеры → реакция → результат) и выбери одну настройку поведения (границы, темп, коммуникация, режим восстановления).', is_active = 1, priority = 140, meta_json = '{}'
WHERE key = 'natal.house.5.ruler.moon.aspect.sextile.sun' AND locale = 'ru-RU' AND topic_category = 'talents';

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.5.ruler.moon.aspect.sextile.sun', 'talents', 'ru-RU', 'Натальный маркер (natal.house.5.ruler.moon.aspect.sextile.sun): это подсказка о стиле реакции и типичных сценариях. Практика: отследи, как это проявляется 7 дней (триггеры → реакция → результат) и выбери одну настройку поведения (границы, темп, коммуникация, режим восстановления).', 140, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.5.ruler.moon.aspect.sextile.sun' AND locale = 'ru-RU' AND topic_category = 'talents'
);

UPDATE knowledge_items
SET text = 'Натальный маркер (natal.house.5.ruler.moon.aspect.square.uranus): это подсказка о стиле реакции и типичных сценариях. Практика: отследи, как это проявляется 7 дней (триггеры → реакция → результат) и выбери одну настройку поведения (границы, темп, коммуникация, режим восстановления).', is_active = 1, priority = 140, meta_json = '{}'
WHERE key = 'natal.house.5.ruler.moon.aspect.square.uranus' AND locale = 'ru-RU' AND topic_category = 'talents';

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.5.ruler.moon.aspect.square.uranus', 'talents', 'ru-RU', 'Натальный маркер (natal.house.5.ruler.moon.aspect.square.uranus): это подсказка о стиле реакции и типичных сценариях. Практика: отследи, как это проявляется 7 дней (триггеры → реакция → результат) и выбери одну настройку поведения (границы, темп, коммуникация, режим восстановления).', 140, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.5.ruler.moon.aspect.square.uranus' AND locale = 'ru-RU' AND topic_category = 'talents'
);

UPDATE knowledge_items
SET text = 'Дефицит стихии Вода: этот способ реагирования может требовать сознательной тренировки. Не слабость, а зона развития: её легче встроить через простые ритуалы. Практика: выбери 1 привычку на 10 минут в день, которая добавляет {er} (например: телесная рутина, общение, эмоции, действие).', is_active = 1, priority = 140, meta_json = '{}'
WHERE key = 'natal.elements.deficient.water' AND locale = 'ru-RU' AND topic_category = 'talents';

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.elements.deficient.water', 'talents', 'ru-RU', 'Дефицит стихии Вода: этот способ реагирования может требовать сознательной тренировки. Не слабость, а зона развития: её легче встроить через простые ритуалы. Практика: выбери 1 привычку на 10 минут в день, которая добавляет {er} (например: телесная рутина, общение, эмоции, действие).', 140, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.elements.deficient.water' AND locale = 'ru-RU' AND topic_category = 'talents'
);

UPDATE knowledge_items
SET text = 'Натальный маркер (natal.house.3.ruler.mercury.aspect.sextile.mars): это подсказка о стиле реакции и типичных сценариях. Практика: отследи, как это проявляется 7 дней (триггеры → реакция → результат) и выбери одну настройку поведения (границы, темп, коммуникация, режим восстановления).', is_active = 1, priority = 140, meta_json = '{}'
WHERE key = 'natal.house.3.ruler.mercury.aspect.sextile.mars' AND locale = 'ru-RU' AND topic_category = 'talents';

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.3.ruler.mercury.aspect.sextile.mars', 'talents', 'ru-RU', 'Натальный маркер (natal.house.3.ruler.mercury.aspect.sextile.mars): это подсказка о стиле реакции и типичных сценариях. Практика: отследи, как это проявляется 7 дней (триггеры → реакция → результат) и выбери одну настройку поведения (границы, темп, коммуникация, режим восстановления).', 140, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.3.ruler.mercury.aspect.sextile.mars' AND locale = 'ru-RU' AND topic_category = 'talents'
);

UPDATE knowledge_items
SET text = 'Натальный маркер (natal.house.5.ruler.moon.aspect.opposition.saturn): это подсказка о стиле реакции и типичных сценариях. Практика: отследи, как это проявляется 7 дней (триггеры → реакция → результат) и выбери одну настройку поведения (границы, темп, коммуникация, режим восстановления).', is_active = 1, priority = 140, meta_json = '{}'
WHERE key = 'natal.house.5.ruler.moon.aspect.opposition.saturn' AND locale = 'ru-RU' AND topic_category = 'talents';

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.5.ruler.moon.aspect.opposition.saturn', 'talents', 'ru-RU', 'Натальный маркер (natal.house.5.ruler.moon.aspect.opposition.saturn): это подсказка о стиле реакции и типичных сценариях. Практика: отследи, как это проявляется 7 дней (триггеры → реакция → результат) и выбери одну настройку поведения (границы, темп, коммуникация, режим восстановления).', 140, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.5.ruler.moon.aspect.opposition.saturn' AND locale = 'ru-RU' AND topic_category = 'talents'
);

UPDATE knowledge_items
SET text = 'Стихия Вода выражена на уровне 1. Это задаёт привычный способ включаться в жизнь: через смысл/действие (Огонь), практику/материальность (Земля), идеи/контакты (Воздух), чувства/интуицию (Вода). Практика: в сложной ситуации попробуй «перевести» задачу на язык этой стихии и посмотри, что упростится.', is_active = 1, priority = 140, meta_json = '{}'
WHERE key = 'natal.elements.water.count.1' AND locale = 'ru-RU' AND topic_category = 'talents';

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.elements.water.count.1', 'talents', 'ru-RU', 'Стихия Вода выражена на уровне 1. Это задаёт привычный способ включаться в жизнь: через смысл/действие (Огонь), практику/материальность (Земля), идеи/контакты (Воздух), чувства/интуицию (Вода). Практика: в сложной ситуации попробуй «перевести» задачу на язык этой стихии и посмотри, что упростится.', 140, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.elements.water.count.1' AND locale = 'ru-RU' AND topic_category = 'talents'
);

UPDATE knowledge_items
SET text = 'Стихия Земля выражена на уровне 3. Это задаёт привычный способ включаться в жизнь: через смысл/действие (Огонь), практику/материальность (Земля), идеи/контакты (Воздух), чувства/интуицию (Вода). Практика: в сложной ситуации попробуй «перевести» задачу на язык этой стихии и посмотри, что упростится.', is_active = 1, priority = 140, meta_json = '{}'
WHERE key = 'natal.elements.earth.count.3' AND locale = 'ru-RU' AND topic_category = 'talents';

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.elements.earth.count.3', 'talents', 'ru-RU', 'Стихия Земля выражена на уровне 3. Это задаёт привычный способ включаться в жизнь: через смысл/действие (Огонь), практику/материальность (Земля), идеи/контакты (Воздух), чувства/интуицию (Вода). Практика: в сложной ситуации попробуй «перевести» задачу на язык этой стихии и посмотри, что упростится.', 140, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.elements.earth.count.3' AND locale = 'ru-RU' AND topic_category = 'talents'
);

UPDATE knowledge_items
SET text = 'Стихия Огонь выражена на уровне 3. Это задаёт привычный способ включаться в жизнь: через смысл/действие (Огонь), практику/материальность (Земля), идеи/контакты (Воздух), чувства/интуицию (Вода). Практика: в сложной ситуации попробуй «перевести» задачу на язык этой стихии и посмотри, что упростится.', is_active = 1, priority = 140, meta_json = '{}'
WHERE key = 'natal.elements.fire.count.3' AND locale = 'ru-RU' AND topic_category = 'talents';

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.elements.fire.count.3', 'talents', 'ru-RU', 'Стихия Огонь выражена на уровне 3. Это задаёт привычный способ включаться в жизнь: через смысл/действие (Огонь), практику/материальность (Земля), идеи/контакты (Воздух), чувства/интуицию (Вода). Практика: в сложной ситуации попробуй «перевести» задачу на язык этой стихии и посмотри, что упростится.', 140, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.elements.fire.count.3' AND locale = 'ru-RU' AND topic_category = 'talents'
);

UPDATE knowledge_items
SET text = 'Стихия Воздух выражена на уровне 3. Это задаёт привычный способ включаться в жизнь: через смысл/действие (Огонь), практику/материальность (Земля), идеи/контакты (Воздух), чувства/интуицию (Вода). Практика: в сложной ситуации попробуй «перевести» задачу на язык этой стихии и посмотри, что упростится.', is_active = 1, priority = 140, meta_json = '{}'
WHERE key = 'natal.elements.air.count.3' AND locale = 'ru-RU' AND topic_category = 'talents';

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.elements.air.count.3', 'talents', 'ru-RU', 'Стихия Воздух выражена на уровне 3. Это задаёт привычный способ включаться в жизнь: через смысл/действие (Огонь), практику/материальность (Земля), идеи/контакты (Воздух), чувства/интуицию (Вода). Практика: в сложной ситуации попробуй «перевести» задачу на язык этой стихии и посмотри, что упростится.', 140, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.elements.air.count.3' AND locale = 'ru-RU' AND topic_category = 'talents'
);

UPDATE knowledge_items
SET text = 'Рак заметно проявлен в карте. Сильные стороны: эмпатия, забота, интуиция, память. Риски перекоса: ранимость, обидчивость, уход в защиту. Практика: выбери 1 сильную сторону и 1 риск и закрепи их в конкретном действии на неделю (что усиливаю, что ограничиваю, по каким признакам пойму, что баланс соблюдён).', is_active = 1, priority = 140, meta_json = '{}'
WHERE key = 'natal.sign.cancer.present' AND locale = 'ru-RU' AND topic_category = 'talents';

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.sign.cancer.present', 'talents', 'ru-RU', 'Рак заметно проявлен в карте. Сильные стороны: эмпатия, забота, интуиция, память. Риски перекоса: ранимость, обидчивость, уход в защиту. Практика: выбери 1 сильную сторону и 1 риск и закрепи их в конкретном действии на неделю (что усиливаю, что ограничиваю, по каким признакам пойму, что баланс соблюдён).', 140, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.sign.cancer.present' AND locale = 'ru-RU' AND topic_category = 'talents'
);

UPDATE knowledge_items
SET text = 'Дева заметно проявлен в карте. Сильные стороны: точность, анализ, полезность, порядок. Риски перекоса: критичность, тревожность, перфекционизм. Практика: выбери 1 сильную сторону и 1 риск и закрепи их в конкретном действии на неделю (что усиливаю, что ограничиваю, по каким признакам пойму, что баланс соблюдён).', is_active = 1, priority = 140, meta_json = '{}'
WHERE key = 'natal.sign.virgo.present' AND locale = 'ru-RU' AND topic_category = 'talents';

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.sign.virgo.present', 'talents', 'ru-RU', 'Дева заметно проявлен в карте. Сильные стороны: точность, анализ, полезность, порядок. Риски перекоса: критичность, тревожность, перфекционизм. Практика: выбери 1 сильную сторону и 1 риск и закрепи их в конкретном действии на неделю (что усиливаю, что ограничиваю, по каким признакам пойму, что баланс соблюдён).', 140, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.sign.virgo.present' AND locale = 'ru-RU' AND topic_category = 'talents'
);

UPDATE knowledge_items
SET text = 'Близнецы заметно проявлен в карте. Сильные стороны: гибкость ума, коммуникации, обучение. Риски перекоса: распыление, поверхностность, нервозность. Практика: выбери 1 сильную сторону и 1 риск и закрепи их в конкретном действии на неделю (что усиливаю, что ограничиваю, по каким признакам пойму, что баланс соблюдён).', is_active = 1, priority = 140, meta_json = '{}'
WHERE key = 'natal.sign.gemini.present' AND locale = 'ru-RU' AND topic_category = 'talents';

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.sign.gemini.present', 'talents', 'ru-RU', 'Близнецы заметно проявлен в карте. Сильные стороны: гибкость ума, коммуникации, обучение. Риски перекоса: распыление, поверхностность, нервозность. Практика: выбери 1 сильную сторону и 1 риск и закрепи их в конкретном действии на неделю (что усиливаю, что ограничиваю, по каким признакам пойму, что баланс соблюдён).', 140, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.sign.gemini.present' AND locale = 'ru-RU' AND topic_category = 'talents'
);

UPDATE knowledge_items
SET text = 'Телец заметно проявлен в карте. Сильные стороны: устойчивость, практичность, вкус и качество. Риски перекоса: инертность, упрямство, страх перемен. Практика: выбери 1 сильную сторону и 1 риск и закрепи их в конкретном действии на неделю (что усиливаю, что ограничиваю, по каким признакам пойму, что баланс соблюдён).', is_active = 1, priority = 140, meta_json = '{}'
WHERE key = 'natal.sign.taurus.present' AND locale = 'ru-RU' AND topic_category = 'talents';

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.sign.taurus.present', 'talents', 'ru-RU', 'Телец заметно проявлен в карте. Сильные стороны: устойчивость, практичность, вкус и качество. Риски перекоса: инертность, упрямство, страх перемен. Практика: выбери 1 сильную сторону и 1 риск и закрепи их в конкретном действии на неделю (что усиливаю, что ограничиваю, по каким признакам пойму, что баланс соблюдён).', 140, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.sign.taurus.present' AND locale = 'ru-RU' AND topic_category = 'talents'
);

UPDATE knowledge_items
SET text = 'Лев заметно проявлен в карте. Сильные стороны: самовыражение, лидерство, творчество. Риски перекоса: самолюбие, драматизация, зависимость от оценки. Практика: выбери 1 сильную сторону и 1 риск и закрепи их в конкретном действии на неделю (что усиливаю, что ограничиваю, по каким признакам пойму, что баланс соблюдён).', is_active = 1, priority = 140, meta_json = '{}'
WHERE key = 'natal.sign.leo.present' AND locale = 'ru-RU' AND topic_category = 'talents';

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.sign.leo.present', 'talents', 'ru-RU', 'Лев заметно проявлен в карте. Сильные стороны: самовыражение, лидерство, творчество. Риски перекоса: самолюбие, драматизация, зависимость от оценки. Практика: выбери 1 сильную сторону и 1 риск и закрепи их в конкретном действии на неделю (что усиливаю, что ограничиваю, по каким признакам пойму, что баланс соблюдён).', 140, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.sign.leo.present' AND locale = 'ru-RU' AND topic_category = 'talents'
);

UPDATE knowledge_items
SET text = 'Рыбы заметно проявлен в карте. Сильные стороны: воображение, сострадание, тонкость, вдохновение. Риски перекоса: размытые границы, избегание, иллюзии. Практика: выбери 1 сильную сторону и 1 риск и закрепи их в конкретном действии на неделю (что усиливаю, что ограничиваю, по каким признакам пойму, что баланс соблюдён).', is_active = 1, priority = 140, meta_json = '{}'
WHERE key = 'natal.sign.pisces.present' AND locale = 'ru-RU' AND topic_category = 'talents';

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.sign.pisces.present', 'talents', 'ru-RU', 'Рыбы заметно проявлен в карте. Сильные стороны: воображение, сострадание, тонкость, вдохновение. Риски перекоса: размытые границы, избегание, иллюзии. Практика: выбери 1 сильную сторону и 1 риск и закрепи их в конкретном действии на неделю (что усиливаю, что ограничиваю, по каким признакам пойму, что баланс соблюдён).', 140, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.sign.pisces.present' AND locale = 'ru-RU' AND topic_category = 'talents'
);

UPDATE knowledge_items
SET text = 'Козерог заметно проявлен в карте. Сильные стороны: ответственность, стратегия, дисциплина, результат. Риски перекоса: жёсткость, перегруз, страх ошибки. Практика: выбери 1 сильную сторону и 1 риск и закрепи их в конкретном действии на неделю (что усиливаю, что ограничиваю, по каким признакам пойму, что баланс соблюдён).', is_active = 1, priority = 140, meta_json = '{}'
WHERE key = 'natal.sign.capricorn.present' AND locale = 'ru-RU' AND topic_category = 'talents';

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.sign.capricorn.present', 'talents', 'ru-RU', 'Козерог заметно проявлен в карте. Сильные стороны: ответственность, стратегия, дисциплина, результат. Риски перекоса: жёсткость, перегруз, страх ошибки. Практика: выбери 1 сильную сторону и 1 риск и закрепи их в конкретном действии на неделю (что усиливаю, что ограничиваю, по каким признакам пойму, что баланс соблюдён).', 140, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.sign.capricorn.present' AND locale = 'ru-RU' AND topic_category = 'talents'
);

UPDATE knowledge_items
SET text = 'Скорпион заметно проявлен в карте. Сильные стороны: глубина, стойкость, концентрация, трансформация. Риски перекоса: контроль, подозрительность, крайности. Практика: выбери 1 сильную сторону и 1 риск и закрепи их в конкретном действии на неделю (что усиливаю, что ограничиваю, по каким признакам пойму, что баланс соблюдён).', is_active = 1, priority = 140, meta_json = '{}'
WHERE key = 'natal.sign.scorpio.present' AND locale = 'ru-RU' AND topic_category = 'talents';

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.sign.scorpio.present', 'talents', 'ru-RU', 'Скорпион заметно проявлен в карте. Сильные стороны: глубина, стойкость, концентрация, трансформация. Риски перекоса: контроль, подозрительность, крайности. Практика: выбери 1 сильную сторону и 1 риск и закрепи их в конкретном действии на неделю (что усиливаю, что ограничиваю, по каким признакам пойму, что баланс соблюдён).', 140, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.sign.scorpio.present' AND locale = 'ru-RU' AND topic_category = 'talents'
);

UPDATE knowledge_items
SET text = 'Водолей заметно проявлен в карте. Сильные стороны: независимость, инновации, идеи, команда. Риски перекоса: отстранённость, упрямство идей, непредсказуемость. Практика: выбери 1 сильную сторону и 1 риск и закрепи их в конкретном действии на неделю (что усиливаю, что ограничиваю, по каким признакам пойму, что баланс соблюдён).', is_active = 1, priority = 140, meta_json = '{}'
WHERE key = 'natal.sign.aquarius.present' AND locale = 'ru-RU' AND topic_category = 'talents';

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.sign.aquarius.present', 'talents', 'ru-RU', 'Водолей заметно проявлен в карте. Сильные стороны: независимость, инновации, идеи, команда. Риски перекоса: отстранённость, упрямство идей, непредсказуемость. Практика: выбери 1 сильную сторону и 1 риск и закрепи их в конкретном действии на неделю (что усиливаю, что ограничиваю, по каким признакам пойму, что баланс соблюдён).', 140, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.sign.aquarius.present' AND locale = 'ru-RU' AND topic_category = 'talents'
);

UPDATE knowledge_items
SET text = 'Стрелец заметно проявлен в карте. Сильные стороны: широта взглядов, смысл, честность, рост. Риски перекоса: прямолинейность, обещания без расчёта, беспокойство. Практика: выбери 1 сильную сторону и 1 риск и закрепи их в конкретном действии на неделю (что усиливаю, что ограничиваю, по каким признакам пойму, что баланс соблюдён).', is_active = 1, priority = 140, meta_json = '{}'
WHERE key = 'natal.sign.sagittarius.present' AND locale = 'ru-RU' AND topic_category = 'talents';

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.sign.sagittarius.present', 'talents', 'ru-RU', 'Стрелец заметно проявлен в карте. Сильные стороны: широта взглядов, смысл, честность, рост. Риски перекоса: прямолинейность, обещания без расчёта, беспокойство. Практика: выбери 1 сильную сторону и 1 риск и закрепи их в конкретном действии на неделю (что усиливаю, что ограничиваю, по каким признакам пойму, что баланс соблюдён).', 140, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.sign.sagittarius.present' AND locale = 'ru-RU' AND topic_category = 'talents'
);

UPDATE knowledge_items
SET text = 'Баланс полярности смещён в Ян: легче включаться в действие, проявлять инициативу и брать роль. Риск — идти вперёд без пауз и не слышать сигналов усталости/отношений. Микро-пример: в дедлайне можно ускориться так, что качество и диалог проседают. Практика: добавь «стоп-проверку» перед решениями (пауза 60 секунд: цель, последствия, ресурс).', is_active = 1, priority = 140, meta_json = '{}'
WHERE key = 'natal.polarity.balance.yang' AND locale = 'ru-RU' AND topic_category = 'talents';

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.polarity.balance.yang', 'talents', 'ru-RU', 'Баланс полярности смещён в Ян: легче включаться в действие, проявлять инициативу и брать роль. Риск — идти вперёд без пауз и не слышать сигналов усталости/отношений. Микро-пример: в дедлайне можно ускориться так, что качество и диалог проседают. Практика: добавь «стоп-проверку» перед решениями (пауза 60 секунд: цель, последствия, ресурс).', 140, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.polarity.balance.yang' AND locale = 'ru-RU' AND topic_category = 'talents'
);

UPDATE knowledge_items
SET text = 'Управитель 5 дома — ключ к творчеству, удовольствию и самовыражению: через что включается вдохновение и что даёт радость процесса. Он показывает, какие формы творчества питают тебя, а какие быстро выжигают или превращаются в обязанность. Практика: выбери 1 творческий ритуал на 14 дней (20–30 минут) и фиксируй: энергия до/после, лёгкость, результат.', is_active = 1, priority = 140, meta_json = '{}'
WHERE key = 'natal.house.5.ruler.any' AND locale = 'ru-RU' AND topic_category = 'talents';

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.5.ruler.any', 'talents', 'ru-RU', 'Управитель 5 дома — ключ к творчеству, удовольствию и самовыражению: через что включается вдохновение и что даёт радость процесса. Он показывает, какие формы творчества питают тебя, а какие быстро выжигают или превращаются в обязанность. Практика: выбери 1 творческий ритуал на 14 дней (20–30 минут) и фиксируй: энергия до/после, лёгкость, результат.', 140, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.5.ruler.any' AND locale = 'ru-RU' AND topic_category = 'talents'
);

COMMIT;

