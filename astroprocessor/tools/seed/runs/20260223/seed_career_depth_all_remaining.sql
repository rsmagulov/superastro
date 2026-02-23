-- AUTO-GENERATED. DO NOT EDIT BY HAND.

-- Career depth: fill ALL remaining MC/house10/ruler/aspect keys (topic_category=career)

BEGIN;

UPDATE knowledge_items
SET text = 'MC по знаку (любой): это «манера профессиональной реализации». Даёт стиль решений, темп роста и то, каким образом вы становитесь заметны. Смотрите знак MC + управителя: первый задаёт образ, второй — стратегию.', is_active = 1, priority = 140, meta_json = '{}'
WHERE key = 'natal.angle.mc.sign.any' AND locale = 'ru-RU' AND topic_category = 'career';

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.angle.mc.sign.any', 'career', 'ru-RU', 'MC по знаку (любой): это «манера профессиональной реализации». Даёт стиль решений, темп роста и то, каким образом вы становитесь заметны. Смотрите знак MC + управителя: первый задаёт образ, второй — стратегию.', 140, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.angle.mc.sign.any' AND locale = 'ru-RU' AND topic_category = 'career'
);

UPDATE knowledge_items
SET text = 'MC в «Овен» описывает, как вы хотите выглядеть в профессии и за счёт чего растёт статус. Вектор здесь — не «одна профессия», а стиль реализации: как вы ставите цели, как держите темп и как закрепляете репутацию. Практика: выбирайте роли, где ваш «Овен»-стиль воспринимается как ценность (ответственность, скорость, системность, креатив и т.д.).', is_active = 1, priority = 140, meta_json = '{}'
WHERE key = 'natal.angle.mc.sign.aries' AND locale = 'ru-RU' AND topic_category = 'career';

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.angle.mc.sign.aries', 'career', 'ru-RU', 'MC в «Овен» описывает, как вы хотите выглядеть в профессии и за счёт чего растёт статус. Вектор здесь — не «одна профессия», а стиль реализации: как вы ставите цели, как держите темп и как закрепляете репутацию. Практика: выбирайте роли, где ваш «Овен»-стиль воспринимается как ценность (ответственность, скорость, системность, креатив и т.д.).', 140, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.angle.mc.sign.aries' AND locale = 'ru-RU' AND topic_category = 'career'
);

UPDATE knowledge_items
SET text = 'MC в «Телец» описывает, как вы хотите выглядеть в профессии и за счёт чего растёт статус. Вектор здесь — не «одна профессия», а стиль реализации: как вы ставите цели, как держите темп и как закрепляете репутацию. Практика: выбирайте роли, где ваш «Телец»-стиль воспринимается как ценность (ответственность, скорость, системность, креатив и т.д.).', is_active = 1, priority = 140, meta_json = '{}'
WHERE key = 'natal.angle.mc.sign.taurus' AND locale = 'ru-RU' AND topic_category = 'career';

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.angle.mc.sign.taurus', 'career', 'ru-RU', 'MC в «Телец» описывает, как вы хотите выглядеть в профессии и за счёт чего растёт статус. Вектор здесь — не «одна профессия», а стиль реализации: как вы ставите цели, как держите темп и как закрепляете репутацию. Практика: выбирайте роли, где ваш «Телец»-стиль воспринимается как ценность (ответственность, скорость, системность, креатив и т.д.).', 140, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.angle.mc.sign.taurus' AND locale = 'ru-RU' AND topic_category = 'career'
);

UPDATE knowledge_items
SET text = 'MC в «Близнецы» описывает, как вы хотите выглядеть в профессии и за счёт чего растёт статус. Вектор здесь — не «одна профессия», а стиль реализации: как вы ставите цели, как держите темп и как закрепляете репутацию. Практика: выбирайте роли, где ваш «Близнецы»-стиль воспринимается как ценность (ответственность, скорость, системность, креатив и т.д.).', is_active = 1, priority = 140, meta_json = '{}'
WHERE key = 'natal.angle.mc.sign.gemini' AND locale = 'ru-RU' AND topic_category = 'career';

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.angle.mc.sign.gemini', 'career', 'ru-RU', 'MC в «Близнецы» описывает, как вы хотите выглядеть в профессии и за счёт чего растёт статус. Вектор здесь — не «одна профессия», а стиль реализации: как вы ставите цели, как держите темп и как закрепляете репутацию. Практика: выбирайте роли, где ваш «Близнецы»-стиль воспринимается как ценность (ответственность, скорость, системность, креатив и т.д.).', 140, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.angle.mc.sign.gemini' AND locale = 'ru-RU' AND topic_category = 'career'
);

UPDATE knowledge_items
SET text = 'MC в «Рак» описывает, как вы хотите выглядеть в профессии и за счёт чего растёт статус. Вектор здесь — не «одна профессия», а стиль реализации: как вы ставите цели, как держите темп и как закрепляете репутацию. Практика: выбирайте роли, где ваш «Рак»-стиль воспринимается как ценность (ответственность, скорость, системность, креатив и т.д.).', is_active = 1, priority = 140, meta_json = '{}'
WHERE key = 'natal.angle.mc.sign.cancer' AND locale = 'ru-RU' AND topic_category = 'career';

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.angle.mc.sign.cancer', 'career', 'ru-RU', 'MC в «Рак» описывает, как вы хотите выглядеть в профессии и за счёт чего растёт статус. Вектор здесь — не «одна профессия», а стиль реализации: как вы ставите цели, как держите темп и как закрепляете репутацию. Практика: выбирайте роли, где ваш «Рак»-стиль воспринимается как ценность (ответственность, скорость, системность, креатив и т.д.).', 140, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.angle.mc.sign.cancer' AND locale = 'ru-RU' AND topic_category = 'career'
);

UPDATE knowledge_items
SET text = 'MC в «Лев» описывает, как вы хотите выглядеть в профессии и за счёт чего растёт статус. Вектор здесь — не «одна профессия», а стиль реализации: как вы ставите цели, как держите темп и как закрепляете репутацию. Практика: выбирайте роли, где ваш «Лев»-стиль воспринимается как ценность (ответственность, скорость, системность, креатив и т.д.).', is_active = 1, priority = 140, meta_json = '{}'
WHERE key = 'natal.angle.mc.sign.leo' AND locale = 'ru-RU' AND topic_category = 'career';

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.angle.mc.sign.leo', 'career', 'ru-RU', 'MC в «Лев» описывает, как вы хотите выглядеть в профессии и за счёт чего растёт статус. Вектор здесь — не «одна профессия», а стиль реализации: как вы ставите цели, как держите темп и как закрепляете репутацию. Практика: выбирайте роли, где ваш «Лев»-стиль воспринимается как ценность (ответственность, скорость, системность, креатив и т.д.).', 140, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.angle.mc.sign.leo' AND locale = 'ru-RU' AND topic_category = 'career'
);

UPDATE knowledge_items
SET text = 'MC в «Дева» описывает, как вы хотите выглядеть в профессии и за счёт чего растёт статус. Вектор здесь — не «одна профессия», а стиль реализации: как вы ставите цели, как держите темп и как закрепляете репутацию. Практика: выбирайте роли, где ваш «Дева»-стиль воспринимается как ценность (ответственность, скорость, системность, креатив и т.д.).', is_active = 1, priority = 140, meta_json = '{}'
WHERE key = 'natal.angle.mc.sign.virgo' AND locale = 'ru-RU' AND topic_category = 'career';

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.angle.mc.sign.virgo', 'career', 'ru-RU', 'MC в «Дева» описывает, как вы хотите выглядеть в профессии и за счёт чего растёт статус. Вектор здесь — не «одна профессия», а стиль реализации: как вы ставите цели, как держите темп и как закрепляете репутацию. Практика: выбирайте роли, где ваш «Дева»-стиль воспринимается как ценность (ответственность, скорость, системность, креатив и т.д.).', 140, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.angle.mc.sign.virgo' AND locale = 'ru-RU' AND topic_category = 'career'
);

UPDATE knowledge_items
SET text = 'MC в «Весы» описывает, как вы хотите выглядеть в профессии и за счёт чего растёт статус. Вектор здесь — не «одна профессия», а стиль реализации: как вы ставите цели, как держите темп и как закрепляете репутацию. Практика: выбирайте роли, где ваш «Весы»-стиль воспринимается как ценность (ответственность, скорость, системность, креатив и т.д.).', is_active = 1, priority = 140, meta_json = '{}'
WHERE key = 'natal.angle.mc.sign.libra' AND locale = 'ru-RU' AND topic_category = 'career';

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.angle.mc.sign.libra', 'career', 'ru-RU', 'MC в «Весы» описывает, как вы хотите выглядеть в профессии и за счёт чего растёт статус. Вектор здесь — не «одна профессия», а стиль реализации: как вы ставите цели, как держите темп и как закрепляете репутацию. Практика: выбирайте роли, где ваш «Весы»-стиль воспринимается как ценность (ответственность, скорость, системность, креатив и т.д.).', 140, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.angle.mc.sign.libra' AND locale = 'ru-RU' AND topic_category = 'career'
);

UPDATE knowledge_items
SET text = 'MC в «Скорпион» описывает, как вы хотите выглядеть в профессии и за счёт чего растёт статус. Вектор здесь — не «одна профессия», а стиль реализации: как вы ставите цели, как держите темп и как закрепляете репутацию. Практика: выбирайте роли, где ваш «Скорпион»-стиль воспринимается как ценность (ответственность, скорость, системность, креатив и т.д.).', is_active = 1, priority = 140, meta_json = '{}'
WHERE key = 'natal.angle.mc.sign.scorpio' AND locale = 'ru-RU' AND topic_category = 'career';

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.angle.mc.sign.scorpio', 'career', 'ru-RU', 'MC в «Скорпион» описывает, как вы хотите выглядеть в профессии и за счёт чего растёт статус. Вектор здесь — не «одна профессия», а стиль реализации: как вы ставите цели, как держите темп и как закрепляете репутацию. Практика: выбирайте роли, где ваш «Скорпион»-стиль воспринимается как ценность (ответственность, скорость, системность, креатив и т.д.).', 140, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.angle.mc.sign.scorpio' AND locale = 'ru-RU' AND topic_category = 'career'
);

UPDATE knowledge_items
SET text = 'MC в «Стрелец» описывает, как вы хотите выглядеть в профессии и за счёт чего растёт статус. Вектор здесь — не «одна профессия», а стиль реализации: как вы ставите цели, как держите темп и как закрепляете репутацию. Практика: выбирайте роли, где ваш «Стрелец»-стиль воспринимается как ценность (ответственность, скорость, системность, креатив и т.д.).', is_active = 1, priority = 140, meta_json = '{}'
WHERE key = 'natal.angle.mc.sign.sagittarius' AND locale = 'ru-RU' AND topic_category = 'career';

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.angle.mc.sign.sagittarius', 'career', 'ru-RU', 'MC в «Стрелец» описывает, как вы хотите выглядеть в профессии и за счёт чего растёт статус. Вектор здесь — не «одна профессия», а стиль реализации: как вы ставите цели, как держите темп и как закрепляете репутацию. Практика: выбирайте роли, где ваш «Стрелец»-стиль воспринимается как ценность (ответственность, скорость, системность, креатив и т.д.).', 140, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.angle.mc.sign.sagittarius' AND locale = 'ru-RU' AND topic_category = 'career'
);

UPDATE knowledge_items
SET text = 'MC в «Козерог» описывает, как вы хотите выглядеть в профессии и за счёт чего растёт статус. Вектор здесь — не «одна профессия», а стиль реализации: как вы ставите цели, как держите темп и как закрепляете репутацию. Практика: выбирайте роли, где ваш «Козерог»-стиль воспринимается как ценность (ответственность, скорость, системность, креатив и т.д.).', is_active = 1, priority = 140, meta_json = '{}'
WHERE key = 'natal.angle.mc.sign.capricorn' AND locale = 'ru-RU' AND topic_category = 'career';

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.angle.mc.sign.capricorn', 'career', 'ru-RU', 'MC в «Козерог» описывает, как вы хотите выглядеть в профессии и за счёт чего растёт статус. Вектор здесь — не «одна профессия», а стиль реализации: как вы ставите цели, как держите темп и как закрепляете репутацию. Практика: выбирайте роли, где ваш «Козерог»-стиль воспринимается как ценность (ответственность, скорость, системность, креатив и т.д.).', 140, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.angle.mc.sign.capricorn' AND locale = 'ru-RU' AND topic_category = 'career'
);

UPDATE knowledge_items
SET text = 'MC в «Водолей» описывает, как вы хотите выглядеть в профессии и за счёт чего растёт статус. Вектор здесь — не «одна профессия», а стиль реализации: как вы ставите цели, как держите темп и как закрепляете репутацию. Практика: выбирайте роли, где ваш «Водолей»-стиль воспринимается как ценность (ответственность, скорость, системность, креатив и т.д.).', is_active = 1, priority = 140, meta_json = '{}'
WHERE key = 'natal.angle.mc.sign.aquarius' AND locale = 'ru-RU' AND topic_category = 'career';

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.angle.mc.sign.aquarius', 'career', 'ru-RU', 'MC в «Водолей» описывает, как вы хотите выглядеть в профессии и за счёт чего растёт статус. Вектор здесь — не «одна профессия», а стиль реализации: как вы ставите цели, как держите темп и как закрепляете репутацию. Практика: выбирайте роли, где ваш «Водолей»-стиль воспринимается как ценность (ответственность, скорость, системность, креатив и т.д.).', 140, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.angle.mc.sign.aquarius' AND locale = 'ru-RU' AND topic_category = 'career'
);

UPDATE knowledge_items
SET text = 'MC в «Рыбы» описывает, как вы хотите выглядеть в профессии и за счёт чего растёт статус. Вектор здесь — не «одна профессия», а стиль реализации: как вы ставите цели, как держите темп и как закрепляете репутацию. Практика: выбирайте роли, где ваш «Рыбы»-стиль воспринимается как ценность (ответственность, скорость, системность, креатив и т.д.).', is_active = 1, priority = 140, meta_json = '{}'
WHERE key = 'natal.angle.mc.sign.pisces' AND locale = 'ru-RU' AND topic_category = 'career';

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.angle.mc.sign.pisces', 'career', 'ru-RU', 'MC в «Рыбы» описывает, как вы хотите выглядеть в профессии и за счёт чего растёт статус. Вектор здесь — не «одна профессия», а стиль реализации: как вы ставите цели, как держите темп и как закрепляете репутацию. Практика: выбирайте роли, где ваш «Рыбы»-стиль воспринимается как ценность (ответственность, скорость, системность, креатив и т.д.).', 140, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.angle.mc.sign.pisces' AND locale = 'ru-RU' AND topic_category = 'career'
);

UPDATE knowledge_items
SET text = 'Куспид 10-го дома по знаку (любой) — это стиль карьерной цели: какие правила игры вам подходят, какой тип ответственности вы готовы держать и что считаете «достижением».', is_active = 1, priority = 140, meta_json = '{}'
WHERE key = 'natal.house.10.cusp.sign.any' AND locale = 'ru-RU' AND topic_category = 'career';

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.10.cusp.sign.any', 'career', 'ru-RU', 'Куспид 10-го дома по знаку (любой) — это стиль карьерной цели: какие правила игры вам подходят, какой тип ответственности вы готовы держать и что считаете «достижением».', 140, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.10.cusp.sign.any' AND locale = 'ru-RU' AND topic_category = 'career'
);

UPDATE knowledge_items
SET text = 'Куспид 10-го дома в «Овен» показывает, каким способом вы строите карьеру и закрепляете статус. Это «обёртка» цели: через какие задачи и роли легче всего получать признание. Уточняйте через планеты в 10-м доме и управителя 10-го — они дадут конкретную стратегию.', is_active = 1, priority = 140, meta_json = '{}'
WHERE key = 'natal.house.10.cusp.sign.aries' AND locale = 'ru-RU' AND topic_category = 'career';

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.10.cusp.sign.aries', 'career', 'ru-RU', 'Куспид 10-го дома в «Овен» показывает, каким способом вы строите карьеру и закрепляете статус. Это «обёртка» цели: через какие задачи и роли легче всего получать признание. Уточняйте через планеты в 10-м доме и управителя 10-го — они дадут конкретную стратегию.', 140, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.10.cusp.sign.aries' AND locale = 'ru-RU' AND topic_category = 'career'
);

UPDATE knowledge_items
SET text = 'Куспид 10-го дома в «Телец» показывает, каким способом вы строите карьеру и закрепляете статус. Это «обёртка» цели: через какие задачи и роли легче всего получать признание. Уточняйте через планеты в 10-м доме и управителя 10-го — они дадут конкретную стратегию.', is_active = 1, priority = 140, meta_json = '{}'
WHERE key = 'natal.house.10.cusp.sign.taurus' AND locale = 'ru-RU' AND topic_category = 'career';

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.10.cusp.sign.taurus', 'career', 'ru-RU', 'Куспид 10-го дома в «Телец» показывает, каким способом вы строите карьеру и закрепляете статус. Это «обёртка» цели: через какие задачи и роли легче всего получать признание. Уточняйте через планеты в 10-м доме и управителя 10-го — они дадут конкретную стратегию.', 140, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.10.cusp.sign.taurus' AND locale = 'ru-RU' AND topic_category = 'career'
);

