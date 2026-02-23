-- AUTO-GENERATED. DO NOT EDIT BY HAND.

-- Overrides from debug shortest used blocks (topic_category=how_others_see_me)

-- Source JSON: C:/Projects/superastro/debug_how_others_see_me_ru_160_20260223_140221_mini_topiccore.json

-- Filter: len(text)<= 600, max_keys=250

BEGIN;

UPDATE knowledge_items
SET text = 'Этот блок описывает, какое первое впечатление ты обычно производишь и какой «сигнал» люди считывают до того, как узнают тебя ближе. Сильная сторона — ты быстро задаёшь тон контакта; риск — закрепляться в роли, которая не всегда отражает тебя полностью. Практика: в 3 ситуациях проверь, что меняется, если осознанно поменять один параметр старта (темп, дистанция, прямота, мягкость).', is_active = 1, priority = 140, meta_json = '{}'
WHERE key = 'natal.how_others_see_me.generic' AND locale = 'ru-RU' AND topic_category = 'how_others_see_me';

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.how_others_see_me.generic', 'how_others_see_me', 'ru-RU', 'Этот блок описывает, какое первое впечатление ты обычно производишь и какой «сигнал» люди считывают до того, как узнают тебя ближе. Сильная сторона — ты быстро задаёшь тон контакта; риск — закрепляться в роли, которая не всегда отражает тебя полностью. Практика: в 3 ситуациях проверь, что меняется, если осознанно поменять один параметр старта (темп, дистанция, прямота, мягкость).', 140, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.how_others_see_me.generic' AND locale = 'ru-RU' AND topic_category = 'how_others_see_me'
);

UPDATE knowledge_items
SET text = 'Куспид 1 дома показывает стиль самопрезентации: как ты заявляешь о себе, входишь в роль и берёшь инициативу. Это не «маска», а стартовая стратегия поведения. Практика: в новых ситуациях заранее выбери 1 опорное правило (что считаю нормой, где границы, какой темп) и придерживайся его.', is_active = 1, priority = 140, meta_json = '{}'
WHERE key = 'natal.house.1.cusp.sign.any' AND locale = 'ru-RU' AND topic_category = 'how_others_see_me';

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.1.cusp.sign.any', 'how_others_see_me', 'ru-RU', 'Куспид 1 дома показывает стиль самопрезентации: как ты заявляешь о себе, входишь в роль и берёшь инициативу. Это не «маска», а стартовая стратегия поведения. Практика: в новых ситуациях заранее выбери 1 опорное правило (что считаю нормой, где границы, какой темп) и придерживайся его.', 140, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.1.cusp.sign.any' AND locale = 'ru-RU' AND topic_category = 'how_others_see_me'
);

UPDATE knowledge_items
SET text = 'Куспид 1 дома в Рыбы: самопрезентация и старт инициативы идут через качества Рыбы. Сильная сторона: воображение, сострадание, тонкость, вдохновение. Риск: размытые границы, избегание, иллюзии. Практика: опиши свою «стартовую формулу» в 1–2 фразы и проверь, как она меняет реакцию людей.', is_active = 1, priority = 140, meta_json = '{}'
WHERE key = 'natal.house.1.cusp.sign.pisces' AND locale = 'ru-RU' AND topic_category = 'how_others_see_me';

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.1.cusp.sign.pisces', 'how_others_see_me', 'ru-RU', 'Куспид 1 дома в Рыбы: самопрезентация и старт инициативы идут через качества Рыбы. Сильная сторона: воображение, сострадание, тонкость, вдохновение. Риск: размытые границы, избегание, иллюзии. Практика: опиши свою «стартовую формулу» в 1–2 фразы и проверь, как она меняет реакцию людей.', 140, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.1.cusp.sign.pisces' AND locale = 'ru-RU' AND topic_category = 'how_others_see_me'
);

