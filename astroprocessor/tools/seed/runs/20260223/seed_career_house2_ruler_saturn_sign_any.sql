-- AUTO-GENERATED. DO NOT EDIT BY HAND.

-- Career overrides from debug shortest used blocks (topic_category=career)

-- Source JSON: C:/Projects/superastro/debug_one_house2_ruler_saturn_sign_any.json

-- Filter: len(text)<= 200, max_keys=10

BEGIN;

UPDATE knowledge_items
SET text = 'Сатурн как управитель 2-й дом (деньги/ресурсы/монетизация): знак не уточнён (sign.any). Для карьеры важнее сама функция планеты и то, где ты её применяешь. Практика: зафиксируй 2 поведения, которые усиливают Сатурн в работе (например, системность/переговоры/инициатива), и проверь эффект по результатам недели.', is_active = 1, priority = 140, meta_json = '{}'
WHERE key = 'natal.house.2.ruler.saturn.sign.any' AND locale = 'ru-RU' AND topic_category = 'career';

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.2.ruler.saturn.sign.any', 'career', 'ru-RU', 'Сатурн как управитель 2-й дом (деньги/ресурсы/монетизация): знак не уточнён (sign.any). Для карьеры важнее сама функция планеты и то, где ты её применяешь. Практика: зафиксируй 2 поведения, которые усиливают Сатурн в работе (например, системность/переговоры/инициатива), и проверь эффект по результатам недели.', 140, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.2.ruler.saturn.sign.any' AND locale = 'ru-RU' AND topic_category = 'career'
);

COMMIT;