UPDATE knowledge_items
SET text = 'Куспид 10-го дома в «Близнецы» показывает, каким способом вы строите карьеру и закрепляете статус. Это «обёртка» цели: через какие задачи и роли легче всего получать признание. Уточняйте через планеты в 10-м доме и управителя 10-го — они дадут конкретную стратегию.', is_active = 1, priority = 140, meta_json = '{}'
WHERE key = 'natal.house.10.cusp.sign.gemini' AND locale = 'ru-RU' AND topic_category = 'career';

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.10.cusp.sign.gemini', 'career', 'ru-RU', 'Куспид 10-го дома в «Близнецы» показывает, каким способом вы строите карьеру и закрепляете статус. Это «обёртка» цели: через какие задачи и роли легче всего получать признание. Уточняйте через планеты в 10-м доме и управителя 10-го — они дадут конкретную стратегию.', 140, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.10.cusp.sign.gemini' AND locale = 'ru-RU' AND topic_category = 'career'
);

UPDATE knowledge_items
SET text = 'Куспид 10-го дома в «Рак» показывает, каким способом вы строите карьеру и закрепляете статус. Это «обёртка» цели: через какие задачи и роли легче всего получать признание. Уточняйте через планеты в 10-м доме и управителя 10-го — они дадут конкретную стратегию.', is_active = 1, priority = 140, meta_json = '{}'
WHERE key = 'natal.house.10.cusp.sign.cancer' AND locale = 'ru-RU' AND topic_category = 'career';

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.10.cusp.sign.cancer', 'career', 'ru-RU', 'Куспид 10-го дома в «Рак» показывает, каким способом вы строите карьеру и закрепляете статус. Это «обёртка» цели: через какие задачи и роли легче всего получать признание. Уточняйте через планеты в 10-м доме и управителя 10-го — они дадут конкретную стратегию.', 140, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.10.cusp.sign.cancer' AND locale = 'ru-RU' AND topic_category = 'career'
);

UPDATE knowledge_items
SET text = 'Куспид 10-го дома в «Лев» показывает, каким способом вы строите карьеру и закрепляете статус. Это «обёртка» цели: через какие задачи и роли легче всего получать признание. Уточняйте через планеты в 10-м доме и управителя 10-го — они дадут конкретную стратегию.', is_active = 1, priority = 140, meta_json = '{}'
WHERE key = 'natal.house.10.cusp.sign.leo' AND locale = 'ru-RU' AND topic_category = 'career';

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.10.cusp.sign.leo', 'career', 'ru-RU', 'Куспид 10-го дома в «Лев» показывает, каким способом вы строите карьеру и закрепляете статус. Это «обёртка» цели: через какие задачи и роли легче всего получать признание. Уточняйте через планеты в 10-м доме и управителя 10-го — они дадут конкретную стратегию.', 140, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.10.cusp.sign.leo' AND locale = 'ru-RU' AND topic_category = 'career'
);

UPDATE knowledge_items
SET text = 'Куспид 10-го дома в «Дева» показывает, каким способом вы строите карьеру и закрепляете статус. Это «обёртка» цели: через какие задачи и роли легче всего получать признание. Уточняйте через планеты в 10-м доме и управителя 10-го — они дадут конкретную стратегию.', is_active = 1, priority = 140, meta_json = '{}'
WHERE key = 'natal.house.10.cusp.sign.virgo' AND locale = 'ru-RU' AND topic_category = 'career';

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.10.cusp.sign.virgo', 'career', 'ru-RU', 'Куспид 10-го дома в «Дева» показывает, каким способом вы строите карьеру и закрепляете статус. Это «обёртка» цели: через какие задачи и роли легче всего получать признание. Уточняйте через планеты в 10-м доме и управителя 10-го — они дадут конкретную стратегию.', 140, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.10.cusp.sign.virgo' AND locale = 'ru-RU' AND topic_category = 'career'
);

UPDATE knowledge_items
SET text = 'Куспид 10-го дома в «Весы» показывает, каким способом вы строите карьеру и закрепляете статус. Это «обёртка» цели: через какие задачи и роли легче всего получать признание. Уточняйте через планеты в 10-м доме и управителя 10-го — они дадут конкретную стратегию.', is_active = 1, priority = 140, meta_json = '{}'
WHERE key = 'natal.house.10.cusp.sign.libra' AND locale = 'ru-RU' AND topic_category = 'career';

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.10.cusp.sign.libra', 'career', 'ru-RU', 'Куспид 10-го дома в «Весы» показывает, каким способом вы строите карьеру и закрепляете статус. Это «обёртка» цели: через какие задачи и роли легче всего получать признание. Уточняйте через планеты в 10-м доме и управителя 10-го — они дадут конкретную стратегию.', 140, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.10.cusp.sign.libra' AND locale = 'ru-RU' AND topic_category = 'career'
);

UPDATE knowledge_items
SET text = 'Куспид 10-го дома в «Скорпион» показывает, каким способом вы строите карьеру и закрепляете статус. Это «обёртка» цели: через какие задачи и роли легче всего получать признание. Уточняйте через планеты в 10-м доме и управителя 10-го — они дадут конкретную стратегию.', is_active = 1, priority = 140, meta_json = '{}'
WHERE key = 'natal.house.10.cusp.sign.scorpio' AND locale = 'ru-RU' AND topic_category = 'career';

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.10.cusp.sign.scorpio', 'career', 'ru-RU', 'Куспид 10-го дома в «Скорпион» показывает, каким способом вы строите карьеру и закрепляете статус. Это «обёртка» цели: через какие задачи и роли легче всего получать признание. Уточняйте через планеты в 10-м доме и управителя 10-го — они дадут конкретную стратегию.', 140, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.10.cusp.sign.scorpio' AND locale = 'ru-RU' AND topic_category = 'career'
);

UPDATE knowledge_items
SET text = 'Куспид 10-го дома в «Стрелец» показывает, каким способом вы строите карьеру и закрепляете статус. Это «обёртка» цели: через какие задачи и роли легче всего получать признание. Уточняйте через планеты в 10-м доме и управителя 10-го — они дадут конкретную стратегию.', is_active = 1, priority = 140, meta_json = '{}'
WHERE key = 'natal.house.10.cusp.sign.sagittarius' AND locale = 'ru-RU' AND topic_category = 'career';

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.10.cusp.sign.sagittarius', 'career', 'ru-RU', 'Куспид 10-го дома в «Стрелец» показывает, каким способом вы строите карьеру и закрепляете статус. Это «обёртка» цели: через какие задачи и роли легче всего получать признание. Уточняйте через планеты в 10-м доме и управителя 10-го — они дадут конкретную стратегию.', 140, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.10.cusp.sign.sagittarius' AND locale = 'ru-RU' AND topic_category = 'career'
);

UPDATE knowledge_items
SET text = 'Куспид 10-го дома в «Козерог» показывает, каким способом вы строите карьеру и закрепляете статус. Это «обёртка» цели: через какие задачи и роли легче всего получать признание. Уточняйте через планеты в 10-м доме и управителя 10-го — они дадут конкретную стратегию.', is_active = 1, priority = 140, meta_json = '{}'
WHERE key = 'natal.house.10.cusp.sign.capricorn' AND locale = 'ru-RU' AND topic_category = 'career';

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.10.cusp.sign.capricorn', 'career', 'ru-RU', 'Куспид 10-го дома в «Козерог» показывает, каким способом вы строите карьеру и закрепляете статус. Это «обёртка» цели: через какие задачи и роли легче всего получать признание. Уточняйте через планеты в 10-м доме и управителя 10-го — они дадут конкретную стратегию.', 140, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.10.cusp.sign.capricorn' AND locale = 'ru-RU' AND topic_category = 'career'
);

UPDATE knowledge_items
SET text = 'Куспид 10-го дома в «Водолей» показывает, каким способом вы строите карьеру и закрепляете статус. Это «обёртка» цели: через какие задачи и роли легче всего получать признание. Уточняйте через планеты в 10-м доме и управителя 10-го — они дадут конкретную стратегию.', is_active = 1, priority = 140, meta_json = '{}'
WHERE key = 'natal.house.10.cusp.sign.aquarius' AND locale = 'ru-RU' AND topic_category = 'career';

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.10.cusp.sign.aquarius', 'career', 'ru-RU', 'Куспид 10-го дома в «Водолей» показывает, каким способом вы строите карьеру и закрепляете статус. Это «обёртка» цели: через какие задачи и роли легче всего получать признание. Уточняйте через планеты в 10-м доме и управителя 10-го — они дадут конкретную стратегию.', 140, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.10.cusp.sign.aquarius' AND locale = 'ru-RU' AND topic_category = 'career'
);

UPDATE knowledge_items
SET text = 'Куспид 10-го дома в «Рыбы» показывает, каким способом вы строите карьеру и закрепляете статус. Это «обёртка» цели: через какие задачи и роли легче всего получать признание. Уточняйте через планеты в 10-м доме и управителя 10-го — они дадут конкретную стратегию.', is_active = 1, priority = 140, meta_json = '{}'
WHERE key = 'natal.house.10.cusp.sign.pisces' AND locale = 'ru-RU' AND topic_category = 'career';

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.10.cusp.sign.pisces', 'career', 'ru-RU', 'Куспид 10-го дома в «Рыбы» показывает, каким способом вы строите карьеру и закрепляете статус. Это «обёртка» цели: через какие задачи и роли легче всего получать признание. Уточняйте через планеты в 10-м доме и управителя 10-го — они дадут конкретную стратегию.', 140, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.10.cusp.sign.pisces' AND locale = 'ru-RU' AND topic_category = 'career'
);

UPDATE knowledge_items
SET text = 'Солнце в 10-м доме делает эту функцию заметной в профессии: вас считывают через качества Солнце. В плюсе — это сильный рычаг влияния и рост статуса; в минусе — риск перегибов, если делать ставку только на одну роль. Баланс: развивайте навыки, которые соответствуют планете, и держите режим, чтобы не выгорать.', is_active = 1, priority = 140, meta_json = '{}'
WHERE key = 'natal.house.10.planet.sun' AND locale = 'ru-RU' AND topic_category = 'career';

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.10.planet.sun', 'career', 'ru-RU', 'Солнце в 10-м доме делает эту функцию заметной в профессии: вас считывают через качества Солнце. В плюсе — это сильный рычаг влияния и рост статуса; в минусе — риск перегибов, если делать ставку только на одну роль. Баланс: развивайте навыки, которые соответствуют планете, и держите режим, чтобы не выгорать.', 140, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.10.planet.sun' AND locale = 'ru-RU' AND topic_category = 'career'
);

UPDATE knowledge_items
SET text = 'Луна в 10-м доме делает эту функцию заметной в профессии: вас считывают через качества Луна. В плюсе — это сильный рычаг влияния и рост статуса; в минусе — риск перегибов, если делать ставку только на одну роль. Баланс: развивайте навыки, которые соответствуют планете, и держите режим, чтобы не выгорать.', is_active = 1, priority = 140, meta_json = '{}'
WHERE key = 'natal.house.10.planet.moon' AND locale = 'ru-RU' AND topic_category = 'career';

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.10.planet.moon', 'career', 'ru-RU', 'Луна в 10-м доме делает эту функцию заметной в профессии: вас считывают через качества Луна. В плюсе — это сильный рычаг влияния и рост статуса; в минусе — риск перегибов, если делать ставку только на одну роль. Баланс: развивайте навыки, которые соответствуют планете, и держите режим, чтобы не выгорать.', 140, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.10.planet.moon' AND locale = 'ru-RU' AND topic_category = 'career'
);

UPDATE knowledge_items
SET text = 'Меркурий в 10-м доме делает эту функцию заметной в профессии: вас считывают через качества Меркурий. В плюсе — это сильный рычаг влияния и рост статуса; в минусе — риск перегибов, если делать ставку только на одну роль. Баланс: развивайте навыки, которые соответствуют планете, и держите режим, чтобы не выгорать.', is_active = 1, priority = 140, meta_json = '{}'
WHERE key = 'natal.house.10.planet.mercury' AND locale = 'ru-RU' AND topic_category = 'career';

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.10.planet.mercury', 'career', 'ru-RU', 'Меркурий в 10-м доме делает эту функцию заметной в профессии: вас считывают через качества Меркурий. В плюсе — это сильный рычаг влияния и рост статуса; в минусе — риск перегибов, если делать ставку только на одну роль. Баланс: развивайте навыки, которые соответствуют планете, и держите режим, чтобы не выгорать.', 140, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.10.planet.mercury' AND locale = 'ru-RU' AND topic_category = 'career'
);

UPDATE knowledge_items
SET text = 'Венера в 10-м доме делает эту функцию заметной в профессии: вас считывают через качества Венера. В плюсе — это сильный рычаг влияния и рост статуса; в минусе — риск перегибов, если делать ставку только на одну роль. Баланс: развивайте навыки, которые соответствуют планете, и держите режим, чтобы не выгорать.', is_active = 1, priority = 140, meta_json = '{}'
WHERE key = 'natal.house.10.planet.venus' AND locale = 'ru-RU' AND topic_category = 'career';

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.10.planet.venus', 'career', 'ru-RU', 'Венера в 10-м доме делает эту функцию заметной в профессии: вас считывают через качества Венера. В плюсе — это сильный рычаг влияния и рост статуса; в минусе — риск перегибов, если делать ставку только на одну роль. Баланс: развивайте навыки, которые соответствуют планете, и держите режим, чтобы не выгорать.', 140, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.10.planet.venus' AND locale = 'ru-RU' AND topic_category = 'career'
);

UPDATE knowledge_items
SET text = 'Марс в 10-м доме делает эту функцию заметной в профессии: вас считывают через качества Марс. В плюсе — это сильный рычаг влияния и рост статуса; в минусе — риск перегибов, если делать ставку только на одну роль. Баланс: развивайте навыки, которые соответствуют планете, и держите режим, чтобы не выгорать.', is_active = 1, priority = 140, meta_json = '{}'
WHERE key = 'natal.house.10.planet.mars' AND locale = 'ru-RU' AND topic_category = 'career';

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.10.planet.mars', 'career', 'ru-RU', 'Марс в 10-м доме делает эту функцию заметной в профессии: вас считывают через качества Марс. В плюсе — это сильный рычаг влияния и рост статуса; в минусе — риск перегибов, если делать ставку только на одну роль. Баланс: развивайте навыки, которые соответствуют планете, и держите режим, чтобы не выгорать.', 140, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.10.planet.mars' AND locale = 'ru-RU' AND topic_category = 'career'
);

UPDATE knowledge_items
SET text = 'Юпитер в 10-м доме делает эту функцию заметной в профессии: вас считывают через качества Юпитер. В плюсе — это сильный рычаг влияния и рост статуса; в минусе — риск перегибов, если делать ставку только на одну роль. Баланс: развивайте навыки, которые соответствуют планете, и держите режим, чтобы не выгорать.', is_active = 1, priority = 140, meta_json = '{}'
WHERE key = 'natal.house.10.planet.jupiter' AND locale = 'ru-RU' AND topic_category = 'career';

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.10.planet.jupiter', 'career', 'ru-RU', 'Юпитер в 10-м доме делает эту функцию заметной в профессии: вас считывают через качества Юпитер. В плюсе — это сильный рычаг влияния и рост статуса; в минусе — риск перегибов, если делать ставку только на одну роль. Баланс: развивайте навыки, которые соответствуют планете, и держите режим, чтобы не выгорать.', 140, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.10.planet.jupiter' AND locale = 'ru-RU' AND topic_category = 'career'
);

UPDATE knowledge_items
SET text = 'Сатурн в 10-м доме делает эту функцию заметной в профессии: вас считывают через качества Сатурн. В плюсе — это сильный рычаг влияния и рост статуса; в минусе — риск перегибов, если делать ставку только на одну роль. Баланс: развивайте навыки, которые соответствуют планете, и держите режим, чтобы не выгорать.', is_active = 1, priority = 140, meta_json = '{}'
WHERE key = 'natal.house.10.planet.saturn' AND locale = 'ru-RU' AND topic_category = 'career';

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.10.planet.saturn', 'career', 'ru-RU', 'Сатурн в 10-м доме делает эту функцию заметной в профессии: вас считывают через качества Сатурн. В плюсе — это сильный рычаг влияния и рост статуса; в минусе — риск перегибов, если делать ставку только на одну роль. Баланс: развивайте навыки, которые соответствуют планете, и держите режим, чтобы не выгорать.', 140, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.10.planet.saturn' AND locale = 'ru-RU' AND topic_category = 'career'
);

UPDATE knowledge_items
SET text = 'Уран в 10-м доме делает эту функцию заметной в профессии: вас считывают через качества Уран. В плюсе — это сильный рычаг влияния и рост статуса; в минусе — риск перегибов, если делать ставку только на одну роль. Баланс: развивайте навыки, которые соответствуют планете, и держите режим, чтобы не выгорать.', is_active = 1, priority = 140, meta_json = '{}'
WHERE key = 'natal.house.10.planet.uranus' AND locale = 'ru-RU' AND topic_category = 'career';

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.10.planet.uranus', 'career', 'ru-RU', 'Уран в 10-м доме делает эту функцию заметной в профессии: вас считывают через качества Уран. В плюсе — это сильный рычаг влияния и рост статуса; в минусе — риск перегибов, если делать ставку только на одну роль. Баланс: развивайте навыки, которые соответствуют планете, и держите режим, чтобы не выгорать.', 140, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.10.planet.uranus' AND locale = 'ru-RU' AND topic_category = 'career'
);

