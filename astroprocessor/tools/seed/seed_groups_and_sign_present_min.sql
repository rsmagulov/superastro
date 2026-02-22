-- astroprocessor/tools/seed/seed_groups_and_sign_present_min.sql
-- Minimal sqlite-safe idempotent seed (UPDATE + INSERT WHERE NOT EXISTS).
-- Seeds:
--   natal.planets.group.<group>.present
--   natal.planets.group.<group>.count.<n>
--   natal.sign.<sign>.present
-- For ru-RU:
--   - global topic_category '' (fallback)
--   - optional love_intimacy topic_category (so debug=2 shows hits there too)

BEGIN;

-- =========================
-- Planet groups: GLOBAL
-- =========================
UPDATE knowledge_items
SET
  text = 'Группа планет: светила (Солнце и Луна) — базовый тон личности и жизненной энергии.',
  priority = 105,
  is_active = 1,
  meta_json = '{}'
WHERE key = 'natal.planets.group.luminaries.present'
  AND locale = 'ru-RU'
  AND (topic_category = '' OR topic_category IS NULL);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.planets.group.luminaries.present', '', 'ru-RU',
       'Группа планет: светила (Солнце и Луна) — базовый тон личности и жизненной энергии.',
       105, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key='natal.planets.group.luminaries.present'
    AND locale='ru-RU'
    AND (topic_category='' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET
  text = 'Группа планет: личные (Меркурий, Венера, Марс) — мышление, желания и способ действовать.',
  priority = 105,
  is_active = 1,
  meta_json = '{}'
WHERE key = 'natal.planets.group.inner.present'
  AND locale = 'ru-RU'
  AND (topic_category = '' OR topic_category IS NULL);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.planets.group.inner.present', '', 'ru-RU',
       'Группа планет: личные (Меркурий, Венера, Марс) — мышление, желания и способ действовать.',
       105, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key='natal.planets.group.inner.present'
    AND locale='ru-RU'
    AND (topic_category='' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET
  text = 'Группа планет: социальные (Юпитер, Сатурн) — рост, правила и долгосрочные цели.',
  priority = 105,
  is_active = 1,
  meta_json = '{}'
WHERE key = 'natal.planets.group.social.present'
  AND locale = 'ru-RU'
  AND (topic_category = '' OR topic_category IS NULL);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.planets.group.social.present', '', 'ru-RU',
       'Группа планет: социальные (Юпитер, Сатурн) — рост, правила и долгосрочные цели.',
       105, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key='natal.planets.group.social.present'
    AND locale='ru-RU'
    AND (topic_category='' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET
  text = 'Группа планет: высшие (Уран, Нептун, Плутон) — глубинные перемены и большие циклы.',
  priority = 105,
  is_active = 1,
  meta_json = '{}'
WHERE key = 'natal.planets.group.outer.present'
  AND locale = 'ru-RU'
  AND (topic_category = '' OR topic_category IS NULL);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.planets.group.outer.present', '', 'ru-RU',
       'Группа планет: высшие (Уран, Нептун, Плутон) — глубинные перемены и большие циклы.',
       105, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key='natal.planets.group.outer.present'
    AND locale='ru-RU'
    AND (topic_category='' OR topic_category IS NULL)
);

-- Minimal count buckets (GLOBAL): inner 0..3, social 0..2, outer 0..3, luminaries 0..2
-- We seed just one “generic” text per bucket; you can refine later.

-- inner
UPDATE knowledge_items SET text='Сколько личных планет (Меркурий/Венера/Марс) задействовано: 0.', priority=95, is_active=1, meta_json='{}'
WHERE key='natal.planets.group.inner.count.0' AND locale='ru-RU' AND (topic_category='' OR topic_category IS NULL);
INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.planets.group.inner.count.0','', 'ru-RU','Сколько личных планет (Меркурий/Венера/Марс) задействовано: 0.',95,CURRENT_TIMESTAMP,1,'{}'
WHERE NOT EXISTS (SELECT 1 FROM knowledge_items WHERE key='natal.planets.group.inner.count.0' AND locale='ru-RU' AND (topic_category='' OR topic_category IS NULL));

UPDATE knowledge_items SET text='Сколько личных планет (Меркурий/Венера/Марс) задействовано: 1.', priority=95, is_active=1, meta_json='{}'
WHERE key='natal.planets.group.inner.count.1' AND locale='ru-RU' AND (topic_category='' OR topic_category IS NULL);
INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.planets.group.inner.count.1','', 'ru-RU','Сколько личных планет (Меркурий/Венера/Марс) задействовано: 1.',95,CURRENT_TIMESTAMP,1,'{}'
WHERE NOT EXISTS (SELECT 1 FROM knowledge_items WHERE key='natal.planets.group.inner.count.1' AND locale='ru-RU' AND (topic_category='' OR topic_category IS NULL));

UPDATE knowledge_items SET text='Сколько личных планет (Меркурий/Венера/Марс) задействовано: 2.', priority=95, is_active=1, meta_json='{}'
WHERE key='natal.planets.group.inner.count.2' AND locale='ru-RU' AND (topic_category='' OR topic_category IS NULL);
INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.planets.group.inner.count.2','', 'ru-RU','Сколько личных планет (Меркурий/Венера/Марс) задействовано: 2.',95,CURRENT_TIMESTAMP,1,'{}'
WHERE NOT EXISTS (SELECT 1 FROM knowledge_items WHERE key='natal.planets.group.inner.count.2' AND locale='ru-RU' AND (topic_category='' OR topic_category IS NULL));

UPDATE knowledge_items SET text='Сколько личных планет (Меркурий/Венера/Марс) задействовано: 3.', priority=95, is_active=1, meta_json='{}'
WHERE key='natal.planets.group.inner.count.3' AND locale='ru-RU' AND (topic_category='' OR topic_category IS NULL);
INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.planets.group.inner.count.3','', 'ru-RU','Сколько личных планет (Меркурий/Венера/Марс) задействовано: 3.',95,CURRENT_TIMESTAMP,1,'{}'
WHERE NOT EXISTS (SELECT 1 FROM knowledge_items WHERE key='natal.planets.group.inner.count.3' AND locale='ru-RU' AND (topic_category='' OR topic_category IS NULL));

-- social (0..2)
UPDATE knowledge_items SET text='Сколько социальных планет (Юпитер/Сатурн) задействовано: 0.', priority=95, is_active=1, meta_json='{}'
WHERE key='natal.planets.group.social.count.0' AND locale='ru-RU' AND (topic_category='' OR topic_category IS NULL);
INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.planets.group.social.count.0','', 'ru-RU','Сколько социальных планет (Юпитер/Сатурн) задействовано: 0.',95,CURRENT_TIMESTAMP,1,'{}'
WHERE NOT EXISTS (SELECT 1 FROM knowledge_items WHERE key='natal.planets.group.social.count.0' AND locale='ru-RU' AND (topic_category='' OR topic_category IS NULL));

UPDATE knowledge_items SET text='Сколько социальных планет (Юпитер/Сатурн) задействовано: 1.', priority=95, is_active=1, meta_json='{}'
WHERE key='natal.planets.group.social.count.1' AND locale='ru-RU' AND (topic_category='' OR topic_category IS NULL);
INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.planets.group.social.count.1','', 'ru-RU','Сколько социальных планет (Юпитер/Сатурн) задействовано: 1.',95,CURRENT_TIMESTAMP,1,'{}'
WHERE NOT EXISTS (SELECT 1 FROM knowledge_items WHERE key='natal.planets.group.social.count.1' AND locale='ru-RU' AND (topic_category='' OR topic_category IS NULL));

UPDATE knowledge_items SET text='Сколько социальных планет (Юпитер/Сатурн) задействовано: 2.', priority=95, is_active=1, meta_json='{}'
WHERE key='natal.planets.group.social.count.2' AND locale='ru-RU' AND (topic_category='' OR topic_category IS NULL);
INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.planets.group.social.count.2','', 'ru-RU','Сколько социальных планет (Юпитер/Сатурн) задействовано: 2.',95,CURRENT_TIMESTAMP,1,'{}'
WHERE NOT EXISTS (SELECT 1 FROM knowledge_items WHERE key='natal.planets.group.social.count.2' AND locale='ru-RU' AND (topic_category='' OR topic_category IS NULL));

-- outer (0..3)
UPDATE knowledge_items SET text='Сколько высших планет (Уран/Нептун/Плутон) задействовано: 0.', priority=95, is_active=1, meta_json='{}'
WHERE key='natal.planets.group.outer.count.0' AND locale='ru-RU' AND (topic_category='' OR topic_category IS NULL);
INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.planets.group.outer.count.0','', 'ru-RU','Сколько высших планет (Уран/Нептун/Плутон) задействовано: 0.',95,CURRENT_TIMESTAMP,1,'{}'
WHERE NOT EXISTS (SELECT 1 FROM knowledge_items WHERE key='natal.planets.group.outer.count.0' AND locale='ru-RU' AND (topic_category='' OR topic_category IS NULL));

UPDATE knowledge_items SET text='Сколько высших планет (Уран/Нептун/Плутон) задействовано: 1.', priority=95, is_active=1, meta_json='{}'
WHERE key='natal.planets.group.outer.count.1' AND locale='ru-RU' AND (topic_category='' OR topic_category IS NULL);
INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.planets.group.outer.count.1','', 'ru-RU','Сколько высших планет (Уран/Нептун/Плутон) задействовано: 1.',95,CURRENT_TIMESTAMP,1,'{}'
WHERE NOT EXISTS (SELECT 1 FROM knowledge_items WHERE key='natal.planets.group.outer.count.1' AND locale='ru-RU' AND (topic_category='' OR topic_category IS NULL));

UPDATE knowledge_items SET text='Сколько высших планет (Уран/Нептун/Плутон) задействовано: 2.', priority=95, is_active=1, meta_json='{}'
WHERE key='natal.planets.group.outer.count.2' AND locale='ru-RU' AND (topic_category='' OR topic_category IS NULL);
INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.planets.group.outer.count.2','', 'ru-RU','Сколько высших планет (Уран/Нептун/Плутон) задействовано: 2.',95,CURRENT_TIMESTAMP,1,'{}'
WHERE NOT EXISTS (SELECT 1 FROM knowledge_items WHERE key='natal.planets.group.outer.count.2' AND locale='ru-RU' AND (topic_category='' OR topic_category IS NULL));

UPDATE knowledge_items SET text='Сколько высших планет (Уран/Нептун/Плутон) задействовано: 3.', priority=95, is_active=1, meta_json='{}'
WHERE key='natal.planets.group.outer.count.3' AND locale='ru-RU' AND (topic_category='' OR topic_category IS NULL);
INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.planets.group.outer.count.3','', 'ru-RU','Сколько высших планет (Уран/Нептун/Плутон) задействовано: 3.',95,CURRENT_TIMESTAMP,1,'{}'
WHERE NOT EXISTS (SELECT 1 FROM knowledge_items WHERE key='natal.planets.group.outer.count.3' AND locale='ru-RU' AND (topic_category='' OR topic_category IS NULL));

-- luminaries (0..2)
UPDATE knowledge_items SET text='Сколько светил (Солнце/Луна) задействовано: 0.', priority=95, is_active=1, meta_json='{}'
WHERE key='natal.planets.group.luminaries.count.0' AND locale='ru-RU' AND (topic_category='' OR topic_category IS NULL);
INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.planets.group.luminaries.count.0','', 'ru-RU','Сколько светил (Солнце/Луна) задействовано: 0.',95,CURRENT_TIMESTAMP,1,'{}'
WHERE NOT EXISTS (SELECT 1 FROM knowledge_items WHERE key='natal.planets.group.luminaries.count.0' AND locale='ru-RU' AND (topic_category='' OR topic_category IS NULL));

UPDATE knowledge_items SET text='Сколько светил (Солнце/Луна) задействовано: 1.', priority=95, is_active=1, meta_json='{}'
WHERE key='natal.planets.group.luminaries.count.1' AND locale='ru-RU' AND (topic_category='' OR topic_category IS NULL);
INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.planets.group.luminaries.count.1','', 'ru-RU','Сколько светил (Солнце/Луна) задействовано: 1.',95,CURRENT_TIMESTAMP,1,'{}'
WHERE NOT EXISTS (SELECT 1 FROM knowledge_items WHERE key='natal.planets.group.luminaries.count.1' AND locale='ru-RU' AND (topic_category='' OR topic_category IS NULL));

UPDATE knowledge_items SET text='Сколько светил (Солнце/Луна) задействовано: 2.', priority=95, is_active=1, meta_json='{}'
WHERE key='natal.planets.group.luminaries.count.2' AND locale='ru-RU' AND (topic_category='' OR topic_category IS NULL);
INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.planets.group.luminaries.count.2','', 'ru-RU','Сколько светил (Солнце/Луна) задействовано: 2.',95,CURRENT_TIMESTAMP,1,'{}'
WHERE NOT EXISTS (SELECT 1 FROM knowledge_items WHERE key='natal.planets.group.luminaries.count.2' AND locale='ru-RU' AND (topic_category='' OR topic_category IS NULL));

-- =========================
-- sign.present: GLOBAL (seed all 12 so any chart can hit)
-- =========================
-- aries
UPDATE knowledge_items SET text='Акцент знака: Овен (если знак выражен в карте).', priority=100, is_active=1, meta_json='{}'
WHERE key='natal.sign.aries.present' AND locale='ru-RU' AND (topic_category='' OR topic_category IS NULL);
INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.sign.aries.present','', 'ru-RU','Акцент знака: Овен (если знак выражен в карте).',100,CURRENT_TIMESTAMP,1,'{}'
WHERE NOT EXISTS (SELECT 1 FROM knowledge_items WHERE key='natal.sign.aries.present' AND locale='ru-RU' AND (topic_category='' OR topic_category IS NULL));

-- taurus
UPDATE knowledge_items SET text='Акцент знака: Телец (если знак выражен в карте).', priority=100, is_active=1, meta_json='{}'
WHERE key='natal.sign.taurus.present' AND locale='ru-RU' AND (topic_category='' OR topic_category IS NULL);
INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.sign.taurus.present','', 'ru-RU','Акцент знака: Телец (если знак выражен в карте).',100,CURRENT_TIMESTAMP,1,'{}'
WHERE NOT EXISTS (SELECT 1 FROM knowledge_items WHERE key='natal.sign.taurus.present' AND locale='ru-RU' AND (topic_category='' OR topic_category IS NULL));

-- gemini
UPDATE knowledge_items SET text='Акцент знака: Близнецы (если знак выражен в карте).', priority=100, is_active=1, meta_json='{}'
WHERE key='natal.sign.gemini.present' AND locale='ru-RU' AND (topic_category='' OR topic_category IS NULL);
INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.sign.gemini.present','', 'ru-RU','Акцент знака: Близнецы (если знак выражен в карте).',100,CURRENT_TIMESTAMP,1,'{}'
WHERE NOT EXISTS (SELECT 1 FROM knowledge_items WHERE key='natal.sign.gemini.present' AND locale='ru-RU' AND (topic_category='' OR topic_category IS NULL));

-- cancer
UPDATE knowledge_items SET text='Акцент знака: Рак (если знак выражен в карте).', priority=100, is_active=1, meta_json='{}'
WHERE key='natal.sign.cancer.present' AND locale='ru-RU' AND (topic_category='' OR topic_category IS NULL);
INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.sign.cancer.present','', 'ru-RU','Акцент знака: Рак (если знак выражен в карте).',100,CURRENT_TIMESTAMP,1,'{}'
WHERE NOT EXISTS (SELECT 1 FROM knowledge_items WHERE key='natal.sign.cancer.present' AND locale='ru-RU' AND (topic_category='' OR topic_category IS NULL));

-- leo
UPDATE knowledge_items SET text='Акцент знака: Лев (если знак выражен в карте).', priority=100, is_active=1, meta_json='{}'
WHERE key='natal.sign.leo.present' AND locale='ru-RU' AND (topic_category='' OR topic_category IS NULL);
INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.sign.leo.present','', 'ru-RU','Акцент знака: Лев (если знак выражен в карте).',100,CURRENT_TIMESTAMP,1,'{}'
WHERE NOT EXISTS (SELECT 1 FROM knowledge_items WHERE key='natal.sign.leo.present' AND locale='ru-RU' AND (topic_category='' OR topic_category IS NULL));

-- virgo
UPDATE knowledge_items SET text='Акцент знака: Дева (если знак выражен в карте).', priority=100, is_active=1, meta_json='{}'
WHERE key='natal.sign.virgo.present' AND locale='ru-RU' AND (topic_category='' OR topic_category IS NULL);
INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.sign.virgo.present','', 'ru-RU','Акцент знака: Дева (если знак выражен в карте).',100,CURRENT_TIMESTAMP,1,'{}'
WHERE NOT EXISTS (SELECT 1 FROM knowledge_items WHERE key='natal.sign.virgo.present' AND locale='ru-RU' AND (topic_category='' OR topic_category IS NULL));

-- libra
UPDATE knowledge_items SET text='Акцент знака: Весы (если знак выражен в карте).', priority=100, is_active=1, meta_json='{}'
WHERE key='natal.sign.libra.present' AND locale='ru-RU' AND (topic_category='' OR topic_category IS NULL);
INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.sign.libra.present','', 'ru-RU','Акцент знака: Весы (если знак выражен в карте).',100,CURRENT_TIMESTAMP,1,'{}'
WHERE NOT EXISTS (SELECT 1 FROM knowledge_items WHERE key='natal.sign.libra.present' AND locale='ru-RU' AND (topic_category='' OR topic_category IS NULL));

-- scorpio
UPDATE knowledge_items SET text='Акцент знака: Скорпион (если знак выражен в карте).', priority=100, is_active=1, meta_json='{}'
WHERE key='natal.sign.scorpio.present' AND locale='ru-RU' AND (topic_category='' OR topic_category IS NULL);
INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.sign.scorpio.present','', 'ru-RU','Акцент знака: Скорпион (если знак выражен в карте).',100,CURRENT_TIMESTAMP,1,'{}'
WHERE NOT EXISTS (SELECT 1 FROM knowledge_items WHERE key='natal.sign.scorpio.present' AND locale='ru-RU' AND (topic_category='' OR topic_category IS NULL));

-- sagittarius
UPDATE knowledge_items SET text='Акцент знака: Стрелец (если знак выражен в карте).', priority=100, is_active=1, meta_json='{}'
WHERE key='natal.sign.sagittarius.present' AND locale='ru-RU' AND (topic_category='' OR topic_category IS NULL);
INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.sign.sagittarius.present','', 'ru-RU','Акцент знака: Стрелец (если знак выражен в карте).',100,CURRENT_TIMESTAMP,1,'{}'
WHERE NOT EXISTS (SELECT 1 FROM knowledge_items WHERE key='natal.sign.sagittarius.present' AND locale='ru-RU' AND (topic_category='' OR topic_category IS NULL));

-- capricorn
UPDATE knowledge_items SET text='Акцент знака: Козерог (если знак выражен в карте).', priority=100, is_active=1, meta_json='{}'
WHERE key='natal.sign.capricorn.present' AND locale='ru-RU' AND (topic_category='' OR topic_category IS NULL);
INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.sign.capricorn.present','', 'ru-RU','Акцент знака: Козерог (если знак выражен в карте).',100,CURRENT_TIMESTAMP,1,'{}'
WHERE NOT EXISTS (SELECT 1 FROM knowledge_items WHERE key='natal.sign.capricorn.present' AND locale='ru-RU' AND (topic_category='' OR topic_category IS NULL));

-- aquarius
UPDATE knowledge_items SET text='Акцент знака: Водолей (если знак выражен в карте).', priority=100, is_active=1, meta_json='{}'
WHERE key='natal.sign.aquarius.present' AND locale='ru-RU' AND (topic_category='' OR topic_category IS NULL);
INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.sign.aquarius.present','', 'ru-RU','Акцент знака: Водолей (если знак выражен в карте).',100,CURRENT_TIMESTAMP,1,'{}'
WHERE NOT EXISTS (SELECT 1 FROM knowledge_items WHERE key='natal.sign.aquarius.present' AND locale='ru-RU' AND (topic_category='' OR topic_category IS NULL));

-- pisces
UPDATE knowledge_items SET text='Акцент знака: Рыбы (если знак выражен в карте).', priority=100, is_active=1, meta_json='{}'
WHERE key='natal.sign.pisces.present' AND locale='ru-RU' AND (topic_category='' OR topic_category IS NULL);
INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.sign.pisces.present','', 'ru-RU','Акцент знака: Рыбы (если знак выражен в карте).',100,CURRENT_TIMESTAMP,1,'{}'
WHERE NOT EXISTS (SELECT 1 FROM knowledge_items WHERE key='natal.sign.pisces.present' AND locale='ru-RU' AND (topic_category='' OR topic_category IS NULL));

-- =========================
-- OPTIONAL: same keys for love_intimacy topic_category
-- (So debug=2 love_intimacy hits_sample shows these keys even without global fallback.)
-- =========================

UPDATE knowledge_items
SET text='(love_intimacy) Светила задают эмоциональный фон и потребность в близости.', priority=108, is_active=1, meta_json='{}'
WHERE key='natal.planets.group.luminaries.present' AND locale='ru-RU' AND topic_category='love_intimacy';

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.planets.group.luminaries.present', 'love_intimacy', 'ru-RU',
       '(love_intimacy) Светила задают эмоциональный фон и потребность в близости.',
       108, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key='natal.planets.group.luminaries.present'
    AND locale='ru-RU'
    AND topic_category='love_intimacy'
);

UPDATE knowledge_items
SET text='(love_intimacy) Личные планеты показывают стиль общения, притяжение и инициативу.', priority=108, is_active=1, meta_json='{}'
WHERE key='natal.planets.group.inner.present' AND locale='ru-RU' AND topic_category='love_intimacy';

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.planets.group.inner.present', 'love_intimacy', 'ru-RU',
       '(love_intimacy) Личные планеты показывают стиль общения, притяжение и инициативу.',
       108, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key='natal.planets.group.inner.present'
    AND locale='ru-RU'
    AND topic_category='love_intimacy'
);

