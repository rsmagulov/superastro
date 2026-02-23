-- AUTO-GENERATED. DO NOT EDIT BY HAND.

-- Career depth: MC / house10 / ruler / aspects (topic-specific)

BEGIN;

UPDATE knowledge_items
SET text = 'Карьера и призвание в натальной карте читаются как сочетание: MC (общественный образ и направление реализации), 10-й дом (статус, профессия, видимая роль), управитель 10-го дома (как именно вы реализуетесь), а также аспекты управителя и планеты в 10-м доме (ваши рычаги влияния и зоны роста). Важна логика «сигнал → навык → стратегия»: где легко (гармоничные связи) — там проще расти через практику; где напряжение (квадраты/оппозиции) — там нужен план, границы и устойчивый режим. Если время рождения неточно, аспекты/дома могут быть снижены по точности — тогда ориентируйтесь на знаковую часть и повторяющиеся мотивы.', is_active = 1, priority = 120, meta_json = '{}'
WHERE key = 'natal.career.generic' AND locale = 'ru-RU' AND topic_category = 'career';

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.career.generic', 'career', 'ru-RU', 'Карьера и призвание в натальной карте читаются как сочетание: MC (общественный образ и направление реализации), 10-й дом (статус, профессия, видимая роль), управитель 10-го дома (как именно вы реализуетесь), а также аспекты управителя и планеты в 10-м доме (ваши рычаги влияния и зоны роста). Важна логика «сигнал → навык → стратегия»: где легко (гармоничные связи) — там проще расти через практику; где напряжение (квадраты/оппозиции) — там нужен план, границы и устойчивый режим. Если время рождения неточно, аспекты/дома могут быть снижены по точности — тогда ориентируйтесь на знаковую часть и повторяющиеся мотивы.', 120, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.career.generic' AND locale = 'ru-RU' AND topic_category = 'career'
);

UPDATE knowledge_items
SET text = 'MC в знаке «Овен» задаёт стиль общественной реализации: как вас считывают в профессиональной среде, какие роли вам естественнее, через что вы достигаете статуса. Это не «одна профессия», а вектор: поведение, темп, тип ответственности и критерии успеха.', is_active = 1, priority = 120, meta_json = '{}'
WHERE key = 'natal.angle.mc.sign.aries' AND locale = 'ru-RU' AND topic_category = 'career';

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.angle.mc.sign.aries', 'career', 'ru-RU', 'MC в знаке «Овен» задаёт стиль общественной реализации: как вас считывают в профессиональной среде, какие роли вам естественнее, через что вы достигаете статуса. Это не «одна профессия», а вектор: поведение, темп, тип ответственности и критерии успеха.', 120, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.angle.mc.sign.aries' AND locale = 'ru-RU' AND topic_category = 'career'
);

UPDATE knowledge_items
SET text = 'MC в знаке «Телец» задаёт стиль общественной реализации: как вас считывают в профессиональной среде, какие роли вам естественнее, через что вы достигаете статуса. Это не «одна профессия», а вектор: поведение, темп, тип ответственности и критерии успеха.', is_active = 1, priority = 120, meta_json = '{}'
WHERE key = 'natal.angle.mc.sign.taurus' AND locale = 'ru-RU' AND topic_category = 'career';

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.angle.mc.sign.taurus', 'career', 'ru-RU', 'MC в знаке «Телец» задаёт стиль общественной реализации: как вас считывают в профессиональной среде, какие роли вам естественнее, через что вы достигаете статуса. Это не «одна профессия», а вектор: поведение, темп, тип ответственности и критерии успеха.', 120, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.angle.mc.sign.taurus' AND locale = 'ru-RU' AND topic_category = 'career'
);

UPDATE knowledge_items
SET text = 'MC в знаке «Близнецы» задаёт стиль общественной реализации: как вас считывают в профессиональной среде, какие роли вам естественнее, через что вы достигаете статуса. Это не «одна профессия», а вектор: поведение, темп, тип ответственности и критерии успеха.', is_active = 1, priority = 120, meta_json = '{}'
WHERE key = 'natal.angle.mc.sign.gemini' AND locale = 'ru-RU' AND topic_category = 'career';

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.angle.mc.sign.gemini', 'career', 'ru-RU', 'MC в знаке «Близнецы» задаёт стиль общественной реализации: как вас считывают в профессиональной среде, какие роли вам естественнее, через что вы достигаете статуса. Это не «одна профессия», а вектор: поведение, темп, тип ответственности и критерии успеха.', 120, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.angle.mc.sign.gemini' AND locale = 'ru-RU' AND topic_category = 'career'
);

UPDATE knowledge_items
SET text = 'MC в знаке «Рак» задаёт стиль общественной реализации: как вас считывают в профессиональной среде, какие роли вам естественнее, через что вы достигаете статуса. Это не «одна профессия», а вектор: поведение, темп, тип ответственности и критерии успеха.', is_active = 1, priority = 120, meta_json = '{}'
WHERE key = 'natal.angle.mc.sign.cancer' AND locale = 'ru-RU' AND topic_category = 'career';

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.angle.mc.sign.cancer', 'career', 'ru-RU', 'MC в знаке «Рак» задаёт стиль общественной реализации: как вас считывают в профессиональной среде, какие роли вам естественнее, через что вы достигаете статуса. Это не «одна профессия», а вектор: поведение, темп, тип ответственности и критерии успеха.', 120, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.angle.mc.sign.cancer' AND locale = 'ru-RU' AND topic_category = 'career'
);

UPDATE knowledge_items
SET text = 'MC в знаке «Лев» задаёт стиль общественной реализации: как вас считывают в профессиональной среде, какие роли вам естественнее, через что вы достигаете статуса. Это не «одна профессия», а вектор: поведение, темп, тип ответственности и критерии успеха.', is_active = 1, priority = 120, meta_json = '{}'
WHERE key = 'natal.angle.mc.sign.leo' AND locale = 'ru-RU' AND topic_category = 'career';

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.angle.mc.sign.leo', 'career', 'ru-RU', 'MC в знаке «Лев» задаёт стиль общественной реализации: как вас считывают в профессиональной среде, какие роли вам естественнее, через что вы достигаете статуса. Это не «одна профессия», а вектор: поведение, темп, тип ответственности и критерии успеха.', 120, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.angle.mc.sign.leo' AND locale = 'ru-RU' AND topic_category = 'career'
);

UPDATE knowledge_items
SET text = 'MC в знаке «Дева» задаёт стиль общественной реализации: как вас считывают в профессиональной среде, какие роли вам естественнее, через что вы достигаете статуса. Это не «одна профессия», а вектор: поведение, темп, тип ответственности и критерии успеха.', is_active = 1, priority = 120, meta_json = '{}'
WHERE key = 'natal.angle.mc.sign.virgo' AND locale = 'ru-RU' AND topic_category = 'career';

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.angle.mc.sign.virgo', 'career', 'ru-RU', 'MC в знаке «Дева» задаёт стиль общественной реализации: как вас считывают в профессиональной среде, какие роли вам естественнее, через что вы достигаете статуса. Это не «одна профессия», а вектор: поведение, темп, тип ответственности и критерии успеха.', 120, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.angle.mc.sign.virgo' AND locale = 'ru-RU' AND topic_category = 'career'
);

UPDATE knowledge_items
SET text = 'MC в знаке «Весы» задаёт стиль общественной реализации: как вас считывают в профессиональной среде, какие роли вам естественнее, через что вы достигаете статуса. Это не «одна профессия», а вектор: поведение, темп, тип ответственности и критерии успеха.', is_active = 1, priority = 120, meta_json = '{}'
WHERE key = 'natal.angle.mc.sign.libra' AND locale = 'ru-RU' AND topic_category = 'career';

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.angle.mc.sign.libra', 'career', 'ru-RU', 'MC в знаке «Весы» задаёт стиль общественной реализации: как вас считывают в профессиональной среде, какие роли вам естественнее, через что вы достигаете статуса. Это не «одна профессия», а вектор: поведение, темп, тип ответственности и критерии успеха.', 120, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.angle.mc.sign.libra' AND locale = 'ru-RU' AND topic_category = 'career'
);

UPDATE knowledge_items
SET text = 'MC в знаке «Скорпион» задаёт стиль общественной реализации: как вас считывают в профессиональной среде, какие роли вам естественнее, через что вы достигаете статуса. Это не «одна профессия», а вектор: поведение, темп, тип ответственности и критерии успеха.', is_active = 1, priority = 120, meta_json = '{}'
WHERE key = 'natal.angle.mc.sign.scorpio' AND locale = 'ru-RU' AND topic_category = 'career';

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.angle.mc.sign.scorpio', 'career', 'ru-RU', 'MC в знаке «Скорпион» задаёт стиль общественной реализации: как вас считывают в профессиональной среде, какие роли вам естественнее, через что вы достигаете статуса. Это не «одна профессия», а вектор: поведение, темп, тип ответственности и критерии успеха.', 120, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.angle.mc.sign.scorpio' AND locale = 'ru-RU' AND topic_category = 'career'
);

UPDATE knowledge_items
SET text = 'MC в знаке «Стрелец» задаёт стиль общественной реализации: как вас считывают в профессиональной среде, какие роли вам естественнее, через что вы достигаете статуса. Это не «одна профессия», а вектор: поведение, темп, тип ответственности и критерии успеха.', is_active = 1, priority = 120, meta_json = '{}'
WHERE key = 'natal.angle.mc.sign.sagittarius' AND locale = 'ru-RU' AND topic_category = 'career';

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.angle.mc.sign.sagittarius', 'career', 'ru-RU', 'MC в знаке «Стрелец» задаёт стиль общественной реализации: как вас считывают в профессиональной среде, какие роли вам естественнее, через что вы достигаете статуса. Это не «одна профессия», а вектор: поведение, темп, тип ответственности и критерии успеха.', 120, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.angle.mc.sign.sagittarius' AND locale = 'ru-RU' AND topic_category = 'career'
);

UPDATE knowledge_items
SET text = 'MC в знаке «Козерог» задаёт стиль общественной реализации: как вас считывают в профессиональной среде, какие роли вам естественнее, через что вы достигаете статуса. Это не «одна профессия», а вектор: поведение, темп, тип ответственности и критерии успеха.', is_active = 1, priority = 120, meta_json = '{}'
WHERE key = 'natal.angle.mc.sign.capricorn' AND locale = 'ru-RU' AND topic_category = 'career';

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.angle.mc.sign.capricorn', 'career', 'ru-RU', 'MC в знаке «Козерог» задаёт стиль общественной реализации: как вас считывают в профессиональной среде, какие роли вам естественнее, через что вы достигаете статуса. Это не «одна профессия», а вектор: поведение, темп, тип ответственности и критерии успеха.', 120, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.angle.mc.sign.capricorn' AND locale = 'ru-RU' AND topic_category = 'career'
);

UPDATE knowledge_items
SET text = 'MC в знаке «Водолей» задаёт стиль общественной реализации: как вас считывают в профессиональной среде, какие роли вам естественнее, через что вы достигаете статуса. Это не «одна профессия», а вектор: поведение, темп, тип ответственности и критерии успеха.', is_active = 1, priority = 120, meta_json = '{}'
WHERE key = 'natal.angle.mc.sign.aquarius' AND locale = 'ru-RU' AND topic_category = 'career';

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.angle.mc.sign.aquarius', 'career', 'ru-RU', 'MC в знаке «Водолей» задаёт стиль общественной реализации: как вас считывают в профессиональной среде, какие роли вам естественнее, через что вы достигаете статуса. Это не «одна профессия», а вектор: поведение, темп, тип ответственности и критерии успеха.', 120, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.angle.mc.sign.aquarius' AND locale = 'ru-RU' AND topic_category = 'career'
);

UPDATE knowledge_items
SET text = 'MC в знаке «Рыбы» задаёт стиль общественной реализации: как вас считывают в профессиональной среде, какие роли вам естественнее, через что вы достигаете статуса. Это не «одна профессия», а вектор: поведение, темп, тип ответственности и критерии успеха.', is_active = 1, priority = 120, meta_json = '{}'
WHERE key = 'natal.angle.mc.sign.pisces' AND locale = 'ru-RU' AND topic_category = 'career';

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.angle.mc.sign.pisces', 'career', 'ru-RU', 'MC в знаке «Рыбы» задаёт стиль общественной реализации: как вас считывают в профессиональной среде, какие роли вам естественнее, через что вы достигаете статуса. Это не «одна профессия», а вектор: поведение, темп, тип ответственности и критерии успеха.', 120, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.angle.mc.sign.pisces' AND locale = 'ru-RU' AND topic_category = 'career'
);

UPDATE knowledge_items
SET text = 'MC по стихии «Огонь»: общий стиль профессиональной реализации.', is_active = 1, priority = 120, meta_json = '{}'
WHERE key = 'natal.angle.mc.element.fire' AND locale = 'ru-RU' AND topic_category = 'career';

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.angle.mc.element.fire', 'career', 'ru-RU', 'MC по стихии «Огонь»: общий стиль профессиональной реализации.', 120, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.angle.mc.element.fire' AND locale = 'ru-RU' AND topic_category = 'career'
);

UPDATE knowledge_items
SET text = 'Углы карты по стихии «Огонь»: общий оттенок проявления в мире.', is_active = 1, priority = 120, meta_json = '{}'
WHERE key = 'natal.angle.any.element.fire' AND locale = 'ru-RU' AND topic_category = 'career';

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.angle.any.element.fire', 'career', 'ru-RU', 'Углы карты по стихии «Огонь»: общий оттенок проявления в мире.', 120, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.angle.any.element.fire' AND locale = 'ru-RU' AND topic_category = 'career'
);

UPDATE knowledge_items
SET text = 'MC по стихии «Земля»: общий стиль профессиональной реализации.', is_active = 1, priority = 120, meta_json = '{}'
WHERE key = 'natal.angle.mc.element.earth' AND locale = 'ru-RU' AND topic_category = 'career';

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.angle.mc.element.earth', 'career', 'ru-RU', 'MC по стихии «Земля»: общий стиль профессиональной реализации.', 120, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.angle.mc.element.earth' AND locale = 'ru-RU' AND topic_category = 'career'
);

UPDATE knowledge_items
SET text = 'Углы карты по стихии «Земля»: общий оттенок проявления в мире.', is_active = 1, priority = 120, meta_json = '{}'
WHERE key = 'natal.angle.any.element.earth' AND locale = 'ru-RU' AND topic_category = 'career';

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.angle.any.element.earth', 'career', 'ru-RU', 'Углы карты по стихии «Земля»: общий оттенок проявления в мире.', 120, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.angle.any.element.earth' AND locale = 'ru-RU' AND topic_category = 'career'
);

UPDATE knowledge_items
SET text = 'MC по стихии «Воздух»: общий стиль профессиональной реализации.', is_active = 1, priority = 120, meta_json = '{}'
WHERE key = 'natal.angle.mc.element.air' AND locale = 'ru-RU' AND topic_category = 'career';

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.angle.mc.element.air', 'career', 'ru-RU', 'MC по стихии «Воздух»: общий стиль профессиональной реализации.', 120, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.angle.mc.element.air' AND locale = 'ru-RU' AND topic_category = 'career'
);

UPDATE knowledge_items
SET text = 'Углы карты по стихии «Воздух»: общий оттенок проявления в мире.', is_active = 1, priority = 120, meta_json = '{}'
WHERE key = 'natal.angle.any.element.air' AND locale = 'ru-RU' AND topic_category = 'career';

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.angle.any.element.air', 'career', 'ru-RU', 'Углы карты по стихии «Воздух»: общий оттенок проявления в мире.', 120, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.angle.any.element.air' AND locale = 'ru-RU' AND topic_category = 'career'
);

UPDATE knowledge_items
SET text = 'MC по стихии «Вода»: общий стиль профессиональной реализации.', is_active = 1, priority = 120, meta_json = '{}'
WHERE key = 'natal.angle.mc.element.water' AND locale = 'ru-RU' AND topic_category = 'career';

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.angle.mc.element.water', 'career', 'ru-RU', 'MC по стихии «Вода»: общий стиль профессиональной реализации.', 120, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.angle.mc.element.water' AND locale = 'ru-RU' AND topic_category = 'career'
);

UPDATE knowledge_items
SET text = 'Углы карты по стихии «Вода»: общий оттенок проявления в мире.', is_active = 1, priority = 120, meta_json = '{}'
WHERE key = 'natal.angle.any.element.water' AND locale = 'ru-RU' AND topic_category = 'career';

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.angle.any.element.water', 'career', 'ru-RU', 'Углы карты по стихии «Вода»: общий оттенок проявления в мире.', 120, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.angle.any.element.water' AND locale = 'ru-RU' AND topic_category = 'career'
);

UPDATE knowledge_items
SET text = 'MC по полярности (инь): общий темп и мотивация в карьере.', is_active = 1, priority = 120, meta_json = '{}'
WHERE key = 'natal.angle.mc.polarity.yin' AND locale = 'ru-RU' AND topic_category = 'career';

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.angle.mc.polarity.yin', 'career', 'ru-RU', 'MC по полярности (инь): общий темп и мотивация в карьере.', 120, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.angle.mc.polarity.yin' AND locale = 'ru-RU' AND topic_category = 'career'
);

UPDATE knowledge_items
SET text = 'Углы карты по полярности (инь): общий стиль внешней реализации.', is_active = 1, priority = 120, meta_json = '{}'
WHERE key = 'natal.angle.any.polarity.yin' AND locale = 'ru-RU' AND topic_category = 'career';

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.angle.any.polarity.yin', 'career', 'ru-RU', 'Углы карты по полярности (инь): общий стиль внешней реализации.', 120, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.angle.any.polarity.yin' AND locale = 'ru-RU' AND topic_category = 'career'
);

UPDATE knowledge_items
SET text = 'MC по полярности (ян): общий темп и мотивация в карьере.', is_active = 1, priority = 120, meta_json = '{}'
WHERE key = 'natal.angle.mc.polarity.yang' AND locale = 'ru-RU' AND topic_category = 'career';

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.angle.mc.polarity.yang', 'career', 'ru-RU', 'MC по полярности (ян): общий темп и мотивация в карьере.', 120, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.angle.mc.polarity.yang' AND locale = 'ru-RU' AND topic_category = 'career'
);

UPDATE knowledge_items
SET text = 'Углы карты по полярности (ян): общий стиль внешней реализации.', is_active = 1, priority = 120, meta_json = '{}'
WHERE key = 'natal.angle.any.polarity.yang' AND locale = 'ru-RU' AND topic_category = 'career';

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.angle.any.polarity.yang', 'career', 'ru-RU', 'Углы карты по полярности (ян): общий стиль внешней реализации.', 120, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.angle.any.polarity.yang' AND locale = 'ru-RU' AND topic_category = 'career'
);

UPDATE knowledge_items
SET text = 'MC по полярности (баланс): общий темп и мотивация в карьере.', is_active = 1, priority = 120, meta_json = '{}'
WHERE key = 'natal.angle.mc.polarity.balanced' AND locale = 'ru-RU' AND topic_category = 'career';

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.angle.mc.polarity.balanced', 'career', 'ru-RU', 'MC по полярности (баланс): общий темп и мотивация в карьере.', 120, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.angle.mc.polarity.balanced' AND locale = 'ru-RU' AND topic_category = 'career'
);

UPDATE knowledge_items
SET text = 'Углы карты по полярности (баланс): общий стиль внешней реализации.', is_active = 1, priority = 120, meta_json = '{}'
WHERE key = 'natal.angle.any.polarity.balanced' AND locale = 'ru-RU' AND topic_category = 'career';

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.angle.any.polarity.balanced', 'career', 'ru-RU', 'Углы карты по полярности (баланс): общий стиль внешней реализации.', 120, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.angle.any.polarity.balanced' AND locale = 'ru-RU' AND topic_category = 'career'
);

UPDATE knowledge_items
SET text = 'MC по модальности (кардинальная): как вы запускаете и удерживаете карьерные процессы.', is_active = 1, priority = 120, meta_json = '{}'
WHERE key = 'natal.angle.mc.modality.cardinal' AND locale = 'ru-RU' AND topic_category = 'career';

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.angle.mc.modality.cardinal', 'career', 'ru-RU', 'MC по модальности (кардинальная): как вы запускаете и удерживаете карьерные процессы.', 120, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.angle.mc.modality.cardinal' AND locale = 'ru-RU' AND topic_category = 'career'
);