UPDATE knowledge_items
SET text = 'Нептун в 10-м доме делает эту функцию заметной в профессии: вас считывают через качества Нептун. В плюсе — это сильный рычаг влияния и рост статуса; в минусе — риск перегибов, если делать ставку только на одну роль. Баланс: развивайте навыки, которые соответствуют планете, и держите режим, чтобы не выгорать.', is_active = 1, priority = 140, meta_json = '{}'
WHERE key = 'natal.house.10.planet.neptune' AND locale = 'ru-RU' AND topic_category = 'career';

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.10.planet.neptune', 'career', 'ru-RU', 'Нептун в 10-м доме делает эту функцию заметной в профессии: вас считывают через качества Нептун. В плюсе — это сильный рычаг влияния и рост статуса; в минусе — риск перегибов, если делать ставку только на одну роль. Баланс: развивайте навыки, которые соответствуют планете, и держите режим, чтобы не выгорать.', 140, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.10.planet.neptune' AND locale = 'ru-RU' AND topic_category = 'career'
);

UPDATE knowledge_items
SET text = 'Плутон в 10-м доме делает эту функцию заметной в профессии: вас считывают через качества Плутон. В плюсе — это сильный рычаг влияния и рост статуса; в минусе — риск перегибов, если делать ставку только на одну роль. Баланс: развивайте навыки, которые соответствуют планете, и держите режим, чтобы не выгорать.', is_active = 1, priority = 140, meta_json = '{}'
WHERE key = 'natal.house.10.planet.pluto' AND locale = 'ru-RU' AND topic_category = 'career';

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.10.planet.pluto', 'career', 'ru-RU', 'Плутон в 10-м доме делает эту функцию заметной в профессии: вас считывают через качества Плутон. В плюсе — это сильный рычаг влияния и рост статуса; в минусе — риск перегибов, если делать ставку только на одну роль. Баланс: развивайте навыки, которые соответствуют планете, и держите режим, чтобы не выгорать.', 140, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.10.planet.pluto' AND locale = 'ru-RU' AND topic_category = 'career'
);

UPDATE knowledge_items
SET text = 'Управитель 10-го дома — «двигатель карьеры»: он показывает, через какие действия и навыки строится статус. Знак управителя = стиль решений; дом управителя = площадка, где карьера «собирается» в результат; аспекты = где легко/где нужен план.', is_active = 1, priority = 140, meta_json = '{}'
WHERE key = 'natal.house.10.ruler.any' AND locale = 'ru-RU' AND topic_category = 'career';

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.10.ruler.any', 'career', 'ru-RU', 'Управитель 10-го дома — «двигатель карьеры»: он показывает, через какие действия и навыки строится статус. Знак управителя = стиль решений; дом управителя = площадка, где карьера «собирается» в результат; аспекты = где легко/где нужен план.', 140, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.10.ruler.any' AND locale = 'ru-RU' AND topic_category = 'career'
);

UPDATE knowledge_items
SET text = 'Когда управитель 10-го дома — Солнце, карьера растёт через качества Солнце: то, как вы принимаете решения, действуете и создаёте результат. Смотрите знак/дом управителя и аспекты: они подскажут, где усиливать навык и где ставить границы.', is_active = 1, priority = 140, meta_json = '{}'
WHERE key = 'natal.house.10.ruler.sun' AND locale = 'ru-RU' AND topic_category = 'career';

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.10.ruler.sun', 'career', 'ru-RU', 'Когда управитель 10-го дома — Солнце, карьера растёт через качества Солнце: то, как вы принимаете решения, действуете и создаёте результат. Смотрите знак/дом управителя и аспекты: они подскажут, где усиливать навык и где ставить границы.', 140, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.10.ruler.sun' AND locale = 'ru-RU' AND topic_category = 'career'
);

UPDATE knowledge_items
SET text = 'Управитель 10-го дома по знаку (любой): стиль реализации и манера решений. Это ваш «профессиональный почерк» — как вы действуете, чтобы расти.', is_active = 1, priority = 140, meta_json = '{}'
WHERE key = 'natal.house.10.ruler.sun.sign.any' AND locale = 'ru-RU' AND topic_category = 'career';

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.10.ruler.sun.sign.any', 'career', 'ru-RU', 'Управитель 10-го дома по знаку (любой): стиль реализации и манера решений. Это ваш «профессиональный почерк» — как вы действуете, чтобы расти.', 140, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.10.ruler.sun.sign.any' AND locale = 'ru-RU' AND topic_category = 'career'
);

UPDATE knowledge_items
SET text = 'Управитель 10-го дома по дому (любой): куда уходит энергия карьеры. Дом показывает сферу жизни/задач, через которую проще собирать статус и признание.', is_active = 1, priority = 140, meta_json = '{}'
WHERE key = 'natal.house.10.ruler.sun.house.any' AND locale = 'ru-RU' AND topic_category = 'career';

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.10.ruler.sun.house.any', 'career', 'ru-RU', 'Управитель 10-го дома по дому (любой): куда уходит энергия карьеры. Дом показывает сферу жизни/задач, через которую проще собирать статус и признание.', 140, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.10.ruler.sun.house.any' AND locale = 'ru-RU' AND topic_category = 'career'
);

UPDATE knowledge_items
SET text = 'Управитель 10-го дома: знак + дом (любой) — практическая сборка карьеры. Знак даёт стиль, дом — площадку, а вместе они показывают стратегию, которая повторяемо даёт результат.', is_active = 1, priority = 140, meta_json = '{}'
WHERE key = 'natal.house.10.ruler.sun.sign.any.house.any' AND locale = 'ru-RU' AND topic_category = 'career';

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.10.ruler.sun.sign.any.house.any', 'career', 'ru-RU', 'Управитель 10-го дома: знак + дом (любой) — практическая сборка карьеры. Знак даёт стиль, дом — площадку, а вместе они показывают стратегию, которая повторяемо даёт результат.', 140, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.10.ruler.sun.sign.any.house.any' AND locale = 'ru-RU' AND topic_category = 'career'
);

UPDATE knowledge_items
SET text = 'Аспекты управителя 10-го дома описывают динамику карьеры: где идёт ускорение, где — сопротивление, и через какие навыки вы становитесь устойчивее. Смотрите повторяющиеся темы: власть/границы, публичность, коммуникации, риск, обучение.', is_active = 1, priority = 140, meta_json = '{}'
WHERE key = 'natal.house.10.ruler.sun.aspect.any.any' AND locale = 'ru-RU' AND topic_category = 'career';

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.10.ruler.sun.aspect.any.any', 'career', 'ru-RU', 'Аспекты управителя 10-го дома описывают динамику карьеры: где идёт ускорение, где — сопротивление, и через какие навыки вы становитесь устойчивее. Смотрите повторяющиеся темы: власть/границы, публичность, коммуникации, риск, обучение.', 140, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.10.ruler.sun.aspect.any.any' AND locale = 'ru-RU' AND topic_category = 'career'
);

UPDATE knowledge_items
SET text = 'Hard-aspects у управителя 10-го дома означают узлы напряжения в карьерной траектории. Это не «плохо», а требование к стратегии: границы, режим, приоритеты, ясные договорённости и измеримые этапы роста.', is_active = 1, priority = 140, meta_json = '{}'
WHERE key = 'natal.house.10.ruler.sun.aspect.hard.present' AND locale = 'ru-RU' AND topic_category = 'career';

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.10.ruler.sun.aspect.hard.present', 'career', 'ru-RU', 'Hard-aspects у управителя 10-го дома означают узлы напряжения в карьерной траектории. Это не «плохо», а требование к стратегии: границы, режим, приоритеты, ясные договорённости и измеримые этапы роста.', 140, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.10.ruler.sun.aspect.hard.present' AND locale = 'ru-RU' AND topic_category = 'career'
);

UPDATE knowledge_items
SET text = 'Напряжённые аспекты управителя 10-го дома дают рост через вызовы: конкуренцию, дедлайны, давление ожиданий. Рабочая стратегия: план, дисциплина, границы и переговоры.', is_active = 1, priority = 140, meta_json = '{}'
WHERE key = 'natal.house.10.ruler.sun.aspect.class.tense' AND locale = 'ru-RU' AND topic_category = 'career';

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.10.ruler.sun.aspect.class.tense', 'career', 'ru-RU', 'Напряжённые аспекты управителя 10-го дома дают рост через вызовы: конкуренцию, дедлайны, давление ожиданий. Рабочая стратегия: план, дисциплина, границы и переговоры.', 140, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.10.ruler.sun.aspect.class.tense' AND locale = 'ru-RU' AND topic_category = 'career'
);

UPDATE knowledge_items
SET text = 'Гармоничные аспекты управителя 10-го дома дают поддержку: легче находить союзников и развивать компетенции. Главное — закреплять успех практикой и системностью.', is_active = 1, priority = 140, meta_json = '{}'
WHERE key = 'natal.house.10.ruler.sun.aspect.class.harmonic' AND locale = 'ru-RU' AND topic_category = 'career';

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.10.ruler.sun.aspect.class.harmonic', 'career', 'ru-RU', 'Гармоничные аспекты управителя 10-го дома дают поддержку: легче находить союзников и развивать компетенции. Главное — закреплять успех практикой и системностью.', 140, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.10.ruler.sun.aspect.class.harmonic' AND locale = 'ru-RU' AND topic_category = 'career'
);

UPDATE knowledge_items
SET text = 'Аспект управителя 10-го дома к MC усиливает заметность и связывает личные решения с публичной ролью. Нужна ясная цель.', is_active = 1, priority = 140, meta_json = '{}'
WHERE key = 'natal.house.10.ruler.sun.aspect.any.with.angle.mc' AND locale = 'ru-RU' AND topic_category = 'career';

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.10.ruler.sun.aspect.any.with.angle.mc', 'career', 'ru-RU', 'Аспект управителя 10-го дома к MC усиливает заметность и связывает личные решения с публичной ролью. Нужна ясная цель.', 140, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.10.ruler.sun.aspect.any.with.angle.mc' AND locale = 'ru-RU' AND topic_category = 'career'
);

UPDATE knowledge_items
SET text = 'Аспект управителя 10-го дома к ASC связывает карьеру с личным образом: важно управлять впечатлением и стилем самопрезентации.', is_active = 1, priority = 140, meta_json = '{}'
WHERE key = 'natal.house.10.ruler.sun.aspect.any.with.angle.asc' AND locale = 'ru-RU' AND topic_category = 'career';

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.10.ruler.sun.aspect.any.with.angle.asc', 'career', 'ru-RU', 'Аспект управителя 10-го дома к ASC связывает карьеру с личным образом: важно управлять впечатлением и стилем самопрезентации.', 140, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.10.ruler.sun.aspect.any.with.angle.asc' AND locale = 'ru-RU' AND topic_category = 'career'
);

UPDATE knowledge_items
SET text = 'Аспект управителя 10-го дома к IC связывает карьеру с домом/опорой: баланс приватного и публичного — ключ к устойчивости.', is_active = 1, priority = 140, meta_json = '{}'
WHERE key = 'natal.house.10.ruler.sun.aspect.any.with.angle.ic' AND locale = 'ru-RU' AND topic_category = 'career';

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.10.ruler.sun.aspect.any.with.angle.ic', 'career', 'ru-RU', 'Аспект управителя 10-го дома к IC связывает карьеру с домом/опорой: баланс приватного и публичного — ключ к устойчивости.', 140, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.10.ruler.sun.aspect.any.with.angle.ic' AND locale = 'ru-RU' AND topic_category = 'career'
);

UPDATE knowledge_items
SET text = 'Аспект управителя 10-го дома к DSC связывает успех с партнёрствами и клиентами: важны договорённости и качество отношений.', is_active = 1, priority = 140, meta_json = '{}'
WHERE key = 'natal.house.10.ruler.sun.aspect.any.with.angle.dsc' AND locale = 'ru-RU' AND topic_category = 'career';

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.10.ruler.sun.aspect.any.with.angle.dsc', 'career', 'ru-RU', 'Аспект управителя 10-го дома к DSC связывает успех с партнёрствами и клиентами: важны договорённости и качество отношений.', 140, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.10.ruler.sun.aspect.any.with.angle.dsc' AND locale = 'ru-RU' AND topic_category = 'career'
);

UPDATE knowledge_items
SET text = 'Когда управитель 10-го дома — Луна, карьера растёт через качества Луна: то, как вы принимаете решения, действуете и создаёте результат. Смотрите знак/дом управителя и аспекты: они подскажут, где усиливать навык и где ставить границы.', is_active = 1, priority = 140, meta_json = '{}'
WHERE key = 'natal.house.10.ruler.moon' AND locale = 'ru-RU' AND topic_category = 'career';

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.10.ruler.moon', 'career', 'ru-RU', 'Когда управитель 10-го дома — Луна, карьера растёт через качества Луна: то, как вы принимаете решения, действуете и создаёте результат. Смотрите знак/дом управителя и аспекты: они подскажут, где усиливать навык и где ставить границы.', 140, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.10.ruler.moon' AND locale = 'ru-RU' AND topic_category = 'career'
);

UPDATE knowledge_items
SET text = 'Управитель 10-го дома по знаку (любой): стиль реализации и манера решений. Это ваш «профессиональный почерк» — как вы действуете, чтобы расти.', is_active = 1, priority = 140, meta_json = '{}'
WHERE key = 'natal.house.10.ruler.moon.sign.any' AND locale = 'ru-RU' AND topic_category = 'career';

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.10.ruler.moon.sign.any', 'career', 'ru-RU', 'Управитель 10-го дома по знаку (любой): стиль реализации и манера решений. Это ваш «профессиональный почерк» — как вы действуете, чтобы расти.', 140, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.10.ruler.moon.sign.any' AND locale = 'ru-RU' AND topic_category = 'career'
);

UPDATE knowledge_items
SET text = 'Управитель 10-го дома по дому (любой): куда уходит энергия карьеры. Дом показывает сферу жизни/задач, через которую проще собирать статус и признание.', is_active = 1, priority = 140, meta_json = '{}'
WHERE key = 'natal.house.10.ruler.moon.house.any' AND locale = 'ru-RU' AND topic_category = 'career';

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.10.ruler.moon.house.any', 'career', 'ru-RU', 'Управитель 10-го дома по дому (любой): куда уходит энергия карьеры. Дом показывает сферу жизни/задач, через которую проще собирать статус и признание.', 140, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.10.ruler.moon.house.any' AND locale = 'ru-RU' AND topic_category = 'career'
);

UPDATE knowledge_items
SET text = 'Управитель 10-го дома: знак + дом (любой) — практическая сборка карьеры. Знак даёт стиль, дом — площадку, а вместе они показывают стратегию, которая повторяемо даёт результат.', is_active = 1, priority = 140, meta_json = '{}'
WHERE key = 'natal.house.10.ruler.moon.sign.any.house.any' AND locale = 'ru-RU' AND topic_category = 'career';

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.10.ruler.moon.sign.any.house.any', 'career', 'ru-RU', 'Управитель 10-го дома: знак + дом (любой) — практическая сборка карьеры. Знак даёт стиль, дом — площадку, а вместе они показывают стратегию, которая повторяемо даёт результат.', 140, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.10.ruler.moon.sign.any.house.any' AND locale = 'ru-RU' AND topic_category = 'career'
);

UPDATE knowledge_items
SET text = 'Аспекты управителя 10-го дома описывают динамику карьеры: где идёт ускорение, где — сопротивление, и через какие навыки вы становитесь устойчивее. Смотрите повторяющиеся темы: власть/границы, публичность, коммуникации, риск, обучение.', is_active = 1, priority = 140, meta_json = '{}'
WHERE key = 'natal.house.10.ruler.moon.aspect.any.any' AND locale = 'ru-RU' AND topic_category = 'career';

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.10.ruler.moon.aspect.any.any', 'career', 'ru-RU', 'Аспекты управителя 10-го дома описывают динамику карьеры: где идёт ускорение, где — сопротивление, и через какие навыки вы становитесь устойчивее. Смотрите повторяющиеся темы: власть/границы, публичность, коммуникации, риск, обучение.', 140, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.10.ruler.moon.aspect.any.any' AND locale = 'ru-RU' AND topic_category = 'career'
);

UPDATE knowledge_items
SET text = 'Hard-aspects у управителя 10-го дома означают узлы напряжения в карьерной траектории. Это не «плохо», а требование к стратегии: границы, режим, приоритеты, ясные договорённости и измеримые этапы роста.', is_active = 1, priority = 140, meta_json = '{}'
WHERE key = 'natal.house.10.ruler.moon.aspect.hard.present' AND locale = 'ru-RU' AND topic_category = 'career';

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.10.ruler.moon.aspect.hard.present', 'career', 'ru-RU', 'Hard-aspects у управителя 10-го дома означают узлы напряжения в карьерной траектории. Это не «плохо», а требование к стратегии: границы, режим, приоритеты, ясные договорённости и измеримые этапы роста.', 140, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.10.ruler.moon.aspect.hard.present' AND locale = 'ru-RU' AND topic_category = 'career'
);

