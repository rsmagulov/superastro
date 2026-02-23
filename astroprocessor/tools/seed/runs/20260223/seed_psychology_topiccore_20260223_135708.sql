-- AUTO-GENERATED. DO NOT EDIT BY HAND.

-- Overrides from debug shortest used blocks (topic_category=psychology)

-- Source JSON: C:/Projects/superastro/debug_psychology_ru_160_20260223_135708_mini_topiccore.json

-- Filter: len(text)<= 420, max_keys=250

BEGIN;

UPDATE knowledge_items
SET text = 'Баланс полярности смещён в Ян: легче включаться в действие, проявлять инициативу и брать роль. Риск — идти вперёд без пауз и не слышать сигналов усталости/отношений. Микро-пример: в дедлайне можно ускориться так, что качество и диалог проседают. Практика: добавь «стоп-проверку» перед решениями (пауза 60 секунд: цель, последствия, ресурс).', is_active = 1, priority = 140, meta_json = '{}'
WHERE key = 'natal.polarity.balance.yang' AND locale = 'ru-RU' AND topic_category = 'psychology';

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.polarity.balance.yang', 'psychology', 'ru-RU', 'Баланс полярности смещён в Ян: легче включаться в действие, проявлять инициативу и брать роль. Риск — идти вперёд без пауз и не слышать сигналов усталости/отношений. Микро-пример: в дедлайне можно ускориться так, что качество и диалог проседают. Практика: добавь «стоп-проверку» перед решениями (пауза 60 секунд: цель, последствия, ресурс).', 140, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.polarity.balance.yang' AND locale = 'ru-RU' AND topic_category = 'psychology'
);

UPDATE knowledge_items
SET text = 'Дефицит стихии Вода: этот способ реагирования может требовать сознательной тренировки. Не слабость, а зона развития: её легче встроить через простые ритуалы. Практика: выбери 1 привычку на 10 минут в день, которая добавляет {er} (например: телесная рутина, общение, эмоции, действие).', is_active = 1, priority = 140, meta_json = '{}'
WHERE key = 'natal.elements.deficient.water' AND locale = 'ru-RU' AND topic_category = 'psychology';

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.elements.deficient.water', 'psychology', 'ru-RU', 'Дефицит стихии Вода: этот способ реагирования может требовать сознательной тренировки. Не слабость, а зона развития: её легче встроить через простые ритуалы. Практика: выбери 1 привычку на 10 минут в день, которая добавляет {er} (например: телесная рутина, общение, эмоции, действие).', 140, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.elements.deficient.water' AND locale = 'ru-RU' AND topic_category = 'psychology'
);

UPDATE knowledge_items
SET text = 'Доминирует стихия Огонь: она чаще всего ведёт тебя к решениям. Сильная сторона — быстро включаешься в «родной» стиль. Риск — недооценивать противоположные подходы. Практика: добавь один компенсирующий шаг из другой стихии (план/контакт/чувства/действие) перед финальным выбором.', is_active = 1, priority = 140, meta_json = '{}'
WHERE key = 'natal.elements.dominant.fire' AND locale = 'ru-RU' AND topic_category = 'psychology';

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.elements.dominant.fire', 'psychology', 'ru-RU', 'Доминирует стихия Огонь: она чаще всего ведёт тебя к решениям. Сильная сторона — быстро включаешься в «родной» стиль. Риск — недооценивать противоположные подходы. Практика: добавь один компенсирующий шаг из другой стихии (план/контакт/чувства/действие) перед финальным выбором.', 140, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.elements.dominant.fire' AND locale = 'ru-RU' AND topic_category = 'psychology'
);

UPDATE knowledge_items
SET text = 'Доминирует модальность фиксированная: сильные стороны — устойчивость, доведение до результата, верность выбранному. Риски — застревание, сопротивление переменам. Практика: выбери один процесс, где нужен баланс, и добавь недостающую стадию (старт/стабилизация/адаптация) на неделю.', is_active = 1, priority = 140, meta_json = '{}'
WHERE key = 'natal.modality.dominant.fixed' AND locale = 'ru-RU' AND topic_category = 'psychology';

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.modality.dominant.fixed', 'psychology', 'ru-RU', 'Доминирует модальность фиксированная: сильные стороны — устойчивость, доведение до результата, верность выбранному. Риски — застревание, сопротивление переменам. Практика: выбери один процесс, где нужен баланс, и добавь недостающую стадию (старт/стабилизация/адаптация) на неделю.', 140, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.modality.dominant.fixed' AND locale = 'ru-RU' AND topic_category = 'psychology'
);