UPDATE knowledge_items
SET text = 'Управитель 1 дома — ключ к тому, как работает твой стиль проявления: через какие мотивы ты действуешь и где ищешь опору. Он помогает понять, что усиливает уверенность и что сбивает контакт. Практика: отслеживай 7 дней: что запускает инициативу и что её гасит — и сохрани 1 рабочий паттерн.', is_active = 1, priority = 140, meta_json = '{}'
WHERE key = 'natal.house.1.ruler.any' AND locale = 'ru-RU' AND topic_category = 'how_others_see_me';

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.1.ruler.any', 'how_others_see_me', 'ru-RU', 'Управитель 1 дома — ключ к тому, как работает твой стиль проявления: через какие мотивы ты действуешь и где ищешь опору. Он помогает понять, что усиливает уверенность и что сбивает контакт. Практика: отслеживай 7 дней: что запускает инициативу и что её гасит — и сохрани 1 рабочий паттерн.', 140, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.1.ruler.any' AND locale = 'ru-RU' AND topic_category = 'how_others_see_me'
);

UPDATE knowledge_items
SET text = 'Юпитер в 1 доме усиливает заметность качеств планеты в образе и поведении. Сильная сторона — быстрее проявляешь эту функцию; риск — реагировать ею автоматически, особенно под стрессом. Практика: определи 1 полезную форму проявления планеты и 1 нежелательную — и введи «стоп-сигнал» для контроля.', is_active = 1, priority = 140, meta_json = '{}'
WHERE key = 'natal.house.1.planet.jupiter' AND locale = 'ru-RU' AND topic_category = 'how_others_see_me';

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.1.planet.jupiter', 'how_others_see_me', 'ru-RU', 'Юпитер в 1 доме усиливает заметность качеств планеты в образе и поведении. Сильная сторона — быстрее проявляешь эту функцию; риск — реагировать ею автоматически, особенно под стрессом. Практика: определи 1 полезную форму проявления планеты и 1 нежелательную — и введи «стоп-сигнал» для контроля.', 140, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.1.planet.jupiter' AND locale = 'ru-RU' AND topic_category = 'how_others_see_me'
);

UPDATE knowledge_items
SET text = 'Управитель 1 дома — Юпитер: самопрезентация и «я-стиль» идут через функции этой планеты. Сильная сторона — проще проявлять качества планеты осознанно. Риск — отождествляться с одной ролью. Практика: выбери 1 ситуацию, где ты хочешь звучать увереннее, и включи качество планеты в конкретном действии.', is_active = 1, priority = 140, meta_json = '{}'
WHERE key = 'natal.house.1.ruler.jupiter' AND locale = 'ru-RU' AND topic_category = 'how_others_see_me';

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.1.ruler.jupiter', 'how_others_see_me', 'ru-RU', 'Управитель 1 дома — Юпитер: самопрезентация и «я-стиль» идут через функции этой планеты. Сильная сторона — проще проявлять качества планеты осознанно. Риск — отождествляться с одной ролью. Практика: выбери 1 ситуацию, где ты хочешь звучать увереннее, и включи качество планеты в конкретном действии.', 140, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.1.ruler.jupiter' AND locale = 'ru-RU' AND topic_category = 'how_others_see_me'
);

UPDATE knowledge_items
SET text = 'Управитель 1 дома — Нептун: самопрезентация и «я-стиль» идут через функции этой планеты. Сильная сторона — проще проявлять качества планеты осознанно. Риск — отождествляться с одной ролью. Практика: выбери 1 ситуацию, где ты хочешь звучать увереннее, и включи качество планеты в конкретном действии.', is_active = 1, priority = 140, meta_json = '{}'
WHERE key = 'natal.house.1.ruler.neptune' AND locale = 'ru-RU' AND topic_category = 'how_others_see_me';

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.1.ruler.neptune', 'how_others_see_me', 'ru-RU', 'Управитель 1 дома — Нептун: самопрезентация и «я-стиль» идут через функции этой планеты. Сильная сторона — проще проявлять качества планеты осознанно. Риск — отождествляться с одной ролью. Практика: выбери 1 ситуацию, где ты хочешь звучать увереннее, и включи качество планеты в конкретном действии.', 140, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.1.ruler.neptune' AND locale = 'ru-RU' AND topic_category = 'how_others_see_me'
);