UPDATE knowledge_items
SET text = 'Напряжённые аспекты управителя 10-го дома дают рост через вызовы: конкуренцию, дедлайны, давление ожиданий. Рабочая стратегия: план, дисциплина, границы и переговоры.', is_active = 1, priority = 140, meta_json = '{}'
WHERE key = 'natal.house.10.ruler.moon.aspect.class.tense' AND locale = 'ru-RU' AND topic_category = 'career';

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.10.ruler.moon.aspect.class.tense', 'career', 'ru-RU', 'Напряжённые аспекты управителя 10-го дома дают рост через вызовы: конкуренцию, дедлайны, давление ожиданий. Рабочая стратегия: план, дисциплина, границы и переговоры.', 140, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.10.ruler.moon.aspect.class.tense' AND locale = 'ru-RU' AND topic_category = 'career'
);

UPDATE knowledge_items
SET text = 'Гармоничные аспекты управителя 10-го дома дают поддержку: легче находить союзников и развивать компетенции. Главное — закреплять успех практикой и системностью.', is_active = 1, priority = 140, meta_json = '{}'
WHERE key = 'natal.house.10.ruler.moon.aspect.class.harmonic' AND locale = 'ru-RU' AND topic_category = 'career';

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.10.ruler.moon.aspect.class.harmonic', 'career', 'ru-RU', 'Гармоничные аспекты управителя 10-го дома дают поддержку: легче находить союзников и развивать компетенции. Главное — закреплять успех практикой и системностью.', 140, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.10.ruler.moon.aspect.class.harmonic' AND locale = 'ru-RU' AND topic_category = 'career'
);

UPDATE knowledge_items
SET text = 'Аспект управителя 10-го дома к MC усиливает заметность и связывает личные решения с публичной ролью. Нужна ясная цель.', is_active = 1, priority = 140, meta_json = '{}'
WHERE key = 'natal.house.10.ruler.moon.aspect.any.with.angle.mc' AND locale = 'ru-RU' AND topic_category = 'career';

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.10.ruler.moon.aspect.any.with.angle.mc', 'career', 'ru-RU', 'Аспект управителя 10-го дома к MC усиливает заметность и связывает личные решения с публичной ролью. Нужна ясная цель.', 140, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.10.ruler.moon.aspect.any.with.angle.mc' AND locale = 'ru-RU' AND topic_category = 'career'
);

UPDATE knowledge_items
SET text = 'Аспект управителя 10-го дома к ASC связывает карьеру с личным образом: важно управлять впечатлением и стилем самопрезентации.', is_active = 1, priority = 140, meta_json = '{}'
WHERE key = 'natal.house.10.ruler.moon.aspect.any.with.angle.asc' AND locale = 'ru-RU' AND topic_category = 'career';

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.10.ruler.moon.aspect.any.with.angle.asc', 'career', 'ru-RU', 'Аспект управителя 10-го дома к ASC связывает карьеру с личным образом: важно управлять впечатлением и стилем самопрезентации.', 140, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.10.ruler.moon.aspect.any.with.angle.asc' AND locale = 'ru-RU' AND topic_category = 'career'
);

UPDATE knowledge_items
SET text = 'Аспект управителя 10-го дома к IC связывает карьеру с домом/опорой: баланс приватного и публичного — ключ к устойчивости.', is_active = 1, priority = 140, meta_json = '{}'
WHERE key = 'natal.house.10.ruler.moon.aspect.any.with.angle.ic' AND locale = 'ru-RU' AND topic_category = 'career';

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.10.ruler.moon.aspect.any.with.angle.ic', 'career', 'ru-RU', 'Аспект управителя 10-го дома к IC связывает карьеру с домом/опорой: баланс приватного и публичного — ключ к устойчивости.', 140, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.10.ruler.moon.aspect.any.with.angle.ic' AND locale = 'ru-RU' AND topic_category = 'career'
);

UPDATE knowledge_items
SET text = 'Аспект управителя 10-го дома к DSC связывает успех с партнёрствами и клиентами: важны договорённости и качество отношений.', is_active = 1, priority = 140, meta_json = '{}'
WHERE key = 'natal.house.10.ruler.moon.aspect.any.with.angle.dsc' AND locale = 'ru-RU' AND topic_category = 'career';

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.10.ruler.moon.aspect.any.with.angle.dsc', 'career', 'ru-RU', 'Аспект управителя 10-го дома к DSC связывает успех с партнёрствами и клиентами: важны договорённости и качество отношений.', 140, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.10.ruler.moon.aspect.any.with.angle.dsc' AND locale = 'ru-RU' AND topic_category = 'career'
);

UPDATE knowledge_items
SET text = 'Когда управитель 10-го дома — Меркурий, карьера растёт через качества Меркурий: то, как вы принимаете решения, действуете и создаёте результат. Смотрите знак/дом управителя и аспекты: они подскажут, где усиливать навык и где ставить границы.', is_active = 1, priority = 140, meta_json = '{}'
WHERE key = 'natal.house.10.ruler.mercury' AND locale = 'ru-RU' AND topic_category = 'career';

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.10.ruler.mercury', 'career', 'ru-RU', 'Когда управитель 10-го дома — Меркурий, карьера растёт через качества Меркурий: то, как вы принимаете решения, действуете и создаёте результат. Смотрите знак/дом управителя и аспекты: они подскажут, где усиливать навык и где ставить границы.', 140, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.10.ruler.mercury' AND locale = 'ru-RU' AND topic_category = 'career'
);

UPDATE knowledge_items
SET text = 'Управитель 10-го дома по знаку (любой): стиль реализации и манера решений. Это ваш «профессиональный почерк» — как вы действуете, чтобы расти.', is_active = 1, priority = 140, meta_json = '{}'
WHERE key = 'natal.house.10.ruler.mercury.sign.any' AND locale = 'ru-RU' AND topic_category = 'career';

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.10.ruler.mercury.sign.any', 'career', 'ru-RU', 'Управитель 10-го дома по знаку (любой): стиль реализации и манера решений. Это ваш «профессиональный почерк» — как вы действуете, чтобы расти.', 140, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.10.ruler.mercury.sign.any' AND locale = 'ru-RU' AND topic_category = 'career'
);

UPDATE knowledge_items
SET text = 'Управитель 10-го дома по дому (любой): куда уходит энергия карьеры. Дом показывает сферу жизни/задач, через которую проще собирать статус и признание.', is_active = 1, priority = 140, meta_json = '{}'
WHERE key = 'natal.house.10.ruler.mercury.house.any' AND locale = 'ru-RU' AND topic_category = 'career';

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.10.ruler.mercury.house.any', 'career', 'ru-RU', 'Управитель 10-го дома по дому (любой): куда уходит энергия карьеры. Дом показывает сферу жизни/задач, через которую проще собирать статус и признание.', 140, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.10.ruler.mercury.house.any' AND locale = 'ru-RU' AND topic_category = 'career'
);

UPDATE knowledge_items
SET text = 'Управитель 10-го дома: знак + дом (любой) — практическая сборка карьеры. Знак даёт стиль, дом — площадку, а вместе они показывают стратегию, которая повторяемо даёт результат.', is_active = 1, priority = 140, meta_json = '{}'
WHERE key = 'natal.house.10.ruler.mercury.sign.any.house.any' AND locale = 'ru-RU' AND topic_category = 'career';

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.10.ruler.mercury.sign.any.house.any', 'career', 'ru-RU', 'Управитель 10-го дома: знак + дом (любой) — практическая сборка карьеры. Знак даёт стиль, дом — площадку, а вместе они показывают стратегию, которая повторяемо даёт результат.', 140, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.10.ruler.mercury.sign.any.house.any' AND locale = 'ru-RU' AND topic_category = 'career'
);

UPDATE knowledge_items
SET text = 'Аспекты управителя 10-го дома описывают динамику карьеры: где идёт ускорение, где — сопротивление, и через какие навыки вы становитесь устойчивее. Смотрите повторяющиеся темы: власть/границы, публичность, коммуникации, риск, обучение.', is_active = 1, priority = 140, meta_json = '{}'
WHERE key = 'natal.house.10.ruler.mercury.aspect.any.any' AND locale = 'ru-RU' AND topic_category = 'career';

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.10.ruler.mercury.aspect.any.any', 'career', 'ru-RU', 'Аспекты управителя 10-го дома описывают динамику карьеры: где идёт ускорение, где — сопротивление, и через какие навыки вы становитесь устойчивее. Смотрите повторяющиеся темы: власть/границы, публичность, коммуникации, риск, обучение.', 140, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.10.ruler.mercury.aspect.any.any' AND locale = 'ru-RU' AND topic_category = 'career'
);

UPDATE knowledge_items
SET text = 'Hard-aspects у управителя 10-го дома означают узлы напряжения в карьерной траектории. Это не «плохо», а требование к стратегии: границы, режим, приоритеты, ясные договорённости и измеримые этапы роста.', is_active = 1, priority = 140, meta_json = '{}'
WHERE key = 'natal.house.10.ruler.mercury.aspect.hard.present' AND locale = 'ru-RU' AND topic_category = 'career';

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.10.ruler.mercury.aspect.hard.present', 'career', 'ru-RU', 'Hard-aspects у управителя 10-го дома означают узлы напряжения в карьерной траектории. Это не «плохо», а требование к стратегии: границы, режим, приоритеты, ясные договорённости и измеримые этапы роста.', 140, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.10.ruler.mercury.aspect.hard.present' AND locale = 'ru-RU' AND topic_category = 'career'
);

UPDATE knowledge_items
SET text = 'Напряжённые аспекты управителя 10-го дома дают рост через вызовы: конкуренцию, дедлайны, давление ожиданий. Рабочая стратегия: план, дисциплина, границы и переговоры.', is_active = 1, priority = 140, meta_json = '{}'
WHERE key = 'natal.house.10.ruler.mercury.aspect.class.tense' AND locale = 'ru-RU' AND topic_category = 'career';

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.10.ruler.mercury.aspect.class.tense', 'career', 'ru-RU', 'Напряжённые аспекты управителя 10-го дома дают рост через вызовы: конкуренцию, дедлайны, давление ожиданий. Рабочая стратегия: план, дисциплина, границы и переговоры.', 140, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.10.ruler.mercury.aspect.class.tense' AND locale = 'ru-RU' AND topic_category = 'career'
);

UPDATE knowledge_items
SET text = 'Гармоничные аспекты управителя 10-го дома дают поддержку: легче находить союзников и развивать компетенции. Главное — закреплять успех практикой и системностью.', is_active = 1, priority = 140, meta_json = '{}'
WHERE key = 'natal.house.10.ruler.mercury.aspect.class.harmonic' AND locale = 'ru-RU' AND topic_category = 'career';

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.10.ruler.mercury.aspect.class.harmonic', 'career', 'ru-RU', 'Гармоничные аспекты управителя 10-го дома дают поддержку: легче находить союзников и развивать компетенции. Главное — закреплять успех практикой и системностью.', 140, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.10.ruler.mercury.aspect.class.harmonic' AND locale = 'ru-RU' AND topic_category = 'career'
);

UPDATE knowledge_items
SET text = 'Аспект управителя 10-го дома к MC усиливает заметность и связывает личные решения с публичной ролью. Нужна ясная цель.', is_active = 1, priority = 140, meta_json = '{}'
WHERE key = 'natal.house.10.ruler.mercury.aspect.any.with.angle.mc' AND locale = 'ru-RU' AND topic_category = 'career';

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.10.ruler.mercury.aspect.any.with.angle.mc', 'career', 'ru-RU', 'Аспект управителя 10-го дома к MC усиливает заметность и связывает личные решения с публичной ролью. Нужна ясная цель.', 140, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.10.ruler.mercury.aspect.any.with.angle.mc' AND locale = 'ru-RU' AND topic_category = 'career'
);

UPDATE knowledge_items
SET text = 'Аспект управителя 10-го дома к ASC связывает карьеру с личным образом: важно управлять впечатлением и стилем самопрезентации.', is_active = 1, priority = 140, meta_json = '{}'
WHERE key = 'natal.house.10.ruler.mercury.aspect.any.with.angle.asc' AND locale = 'ru-RU' AND topic_category = 'career';

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.10.ruler.mercury.aspect.any.with.angle.asc', 'career', 'ru-RU', 'Аспект управителя 10-го дома к ASC связывает карьеру с личным образом: важно управлять впечатлением и стилем самопрезентации.', 140, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.10.ruler.mercury.aspect.any.with.angle.asc' AND locale = 'ru-RU' AND topic_category = 'career'
);

UPDATE knowledge_items
SET text = 'Аспект управителя 10-го дома к IC связывает карьеру с домом/опорой: баланс приватного и публичного — ключ к устойчивости.', is_active = 1, priority = 140, meta_json = '{}'
WHERE key = 'natal.house.10.ruler.mercury.aspect.any.with.angle.ic' AND locale = 'ru-RU' AND topic_category = 'career';

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.10.ruler.mercury.aspect.any.with.angle.ic', 'career', 'ru-RU', 'Аспект управителя 10-го дома к IC связывает карьеру с домом/опорой: баланс приватного и публичного — ключ к устойчивости.', 140, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.10.ruler.mercury.aspect.any.with.angle.ic' AND locale = 'ru-RU' AND topic_category = 'career'
);

UPDATE knowledge_items
SET text = 'Аспект управителя 10-го дома к DSC связывает успех с партнёрствами и клиентами: важны договорённости и качество отношений.', is_active = 1, priority = 140, meta_json = '{}'
WHERE key = 'natal.house.10.ruler.mercury.aspect.any.with.angle.dsc' AND locale = 'ru-RU' AND topic_category = 'career';

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.10.ruler.mercury.aspect.any.with.angle.dsc', 'career', 'ru-RU', 'Аспект управителя 10-го дома к DSC связывает успех с партнёрствами и клиентами: важны договорённости и качество отношений.', 140, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.10.ruler.mercury.aspect.any.with.angle.dsc' AND locale = 'ru-RU' AND topic_category = 'career'
);

UPDATE knowledge_items
SET text = 'Когда управитель 10-го дома — Венера, карьера растёт через качества Венера: то, как вы принимаете решения, действуете и создаёте результат. Смотрите знак/дом управителя и аспекты: они подскажут, где усиливать навык и где ставить границы.', is_active = 1, priority = 140, meta_json = '{}'
WHERE key = 'natal.house.10.ruler.venus' AND locale = 'ru-RU' AND topic_category = 'career';

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.10.ruler.venus', 'career', 'ru-RU', 'Когда управитель 10-го дома — Венера, карьера растёт через качества Венера: то, как вы принимаете решения, действуете и создаёте результат. Смотрите знак/дом управителя и аспекты: они подскажут, где усиливать навык и где ставить границы.', 140, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.10.ruler.venus' AND locale = 'ru-RU' AND topic_category = 'career'
);

UPDATE knowledge_items
SET text = 'Управитель 10-го дома по знаку (любой): стиль реализации и манера решений. Это ваш «профессиональный почерк» — как вы действуете, чтобы расти.', is_active = 1, priority = 140, meta_json = '{}'
WHERE key = 'natal.house.10.ruler.venus.sign.any' AND locale = 'ru-RU' AND topic_category = 'career';

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.10.ruler.venus.sign.any', 'career', 'ru-RU', 'Управитель 10-го дома по знаку (любой): стиль реализации и манера решений. Это ваш «профессиональный почерк» — как вы действуете, чтобы расти.', 140, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.10.ruler.venus.sign.any' AND locale = 'ru-RU' AND topic_category = 'career'
);

UPDATE knowledge_items
SET text = 'Управитель 10-го дома по дому (любой): куда уходит энергия карьеры. Дом показывает сферу жизни/задач, через которую проще собирать статус и признание.', is_active = 1, priority = 140, meta_json = '{}'
WHERE key = 'natal.house.10.ruler.venus.house.any' AND locale = 'ru-RU' AND topic_category = 'career';

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.10.ruler.venus.house.any', 'career', 'ru-RU', 'Управитель 10-го дома по дому (любой): куда уходит энергия карьеры. Дом показывает сферу жизни/задач, через которую проще собирать статус и признание.', 140, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.10.ruler.venus.house.any' AND locale = 'ru-RU' AND topic_category = 'career'
);

UPDATE knowledge_items
SET text = 'Управитель 10-го дома: знак + дом (любой) — практическая сборка карьеры. Знак даёт стиль, дом — площадку, а вместе они показывают стратегию, которая повторяемо даёт результат.', is_active = 1, priority = 140, meta_json = '{}'
WHERE key = 'natal.house.10.ruler.venus.sign.any.house.any' AND locale = 'ru-RU' AND topic_category = 'career';

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.10.ruler.venus.sign.any.house.any', 'career', 'ru-RU', 'Управитель 10-го дома: знак + дом (любой) — практическая сборка карьеры. Знак даёт стиль, дом — площадку, а вместе они показывают стратегию, которая повторяемо даёт результат.', 140, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.10.ruler.venus.sign.any.house.any' AND locale = 'ru-RU' AND topic_category = 'career'
);

