-- tools/seed/seed_love_intimacy_generic_fixes.sql
-- Purpose: eliminate natal.generic fallbacks for love_intimacy for:
--   planet:jupiter/neptune/pluto/saturn/uranus
--   house ruler pos blocks for houses 5/7/8
--   house:7:planet:pluto
-- Locale: ru-RU

BEGIN;

-- 1) Planet sign keys (topic-specific)
INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, updated_at)
VALUES
('natal.planet.jupiter.sign.cancer','love_intimacy','ru-RU','Юпитер в Раке: в близости важны забота, безопасность и эмоциональная щедрость.',90,strftime('%s','now'),1,strftime('%s','now')),
('natal.planet.saturn.sign.capricorn','love_intimacy','ru-RU','Сатурн в Козероге: отношения укрепляются через ответственность, зрелость и долгосрочные договорённости.',90,strftime('%s','now'),1,strftime('%s','now')),
('natal.planet.uranus.sign.capricorn','love_intimacy','ru-RU','Уран в Козероге: потребность обновлять формат союза и правила, сохраняя свободу внутри структуры.',88,strftime('%s','now'),1,strftime('%s','now')),
('natal.planet.neptune.sign.capricorn','love_intimacy','ru-RU','Нептун в Козероге: склонность идеализировать стабильность; полезны ясные границы и проверка ожиданий.',88,strftime('%s','now'),1,strftime('%s','now')),
('natal.planet.pluto.sign.scorpio','love_intimacy','ru-RU','Плутон в Скорпионе: глубина и интенсивность чувств; важны честность, доверие и работа с ревностью.',92,strftime('%s','now'),1,strftime('%s','now'))
ON CONFLICT(key, topic_category, locale)
DO UPDATE SET text=excluded.text, priority=excluded.priority, is_active=1, updated_at=strftime('%s','now');

-- 2) House ruler POS scaffolds (topic-specific): sign.any / house.any / sign.any.house.any
INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, updated_at)
VALUES
('natal.house.5.ruler.moon.sign.any','love_intimacy','ru-RU','Управитель 5 дома: Луна — стиль романтики раскрывается через эмоции, заботу и отклик на настроение.',84,strftime('%s','now'),1,strftime('%s','now')),
('natal.house.5.ruler.moon.house.any','love_intimacy','ru-RU','Луна как управитель 5 дома: важно, в какую сферу жизни уходит энергия флирта и удовольствия.',83,strftime('%s','now'),1,strftime('%s','now')),
('natal.house.5.ruler.moon.sign.any.house.any','love_intimacy','ru-RU','Луна (упр.5): сочетание знака и дома показывает, как проявляется романтика и что даёт чувство радости.',82,strftime('%s','now'),1,strftime('%s','now')),

('natal.house.7.ruler.venus.sign.any','love_intimacy','ru-RU','Управитель 7 дома: Венера — отношения строятся через гармонию, симпатию, ценности и взаимный вкус.',86,strftime('%s','now'),1,strftime('%s','now')),
('natal.house.7.ruler.venus.house.any','love_intimacy','ru-RU','Венера как управитель 7 дома: её дом показывает, где и как проще всего выстраивать партнёрство.',85,strftime('%s','now'),1,strftime('%s','now')),
('natal.house.7.ruler.venus.sign.any.house.any','love_intimacy','ru-RU','Венера (упр.7): знак+дом помогают понять язык любви и формат договорённостей в союзе.',84,strftime('%s','now'),1,strftime('%s','now')),

('natal.house.8.ruler.mars.sign.any','love_intimacy','ru-RU','Управитель 8 дома: Марс — интимность усиливается через инициативу, страсть и прямое желание.',86,strftime('%s','now'),1,strftime('%s','now')),
('natal.house.8.ruler.mars.house.any','love_intimacy','ru-RU','Марс как управитель 8 дома: его дом показывает, где проявляется интенсивность и тема доверия.',85,strftime('%s','now'),1,strftime('%s','now')),
('natal.house.8.ruler.mars.sign.any.house.any','love_intimacy','ru-RU','Марс (упр.8): знак+дом описывают сценарии близости, напряжения и способы сближения.',84,strftime('%s','now'),1,strftime('%s','now')),

('natal.house.8.ruler.pluto.sign.any','love_intimacy','ru-RU','Альт-управитель 8 дома: Плутон — глубина, трансформация, сильная привязанность и потребность в честности.',86,strftime('%s','now'),1,strftime('%s','now')),
('natal.house.8.ruler.pluto.house.any','love_intimacy','ru-RU','Плутон как управитель 8 дома: его дом показывает, где проживаются кризисы, слияние и перерождение.',85,strftime('%s','now'),1,strftime('%s','now')),
('natal.house.8.ruler.pluto.sign.any.house.any','love_intimacy','ru-RU','Плутон (упр.8): знак+дом дают ключ к теме границ, доверия и внутренней силы в интимности.',84,strftime('%s','now'),1,strftime('%s','now'))
ON CONFLICT(key, topic_category, locale)
DO UPDATE SET text=excluded.text, priority=excluded.priority, is_active=1, updated_at=strftime('%s','now');

-- 3) House planet presence (topic-specific)
INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, updated_at)
VALUES
('natal.house.7.planet.pluto','love_intimacy','ru-RU','Плутон в 7 доме усиливает интенсивность партнёрства: важны равновесие сил, честность и умение договариваться.',90,strftime('%s','now'),1,strftime('%s','now'))
ON CONFLICT(key, topic_category, locale)
DO UPDATE SET text=excluded.text, priority=excluded.priority, is_active=1, updated_at=strftime('%s','now');

COMMIT;