UPDATE knowledge_items
SET text = 'Рак заметно проявлен в карте. Сильные стороны: эмпатия, забота, интуиция, память. Риски перекоса: ранимость, обидчивость, уход в защиту. Практика: выбери 1 сильную сторону и 1 риск и закрепи их в конкретном действии на неделю (что усиливаю, что ограничиваю, по каким признакам пойму, что баланс соблюдён).', is_active = 1, priority = 140, meta_json = '{}'
WHERE key = 'natal.sign.cancer.present' AND locale = 'ru-RU' AND topic_category = 'how_others_see_me';

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.sign.cancer.present', 'how_others_see_me', 'ru-RU', 'Рак заметно проявлен в карте. Сильные стороны: эмпатия, забота, интуиция, память. Риски перекоса: ранимость, обидчивость, уход в защиту. Практика: выбери 1 сильную сторону и 1 риск и закрепи их в конкретном действии на неделю (что усиливаю, что ограничиваю, по каким признакам пойму, что баланс соблюдён).', 140, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.sign.cancer.present' AND locale = 'ru-RU' AND topic_category = 'how_others_see_me'
);

UPDATE knowledge_items
SET text = 'ASC (Асцендент) — твоя «первая подача»: как ты входишь в контакт и как тебя считывают в начале. Он влияет на манеру поведения, темп, язык тела и то, как ты запускаешь новые ситуации. Практика: в ближайшем общении проверь, что ты транслируешь на старте (тон/скорость/границы) и как это влияет на ответ людей.', is_active = 1, priority = 140, meta_json = '{}'
WHERE key = 'natal.angle.asc' AND locale = 'ru-RU' AND topic_category = 'how_others_see_me';

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.angle.asc', 'how_others_see_me', 'ru-RU', 'ASC (Асцендент) — твоя «первая подача»: как ты входишь в контакт и как тебя считывают в начале. Он влияет на манеру поведения, темп, язык тела и то, как ты запускаешь новые ситуации. Практика: в ближайшем общении проверь, что ты транслируешь на старте (тон/скорость/границы) и как это влияет на ответ людей.', 140, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.angle.asc' AND locale = 'ru-RU' AND topic_category = 'how_others_see_me'
);

UPDATE knowledge_items
SET text = 'Дева заметно проявлен в карте. Сильные стороны: точность, анализ, полезность, порядок. Риски перекоса: критичность, тревожность, перфекционизм. Практика: выбери 1 сильную сторону и 1 риск и закрепи их в конкретном действии на неделю (что усиливаю, что ограничиваю, по каким признакам пойму, что баланс соблюдён).', is_active = 1, priority = 140, meta_json = '{}'
WHERE key = 'natal.sign.virgo.present' AND locale = 'ru-RU' AND topic_category = 'how_others_see_me';

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.sign.virgo.present', 'how_others_see_me', 'ru-RU', 'Дева заметно проявлен в карте. Сильные стороны: точность, анализ, полезность, порядок. Риски перекоса: критичность, тревожность, перфекционизм. Практика: выбери 1 сильную сторону и 1 риск и закрепи их в конкретном действии на неделю (что усиливаю, что ограничиваю, по каким признакам пойму, что баланс соблюдён).', 140, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.sign.virgo.present' AND locale = 'ru-RU' AND topic_category = 'how_others_see_me'
);

UPDATE knowledge_items
SET text = 'Управитель 1 дома (Юпитер) в аспекте секстиль с Марс: это влияет на манеру проявляться и на то, как считывают твои намерения. Обычно это даёт ресурс и проще превращается в навык/результат. Практика: в ситуациях «на публике» выбери один якорь (пауза перед ответом, ясное «да/нет», спокойный темп) и тренируй 7 дней.', is_active = 1, priority = 140, meta_json = '{}'
WHERE key = 'natal.house.1.ruler.jupiter.aspect.sextile.mars' AND locale = 'ru-RU' AND topic_category = 'how_others_see_me';

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.1.ruler.jupiter.aspect.sextile.mars', 'how_others_see_me', 'ru-RU', 'Управитель 1 дома (Юпитер) в аспекте секстиль с Марс: это влияет на манеру проявляться и на то, как считывают твои намерения. Обычно это даёт ресурс и проще превращается в навык/результат. Практика: в ситуациях «на публике» выбери один якорь (пауза перед ответом, ясное «да/нет», спокойный темп) и тренируй 7 дней.', 140, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.1.ruler.jupiter.aspect.sextile.mars' AND locale = 'ru-RU' AND topic_category = 'how_others_see_me'
);