UPDATE knowledge_items
SET text = 'Аспекты управителя 10-го дома описывают динамику карьеры: где идёт ускорение, где — сопротивление, и через какие навыки вы становитесь устойчивее. Смотрите повторяющиеся темы: власть/границы, публичность, коммуникации, риск, обучение.', is_active = 1, priority = 140, meta_json = '{}'
WHERE key = 'natal.house.10.ruler.venus.aspect.any.any' AND locale = 'ru-RU' AND topic_category = 'career';

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.10.ruler.venus.aspect.any.any', 'career', 'ru-RU', 'Аспекты управителя 10-го дома описывают динамику карьеры: где идёт ускорение, где — сопротивление, и через какие навыки вы становитесь устойчивее. Смотрите повторяющиеся темы: власть/границы, публичность, коммуникации, риск, обучение.', 140, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.10.ruler.venus.aspect.any.any' AND locale = 'ru-RU' AND topic_category = 'career'
);

UPDATE knowledge_items
SET text = 'Hard-aspects у управителя 10-го дома означают узлы напряжения в карьерной траектории. Это не «плохо», а требование к стратегии: границы, режим, приоритеты, ясные договорённости и измеримые этапы роста.', is_active = 1, priority = 140, meta_json = '{}'
WHERE key = 'natal.house.10.ruler.venus.aspect.hard.present' AND locale = 'ru-RU' AND topic_category = 'career';

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.10.ruler.venus.aspect.hard.present', 'career', 'ru-RU', 'Hard-aspects у управителя 10-го дома означают узлы напряжения в карьерной траектории. Это не «плохо», а требование к стратегии: границы, режим, приоритеты, ясные договорённости и измеримые этапы роста.', 140, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.10.ruler.venus.aspect.hard.present' AND locale = 'ru-RU' AND topic_category = 'career'
);

UPDATE knowledge_items
SET text = 'Напряжённые аспекты управителя 10-го дома дают рост через вызовы: конкуренцию, дедлайны, давление ожиданий. Рабочая стратегия: план, дисциплина, границы и переговоры.', is_active = 1, priority = 140, meta_json = '{}'
WHERE key = 'natal.house.10.ruler.venus.aspect.class.tense' AND locale = 'ru-RU' AND topic_category = 'career';

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.10.ruler.venus.aspect.class.tense', 'career', 'ru-RU', 'Напряжённые аспекты управителя 10-го дома дают рост через вызовы: конкуренцию, дедлайны, давление ожиданий. Рабочая стратегия: план, дисциплина, границы и переговоры.', 140, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.10.ruler.venus.aspect.class.tense' AND locale = 'ru-RU' AND topic_category = 'career'
);

UPDATE knowledge_items
SET text = 'Гармоничные аспекты управителя 10-го дома дают поддержку: легче находить союзников и развивать компетенции. Главное — закреплять успех практикой и системностью.', is_active = 1, priority = 140, meta_json = '{}'
WHERE key = 'natal.house.10.ruler.venus.aspect.class.harmonic' AND locale = 'ru-RU' AND topic_category = 'career';

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.10.ruler.venus.aspect.class.harmonic', 'career', 'ru-RU', 'Гармоничные аспекты управителя 10-го дома дают поддержку: легче находить союзников и развивать компетенции. Главное — закреплять успех практикой и системностью.', 140, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.10.ruler.venus.aspect.class.harmonic' AND locale = 'ru-RU' AND topic_category = 'career'
);

UPDATE knowledge_items
SET text = 'Аспект управителя 10-го дома к MC усиливает заметность и связывает личные решения с публичной ролью. Нужна ясная цель.', is_active = 1, priority = 140, meta_json = '{}'
WHERE key = 'natal.house.10.ruler.venus.aspect.any.with.angle.mc' AND locale = 'ru-RU' AND topic_category = 'career';

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.10.ruler.venus.aspect.any.with.angle.mc', 'career', 'ru-RU', 'Аспект управителя 10-го дома к MC усиливает заметность и связывает личные решения с публичной ролью. Нужна ясная цель.', 140, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.10.ruler.venus.aspect.any.with.angle.mc' AND locale = 'ru-RU' AND topic_category = 'career'
);

UPDATE knowledge_items
SET text = 'Аспект управителя 10-го дома к ASC связывает карьеру с личным образом: важно управлять впечатлением и стилем самопрезентации.', is_active = 1, priority = 140, meta_json = '{}'
WHERE key = 'natal.house.10.ruler.venus.aspect.any.with.angle.asc' AND locale = 'ru-RU' AND topic_category = 'career';

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.10.ruler.venus.aspect.any.with.angle.asc', 'career', 'ru-RU', 'Аспект управителя 10-го дома к ASC связывает карьеру с личным образом: важно управлять впечатлением и стилем самопрезентации.', 140, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.10.ruler.venus.aspect.any.with.angle.asc' AND locale = 'ru-RU' AND topic_category = 'career'
);

UPDATE knowledge_items
SET text = 'Аспект управителя 10-го дома к IC связывает карьеру с домом/опорой: баланс приватного и публичного — ключ к устойчивости.', is_active = 1, priority = 140, meta_json = '{}'
WHERE key = 'natal.house.10.ruler.venus.aspect.any.with.angle.ic' AND locale = 'ru-RU' AND topic_category = 'career';

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.10.ruler.venus.aspect.any.with.angle.ic', 'career', 'ru-RU', 'Аспект управителя 10-го дома к IC связывает карьеру с домом/опорой: баланс приватного и публичного — ключ к устойчивости.', 140, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.10.ruler.venus.aspect.any.with.angle.ic' AND locale = 'ru-RU' AND topic_category = 'career'
);

UPDATE knowledge_items
SET text = 'Аспект управителя 10-го дома к DSC связывает успех с партнёрствами и клиентами: важны договорённости и качество отношений.', is_active = 1, priority = 140, meta_json = '{}'
WHERE key = 'natal.house.10.ruler.venus.aspect.any.with.angle.dsc' AND locale = 'ru-RU' AND topic_category = 'career';

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.10.ruler.venus.aspect.any.with.angle.dsc', 'career', 'ru-RU', 'Аспект управителя 10-го дома к DSC связывает успех с партнёрствами и клиентами: важны договорённости и качество отношений.', 140, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.10.ruler.venus.aspect.any.with.angle.dsc' AND locale = 'ru-RU' AND topic_category = 'career'
);

UPDATE knowledge_items
SET text = 'Когда управитель 10-го дома — Марс, карьера растёт через качества Марс: то, как вы принимаете решения, действуете и создаёте результат. Смотрите знак/дом управителя и аспекты: они подскажут, где усиливать навык и где ставить границы.', is_active = 1, priority = 140, meta_json = '{}'
WHERE key = 'natal.house.10.ruler.mars' AND locale = 'ru-RU' AND topic_category = 'career';

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.10.ruler.mars', 'career', 'ru-RU', 'Когда управитель 10-го дома — Марс, карьера растёт через качества Марс: то, как вы принимаете решения, действуете и создаёте результат. Смотрите знак/дом управителя и аспекты: они подскажут, где усиливать навык и где ставить границы.', 140, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.10.ruler.mars' AND locale = 'ru-RU' AND topic_category = 'career'
);

UPDATE knowledge_items
SET text = 'Управитель 10-го дома по знаку (любой): стиль реализации и манера решений. Это ваш «профессиональный почерк» — как вы действуете, чтобы расти.', is_active = 1, priority = 140, meta_json = '{}'
WHERE key = 'natal.house.10.ruler.mars.sign.any' AND locale = 'ru-RU' AND topic_category = 'career';

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.10.ruler.mars.sign.any', 'career', 'ru-RU', 'Управитель 10-го дома по знаку (любой): стиль реализации и манера решений. Это ваш «профессиональный почерк» — как вы действуете, чтобы расти.', 140, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.10.ruler.mars.sign.any' AND locale = 'ru-RU' AND topic_category = 'career'
);

UPDATE knowledge_items
SET text = 'Управитель 10-го дома по дому (любой): куда уходит энергия карьеры. Дом показывает сферу жизни/задач, через которую проще собирать статус и признание.', is_active = 1, priority = 140, meta_json = '{}'
WHERE key = 'natal.house.10.ruler.mars.house.any' AND locale = 'ru-RU' AND topic_category = 'career';

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.10.ruler.mars.house.any', 'career', 'ru-RU', 'Управитель 10-го дома по дому (любой): куда уходит энергия карьеры. Дом показывает сферу жизни/задач, через которую проще собирать статус и признание.', 140, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.10.ruler.mars.house.any' AND locale = 'ru-RU' AND topic_category = 'career'
);

UPDATE knowledge_items
SET text = 'Управитель 10-го дома: знак + дом (любой) — практическая сборка карьеры. Знак даёт стиль, дом — площадку, а вместе они показывают стратегию, которая повторяемо даёт результат.', is_active = 1, priority = 140, meta_json = '{}'
WHERE key = 'natal.house.10.ruler.mars.sign.any.house.any' AND locale = 'ru-RU' AND topic_category = 'career';

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.10.ruler.mars.sign.any.house.any', 'career', 'ru-RU', 'Управитель 10-го дома: знак + дом (любой) — практическая сборка карьеры. Знак даёт стиль, дом — площадку, а вместе они показывают стратегию, которая повторяемо даёт результат.', 140, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.10.ruler.mars.sign.any.house.any' AND locale = 'ru-RU' AND topic_category = 'career'
);

UPDATE knowledge_items
SET text = 'Аспекты управителя 10-го дома описывают динамику карьеры: где идёт ускорение, где — сопротивление, и через какие навыки вы становитесь устойчивее. Смотрите повторяющиеся темы: власть/границы, публичность, коммуникации, риск, обучение.', is_active = 1, priority = 140, meta_json = '{}'
WHERE key = 'natal.house.10.ruler.mars.aspect.any.any' AND locale = 'ru-RU' AND topic_category = 'career';

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.10.ruler.mars.aspect.any.any', 'career', 'ru-RU', 'Аспекты управителя 10-го дома описывают динамику карьеры: где идёт ускорение, где — сопротивление, и через какие навыки вы становитесь устойчивее. Смотрите повторяющиеся темы: власть/границы, публичность, коммуникации, риск, обучение.', 140, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.10.ruler.mars.aspect.any.any' AND locale = 'ru-RU' AND topic_category = 'career'
);

UPDATE knowledge_items
SET text = 'Hard-aspects у управителя 10-го дома означают узлы напряжения в карьерной траектории. Это не «плохо», а требование к стратегии: границы, режим, приоритеты, ясные договорённости и измеримые этапы роста.', is_active = 1, priority = 140, meta_json = '{}'
WHERE key = 'natal.house.10.ruler.mars.aspect.hard.present' AND locale = 'ru-RU' AND topic_category = 'career';

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.10.ruler.mars.aspect.hard.present', 'career', 'ru-RU', 'Hard-aspects у управителя 10-го дома означают узлы напряжения в карьерной траектории. Это не «плохо», а требование к стратегии: границы, режим, приоритеты, ясные договорённости и измеримые этапы роста.', 140, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.10.ruler.mars.aspect.hard.present' AND locale = 'ru-RU' AND topic_category = 'career'
);

UPDATE knowledge_items
SET text = 'Напряжённые аспекты управителя 10-го дома дают рост через вызовы: конкуренцию, дедлайны, давление ожиданий. Рабочая стратегия: план, дисциплина, границы и переговоры.', is_active = 1, priority = 140, meta_json = '{}'
WHERE key = 'natal.house.10.ruler.mars.aspect.class.tense' AND locale = 'ru-RU' AND topic_category = 'career';

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.10.ruler.mars.aspect.class.tense', 'career', 'ru-RU', 'Напряжённые аспекты управителя 10-го дома дают рост через вызовы: конкуренцию, дедлайны, давление ожиданий. Рабочая стратегия: план, дисциплина, границы и переговоры.', 140, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.10.ruler.mars.aspect.class.tense' AND locale = 'ru-RU' AND topic_category = 'career'
);

UPDATE knowledge_items
SET text = 'Гармоничные аспекты управителя 10-го дома дают поддержку: легче находить союзников и развивать компетенции. Главное — закреплять успех практикой и системностью.', is_active = 1, priority = 140, meta_json = '{}'
WHERE key = 'natal.house.10.ruler.mars.aspect.class.harmonic' AND locale = 'ru-RU' AND topic_category = 'career';

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.10.ruler.mars.aspect.class.harmonic', 'career', 'ru-RU', 'Гармоничные аспекты управителя 10-го дома дают поддержку: легче находить союзников и развивать компетенции. Главное — закреплять успех практикой и системностью.', 140, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.10.ruler.mars.aspect.class.harmonic' AND locale = 'ru-RU' AND topic_category = 'career'
);

UPDATE knowledge_items
SET text = 'Аспект управителя 10-го дома к MC усиливает заметность и связывает личные решения с публичной ролью. Нужна ясная цель.', is_active = 1, priority = 140, meta_json = '{}'
WHERE key = 'natal.house.10.ruler.mars.aspect.any.with.angle.mc' AND locale = 'ru-RU' AND topic_category = 'career';

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.10.ruler.mars.aspect.any.with.angle.mc', 'career', 'ru-RU', 'Аспект управителя 10-го дома к MC усиливает заметность и связывает личные решения с публичной ролью. Нужна ясная цель.', 140, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.10.ruler.mars.aspect.any.with.angle.mc' AND locale = 'ru-RU' AND topic_category = 'career'
);

UPDATE knowledge_items
SET text = 'Аспект управителя 10-го дома к ASC связывает карьеру с личным образом: важно управлять впечатлением и стилем самопрезентации.', is_active = 1, priority = 140, meta_json = '{}'
WHERE key = 'natal.house.10.ruler.mars.aspect.any.with.angle.asc' AND locale = 'ru-RU' AND topic_category = 'career';

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.10.ruler.mars.aspect.any.with.angle.asc', 'career', 'ru-RU', 'Аспект управителя 10-го дома к ASC связывает карьеру с личным образом: важно управлять впечатлением и стилем самопрезентации.', 140, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.10.ruler.mars.aspect.any.with.angle.asc' AND locale = 'ru-RU' AND topic_category = 'career'
);

UPDATE knowledge_items
SET text = 'Аспект управителя 10-го дома к IC связывает карьеру с домом/опорой: баланс приватного и публичного — ключ к устойчивости.', is_active = 1, priority = 140, meta_json = '{}'
WHERE key = 'natal.house.10.ruler.mars.aspect.any.with.angle.ic' AND locale = 'ru-RU' AND topic_category = 'career';

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.10.ruler.mars.aspect.any.with.angle.ic', 'career', 'ru-RU', 'Аспект управителя 10-го дома к IC связывает карьеру с домом/опорой: баланс приватного и публичного — ключ к устойчивости.', 140, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.10.ruler.mars.aspect.any.with.angle.ic' AND locale = 'ru-RU' AND topic_category = 'career'
);

UPDATE knowledge_items
SET text = 'Аспект управителя 10-го дома к DSC связывает успех с партнёрствами и клиентами: важны договорённости и качество отношений.', is_active = 1, priority = 140, meta_json = '{}'
WHERE key = 'natal.house.10.ruler.mars.aspect.any.with.angle.dsc' AND locale = 'ru-RU' AND topic_category = 'career';

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.10.ruler.mars.aspect.any.with.angle.dsc', 'career', 'ru-RU', 'Аспект управителя 10-го дома к DSC связывает успех с партнёрствами и клиентами: важны договорённости и качество отношений.', 140, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.10.ruler.mars.aspect.any.with.angle.dsc' AND locale = 'ru-RU' AND topic_category = 'career'
);

UPDATE knowledge_items
SET text = 'Когда управитель 10-го дома — Юпитер, карьера растёт через качества Юпитер: то, как вы принимаете решения, действуете и создаёте результат. Смотрите знак/дом управителя и аспекты: они подскажут, где усиливать навык и где ставить границы.', is_active = 1, priority = 140, meta_json = '{}'
WHERE key = 'natal.house.10.ruler.jupiter' AND locale = 'ru-RU' AND topic_category = 'career';

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.10.ruler.jupiter', 'career', 'ru-RU', 'Когда управитель 10-го дома — Юпитер, карьера растёт через качества Юпитер: то, как вы принимаете решения, действуете и создаёте результат. Смотрите знак/дом управителя и аспекты: они подскажут, где усиливать навык и где ставить границы.', 140, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.10.ruler.jupiter' AND locale = 'ru-RU' AND topic_category = 'career'
);

UPDATE knowledge_items
SET text = 'Управитель 10-го дома по знаку (любой): стиль реализации и манера решений. Это ваш «профессиональный почерк» — как вы действуете, чтобы расти.', is_active = 1, priority = 140, meta_json = '{}'
WHERE key = 'natal.house.10.ruler.jupiter.sign.any' AND locale = 'ru-RU' AND topic_category = 'career';

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.10.ruler.jupiter.sign.any', 'career', 'ru-RU', 'Управитель 10-го дома по знаку (любой): стиль реализации и манера решений. Это ваш «профессиональный почерк» — как вы действуете, чтобы расти.', 140, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.10.ruler.jupiter.sign.any' AND locale = 'ru-RU' AND topic_category = 'career'
);