UPDATE knowledge_items
SET text = 'Углы карты по модальности (кардинальная): общий ритм внешней активности.', is_active = 1, priority = 120, meta_json = '{}'
WHERE key = 'natal.angle.any.modality.cardinal' AND locale = 'ru-RU' AND topic_category = 'career';

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.angle.any.modality.cardinal', 'career', 'ru-RU', 'Углы карты по модальности (кардинальная): общий ритм внешней активности.', 120, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.angle.any.modality.cardinal' AND locale = 'ru-RU' AND topic_category = 'career'
);

UPDATE knowledge_items
SET text = 'MC по модальности (фиксированная): как вы запускаете и удерживаете карьерные процессы.', is_active = 1, priority = 120, meta_json = '{}'
WHERE key = 'natal.angle.mc.modality.fixed' AND locale = 'ru-RU' AND topic_category = 'career';

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.angle.mc.modality.fixed', 'career', 'ru-RU', 'MC по модальности (фиксированная): как вы запускаете и удерживаете карьерные процессы.', 120, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.angle.mc.modality.fixed' AND locale = 'ru-RU' AND topic_category = 'career'
);

UPDATE knowledge_items
SET text = 'Углы карты по модальности (фиксированная): общий ритм внешней активности.', is_active = 1, priority = 120, meta_json = '{}'
WHERE key = 'natal.angle.any.modality.fixed' AND locale = 'ru-RU' AND topic_category = 'career';

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.angle.any.modality.fixed', 'career', 'ru-RU', 'Углы карты по модальности (фиксированная): общий ритм внешней активности.', 120, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.angle.any.modality.fixed' AND locale = 'ru-RU' AND topic_category = 'career'
);

UPDATE knowledge_items
SET text = 'MC по модальности (мутабельная): как вы запускаете и удерживаете карьерные процессы.', is_active = 1, priority = 120, meta_json = '{}'
WHERE key = 'natal.angle.mc.modality.mutable' AND locale = 'ru-RU' AND topic_category = 'career';

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.angle.mc.modality.mutable', 'career', 'ru-RU', 'MC по модальности (мутабельная): как вы запускаете и удерживаете карьерные процессы.', 120, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.angle.mc.modality.mutable' AND locale = 'ru-RU' AND topic_category = 'career'
);

UPDATE knowledge_items
SET text = 'Углы карты по модальности (мутабельная): общий ритм внешней активности.', is_active = 1, priority = 120, meta_json = '{}'
WHERE key = 'natal.angle.any.modality.mutable' AND locale = 'ru-RU' AND topic_category = 'career';

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.angle.any.modality.mutable', 'career', 'ru-RU', 'Углы карты по модальности (мутабельная): общий ритм внешней активности.', 120, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.angle.any.modality.mutable' AND locale = 'ru-RU' AND topic_category = 'career'
);

UPDATE knowledge_items
SET text = 'MC по модальности (баланс): как вы запускаете и удерживаете карьерные процессы.', is_active = 1, priority = 120, meta_json = '{}'
WHERE key = 'natal.angle.mc.modality.balanced' AND locale = 'ru-RU' AND topic_category = 'career';

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.angle.mc.modality.balanced', 'career', 'ru-RU', 'MC по модальности (баланс): как вы запускаете и удерживаете карьерные процессы.', 120, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.angle.mc.modality.balanced' AND locale = 'ru-RU' AND topic_category = 'career'
);

UPDATE knowledge_items
SET text = 'Углы карты по модальности (баланс): общий ритм внешней активности.', is_active = 1, priority = 120, meta_json = '{}'
WHERE key = 'natal.angle.any.modality.balanced' AND locale = 'ru-RU' AND topic_category = 'career';

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.angle.any.modality.balanced', 'career', 'ru-RU', 'Углы карты по модальности (баланс): общий ритм внешней активности.', 120, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.angle.any.modality.balanced' AND locale = 'ru-RU' AND topic_category = 'career'
);

UPDATE knowledge_items
SET text = 'MC: точка карьеры, статуса и общественного образа. Как вы проявляетесь «на виду».', is_active = 1, priority = 120, meta_json = '{}'
WHERE key = 'natal.angle.mc' AND locale = 'ru-RU' AND topic_category = 'career';

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.angle.mc', 'career', 'ru-RU', 'MC: точка карьеры, статуса и общественного образа. Как вы проявляетесь «на виду».', 120, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.angle.mc' AND locale = 'ru-RU' AND topic_category = 'career'
);

UPDATE knowledge_items
SET text = 'Углы карты (ASC/MC/DSC/IC): каркас проявления личности во внешнем мире.', is_active = 1, priority = 120, meta_json = '{}'
WHERE key = 'natal.angle' AND locale = 'ru-RU' AND topic_category = 'career';

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.angle', 'career', 'ru-RU', 'Углы карты (ASC/MC/DSC/IC): каркас проявления личности во внешнем мире.', 120, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.angle' AND locale = 'ru-RU' AND topic_category = 'career'
);

UPDATE knowledge_items
SET text = 'Куспид 10-го дома в «Овен» показывает, каким способом вы обычно строите карьеру: через какой тип задач, какой формат лидерства/служения, какая мотивация держит вас в длинной дистанции. Это базовая «обёртка» карьеры: стиль цели и правила игры, в которых проще всего выигрывать.', is_active = 1, priority = 120, meta_json = '{}'
WHERE key = 'natal.house.10.cusp.sign.aries' AND locale = 'ru-RU' AND topic_category = 'career';

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.10.cusp.sign.aries', 'career', 'ru-RU', 'Куспид 10-го дома в «Овен» показывает, каким способом вы обычно строите карьеру: через какой тип задач, какой формат лидерства/служения, какая мотивация держит вас в длинной дистанции. Это базовая «обёртка» карьеры: стиль цели и правила игры, в которых проще всего выигрывать.', 120, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.10.cusp.sign.aries' AND locale = 'ru-RU' AND topic_category = 'career'
);

UPDATE knowledge_items
SET text = 'Куспид 10-го дома в «Телец» показывает, каким способом вы обычно строите карьеру: через какой тип задач, какой формат лидерства/служения, какая мотивация держит вас в длинной дистанции. Это базовая «обёртка» карьеры: стиль цели и правила игры, в которых проще всего выигрывать.', is_active = 1, priority = 120, meta_json = '{}'
WHERE key = 'natal.house.10.cusp.sign.taurus' AND locale = 'ru-RU' AND topic_category = 'career';

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.10.cusp.sign.taurus', 'career', 'ru-RU', 'Куспид 10-го дома в «Телец» показывает, каким способом вы обычно строите карьеру: через какой тип задач, какой формат лидерства/служения, какая мотивация держит вас в длинной дистанции. Это базовая «обёртка» карьеры: стиль цели и правила игры, в которых проще всего выигрывать.', 120, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.10.cusp.sign.taurus' AND locale = 'ru-RU' AND topic_category = 'career'
);

UPDATE knowledge_items
SET text = 'Куспид 10-го дома в «Близнецы» показывает, каким способом вы обычно строите карьеру: через какой тип задач, какой формат лидерства/служения, какая мотивация держит вас в длинной дистанции. Это базовая «обёртка» карьеры: стиль цели и правила игры, в которых проще всего выигрывать.', is_active = 1, priority = 120, meta_json = '{}'
WHERE key = 'natal.house.10.cusp.sign.gemini' AND locale = 'ru-RU' AND topic_category = 'career';

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.10.cusp.sign.gemini', 'career', 'ru-RU', 'Куспид 10-го дома в «Близнецы» показывает, каким способом вы обычно строите карьеру: через какой тип задач, какой формат лидерства/служения, какая мотивация держит вас в длинной дистанции. Это базовая «обёртка» карьеры: стиль цели и правила игры, в которых проще всего выигрывать.', 120, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.10.cusp.sign.gemini' AND locale = 'ru-RU' AND topic_category = 'career'
);

UPDATE knowledge_items
SET text = 'Куспид 10-го дома в «Рак» показывает, каким способом вы обычно строите карьеру: через какой тип задач, какой формат лидерства/служения, какая мотивация держит вас в длинной дистанции. Это базовая «обёртка» карьеры: стиль цели и правила игры, в которых проще всего выигрывать.', is_active = 1, priority = 120, meta_json = '{}'
WHERE key = 'natal.house.10.cusp.sign.cancer' AND locale = 'ru-RU' AND topic_category = 'career';

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.10.cusp.sign.cancer', 'career', 'ru-RU', 'Куспид 10-го дома в «Рак» показывает, каким способом вы обычно строите карьеру: через какой тип задач, какой формат лидерства/служения, какая мотивация держит вас в длинной дистанции. Это базовая «обёртка» карьеры: стиль цели и правила игры, в которых проще всего выигрывать.', 120, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.10.cusp.sign.cancer' AND locale = 'ru-RU' AND topic_category = 'career'
);

UPDATE knowledge_items
SET text = 'Куспид 10-го дома в «Лев» показывает, каким способом вы обычно строите карьеру: через какой тип задач, какой формат лидерства/служения, какая мотивация держит вас в длинной дистанции. Это базовая «обёртка» карьеры: стиль цели и правила игры, в которых проще всего выигрывать.', is_active = 1, priority = 120, meta_json = '{}'
WHERE key = 'natal.house.10.cusp.sign.leo' AND locale = 'ru-RU' AND topic_category = 'career';

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.10.cusp.sign.leo', 'career', 'ru-RU', 'Куспид 10-го дома в «Лев» показывает, каким способом вы обычно строите карьеру: через какой тип задач, какой формат лидерства/служения, какая мотивация держит вас в длинной дистанции. Это базовая «обёртка» карьеры: стиль цели и правила игры, в которых проще всего выигрывать.', 120, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.10.cusp.sign.leo' AND locale = 'ru-RU' AND topic_category = 'career'
);

UPDATE knowledge_items
SET text = 'Куспид 10-го дома в «Дева» показывает, каким способом вы обычно строите карьеру: через какой тип задач, какой формат лидерства/служения, какая мотивация держит вас в длинной дистанции. Это базовая «обёртка» карьеры: стиль цели и правила игры, в которых проще всего выигрывать.', is_active = 1, priority = 120, meta_json = '{}'
WHERE key = 'natal.house.10.cusp.sign.virgo' AND locale = 'ru-RU' AND topic_category = 'career';

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.10.cusp.sign.virgo', 'career', 'ru-RU', 'Куспид 10-го дома в «Дева» показывает, каким способом вы обычно строите карьеру: через какой тип задач, какой формат лидерства/служения, какая мотивация держит вас в длинной дистанции. Это базовая «обёртка» карьеры: стиль цели и правила игры, в которых проще всего выигрывать.', 120, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.10.cusp.sign.virgo' AND locale = 'ru-RU' AND topic_category = 'career'
);

UPDATE knowledge_items
SET text = 'Куспид 10-го дома в «Весы» показывает, каким способом вы обычно строите карьеру: через какой тип задач, какой формат лидерства/служения, какая мотивация держит вас в длинной дистанции. Это базовая «обёртка» карьеры: стиль цели и правила игры, в которых проще всего выигрывать.', is_active = 1, priority = 120, meta_json = '{}'
WHERE key = 'natal.house.10.cusp.sign.libra' AND locale = 'ru-RU' AND topic_category = 'career';

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.10.cusp.sign.libra', 'career', 'ru-RU', 'Куспид 10-го дома в «Весы» показывает, каким способом вы обычно строите карьеру: через какой тип задач, какой формат лидерства/служения, какая мотивация держит вас в длинной дистанции. Это базовая «обёртка» карьеры: стиль цели и правила игры, в которых проще всего выигрывать.', 120, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.10.cusp.sign.libra' AND locale = 'ru-RU' AND topic_category = 'career'
);

UPDATE knowledge_items
SET text = 'Куспид 10-го дома в «Скорпион» показывает, каким способом вы обычно строите карьеру: через какой тип задач, какой формат лидерства/служения, какая мотивация держит вас в длинной дистанции. Это базовая «обёртка» карьеры: стиль цели и правила игры, в которых проще всего выигрывать.', is_active = 1, priority = 120, meta_json = '{}'
WHERE key = 'natal.house.10.cusp.sign.scorpio' AND locale = 'ru-RU' AND topic_category = 'career';

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.10.cusp.sign.scorpio', 'career', 'ru-RU', 'Куспид 10-го дома в «Скорпион» показывает, каким способом вы обычно строите карьеру: через какой тип задач, какой формат лидерства/служения, какая мотивация держит вас в длинной дистанции. Это базовая «обёртка» карьеры: стиль цели и правила игры, в которых проще всего выигрывать.', 120, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.10.cusp.sign.scorpio' AND locale = 'ru-RU' AND topic_category = 'career'
);

UPDATE knowledge_items
SET text = 'Куспид 10-го дома в «Стрелец» показывает, каким способом вы обычно строите карьеру: через какой тип задач, какой формат лидерства/служения, какая мотивация держит вас в длинной дистанции. Это базовая «обёртка» карьеры: стиль цели и правила игры, в которых проще всего выигрывать.', is_active = 1, priority = 120, meta_json = '{}'
WHERE key = 'natal.house.10.cusp.sign.sagittarius' AND locale = 'ru-RU' AND topic_category = 'career';

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.10.cusp.sign.sagittarius', 'career', 'ru-RU', 'Куспид 10-го дома в «Стрелец» показывает, каким способом вы обычно строите карьеру: через какой тип задач, какой формат лидерства/служения, какая мотивация держит вас в длинной дистанции. Это базовая «обёртка» карьеры: стиль цели и правила игры, в которых проще всего выигрывать.', 120, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.10.cusp.sign.sagittarius' AND locale = 'ru-RU' AND topic_category = 'career'
);

UPDATE knowledge_items
SET text = 'Куспид 10-го дома в «Козерог» показывает, каким способом вы обычно строите карьеру: через какой тип задач, какой формат лидерства/служения, какая мотивация держит вас в длинной дистанции. Это базовая «обёртка» карьеры: стиль цели и правила игры, в которых проще всего выигрывать.', is_active = 1, priority = 120, meta_json = '{}'
WHERE key = 'natal.house.10.cusp.sign.capricorn' AND locale = 'ru-RU' AND topic_category = 'career';

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.10.cusp.sign.capricorn', 'career', 'ru-RU', 'Куспид 10-го дома в «Козерог» показывает, каким способом вы обычно строите карьеру: через какой тип задач, какой формат лидерства/служения, какая мотивация держит вас в длинной дистанции. Это базовая «обёртка» карьеры: стиль цели и правила игры, в которых проще всего выигрывать.', 120, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.10.cusp.sign.capricorn' AND locale = 'ru-RU' AND topic_category = 'career'
);

UPDATE knowledge_items
SET text = 'Куспид 10-го дома в «Водолей» показывает, каким способом вы обычно строите карьеру: через какой тип задач, какой формат лидерства/служения, какая мотивация держит вас в длинной дистанции. Это базовая «обёртка» карьеры: стиль цели и правила игры, в которых проще всего выигрывать.', is_active = 1, priority = 120, meta_json = '{}'
WHERE key = 'natal.house.10.cusp.sign.aquarius' AND locale = 'ru-RU' AND topic_category = 'career';

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.10.cusp.sign.aquarius', 'career', 'ru-RU', 'Куспид 10-го дома в «Водолей» показывает, каким способом вы обычно строите карьеру: через какой тип задач, какой формат лидерства/служения, какая мотивация держит вас в длинной дистанции. Это базовая «обёртка» карьеры: стиль цели и правила игры, в которых проще всего выигрывать.', 120, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.10.cusp.sign.aquarius' AND locale = 'ru-RU' AND topic_category = 'career'
);

UPDATE knowledge_items
SET text = 'Куспид 10-го дома в «Рыбы» показывает, каким способом вы обычно строите карьеру: через какой тип задач, какой формат лидерства/служения, какая мотивация держит вас в длинной дистанции. Это базовая «обёртка» карьеры: стиль цели и правила игры, в которых проще всего выигрывать.', is_active = 1, priority = 120, meta_json = '{}'
WHERE key = 'natal.house.10.cusp.sign.pisces' AND locale = 'ru-RU' AND topic_category = 'career';

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.10.cusp.sign.pisces', 'career', 'ru-RU', 'Куспид 10-го дома в «Рыбы» показывает, каким способом вы обычно строите карьеру: через какой тип задач, какой формат лидерства/служения, какая мотивация держит вас в длинной дистанции. Это базовая «обёртка» карьеры: стиль цели и правила игры, в которых проще всего выигрывать.', 120, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.10.cusp.sign.pisces' AND locale = 'ru-RU' AND topic_category = 'career'
);

UPDATE knowledge_items
SET text = '10 дом по стихии «Огонь»: общий стиль карьерной цели.', is_active = 1, priority = 120, meta_json = '{}'
WHERE key = 'natal.house.10.cusp.element.fire' AND locale = 'ru-RU' AND topic_category = 'career';

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.10.cusp.element.fire', 'career', 'ru-RU', '10 дом по стихии «Огонь»: общий стиль карьерной цели.', 120, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.10.cusp.element.fire' AND locale = 'ru-RU' AND topic_category = 'career'
);

UPDATE knowledge_items
SET text = 'Дома по стихии «Огонь»: общий способ проживать темы дома.', is_active = 1, priority = 120, meta_json = '{}'
WHERE key = 'natal.house.any.cusp.element.fire' AND locale = 'ru-RU' AND topic_category = 'career';

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.any.cusp.element.fire', 'career', 'ru-RU', 'Дома по стихии «Огонь»: общий способ проживать темы дома.', 120, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.any.cusp.element.fire' AND locale = 'ru-RU' AND topic_category = 'career'
);

UPDATE knowledge_items
SET text = '10 дом по стихии «Земля»: общий стиль карьерной цели.', is_active = 1, priority = 120, meta_json = '{}'
WHERE key = 'natal.house.10.cusp.element.earth' AND locale = 'ru-RU' AND topic_category = 'career';

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.10.cusp.element.earth', 'career', 'ru-RU', '10 дом по стихии «Земля»: общий стиль карьерной цели.', 120, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.10.cusp.element.earth' AND locale = 'ru-RU' AND topic_category = 'career'
);

UPDATE knowledge_items
SET text = 'Дома по стихии «Земля»: общий способ проживать темы дома.', is_active = 1, priority = 120, meta_json = '{}'
WHERE key = 'natal.house.any.cusp.element.earth' AND locale = 'ru-RU' AND topic_category = 'career';

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.any.cusp.element.earth', 'career', 'ru-RU', 'Дома по стихии «Земля»: общий способ проживать темы дома.', 120, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.any.cusp.element.earth' AND locale = 'ru-RU' AND topic_category = 'career'
);

UPDATE knowledge_items
SET text = '10 дом по стихии «Воздух»: общий стиль карьерной цели.', is_active = 1, priority = 120, meta_json = '{}'
WHERE key = 'natal.house.10.cusp.element.air' AND locale = 'ru-RU' AND topic_category = 'career';

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.10.cusp.element.air', 'career', 'ru-RU', '10 дом по стихии «Воздух»: общий стиль карьерной цели.', 120, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.10.cusp.element.air' AND locale = 'ru-RU' AND topic_category = 'career'
);

UPDATE knowledge_items
SET text = 'Дома по стихии «Воздух»: общий способ проживать темы дома.', is_active = 1, priority = 120, meta_json = '{}'
WHERE key = 'natal.house.any.cusp.element.air' AND locale = 'ru-RU' AND topic_category = 'career';

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.any.cusp.element.air', 'career', 'ru-RU', 'Дома по стихии «Воздух»: общий способ проживать темы дома.', 120, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.any.cusp.element.air' AND locale = 'ru-RU' AND topic_category = 'career'
);

UPDATE knowledge_items
SET text = '10 дом по стихии «Вода»: общий стиль карьерной цели.', is_active = 1, priority = 120, meta_json = '{}'
WHERE key = 'natal.house.10.cusp.element.water' AND locale = 'ru-RU' AND topic_category = 'career';

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.10.cusp.element.water', 'career', 'ru-RU', '10 дом по стихии «Вода»: общий стиль карьерной цели.', 120, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.10.cusp.element.water' AND locale = 'ru-RU' AND topic_category = 'career'
);