UPDATE knowledge_items
SET text = 'Аспекты управителя 1 дома (Юпитер) показывают, что усиливает или усложняет твою самопрезентацию. Гармоничные аспекты дают естественный ресурс, напряжённые требуют навыка управления реакцией. Практика: найди 1 повторяющийся триггер (критика/дедлайн/сравнение) и заранее задай правило поведения для стабильного образа.', is_active = 1, priority = 140, meta_json = '{}'
WHERE key = 'natal.house.1.ruler.jupiter.aspects.present' AND locale = 'ru-RU' AND topic_category = 'how_others_see_me';

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.1.ruler.jupiter.aspects.present', 'how_others_see_me', 'ru-RU', 'Аспекты управителя 1 дома (Юпитер) показывают, что усиливает или усложняет твою самопрезентацию. Гармоничные аспекты дают естественный ресурс, напряжённые требуют навыка управления реакцией. Практика: найди 1 повторяющийся триггер (критика/дедлайн/сравнение) и заранее задай правило поведения для стабильного образа.', 140, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.1.ruler.jupiter.aspects.present' AND locale = 'ru-RU' AND topic_category = 'how_others_see_me'
);

UPDATE knowledge_items
SET text = 'Управитель 1 дома (Нептун) в аспекте секстиль с Венера: это влияет на манеру проявляться и на то, как считывают твои намерения. Обычно это даёт ресурс и проще превращается в навык/результат. Практика: в ситуациях «на публике» выбери один якорь (пауза перед ответом, ясное «да/нет», спокойный темп) и тренируй 7 дней.', is_active = 1, priority = 140, meta_json = '{}'
WHERE key = 'natal.house.1.ruler.neptune.aspect.sextile.venus' AND locale = 'ru-RU' AND topic_category = 'how_others_see_me';

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.1.ruler.neptune.aspect.sextile.venus', 'how_others_see_me', 'ru-RU', 'Управитель 1 дома (Нептун) в аспекте секстиль с Венера: это влияет на манеру проявляться и на то, как считывают твои намерения. Обычно это даёт ресурс и проще превращается в навык/результат. Практика: в ситуациях «на публике» выбери один якорь (пауза перед ответом, ясное «да/нет», спокойный темп) и тренируй 7 дней.', 140, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.1.ruler.neptune.aspect.sextile.venus' AND locale = 'ru-RU' AND topic_category = 'how_others_see_me'
);

UPDATE knowledge_items
SET text = 'Аспекты управителя 1 дома (Нептун) показывают, что усиливает или усложняет твою самопрезентацию. Гармоничные аспекты дают естественный ресурс, напряжённые требуют навыка управления реакцией. Практика: найди 1 повторяющийся триггер (критика/дедлайн/сравнение) и заранее задай правило поведения для стабильного образа.', is_active = 1, priority = 140, meta_json = '{}'
WHERE key = 'natal.house.1.ruler.neptune.aspects.present' AND locale = 'ru-RU' AND topic_category = 'how_others_see_me';

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.1.ruler.neptune.aspects.present', 'how_others_see_me', 'ru-RU', 'Аспекты управителя 1 дома (Нептун) показывают, что усиливает или усложняет твою самопрезентацию. Гармоничные аспекты дают естественный ресурс, напряжённые требуют навыка управления реакцией. Практика: найди 1 повторяющийся триггер (критика/дедлайн/сравнение) и заранее задай правило поведения для стабильного образа.', 140, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.1.ruler.neptune.aspects.present' AND locale = 'ru-RU' AND topic_category = 'how_others_see_me'
);

