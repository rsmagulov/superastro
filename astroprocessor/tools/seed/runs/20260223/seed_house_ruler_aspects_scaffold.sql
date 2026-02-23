-- astroprocessor/tools/seed/seed_house_ruler_aspects_scaffold.sql
-- Minimal topic-specific scaffolds for house ruler aspect summary keys
-- (class.tense/harmonic, hard.present, with.angle.<mc/dsc>)
BEGIN;

-- =========
-- CAREER: houses 10, 6, 2 (career scaffolding)
-- =========
INSERT OR IGNORE INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
VALUES
('natal.house.10.ruler.aspect.class.tense', 'career', 'ru-RU', 'Управитель 10 дома в напряжённых аспектах: рост через вызовы, давление ответственности, необходимость выстроить систему и границы.', 92, strftime('%s','now'), 1, '{}'),
('natal.house.10.ruler.aspect.class.harmonic', 'career', 'ru-RU', 'Управитель 10 дома в гармоничных аспектах: поддержка окружения, естественный рост статуса, легче находить союзников и возможности.', 92, strftime('%s','now'), 1, '{}'),
('natal.house.10.ruler.aspect.hard.present', 'career', 'ru-RU', 'Есть “жёсткие” аспекты у управителя 10 дома: полезно идти через дисциплину, сроки, постепенное усиление компетенций.', 93, strftime('%s','now'), 1, '{}'),
('natal.house.10.ruler.aspect.with.angle.mc', 'career', 'ru-RU', 'Управитель 10 дома аспектирует MC: карьера и публичная роль сильнее связаны с личными решениями; важны репутация и стратегия.', 94, strftime('%s','now'), 1, '{}'),

('natal.house.6.ruler.aspect.class.tense', 'career', 'ru-RU', 'Управитель 6 дома в напряжённых аспектах: нагрузка/режим требуют настройки; важны привычки, здоровье и управление временем.', 90, strftime('%s','now'), 1, '{}'),
('natal.house.6.ruler.aspect.class.harmonic', 'career', 'ru-RU', 'Управитель 6 дома в гармоничных аспектах: легче выстроить рутину, командную работу и полезные привычки.', 90, strftime('%s','now'), 1, '{}'),
('natal.house.6.ruler.aspect.hard.present', 'career', 'ru-RU', 'Есть “жёсткие” аспекты у управителя 6 дома: следи за выгоранием и делай упор на устойчивый режим.', 91, strftime('%s','now'), 1, '{}'),

('natal.house.2.ruler.aspect.class.tense', 'career', 'ru-RU', 'Управитель 2 дома в напряжённых аспектах: финмодель требует дисциплины; важны границы расходов и понятные источники дохода.', 90, strftime('%s','now'), 1, '{}'),
('natal.house.2.ruler.aspect.class.harmonic', 'career', 'ru-RU', 'Управитель 2 дома в гармоничных аспектах: проще монетизировать навыки и стабилизировать доход.', 90, strftime('%s','now'), 1, '{}'),
('natal.house.2.ruler.aspect.hard.present', 'career', 'ru-RU', 'Есть “жёсткие” аспекты у управителя 2 дома: лучше работают долгий горизонт и финансовые правила.', 91, strftime('%s','now'), 1, '{}');

-- =========
-- MONEY: houses 2, 8
-- =========
INSERT OR IGNORE INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
VALUES
('natal.house.2.ruler.aspect.class.tense', 'money', 'ru-RU', 'Деньги: управитель 2 дома в напряжённых аспектах — доход строится через структуру, контроль рисков и устойчивые навыки.', 92, strftime('%s','now'), 1, '{}'),
('natal.house.2.ruler.aspect.class.harmonic', 'money', 'ru-RU', 'Деньги: управитель 2 дома в гармоничных аспектах — проще наращивать доход и удерживать стабильность.', 92, strftime('%s','now'), 1, '{}'),
('natal.house.2.ruler.aspect.hard.present', 'money', 'ru-RU', 'Деньги: у управителя 2 дома есть жёсткие аспекты — важны планирование и финансовая “подушка”.', 93, strftime('%s','now'), 1, '{}'),

('natal.house.8.ruler.aspect.class.tense', 'money', 'ru-RU', 'Деньги: управитель 8 дома в напряжённых аспектах — осторожнее с кредитами/общими ресурсами; нужны правила доверия и прозрачность.', 92, strftime('%s','now'), 1, '{}'),
('natal.house.8.ruler.aspect.class.harmonic', 'money', 'ru-RU', 'Деньги: управитель 8 дома в гармоничных аспектах — легче договариваться о совместных ресурсах и поддержке.', 92, strftime('%s','now'), 1, '{}'),
('natal.house.8.ruler.aspect.hard.present', 'money', 'ru-RU', 'Деньги: у управителя 8 дома есть жёсткие аспекты — следи за рисками и условиями договорённостей.', 93, strftime('%s','now'), 1, '{}');