UPDATE knowledge_items
SET text = 'Управитель 10-го дома по дому (любой): куда уходит энергия карьеры. Дом показывает сферу жизни/задач, через которую проще собирать статус и признание.', is_active = 1, priority = 140, meta_json = '{}'
WHERE key = 'natal.house.10.ruler.jupiter.house.any' AND locale = 'ru-RU' AND topic_category = 'career';

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.10.ruler.jupiter.house.any', 'career', 'ru-RU', 'Управитель 10-го дома по дому (любой): куда уходит энергия карьеры. Дом показывает сферу жизни/задач, через которую проще собирать статус и признание.', 140, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.10.ruler.jupiter.house.any' AND locale = 'ru-RU' AND topic_category = 'career'
);

UPDATE knowledge_items
SET text = 'Управитель 10-го дома: знак + дом (любой) — практическая сборка карьеры. Знак даёт стиль, дом — площадку, а вместе они показывают стратегию, которая повторяемо даёт результат.', is_active = 1, priority = 140, meta_json = '{}'
WHERE key = 'natal.house.10.ruler.jupiter.sign.any.house.any' AND locale = 'ru-RU' AND topic_category = 'career';

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.10.ruler.jupiter.sign.any.house.any', 'career', 'ru-RU', 'Управитель 10-го дома: знак + дом (любой) — практическая сборка карьеры. Знак даёт стиль, дом — площадку, а вместе они показывают стратегию, которая повторяемо даёт результат.', 140, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.10.ruler.jupiter.sign.any.house.any' AND locale = 'ru-RU' AND topic_category = 'career'
);

UPDATE knowledge_items
SET text = 'Аспекты управителя 10-го дома описывают динамику карьеры: где идёт ускорение, где — сопротивление, и через какие навыки вы становитесь устойчивее. Смотрите повторяющиеся темы: власть/границы, публичность, коммуникации, риск, обучение.', is_active = 1, priority = 140, meta_json = '{}'
WHERE key = 'natal.house.10.ruler.jupiter.aspect.any.any' AND locale = 'ru-RU' AND topic_category = 'career';

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.10.ruler.jupiter.aspect.any.any', 'career', 'ru-RU', 'Аспекты управителя 10-го дома описывают динамику карьеры: где идёт ускорение, где — сопротивление, и через какие навыки вы становитесь устойчивее. Смотрите повторяющиеся темы: власть/границы, публичность, коммуникации, риск, обучение.', 140, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.10.ruler.jupiter.aspect.any.any' AND locale = 'ru-RU' AND topic_category = 'career'
);

UPDATE knowledge_items
SET text = 'Hard-aspects у управителя 10-го дома означают узлы напряжения в карьерной траектории. Это не «плохо», а требование к стратегии: границы, режим, приоритеты, ясные договорённости и измеримые этапы роста.', is_active = 1, priority = 140, meta_json = '{}'
WHERE key = 'natal.house.10.ruler.jupiter.aspect.hard.present' AND locale = 'ru-RU' AND topic_category = 'career';

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.10.ruler.jupiter.aspect.hard.present', 'career', 'ru-RU', 'Hard-aspects у управителя 10-го дома означают узлы напряжения в карьерной траектории. Это не «плохо», а требование к стратегии: границы, режим, приоритеты, ясные договорённости и измеримые этапы роста.', 140, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.10.ruler.jupiter.aspect.hard.present' AND locale = 'ru-RU' AND topic_category = 'career'
);

UPDATE knowledge_items
SET text = 'Напряжённые аспекты управителя 10-го дома дают рост через вызовы: конкуренцию, дедлайны, давление ожиданий. Рабочая стратегия: план, дисциплина, границы и переговоры.', is_active = 1, priority = 140, meta_json = '{}'
WHERE key = 'natal.house.10.ruler.jupiter.aspect.class.tense' AND locale = 'ru-RU' AND topic_category = 'career';

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.10.ruler.jupiter.aspect.class.tense', 'career', 'ru-RU', 'Напряжённые аспекты управителя 10-го дома дают рост через вызовы: конкуренцию, дедлайны, давление ожиданий. Рабочая стратегия: план, дисциплина, границы и переговоры.', 140, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.10.ruler.jupiter.aspect.class.tense' AND locale = 'ru-RU' AND topic_category = 'career'
);

UPDATE knowledge_items
SET text = 'Гармоничные аспекты управителя 10-го дома дают поддержку: легче находить союзников и развивать компетенции. Главное — закреплять успех практикой и системностью.', is_active = 1, priority = 140, meta_json = '{}'
WHERE key = 'natal.house.10.ruler.jupiter.aspect.class.harmonic' AND locale = 'ru-RU' AND topic_category = 'career';

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.10.ruler.jupiter.aspect.class.harmonic', 'career', 'ru-RU', 'Гармоничные аспекты управителя 10-го дома дают поддержку: легче находить союзников и развивать компетенции. Главное — закреплять успех практикой и системностью.', 140, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.10.ruler.jupiter.aspect.class.harmonic' AND locale = 'ru-RU' AND topic_category = 'career'
);

UPDATE knowledge_items
SET text = 'Аспект управителя 10-го дома к MC усиливает заметность и связывает личные решения с публичной ролью. Нужна ясная цель.', is_active = 1, priority = 140, meta_json = '{}'
WHERE key = 'natal.house.10.ruler.jupiter.aspect.any.with.angle.mc' AND locale = 'ru-RU' AND topic_category = 'career';

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.10.ruler.jupiter.aspect.any.with.angle.mc', 'career', 'ru-RU', 'Аспект управителя 10-го дома к MC усиливает заметность и связывает личные решения с публичной ролью. Нужна ясная цель.', 140, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.10.ruler.jupiter.aspect.any.with.angle.mc' AND locale = 'ru-RU' AND topic_category = 'career'
);

UPDATE knowledge_items
SET text = 'Аспект управителя 10-го дома к ASC связывает карьеру с личным образом: важно управлять впечатлением и стилем самопрезентации.', is_active = 1, priority = 140, meta_json = '{}'
WHERE key = 'natal.house.10.ruler.jupiter.aspect.any.with.angle.asc' AND locale = 'ru-RU' AND topic_category = 'career';

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.10.ruler.jupiter.aspect.any.with.angle.asc', 'career', 'ru-RU', 'Аспект управителя 10-го дома к ASC связывает карьеру с личным образом: важно управлять впечатлением и стилем самопрезентации.', 140, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.10.ruler.jupiter.aspect.any.with.angle.asc' AND locale = 'ru-RU' AND topic_category = 'career'
);

UPDATE knowledge_items
SET text = 'Аспект управителя 10-го дома к IC связывает карьеру с домом/опорой: баланс приватного и публичного — ключ к устойчивости.', is_active = 1, priority = 140, meta_json = '{}'
WHERE key = 'natal.house.10.ruler.jupiter.aspect.any.with.angle.ic' AND locale = 'ru-RU' AND topic_category = 'career';

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.10.ruler.jupiter.aspect.any.with.angle.ic', 'career', 'ru-RU', 'Аспект управителя 10-го дома к IC связывает карьеру с домом/опорой: баланс приватного и публичного — ключ к устойчивости.', 140, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.10.ruler.jupiter.aspect.any.with.angle.ic' AND locale = 'ru-RU' AND topic_category = 'career'
);

UPDATE knowledge_items
SET text = 'Аспект управителя 10-го дома к DSC связывает успех с партнёрствами и клиентами: важны договорённости и качество отношений.', is_active = 1, priority = 140, meta_json = '{}'
WHERE key = 'natal.house.10.ruler.jupiter.aspect.any.with.angle.dsc' AND locale = 'ru-RU' AND topic_category = 'career';

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.10.ruler.jupiter.aspect.any.with.angle.dsc', 'career', 'ru-RU', 'Аспект управителя 10-го дома к DSC связывает успех с партнёрствами и клиентами: важны договорённости и качество отношений.', 140, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.10.ruler.jupiter.aspect.any.with.angle.dsc' AND locale = 'ru-RU' AND topic_category = 'career'
);

UPDATE knowledge_items
SET text = 'Когда управитель 10-го дома — Сатурн, рост строится через дисциплину, стандарты качества и репутацию, проверенную временем. Это сценарий «долго, но надёжно»: ответственность, структура, умение держать рамки. Вызов — не уйти в самокритику: фиксируйте этапы и прогресс, усиливайте компетенцию и системность.', is_active = 1, priority = 140, meta_json = '{}'
WHERE key = 'natal.house.10.ruler.saturn' AND locale = 'ru-RU' AND topic_category = 'career';

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.10.ruler.saturn', 'career', 'ru-RU', 'Когда управитель 10-го дома — Сатурн, рост строится через дисциплину, стандарты качества и репутацию, проверенную временем. Это сценарий «долго, но надёжно»: ответственность, структура, умение держать рамки. Вызов — не уйти в самокритику: фиксируйте этапы и прогресс, усиливайте компетенцию и системность.', 140, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.10.ruler.saturn' AND locale = 'ru-RU' AND topic_category = 'career'
);

UPDATE knowledge_items
SET text = 'Управитель 10-го дома по знаку (любой): стиль реализации и манера решений. Это ваш «профессиональный почерк» — как вы действуете, чтобы расти.', is_active = 1, priority = 140, meta_json = '{}'
WHERE key = 'natal.house.10.ruler.saturn.sign.any' AND locale = 'ru-RU' AND topic_category = 'career';

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.10.ruler.saturn.sign.any', 'career', 'ru-RU', 'Управитель 10-го дома по знаку (любой): стиль реализации и манера решений. Это ваш «профессиональный почерк» — как вы действуете, чтобы расти.', 140, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.10.ruler.saturn.sign.any' AND locale = 'ru-RU' AND topic_category = 'career'
);

UPDATE knowledge_items
SET text = 'Управитель 10-го дома по дому (любой): куда уходит энергия карьеры. Дом показывает сферу жизни/задач, через которую проще собирать статус и признание.', is_active = 1, priority = 140, meta_json = '{}'
WHERE key = 'natal.house.10.ruler.saturn.house.any' AND locale = 'ru-RU' AND topic_category = 'career';

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.10.ruler.saturn.house.any', 'career', 'ru-RU', 'Управитель 10-го дома по дому (любой): куда уходит энергия карьеры. Дом показывает сферу жизни/задач, через которую проще собирать статус и признание.', 140, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.10.ruler.saturn.house.any' AND locale = 'ru-RU' AND topic_category = 'career'
);

UPDATE knowledge_items
SET text = 'Управитель 10-го дома: знак + дом (любой) — практическая сборка карьеры. Знак даёт стиль, дом — площадку, а вместе они показывают стратегию, которая повторяемо даёт результат.', is_active = 1, priority = 140, meta_json = '{}'
WHERE key = 'natal.house.10.ruler.saturn.sign.any.house.any' AND locale = 'ru-RU' AND topic_category = 'career';

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.10.ruler.saturn.sign.any.house.any', 'career', 'ru-RU', 'Управитель 10-го дома: знак + дом (любой) — практическая сборка карьеры. Знак даёт стиль, дом — площадку, а вместе они показывают стратегию, которая повторяемо даёт результат.', 140, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.10.ruler.saturn.sign.any.house.any' AND locale = 'ru-RU' AND topic_category = 'career'
);

UPDATE knowledge_items
SET text = 'Аспекты управителя 10-го дома описывают динамику карьеры: где идёт ускорение, где — сопротивление, и через какие навыки вы становитесь устойчивее. Смотрите повторяющиеся темы: власть/границы, публичность, коммуникации, риск, обучение.', is_active = 1, priority = 140, meta_json = '{}'
WHERE key = 'natal.house.10.ruler.saturn.aspect.any.any' AND locale = 'ru-RU' AND topic_category = 'career';

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.10.ruler.saturn.aspect.any.any', 'career', 'ru-RU', 'Аспекты управителя 10-го дома описывают динамику карьеры: где идёт ускорение, где — сопротивление, и через какие навыки вы становитесь устойчивее. Смотрите повторяющиеся темы: власть/границы, публичность, коммуникации, риск, обучение.', 140, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.10.ruler.saturn.aspect.any.any' AND locale = 'ru-RU' AND topic_category = 'career'
);

UPDATE knowledge_items
SET text = 'Hard-aspects у управителя 10-го дома означают узлы напряжения в карьерной траектории. Это не «плохо», а требование к стратегии: границы, режим, приоритеты, ясные договорённости и измеримые этапы роста.', is_active = 1, priority = 140, meta_json = '{}'
WHERE key = 'natal.house.10.ruler.saturn.aspect.hard.present' AND locale = 'ru-RU' AND topic_category = 'career';

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.10.ruler.saturn.aspect.hard.present', 'career', 'ru-RU', 'Hard-aspects у управителя 10-го дома означают узлы напряжения в карьерной траектории. Это не «плохо», а требование к стратегии: границы, режим, приоритеты, ясные договорённости и измеримые этапы роста.', 140, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.10.ruler.saturn.aspect.hard.present' AND locale = 'ru-RU' AND topic_category = 'career'
);

UPDATE knowledge_items
SET text = 'Напряжённые аспекты управителя 10-го дома дают рост через вызовы: конкуренцию, дедлайны, давление ожиданий. Рабочая стратегия: план, дисциплина, границы и переговоры.', is_active = 1, priority = 140, meta_json = '{}'
WHERE key = 'natal.house.10.ruler.saturn.aspect.class.tense' AND locale = 'ru-RU' AND topic_category = 'career';

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.10.ruler.saturn.aspect.class.tense', 'career', 'ru-RU', 'Напряжённые аспекты управителя 10-го дома дают рост через вызовы: конкуренцию, дедлайны, давление ожиданий. Рабочая стратегия: план, дисциплина, границы и переговоры.', 140, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.10.ruler.saturn.aspect.class.tense' AND locale = 'ru-RU' AND topic_category = 'career'
);

UPDATE knowledge_items
SET text = 'Гармоничные аспекты управителя 10-го дома дают поддержку: легче находить союзников и развивать компетенции. Главное — закреплять успех практикой и системностью.', is_active = 1, priority = 140, meta_json = '{}'
WHERE key = 'natal.house.10.ruler.saturn.aspect.class.harmonic' AND locale = 'ru-RU' AND topic_category = 'career';

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.10.ruler.saturn.aspect.class.harmonic', 'career', 'ru-RU', 'Гармоничные аспекты управителя 10-го дома дают поддержку: легче находить союзников и развивать компетенции. Главное — закреплять успех практикой и системностью.', 140, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.10.ruler.saturn.aspect.class.harmonic' AND locale = 'ru-RU' AND topic_category = 'career'
);

UPDATE knowledge_items
SET text = 'Аспект управителя 10-го дома к MC усиливает заметность и связывает личные решения с публичной ролью. Нужна ясная цель.', is_active = 1, priority = 140, meta_json = '{}'
WHERE key = 'natal.house.10.ruler.saturn.aspect.any.with.angle.mc' AND locale = 'ru-RU' AND topic_category = 'career';

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.10.ruler.saturn.aspect.any.with.angle.mc', 'career', 'ru-RU', 'Аспект управителя 10-го дома к MC усиливает заметность и связывает личные решения с публичной ролью. Нужна ясная цель.', 140, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.10.ruler.saturn.aspect.any.with.angle.mc' AND locale = 'ru-RU' AND topic_category = 'career'
);

UPDATE knowledge_items
SET text = 'Аспект управителя 10-го дома к ASC связывает карьеру с личным образом: важно управлять впечатлением и стилем самопрезентации.', is_active = 1, priority = 140, meta_json = '{}'
WHERE key = 'natal.house.10.ruler.saturn.aspect.any.with.angle.asc' AND locale = 'ru-RU' AND topic_category = 'career';

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.10.ruler.saturn.aspect.any.with.angle.asc', 'career', 'ru-RU', 'Аспект управителя 10-го дома к ASC связывает карьеру с личным образом: важно управлять впечатлением и стилем самопрезентации.', 140, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.10.ruler.saturn.aspect.any.with.angle.asc' AND locale = 'ru-RU' AND topic_category = 'career'
);

UPDATE knowledge_items
SET text = 'Аспект управителя 10-го дома к IC связывает карьеру с домом/опорой: баланс приватного и публичного — ключ к устойчивости.', is_active = 1, priority = 140, meta_json = '{}'
WHERE key = 'natal.house.10.ruler.saturn.aspect.any.with.angle.ic' AND locale = 'ru-RU' AND topic_category = 'career';

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.10.ruler.saturn.aspect.any.with.angle.ic', 'career', 'ru-RU', 'Аспект управителя 10-го дома к IC связывает карьеру с домом/опорой: баланс приватного и публичного — ключ к устойчивости.', 140, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.10.ruler.saturn.aspect.any.with.angle.ic' AND locale = 'ru-RU' AND topic_category = 'career'
);

UPDATE knowledge_items
SET text = 'Аспект управителя 10-го дома к DSC связывает успех с партнёрствами и клиентами: важны договорённости и качество отношений.', is_active = 1, priority = 140, meta_json = '{}'
WHERE key = 'natal.house.10.ruler.saturn.aspect.any.with.angle.dsc' AND locale = 'ru-RU' AND topic_category = 'career';

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.10.ruler.saturn.aspect.any.with.angle.dsc', 'career', 'ru-RU', 'Аспект управителя 10-го дома к DSC связывает успех с партнёрствами и клиентами: важны договорённости и качество отношений.', 140, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.10.ruler.saturn.aspect.any.with.angle.dsc' AND locale = 'ru-RU' AND topic_category = 'career'
);