UPDATE knowledge_items
SET text = 'Близнецы заметно проявлен в карте. Сильные стороны: гибкость ума, коммуникации, обучение. Риски перекоса: распыление, поверхностность, нервозность. Практика: выбери 1 сильную сторону и 1 риск и закрепи их в конкретном действии на неделю (что усиливаю, что ограничиваю, по каким признакам пойму, что баланс соблюдён).', is_active = 1, priority = 140, meta_json = '{}'
WHERE key = 'natal.sign.gemini.present' AND locale = 'ru-RU' AND topic_category = 'how_others_see_me';

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.sign.gemini.present', 'how_others_see_me', 'ru-RU', 'Близнецы заметно проявлен в карте. Сильные стороны: гибкость ума, коммуникации, обучение. Риски перекоса: распыление, поверхностность, нервозность. Практика: выбери 1 сильную сторону и 1 риск и закрепи их в конкретном действии на неделю (что усиливаю, что ограничиваю, по каким признакам пойму, что баланс соблюдён).', 140, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.sign.gemini.present' AND locale = 'ru-RU' AND topic_category = 'how_others_see_me'
);

UPDATE knowledge_items
SET text = 'Телец заметно проявлен в карте. Сильные стороны: устойчивость, практичность, вкус и качество. Риски перекоса: инертность, упрямство, страх перемен. Практика: выбери 1 сильную сторону и 1 риск и закрепи их в конкретном действии на неделю (что усиливаю, что ограничиваю, по каким признакам пойму, что баланс соблюдён).', is_active = 1, priority = 140, meta_json = '{}'
WHERE key = 'natal.sign.taurus.present' AND locale = 'ru-RU' AND topic_category = 'how_others_see_me';

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.sign.taurus.present', 'how_others_see_me', 'ru-RU', 'Телец заметно проявлен в карте. Сильные стороны: устойчивость, практичность, вкус и качество. Риски перекоса: инертность, упрямство, страх перемен. Практика: выбери 1 сильную сторону и 1 риск и закрепи их в конкретном действии на неделю (что усиливаю, что ограничиваю, по каким признакам пойму, что баланс соблюдён).', 140, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.sign.taurus.present' AND locale = 'ru-RU' AND topic_category = 'how_others_see_me'
);

UPDATE knowledge_items
SET text = 'Лев заметно проявлен в карте. Сильные стороны: самовыражение, лидерство, творчество. Риски перекоса: самолюбие, драматизация, зависимость от оценки. Практика: выбери 1 сильную сторону и 1 риск и закрепи их в конкретном действии на неделю (что усиливаю, что ограничиваю, по каким признакам пойму, что баланс соблюдён).', is_active = 1, priority = 140, meta_json = '{}'
WHERE key = 'natal.sign.leo.present' AND locale = 'ru-RU' AND topic_category = 'how_others_see_me';

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.sign.leo.present', 'how_others_see_me', 'ru-RU', 'Лев заметно проявлен в карте. Сильные стороны: самовыражение, лидерство, творчество. Риски перекоса: самолюбие, драматизация, зависимость от оценки. Практика: выбери 1 сильную сторону и 1 риск и закрепи их в конкретном действии на неделю (что усиливаю, что ограничиваю, по каким признакам пойму, что баланс соблюдён).', 140, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.sign.leo.present' AND locale = 'ru-RU' AND topic_category = 'how_others_see_me'
);

UPDATE knowledge_items
SET text = 'Рыбы заметно проявлен в карте. Сильные стороны: воображение, сострадание, тонкость, вдохновение. Риски перекоса: размытые границы, избегание, иллюзии. Практика: выбери 1 сильную сторону и 1 риск и закрепи их в конкретном действии на неделю (что усиливаю, что ограничиваю, по каким признакам пойму, что баланс соблюдён).', is_active = 1, priority = 140, meta_json = '{}'
WHERE key = 'natal.sign.pisces.present' AND locale = 'ru-RU' AND topic_category = 'how_others_see_me';

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.sign.pisces.present', 'how_others_see_me', 'ru-RU', 'Рыбы заметно проявлен в карте. Сильные стороны: воображение, сострадание, тонкость, вдохновение. Риски перекоса: размытые границы, избегание, иллюзии. Практика: выбери 1 сильную сторону и 1 риск и закрепи их в конкретном действии на неделю (что усиливаю, что ограничиваю, по каким признакам пойму, что баланс соблюдён).', 140, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.sign.pisces.present' AND locale = 'ru-RU' AND topic_category = 'how_others_see_me'
);