-- =========
-- LOVE_INTIMACY: houses 5,7,8 + with.angle.dsc
-- =========
INSERT OR IGNORE INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
VALUES
('natal.house.5.ruler.aspect.class.tense', 'love_intimacy', 'ru-RU', 'Любовь: управитель 5 дома в напряжённых аспектах — романтика требует зрелости; важны честность намерений и границы.', 92, strftime('%s','now'), 1, '{}'),
('natal.house.5.ruler.aspect.class.harmonic', 'love_intimacy', 'ru-RU', 'Любовь: управитель 5 дома в гармоничных аспектах — легче проявлять чувства, флирт и радость от отношений.', 92, strftime('%s','now'), 1, '{}'),
('natal.house.5.ruler.aspect.hard.present', 'love_intimacy', 'ru-RU', 'Любовь: у управителя 5 дома есть жёсткие аспекты — лучше не торопить события и держать курс на уважение.', 93, strftime('%s','now'), 1, '{}'),

('natal.house.7.ruler.aspect.class.tense', 'love_intimacy', 'ru-RU', 'Партнёрство: управитель 7 дома в напряжённых аспектах — отношения учат договариваться и выдерживать конфликты без разрушения.', 92, strftime('%s','now'), 1, '{}'),
('natal.house.7.ruler.aspect.class.harmonic', 'love_intimacy', 'ru-RU', 'Партнёрство: управитель 7 дома в гармоничных аспектах — легче строить “мы”, искать баланс и компромисс.', 92, strftime('%s','now'), 1, '{}'),
('natal.house.7.ruler.aspect.hard.present', 'love_intimacy', 'ru-RU', 'Партнёрство: у управителя 7 дома есть жёсткие аспекты — важны правила общения и навыки конфликта.', 93, strftime('%s','now'), 1, '{}'),
('natal.house.7.ruler.aspect.with.angle.dsc', 'love_intimacy', 'ru-RU', 'Партнёрство: управитель 7 дома аспектирует DSC — тема отношений становится ключевой; важно осознанно выбирать формат союза.', 94, strftime('%s','now'), 1, '{}'),

('natal.house.8.ruler.aspect.class.tense', 'love_intimacy', 'ru-RU', 'Интимность: управитель 8 дома в напряжённых аспектах — глубина требует доверия; важны безопасность и честность.', 92, strftime('%s','now'), 1, '{}'),
('natal.house.8.ruler.aspect.class.harmonic', 'love_intimacy', 'ru-RU', 'Интимность: управитель 8 дома в гармоничных аспектах — легче выстраивать близость и совместные ресурсы.', 92, strftime('%s','now'), 1, '{}'),
('natal.house.8.ruler.aspect.hard.present', 'love_intimacy', 'ru-RU', 'Интимность: у управителя 8 дома есть жёсткие аспекты — двигайся медленнее, укрепляя доверие.', 93, strftime('%s','now'), 1, '{}');

-- =========
-- PARTNERSHIP_MARRIAGE: house 7 + with.angle.dsc
-- =========
INSERT OR IGNORE INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
VALUES
('natal.house.7.ruler.aspect.class.tense', 'partnership_marriage', 'ru-RU', 'Брак/союз: управитель 7 дома в напряжённых аспектах — союз требует правил, зрелой коммуникации и умения договариваться.', 92, strftime('%s','now'), 1, '{}'),
('natal.house.7.ruler.aspect.class.harmonic', 'partnership_marriage', 'ru-RU', 'Брак/союз: управитель 7 дома в гармоничных аспектах — легче строить стабильный формат отношений и поддерживать баланс.', 92, strftime('%s','now'), 1, '{}'),
('natal.house.7.ruler.aspect.hard.present', 'partnership_marriage', 'ru-RU', 'Брак/союз: у управителя 7 дома есть жёсткие аспекты — важны договорённости, распределение ответственности и границы.', 93, strftime('%s','now'), 1, '{}'),
('natal.house.7.ruler.aspect.with.angle.dsc', 'partnership_marriage', 'ru-RU', 'Брак/союз: управитель 7 дома аспектирует DSC — партнёрство становится определяющей темой, влияет на решения и планы.', 94, strftime('%s','now'), 1, '{}');

COMMIT;