UPDATE knowledge_items
SET text = 'Когда управитель 10-го дома — Уран, карьера растёт через качества Уран: то, как вы принимаете решения, действуете и создаёте результат. Смотрите знак/дом управителя и аспекты: они подскажут, где усиливать навык и где ставить границы.', is_active = 1, priority = 140, meta_json = '{}'
WHERE key = 'natal.house.10.ruler.uranus' AND locale = 'ru-RU' AND topic_category = 'career';

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.10.ruler.uranus', 'career', 'ru-RU', 'Когда управитель 10-го дома — Уран, карьера растёт через качества Уран: то, как вы принимаете решения, действуете и создаёте результат. Смотрите знак/дом управителя и аспекты: они подскажут, где усиливать навык и где ставить границы.', 140, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.10.ruler.uranus' AND locale = 'ru-RU' AND topic_category = 'career'
);

UPDATE knowledge_items
SET text = 'Управитель 10-го дома по знаку (любой): стиль реализации и манера решений. Это ваш «профессиональный почерк» — как вы действуете, чтобы расти.', is_active = 1, priority = 140, meta_json = '{}'
WHERE key = 'natal.house.10.ruler.uranus.sign.any' AND locale = 'ru-RU' AND topic_category = 'career';

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.10.ruler.uranus.sign.any', 'career', 'ru-RU', 'Управитель 10-го дома по знаку (любой): стиль реализации и манера решений. Это ваш «профессиональный почерк» — как вы действуете, чтобы расти.', 140, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.10.ruler.uranus.sign.any' AND locale = 'ru-RU' AND topic_category = 'career'
);

UPDATE knowledge_items
SET text = 'Управитель 10-го дома по дому (любой): куда уходит энергия карьеры. Дом показывает сферу жизни/задач, через которую проще собирать статус и признание.', is_active = 1, priority = 140, meta_json = '{}'
WHERE key = 'natal.house.10.ruler.uranus.house.any' AND locale = 'ru-RU' AND topic_category = 'career';

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.10.ruler.uranus.house.any', 'career', 'ru-RU', 'Управитель 10-го дома по дому (любой): куда уходит энергия карьеры. Дом показывает сферу жизни/задач, через которую проще собирать статус и признание.', 140, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.10.ruler.uranus.house.any' AND locale = 'ru-RU' AND topic_category = 'career'
);

UPDATE knowledge_items
SET text = 'Управитель 10-го дома: знак + дом (любой) — практическая сборка карьеры. Знак даёт стиль, дом — площадку, а вместе они показывают стратегию, которая повторяемо даёт результат.', is_active = 1, priority = 140, meta_json = '{}'
WHERE key = 'natal.house.10.ruler.uranus.sign.any.house.any' AND locale = 'ru-RU' AND topic_category = 'career';

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.10.ruler.uranus.sign.any.house.any', 'career', 'ru-RU', 'Управитель 10-го дома: знак + дом (любой) — практическая сборка карьеры. Знак даёт стиль, дом — площадку, а вместе они показывают стратегию, которая повторяемо даёт результат.', 140, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.10.ruler.uranus.sign.any.house.any' AND locale = 'ru-RU' AND topic_category = 'career'
);

UPDATE knowledge_items
SET text = 'Аспекты управителя 10-го дома описывают динамику карьеры: где идёт ускорение, где — сопротивление, и через какие навыки вы становитесь устойчивее. Смотрите повторяющиеся темы: власть/границы, публичность, коммуникации, риск, обучение.', is_active = 1, priority = 140, meta_json = '{}'
WHERE key = 'natal.house.10.ruler.uranus.aspect.any.any' AND locale = 'ru-RU' AND topic_category = 'career';

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.10.ruler.uranus.aspect.any.any', 'career', 'ru-RU', 'Аспекты управителя 10-го дома описывают динамику карьеры: где идёт ускорение, где — сопротивление, и через какие навыки вы становитесь устойчивее. Смотрите повторяющиеся темы: власть/границы, публичность, коммуникации, риск, обучение.', 140, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.10.ruler.uranus.aspect.any.any' AND locale = 'ru-RU' AND topic_category = 'career'
);

UPDATE knowledge_items
SET text = 'Hard-aspects у управителя 10-го дома означают узлы напряжения в карьерной траектории. Это не «плохо», а требование к стратегии: границы, режим, приоритеты, ясные договорённости и измеримые этапы роста.', is_active = 1, priority = 140, meta_json = '{}'
WHERE key = 'natal.house.10.ruler.uranus.aspect.hard.present' AND locale = 'ru-RU' AND topic_category = 'career';

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.10.ruler.uranus.aspect.hard.present', 'career', 'ru-RU', 'Hard-aspects у управителя 10-го дома означают узлы напряжения в карьерной траектории. Это не «плохо», а требование к стратегии: границы, режим, приоритеты, ясные договорённости и измеримые этапы роста.', 140, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.10.ruler.uranus.aspect.hard.present' AND locale = 'ru-RU' AND topic_category = 'career'
);

UPDATE knowledge_items
SET text = 'Напряжённые аспекты управителя 10-го дома дают рост через вызовы: конкуренцию, дедлайны, давление ожиданий. Рабочая стратегия: план, дисциплина, границы и переговоры.', is_active = 1, priority = 140, meta_json = '{}'
WHERE key = 'natal.house.10.ruler.uranus.aspect.class.tense' AND locale = 'ru-RU' AND topic_category = 'career';

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.10.ruler.uranus.aspect.class.tense', 'career', 'ru-RU', 'Напряжённые аспекты управителя 10-го дома дают рост через вызовы: конкуренцию, дедлайны, давление ожиданий. Рабочая стратегия: план, дисциплина, границы и переговоры.', 140, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.10.ruler.uranus.aspect.class.tense' AND locale = 'ru-RU' AND topic_category = 'career'
);

UPDATE knowledge_items
SET text = 'Гармоничные аспекты управителя 10-го дома дают поддержку: легче находить союзников и развивать компетенции. Главное — закреплять успех практикой и системностью.', is_active = 1, priority = 140, meta_json = '{}'
WHERE key = 'natal.house.10.ruler.uranus.aspect.class.harmonic' AND locale = 'ru-RU' AND topic_category = 'career';

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.10.ruler.uranus.aspect.class.harmonic', 'career', 'ru-RU', 'Гармоничные аспекты управителя 10-го дома дают поддержку: легче находить союзников и развивать компетенции. Главное — закреплять успех практикой и системностью.', 140, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.10.ruler.uranus.aspect.class.harmonic' AND locale = 'ru-RU' AND topic_category = 'career'
);

UPDATE knowledge_items
SET text = 'Аспект управителя 10-го дома к MC усиливает заметность и связывает личные решения с публичной ролью. Нужна ясная цель.', is_active = 1, priority = 140, meta_json = '{}'
WHERE key = 'natal.house.10.ruler.uranus.aspect.any.with.angle.mc' AND locale = 'ru-RU' AND topic_category = 'career';

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.10.ruler.uranus.aspect.any.with.angle.mc', 'career', 'ru-RU', 'Аспект управителя 10-го дома к MC усиливает заметность и связывает личные решения с публичной ролью. Нужна ясная цель.', 140, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.10.ruler.uranus.aspect.any.with.angle.mc' AND locale = 'ru-RU' AND topic_category = 'career'
);

UPDATE knowledge_items
SET text = 'Аспект управителя 10-го дома к ASC связывает карьеру с личным образом: важно управлять впечатлением и стилем самопрезентации.', is_active = 1, priority = 140, meta_json = '{}'
WHERE key = 'natal.house.10.ruler.uranus.aspect.any.with.angle.asc' AND locale = 'ru-RU' AND topic_category = 'career';

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.10.ruler.uranus.aspect.any.with.angle.asc', 'career', 'ru-RU', 'Аспект управителя 10-го дома к ASC связывает карьеру с личным образом: важно управлять впечатлением и стилем самопрезентации.', 140, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.10.ruler.uranus.aspect.any.with.angle.asc' AND locale = 'ru-RU' AND topic_category = 'career'
);

UPDATE knowledge_items
SET text = 'Аспект управителя 10-го дома к IC связывает карьеру с домом/опорой: баланс приватного и публичного — ключ к устойчивости.', is_active = 1, priority = 140, meta_json = '{}'
WHERE key = 'natal.house.10.ruler.uranus.aspect.any.with.angle.ic' AND locale = 'ru-RU' AND topic_category = 'career';

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.10.ruler.uranus.aspect.any.with.angle.ic', 'career', 'ru-RU', 'Аспект управителя 10-го дома к IC связывает карьеру с домом/опорой: баланс приватного и публичного — ключ к устойчивости.', 140, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.10.ruler.uranus.aspect.any.with.angle.ic' AND locale = 'ru-RU' AND topic_category = 'career'
);

UPDATE knowledge_items
SET text = 'Аспект управителя 10-го дома к DSC связывает успех с партнёрствами и клиентами: важны договорённости и качество отношений.', is_active = 1, priority = 140, meta_json = '{}'
WHERE key = 'natal.house.10.ruler.uranus.aspect.any.with.angle.dsc' AND locale = 'ru-RU' AND topic_category = 'career';

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.10.ruler.uranus.aspect.any.with.angle.dsc', 'career', 'ru-RU', 'Аспект управителя 10-го дома к DSC связывает успех с партнёрствами и клиентами: важны договорённости и качество отношений.', 140, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.10.ruler.uranus.aspect.any.with.angle.dsc' AND locale = 'ru-RU' AND topic_category = 'career'
);

UPDATE knowledge_items
SET text = 'Когда управитель 10-го дома — Нептун, карьера растёт через качества Нептун: то, как вы принимаете решения, действуете и создаёте результат. Смотрите знак/дом управителя и аспекты: они подскажут, где усиливать навык и где ставить границы.', is_active = 1, priority = 140, meta_json = '{}'
WHERE key = 'natal.house.10.ruler.neptune' AND locale = 'ru-RU' AND topic_category = 'career';

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.10.ruler.neptune', 'career', 'ru-RU', 'Когда управитель 10-го дома — Нептун, карьера растёт через качества Нептун: то, как вы принимаете решения, действуете и создаёте результат. Смотрите знак/дом управителя и аспекты: они подскажут, где усиливать навык и где ставить границы.', 140, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.10.ruler.neptune' AND locale = 'ru-RU' AND topic_category = 'career'
);

UPDATE knowledge_items
SET text = 'Управитель 10-го дома по знаку (любой): стиль реализации и манера решений. Это ваш «профессиональный почерк» — как вы действуете, чтобы расти.', is_active = 1, priority = 140, meta_json = '{}'
WHERE key = 'natal.house.10.ruler.neptune.sign.any' AND locale = 'ru-RU' AND topic_category = 'career';

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.10.ruler.neptune.sign.any', 'career', 'ru-RU', 'Управитель 10-го дома по знаку (любой): стиль реализации и манера решений. Это ваш «профессиональный почерк» — как вы действуете, чтобы расти.', 140, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.10.ruler.neptune.sign.any' AND locale = 'ru-RU' AND topic_category = 'career'
);

UPDATE knowledge_items
SET text = 'Управитель 10-го дома по дому (любой): куда уходит энергия карьеры. Дом показывает сферу жизни/задач, через которую проще собирать статус и признание.', is_active = 1, priority = 140, meta_json = '{}'
WHERE key = 'natal.house.10.ruler.neptune.house.any' AND locale = 'ru-RU' AND topic_category = 'career';

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.10.ruler.neptune.house.any', 'career', 'ru-RU', 'Управитель 10-го дома по дому (любой): куда уходит энергия карьеры. Дом показывает сферу жизни/задач, через которую проще собирать статус и признание.', 140, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.10.ruler.neptune.house.any' AND locale = 'ru-RU' AND topic_category = 'career'
);

UPDATE knowledge_items
SET text = 'Управитель 10-го дома: знак + дом (любой) — практическая сборка карьеры. Знак даёт стиль, дом — площадку, а вместе они показывают стратегию, которая повторяемо даёт результат.', is_active = 1, priority = 140, meta_json = '{}'
WHERE key = 'natal.house.10.ruler.neptune.sign.any.house.any' AND locale = 'ru-RU' AND topic_category = 'career';

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.10.ruler.neptune.sign.any.house.any', 'career', 'ru-RU', 'Управитель 10-го дома: знак + дом (любой) — практическая сборка карьеры. Знак даёт стиль, дом — площадку, а вместе они показывают стратегию, которая повторяемо даёт результат.', 140, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.10.ruler.neptune.sign.any.house.any' AND locale = 'ru-RU' AND topic_category = 'career'
);

UPDATE knowledge_items
SET text = 'Аспекты управителя 10-го дома описывают динамику карьеры: где идёт ускорение, где — сопротивление, и через какие навыки вы становитесь устойчивее. Смотрите повторяющиеся темы: власть/границы, публичность, коммуникации, риск, обучение.', is_active = 1, priority = 140, meta_json = '{}'
WHERE key = 'natal.house.10.ruler.neptune.aspect.any.any' AND locale = 'ru-RU' AND topic_category = 'career';

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.10.ruler.neptune.aspect.any.any', 'career', 'ru-RU', 'Аспекты управителя 10-го дома описывают динамику карьеры: где идёт ускорение, где — сопротивление, и через какие навыки вы становитесь устойчивее. Смотрите повторяющиеся темы: власть/границы, публичность, коммуникации, риск, обучение.', 140, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.10.ruler.neptune.aspect.any.any' AND locale = 'ru-RU' AND topic_category = 'career'
);

UPDATE knowledge_items
SET text = 'Hard-aspects у управителя 10-го дома означают узлы напряжения в карьерной траектории. Это не «плохо», а требование к стратегии: границы, режим, приоритеты, ясные договорённости и измеримые этапы роста.', is_active = 1, priority = 140, meta_json = '{}'
WHERE key = 'natal.house.10.ruler.neptune.aspect.hard.present' AND locale = 'ru-RU' AND topic_category = 'career';

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.10.ruler.neptune.aspect.hard.present', 'career', 'ru-RU', 'Hard-aspects у управителя 10-го дома означают узлы напряжения в карьерной траектории. Это не «плохо», а требование к стратегии: границы, режим, приоритеты, ясные договорённости и измеримые этапы роста.', 140, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.10.ruler.neptune.aspect.hard.present' AND locale = 'ru-RU' AND topic_category = 'career'
);

UPDATE knowledge_items
SET text = 'Напряжённые аспекты управителя 10-го дома дают рост через вызовы: конкуренцию, дедлайны, давление ожиданий. Рабочая стратегия: план, дисциплина, границы и переговоры.', is_active = 1, priority = 140, meta_json = '{}'
WHERE key = 'natal.house.10.ruler.neptune.aspect.class.tense' AND locale = 'ru-RU' AND topic_category = 'career';

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.10.ruler.neptune.aspect.class.tense', 'career', 'ru-RU', 'Напряжённые аспекты управителя 10-го дома дают рост через вызовы: конкуренцию, дедлайны, давление ожиданий. Рабочая стратегия: план, дисциплина, границы и переговоры.', 140, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.10.ruler.neptune.aspect.class.tense' AND locale = 'ru-RU' AND topic_category = 'career'
);

UPDATE knowledge_items
SET text = 'Гармоничные аспекты управителя 10-го дома дают поддержку: легче находить союзников и развивать компетенции. Главное — закреплять успех практикой и системностью.', is_active = 1, priority = 140, meta_json = '{}'
WHERE key = 'natal.house.10.ruler.neptune.aspect.class.harmonic' AND locale = 'ru-RU' AND topic_category = 'career';

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.10.ruler.neptune.aspect.class.harmonic', 'career', 'ru-RU', 'Гармоничные аспекты управителя 10-го дома дают поддержку: легче находить союзников и развивать компетенции. Главное — закреплять успех практикой и системностью.', 140, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.10.ruler.neptune.aspect.class.harmonic' AND locale = 'ru-RU' AND topic_category = 'career'
);

UPDATE knowledge_items
SET text = 'Аспект управителя 10-го дома к MC усиливает заметность и связывает личные решения с публичной ролью. Нужна ясная цель.', is_active = 1, priority = 140, meta_json = '{}'
WHERE key = 'natal.house.10.ruler.neptune.aspect.any.with.angle.mc' AND locale = 'ru-RU' AND topic_category = 'career';

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.10.ruler.neptune.aspect.any.with.angle.mc', 'career', 'ru-RU', 'Аспект управителя 10-го дома к MC усиливает заметность и связывает личные решения с публичной ролью. Нужна ясная цель.', 140, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.10.ruler.neptune.aspect.any.with.angle.mc' AND locale = 'ru-RU' AND topic_category = 'career'
);

UPDATE knowledge_items
SET text = 'Аспект управителя 10-го дома к ASC связывает карьеру с личным образом: важно управлять впечатлением и стилем самопрезентации.', is_active = 1, priority = 140, meta_json = '{}'
WHERE key = 'natal.house.10.ruler.neptune.aspect.any.with.angle.asc' AND locale = 'ru-RU' AND topic_category = 'career';

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.10.ruler.neptune.aspect.any.with.angle.asc', 'career', 'ru-RU', 'Аспект управителя 10-го дома к ASC связывает карьеру с личным образом: важно управлять впечатлением и стилем самопрезентации.', 140, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.10.ruler.neptune.aspect.any.with.angle.asc' AND locale = 'ru-RU' AND topic_category = 'career'
);