UPDATE knowledge_items
SET text = 'Дома по стихии «Вода»: общий способ проживать темы дома.', is_active = 1, priority = 120, meta_json = '{}'
WHERE key = 'natal.house.any.cusp.element.water' AND locale = 'ru-RU' AND topic_category = 'career';

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.any.cusp.element.water', 'career', 'ru-RU', 'Дома по стихии «Вода»: общий способ проживать темы дома.', 120, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.any.cusp.element.water' AND locale = 'ru-RU' AND topic_category = 'career'
);

UPDATE knowledge_items
SET text = '10 дом по полярности (инь): мотивация и стиль достижения статуса.', is_active = 1, priority = 120, meta_json = '{}'
WHERE key = 'natal.house.10.cusp.polarity.yin' AND locale = 'ru-RU' AND topic_category = 'career';

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.10.cusp.polarity.yin', 'career', 'ru-RU', '10 дом по полярности (инь): мотивация и стиль достижения статуса.', 120, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.10.cusp.polarity.yin' AND locale = 'ru-RU' AND topic_category = 'career'
);

UPDATE knowledge_items
SET text = 'Дома по полярности (инь): общий тон проживания сферы.', is_active = 1, priority = 120, meta_json = '{}'
WHERE key = 'natal.house.any.cusp.polarity.yin' AND locale = 'ru-RU' AND topic_category = 'career';

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.any.cusp.polarity.yin', 'career', 'ru-RU', 'Дома по полярности (инь): общий тон проживания сферы.', 120, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.any.cusp.polarity.yin' AND locale = 'ru-RU' AND topic_category = 'career'
);

UPDATE knowledge_items
SET text = '10 дом по полярности (ян): мотивация и стиль достижения статуса.', is_active = 1, priority = 120, meta_json = '{}'
WHERE key = 'natal.house.10.cusp.polarity.yang' AND locale = 'ru-RU' AND topic_category = 'career';

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.10.cusp.polarity.yang', 'career', 'ru-RU', '10 дом по полярности (ян): мотивация и стиль достижения статуса.', 120, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.10.cusp.polarity.yang' AND locale = 'ru-RU' AND topic_category = 'career'
);

UPDATE knowledge_items
SET text = 'Дома по полярности (ян): общий тон проживания сферы.', is_active = 1, priority = 120, meta_json = '{}'
WHERE key = 'natal.house.any.cusp.polarity.yang' AND locale = 'ru-RU' AND topic_category = 'career';

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.any.cusp.polarity.yang', 'career', 'ru-RU', 'Дома по полярности (ян): общий тон проживания сферы.', 120, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.any.cusp.polarity.yang' AND locale = 'ru-RU' AND topic_category = 'career'
);

UPDATE knowledge_items
SET text = '10 дом по полярности (баланс): мотивация и стиль достижения статуса.', is_active = 1, priority = 120, meta_json = '{}'
WHERE key = 'natal.house.10.cusp.polarity.balanced' AND locale = 'ru-RU' AND topic_category = 'career';

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.10.cusp.polarity.balanced', 'career', 'ru-RU', '10 дом по полярности (баланс): мотивация и стиль достижения статуса.', 120, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.10.cusp.polarity.balanced' AND locale = 'ru-RU' AND topic_category = 'career'
);

UPDATE knowledge_items
SET text = 'Дома по полярности (баланс): общий тон проживания сферы.', is_active = 1, priority = 120, meta_json = '{}'
WHERE key = 'natal.house.any.cusp.polarity.balanced' AND locale = 'ru-RU' AND topic_category = 'career';

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.any.cusp.polarity.balanced', 'career', 'ru-RU', 'Дома по полярности (баланс): общий тон проживания сферы.', 120, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.any.cusp.polarity.balanced' AND locale = 'ru-RU' AND topic_category = 'career'
);

UPDATE knowledge_items
SET text = '10 дом по модальности (кардинальная): как вы строите карьеру во времени.', is_active = 1, priority = 120, meta_json = '{}'
WHERE key = 'natal.house.10.cusp.modality.cardinal' AND locale = 'ru-RU' AND topic_category = 'career';

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.10.cusp.modality.cardinal', 'career', 'ru-RU', '10 дом по модальности (кардинальная): как вы строите карьеру во времени.', 120, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.10.cusp.modality.cardinal' AND locale = 'ru-RU' AND topic_category = 'career'
);

UPDATE knowledge_items
SET text = 'Дома по модальности (кардинальная): общий ритм проживания тем.', is_active = 1, priority = 120, meta_json = '{}'
WHERE key = 'natal.house.any.cusp.modality.cardinal' AND locale = 'ru-RU' AND topic_category = 'career';

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.any.cusp.modality.cardinal', 'career', 'ru-RU', 'Дома по модальности (кардинальная): общий ритм проживания тем.', 120, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.any.cusp.modality.cardinal' AND locale = 'ru-RU' AND topic_category = 'career'
);

UPDATE knowledge_items
SET text = '10 дом по модальности (фиксированная): как вы строите карьеру во времени.', is_active = 1, priority = 120, meta_json = '{}'
WHERE key = 'natal.house.10.cusp.modality.fixed' AND locale = 'ru-RU' AND topic_category = 'career';

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.10.cusp.modality.fixed', 'career', 'ru-RU', '10 дом по модальности (фиксированная): как вы строите карьеру во времени.', 120, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.10.cusp.modality.fixed' AND locale = 'ru-RU' AND topic_category = 'career'
);

UPDATE knowledge_items
SET text = 'Дома по модальности (фиксированная): общий ритм проживания тем.', is_active = 1, priority = 120, meta_json = '{}'
WHERE key = 'natal.house.any.cusp.modality.fixed' AND locale = 'ru-RU' AND topic_category = 'career';

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.any.cusp.modality.fixed', 'career', 'ru-RU', 'Дома по модальности (фиксированная): общий ритм проживания тем.', 120, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.any.cusp.modality.fixed' AND locale = 'ru-RU' AND topic_category = 'career'
);

UPDATE knowledge_items
SET text = '10 дом по модальности (мутабельная): как вы строите карьеру во времени.', is_active = 1, priority = 120, meta_json = '{}'
WHERE key = 'natal.house.10.cusp.modality.mutable' AND locale = 'ru-RU' AND topic_category = 'career';

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.10.cusp.modality.mutable', 'career', 'ru-RU', '10 дом по модальности (мутабельная): как вы строите карьеру во времени.', 120, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.10.cusp.modality.mutable' AND locale = 'ru-RU' AND topic_category = 'career'
);

UPDATE knowledge_items
SET text = 'Дома по модальности (мутабельная): общий ритм проживания тем.', is_active = 1, priority = 120, meta_json = '{}'
WHERE key = 'natal.house.any.cusp.modality.mutable' AND locale = 'ru-RU' AND topic_category = 'career';

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.any.cusp.modality.mutable', 'career', 'ru-RU', 'Дома по модальности (мутабельная): общий ритм проживания тем.', 120, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.any.cusp.modality.mutable' AND locale = 'ru-RU' AND topic_category = 'career'
);

UPDATE knowledge_items
SET text = '10 дом по модальности (баланс): как вы строите карьеру во времени.', is_active = 1, priority = 120, meta_json = '{}'
WHERE key = 'natal.house.10.cusp.modality.balanced' AND locale = 'ru-RU' AND topic_category = 'career';

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.10.cusp.modality.balanced', 'career', 'ru-RU', '10 дом по модальности (баланс): как вы строите карьеру во времени.', 120, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.10.cusp.modality.balanced' AND locale = 'ru-RU' AND topic_category = 'career'
);

UPDATE knowledge_items
SET text = 'Дома по модальности (баланс): общий ритм проживания тем.', is_active = 1, priority = 120, meta_json = '{}'
WHERE key = 'natal.house.any.cusp.modality.balanced' AND locale = 'ru-RU' AND topic_category = 'career';

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.any.cusp.modality.balanced', 'career', 'ru-RU', 'Дома по модальности (баланс): общий ритм проживания тем.', 120, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.any.cusp.modality.balanced' AND locale = 'ru-RU' AND topic_category = 'career'
);

UPDATE knowledge_items
SET text = '10 дом угловой: сильная публичная реализация, быстрая видимость результата.', is_active = 1, priority = 120, meta_json = '{}'
WHERE key = 'natal.house.10.group.angular' AND locale = 'ru-RU' AND topic_category = 'career';

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.10.group.angular', 'career', 'ru-RU', '10 дом угловой: сильная публичная реализация, быстрая видимость результата.', 120, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.10.group.angular' AND locale = 'ru-RU' AND topic_category = 'career'
);

UPDATE knowledge_items
SET text = '10 дом верхняя полусфера: акцент на социальном проявлении и достижениях.', is_active = 1, priority = 120, meta_json = '{}'
WHERE key = 'natal.house.10.floor.upper' AND locale = 'ru-RU' AND topic_category = 'career';

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.10.floor.upper', 'career', 'ru-RU', '10 дом верхняя полусфера: акцент на социальном проявлении и достижениях.', 120, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.10.floor.upper' AND locale = 'ru-RU' AND topic_category = 'career'
);

UPDATE knowledge_items
SET text = '10 дом: знак на куспиде (любой) — общий стиль карьерной цели.', is_active = 1, priority = 120, meta_json = '{}'
WHERE key = 'natal.house.10.cusp.sign.any' AND locale = 'ru-RU' AND topic_category = 'career';

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.10.cusp.sign.any', 'career', 'ru-RU', '10 дом: знак на куспиде (любой) — общий стиль карьерной цели.', 120, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.10.cusp.sign.any' AND locale = 'ru-RU' AND topic_category = 'career'
);

UPDATE knowledge_items
SET text = 'Куспид 10 дома: как включается тема статуса и признания.', is_active = 1, priority = 120, meta_json = '{}'
WHERE key = 'natal.house.10.cusp' AND locale = 'ru-RU' AND topic_category = 'career';

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.10.cusp', 'career', 'ru-RU', 'Куспид 10 дома: как включается тема статуса и признания.', 120, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.10.cusp' AND locale = 'ru-RU' AND topic_category = 'career'
);

UPDATE knowledge_items
SET text = '10 дом: карьера, статус, роль, ответственность, общественный результат.', is_active = 1, priority = 120, meta_json = '{}'
WHERE key = 'natal.house.10' AND locale = 'ru-RU' AND topic_category = 'career';

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.10', 'career', 'ru-RU', '10 дом: карьера, статус, роль, ответственность, общественный результат.', 120, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.10' AND locale = 'ru-RU' AND topic_category = 'career'
);

UPDATE knowledge_items
SET text = 'Дома карты: сферы жизни, где проявляются планеты и их сценарии.', is_active = 1, priority = 120, meta_json = '{}'
WHERE key = 'natal.house' AND locale = 'ru-RU' AND topic_category = 'career';

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house', 'career', 'ru-RU', 'Дома карты: сферы жизни, где проявляются планеты и их сценарии.', 120, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house' AND locale = 'ru-RU' AND topic_category = 'career'
);

UPDATE knowledge_items
SET text = 'Планета Солнце в 10-м доме усиливает карьерный акцент этой функции: какие качества вы проявляете публично, за что вас замечают и чему придётся научиться. В плюс — это «кнопка роста» и видимый ресурс; в минус — перегибы/перегорание, если делать ставку только на одну роль.', is_active = 1, priority = 120, meta_json = '{}'
WHERE key = 'natal.house.10.planet.sun' AND locale = 'ru-RU' AND topic_category = 'career';

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.10.planet.sun', 'career', 'ru-RU', 'Планета Солнце в 10-м доме усиливает карьерный акцент этой функции: какие качества вы проявляете публично, за что вас замечают и чему придётся научиться. В плюс — это «кнопка роста» и видимый ресурс; в минус — перегибы/перегорание, если делать ставку только на одну роль.', 120, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.10.planet.sun' AND locale = 'ru-RU' AND topic_category = 'career'
);

UPDATE knowledge_items
SET text = 'Планета Луна в 10-м доме усиливает карьерный акцент этой функции: какие качества вы проявляете публично, за что вас замечают и чему придётся научиться. В плюс — это «кнопка роста» и видимый ресурс; в минус — перегибы/перегорание, если делать ставку только на одну роль.', is_active = 1, priority = 120, meta_json = '{}'
WHERE key = 'natal.house.10.planet.moon' AND locale = 'ru-RU' AND topic_category = 'career';

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.10.planet.moon', 'career', 'ru-RU', 'Планета Луна в 10-м доме усиливает карьерный акцент этой функции: какие качества вы проявляете публично, за что вас замечают и чему придётся научиться. В плюс — это «кнопка роста» и видимый ресурс; в минус — перегибы/перегорание, если делать ставку только на одну роль.', 120, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.10.planet.moon' AND locale = 'ru-RU' AND topic_category = 'career'
);

UPDATE knowledge_items
SET text = 'Планета Меркурий в 10-м доме усиливает карьерный акцент этой функции: какие качества вы проявляете публично, за что вас замечают и чему придётся научиться. В плюс — это «кнопка роста» и видимый ресурс; в минус — перегибы/перегорание, если делать ставку только на одну роль.', is_active = 1, priority = 120, meta_json = '{}'
WHERE key = 'natal.house.10.planet.mercury' AND locale = 'ru-RU' AND topic_category = 'career';

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.10.planet.mercury', 'career', 'ru-RU', 'Планета Меркурий в 10-м доме усиливает карьерный акцент этой функции: какие качества вы проявляете публично, за что вас замечают и чему придётся научиться. В плюс — это «кнопка роста» и видимый ресурс; в минус — перегибы/перегорание, если делать ставку только на одну роль.', 120, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.10.planet.mercury' AND locale = 'ru-RU' AND topic_category = 'career'
);

UPDATE knowledge_items
SET text = 'Планета Венера в 10-м доме усиливает карьерный акцент этой функции: какие качества вы проявляете публично, за что вас замечают и чему придётся научиться. В плюс — это «кнопка роста» и видимый ресурс; в минус — перегибы/перегорание, если делать ставку только на одну роль.', is_active = 1, priority = 120, meta_json = '{}'
WHERE key = 'natal.house.10.planet.venus' AND locale = 'ru-RU' AND topic_category = 'career';

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.10.planet.venus', 'career', 'ru-RU', 'Планета Венера в 10-м доме усиливает карьерный акцент этой функции: какие качества вы проявляете публично, за что вас замечают и чему придётся научиться. В плюс — это «кнопка роста» и видимый ресурс; в минус — перегибы/перегорание, если делать ставку только на одну роль.', 120, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.10.planet.venus' AND locale = 'ru-RU' AND topic_category = 'career'
);

UPDATE knowledge_items
SET text = 'Планета Марс в 10-м доме усиливает карьерный акцент этой функции: какие качества вы проявляете публично, за что вас замечают и чему придётся научиться. В плюс — это «кнопка роста» и видимый ресурс; в минус — перегибы/перегорание, если делать ставку только на одну роль.', is_active = 1, priority = 120, meta_json = '{}'
WHERE key = 'natal.house.10.planet.mars' AND locale = 'ru-RU' AND topic_category = 'career';

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.10.planet.mars', 'career', 'ru-RU', 'Планета Марс в 10-м доме усиливает карьерный акцент этой функции: какие качества вы проявляете публично, за что вас замечают и чему придётся научиться. В плюс — это «кнопка роста» и видимый ресурс; в минус — перегибы/перегорание, если делать ставку только на одну роль.', 120, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.10.planet.mars' AND locale = 'ru-RU' AND topic_category = 'career'
);

UPDATE knowledge_items
SET text = 'Планета Юпитер в 10-м доме усиливает карьерный акцент этой функции: какие качества вы проявляете публично, за что вас замечают и чему придётся научиться. В плюс — это «кнопка роста» и видимый ресурс; в минус — перегибы/перегорание, если делать ставку только на одну роль.', is_active = 1, priority = 120, meta_json = '{}'
WHERE key = 'natal.house.10.planet.jupiter' AND locale = 'ru-RU' AND topic_category = 'career';

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.10.planet.jupiter', 'career', 'ru-RU', 'Планета Юпитер в 10-м доме усиливает карьерный акцент этой функции: какие качества вы проявляете публично, за что вас замечают и чему придётся научиться. В плюс — это «кнопка роста» и видимый ресурс; в минус — перегибы/перегорание, если делать ставку только на одну роль.', 120, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.10.planet.jupiter' AND locale = 'ru-RU' AND topic_category = 'career'
);

UPDATE knowledge_items
SET text = 'Планета Сатурн в 10-м доме усиливает карьерный акцент этой функции: какие качества вы проявляете публично, за что вас замечают и чему придётся научиться. В плюс — это «кнопка роста» и видимый ресурс; в минус — перегибы/перегорание, если делать ставку только на одну роль.', is_active = 1, priority = 120, meta_json = '{}'
WHERE key = 'natal.house.10.planet.saturn' AND locale = 'ru-RU' AND topic_category = 'career';

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.10.planet.saturn', 'career', 'ru-RU', 'Планета Сатурн в 10-м доме усиливает карьерный акцент этой функции: какие качества вы проявляете публично, за что вас замечают и чему придётся научиться. В плюс — это «кнопка роста» и видимый ресурс; в минус — перегибы/перегорание, если делать ставку только на одну роль.', 120, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.10.planet.saturn' AND locale = 'ru-RU' AND topic_category = 'career'
);

UPDATE knowledge_items
SET text = 'Планета Уран в 10-м доме усиливает карьерный акцент этой функции: какие качества вы проявляете публично, за что вас замечают и чему придётся научиться. В плюс — это «кнопка роста» и видимый ресурс; в минус — перегибы/перегорание, если делать ставку только на одну роль.', is_active = 1, priority = 120, meta_json = '{}'
WHERE key = 'natal.house.10.planet.uranus' AND locale = 'ru-RU' AND topic_category = 'career';

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.10.planet.uranus', 'career', 'ru-RU', 'Планета Уран в 10-м доме усиливает карьерный акцент этой функции: какие качества вы проявляете публично, за что вас замечают и чему придётся научиться. В плюс — это «кнопка роста» и видимый ресурс; в минус — перегибы/перегорание, если делать ставку только на одну роль.', 120, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.10.planet.uranus' AND locale = 'ru-RU' AND topic_category = 'career'
);

UPDATE knowledge_items
SET text = 'Планета Нептун в 10-м доме усиливает карьерный акцент этой функции: какие качества вы проявляете публично, за что вас замечают и чему придётся научиться. В плюс — это «кнопка роста» и видимый ресурс; в минус — перегибы/перегорание, если делать ставку только на одну роль.', is_active = 1, priority = 120, meta_json = '{}'
WHERE key = 'natal.house.10.planet.neptune' AND locale = 'ru-RU' AND topic_category = 'career';

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.10.planet.neptune', 'career', 'ru-RU', 'Планета Нептун в 10-м доме усиливает карьерный акцент этой функции: какие качества вы проявляете публично, за что вас замечают и чему придётся научиться. В плюс — это «кнопка роста» и видимый ресурс; в минус — перегибы/перегорание, если делать ставку только на одну роль.', 120, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.10.planet.neptune' AND locale = 'ru-RU' AND topic_category = 'career'
);

UPDATE knowledge_items
SET text = 'Планета Плутон в 10-м доме усиливает карьерный акцент этой функции: какие качества вы проявляете публично, за что вас замечают и чему придётся научиться. В плюс — это «кнопка роста» и видимый ресурс; в минус — перегибы/перегорание, если делать ставку только на одну роль.', is_active = 1, priority = 120, meta_json = '{}'
WHERE key = 'natal.house.10.planet.pluto' AND locale = 'ru-RU' AND topic_category = 'career';

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.10.planet.pluto', 'career', 'ru-RU', 'Планета Плутон в 10-м доме усиливает карьерный акцент этой функции: какие качества вы проявляете публично, за что вас замечают и чему придётся научиться. В плюс — это «кнопка роста» и видимый ресурс; в минус — перегибы/перегорание, если делать ставку только на одну роль.', 120, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.10.planet.pluto' AND locale = 'ru-RU' AND topic_category = 'career'
);