UPDATE knowledge_items
SET text = 'Стихия Вода выражена на уровне 1. Это задаёт привычный способ включаться в жизнь: через смысл/действие (Огонь), практику/материальность (Земля), идеи/контакты (Воздух), чувства/интуицию (Вода). Практика: в сложной ситуации попробуй «перевести» задачу на язык этой стихии и посмотри, что упростится.', is_active = 1, priority = 140, meta_json = '{}'
WHERE key = 'natal.elements.water.count.1' AND locale = 'ru-RU' AND topic_category = 'psychology';

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.elements.water.count.1', 'psychology', 'ru-RU', 'Стихия Вода выражена на уровне 1. Это задаёт привычный способ включаться в жизнь: через смысл/действие (Огонь), практику/материальность (Земля), идеи/контакты (Воздух), чувства/интуицию (Вода). Практика: в сложной ситуации попробуй «перевести» задачу на язык этой стихии и посмотри, что упростится.', 140, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.elements.water.count.1' AND locale = 'ru-RU' AND topic_category = 'psychology'
);

UPDATE knowledge_items
SET text = 'Стихия Земля выражена на уровне 3. Это задаёт привычный способ включаться в жизнь: через смысл/действие (Огонь), практику/материальность (Земля), идеи/контакты (Воздух), чувства/интуицию (Вода). Практика: в сложной ситуации попробуй «перевести» задачу на язык этой стихии и посмотри, что упростится.', is_active = 1, priority = 140, meta_json = '{}'
WHERE key = 'natal.elements.earth.count.3' AND locale = 'ru-RU' AND topic_category = 'psychology';

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.elements.earth.count.3', 'psychology', 'ru-RU', 'Стихия Земля выражена на уровне 3. Это задаёт привычный способ включаться в жизнь: через смысл/действие (Огонь), практику/материальность (Земля), идеи/контакты (Воздух), чувства/интуицию (Вода). Практика: в сложной ситуации попробуй «перевести» задачу на язык этой стихии и посмотри, что упростится.', 140, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.elements.earth.count.3' AND locale = 'ru-RU' AND topic_category = 'psychology'
);

UPDATE knowledge_items
SET text = 'Стихия Огонь выражена на уровне 3. Это задаёт привычный способ включаться в жизнь: через смысл/действие (Огонь), практику/материальность (Земля), идеи/контакты (Воздух), чувства/интуицию (Вода). Практика: в сложной ситуации попробуй «перевести» задачу на язык этой стихии и посмотри, что упростится.', is_active = 1, priority = 140, meta_json = '{}'
WHERE key = 'natal.elements.fire.count.3' AND locale = 'ru-RU' AND topic_category = 'psychology';

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.elements.fire.count.3', 'psychology', 'ru-RU', 'Стихия Огонь выражена на уровне 3. Это задаёт привычный способ включаться в жизнь: через смысл/действие (Огонь), практику/материальность (Земля), идеи/контакты (Воздух), чувства/интуицию (Вода). Практика: в сложной ситуации попробуй «перевести» задачу на язык этой стихии и посмотри, что упростится.', 140, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.elements.fire.count.3' AND locale = 'ru-RU' AND topic_category = 'psychology'
);

UPDATE knowledge_items
SET text = 'Стихия Воздух выражена на уровне 3. Это задаёт привычный способ включаться в жизнь: через смысл/действие (Огонь), практику/материальность (Земля), идеи/контакты (Воздух), чувства/интуицию (Вода). Практика: в сложной ситуации попробуй «перевести» задачу на язык этой стихии и посмотри, что упростится.', is_active = 1, priority = 140, meta_json = '{}'
WHERE key = 'natal.elements.air.count.3' AND locale = 'ru-RU' AND topic_category = 'psychology';

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.elements.air.count.3', 'psychology', 'ru-RU', 'Стихия Воздух выражена на уровне 3. Это задаёт привычный способ включаться в жизнь: через смысл/действие (Огонь), практику/материальность (Земля), идеи/контакты (Воздух), чувства/интуицию (Вода). Практика: в сложной ситуации попробуй «перевести» задачу на язык этой стихии и посмотри, что упростится.', 140, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.elements.air.count.3' AND locale = 'ru-RU' AND topic_category = 'psychology'
);

