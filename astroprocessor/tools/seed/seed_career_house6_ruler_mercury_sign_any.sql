-- AUTO-GENERATED. DO NOT EDIT BY HAND.

-- Career overrides from debug shortest used blocks (topic_category=career)

-- Source JSON: C:/Projects/superastro/debug_one_house6_mercury_sign_any.json

-- Filter: len(text)<= 200, max_keys=10

BEGIN;

UPDATE knowledge_items
SET text = 'Меркурий как управитель 6-й дом (работа/рутина/процессы и навыки): знак не уточнён (sign.any). Для карьеры важнее сама функция планеты и то, где ты её применяешь. Практика: зафиксируй 2 поведения, которые усиливают Меркурий в работе (например, системность/переговоры/инициатива), и проверь эффект по результатам недели.', is_active = 1, priority = 140, meta_json = '{}'
WHERE key = 'natal.house.6.ruler.mercury.sign.any' AND locale = 'ru-RU' AND topic_category = 'career';

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.6.ruler.mercury.sign.any', 'career', 'ru-RU', 'Меркурий как управитель 6-й дом (работа/рутина/процессы и навыки): знак не уточнён (sign.any). Для карьеры важнее сама функция планеты и то, где ты её применяешь. Практика: зафиксируй 2 поведения, которые усиливают Меркурий в работе (например, системность/переговоры/инициатива), и проверь эффект по результатам недели.', 140, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.6.ruler.mercury.sign.any' AND locale = 'ru-RU' AND topic_category = 'career'
);

COMMIT;