UPDATE knowledge_items
SET text = 'Управитель 10-го дома по знаку показывает «манеру реализации»: какой стиль решений, коммуникации и мотивации помогает расти.', is_active = 1, priority = 120, meta_json = '{}'
WHERE key = 'natal.house.10.ruler.sun.sign.any' AND locale = 'ru-RU' AND topic_category = 'career';

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.10.ruler.sun.sign.any', 'career', 'ru-RU', 'Управитель 10-го дома по знаку показывает «манеру реализации»: какой стиль решений, коммуникации и мотивации помогает расти.', 120, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.10.ruler.sun.sign.any' AND locale = 'ru-RU' AND topic_category = 'career'
);

UPDATE knowledge_items
SET text = 'Управитель 10-го дома по дому показывает «куда уходит энергия карьеры»: через какую сферу жизни вы чаще всего делаете статус, капитал или признание.', is_active = 1, priority = 120, meta_json = '{}'
WHERE key = 'natal.house.10.ruler.sun.house.any' AND locale = 'ru-RU' AND topic_category = 'career';

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.10.ruler.sun.house.any', 'career', 'ru-RU', 'Управитель 10-го дома по дому показывает «куда уходит энергия карьеры»: через какую сферу жизни вы чаще всего делаете статус, капитал или признание.', 120, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.10.ruler.sun.house.any' AND locale = 'ru-RU' AND topic_category = 'career'
);

UPDATE knowledge_items
SET text = 'Связка «управитель 10-го дома: знак + дом» — один из самых практичных индикаторов: она показывает и стиль (знак), и площадку (дом), где карьера легче собирается в систему.', is_active = 1, priority = 120, meta_json = '{}'
WHERE key = 'natal.house.10.ruler.sun.sign.any.house.any' AND locale = 'ru-RU' AND topic_category = 'career';

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.10.ruler.sun.sign.any.house.any', 'career', 'ru-RU', 'Связка «управитель 10-го дома: знак + дом» — один из самых практичных индикаторов: она показывает и стиль (знак), и площадку (дом), где карьера легче собирается в систему.', 120, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.10.ruler.sun.sign.any.house.any' AND locale = 'ru-RU' AND topic_category = 'career'
);

UPDATE knowledge_items
SET text = 'Аспекты управителя 10-го дома описывают динамику карьеры: с кем/чем вы входите во взаимодействие, где идёт ускорение, где — торможение, и через какие навыки вы становитесь устойчивее. Смотрите повторяющиеся темы: власть/контроль, публичность, коммуникации, риск, обучение, партнёрства.', is_active = 1, priority = 120, meta_json = '{}'
WHERE key = 'natal.house.10.ruler.sun.aspect.any.any' AND locale = 'ru-RU' AND topic_category = 'career';

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.10.ruler.sun.aspect.any.any', 'career', 'ru-RU', 'Аспекты управителя 10-го дома описывают динамику карьеры: с кем/чем вы входите во взаимодействие, где идёт ускорение, где — торможение, и через какие навыки вы становитесь устойчивее. Смотрите повторяющиеся темы: власть/контроль, публичность, коммуникации, риск, обучение, партнёрства.', 120, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.10.ruler.sun.aspect.any.any' AND locale = 'ru-RU' AND topic_category = 'career'
);

UPDATE knowledge_items
SET text = 'Маркер «hard aspects present» у управителя 10-го дома означает, что в карьере будут узлы напряжения, которые нельзя игнорировать. Это точки роста: конфликт интересов, давление ожиданий, необходимость выбора. Лучшее решение — заранее продумать правила, границы и структуру ответственности.', is_active = 1, priority = 120, meta_json = '{}'
WHERE key = 'natal.house.10.ruler.sun.aspect.hard.present' AND locale = 'ru-RU' AND topic_category = 'career';

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.10.ruler.sun.aspect.hard.present', 'career', 'ru-RU', 'Маркер «hard aspects present» у управителя 10-го дома означает, что в карьере будут узлы напряжения, которые нельзя игнорировать. Это точки роста: конфликт интересов, давление ожиданий, необходимость выбора. Лучшее решение — заранее продумать правила, границы и структуру ответственности.', 120, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.10.ruler.sun.aspect.hard.present' AND locale = 'ru-RU' AND topic_category = 'career'
);

UPDATE knowledge_items
SET text = 'Напряжённые аспекты управителя 10-го дома (квадраты/оппозиции и др. «тягучие» связи) дают рост через вызовы: конкуренцию, дедлайны, необходимость границ и навыка переговоров. Это не «плохо», а требование к стратегии: план, дисциплина, приоритеты, здоровый режим.', is_active = 1, priority = 120, meta_json = '{}'
WHERE key = 'natal.house.10.ruler.sun.aspect.class.tense' AND locale = 'ru-RU' AND topic_category = 'career';

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.10.ruler.sun.aspect.class.tense', 'career', 'ru-RU', 'Напряжённые аспекты управителя 10-го дома (квадраты/оппозиции и др. «тягучие» связи) дают рост через вызовы: конкуренцию, дедлайны, необходимость границ и навыка переговоров. Это не «плохо», а требование к стратегии: план, дисциплина, приоритеты, здоровый режим.', 120, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.10.ruler.sun.aspect.class.tense' AND locale = 'ru-RU' AND topic_category = 'career'
);

UPDATE knowledge_items
SET text = 'Гармоничные аспекты управителя 10-го дома (трины/секстили и др.) дают поддержку: легче находить союзников, получать признание, развивать компетенции без постоянного сопротивления. Важно не расслабляться — гармония раскрывается через практику и системность.', is_active = 1, priority = 120, meta_json = '{}'
WHERE key = 'natal.house.10.ruler.sun.aspect.class.harmonic' AND locale = 'ru-RU' AND topic_category = 'career';

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.10.ruler.sun.aspect.class.harmonic', 'career', 'ru-RU', 'Гармоничные аспекты управителя 10-го дома (трины/секстили и др.) дают поддержку: легче находить союзников, получать признание, развивать компетенции без постоянного сопротивления. Важно не расслабляться — гармония раскрывается через практику и системность.', 120, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.10.ruler.sun.aspect.class.harmonic' AND locale = 'ru-RU' AND topic_category = 'career'
);

UPDATE knowledge_items
SET text = 'Аспект управителя 10-го дома к MC — прямой индикатор «карьерной судьбы»: как ваша личная воля/стиль решений подключаются к публичной роли. Это усиливает заметность и требует ясной цели.', is_active = 1, priority = 120, meta_json = '{}'
WHERE key = 'natal.house.10.ruler.sun.aspect.any.with.angle.mc' AND locale = 'ru-RU' AND topic_category = 'career';

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.10.ruler.sun.aspect.any.with.angle.mc', 'career', 'ru-RU', 'Аспект управителя 10-го дома к MC — прямой индикатор «карьерной судьбы»: как ваша личная воля/стиль решений подключаются к публичной роли. Это усиливает заметность и требует ясной цели.', 120, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.10.ruler.sun.aspect.any.with.angle.mc' AND locale = 'ru-RU' AND topic_category = 'career'
);

UPDATE knowledge_items
SET text = 'Аспект управителя 10-го дома к ASC связывает карьеру с образом «я»: то, как вы проявляетесь лично, напрямую влияет на профессиональную репутацию. Важно управлять первым впечатлением.', is_active = 1, priority = 120, meta_json = '{}'
WHERE key = 'natal.house.10.ruler.sun.aspect.any.with.angle.asc' AND locale = 'ru-RU' AND topic_category = 'career';

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.10.ruler.sun.aspect.any.with.angle.asc', 'career', 'ru-RU', 'Аспект управителя 10-го дома к ASC связывает карьеру с образом «я»: то, как вы проявляетесь лично, напрямую влияет на профессиональную репутацию. Важно управлять первым впечатлением.', 120, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.10.ruler.sun.aspect.any.with.angle.asc' AND locale = 'ru-RU' AND topic_category = 'career'
);

UPDATE knowledge_items
SET text = 'Аспект управителя 10-го дома к IC связывает карьеру с домом/семьёй/внутренней опорой: баланс приватного и публичного становится ключом к устойчивому росту.', is_active = 1, priority = 120, meta_json = '{}'
WHERE key = 'natal.house.10.ruler.sun.aspect.any.with.angle.ic' AND locale = 'ru-RU' AND topic_category = 'career';

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.10.ruler.sun.aspect.any.with.angle.ic', 'career', 'ru-RU', 'Аспект управителя 10-го дома к IC связывает карьеру с домом/семьёй/внутренней опорой: баланс приватного и публичного становится ключом к устойчивому росту.', 120, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.10.ruler.sun.aspect.any.with.angle.ic' AND locale = 'ru-RU' AND topic_category = 'career'
);

UPDATE knowledge_items
SET text = 'Аспект управителя 10-го дома к DSC связывает карьеру с партнёрствами и клиентами: успех приходит через договорённости, совместные проекты и качество отношений.', is_active = 1, priority = 120, meta_json = '{}'
WHERE key = 'natal.house.10.ruler.sun.aspect.any.with.angle.dsc' AND locale = 'ru-RU' AND topic_category = 'career';

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.10.ruler.sun.aspect.any.with.angle.dsc', 'career', 'ru-RU', 'Аспект управителя 10-го дома к DSC связывает карьеру с партнёрствами и клиентами: успех приходит через договорённости, совместные проекты и качество отношений.', 120, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.10.ruler.sun.aspect.any.with.angle.dsc' AND locale = 'ru-RU' AND topic_category = 'career'
);

UPDATE knowledge_items
SET text = 'Управитель 10-го дома по знаку показывает «манеру реализации»: какой стиль решений, коммуникации и мотивации помогает расти.', is_active = 1, priority = 120, meta_json = '{}'
WHERE key = 'natal.house.10.ruler.moon.sign.any' AND locale = 'ru-RU' AND topic_category = 'career';

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.10.ruler.moon.sign.any', 'career', 'ru-RU', 'Управитель 10-го дома по знаку показывает «манеру реализации»: какой стиль решений, коммуникации и мотивации помогает расти.', 120, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.10.ruler.moon.sign.any' AND locale = 'ru-RU' AND topic_category = 'career'
);

UPDATE knowledge_items
SET text = 'Управитель 10-го дома по дому показывает «куда уходит энергия карьеры»: через какую сферу жизни вы чаще всего делаете статус, капитал или признание.', is_active = 1, priority = 120, meta_json = '{}'
WHERE key = 'natal.house.10.ruler.moon.house.any' AND locale = 'ru-RU' AND topic_category = 'career';

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.10.ruler.moon.house.any', 'career', 'ru-RU', 'Управитель 10-го дома по дому показывает «куда уходит энергия карьеры»: через какую сферу жизни вы чаще всего делаете статус, капитал или признание.', 120, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.10.ruler.moon.house.any' AND locale = 'ru-RU' AND topic_category = 'career'
);

UPDATE knowledge_items
SET text = 'Связка «управитель 10-го дома: знак + дом» — один из самых практичных индикаторов: она показывает и стиль (знак), и площадку (дом), где карьера легче собирается в систему.', is_active = 1, priority = 120, meta_json = '{}'
WHERE key = 'natal.house.10.ruler.moon.sign.any.house.any' AND locale = 'ru-RU' AND topic_category = 'career';

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.10.ruler.moon.sign.any.house.any', 'career', 'ru-RU', 'Связка «управитель 10-го дома: знак + дом» — один из самых практичных индикаторов: она показывает и стиль (знак), и площадку (дом), где карьера легче собирается в систему.', 120, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.10.ruler.moon.sign.any.house.any' AND locale = 'ru-RU' AND topic_category = 'career'
);

UPDATE knowledge_items
SET text = 'Аспекты управителя 10-го дома описывают динамику карьеры: с кем/чем вы входите во взаимодействие, где идёт ускорение, где — торможение, и через какие навыки вы становитесь устойчивее. Смотрите повторяющиеся темы: власть/контроль, публичность, коммуникации, риск, обучение, партнёрства.', is_active = 1, priority = 120, meta_json = '{}'
WHERE key = 'natal.house.10.ruler.moon.aspect.any.any' AND locale = 'ru-RU' AND topic_category = 'career';

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.10.ruler.moon.aspect.any.any', 'career', 'ru-RU', 'Аспекты управителя 10-го дома описывают динамику карьеры: с кем/чем вы входите во взаимодействие, где идёт ускорение, где — торможение, и через какие навыки вы становитесь устойчивее. Смотрите повторяющиеся темы: власть/контроль, публичность, коммуникации, риск, обучение, партнёрства.', 120, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.10.ruler.moon.aspect.any.any' AND locale = 'ru-RU' AND topic_category = 'career'
);

UPDATE knowledge_items
SET text = 'Маркер «hard aspects present» у управителя 10-го дома означает, что в карьере будут узлы напряжения, которые нельзя игнорировать. Это точки роста: конфликт интересов, давление ожиданий, необходимость выбора. Лучшее решение — заранее продумать правила, границы и структуру ответственности.', is_active = 1, priority = 120, meta_json = '{}'
WHERE key = 'natal.house.10.ruler.moon.aspect.hard.present' AND locale = 'ru-RU' AND topic_category = 'career';

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.10.ruler.moon.aspect.hard.present', 'career', 'ru-RU', 'Маркер «hard aspects present» у управителя 10-го дома означает, что в карьере будут узлы напряжения, которые нельзя игнорировать. Это точки роста: конфликт интересов, давление ожиданий, необходимость выбора. Лучшее решение — заранее продумать правила, границы и структуру ответственности.', 120, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.10.ruler.moon.aspect.hard.present' AND locale = 'ru-RU' AND topic_category = 'career'
);

UPDATE knowledge_items
SET text = 'Напряжённые аспекты управителя 10-го дома (квадраты/оппозиции и др. «тягучие» связи) дают рост через вызовы: конкуренцию, дедлайны, необходимость границ и навыка переговоров. Это не «плохо», а требование к стратегии: план, дисциплина, приоритеты, здоровый режим.', is_active = 1, priority = 120, meta_json = '{}'
WHERE key = 'natal.house.10.ruler.moon.aspect.class.tense' AND locale = 'ru-RU' AND topic_category = 'career';

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.10.ruler.moon.aspect.class.tense', 'career', 'ru-RU', 'Напряжённые аспекты управителя 10-го дома (квадраты/оппозиции и др. «тягучие» связи) дают рост через вызовы: конкуренцию, дедлайны, необходимость границ и навыка переговоров. Это не «плохо», а требование к стратегии: план, дисциплина, приоритеты, здоровый режим.', 120, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.10.ruler.moon.aspect.class.tense' AND locale = 'ru-RU' AND topic_category = 'career'
);

UPDATE knowledge_items
SET text = 'Гармоничные аспекты управителя 10-го дома (трины/секстили и др.) дают поддержку: легче находить союзников, получать признание, развивать компетенции без постоянного сопротивления. Важно не расслабляться — гармония раскрывается через практику и системность.', is_active = 1, priority = 120, meta_json = '{}'
WHERE key = 'natal.house.10.ruler.moon.aspect.class.harmonic' AND locale = 'ru-RU' AND topic_category = 'career';

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.10.ruler.moon.aspect.class.harmonic', 'career', 'ru-RU', 'Гармоничные аспекты управителя 10-го дома (трины/секстили и др.) дают поддержку: легче находить союзников, получать признание, развивать компетенции без постоянного сопротивления. Важно не расслабляться — гармония раскрывается через практику и системность.', 120, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.10.ruler.moon.aspect.class.harmonic' AND locale = 'ru-RU' AND topic_category = 'career'
);

UPDATE knowledge_items
SET text = 'Аспект управителя 10-го дома к MC — прямой индикатор «карьерной судьбы»: как ваша личная воля/стиль решений подключаются к публичной роли. Это усиливает заметность и требует ясной цели.', is_active = 1, priority = 120, meta_json = '{}'
WHERE key = 'natal.house.10.ruler.moon.aspect.any.with.angle.mc' AND locale = 'ru-RU' AND topic_category = 'career';

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.10.ruler.moon.aspect.any.with.angle.mc', 'career', 'ru-RU', 'Аспект управителя 10-го дома к MC — прямой индикатор «карьерной судьбы»: как ваша личная воля/стиль решений подключаются к публичной роли. Это усиливает заметность и требует ясной цели.', 120, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.10.ruler.moon.aspect.any.with.angle.mc' AND locale = 'ru-RU' AND topic_category = 'career'
);

UPDATE knowledge_items
SET text = 'Аспект управителя 10-го дома к ASC связывает карьеру с образом «я»: то, как вы проявляетесь лично, напрямую влияет на профессиональную репутацию. Важно управлять первым впечатлением.', is_active = 1, priority = 120, meta_json = '{}'
WHERE key = 'natal.house.10.ruler.moon.aspect.any.with.angle.asc' AND locale = 'ru-RU' AND topic_category = 'career';

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.10.ruler.moon.aspect.any.with.angle.asc', 'career', 'ru-RU', 'Аспект управителя 10-го дома к ASC связывает карьеру с образом «я»: то, как вы проявляетесь лично, напрямую влияет на профессиональную репутацию. Важно управлять первым впечатлением.', 120, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.10.ruler.moon.aspect.any.with.angle.asc' AND locale = 'ru-RU' AND topic_category = 'career'
);

UPDATE knowledge_items
SET text = 'Аспект управителя 10-го дома к IC связывает карьеру с домом/семьёй/внутренней опорой: баланс приватного и публичного становится ключом к устойчивому росту.', is_active = 1, priority = 120, meta_json = '{}'
WHERE key = 'natal.house.10.ruler.moon.aspect.any.with.angle.ic' AND locale = 'ru-RU' AND topic_category = 'career';

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.10.ruler.moon.aspect.any.with.angle.ic', 'career', 'ru-RU', 'Аспект управителя 10-го дома к IC связывает карьеру с домом/семьёй/внутренней опорой: баланс приватного и публичного становится ключом к устойчивому росту.', 120, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.10.ruler.moon.aspect.any.with.angle.ic' AND locale = 'ru-RU' AND topic_category = 'career'
);

UPDATE knowledge_items
SET text = 'Аспект управителя 10-го дома к DSC связывает карьеру с партнёрствами и клиентами: успех приходит через договорённости, совместные проекты и качество отношений.', is_active = 1, priority = 120, meta_json = '{}'
WHERE key = 'natal.house.10.ruler.moon.aspect.any.with.angle.dsc' AND locale = 'ru-RU' AND topic_category = 'career';

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.10.ruler.moon.aspect.any.with.angle.dsc', 'career', 'ru-RU', 'Аспект управителя 10-го дома к DSC связывает карьеру с партнёрствами и клиентами: успех приходит через договорённости, совместные проекты и качество отношений.', 120, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.10.ruler.moon.aspect.any.with.angle.dsc' AND locale = 'ru-RU' AND topic_category = 'career'
);

UPDATE knowledge_items
SET text = 'Управитель 10-го дома по знаку показывает «манеру реализации»: какой стиль решений, коммуникации и мотивации помогает расти.', is_active = 1, priority = 120, meta_json = '{}'
WHERE key = 'natal.house.10.ruler.mercury.sign.any' AND locale = 'ru-RU' AND topic_category = 'career';

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.10.ruler.mercury.sign.any', 'career', 'ru-RU', 'Управитель 10-го дома по знаку показывает «манеру реализации»: какой стиль решений, коммуникации и мотивации помогает расти.', 120, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.10.ruler.mercury.sign.any' AND locale = 'ru-RU' AND topic_category = 'career'
);

UPDATE knowledge_items
SET text = 'Управитель 10-го дома по дому показывает «куда уходит энергия карьеры»: через какую сферу жизни вы чаще всего делаете статус, капитал или признание.', is_active = 1, priority = 120, meta_json = '{}'
WHERE key = 'natal.house.10.ruler.mercury.house.any' AND locale = 'ru-RU' AND topic_category = 'career';

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.10.ruler.mercury.house.any', 'career', 'ru-RU', 'Управитель 10-го дома по дому показывает «куда уходит энергия карьеры»: через какую сферу жизни вы чаще всего делаете статус, капитал или признание.', 120, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.10.ruler.mercury.house.any' AND locale = 'ru-RU' AND topic_category = 'career'
);