UPDATE knowledge_items
SET text = 'Натальный маркер (natal.psychology.generic): это подсказка о стиле реакции и типичных сценариях. Практика: отследи, как это проявляется 7 дней (триггеры → реакция → результат) и выбери одну настройку поведения (границы, темп, коммуникация, режим восстановления).', is_active = 1, priority = 140, meta_json = '{}'
WHERE key = 'natal.psychology.generic' AND locale = 'ru-RU' AND topic_category = 'psychology';

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.psychology.generic', 'psychology', 'ru-RU', 'Натальный маркер (natal.psychology.generic): это подсказка о стиле реакции и типичных сценариях. Практика: отследи, как это проявляется 7 дней (триггеры → реакция → результат) и выбери одну настройку поведения (границы, темп, коммуникация, режим восстановления).', 140, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.psychology.generic' AND locale = 'ru-RU' AND topic_category = 'psychology'
);

UPDATE knowledge_items
SET text = 'Рак заметно проявлен в карте. Сильные стороны: эмпатия, забота, интуиция, память. Риски перекоса: ранимость, обидчивость, уход в защиту. Практика: выбери 1 сильную сторону и 1 риск и закрепи их в конкретном действии на неделю (что усиливаю, что ограничиваю, по каким признакам пойму, что баланс соблюдён).', is_active = 1, priority = 140, meta_json = '{}'
WHERE key = 'natal.sign.cancer.present' AND locale = 'ru-RU' AND topic_category = 'psychology';

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.sign.cancer.present', 'psychology', 'ru-RU', 'Рак заметно проявлен в карте. Сильные стороны: эмпатия, забота, интуиция, память. Риски перекоса: ранимость, обидчивость, уход в защиту. Практика: выбери 1 сильную сторону и 1 риск и закрепи их в конкретном действии на неделю (что усиливаю, что ограничиваю, по каким признакам пойму, что баланс соблюдён).', 140, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.sign.cancer.present' AND locale = 'ru-RU' AND topic_category = 'psychology'
);

UPDATE knowledge_items
SET text = 'Лев заметно проявлен в карте. Сильные стороны: самовыражение, лидерство, творчество. Риски перекоса: самолюбие, драматизация, зависимость от оценки. Практика: выбери 1 сильную сторону и 1 риск и закрепи их в конкретном действии на неделю (что усиливаю, что ограничиваю, по каким признакам пойму, что баланс соблюдён).', is_active = 1, priority = 140, meta_json = '{}'
WHERE key = 'natal.sign.leo.present' AND locale = 'ru-RU' AND topic_category = 'psychology';

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.sign.leo.present', 'psychology', 'ru-RU', 'Лев заметно проявлен в карте. Сильные стороны: самовыражение, лидерство, творчество. Риски перекоса: самолюбие, драматизация, зависимость от оценки. Практика: выбери 1 сильную сторону и 1 риск и закрепи их в конкретном действии на неделю (что усиливаю, что ограничиваю, по каким признакам пойму, что баланс соблюдён).', 140, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.sign.leo.present' AND locale = 'ru-RU' AND topic_category = 'psychology'
);

UPDATE knowledge_items
SET text = 'Рыбы заметно проявлен в карте. Сильные стороны: воображение, сострадание, тонкость, вдохновение. Риски перекоса: размытые границы, избегание, иллюзии. Практика: выбери 1 сильную сторону и 1 риск и закрепи их в конкретном действии на неделю (что усиливаю, что ограничиваю, по каким признакам пойму, что баланс соблюдён).', is_active = 1, priority = 140, meta_json = '{}'
WHERE key = 'natal.sign.pisces.present' AND locale = 'ru-RU' AND topic_category = 'psychology';

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.sign.pisces.present', 'psychology', 'ru-RU', 'Рыбы заметно проявлен в карте. Сильные стороны: воображение, сострадание, тонкость, вдохновение. Риски перекоса: размытые границы, избегание, иллюзии. Практика: выбери 1 сильную сторону и 1 риск и закрепи их в конкретном действии на неделю (что усиливаю, что ограничиваю, по каким признакам пойму, что баланс соблюдён).', 140, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.sign.pisces.present' AND locale = 'ru-RU' AND topic_category = 'psychology'
);

