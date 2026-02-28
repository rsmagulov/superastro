BEGIN;
INSERT OR IGNORE INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
VALUES
('natal.house.10.ruler.aspect.class.tense','career','ru-RU','Напряжённые аспекты управителя 10 дома: карьера растёт через задачи, ответственность и настройку стратегии.',85,strftime('%s','now'),1,'{}'),
('natal.house.10.ruler.aspect.class.harmonious','career','ru-RU','Гармоничные аспекты управителя 10 дома: легче находить поддержку и естественные возможности в карьере.',85,strftime('%s','now'),1,'{}'),
('natal.house.10.ruler.aspect.with.angle.mc','career','ru-RU','Связь управителя 10 дома с MC подчёркивает, что именно напрямую “включает” профессиональный вектор.',88,strftime('%s','now'),1,'{}'),

('natal.house.2.ruler.aspect.class.tense','money','ru-RU','Напряжённые аспекты управителя 2 дома: деньги требуют дисциплины, пересмотра ценностей и привычек.',85,strftime('%s','now'),1,'{}'),
('natal.house.2.ruler.aspect.class.harmonious','money','ru-RU','Гармоничные аспекты управителя 2 дома: ресурсы легче накапливать через сильные стороны и устойчивые стратегии.',85,strftime('%s','now'),1,'{}'),

('natal.house.8.ruler.aspect.class.tense','money','ru-RU','Напряжённые аспекты управителя 8 дома: важны ясные правила доверия, рисков и общих обязательств.',85,strftime('%s','now'),1,'{}'),
('natal.house.8.ruler.aspect.class.harmonious','money','ru-RU','Гармоничные аспекты управителя 8 дома: проще выстраивать сотрудничество и долгосрочные финансовые договорённости.',85,strftime('%s','now'),1,'{}'),

('natal.house.7.ruler.aspect.class.tense','love_intimacy','ru-RU','Напряжённые аспекты управителя 7 дома: отношения учат договорённостям, границам и зрелой коммуникации.',85,strftime('%s','now'),1,'{}'),
('natal.house.7.ruler.aspect.class.harmonious','love_intimacy','ru-RU','Гармоничные аспекты управителя 7 дома: легче создавать союз на поддержке и совпадении ценностей.',85,strftime('%s','now'),1,'{}'),
('natal.house.7.ruler.aspect.with.angle.dsc','love_intimacy','ru-RU','Связь управителя 7 дома с DSC делает партнёрскую тему центральной и очень заметной в событиях.',88,strftime('%s','now'),1,'{}'),

('natal.aspect.with.angle.mc','career','ru-RU','Аспекты к MC показывают, какие энергии сильнее всего влияют на карьерную реализацию.',82,strftime('%s','now'),1,'{}'),
('natal.aspect.with.angle.dsc','love_intimacy','ru-RU','Аспекты к DSC подсвечивают ключевые сценарии взаимодействия в паре.',82,strftime('%s','now'),1,'{}');
COMMIT;