UPDATE knowledge_items
SET text = 'Связка «управитель 10-го дома: знак + дом» — один из самых практичных индикаторов: она показывает и стиль (знак), и площадку (дом), где карьера легче собирается в систему.', is_active = 1, priority = 120, meta_json = '{}'
WHERE key = 'natal.house.10.ruler.mercury.sign.any.house.any' AND locale = 'ru-RU' AND topic_category = 'career';

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.10.ruler.mercury.sign.any.house.any', 'career', 'ru-RU', 'Связка «управитель 10-го дома: знак + дом» — один из самых практичных индикаторов: она показывает и стиль (знак), и площадку (дом), где карьера легче собирается в систему.', 120, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.10.ruler.mercury.sign.any.house.any' AND locale = 'ru-RU' AND topic_category = 'career'
);

UPDATE knowledge_items
SET text = 'Аспекты управителя 10-го дома описывают динамику карьеры: с кем/чем вы входите во взаимодействие, где идёт ускорение, где — торможение, и через какие навыки вы становитесь устойчивее. Смотрите повторяющиеся темы: власть/контроль, публичность, коммуникации, риск, обучение, партнёрства.', is_active = 1, priority = 120, meta_json = '{}'
WHERE key = 'natal.house.10.ruler.mercury.aspect.any.any' AND locale = 'ru-RU' AND topic_category = 'career';

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.10.ruler.mercury.aspect.any.any', 'career', 'ru-RU', 'Аспекты управителя 10-го дома описывают динамику карьеры: с кем/чем вы входите во взаимодействие, где идёт ускорение, где — торможение, и через какие навыки вы становитесь устойчивее. Смотрите повторяющиеся темы: власть/контроль, публичность, коммуникации, риск, обучение, партнёрства.', 120, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.10.ruler.mercury.aspect.any.any' AND locale = 'ru-RU' AND topic_category = 'career'
);

UPDATE knowledge_items
SET text = 'Маркер «hard aspects present» у управителя 10-го дома означает, что в карьере будут узлы напряжения, которые нельзя игнорировать. Это точки роста: конфликт интересов, давление ожиданий, необходимость выбора. Лучшее решение — заранее продумать правила, границы и структуру ответственности.', is_active = 1, priority = 120, meta_json = '{}'
WHERE key = 'natal.house.10.ruler.mercury.aspect.hard.present' AND locale = 'ru-RU' AND topic_category = 'career';

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.10.ruler.mercury.aspect.hard.present', 'career', 'ru-RU', 'Маркер «hard aspects present» у управителя 10-го дома означает, что в карьере будут узлы напряжения, которые нельзя игнорировать. Это точки роста: конфликт интересов, давление ожиданий, необходимость выбора. Лучшее решение — заранее продумать правила, границы и структуру ответственности.', 120, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.10.ruler.mercury.aspect.hard.present' AND locale = 'ru-RU' AND topic_category = 'career'
);

UPDATE knowledge_items
SET text = 'Напряжённые аспекты управителя 10-го дома (квадраты/оппозиции и др. «тягучие» связи) дают рост через вызовы: конкуренцию, дедлайны, необходимость границ и навыка переговоров. Это не «плохо», а требование к стратегии: план, дисциплина, приоритеты, здоровый режим.', is_active = 1, priority = 120, meta_json = '{}'
WHERE key = 'natal.house.10.ruler.mercury.aspect.class.tense' AND locale = 'ru-RU' AND topic_category = 'career';

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.10.ruler.mercury.aspect.class.tense', 'career', 'ru-RU', 'Напряжённые аспекты управителя 10-го дома (квадраты/оппозиции и др. «тягучие» связи) дают рост через вызовы: конкуренцию, дедлайны, необходимость границ и навыка переговоров. Это не «плохо», а требование к стратегии: план, дисциплина, приоритеты, здоровый режим.', 120, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.10.ruler.mercury.aspect.class.tense' AND locale = 'ru-RU' AND topic_category = 'career'
);

UPDATE knowledge_items
SET text = 'Гармоничные аспекты управителя 10-го дома (трины/секстили и др.) дают поддержку: легче находить союзников, получать признание, развивать компетенции без постоянного сопротивления. Важно не расслабляться — гармония раскрывается через практику и системность.', is_active = 1, priority = 120, meta_json = '{}'
WHERE key = 'natal.house.10.ruler.mercury.aspect.class.harmonic' AND locale = 'ru-RU' AND topic_category = 'career';

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.10.ruler.mercury.aspect.class.harmonic', 'career', 'ru-RU', 'Гармоничные аспекты управителя 10-го дома (трины/секстили и др.) дают поддержку: легче находить союзников, получать признание, развивать компетенции без постоянного сопротивления. Важно не расслабляться — гармония раскрывается через практику и системность.', 120, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.10.ruler.mercury.aspect.class.harmonic' AND locale = 'ru-RU' AND topic_category = 'career'
);

UPDATE knowledge_items
SET text = 'Аспект управителя 10-го дома к MC — прямой индикатор «карьерной судьбы»: как ваша личная воля/стиль решений подключаются к публичной роли. Это усиливает заметность и требует ясной цели.', is_active = 1, priority = 120, meta_json = '{}'
WHERE key = 'natal.house.10.ruler.mercury.aspect.any.with.angle.mc' AND locale = 'ru-RU' AND topic_category = 'career';

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.10.ruler.mercury.aspect.any.with.angle.mc', 'career', 'ru-RU', 'Аспект управителя 10-го дома к MC — прямой индикатор «карьерной судьбы»: как ваша личная воля/стиль решений подключаются к публичной роли. Это усиливает заметность и требует ясной цели.', 120, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.10.ruler.mercury.aspect.any.with.angle.mc' AND locale = 'ru-RU' AND topic_category = 'career'
);

UPDATE knowledge_items
SET text = 'Аспект управителя 10-го дома к ASC связывает карьеру с образом «я»: то, как вы проявляетесь лично, напрямую влияет на профессиональную репутацию. Важно управлять первым впечатлением.', is_active = 1, priority = 120, meta_json = '{}'
WHERE key = 'natal.house.10.ruler.mercury.aspect.any.with.angle.asc' AND locale = 'ru-RU' AND topic_category = 'career';

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.10.ruler.mercury.aspect.any.with.angle.asc', 'career', 'ru-RU', 'Аспект управителя 10-го дома к ASC связывает карьеру с образом «я»: то, как вы проявляетесь лично, напрямую влияет на профессиональную репутацию. Важно управлять первым впечатлением.', 120, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.10.ruler.mercury.aspect.any.with.angle.asc' AND locale = 'ru-RU' AND topic_category = 'career'
);

UPDATE knowledge_items
SET text = 'Аспект управителя 10-го дома к IC связывает карьеру с домом/семьёй/внутренней опорой: баланс приватного и публичного становится ключом к устойчивому росту.', is_active = 1, priority = 120, meta_json = '{}'
WHERE key = 'natal.house.10.ruler.mercury.aspect.any.with.angle.ic' AND locale = 'ru-RU' AND topic_category = 'career';

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.10.ruler.mercury.aspect.any.with.angle.ic', 'career', 'ru-RU', 'Аспект управителя 10-го дома к IC связывает карьеру с домом/семьёй/внутренней опорой: баланс приватного и публичного становится ключом к устойчивому росту.', 120, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.10.ruler.mercury.aspect.any.with.angle.ic' AND locale = 'ru-RU' AND topic_category = 'career'
);

UPDATE knowledge_items
SET text = 'Аспект управителя 10-го дома к DSC связывает карьеру с партнёрствами и клиентами: успех приходит через договорённости, совместные проекты и качество отношений.', is_active = 1, priority = 120, meta_json = '{}'
WHERE key = 'natal.house.10.ruler.mercury.aspect.any.with.angle.dsc' AND locale = 'ru-RU' AND topic_category = 'career';

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.10.ruler.mercury.aspect.any.with.angle.dsc', 'career', 'ru-RU', 'Аспект управителя 10-го дома к DSC связывает карьеру с партнёрствами и клиентами: успех приходит через договорённости, совместные проекты и качество отношений.', 120, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.10.ruler.mercury.aspect.any.with.angle.dsc' AND locale = 'ru-RU' AND topic_category = 'career'
);

UPDATE knowledge_items
SET text = 'Управитель 10-го дома по знаку показывает «манеру реализации»: какой стиль решений, коммуникации и мотивации помогает расти.', is_active = 1, priority = 120, meta_json = '{}'
WHERE key = 'natal.house.10.ruler.venus.sign.any' AND locale = 'ru-RU' AND topic_category = 'career';

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.10.ruler.venus.sign.any', 'career', 'ru-RU', 'Управитель 10-го дома по знаку показывает «манеру реализации»: какой стиль решений, коммуникации и мотивации помогает расти.', 120, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.10.ruler.venus.sign.any' AND locale = 'ru-RU' AND topic_category = 'career'
);

UPDATE knowledge_items
SET text = 'Управитель 10-го дома по дому показывает «куда уходит энергия карьеры»: через какую сферу жизни вы чаще всего делаете статус, капитал или признание.', is_active = 1, priority = 120, meta_json = '{}'
WHERE key = 'natal.house.10.ruler.venus.house.any' AND locale = 'ru-RU' AND topic_category = 'career';

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.10.ruler.venus.house.any', 'career', 'ru-RU', 'Управитель 10-го дома по дому показывает «куда уходит энергия карьеры»: через какую сферу жизни вы чаще всего делаете статус, капитал или признание.', 120, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.10.ruler.venus.house.any' AND locale = 'ru-RU' AND topic_category = 'career'
);

UPDATE knowledge_items
SET text = 'Связка «управитель 10-го дома: знак + дом» — один из самых практичных индикаторов: она показывает и стиль (знак), и площадку (дом), где карьера легче собирается в систему.', is_active = 1, priority = 120, meta_json = '{}'
WHERE key = 'natal.house.10.ruler.venus.sign.any.house.any' AND locale = 'ru-RU' AND topic_category = 'career';

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.10.ruler.venus.sign.any.house.any', 'career', 'ru-RU', 'Связка «управитель 10-го дома: знак + дом» — один из самых практичных индикаторов: она показывает и стиль (знак), и площадку (дом), где карьера легче собирается в систему.', 120, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.10.ruler.venus.sign.any.house.any' AND locale = 'ru-RU' AND topic_category = 'career'
);

UPDATE knowledge_items
SET text = 'Аспекты управителя 10-го дома описывают динамику карьеры: с кем/чем вы входите во взаимодействие, где идёт ускорение, где — торможение, и через какие навыки вы становитесь устойчивее. Смотрите повторяющиеся темы: власть/контроль, публичность, коммуникации, риск, обучение, партнёрства.', is_active = 1, priority = 120, meta_json = '{}'
WHERE key = 'natal.house.10.ruler.venus.aspect.any.any' AND locale = 'ru-RU' AND topic_category = 'career';

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.10.ruler.venus.aspect.any.any', 'career', 'ru-RU', 'Аспекты управителя 10-го дома описывают динамику карьеры: с кем/чем вы входите во взаимодействие, где идёт ускорение, где — торможение, и через какие навыки вы становитесь устойчивее. Смотрите повторяющиеся темы: власть/контроль, публичность, коммуникации, риск, обучение, партнёрства.', 120, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.10.ruler.venus.aspect.any.any' AND locale = 'ru-RU' AND topic_category = 'career'
);

UPDATE knowledge_items
SET text = 'Маркер «hard aspects present» у управителя 10-го дома означает, что в карьере будут узлы напряжения, которые нельзя игнорировать. Это точки роста: конфликт интересов, давление ожиданий, необходимость выбора. Лучшее решение — заранее продумать правила, границы и структуру ответственности.', is_active = 1, priority = 120, meta_json = '{}'
WHERE key = 'natal.house.10.ruler.venus.aspect.hard.present' AND locale = 'ru-RU' AND topic_category = 'career';

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.10.ruler.venus.aspect.hard.present', 'career', 'ru-RU', 'Маркер «hard aspects present» у управителя 10-го дома означает, что в карьере будут узлы напряжения, которые нельзя игнорировать. Это точки роста: конфликт интересов, давление ожиданий, необходимость выбора. Лучшее решение — заранее продумать правила, границы и структуру ответственности.', 120, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.10.ruler.venus.aspect.hard.present' AND locale = 'ru-RU' AND topic_category = 'career'
);

UPDATE knowledge_items
SET text = 'Напряжённые аспекты управителя 10-го дома (квадраты/оппозиции и др. «тягучие» связи) дают рост через вызовы: конкуренцию, дедлайны, необходимость границ и навыка переговоров. Это не «плохо», а требование к стратегии: план, дисциплина, приоритеты, здоровый режим.', is_active = 1, priority = 120, meta_json = '{}'
WHERE key = 'natal.house.10.ruler.venus.aspect.class.tense' AND locale = 'ru-RU' AND topic_category = 'career';

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.10.ruler.venus.aspect.class.tense', 'career', 'ru-RU', 'Напряжённые аспекты управителя 10-го дома (квадраты/оппозиции и др. «тягучие» связи) дают рост через вызовы: конкуренцию, дедлайны, необходимость границ и навыка переговоров. Это не «плохо», а требование к стратегии: план, дисциплина, приоритеты, здоровый режим.', 120, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.10.ruler.venus.aspect.class.tense' AND locale = 'ru-RU' AND topic_category = 'career'
);

UPDATE knowledge_items
SET text = 'Гармоничные аспекты управителя 10-го дома (трины/секстили и др.) дают поддержку: легче находить союзников, получать признание, развивать компетенции без постоянного сопротивления. Важно не расслабляться — гармония раскрывается через практику и системность.', is_active = 1, priority = 120, meta_json = '{}'
WHERE key = 'natal.house.10.ruler.venus.aspect.class.harmonic' AND locale = 'ru-RU' AND topic_category = 'career';

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.10.ruler.venus.aspect.class.harmonic', 'career', 'ru-RU', 'Гармоничные аспекты управителя 10-го дома (трины/секстили и др.) дают поддержку: легче находить союзников, получать признание, развивать компетенции без постоянного сопротивления. Важно не расслабляться — гармония раскрывается через практику и системность.', 120, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.10.ruler.venus.aspect.class.harmonic' AND locale = 'ru-RU' AND topic_category = 'career'
);

UPDATE knowledge_items
SET text = 'Аспект управителя 10-го дома к MC — прямой индикатор «карьерной судьбы»: как ваша личная воля/стиль решений подключаются к публичной роли. Это усиливает заметность и требует ясной цели.', is_active = 1, priority = 120, meta_json = '{}'
WHERE key = 'natal.house.10.ruler.venus.aspect.any.with.angle.mc' AND locale = 'ru-RU' AND topic_category = 'career';

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.10.ruler.venus.aspect.any.with.angle.mc', 'career', 'ru-RU', 'Аспект управителя 10-го дома к MC — прямой индикатор «карьерной судьбы»: как ваша личная воля/стиль решений подключаются к публичной роли. Это усиливает заметность и требует ясной цели.', 120, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.10.ruler.venus.aspect.any.with.angle.mc' AND locale = 'ru-RU' AND topic_category = 'career'
);

UPDATE knowledge_items
SET text = 'Аспект управителя 10-го дома к ASC связывает карьеру с образом «я»: то, как вы проявляетесь лично, напрямую влияет на профессиональную репутацию. Важно управлять первым впечатлением.', is_active = 1, priority = 120, meta_json = '{}'
WHERE key = 'natal.house.10.ruler.venus.aspect.any.with.angle.asc' AND locale = 'ru-RU' AND topic_category = 'career';

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.10.ruler.venus.aspect.any.with.angle.asc', 'career', 'ru-RU', 'Аспект управителя 10-го дома к ASC связывает карьеру с образом «я»: то, как вы проявляетесь лично, напрямую влияет на профессиональную репутацию. Важно управлять первым впечатлением.', 120, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.10.ruler.venus.aspect.any.with.angle.asc' AND locale = 'ru-RU' AND topic_category = 'career'
);

UPDATE knowledge_items
SET text = 'Аспект управителя 10-го дома к IC связывает карьеру с домом/семьёй/внутренней опорой: баланс приватного и публичного становится ключом к устойчивому росту.', is_active = 1, priority = 120, meta_json = '{}'
WHERE key = 'natal.house.10.ruler.venus.aspect.any.with.angle.ic' AND locale = 'ru-RU' AND topic_category = 'career';

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.10.ruler.venus.aspect.any.with.angle.ic', 'career', 'ru-RU', 'Аспект управителя 10-го дома к IC связывает карьеру с домом/семьёй/внутренней опорой: баланс приватного и публичного становится ключом к устойчивому росту.', 120, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.10.ruler.venus.aspect.any.with.angle.ic' AND locale = 'ru-RU' AND topic_category = 'career'
);

UPDATE knowledge_items
SET text = 'Аспект управителя 10-го дома к DSC связывает карьеру с партнёрствами и клиентами: успех приходит через договорённости, совместные проекты и качество отношений.', is_active = 1, priority = 120, meta_json = '{}'
WHERE key = 'natal.house.10.ruler.venus.aspect.any.with.angle.dsc' AND locale = 'ru-RU' AND topic_category = 'career';

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.10.ruler.venus.aspect.any.with.angle.dsc', 'career', 'ru-RU', 'Аспект управителя 10-го дома к DSC связывает карьеру с партнёрствами и клиентами: успех приходит через договорённости, совместные проекты и качество отношений.', 120, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.10.ruler.venus.aspect.any.with.angle.dsc' AND locale = 'ru-RU' AND topic_category = 'career'
);

UPDATE knowledge_items
SET text = 'Управитель 10-го дома по знаку показывает «манеру реализации»: какой стиль решений, коммуникации и мотивации помогает расти.', is_active = 1, priority = 120, meta_json = '{}'
WHERE key = 'natal.house.10.ruler.mars.sign.any' AND locale = 'ru-RU' AND topic_category = 'career';

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.10.ruler.mars.sign.any', 'career', 'ru-RU', 'Управитель 10-го дома по знаку показывает «манеру реализации»: какой стиль решений, коммуникации и мотивации помогает расти.', 120, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.10.ruler.mars.sign.any' AND locale = 'ru-RU' AND topic_category = 'career'
);

UPDATE knowledge_items
SET text = 'Управитель 10-го дома по дому показывает «куда уходит энергия карьеры»: через какую сферу жизни вы чаще всего делаете статус, капитал или признание.', is_active = 1, priority = 120, meta_json = '{}'
WHERE key = 'natal.house.10.ruler.mars.house.any' AND locale = 'ru-RU' AND topic_category = 'career';

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.10.ruler.mars.house.any', 'career', 'ru-RU', 'Управитель 10-го дома по дому показывает «куда уходит энергия карьеры»: через какую сферу жизни вы чаще всего делаете статус, капитал или признание.', 120, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.10.ruler.mars.house.any' AND locale = 'ru-RU' AND topic_category = 'career'
);

UPDATE knowledge_items
SET text = 'Связка «управитель 10-го дома: знак + дом» — один из самых практичных индикаторов: она показывает и стиль (знак), и площадку (дом), где карьера легче собирается в систему.', is_active = 1, priority = 120, meta_json = '{}'
WHERE key = 'natal.house.10.ruler.mars.sign.any.house.any' AND locale = 'ru-RU' AND topic_category = 'career';

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.10.ruler.mars.sign.any.house.any', 'career', 'ru-RU', 'Связка «управитель 10-го дома: знак + дом» — один из самых практичных индикаторов: она показывает и стиль (знак), и площадку (дом), где карьера легче собирается в систему.', 120, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.10.ruler.mars.sign.any.house.any' AND locale = 'ru-RU' AND topic_category = 'career'
);

UPDATE knowledge_items
SET text = 'Аспекты управителя 10-го дома описывают динамику карьеры: с кем/чем вы входите во взаимодействие, где идёт ускорение, где — торможение, и через какие навыки вы становитесь устойчивее. Смотрите повторяющиеся темы: власть/контроль, публичность, коммуникации, риск, обучение, партнёрства.', is_active = 1, priority = 120, meta_json = '{}'
WHERE key = 'natal.house.10.ruler.mars.aspect.any.any' AND locale = 'ru-RU' AND topic_category = 'career';

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.10.ruler.mars.aspect.any.any', 'career', 'ru-RU', 'Аспекты управителя 10-го дома описывают динамику карьеры: с кем/чем вы входите во взаимодействие, где идёт ускорение, где — торможение, и через какие навыки вы становитесь устойчивее. Смотрите повторяющиеся темы: власть/контроль, публичность, коммуникации, риск, обучение, партнёрства.', 120, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.10.ruler.mars.aspect.any.any' AND locale = 'ru-RU' AND topic_category = 'career'
);