UPDATE knowledge_items
SET text = 'Дева заметно проявлен в карте. Сильные стороны: точность, анализ, полезность, порядок. Риски перекоса: критичность, тревожность, перфекционизм. Практика: выбери 1 сильную сторону и 1 риск и закрепи их в конкретном действии на неделю (что усиливаю, что ограничиваю, по каким признакам пойму, что баланс соблюдён).', is_active = 1, priority = 140, meta_json = '{}'
WHERE key = 'natal.sign.virgo.present' AND locale = 'ru-RU' AND topic_category = 'psychology';

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.sign.virgo.present', 'psychology', 'ru-RU', 'Дева заметно проявлен в карте. Сильные стороны: точность, анализ, полезность, порядок. Риски перекоса: критичность, тревожность, перфекционизм. Практика: выбери 1 сильную сторону и 1 риск и закрепи их в конкретном действии на неделю (что усиливаю, что ограничиваю, по каким признакам пойму, что баланс соблюдён).', 140, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.sign.virgo.present' AND locale = 'ru-RU' AND topic_category = 'psychology'
);

UPDATE knowledge_items
SET text = 'Телец заметно проявлен в карте. Сильные стороны: устойчивость, практичность, вкус и качество. Риски перекоса: инертность, упрямство, страх перемен. Практика: выбери 1 сильную сторону и 1 риск и закрепи их в конкретном действии на неделю (что усиливаю, что ограничиваю, по каким признакам пойму, что баланс соблюдён).', is_active = 1, priority = 140, meta_json = '{}'
WHERE key = 'natal.sign.taurus.present' AND locale = 'ru-RU' AND topic_category = 'psychology';

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.sign.taurus.present', 'psychology', 'ru-RU', 'Телец заметно проявлен в карте. Сильные стороны: устойчивость, практичность, вкус и качество. Риски перекоса: инертность, упрямство, страх перемен. Практика: выбери 1 сильную сторону и 1 риск и закрепи их в конкретном действии на неделю (что усиливаю, что ограничиваю, по каким признакам пойму, что баланс соблюдён).', 140, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.sign.taurus.present' AND locale = 'ru-RU' AND topic_category = 'psychology'
);

UPDATE knowledge_items
SET text = 'Водолей заметно проявлен в карте. Сильные стороны: независимость, инновации, идеи, команда. Риски перекоса: отстранённость, упрямство идей, непредсказуемость. Практика: выбери 1 сильную сторону и 1 риск и закрепи их в конкретном действии на неделю (что усиливаю, что ограничиваю, по каким признакам пойму, что баланс соблюдён).', is_active = 1, priority = 140, meta_json = '{}'
WHERE key = 'natal.sign.aquarius.present' AND locale = 'ru-RU' AND topic_category = 'psychology';

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.sign.aquarius.present', 'psychology', 'ru-RU', 'Водолей заметно проявлен в карте. Сильные стороны: независимость, инновации, идеи, команда. Риски перекоса: отстранённость, упрямство идей, непредсказуемость. Практика: выбери 1 сильную сторону и 1 риск и закрепи их в конкретном действии на неделю (что усиливаю, что ограничиваю, по каким признакам пойму, что баланс соблюдён).', 140, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.sign.aquarius.present' AND locale = 'ru-RU' AND topic_category = 'psychology'
);