UPDATE knowledge_items
SET text = 'Аспект управителя 10-го дома к IC связывает карьеру с домом/опорой: баланс приватного и публичного — ключ к устойчивости.', is_active = 1, priority = 140, meta_json = '{}'
WHERE key = 'natal.house.10.ruler.neptune.aspect.any.with.angle.ic' AND locale = 'ru-RU' AND topic_category = 'career';

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.10.ruler.neptune.aspect.any.with.angle.ic', 'career', 'ru-RU', 'Аспект управителя 10-го дома к IC связывает карьеру с домом/опорой: баланс приватного и публичного — ключ к устойчивости.', 140, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.10.ruler.neptune.aspect.any.with.angle.ic' AND locale = 'ru-RU' AND topic_category = 'career'
);

UPDATE knowledge_items
SET text = 'Аспект управителя 10-го дома к DSC связывает успех с партнёрствами и клиентами: важны договорённости и качество отношений.', is_active = 1, priority = 140, meta_json = '{}'
WHERE key = 'natal.house.10.ruler.neptune.aspect.any.with.angle.dsc' AND locale = 'ru-RU' AND topic_category = 'career';

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.10.ruler.neptune.aspect.any.with.angle.dsc', 'career', 'ru-RU', 'Аспект управителя 10-го дома к DSC связывает успех с партнёрствами и клиентами: важны договорённости и качество отношений.', 140, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.10.ruler.neptune.aspect.any.with.angle.dsc' AND locale = 'ru-RU' AND topic_category = 'career'
);

UPDATE knowledge_items
SET text = 'Когда управитель 10-го дома — Плутон, карьера растёт через качества Плутон: то, как вы принимаете решения, действуете и создаёте результат. Смотрите знак/дом управителя и аспекты: они подскажут, где усиливать навык и где ставить границы.', is_active = 1, priority = 140, meta_json = '{}'
WHERE key = 'natal.house.10.ruler.pluto' AND locale = 'ru-RU' AND topic_category = 'career';

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.10.ruler.pluto', 'career', 'ru-RU', 'Когда управитель 10-го дома — Плутон, карьера растёт через качества Плутон: то, как вы принимаете решения, действуете и создаёте результат. Смотрите знак/дом управителя и аспекты: они подскажут, где усиливать навык и где ставить границы.', 140, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.10.ruler.pluto' AND locale = 'ru-RU' AND topic_category = 'career'
);

UPDATE knowledge_items
SET text = 'Управитель 10-го дома по знаку (любой): стиль реализации и манера решений. Это ваш «профессиональный почерк» — как вы действуете, чтобы расти.', is_active = 1, priority = 140, meta_json = '{}'
WHERE key = 'natal.house.10.ruler.pluto.sign.any' AND locale = 'ru-RU' AND topic_category = 'career';

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.10.ruler.pluto.sign.any', 'career', 'ru-RU', 'Управитель 10-го дома по знаку (любой): стиль реализации и манера решений. Это ваш «профессиональный почерк» — как вы действуете, чтобы расти.', 140, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.10.ruler.pluto.sign.any' AND locale = 'ru-RU' AND topic_category = 'career'
);

UPDATE knowledge_items
SET text = 'Управитель 10-го дома по дому (любой): куда уходит энергия карьеры. Дом показывает сферу жизни/задач, через которую проще собирать статус и признание.', is_active = 1, priority = 140, meta_json = '{}'
WHERE key = 'natal.house.10.ruler.pluto.house.any' AND locale = 'ru-RU' AND topic_category = 'career';

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.10.ruler.pluto.house.any', 'career', 'ru-RU', 'Управитель 10-го дома по дому (любой): куда уходит энергия карьеры. Дом показывает сферу жизни/задач, через которую проще собирать статус и признание.', 140, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.10.ruler.pluto.house.any' AND locale = 'ru-RU' AND topic_category = 'career'
);

UPDATE knowledge_items
SET text = 'Управитель 10-го дома: знак + дом (любой) — практическая сборка карьеры. Знак даёт стиль, дом — площадку, а вместе они показывают стратегию, которая повторяемо даёт результат.', is_active = 1, priority = 140, meta_json = '{}'
WHERE key = 'natal.house.10.ruler.pluto.sign.any.house.any' AND locale = 'ru-RU' AND topic_category = 'career';

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.10.ruler.pluto.sign.any.house.any', 'career', 'ru-RU', 'Управитель 10-го дома: знак + дом (любой) — практическая сборка карьеры. Знак даёт стиль, дом — площадку, а вместе они показывают стратегию, которая повторяемо даёт результат.', 140, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.10.ruler.pluto.sign.any.house.any' AND locale = 'ru-RU' AND topic_category = 'career'
);

UPDATE knowledge_items
SET text = 'Аспекты управителя 10-го дома описывают динамику карьеры: где идёт ускорение, где — сопротивление, и через какие навыки вы становитесь устойчивее. Смотрите повторяющиеся темы: власть/границы, публичность, коммуникации, риск, обучение.', is_active = 1, priority = 140, meta_json = '{}'
WHERE key = 'natal.house.10.ruler.pluto.aspect.any.any' AND locale = 'ru-RU' AND topic_category = 'career';

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.10.ruler.pluto.aspect.any.any', 'career', 'ru-RU', 'Аспекты управителя 10-го дома описывают динамику карьеры: где идёт ускорение, где — сопротивление, и через какие навыки вы становитесь устойчивее. Смотрите повторяющиеся темы: власть/границы, публичность, коммуникации, риск, обучение.', 140, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.10.ruler.pluto.aspect.any.any' AND locale = 'ru-RU' AND topic_category = 'career'
);

UPDATE knowledge_items
SET text = 'Hard-aspects у управителя 10-го дома означают узлы напряжения в карьерной траектории. Это не «плохо», а требование к стратегии: границы, режим, приоритеты, ясные договорённости и измеримые этапы роста.', is_active = 1, priority = 140, meta_json = '{}'
WHERE key = 'natal.house.10.ruler.pluto.aspect.hard.present' AND locale = 'ru-RU' AND topic_category = 'career';

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.10.ruler.pluto.aspect.hard.present', 'career', 'ru-RU', 'Hard-aspects у управителя 10-го дома означают узлы напряжения в карьерной траектории. Это не «плохо», а требование к стратегии: границы, режим, приоритеты, ясные договорённости и измеримые этапы роста.', 140, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.10.ruler.pluto.aspect.hard.present' AND locale = 'ru-RU' AND topic_category = 'career'
);

UPDATE knowledge_items
SET text = 'Напряжённые аспекты управителя 10-го дома дают рост через вызовы: конкуренцию, дедлайны, давление ожиданий. Рабочая стратегия: план, дисциплина, границы и переговоры.', is_active = 1, priority = 140, meta_json = '{}'
WHERE key = 'natal.house.10.ruler.pluto.aspect.class.tense' AND locale = 'ru-RU' AND topic_category = 'career';

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.10.ruler.pluto.aspect.class.tense', 'career', 'ru-RU', 'Напряжённые аспекты управителя 10-го дома дают рост через вызовы: конкуренцию, дедлайны, давление ожиданий. Рабочая стратегия: план, дисциплина, границы и переговоры.', 140, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.10.ruler.pluto.aspect.class.tense' AND locale = 'ru-RU' AND topic_category = 'career'
);

UPDATE knowledge_items
SET text = 'Гармоничные аспекты управителя 10-го дома дают поддержку: легче находить союзников и развивать компетенции. Главное — закреплять успех практикой и системностью.', is_active = 1, priority = 140, meta_json = '{}'
WHERE key = 'natal.house.10.ruler.pluto.aspect.class.harmonic' AND locale = 'ru-RU' AND topic_category = 'career';

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.10.ruler.pluto.aspect.class.harmonic', 'career', 'ru-RU', 'Гармоничные аспекты управителя 10-го дома дают поддержку: легче находить союзников и развивать компетенции. Главное — закреплять успех практикой и системностью.', 140, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.10.ruler.pluto.aspect.class.harmonic' AND locale = 'ru-RU' AND topic_category = 'career'
);

UPDATE knowledge_items
SET text = 'Аспект управителя 10-го дома к MC усиливает заметность и связывает личные решения с публичной ролью. Нужна ясная цель.', is_active = 1, priority = 140, meta_json = '{}'
WHERE key = 'natal.house.10.ruler.pluto.aspect.any.with.angle.mc' AND locale = 'ru-RU' AND topic_category = 'career';

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.10.ruler.pluto.aspect.any.with.angle.mc', 'career', 'ru-RU', 'Аспект управителя 10-го дома к MC усиливает заметность и связывает личные решения с публичной ролью. Нужна ясная цель.', 140, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.10.ruler.pluto.aspect.any.with.angle.mc' AND locale = 'ru-RU' AND topic_category = 'career'
);

UPDATE knowledge_items
SET text = 'Аспект управителя 10-го дома к ASC связывает карьеру с личным образом: важно управлять впечатлением и стилем самопрезентации.', is_active = 1, priority = 140, meta_json = '{}'
WHERE key = 'natal.house.10.ruler.pluto.aspect.any.with.angle.asc' AND locale = 'ru-RU' AND topic_category = 'career';

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.10.ruler.pluto.aspect.any.with.angle.asc', 'career', 'ru-RU', 'Аспект управителя 10-го дома к ASC связывает карьеру с личным образом: важно управлять впечатлением и стилем самопрезентации.', 140, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.10.ruler.pluto.aspect.any.with.angle.asc' AND locale = 'ru-RU' AND topic_category = 'career'
);

UPDATE knowledge_items
SET text = 'Аспект управителя 10-го дома к IC связывает карьеру с домом/опорой: баланс приватного и публичного — ключ к устойчивости.', is_active = 1, priority = 140, meta_json = '{}'
WHERE key = 'natal.house.10.ruler.pluto.aspect.any.with.angle.ic' AND locale = 'ru-RU' AND topic_category = 'career';

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.10.ruler.pluto.aspect.any.with.angle.ic', 'career', 'ru-RU', 'Аспект управителя 10-го дома к IC связывает карьеру с домом/опорой: баланс приватного и публичного — ключ к устойчивости.', 140, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.10.ruler.pluto.aspect.any.with.angle.ic' AND locale = 'ru-RU' AND topic_category = 'career'
);

UPDATE knowledge_items
SET text = 'Аспект управителя 10-го дома к DSC связывает успех с партнёрствами и клиентами: важны договорённости и качество отношений.', is_active = 1, priority = 140, meta_json = '{}'
WHERE key = 'natal.house.10.ruler.pluto.aspect.any.with.angle.dsc' AND locale = 'ru-RU' AND topic_category = 'career';

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.10.ruler.pluto.aspect.any.with.angle.dsc', 'career', 'ru-RU', 'Аспект управителя 10-го дома к DSC связывает успех с партнёрствами и клиентами: важны договорённости и качество отношений.', 140, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.10.ruler.pluto.aspect.any.with.angle.dsc' AND locale = 'ru-RU' AND topic_category = 'career'
);

UPDATE knowledge_items
SET text = 'Аспекты управителя 10-го дома описывают динамику карьеры: где идёт ускорение, где — сопротивление, и через какие навыки вы становитесь устойчивее. Смотрите повторяющиеся темы: власть/границы, публичность, коммуникации, риск, обучение.', is_active = 1, priority = 140, meta_json = '{}'
WHERE key = 'natal.house.10.ruler.aspect.any.any' AND locale = 'ru-RU' AND topic_category = 'career';

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.10.ruler.aspect.any.any', 'career', 'ru-RU', 'Аспекты управителя 10-го дома описывают динамику карьеры: где идёт ускорение, где — сопротивление, и через какие навыки вы становитесь устойчивее. Смотрите повторяющиеся темы: власть/границы, публичность, коммуникации, риск, обучение.', 140, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.10.ruler.aspect.any.any' AND locale = 'ru-RU' AND topic_category = 'career'
);

UPDATE knowledge_items
SET text = 'Hard-aspects у управителя 10-го дома означают узлы напряжения в карьерной траектории. Это не «плохо», а требование к стратегии: границы, режим, приоритеты, ясные договорённости и измеримые этапы роста.', is_active = 1, priority = 140, meta_json = '{}'
WHERE key = 'natal.house.10.ruler.aspect.hard.present' AND locale = 'ru-RU' AND topic_category = 'career';

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.10.ruler.aspect.hard.present', 'career', 'ru-RU', 'Hard-aspects у управителя 10-го дома означают узлы напряжения в карьерной траектории. Это не «плохо», а требование к стратегии: границы, режим, приоритеты, ясные договорённости и измеримые этапы роста.', 140, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.10.ruler.aspect.hard.present' AND locale = 'ru-RU' AND topic_category = 'career'
);

UPDATE knowledge_items
SET text = 'Напряжённые аспекты управителя 10-го дома дают рост через вызовы: конкуренцию, дедлайны, давление ожиданий. Рабочая стратегия: план, дисциплина, границы и переговоры.', is_active = 1, priority = 140, meta_json = '{}'
WHERE key = 'natal.house.10.ruler.aspect.class.tense' AND locale = 'ru-RU' AND topic_category = 'career';

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.10.ruler.aspect.class.tense', 'career', 'ru-RU', 'Напряжённые аспекты управителя 10-го дома дают рост через вызовы: конкуренцию, дедлайны, давление ожиданий. Рабочая стратегия: план, дисциплина, границы и переговоры.', 140, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.10.ruler.aspect.class.tense' AND locale = 'ru-RU' AND topic_category = 'career'
);

UPDATE knowledge_items
SET text = 'Гармоничные аспекты управителя 10-го дома дают поддержку: легче находить союзников и развивать компетенции. Главное — закреплять успех практикой и системностью.', is_active = 1, priority = 140, meta_json = '{}'
WHERE key = 'natal.house.10.ruler.aspect.class.harmonic' AND locale = 'ru-RU' AND topic_category = 'career';

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.10.ruler.aspect.class.harmonic', 'career', 'ru-RU', 'Гармоничные аспекты управителя 10-го дома дают поддержку: легче находить союзников и развивать компетенции. Главное — закреплять успех практикой и системностью.', 140, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.10.ruler.aspect.class.harmonic' AND locale = 'ru-RU' AND topic_category = 'career'
);

UPDATE knowledge_items
SET text = 'Аспект управителя 10-го дома к MC усиливает заметность и связывает личные решения с публичной ролью. Нужна ясная цель.', is_active = 1, priority = 140, meta_json = '{}'
WHERE key = 'natal.house.10.ruler.aspect.with.angle.mc' AND locale = 'ru-RU' AND topic_category = 'career';

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.10.ruler.aspect.with.angle.mc', 'career', 'ru-RU', 'Аспект управителя 10-го дома к MC усиливает заметность и связывает личные решения с публичной ролью. Нужна ясная цель.', 140, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.10.ruler.aspect.with.angle.mc' AND locale = 'ru-RU' AND topic_category = 'career'
);

UPDATE knowledge_items
SET text = 'Аспект управителя 10-го дома к ASC связывает карьеру с личным образом: важно управлять впечатлением и стилем самопрезентации.', is_active = 1, priority = 140, meta_json = '{}'
WHERE key = 'natal.house.10.ruler.aspect.with.angle.asc' AND locale = 'ru-RU' AND topic_category = 'career';

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.10.ruler.aspect.with.angle.asc', 'career', 'ru-RU', 'Аспект управителя 10-го дома к ASC связывает карьеру с личным образом: важно управлять впечатлением и стилем самопрезентации.', 140, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.10.ruler.aspect.with.angle.asc' AND locale = 'ru-RU' AND topic_category = 'career'
);

UPDATE knowledge_items
SET text = 'Аспект управителя 10-го дома к IC связывает карьеру с домом/опорой: баланс приватного и публичного — ключ к устойчивости.', is_active = 1, priority = 140, meta_json = '{}'
WHERE key = 'natal.house.10.ruler.aspect.with.angle.ic' AND locale = 'ru-RU' AND topic_category = 'career';

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.10.ruler.aspect.with.angle.ic', 'career', 'ru-RU', 'Аспект управителя 10-го дома к IC связывает карьеру с домом/опорой: баланс приватного и публичного — ключ к устойчивости.', 140, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.10.ruler.aspect.with.angle.ic' AND locale = 'ru-RU' AND topic_category = 'career'
);

UPDATE knowledge_items
SET text = 'Аспект управителя 10-го дома к DSC связывает успех с партнёрствами и клиентами: важны договорённости и качество отношений.', is_active = 1, priority = 140, meta_json = '{}'
WHERE key = 'natal.house.10.ruler.aspect.with.angle.dsc' AND locale = 'ru-RU' AND topic_category = 'career';

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.10.ruler.aspect.with.angle.dsc', 'career', 'ru-RU', 'Аспект управителя 10-го дома к DSC связывает успех с партнёрствами и клиентами: важны договорённости и качество отношений.', 140, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.10.ruler.aspect.with.angle.dsc' AND locale = 'ru-RU' AND topic_category = 'career'
);

COMMIT;