UPDATE knowledge_items
SET text = 'Козерог заметно проявлен в карте. Сильные стороны: ответственность, стратегия, дисциплина, результат. Риски перекоса: жёсткость, перегруз, страх ошибки. Практика: выбери 1 сильную сторону и 1 риск и закрепи их в конкретном действии на неделю (что усиливаю, что ограничиваю, по каким признакам пойму, что баланс соблюдён).', is_active = 1, priority = 140, meta_json = '{}'
WHERE key = 'natal.sign.capricorn.present' AND locale = 'ru-RU' AND topic_category = 'how_others_see_me';

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.sign.capricorn.present', 'how_others_see_me', 'ru-RU', 'Козерог заметно проявлен в карте. Сильные стороны: ответственность, стратегия, дисциплина, результат. Риски перекоса: жёсткость, перегруз, страх ошибки. Практика: выбери 1 сильную сторону и 1 риск и закрепи их в конкретном действии на неделю (что усиливаю, что ограничиваю, по каким признакам пойму, что баланс соблюдён).', 140, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.sign.capricorn.present' AND locale = 'ru-RU' AND topic_category = 'how_others_see_me'
);

UPDATE knowledge_items
SET text = 'Скорпион заметно проявлен в карте. Сильные стороны: глубина, стойкость, концентрация, трансформация. Риски перекоса: контроль, подозрительность, крайности. Практика: выбери 1 сильную сторону и 1 риск и закрепи их в конкретном действии на неделю (что усиливаю, что ограничиваю, по каким признакам пойму, что баланс соблюдён).', is_active = 1, priority = 140, meta_json = '{}'
WHERE key = 'natal.sign.scorpio.present' AND locale = 'ru-RU' AND topic_category = 'how_others_see_me';

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.sign.scorpio.present', 'how_others_see_me', 'ru-RU', 'Скорпион заметно проявлен в карте. Сильные стороны: глубина, стойкость, концентрация, трансформация. Риски перекоса: контроль, подозрительность, крайности. Практика: выбери 1 сильную сторону и 1 риск и закрепи их в конкретном действии на неделю (что усиливаю, что ограничиваю, по каким признакам пойму, что баланс соблюдён).', 140, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.sign.scorpio.present' AND locale = 'ru-RU' AND topic_category = 'how_others_see_me'
);

UPDATE knowledge_items
SET text = 'ASC в знаке Рыбы: первое впечатление и стартовые реакции окрашены качествами знака. Сильная сторона: воображение, сострадание, тонкость, вдохновение. Риск: размытые границы, избегание, иллюзии. Практика: выбери один «мягкий» регулятор (темп, дистанция, формулировки) и подстрой его, чтобы сильная сторона работала без перегиба.', is_active = 1, priority = 140, meta_json = '{}'
WHERE key = 'natal.angle.asc.sign.pisces' AND locale = 'ru-RU' AND topic_category = 'how_others_see_me';

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.angle.asc.sign.pisces', 'how_others_see_me', 'ru-RU', 'ASC в знаке Рыбы: первое впечатление и стартовые реакции окрашены качествами знака. Сильная сторона: воображение, сострадание, тонкость, вдохновение. Риск: размытые границы, избегание, иллюзии. Практика: выбери один «мягкий» регулятор (темп, дистанция, формулировки) и подстрой его, чтобы сильная сторона работала без перегиба.', 140, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.angle.asc.sign.pisces' AND locale = 'ru-RU' AND topic_category = 'how_others_see_me'
);