UPDATE knowledge_items
SET text = 'Козерог заметно проявлен в карте. Сильные стороны: ответственность, стратегия, дисциплина, результат. Риски перекоса: жёсткость, перегруз, страх ошибки. Практика: выбери 1 сильную сторону и 1 риск и закрепи их в конкретном действии на неделю (что усиливаю, что ограничиваю, по каким признакам пойму, что баланс соблюдён).', is_active = 1, priority = 140, meta_json = '{}'
WHERE key = 'natal.sign.capricorn.present' AND locale = 'ru-RU' AND topic_category = 'psychology';

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.sign.capricorn.present', 'psychology', 'ru-RU', 'Козерог заметно проявлен в карте. Сильные стороны: ответственность, стратегия, дисциплина, результат. Риски перекоса: жёсткость, перегруз, страх ошибки. Практика: выбери 1 сильную сторону и 1 риск и закрепи их в конкретном действии на неделю (что усиливаю, что ограничиваю, по каким признакам пойму, что баланс соблюдён).', 140, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.sign.capricorn.present' AND locale = 'ru-RU' AND topic_category = 'psychology'
);

UPDATE knowledge_items
SET text = 'Стрелец заметно проявлен в карте. Сильные стороны: широта взглядов, смысл, честность, рост. Риски перекоса: прямолинейность, обещания без расчёта, беспокойство. Практика: выбери 1 сильную сторону и 1 риск и закрепи их в конкретном действии на неделю (что усиливаю, что ограничиваю, по каким признакам пойму, что баланс соблюдён).', is_active = 1, priority = 140, meta_json = '{}'
WHERE key = 'natal.sign.sagittarius.present' AND locale = 'ru-RU' AND topic_category = 'psychology';

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.sign.sagittarius.present', 'psychology', 'ru-RU', 'Стрелец заметно проявлен в карте. Сильные стороны: широта взглядов, смысл, честность, рост. Риски перекоса: прямолинейность, обещания без расчёта, беспокойство. Практика: выбери 1 сильную сторону и 1 риск и закрепи их в конкретном действии на неделю (что усиливаю, что ограничиваю, по каким признакам пойму, что баланс соблюдён).', 140, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.sign.sagittarius.present' AND locale = 'ru-RU' AND topic_category = 'psychology'
);

UPDATE knowledge_items
SET text = 'Близнецы заметно проявлен в карте. Сильные стороны: гибкость ума, коммуникации, обучение. Риски перекоса: распыление, поверхностность, нервозность. Практика: выбери 1 сильную сторону и 1 риск и закрепи их в конкретном действии на неделю (что усиливаю, что ограничиваю, по каким признакам пойму, что баланс соблюдён).', is_active = 1, priority = 140, meta_json = '{}'
WHERE key = 'natal.sign.gemini.present' AND locale = 'ru-RU' AND topic_category = 'psychology';

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.sign.gemini.present', 'psychology', 'ru-RU', 'Близнецы заметно проявлен в карте. Сильные стороны: гибкость ума, коммуникации, обучение. Риски перекоса: распыление, поверхностность, нервозность. Практика: выбери 1 сильную сторону и 1 риск и закрепи их в конкретном действии на неделю (что усиливаю, что ограничиваю, по каким признакам пойму, что баланс соблюдён).', 140, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.sign.gemini.present' AND locale = 'ru-RU' AND topic_category = 'psychology'
);

UPDATE knowledge_items
SET text = 'Скорпион заметно проявлен в карте. Сильные стороны: глубина, стойкость, концентрация, трансформация. Риски перекоса: контроль, подозрительность, крайности. Практика: выбери 1 сильную сторону и 1 риск и закрепи их в конкретном действии на неделю (что усиливаю, что ограничиваю, по каким признакам пойму, что баланс соблюдён).', is_active = 1, priority = 140, meta_json = '{}'
WHERE key = 'natal.sign.scorpio.present' AND locale = 'ru-RU' AND topic_category = 'psychology';

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.sign.scorpio.present', 'psychology', 'ru-RU', 'Скорпион заметно проявлен в карте. Сильные стороны: глубина, стойкость, концентрация, трансформация. Риски перекоса: контроль, подозрительность, крайности. Практика: выбери 1 сильную сторону и 1 риск и закрепи их в конкретном действии на неделю (что усиливаю, что ограничиваю, по каким признакам пойму, что баланс соблюдён).', 140, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.sign.scorpio.present' AND locale = 'ru-RU' AND topic_category = 'psychology'
);

COMMIT;