UPDATE knowledge_items
SET text='(love_intimacy) Социальные планеты добавляют тему ответственности и роста в отношениях.', priority=108, is_active=1, meta_json='{}'
WHERE key='natal.planets.group.social.present' AND locale='ru-RU' AND topic_category='love_intimacy';

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.planets.group.social.present', 'love_intimacy', 'ru-RU',
       '(love_intimacy) Социальные планеты добавляют тему ответственности и роста в отношениях.',
       108, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key='natal.planets.group.social.present'
    AND locale='ru-RU'
    AND topic_category='love_intimacy'
);

UPDATE knowledge_items
SET text='(love_intimacy) Высшие планеты показывают глубинные сценарии и трансформации в близости.', priority=108, is_active=1, meta_json='{}'
WHERE key='natal.planets.group.outer.present' AND locale='ru-RU' AND topic_category='love_intimacy';

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.planets.group.outer.present', 'love_intimacy', 'ru-RU',
       '(love_intimacy) Высшие планеты показывают глубинные сценарии и трансформации в близости.',
       108, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key='natal.planets.group.outer.present'
    AND locale='ru-RU'
    AND topic_category='love_intimacy'
);

-- One sign example for love_intimacy (optional): Capricorn + Pisces
UPDATE knowledge_items SET text='(love_intimacy) Акцент знака: Козерог.', priority=102, is_active=1, meta_json='{}'
WHERE key='natal.sign.capricorn.present' AND locale='ru-RU' AND topic_category='love_intimacy';
INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.sign.capricorn.present','love_intimacy','ru-RU','(love_intimacy) Акцент знака: Козерог.',102,CURRENT_TIMESTAMP,1,'{}'
WHERE NOT EXISTS (SELECT 1 FROM knowledge_items WHERE key='natal.sign.capricorn.present' AND locale='ru-RU' AND topic_category='love_intimacy');

UPDATE knowledge_items SET text='(love_intimacy) Акцент знака: Рыбы.', priority=102, is_active=1, meta_json='{}'
WHERE key='natal.sign.pisces.present' AND locale='ru-RU' AND topic_category='love_intimacy';
INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.sign.pisces.present','love_intimacy','ru-RU','(love_intimacy) Акцент знака: Рыбы.',102,CURRENT_TIMESTAMP,1,'{}'
WHERE NOT EXISTS (SELECT 1 FROM knowledge_items WHERE key='natal.sign.pisces.present' AND locale='ru-RU' AND topic_category='love_intimacy');

COMMIT;