UPDATE knowledge_items
SET text = 'Водолей заметно проявлен в карте. Сильные стороны: независимость, инновации, идеи, команда. Риски перекоса: отстранённость, упрямство идей, непредсказуемость. Практика: выбери 1 сильную сторону и 1 риск и закрепи их в конкретном действии на неделю (что усиливаю, что ограничиваю, по каким признакам пойму, что баланс соблюдён).', is_active = 1, priority = 140, meta_json = '{}'
WHERE key = 'natal.sign.aquarius.present' AND locale = 'ru-RU' AND topic_category = 'how_others_see_me';

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.sign.aquarius.present', 'how_others_see_me', 'ru-RU', 'Водолей заметно проявлен в карте. Сильные стороны: независимость, инновации, идеи, команда. Риски перекоса: отстранённость, упрямство идей, непредсказуемость. Практика: выбери 1 сильную сторону и 1 риск и закрепи их в конкретном действии на неделю (что усиливаю, что ограничиваю, по каким признакам пойму, что баланс соблюдён).', 140, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.sign.aquarius.present' AND locale = 'ru-RU' AND topic_category = 'how_others_see_me'
);

UPDATE knowledge_items
SET text = 'Юпитер как управитель 1 дома: то, «как ты себя делаешь», зависит от того, в каком стиле проявляется Юпитер (знак/аспекты). Сильная сторона — легче настраивать образ и тон общения через осознанное поведение. Практика: перед важным контактом выбери 1 настройку (темп, уверенность, аргументы, мягкость) и удерживай её весь разговор.', is_active = 1, priority = 140, meta_json = '{}'
WHERE key = 'natal.house.1.ruler.jupiter.sign.any' AND locale = 'ru-RU' AND topic_category = 'how_others_see_me';

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.1.ruler.jupiter.sign.any', 'how_others_see_me', 'ru-RU', 'Юпитер как управитель 1 дома: то, «как ты себя делаешь», зависит от того, в каком стиле проявляется Юпитер (знак/аспекты). Сильная сторона — легче настраивать образ и тон общения через осознанное поведение. Практика: перед важным контактом выбери 1 настройку (темп, уверенность, аргументы, мягкость) и удерживай её весь разговор.', 140, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.1.ruler.jupiter.sign.any' AND locale = 'ru-RU' AND topic_category = 'how_others_see_me'
);

UPDATE knowledge_items
SET text = 'Нептун как управитель 1 дома: то, «как ты себя делаешь», зависит от того, в каком стиле проявляется Нептун (знак/аспекты). Сильная сторона — легче настраивать образ и тон общения через осознанное поведение. Практика: перед важным контактом выбери 1 настройку (темп, уверенность, аргументы, мягкость) и удерживай её весь разговор.', is_active = 1, priority = 140, meta_json = '{}'
WHERE key = 'natal.house.1.ruler.neptune.sign.any' AND locale = 'ru-RU' AND topic_category = 'how_others_see_me';

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.1.ruler.neptune.sign.any', 'how_others_see_me', 'ru-RU', 'Нептун как управитель 1 дома: то, «как ты себя делаешь», зависит от того, в каком стиле проявляется Нептун (знак/аспекты). Сильная сторона — легче настраивать образ и тон общения через осознанное поведение. Практика: перед важным контактом выбери 1 настройку (темп, уверенность, аргументы, мягкость) и удерживай её весь разговор.', 140, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.1.ruler.neptune.sign.any' AND locale = 'ru-RU' AND topic_category = 'how_others_see_me'
);

UPDATE knowledge_items
SET text = 'Стрелец заметно проявлен в карте. Сильные стороны: широта взглядов, смысл, честность, рост. Риски перекоса: прямолинейность, обещания без расчёта, беспокойство. Практика: выбери 1 сильную сторону и 1 риск и закрепи их в конкретном действии на неделю (что усиливаю, что ограничиваю, по каким признакам пойму, что баланс соблюдён).', is_active = 1, priority = 140, meta_json = '{}'
WHERE key = 'natal.sign.sagittarius.present' AND locale = 'ru-RU' AND topic_category = 'how_others_see_me';

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.sign.sagittarius.present', 'how_others_see_me', 'ru-RU', 'Стрелец заметно проявлен в карте. Сильные стороны: широта взглядов, смысл, честность, рост. Риски перекоса: прямолинейность, обещания без расчёта, беспокойство. Практика: выбери 1 сильную сторону и 1 риск и закрепи их в конкретном действии на неделю (что усиливаю, что ограничиваю, по каким признакам пойму, что баланс соблюдён).', 140, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.sign.sagittarius.present' AND locale = 'ru-RU' AND topic_category = 'how_others_see_me'
);

COMMIT;

