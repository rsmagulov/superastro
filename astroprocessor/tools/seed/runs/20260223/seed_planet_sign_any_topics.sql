-- astroprocessor/tools/seed/seed_planet_sign_any_topics.sql
-- Topic-specific planet-sign-any scaffolds (works even when subject.unknown_time = 1)
BEGIN;

-- LOVE / INTIMACY
INSERT OR IGNORE INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
VALUES
('natal.planet.venus.sign.any', 'love_intimacy', 'ru-RU', 'Венера: как вы проявляете симпатию, что считаете “красивым” и как формируется притяжение.', 95, strftime('%s','now'), 1, '{}'),
('natal.planet.mars.sign.any',  'love_intimacy', 'ru-RU', 'Марс: стиль желания, инициативы и “искры”; что заводит и как вы действуете в сближении.', 95, strftime('%s','now'), 1, '{}'),
('natal.planet.moon.sign.any',  'love_intimacy', 'ru-RU', 'Луна: эмоциональные потребности в близости, чувство безопасности и привычный способ привязанности.', 95, strftime('%s','now'), 1, '{}');

-- PARTNERSHIP / MARRIAGE
INSERT OR IGNORE INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
VALUES
('natal.planet.venus.sign.any',  'partnership_marriage', 'ru-RU', 'Венера (союз): как вы строите баланс, заботу и взаимность в отношениях.', 95, strftime('%s','now'), 1, '{}'),
('natal.planet.saturn.sign.any', 'partnership_marriage', 'ru-RU', 'Сатурн (союз): правила, ответственность и долговременность; что удерживает отношения “на рельсах”.', 95, strftime('%s','now'), 1, '{}'),
('natal.planet.moon.sign.any',   'partnership_marriage', 'ru-RU', 'Луна (союз): эмоциональный контракт в паре — что даёт ощущение дома и поддержки.', 95, strftime('%s','now'), 1, '{}');

-- CAREER
INSERT OR IGNORE INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
VALUES
('natal.planet.saturn.sign.any',  'career', 'ru-RU', 'Сатурн (карьера): дисциплина, структура, ответственность и рост через мастерство.', 95, strftime('%s','now'), 1, '{}'),
('natal.planet.jupiter.sign.any', 'career', 'ru-RU', 'Юпитер (карьера): расширение возможностей, наставники, признание и рост через смысл.', 95, strftime('%s','now'), 1, '{}');

-- MONEY
INSERT OR IGNORE INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
VALUES
('natal.planet.venus.sign.any',   'money', 'ru-RU', 'Венера (деньги): вкус, ценности и способы притягивать ресурсы через качество/пользу.', 95, strftime('%s','now'), 1, '{}'),
('natal.planet.jupiter.sign.any', 'money', 'ru-RU', 'Юпитер (деньги): источники роста дохода, удачные стратегии и расширение финансового горизонта.', 95, strftime('%s','now'), 1, '{}');

COMMIT;