UPDATE knowledge_items
SET text = 'Маркер «hard aspects present» у управителя 10-го дома означает, что в карьере будут узлы напряжения, которые нельзя игнорировать. Это точки роста: конфликт интересов, давление ожиданий, необходимость выбора. Лучшее решение — заранее продумать правила, границы и структуру ответственности.', is_active = 1, priority = 120, meta_json = '{}'
WHERE key = 'natal.house.10.ruler.mars.aspect.hard.present' AND locale = 'ru-RU' AND topic_category = 'career';

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.10.ruler.mars.aspect.hard.present', 'career', 'ru-RU', 'Маркер «hard aspects present» у управителя 10-го дома означает, что в карьере будут узлы напряжения, которые нельзя игнорировать. Это точки роста: конфликт интересов, давление ожиданий, необходимость выбора. Лучшее решение — заранее продумать правила, границы и структуру ответственности.', 120, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.10.ruler.mars.aspect.hard.present' AND locale = 'ru-RU' AND topic_category = 'career'
);

UPDATE knowledge_items
SET text = 'Напряжённые аспекты управителя 10-го дома (квадраты/оппозиции и др. «тягучие» связи) дают рост через вызовы: конкуренцию, дедлайны, необходимость границ и навыка переговоров. Это не «плохо», а требование к стратегии: план, дисциплина, приоритеты, здоровый режим.', is_active = 1, priority = 120, meta_json = '{}'
WHERE key = 'natal.house.10.ruler.mars.aspect.class.tense' AND locale = 'ru-RU' AND topic_category = 'career';

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.10.ruler.mars.aspect.class.tense', 'career', 'ru-RU', 'Напряжённые аспекты управителя 10-го дома (квадраты/оппозиции и др. «тягучие» связи) дают рост через вызовы: конкуренцию, дедлайны, необходимость границ и навыка переговоров. Это не «плохо», а требование к стратегии: план, дисциплина, приоритеты, здоровый режим.', 120, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.10.ruler.mars.aspect.class.tense' AND locale = 'ru-RU' AND topic_category = 'career'
);

UPDATE knowledge_items
SET text = 'Гармоничные аспекты управителя 10-го дома (трины/секстили и др.) дают поддержку: легче находить союзников, получать признание, развивать компетенции без постоянного сопротивления. Важно не расслабляться — гармония раскрывается через практику и системность.', is_active = 1, priority = 120, meta_json = '{}'
WHERE key = 'natal.house.10.ruler.mars.aspect.class.harmonic' AND locale = 'ru-RU' AND topic_category = 'career';

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.10.ruler.mars.aspect.class.harmonic', 'career', 'ru-RU', 'Гармоничные аспекты управителя 10-го дома (трины/секстили и др.) дают поддержку: легче находить союзников, получать признание, развивать компетенции без постоянного сопротивления. Важно не расслабляться — гармония раскрывается через практику и системность.', 120, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.10.ruler.mars.aspect.class.harmonic' AND locale = 'ru-RU' AND topic_category = 'career'
);

UPDATE knowledge_items
SET text = 'Аспект управителя 10-го дома к MC — прямой индикатор «карьерной судьбы»: как ваша личная воля/стиль решений подключаются к публичной роли. Это усиливает заметность и требует ясной цели.', is_active = 1, priority = 120, meta_json = '{}'
WHERE key = 'natal.house.10.ruler.mars.aspect.any.with.angle.mc' AND locale = 'ru-RU' AND topic_category = 'career';

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.10.ruler.mars.aspect.any.with.angle.mc', 'career', 'ru-RU', 'Аспект управителя 10-го дома к MC — прямой индикатор «карьерной судьбы»: как ваша личная воля/стиль решений подключаются к публичной роли. Это усиливает заметность и требует ясной цели.', 120, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.10.ruler.mars.aspect.any.with.angle.mc' AND locale = 'ru-RU' AND topic_category = 'career'
);

UPDATE knowledge_items
SET text = 'Аспект управителя 10-го дома к ASC связывает карьеру с образом «я»: то, как вы проявляетесь лично, напрямую влияет на профессиональную репутацию. Важно управлять первым впечатлением.', is_active = 1, priority = 120, meta_json = '{}'
WHERE key = 'natal.house.10.ruler.mars.aspect.any.with.angle.asc' AND locale = 'ru-RU' AND topic_category = 'career';

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.10.ruler.mars.aspect.any.with.angle.asc', 'career', 'ru-RU', 'Аспект управителя 10-го дома к ASC связывает карьеру с образом «я»: то, как вы проявляетесь лично, напрямую влияет на профессиональную репутацию. Важно управлять первым впечатлением.', 120, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.10.ruler.mars.aspect.any.with.angle.asc' AND locale = 'ru-RU' AND topic_category = 'career'
);

UPDATE knowledge_items
SET text = 'Аспект управителя 10-го дома к IC связывает карьеру с домом/семьёй/внутренней опорой: баланс приватного и публичного становится ключом к устойчивому росту.', is_active = 1, priority = 120, meta_json = '{}'
WHERE key = 'natal.house.10.ruler.mars.aspect.any.with.angle.ic' AND locale = 'ru-RU' AND topic_category = 'career';

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.10.ruler.mars.aspect.any.with.angle.ic', 'career', 'ru-RU', 'Аспект управителя 10-го дома к IC связывает карьеру с домом/семьёй/внутренней опорой: баланс приватного и публичного становится ключом к устойчивому росту.', 120, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.10.ruler.mars.aspect.any.with.angle.ic' AND locale = 'ru-RU' AND topic_category = 'career'
);

UPDATE knowledge_items
SET text = 'Аспект управителя 10-го дома к DSC связывает карьеру с партнёрствами и клиентами: успех приходит через договорённости, совместные проекты и качество отношений.', is_active = 1, priority = 120, meta_json = '{}'
WHERE key = 'natal.house.10.ruler.mars.aspect.any.with.angle.dsc' AND locale = 'ru-RU' AND topic_category = 'career';

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.10.ruler.mars.aspect.any.with.angle.dsc', 'career', 'ru-RU', 'Аспект управителя 10-го дома к DSC связывает карьеру с партнёрствами и клиентами: успех приходит через договорённости, совместные проекты и качество отношений.', 120, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.10.ruler.mars.aspect.any.with.angle.dsc' AND locale = 'ru-RU' AND topic_category = 'career'
);

UPDATE knowledge_items
SET text = 'Управитель 10-го дома по знаку показывает «манеру реализации»: какой стиль решений, коммуникации и мотивации помогает расти.', is_active = 1, priority = 120, meta_json = '{}'
WHERE key = 'natal.house.10.ruler.jupiter.sign.any' AND locale = 'ru-RU' AND topic_category = 'career';

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.10.ruler.jupiter.sign.any', 'career', 'ru-RU', 'Управитель 10-го дома по знаку показывает «манеру реализации»: какой стиль решений, коммуникации и мотивации помогает расти.', 120, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.10.ruler.jupiter.sign.any' AND locale = 'ru-RU' AND topic_category = 'career'
);

UPDATE knowledge_items
SET text = 'Управитель 10-го дома по дому показывает «куда уходит энергия карьеры»: через какую сферу жизни вы чаще всего делаете статус, капитал или признание.', is_active = 1, priority = 120, meta_json = '{}'
WHERE key = 'natal.house.10.ruler.jupiter.house.any' AND locale = 'ru-RU' AND topic_category = 'career';

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.10.ruler.jupiter.house.any', 'career', 'ru-RU', 'Управитель 10-го дома по дому показывает «куда уходит энергия карьеры»: через какую сферу жизни вы чаще всего делаете статус, капитал или признание.', 120, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.10.ruler.jupiter.house.any' AND locale = 'ru-RU' AND topic_category = 'career'
);

UPDATE knowledge_items
SET text = 'Связка «управитель 10-го дома: знак + дом» — один из самых практичных индикаторов: она показывает и стиль (знак), и площадку (дом), где карьера легче собирается в систему.', is_active = 1, priority = 120, meta_json = '{}'
WHERE key = 'natal.house.10.ruler.jupiter.sign.any.house.any' AND locale = 'ru-RU' AND topic_category = 'career';

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.10.ruler.jupiter.sign.any.house.any', 'career', 'ru-RU', 'Связка «управитель 10-го дома: знак + дом» — один из самых практичных индикаторов: она показывает и стиль (знак), и площадку (дом), где карьера легче собирается в систему.', 120, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.10.ruler.jupiter.sign.any.house.any' AND locale = 'ru-RU' AND topic_category = 'career'
);

UPDATE knowledge_items
SET text = 'Аспекты управителя 10-го дома описывают динамику карьеры: с кем/чем вы входите во взаимодействие, где идёт ускорение, где — торможение, и через какие навыки вы становитесь устойчивее. Смотрите повторяющиеся темы: власть/контроль, публичность, коммуникации, риск, обучение, партнёрства.', is_active = 1, priority = 120, meta_json = '{}'
WHERE key = 'natal.house.10.ruler.jupiter.aspect.any.any' AND locale = 'ru-RU' AND topic_category = 'career';

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.10.ruler.jupiter.aspect.any.any', 'career', 'ru-RU', 'Аспекты управителя 10-го дома описывают динамику карьеры: с кем/чем вы входите во взаимодействие, где идёт ускорение, где — торможение, и через какие навыки вы становитесь устойчивее. Смотрите повторяющиеся темы: власть/контроль, публичность, коммуникации, риск, обучение, партнёрства.', 120, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.10.ruler.jupiter.aspect.any.any' AND locale = 'ru-RU' AND topic_category = 'career'
);

UPDATE knowledge_items
SET text = 'Маркер «hard aspects present» у управителя 10-го дома означает, что в карьере будут узлы напряжения, которые нельзя игнорировать. Это точки роста: конфликт интересов, давление ожиданий, необходимость выбора. Лучшее решение — заранее продумать правила, границы и структуру ответственности.', is_active = 1, priority = 120, meta_json = '{}'
WHERE key = 'natal.house.10.ruler.jupiter.aspect.hard.present' AND locale = 'ru-RU' AND topic_category = 'career';

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.10.ruler.jupiter.aspect.hard.present', 'career', 'ru-RU', 'Маркер «hard aspects present» у управителя 10-го дома означает, что в карьере будут узлы напряжения, которые нельзя игнорировать. Это точки роста: конфликт интересов, давление ожиданий, необходимость выбора. Лучшее решение — заранее продумать правила, границы и структуру ответственности.', 120, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.10.ruler.jupiter.aspect.hard.present' AND locale = 'ru-RU' AND topic_category = 'career'
);

UPDATE knowledge_items
SET text = 'Напряжённые аспекты управителя 10-го дома (квадраты/оппозиции и др. «тягучие» связи) дают рост через вызовы: конкуренцию, дедлайны, необходимость границ и навыка переговоров. Это не «плохо», а требование к стратегии: план, дисциплина, приоритеты, здоровый режим.', is_active = 1, priority = 120, meta_json = '{}'
WHERE key = 'natal.house.10.ruler.jupiter.aspect.class.tense' AND locale = 'ru-RU' AND topic_category = 'career';

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.10.ruler.jupiter.aspect.class.tense', 'career', 'ru-RU', 'Напряжённые аспекты управителя 10-го дома (квадраты/оппозиции и др. «тягучие» связи) дают рост через вызовы: конкуренцию, дедлайны, необходимость границ и навыка переговоров. Это не «плохо», а требование к стратегии: план, дисциплина, приоритеты, здоровый режим.', 120, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.10.ruler.jupiter.aspect.class.tense' AND locale = 'ru-RU' AND topic_category = 'career'
);

UPDATE knowledge_items
SET text = 'Гармоничные аспекты управителя 10-го дома (трины/секстили и др.) дают поддержку: легче находить союзников, получать признание, развивать компетенции без постоянного сопротивления. Важно не расслабляться — гармония раскрывается через практику и системность.', is_active = 1, priority = 120, meta_json = '{}'
WHERE key = 'natal.house.10.ruler.jupiter.aspect.class.harmonic' AND locale = 'ru-RU' AND topic_category = 'career';

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.10.ruler.jupiter.aspect.class.harmonic', 'career', 'ru-RU', 'Гармоничные аспекты управителя 10-го дома (трины/секстили и др.) дают поддержку: легче находить союзников, получать признание, развивать компетенции без постоянного сопротивления. Важно не расслабляться — гармония раскрывается через практику и системность.', 120, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.10.ruler.jupiter.aspect.class.harmonic' AND locale = 'ru-RU' AND topic_category = 'career'
);

UPDATE knowledge_items
SET text = 'Аспект управителя 10-го дома к MC — прямой индикатор «карьерной судьбы»: как ваша личная воля/стиль решений подключаются к публичной роли. Это усиливает заметность и требует ясной цели.', is_active = 1, priority = 120, meta_json = '{}'
WHERE key = 'natal.house.10.ruler.jupiter.aspect.any.with.angle.mc' AND locale = 'ru-RU' AND topic_category = 'career';

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.10.ruler.jupiter.aspect.any.with.angle.mc', 'career', 'ru-RU', 'Аспект управителя 10-го дома к MC — прямой индикатор «карьерной судьбы»: как ваша личная воля/стиль решений подключаются к публичной роли. Это усиливает заметность и требует ясной цели.', 120, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.10.ruler.jupiter.aspect.any.with.angle.mc' AND locale = 'ru-RU' AND topic_category = 'career'
);

UPDATE knowledge_items
SET text = 'Аспект управителя 10-го дома к ASC связывает карьеру с образом «я»: то, как вы проявляетесь лично, напрямую влияет на профессиональную репутацию. Важно управлять первым впечатлением.', is_active = 1, priority = 120, meta_json = '{}'
WHERE key = 'natal.house.10.ruler.jupiter.aspect.any.with.angle.asc' AND locale = 'ru-RU' AND topic_category = 'career';

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.10.ruler.jupiter.aspect.any.with.angle.asc', 'career', 'ru-RU', 'Аспект управителя 10-го дома к ASC связывает карьеру с образом «я»: то, как вы проявляетесь лично, напрямую влияет на профессиональную репутацию. Важно управлять первым впечатлением.', 120, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.10.ruler.jupiter.aspect.any.with.angle.asc' AND locale = 'ru-RU' AND topic_category = 'career'
);

UPDATE knowledge_items
SET text = 'Аспект управителя 10-го дома к IC связывает карьеру с домом/семьёй/внутренней опорой: баланс приватного и публичного становится ключом к устойчивому росту.', is_active = 1, priority = 120, meta_json = '{}'
WHERE key = 'natal.house.10.ruler.jupiter.aspect.any.with.angle.ic' AND locale = 'ru-RU' AND topic_category = 'career';

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.10.ruler.jupiter.aspect.any.with.angle.ic', 'career', 'ru-RU', 'Аспект управителя 10-го дома к IC связывает карьеру с домом/семьёй/внутренней опорой: баланс приватного и публичного становится ключом к устойчивому росту.', 120, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.10.ruler.jupiter.aspect.any.with.angle.ic' AND locale = 'ru-RU' AND topic_category = 'career'
);

UPDATE knowledge_items
SET text = 'Аспект управителя 10-го дома к DSC связывает карьеру с партнёрствами и клиентами: успех приходит через договорённости, совместные проекты и качество отношений.', is_active = 1, priority = 120, meta_json = '{}'
WHERE key = 'natal.house.10.ruler.jupiter.aspect.any.with.angle.dsc' AND locale = 'ru-RU' AND topic_category = 'career';

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.10.ruler.jupiter.aspect.any.with.angle.dsc', 'career', 'ru-RU', 'Аспект управителя 10-го дома к DSC связывает карьеру с партнёрствами и клиентами: успех приходит через договорённости, совместные проекты и качество отношений.', 120, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.10.ruler.jupiter.aspect.any.with.angle.dsc' AND locale = 'ru-RU' AND topic_category = 'career'
);

UPDATE knowledge_items
SET text = 'Управитель 10-го дома по знаку показывает «манеру реализации»: какой стиль решений, коммуникации и мотивации помогает расти.', is_active = 1, priority = 120, meta_json = '{}'
WHERE key = 'natal.house.10.ruler.saturn.sign.any' AND locale = 'ru-RU' AND topic_category = 'career';

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.10.ruler.saturn.sign.any', 'career', 'ru-RU', 'Управитель 10-го дома по знаку показывает «манеру реализации»: какой стиль решений, коммуникации и мотивации помогает расти.', 120, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.10.ruler.saturn.sign.any' AND locale = 'ru-RU' AND topic_category = 'career'
);

UPDATE knowledge_items
SET text = 'Управитель 10-го дома по дому показывает «куда уходит энергия карьеры»: через какую сферу жизни вы чаще всего делаете статус, капитал или признание.', is_active = 1, priority = 120, meta_json = '{}'
WHERE key = 'natal.house.10.ruler.saturn.house.any' AND locale = 'ru-RU' AND topic_category = 'career';

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.10.ruler.saturn.house.any', 'career', 'ru-RU', 'Управитель 10-го дома по дому показывает «куда уходит энергия карьеры»: через какую сферу жизни вы чаще всего делаете статус, капитал или признание.', 120, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.10.ruler.saturn.house.any' AND locale = 'ru-RU' AND topic_category = 'career'
);

UPDATE knowledge_items
SET text = 'Связка «управитель 10-го дома: знак + дом» — один из самых практичных индикаторов: она показывает и стиль (знак), и площадку (дом), где карьера легче собирается в систему.', is_active = 1, priority = 120, meta_json = '{}'
WHERE key = 'natal.house.10.ruler.saturn.sign.any.house.any' AND locale = 'ru-RU' AND topic_category = 'career';

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.10.ruler.saturn.sign.any.house.any', 'career', 'ru-RU', 'Связка «управитель 10-го дома: знак + дом» — один из самых практичных индикаторов: она показывает и стиль (знак), и площадку (дом), где карьера легче собирается в систему.', 120, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.10.ruler.saturn.sign.any.house.any' AND locale = 'ru-RU' AND topic_category = 'career'
);

UPDATE knowledge_items
SET text = 'Аспекты управителя 10-го дома описывают динамику карьеры: с кем/чем вы входите во взаимодействие, где идёт ускорение, где — торможение, и через какие навыки вы становитесь устойчивее. Смотрите повторяющиеся темы: власть/контроль, публичность, коммуникации, риск, обучение, партнёрства.', is_active = 1, priority = 120, meta_json = '{}'
WHERE key = 'natal.house.10.ruler.saturn.aspect.any.any' AND locale = 'ru-RU' AND topic_category = 'career';

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.10.ruler.saturn.aspect.any.any', 'career', 'ru-RU', 'Аспекты управителя 10-го дома описывают динамику карьеры: с кем/чем вы входите во взаимодействие, где идёт ускорение, где — торможение, и через какие навыки вы становитесь устойчивее. Смотрите повторяющиеся темы: власть/контроль, публичность, коммуникации, риск, обучение, партнёрства.', 120, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.10.ruler.saturn.aspect.any.any' AND locale = 'ru-RU' AND topic_category = 'career'
);

UPDATE knowledge_items
SET text = 'Маркер «hard aspects present» у управителя 10-го дома означает, что в карьере будут узлы напряжения, которые нельзя игнорировать. Это точки роста: конфликт интересов, давление ожиданий, необходимость выбора. Лучшее решение — заранее продумать правила, границы и структуру ответственности.', is_active = 1, priority = 120, meta_json = '{}'
WHERE key = 'natal.house.10.ruler.saturn.aspect.hard.present' AND locale = 'ru-RU' AND topic_category = 'career';

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.10.ruler.saturn.aspect.hard.present', 'career', 'ru-RU', 'Маркер «hard aspects present» у управителя 10-го дома означает, что в карьере будут узлы напряжения, которые нельзя игнорировать. Это точки роста: конфликт интересов, давление ожиданий, необходимость выбора. Лучшее решение — заранее продумать правила, границы и структуру ответственности.', 120, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.10.ruler.saturn.aspect.hard.present' AND locale = 'ru-RU' AND topic_category = 'career'
);

UPDATE knowledge_items
SET text = 'Напряжённые аспекты управителя 10-го дома (квадраты/оппозиции и др. «тягучие» связи) дают рост через вызовы: конкуренцию, дедлайны, необходимость границ и навыка переговоров. Это не «плохо», а требование к стратегии: план, дисциплина, приоритеты, здоровый режим.', is_active = 1, priority = 120, meta_json = '{}'
WHERE key = 'natal.house.10.ruler.saturn.aspect.class.tense' AND locale = 'ru-RU' AND topic_category = 'career';

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.10.ruler.saturn.aspect.class.tense', 'career', 'ru-RU', 'Напряжённые аспекты управителя 10-го дома (квадраты/оппозиции и др. «тягучие» связи) дают рост через вызовы: конкуренцию, дедлайны, необходимость границ и навыка переговоров. Это не «плохо», а требование к стратегии: план, дисциплина, приоритеты, здоровый режим.', 120, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.10.ruler.saturn.aspect.class.tense' AND locale = 'ru-RU' AND topic_category = 'career'
);

UPDATE knowledge_items
SET text = 'Гармоничные аспекты управителя 10-го дома (трины/секстили и др.) дают поддержку: легче находить союзников, получать признание, развивать компетенции без постоянного сопротивления. Важно не расслабляться — гармония раскрывается через практику и системность.', is_active = 1, priority = 120, meta_json = '{}'
WHERE key = 'natal.house.10.ruler.saturn.aspect.class.harmonic' AND locale = 'ru-RU' AND topic_category = 'career';

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.10.ruler.saturn.aspect.class.harmonic', 'career', 'ru-RU', 'Гармоничные аспекты управителя 10-го дома (трины/секстили и др.) дают поддержку: легче находить союзников, получать признание, развивать компетенции без постоянного сопротивления. Важно не расслабляться — гармония раскрывается через практику и системность.', 120, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.10.ruler.saturn.aspect.class.harmonic' AND locale = 'ru-RU' AND topic_category = 'career'
);

UPDATE knowledge_items
SET text = 'Аспект управителя 10-го дома к MC — прямой индикатор «карьерной судьбы»: как ваша личная воля/стиль решений подключаются к публичной роли. Это усиливает заметность и требует ясной цели.', is_active = 1, priority = 120, meta_json = '{}'
WHERE key = 'natal.house.10.ruler.saturn.aspect.any.with.angle.mc' AND locale = 'ru-RU' AND topic_category = 'career';

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.10.ruler.saturn.aspect.any.with.angle.mc', 'career', 'ru-RU', 'Аспект управителя 10-го дома к MC — прямой индикатор «карьерной судьбы»: как ваша личная воля/стиль решений подключаются к публичной роли. Это усиливает заметность и требует ясной цели.', 120, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.10.ruler.saturn.aspect.any.with.angle.mc' AND locale = 'ru-RU' AND topic_category = 'career'
);

UPDATE knowledge_items
SET text = 'Аспект управителя 10-го дома к ASC связывает карьеру с образом «я»: то, как вы проявляетесь лично, напрямую влияет на профессиональную репутацию. Важно управлять первым впечатлением.', is_active = 1, priority = 120, meta_json = '{}'
WHERE key = 'natal.house.10.ruler.saturn.aspect.any.with.angle.asc' AND locale = 'ru-RU' AND topic_category = 'career';

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.10.ruler.saturn.aspect.any.with.angle.asc', 'career', 'ru-RU', 'Аспект управителя 10-го дома к ASC связывает карьеру с образом «я»: то, как вы проявляетесь лично, напрямую влияет на профессиональную репутацию. Важно управлять первым впечатлением.', 120, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.10.ruler.saturn.aspect.any.with.angle.asc' AND locale = 'ru-RU' AND topic_category = 'career'
);

UPDATE knowledge_items
SET text = 'Аспект управителя 10-го дома к IC связывает карьеру с домом/семьёй/внутренней опорой: баланс приватного и публичного становится ключом к устойчивому росту.', is_active = 1, priority = 120, meta_json = '{}'
WHERE key = 'natal.house.10.ruler.saturn.aspect.any.with.angle.ic' AND locale = 'ru-RU' AND topic_category = 'career';

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.10.ruler.saturn.aspect.any.with.angle.ic', 'career', 'ru-RU', 'Аспект управителя 10-го дома к IC связывает карьеру с домом/семьёй/внутренней опорой: баланс приватного и публичного становится ключом к устойчивому росту.', 120, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.10.ruler.saturn.aspect.any.with.angle.ic' AND locale = 'ru-RU' AND topic_category = 'career'
);

UPDATE knowledge_items
SET text = 'Аспект управителя 10-го дома к DSC связывает карьеру с партнёрствами и клиентами: успех приходит через договорённости, совместные проекты и качество отношений.', is_active = 1, priority = 120, meta_json = '{}'
WHERE key = 'natal.house.10.ruler.saturn.aspect.any.with.angle.dsc' AND locale = 'ru-RU' AND topic_category = 'career';

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.10.ruler.saturn.aspect.any.with.angle.dsc', 'career', 'ru-RU', 'Аспект управителя 10-го дома к DSC связывает карьеру с партнёрствами и клиентами: успех приходит через договорённости, совместные проекты и качество отношений.', 120, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.10.ruler.saturn.aspect.any.with.angle.dsc' AND locale = 'ru-RU' AND topic_category = 'career'
);

UPDATE knowledge_items
SET text = 'Управитель 10-го дома по знаку показывает «манеру реализации»: какой стиль решений, коммуникации и мотивации помогает расти.', is_active = 1, priority = 120, meta_json = '{}'
WHERE key = 'natal.house.10.ruler.uranus.sign.any' AND locale = 'ru-RU' AND topic_category = 'career';

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.10.ruler.uranus.sign.any', 'career', 'ru-RU', 'Управитель 10-го дома по знаку показывает «манеру реализации»: какой стиль решений, коммуникации и мотивации помогает расти.', 120, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.10.ruler.uranus.sign.any' AND locale = 'ru-RU' AND topic_category = 'career'
);

UPDATE knowledge_items
SET text = 'Управитель 10-го дома по дому показывает «куда уходит энергия карьеры»: через какую сферу жизни вы чаще всего делаете статус, капитал или признание.', is_active = 1, priority = 120, meta_json = '{}'
WHERE key = 'natal.house.10.ruler.uranus.house.any' AND locale = 'ru-RU' AND topic_category = 'career';

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.10.ruler.uranus.house.any', 'career', 'ru-RU', 'Управитель 10-го дома по дому показывает «куда уходит энергия карьеры»: через какую сферу жизни вы чаще всего делаете статус, капитал или признание.', 120, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.10.ruler.uranus.house.any' AND locale = 'ru-RU' AND topic_category = 'career'
);

UPDATE knowledge_items
SET text = 'Связка «управитель 10-го дома: знак + дом» — один из самых практичных индикаторов: она показывает и стиль (знак), и площадку (дом), где карьера легче собирается в систему.', is_active = 1, priority = 120, meta_json = '{}'
WHERE key = 'natal.house.10.ruler.uranus.sign.any.house.any' AND locale = 'ru-RU' AND topic_category = 'career';

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.10.ruler.uranus.sign.any.house.any', 'career', 'ru-RU', 'Связка «управитель 10-го дома: знак + дом» — один из самых практичных индикаторов: она показывает и стиль (знак), и площадку (дом), где карьера легче собирается в систему.', 120, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.10.ruler.uranus.sign.any.house.any' AND locale = 'ru-RU' AND topic_category = 'career'
);

UPDATE knowledge_items
SET text = 'Аспекты управителя 10-го дома описывают динамику карьеры: с кем/чем вы входите во взаимодействие, где идёт ускорение, где — торможение, и через какие навыки вы становитесь устойчивее. Смотрите повторяющиеся темы: власть/контроль, публичность, коммуникации, риск, обучение, партнёрства.', is_active = 1, priority = 120, meta_json = '{}'
WHERE key = 'natal.house.10.ruler.uranus.aspect.any.any' AND locale = 'ru-RU' AND topic_category = 'career';

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.10.ruler.uranus.aspect.any.any', 'career', 'ru-RU', 'Аспекты управителя 10-го дома описывают динамику карьеры: с кем/чем вы входите во взаимодействие, где идёт ускорение, где — торможение, и через какие навыки вы становитесь устойчивее. Смотрите повторяющиеся темы: власть/контроль, публичность, коммуникации, риск, обучение, партнёрства.', 120, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.10.ruler.uranus.aspect.any.any' AND locale = 'ru-RU' AND topic_category = 'career'
);

UPDATE knowledge_items
SET text = 'Маркер «hard aspects present» у управителя 10-го дома означает, что в карьере будут узлы напряжения, которые нельзя игнорировать. Это точки роста: конфликт интересов, давление ожиданий, необходимость выбора. Лучшее решение — заранее продумать правила, границы и структуру ответственности.', is_active = 1, priority = 120, meta_json = '{}'
WHERE key = 'natal.house.10.ruler.uranus.aspect.hard.present' AND locale = 'ru-RU' AND topic_category = 'career';

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.10.ruler.uranus.aspect.hard.present', 'career', 'ru-RU', 'Маркер «hard aspects present» у управителя 10-го дома означает, что в карьере будут узлы напряжения, которые нельзя игнорировать. Это точки роста: конфликт интересов, давление ожиданий, необходимость выбора. Лучшее решение — заранее продумать правила, границы и структуру ответственности.', 120, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.10.ruler.uranus.aspect.hard.present' AND locale = 'ru-RU' AND topic_category = 'career'
);

UPDATE knowledge_items
SET text = 'Напряжённые аспекты управителя 10-го дома (квадраты/оппозиции и др. «тягучие» связи) дают рост через вызовы: конкуренцию, дедлайны, необходимость границ и навыка переговоров. Это не «плохо», а требование к стратегии: план, дисциплина, приоритеты, здоровый режим.', is_active = 1, priority = 120, meta_json = '{}'
WHERE key = 'natal.house.10.ruler.uranus.aspect.class.tense' AND locale = 'ru-RU' AND topic_category = 'career';

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.10.ruler.uranus.aspect.class.tense', 'career', 'ru-RU', 'Напряжённые аспекты управителя 10-го дома (квадраты/оппозиции и др. «тягучие» связи) дают рост через вызовы: конкуренцию, дедлайны, необходимость границ и навыка переговоров. Это не «плохо», а требование к стратегии: план, дисциплина, приоритеты, здоровый режим.', 120, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.10.ruler.uranus.aspect.class.tense' AND locale = 'ru-RU' AND topic_category = 'career'
);

UPDATE knowledge_items
SET text = 'Гармоничные аспекты управителя 10-го дома (трины/секстили и др.) дают поддержку: легче находить союзников, получать признание, развивать компетенции без постоянного сопротивления. Важно не расслабляться — гармония раскрывается через практику и системность.', is_active = 1, priority = 120, meta_json = '{}'
WHERE key = 'natal.house.10.ruler.uranus.aspect.class.harmonic' AND locale = 'ru-RU' AND topic_category = 'career';

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.10.ruler.uranus.aspect.class.harmonic', 'career', 'ru-RU', 'Гармоничные аспекты управителя 10-го дома (трины/секстили и др.) дают поддержку: легче находить союзников, получать признание, развивать компетенции без постоянного сопротивления. Важно не расслабляться — гармония раскрывается через практику и системность.', 120, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.10.ruler.uranus.aspect.class.harmonic' AND locale = 'ru-RU' AND topic_category = 'career'
);

UPDATE knowledge_items
SET text = 'Аспект управителя 10-го дома к MC — прямой индикатор «карьерной судьбы»: как ваша личная воля/стиль решений подключаются к публичной роли. Это усиливает заметность и требует ясной цели.', is_active = 1, priority = 120, meta_json = '{}'
WHERE key = 'natal.house.10.ruler.uranus.aspect.any.with.angle.mc' AND locale = 'ru-RU' AND topic_category = 'career';

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.10.ruler.uranus.aspect.any.with.angle.mc', 'career', 'ru-RU', 'Аспект управителя 10-го дома к MC — прямой индикатор «карьерной судьбы»: как ваша личная воля/стиль решений подключаются к публичной роли. Это усиливает заметность и требует ясной цели.', 120, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.10.ruler.uranus.aspect.any.with.angle.mc' AND locale = 'ru-RU' AND topic_category = 'career'
);

UPDATE knowledge_items
SET text = 'Аспект управителя 10-го дома к ASC связывает карьеру с образом «я»: то, как вы проявляетесь лично, напрямую влияет на профессиональную репутацию. Важно управлять первым впечатлением.', is_active = 1, priority = 120, meta_json = '{}'
WHERE key = 'natal.house.10.ruler.uranus.aspect.any.with.angle.asc' AND locale = 'ru-RU' AND topic_category = 'career';

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.10.ruler.uranus.aspect.any.with.angle.asc', 'career', 'ru-RU', 'Аспект управителя 10-го дома к ASC связывает карьеру с образом «я»: то, как вы проявляетесь лично, напрямую влияет на профессиональную репутацию. Важно управлять первым впечатлением.', 120, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.10.ruler.uranus.aspect.any.with.angle.asc' AND locale = 'ru-RU' AND topic_category = 'career'
);

UPDATE knowledge_items
SET text = 'Аспект управителя 10-го дома к IC связывает карьеру с домом/семьёй/внутренней опорой: баланс приватного и публичного становится ключом к устойчивому росту.', is_active = 1, priority = 120, meta_json = '{}'
WHERE key = 'natal.house.10.ruler.uranus.aspect.any.with.angle.ic' AND locale = 'ru-RU' AND topic_category = 'career';

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.10.ruler.uranus.aspect.any.with.angle.ic', 'career', 'ru-RU', 'Аспект управителя 10-го дома к IC связывает карьеру с домом/семьёй/внутренней опорой: баланс приватного и публичного становится ключом к устойчивому росту.', 120, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.10.ruler.uranus.aspect.any.with.angle.ic' AND locale = 'ru-RU' AND topic_category = 'career'
);

UPDATE knowledge_items
SET text = 'Аспект управителя 10-го дома к DSC связывает карьеру с партнёрствами и клиентами: успех приходит через договорённости, совместные проекты и качество отношений.', is_active = 1, priority = 120, meta_json = '{}'
WHERE key = 'natal.house.10.ruler.uranus.aspect.any.with.angle.dsc' AND locale = 'ru-RU' AND topic_category = 'career';

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.10.ruler.uranus.aspect.any.with.angle.dsc', 'career', 'ru-RU', 'Аспект управителя 10-го дома к DSC связывает карьеру с партнёрствами и клиентами: успех приходит через договорённости, совместные проекты и качество отношений.', 120, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.10.ruler.uranus.aspect.any.with.angle.dsc' AND locale = 'ru-RU' AND topic_category = 'career'
);

UPDATE knowledge_items
SET text = 'Управитель 10-го дома по знаку показывает «манеру реализации»: какой стиль решений, коммуникации и мотивации помогает расти.', is_active = 1, priority = 120, meta_json = '{}'
WHERE key = 'natal.house.10.ruler.neptune.sign.any' AND locale = 'ru-RU' AND topic_category = 'career';

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.10.ruler.neptune.sign.any', 'career', 'ru-RU', 'Управитель 10-го дома по знаку показывает «манеру реализации»: какой стиль решений, коммуникации и мотивации помогает расти.', 120, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.10.ruler.neptune.sign.any' AND locale = 'ru-RU' AND topic_category = 'career'
);

UPDATE knowledge_items
SET text = 'Управитель 10-го дома по дому показывает «куда уходит энергия карьеры»: через какую сферу жизни вы чаще всего делаете статус, капитал или признание.', is_active = 1, priority = 120, meta_json = '{}'
WHERE key = 'natal.house.10.ruler.neptune.house.any' AND locale = 'ru-RU' AND topic_category = 'career';

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.10.ruler.neptune.house.any', 'career', 'ru-RU', 'Управитель 10-го дома по дому показывает «куда уходит энергия карьеры»: через какую сферу жизни вы чаще всего делаете статус, капитал или признание.', 120, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.10.ruler.neptune.house.any' AND locale = 'ru-RU' AND topic_category = 'career'
);

UPDATE knowledge_items
SET text = 'Связка «управитель 10-го дома: знак + дом» — один из самых практичных индикаторов: она показывает и стиль (знак), и площадку (дом), где карьера легче собирается в систему.', is_active = 1, priority = 120, meta_json = '{}'
WHERE key = 'natal.house.10.ruler.neptune.sign.any.house.any' AND locale = 'ru-RU' AND topic_category = 'career';

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.10.ruler.neptune.sign.any.house.any', 'career', 'ru-RU', 'Связка «управитель 10-го дома: знак + дом» — один из самых практичных индикаторов: она показывает и стиль (знак), и площадку (дом), где карьера легче собирается в систему.', 120, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.10.ruler.neptune.sign.any.house.any' AND locale = 'ru-RU' AND topic_category = 'career'
);

UPDATE knowledge_items
SET text = 'Аспекты управителя 10-го дома описывают динамику карьеры: с кем/чем вы входите во взаимодействие, где идёт ускорение, где — торможение, и через какие навыки вы становитесь устойчивее. Смотрите повторяющиеся темы: власть/контроль, публичность, коммуникации, риск, обучение, партнёрства.', is_active = 1, priority = 120, meta_json = '{}'
WHERE key = 'natal.house.10.ruler.neptune.aspect.any.any' AND locale = 'ru-RU' AND topic_category = 'career';

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.10.ruler.neptune.aspect.any.any', 'career', 'ru-RU', 'Аспекты управителя 10-го дома описывают динамику карьеры: с кем/чем вы входите во взаимодействие, где идёт ускорение, где — торможение, и через какие навыки вы становитесь устойчивее. Смотрите повторяющиеся темы: власть/контроль, публичность, коммуникации, риск, обучение, партнёрства.', 120, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.10.ruler.neptune.aspect.any.any' AND locale = 'ru-RU' AND topic_category = 'career'
);

UPDATE knowledge_items
SET text = 'Маркер «hard aspects present» у управителя 10-го дома означает, что в карьере будут узлы напряжения, которые нельзя игнорировать. Это точки роста: конфликт интересов, давление ожиданий, необходимость выбора. Лучшее решение — заранее продумать правила, границы и структуру ответственности.', is_active = 1, priority = 120, meta_json = '{}'
WHERE key = 'natal.house.10.ruler.neptune.aspect.hard.present' AND locale = 'ru-RU' AND topic_category = 'career';

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.10.ruler.neptune.aspect.hard.present', 'career', 'ru-RU', 'Маркер «hard aspects present» у управителя 10-го дома означает, что в карьере будут узлы напряжения, которые нельзя игнорировать. Это точки роста: конфликт интересов, давление ожиданий, необходимость выбора. Лучшее решение — заранее продумать правила, границы и структуру ответственности.', 120, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.10.ruler.neptune.aspect.hard.present' AND locale = 'ru-RU' AND topic_category = 'career'
);

UPDATE knowledge_items
SET text = 'Напряжённые аспекты управителя 10-го дома (квадраты/оппозиции и др. «тягучие» связи) дают рост через вызовы: конкуренцию, дедлайны, необходимость границ и навыка переговоров. Это не «плохо», а требование к стратегии: план, дисциплина, приоритеты, здоровый режим.', is_active = 1, priority = 120, meta_json = '{}'
WHERE key = 'natal.house.10.ruler.neptune.aspect.class.tense' AND locale = 'ru-RU' AND topic_category = 'career';

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.10.ruler.neptune.aspect.class.tense', 'career', 'ru-RU', 'Напряжённые аспекты управителя 10-го дома (квадраты/оппозиции и др. «тягучие» связи) дают рост через вызовы: конкуренцию, дедлайны, необходимость границ и навыка переговоров. Это не «плохо», а требование к стратегии: план, дисциплина, приоритеты, здоровый режим.', 120, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.10.ruler.neptune.aspect.class.tense' AND locale = 'ru-RU' AND topic_category = 'career'
);

UPDATE knowledge_items
SET text = 'Гармоничные аспекты управителя 10-го дома (трины/секстили и др.) дают поддержку: легче находить союзников, получать признание, развивать компетенции без постоянного сопротивления. Важно не расслабляться — гармония раскрывается через практику и системность.', is_active = 1, priority = 120, meta_json = '{}'
WHERE key = 'natal.house.10.ruler.neptune.aspect.class.harmonic' AND locale = 'ru-RU' AND topic_category = 'career';

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.10.ruler.neptune.aspect.class.harmonic', 'career', 'ru-RU', 'Гармоничные аспекты управителя 10-го дома (трины/секстили и др.) дают поддержку: легче находить союзников, получать признание, развивать компетенции без постоянного сопротивления. Важно не расслабляться — гармония раскрывается через практику и системность.', 120, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.10.ruler.neptune.aspect.class.harmonic' AND locale = 'ru-RU' AND topic_category = 'career'
);

UPDATE knowledge_items
SET text = 'Аспект управителя 10-го дома к MC — прямой индикатор «карьерной судьбы»: как ваша личная воля/стиль решений подключаются к публичной роли. Это усиливает заметность и требует ясной цели.', is_active = 1, priority = 120, meta_json = '{}'
WHERE key = 'natal.house.10.ruler.neptune.aspect.any.with.angle.mc' AND locale = 'ru-RU' AND topic_category = 'career';

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.10.ruler.neptune.aspect.any.with.angle.mc', 'career', 'ru-RU', 'Аспект управителя 10-го дома к MC — прямой индикатор «карьерной судьбы»: как ваша личная воля/стиль решений подключаются к публичной роли. Это усиливает заметность и требует ясной цели.', 120, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.10.ruler.neptune.aspect.any.with.angle.mc' AND locale = 'ru-RU' AND topic_category = 'career'
);

UPDATE knowledge_items
SET text = 'Аспект управителя 10-го дома к ASC связывает карьеру с образом «я»: то, как вы проявляетесь лично, напрямую влияет на профессиональную репутацию. Важно управлять первым впечатлением.', is_active = 1, priority = 120, meta_json = '{}'
WHERE key = 'natal.house.10.ruler.neptune.aspect.any.with.angle.asc' AND locale = 'ru-RU' AND topic_category = 'career';

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.10.ruler.neptune.aspect.any.with.angle.asc', 'career', 'ru-RU', 'Аспект управителя 10-го дома к ASC связывает карьеру с образом «я»: то, как вы проявляетесь лично, напрямую влияет на профессиональную репутацию. Важно управлять первым впечатлением.', 120, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.10.ruler.neptune.aspect.any.with.angle.asc' AND locale = 'ru-RU' AND topic_category = 'career'
);

UPDATE knowledge_items
SET text = 'Аспект управителя 10-го дома к IC связывает карьеру с домом/семьёй/внутренней опорой: баланс приватного и публичного становится ключом к устойчивому росту.', is_active = 1, priority = 120, meta_json = '{}'
WHERE key = 'natal.house.10.ruler.neptune.aspect.any.with.angle.ic' AND locale = 'ru-RU' AND topic_category = 'career';

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.10.ruler.neptune.aspect.any.with.angle.ic', 'career', 'ru-RU', 'Аспект управителя 10-го дома к IC связывает карьеру с домом/семьёй/внутренней опорой: баланс приватного и публичного становится ключом к устойчивому росту.', 120, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.10.ruler.neptune.aspect.any.with.angle.ic' AND locale = 'ru-RU' AND topic_category = 'career'
);

UPDATE knowledge_items
SET text = 'Аспект управителя 10-го дома к DSC связывает карьеру с партнёрствами и клиентами: успех приходит через договорённости, совместные проекты и качество отношений.', is_active = 1, priority = 120, meta_json = '{}'
WHERE key = 'natal.house.10.ruler.neptune.aspect.any.with.angle.dsc' AND locale = 'ru-RU' AND topic_category = 'career';

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.10.ruler.neptune.aspect.any.with.angle.dsc', 'career', 'ru-RU', 'Аспект управителя 10-го дома к DSC связывает карьеру с партнёрствами и клиентами: успех приходит через договорённости, совместные проекты и качество отношений.', 120, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.10.ruler.neptune.aspect.any.with.angle.dsc' AND locale = 'ru-RU' AND topic_category = 'career'
);

UPDATE knowledge_items
SET text = 'Управитель 10-го дома по знаку показывает «манеру реализации»: какой стиль решений, коммуникации и мотивации помогает расти.', is_active = 1, priority = 120, meta_json = '{}'
WHERE key = 'natal.house.10.ruler.pluto.sign.any' AND locale = 'ru-RU' AND topic_category = 'career';

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.10.ruler.pluto.sign.any', 'career', 'ru-RU', 'Управитель 10-го дома по знаку показывает «манеру реализации»: какой стиль решений, коммуникации и мотивации помогает расти.', 120, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.10.ruler.pluto.sign.any' AND locale = 'ru-RU' AND topic_category = 'career'
);

UPDATE knowledge_items
SET text = 'Управитель 10-го дома по дому показывает «куда уходит энергия карьеры»: через какую сферу жизни вы чаще всего делаете статус, капитал или признание.', is_active = 1, priority = 120, meta_json = '{}'
WHERE key = 'natal.house.10.ruler.pluto.house.any' AND locale = 'ru-RU' AND topic_category = 'career';

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.10.ruler.pluto.house.any', 'career', 'ru-RU', 'Управитель 10-го дома по дому показывает «куда уходит энергия карьеры»: через какую сферу жизни вы чаще всего делаете статус, капитал или признание.', 120, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.10.ruler.pluto.house.any' AND locale = 'ru-RU' AND topic_category = 'career'
);

UPDATE knowledge_items
SET text = 'Связка «управитель 10-го дома: знак + дом» — один из самых практичных индикаторов: она показывает и стиль (знак), и площадку (дом), где карьера легче собирается в систему.', is_active = 1, priority = 120, meta_json = '{}'
WHERE key = 'natal.house.10.ruler.pluto.sign.any.house.any' AND locale = 'ru-RU' AND topic_category = 'career';

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.10.ruler.pluto.sign.any.house.any', 'career', 'ru-RU', 'Связка «управитель 10-го дома: знак + дом» — один из самых практичных индикаторов: она показывает и стиль (знак), и площадку (дом), где карьера легче собирается в систему.', 120, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.10.ruler.pluto.sign.any.house.any' AND locale = 'ru-RU' AND topic_category = 'career'
);

UPDATE knowledge_items
SET text = 'Аспекты управителя 10-го дома описывают динамику карьеры: с кем/чем вы входите во взаимодействие, где идёт ускорение, где — торможение, и через какие навыки вы становитесь устойчивее. Смотрите повторяющиеся темы: власть/контроль, публичность, коммуникации, риск, обучение, партнёрства.', is_active = 1, priority = 120, meta_json = '{}'
WHERE key = 'natal.house.10.ruler.pluto.aspect.any.any' AND locale = 'ru-RU' AND topic_category = 'career';

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.10.ruler.pluto.aspect.any.any', 'career', 'ru-RU', 'Аспекты управителя 10-го дома описывают динамику карьеры: с кем/чем вы входите во взаимодействие, где идёт ускорение, где — торможение, и через какие навыки вы становитесь устойчивее. Смотрите повторяющиеся темы: власть/контроль, публичность, коммуникации, риск, обучение, партнёрства.', 120, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.10.ruler.pluto.aspect.any.any' AND locale = 'ru-RU' AND topic_category = 'career'
);

UPDATE knowledge_items
SET text = 'Маркер «hard aspects present» у управителя 10-го дома означает, что в карьере будут узлы напряжения, которые нельзя игнорировать. Это точки роста: конфликт интересов, давление ожиданий, необходимость выбора. Лучшее решение — заранее продумать правила, границы и структуру ответственности.', is_active = 1, priority = 120, meta_json = '{}'
WHERE key = 'natal.house.10.ruler.pluto.aspect.hard.present' AND locale = 'ru-RU' AND topic_category = 'career';

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.10.ruler.pluto.aspect.hard.present', 'career', 'ru-RU', 'Маркер «hard aspects present» у управителя 10-го дома означает, что в карьере будут узлы напряжения, которые нельзя игнорировать. Это точки роста: конфликт интересов, давление ожиданий, необходимость выбора. Лучшее решение — заранее продумать правила, границы и структуру ответственности.', 120, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.10.ruler.pluto.aspect.hard.present' AND locale = 'ru-RU' AND topic_category = 'career'
);

UPDATE knowledge_items
SET text = 'Напряжённые аспекты управителя 10-го дома (квадраты/оппозиции и др. «тягучие» связи) дают рост через вызовы: конкуренцию, дедлайны, необходимость границ и навыка переговоров. Это не «плохо», а требование к стратегии: план, дисциплина, приоритеты, здоровый режим.', is_active = 1, priority = 120, meta_json = '{}'
WHERE key = 'natal.house.10.ruler.pluto.aspect.class.tense' AND locale = 'ru-RU' AND topic_category = 'career';

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.10.ruler.pluto.aspect.class.tense', 'career', 'ru-RU', 'Напряжённые аспекты управителя 10-го дома (квадраты/оппозиции и др. «тягучие» связи) дают рост через вызовы: конкуренцию, дедлайны, необходимость границ и навыка переговоров. Это не «плохо», а требование к стратегии: план, дисциплина, приоритеты, здоровый режим.', 120, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.10.ruler.pluto.aspect.class.tense' AND locale = 'ru-RU' AND topic_category = 'career'
);

UPDATE knowledge_items
SET text = 'Гармоничные аспекты управителя 10-го дома (трины/секстили и др.) дают поддержку: легче находить союзников, получать признание, развивать компетенции без постоянного сопротивления. Важно не расслабляться — гармония раскрывается через практику и системность.', is_active = 1, priority = 120, meta_json = '{}'
WHERE key = 'natal.house.10.ruler.pluto.aspect.class.harmonic' AND locale = 'ru-RU' AND topic_category = 'career';

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.10.ruler.pluto.aspect.class.harmonic', 'career', 'ru-RU', 'Гармоничные аспекты управителя 10-го дома (трины/секстили и др.) дают поддержку: легче находить союзников, получать признание, развивать компетенции без постоянного сопротивления. Важно не расслабляться — гармония раскрывается через практику и системность.', 120, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.10.ruler.pluto.aspect.class.harmonic' AND locale = 'ru-RU' AND topic_category = 'career'
);

UPDATE knowledge_items
SET text = 'Аспект управителя 10-го дома к MC — прямой индикатор «карьерной судьбы»: как ваша личная воля/стиль решений подключаются к публичной роли. Это усиливает заметность и требует ясной цели.', is_active = 1, priority = 120, meta_json = '{}'
WHERE key = 'natal.house.10.ruler.pluto.aspect.any.with.angle.mc' AND locale = 'ru-RU' AND topic_category = 'career';

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.10.ruler.pluto.aspect.any.with.angle.mc', 'career', 'ru-RU', 'Аспект управителя 10-го дома к MC — прямой индикатор «карьерной судьбы»: как ваша личная воля/стиль решений подключаются к публичной роли. Это усиливает заметность и требует ясной цели.', 120, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.10.ruler.pluto.aspect.any.with.angle.mc' AND locale = 'ru-RU' AND topic_category = 'career'
);

UPDATE knowledge_items
SET text = 'Аспект управителя 10-го дома к ASC связывает карьеру с образом «я»: то, как вы проявляетесь лично, напрямую влияет на профессиональную репутацию. Важно управлять первым впечатлением.', is_active = 1, priority = 120, meta_json = '{}'
WHERE key = 'natal.house.10.ruler.pluto.aspect.any.with.angle.asc' AND locale = 'ru-RU' AND topic_category = 'career';

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.10.ruler.pluto.aspect.any.with.angle.asc', 'career', 'ru-RU', 'Аспект управителя 10-го дома к ASC связывает карьеру с образом «я»: то, как вы проявляетесь лично, напрямую влияет на профессиональную репутацию. Важно управлять первым впечатлением.', 120, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.10.ruler.pluto.aspect.any.with.angle.asc' AND locale = 'ru-RU' AND topic_category = 'career'
);

UPDATE knowledge_items
SET text = 'Аспект управителя 10-го дома к IC связывает карьеру с домом/семьёй/внутренней опорой: баланс приватного и публичного становится ключом к устойчивому росту.', is_active = 1, priority = 120, meta_json = '{}'
WHERE key = 'natal.house.10.ruler.pluto.aspect.any.with.angle.ic' AND locale = 'ru-RU' AND topic_category = 'career';

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.10.ruler.pluto.aspect.any.with.angle.ic', 'career', 'ru-RU', 'Аспект управителя 10-го дома к IC связывает карьеру с домом/семьёй/внутренней опорой: баланс приватного и публичного становится ключом к устойчивому росту.', 120, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.10.ruler.pluto.aspect.any.with.angle.ic' AND locale = 'ru-RU' AND topic_category = 'career'
);

UPDATE knowledge_items
SET text = 'Аспект управителя 10-го дома к DSC связывает карьеру с партнёрствами и клиентами: успех приходит через договорённости, совместные проекты и качество отношений.', is_active = 1, priority = 120, meta_json = '{}'
WHERE key = 'natal.house.10.ruler.pluto.aspect.any.with.angle.dsc' AND locale = 'ru-RU' AND topic_category = 'career';

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.10.ruler.pluto.aspect.any.with.angle.dsc', 'career', 'ru-RU', 'Аспект управителя 10-го дома к DSC связывает карьеру с партнёрствами и клиентами: успех приходит через договорённости, совместные проекты и качество отношений.', 120, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.10.ruler.pluto.aspect.any.with.angle.dsc' AND locale = 'ru-RU' AND topic_category = 'career'
);

UPDATE knowledge_items
SET text = 'Аспекты управителя 10-го дома описывают динамику карьеры: с кем/чем вы входите во взаимодействие, где идёт ускорение, где — торможение, и через какие навыки вы становитесь устойчивее. Смотрите повторяющиеся темы: власть/контроль, публичность, коммуникации, риск, обучение, партнёрства.', is_active = 1, priority = 120, meta_json = '{}'
WHERE key = 'natal.house.10.ruler.aspect.any.any' AND locale = 'ru-RU' AND topic_category = 'career';

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.10.ruler.aspect.any.any', 'career', 'ru-RU', 'Аспекты управителя 10-го дома описывают динамику карьеры: с кем/чем вы входите во взаимодействие, где идёт ускорение, где — торможение, и через какие навыки вы становитесь устойчивее. Смотрите повторяющиеся темы: власть/контроль, публичность, коммуникации, риск, обучение, партнёрства.', 120, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.10.ruler.aspect.any.any' AND locale = 'ru-RU' AND topic_category = 'career'
);

UPDATE knowledge_items
SET text = 'Маркер «hard aspects present» у управителя 10-го дома означает, что в карьере будут узлы напряжения, которые нельзя игнорировать. Это точки роста: конфликт интересов, давление ожиданий, необходимость выбора. Лучшее решение — заранее продумать правила, границы и структуру ответственности.', is_active = 1, priority = 120, meta_json = '{}'
WHERE key = 'natal.house.10.ruler.aspect.hard.present' AND locale = 'ru-RU' AND topic_category = 'career';

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.10.ruler.aspect.hard.present', 'career', 'ru-RU', 'Маркер «hard aspects present» у управителя 10-го дома означает, что в карьере будут узлы напряжения, которые нельзя игнорировать. Это точки роста: конфликт интересов, давление ожиданий, необходимость выбора. Лучшее решение — заранее продумать правила, границы и структуру ответственности.', 120, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.10.ruler.aspect.hard.present' AND locale = 'ru-RU' AND topic_category = 'career'
);

UPDATE knowledge_items
SET text = 'Напряжённые аспекты управителя 10-го дома (квадраты/оппозиции и др. «тягучие» связи) дают рост через вызовы: конкуренцию, дедлайны, необходимость границ и навыка переговоров. Это не «плохо», а требование к стратегии: план, дисциплина, приоритеты, здоровый режим.', is_active = 1, priority = 120, meta_json = '{}'
WHERE key = 'natal.house.10.ruler.aspect.class.tense' AND locale = 'ru-RU' AND topic_category = 'career';

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.10.ruler.aspect.class.tense', 'career', 'ru-RU', 'Напряжённые аспекты управителя 10-го дома (квадраты/оппозиции и др. «тягучие» связи) дают рост через вызовы: конкуренцию, дедлайны, необходимость границ и навыка переговоров. Это не «плохо», а требование к стратегии: план, дисциплина, приоритеты, здоровый режим.', 120, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.10.ruler.aspect.class.tense' AND locale = 'ru-RU' AND topic_category = 'career'
);

UPDATE knowledge_items
SET text = 'Гармоничные аспекты управителя 10-го дома (трины/секстили и др.) дают поддержку: легче находить союзников, получать признание, развивать компетенции без постоянного сопротивления. Важно не расслабляться — гармония раскрывается через практику и системность.', is_active = 1, priority = 120, meta_json = '{}'
WHERE key = 'natal.house.10.ruler.aspect.class.harmonic' AND locale = 'ru-RU' AND topic_category = 'career';

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.10.ruler.aspect.class.harmonic', 'career', 'ru-RU', 'Гармоничные аспекты управителя 10-го дома (трины/секстили и др.) дают поддержку: легче находить союзников, получать признание, развивать компетенции без постоянного сопротивления. Важно не расслабляться — гармония раскрывается через практику и системность.', 120, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.10.ruler.aspect.class.harmonic' AND locale = 'ru-RU' AND topic_category = 'career'
);

UPDATE knowledge_items
SET text = 'Аспект управителя 10-го дома к MC — прямой индикатор «карьерной судьбы»: как ваша личная воля/стиль решений подключаются к публичной роли. Это усиливает заметность и требует ясной цели.', is_active = 1, priority = 120, meta_json = '{}'
WHERE key = 'natal.house.10.ruler.aspect.with.angle.mc' AND locale = 'ru-RU' AND topic_category = 'career';

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.10.ruler.aspect.with.angle.mc', 'career', 'ru-RU', 'Аспект управителя 10-го дома к MC — прямой индикатор «карьерной судьбы»: как ваша личная воля/стиль решений подключаются к публичной роли. Это усиливает заметность и требует ясной цели.', 120, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.10.ruler.aspect.with.angle.mc' AND locale = 'ru-RU' AND topic_category = 'career'
);

UPDATE knowledge_items
SET text = 'Аспект управителя 10-го дома к ASC связывает карьеру с образом «я»: то, как вы проявляетесь лично, напрямую влияет на профессиональную репутацию. Важно управлять первым впечатлением.', is_active = 1, priority = 120, meta_json = '{}'
WHERE key = 'natal.house.10.ruler.aspect.with.angle.asc' AND locale = 'ru-RU' AND topic_category = 'career';

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.10.ruler.aspect.with.angle.asc', 'career', 'ru-RU', 'Аспект управителя 10-го дома к ASC связывает карьеру с образом «я»: то, как вы проявляетесь лично, напрямую влияет на профессиональную репутацию. Важно управлять первым впечатлением.', 120, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.10.ruler.aspect.with.angle.asc' AND locale = 'ru-RU' AND topic_category = 'career'
);

UPDATE knowledge_items
SET text = 'Аспект управителя 10-го дома к IC связывает карьеру с домом/семьёй/внутренней опорой: баланс приватного и публичного становится ключом к устойчивому росту.', is_active = 1, priority = 120, meta_json = '{}'
WHERE key = 'natal.house.10.ruler.aspect.with.angle.ic' AND locale = 'ru-RU' AND topic_category = 'career';

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.10.ruler.aspect.with.angle.ic', 'career', 'ru-RU', 'Аспект управителя 10-го дома к IC связывает карьеру с домом/семьёй/внутренней опорой: баланс приватного и публичного становится ключом к устойчивому росту.', 120, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.10.ruler.aspect.with.angle.ic' AND locale = 'ru-RU' AND topic_category = 'career'
);

UPDATE knowledge_items
SET text = 'Аспект управителя 10-го дома к DSC связывает карьеру с партнёрствами и клиентами: успех приходит через договорённости, совместные проекты и качество отношений.', is_active = 1, priority = 120, meta_json = '{}'
WHERE key = 'natal.house.10.ruler.aspect.with.angle.dsc' AND locale = 'ru-RU' AND topic_category = 'career';

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.10.ruler.aspect.with.angle.dsc', 'career', 'ru-RU', 'Аспект управителя 10-го дома к DSC связывает карьеру с партнёрствами и клиентами: успех приходит через договорённости, совместные проекты и качество отношений.', 120, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.10.ruler.aspect.with.angle.dsc' AND locale = 'ru-RU' AND topic_category = 'career'
);

COMMIT;

