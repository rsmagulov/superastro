-- AUTO-GENERATED. DO NOT EDIT BY HAND.

-- Seeds natal.planets.group.<group>.present and .count.<n> for global + per-topic rows.

BEGIN;

UPDATE knowledge_items
SET text = 'Группа планет: светила (Солнце и Луна) — базовый тон личности и эмоциональный фон.', priority = 105, is_active = 1, meta_json = '{}'
WHERE key = 'natal.planets.group.luminaries.present' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.planets.group.luminaries.present', '', 'ru-RU', 'Группа планет: светила (Солнце и Луна) — базовый тон личности и эмоциональный фон.', 105, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.planets.group.luminaries.present' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Светил в группе: 0 из 2.', priority = 95, is_active = 1, meta_json = '{}'
WHERE key = 'natal.planets.group.luminaries.count.0' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.planets.group.luminaries.count.0', '', 'ru-RU', 'Светил в группе: 0 из 2.', 95, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.planets.group.luminaries.count.0' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Светил в группе: 1 из 2.', priority = 95, is_active = 1, meta_json = '{}'
WHERE key = 'natal.planets.group.luminaries.count.1' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.planets.group.luminaries.count.1', '', 'ru-RU', 'Светил в группе: 1 из 2.', 95, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.planets.group.luminaries.count.1' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Светил в группе: 2 из 2.', priority = 95, is_active = 1, meta_json = '{}'
WHERE key = 'natal.planets.group.luminaries.count.2' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.planets.group.luminaries.count.2', '', 'ru-RU', 'Светил в группе: 2 из 2.', 95, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.planets.group.luminaries.count.2' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Группа планет: личные (Меркурий, Венера, Марс) — мышление, притяжение и способ действовать.', priority = 105, is_active = 1, meta_json = '{}'
WHERE key = 'natal.planets.group.inner.present' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.planets.group.inner.present', '', 'ru-RU', 'Группа планет: личные (Меркурий, Венера, Марс) — мышление, притяжение и способ действовать.', 105, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.planets.group.inner.present' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Личных планет в группе: 0 из 3.', priority = 95, is_active = 1, meta_json = '{}'
WHERE key = 'natal.planets.group.inner.count.0' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.planets.group.inner.count.0', '', 'ru-RU', 'Личных планет в группе: 0 из 3.', 95, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.planets.group.inner.count.0' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Личных планет в группе: 1 из 3.', priority = 95, is_active = 1, meta_json = '{}'
WHERE key = 'natal.planets.group.inner.count.1' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.planets.group.inner.count.1', '', 'ru-RU', 'Личных планет в группе: 1 из 3.', 95, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.planets.group.inner.count.1' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Личных планет в группе: 2 из 3.', priority = 95, is_active = 1, meta_json = '{}'
WHERE key = 'natal.planets.group.inner.count.2' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.planets.group.inner.count.2', '', 'ru-RU', 'Личных планет в группе: 2 из 3.', 95, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.planets.group.inner.count.2' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Личных планет в группе: 3 из 3.', priority = 95, is_active = 1, meta_json = '{}'
WHERE key = 'natal.planets.group.inner.count.3' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.planets.group.inner.count.3', '', 'ru-RU', 'Личных планет в группе: 3 из 3.', 95, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.planets.group.inner.count.3' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Группа планет: социальные (Юпитер, Сатурн) — рост, правила и долгие цели.', priority = 105, is_active = 1, meta_json = '{}'
WHERE key = 'natal.planets.group.social.present' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.planets.group.social.present', '', 'ru-RU', 'Группа планет: социальные (Юпитер, Сатурн) — рост, правила и долгие цели.', 105, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.planets.group.social.present' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Социальных планет в группе: 0 из 2.', priority = 95, is_active = 1, meta_json = '{}'
WHERE key = 'natal.planets.group.social.count.0' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.planets.group.social.count.0', '', 'ru-RU', 'Социальных планет в группе: 0 из 2.', 95, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.planets.group.social.count.0' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Социальных планет в группе: 1 из 2.', priority = 95, is_active = 1, meta_json = '{}'
WHERE key = 'natal.planets.group.social.count.1' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.planets.group.social.count.1', '', 'ru-RU', 'Социальных планет в группе: 1 из 2.', 95, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.planets.group.social.count.1' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Социальных планет в группе: 2 из 2.', priority = 95, is_active = 1, meta_json = '{}'
WHERE key = 'natal.planets.group.social.count.2' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.planets.group.social.count.2', '', 'ru-RU', 'Социальных планет в группе: 2 из 2.', 95, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.planets.group.social.count.2' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Группа планет: высшие (Уран, Нептун, Плутон) — глубинные циклы, трансформация и перемены.', priority = 105, is_active = 1, meta_json = '{}'
WHERE key = 'natal.planets.group.outer.present' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.planets.group.outer.present', '', 'ru-RU', 'Группа планет: высшие (Уран, Нептун, Плутон) — глубинные циклы, трансформация и перемены.', 105, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.planets.group.outer.present' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Высших планет в группе: 0 из 3.', priority = 95, is_active = 1, meta_json = '{}'
WHERE key = 'natal.planets.group.outer.count.0' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.planets.group.outer.count.0', '', 'ru-RU', 'Высших планет в группе: 0 из 3.', 95, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.planets.group.outer.count.0' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Высших планет в группе: 1 из 3.', priority = 95, is_active = 1, meta_json = '{}'
WHERE key = 'natal.planets.group.outer.count.1' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.planets.group.outer.count.1', '', 'ru-RU', 'Высших планет в группе: 1 из 3.', 95, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.planets.group.outer.count.1' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Высших планет в группе: 2 из 3.', priority = 95, is_active = 1, meta_json = '{}'
WHERE key = 'natal.planets.group.outer.count.2' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.planets.group.outer.count.2', '', 'ru-RU', 'Высших планет в группе: 2 из 3.', 95, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.planets.group.outer.count.2' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Высших планет в группе: 3 из 3.', priority = 95, is_active = 1, meta_json = '{}'
WHERE key = 'natal.planets.group.outer.count.3' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.planets.group.outer.count.3', '', 'ru-RU', 'Высших планет в группе: 3 из 3.', 95, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.planets.group.outer.count.3' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = '(ancestral_topics) Группа планет: светила (Солнце и Луна) — базовый тон личности и эмоциональный фон.', priority = 108, is_active = 1, meta_json = '{}'
WHERE key = 'natal.planets.group.luminaries.present' AND locale = 'ru-RU' AND (topic_category = 'ancestral_topics');

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.planets.group.luminaries.present', 'ancestral_topics', 'ru-RU', '(ancestral_topics) Группа планет: светила (Солнце и Луна) — базовый тон личности и эмоциональный фон.', 108, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.planets.group.luminaries.present' AND locale = 'ru-RU' AND (topic_category = 'ancestral_topics')
);

UPDATE knowledge_items
SET text = '(ancestral_topics) Светил в группе: 0 из 2.', priority = 98, is_active = 1, meta_json = '{}'
WHERE key = 'natal.planets.group.luminaries.count.0' AND locale = 'ru-RU' AND (topic_category = 'ancestral_topics');

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.planets.group.luminaries.count.0', 'ancestral_topics', 'ru-RU', '(ancestral_topics) Светил в группе: 0 из 2.', 98, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.planets.group.luminaries.count.0' AND locale = 'ru-RU' AND (topic_category = 'ancestral_topics')
);

UPDATE knowledge_items
SET text = '(ancestral_topics) Светил в группе: 1 из 2.', priority = 98, is_active = 1, meta_json = '{}'
WHERE key = 'natal.planets.group.luminaries.count.1' AND locale = 'ru-RU' AND (topic_category = 'ancestral_topics');

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.planets.group.luminaries.count.1', 'ancestral_topics', 'ru-RU', '(ancestral_topics) Светил в группе: 1 из 2.', 98, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.planets.group.luminaries.count.1' AND locale = 'ru-RU' AND (topic_category = 'ancestral_topics')
);

UPDATE knowledge_items
SET text = '(ancestral_topics) Светил в группе: 2 из 2.', priority = 98, is_active = 1, meta_json = '{}'
WHERE key = 'natal.planets.group.luminaries.count.2' AND locale = 'ru-RU' AND (topic_category = 'ancestral_topics');

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.planets.group.luminaries.count.2', 'ancestral_topics', 'ru-RU', '(ancestral_topics) Светил в группе: 2 из 2.', 98, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.planets.group.luminaries.count.2' AND locale = 'ru-RU' AND (topic_category = 'ancestral_topics')
);

UPDATE knowledge_items
SET text = '(ancestral_topics) Группа планет: личные (Меркурий, Венера, Марс) — мышление, притяжение и способ действовать.', priority = 108, is_active = 1, meta_json = '{}'
WHERE key = 'natal.planets.group.inner.present' AND locale = 'ru-RU' AND (topic_category = 'ancestral_topics');

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.planets.group.inner.present', 'ancestral_topics', 'ru-RU', '(ancestral_topics) Группа планет: личные (Меркурий, Венера, Марс) — мышление, притяжение и способ действовать.', 108, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.planets.group.inner.present' AND locale = 'ru-RU' AND (topic_category = 'ancestral_topics')
);

UPDATE knowledge_items
SET text = '(ancestral_topics) Личных планет в группе: 0 из 3.', priority = 98, is_active = 1, meta_json = '{}'
WHERE key = 'natal.planets.group.inner.count.0' AND locale = 'ru-RU' AND (topic_category = 'ancestral_topics');

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.planets.group.inner.count.0', 'ancestral_topics', 'ru-RU', '(ancestral_topics) Личных планет в группе: 0 из 3.', 98, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.planets.group.inner.count.0' AND locale = 'ru-RU' AND (topic_category = 'ancestral_topics')
);

UPDATE knowledge_items
SET text = '(ancestral_topics) Личных планет в группе: 1 из 3.', priority = 98, is_active = 1, meta_json = '{}'
WHERE key = 'natal.planets.group.inner.count.1' AND locale = 'ru-RU' AND (topic_category = 'ancestral_topics');

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.planets.group.inner.count.1', 'ancestral_topics', 'ru-RU', '(ancestral_topics) Личных планет в группе: 1 из 3.', 98, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.planets.group.inner.count.1' AND locale = 'ru-RU' AND (topic_category = 'ancestral_topics')
);

UPDATE knowledge_items
SET text = '(ancestral_topics) Личных планет в группе: 2 из 3.', priority = 98, is_active = 1, meta_json = '{}'
WHERE key = 'natal.planets.group.inner.count.2' AND locale = 'ru-RU' AND (topic_category = 'ancestral_topics');

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.planets.group.inner.count.2', 'ancestral_topics', 'ru-RU', '(ancestral_topics) Личных планет в группе: 2 из 3.', 98, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.planets.group.inner.count.2' AND locale = 'ru-RU' AND (topic_category = 'ancestral_topics')
);

UPDATE knowledge_items
SET text = '(ancestral_topics) Личных планет в группе: 3 из 3.', priority = 98, is_active = 1, meta_json = '{}'
WHERE key = 'natal.planets.group.inner.count.3' AND locale = 'ru-RU' AND (topic_category = 'ancestral_topics');

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.planets.group.inner.count.3', 'ancestral_topics', 'ru-RU', '(ancestral_topics) Личных планет в группе: 3 из 3.', 98, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.planets.group.inner.count.3' AND locale = 'ru-RU' AND (topic_category = 'ancestral_topics')
);

UPDATE knowledge_items
SET text = '(ancestral_topics) Группа планет: социальные (Юпитер, Сатурн) — рост, правила и долгие цели.', priority = 108, is_active = 1, meta_json = '{}'
WHERE key = 'natal.planets.group.social.present' AND locale = 'ru-RU' AND (topic_category = 'ancestral_topics');

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.planets.group.social.present', 'ancestral_topics', 'ru-RU', '(ancestral_topics) Группа планет: социальные (Юпитер, Сатурн) — рост, правила и долгие цели.', 108, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.planets.group.social.present' AND locale = 'ru-RU' AND (topic_category = 'ancestral_topics')
);

UPDATE knowledge_items
SET text = '(ancestral_topics) Социальных планет в группе: 0 из 2.', priority = 98, is_active = 1, meta_json = '{}'
WHERE key = 'natal.planets.group.social.count.0' AND locale = 'ru-RU' AND (topic_category = 'ancestral_topics');

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.planets.group.social.count.0', 'ancestral_topics', 'ru-RU', '(ancestral_topics) Социальных планет в группе: 0 из 2.', 98, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.planets.group.social.count.0' AND locale = 'ru-RU' AND (topic_category = 'ancestral_topics')
);

UPDATE knowledge_items
SET text = '(ancestral_topics) Социальных планет в группе: 1 из 2.', priority = 98, is_active = 1, meta_json = '{}'
WHERE key = 'natal.planets.group.social.count.1' AND locale = 'ru-RU' AND (topic_category = 'ancestral_topics');

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.planets.group.social.count.1', 'ancestral_topics', 'ru-RU', '(ancestral_topics) Социальных планет в группе: 1 из 2.', 98, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.planets.group.social.count.1' AND locale = 'ru-RU' AND (topic_category = 'ancestral_topics')
);

UPDATE knowledge_items
SET text = '(ancestral_topics) Социальных планет в группе: 2 из 2.', priority = 98, is_active = 1, meta_json = '{}'
WHERE key = 'natal.planets.group.social.count.2' AND locale = 'ru-RU' AND (topic_category = 'ancestral_topics');

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.planets.group.social.count.2', 'ancestral_topics', 'ru-RU', '(ancestral_topics) Социальных планет в группе: 2 из 2.', 98, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.planets.group.social.count.2' AND locale = 'ru-RU' AND (topic_category = 'ancestral_topics')
);

UPDATE knowledge_items
SET text = '(ancestral_topics) Группа планет: высшие (Уран, Нептун, Плутон) — глубинные циклы, трансформация и перемены.', priority = 108, is_active = 1, meta_json = '{}'
WHERE key = 'natal.planets.group.outer.present' AND locale = 'ru-RU' AND (topic_category = 'ancestral_topics');

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.planets.group.outer.present', 'ancestral_topics', 'ru-RU', '(ancestral_topics) Группа планет: высшие (Уран, Нептун, Плутон) — глубинные циклы, трансформация и перемены.', 108, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.planets.group.outer.present' AND locale = 'ru-RU' AND (topic_category = 'ancestral_topics')
);

UPDATE knowledge_items
SET text = '(ancestral_topics) Высших планет в группе: 0 из 3.', priority = 98, is_active = 1, meta_json = '{}'
WHERE key = 'natal.planets.group.outer.count.0' AND locale = 'ru-RU' AND (topic_category = 'ancestral_topics');

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.planets.group.outer.count.0', 'ancestral_topics', 'ru-RU', '(ancestral_topics) Высших планет в группе: 0 из 3.', 98, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.planets.group.outer.count.0' AND locale = 'ru-RU' AND (topic_category = 'ancestral_topics')
);

UPDATE knowledge_items
SET text = '(ancestral_topics) Высших планет в группе: 1 из 3.', priority = 98, is_active = 1, meta_json = '{}'
WHERE key = 'natal.planets.group.outer.count.1' AND locale = 'ru-RU' AND (topic_category = 'ancestral_topics');

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.planets.group.outer.count.1', 'ancestral_topics', 'ru-RU', '(ancestral_topics) Высших планет в группе: 1 из 3.', 98, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.planets.group.outer.count.1' AND locale = 'ru-RU' AND (topic_category = 'ancestral_topics')
);

UPDATE knowledge_items
SET text = '(ancestral_topics) Высших планет в группе: 2 из 3.', priority = 98, is_active = 1, meta_json = '{}'
WHERE key = 'natal.planets.group.outer.count.2' AND locale = 'ru-RU' AND (topic_category = 'ancestral_topics');

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.planets.group.outer.count.2', 'ancestral_topics', 'ru-RU', '(ancestral_topics) Высших планет в группе: 2 из 3.', 98, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.planets.group.outer.count.2' AND locale = 'ru-RU' AND (topic_category = 'ancestral_topics')
);

UPDATE knowledge_items
SET text = '(ancestral_topics) Высших планет в группе: 3 из 3.', priority = 98, is_active = 1, meta_json = '{}'
WHERE key = 'natal.planets.group.outer.count.3' AND locale = 'ru-RU' AND (topic_category = 'ancestral_topics');

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.planets.group.outer.count.3', 'ancestral_topics', 'ru-RU', '(ancestral_topics) Высших планет в группе: 3 из 3.', 98, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.planets.group.outer.count.3' AND locale = 'ru-RU' AND (topic_category = 'ancestral_topics')
);

UPDATE knowledge_items
SET text = '(career) Группа планет: светила (Солнце и Луна) — базовый тон личности и эмоциональный фон.', priority = 108, is_active = 1, meta_json = '{}'
WHERE key = 'natal.planets.group.luminaries.present' AND locale = 'ru-RU' AND (topic_category = 'career');

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.planets.group.luminaries.present', 'career', 'ru-RU', '(career) Группа планет: светила (Солнце и Луна) — базовый тон личности и эмоциональный фон.', 108, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.planets.group.luminaries.present' AND locale = 'ru-RU' AND (topic_category = 'career')
);

UPDATE knowledge_items
SET text = '(career) Светил в группе: 0 из 2.', priority = 98, is_active = 1, meta_json = '{}'
WHERE key = 'natal.planets.group.luminaries.count.0' AND locale = 'ru-RU' AND (topic_category = 'career');

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.planets.group.luminaries.count.0', 'career', 'ru-RU', '(career) Светил в группе: 0 из 2.', 98, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.planets.group.luminaries.count.0' AND locale = 'ru-RU' AND (topic_category = 'career')
);

UPDATE knowledge_items
SET text = '(career) Светил в группе: 1 из 2.', priority = 98, is_active = 1, meta_json = '{}'
WHERE key = 'natal.planets.group.luminaries.count.1' AND locale = 'ru-RU' AND (topic_category = 'career');

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.planets.group.luminaries.count.1', 'career', 'ru-RU', '(career) Светил в группе: 1 из 2.', 98, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.planets.group.luminaries.count.1' AND locale = 'ru-RU' AND (topic_category = 'career')
);

UPDATE knowledge_items
SET text = '(career) Светил в группе: 2 из 2.', priority = 98, is_active = 1, meta_json = '{}'
WHERE key = 'natal.planets.group.luminaries.count.2' AND locale = 'ru-RU' AND (topic_category = 'career');

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.planets.group.luminaries.count.2', 'career', 'ru-RU', '(career) Светил в группе: 2 из 2.', 98, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.planets.group.luminaries.count.2' AND locale = 'ru-RU' AND (topic_category = 'career')
);

UPDATE knowledge_items
SET text = '(career) Группа планет: личные (Меркурий, Венера, Марс) — мышление, притяжение и способ действовать.', priority = 108, is_active = 1, meta_json = '{}'
WHERE key = 'natal.planets.group.inner.present' AND locale = 'ru-RU' AND (topic_category = 'career');

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.planets.group.inner.present', 'career', 'ru-RU', '(career) Группа планет: личные (Меркурий, Венера, Марс) — мышление, притяжение и способ действовать.', 108, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.planets.group.inner.present' AND locale = 'ru-RU' AND (topic_category = 'career')
);

UPDATE knowledge_items
SET text = '(career) Личных планет в группе: 0 из 3.', priority = 98, is_active = 1, meta_json = '{}'
WHERE key = 'natal.planets.group.inner.count.0' AND locale = 'ru-RU' AND (topic_category = 'career');

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.planets.group.inner.count.0', 'career', 'ru-RU', '(career) Личных планет в группе: 0 из 3.', 98, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.planets.group.inner.count.0' AND locale = 'ru-RU' AND (topic_category = 'career')
);

UPDATE knowledge_items
SET text = '(career) Личных планет в группе: 1 из 3.', priority = 98, is_active = 1, meta_json = '{}'
WHERE key = 'natal.planets.group.inner.count.1' AND locale = 'ru-RU' AND (topic_category = 'career');

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.planets.group.inner.count.1', 'career', 'ru-RU', '(career) Личных планет в группе: 1 из 3.', 98, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.planets.group.inner.count.1' AND locale = 'ru-RU' AND (topic_category = 'career')
);

UPDATE knowledge_items
SET text = '(career) Личных планет в группе: 2 из 3.', priority = 98, is_active = 1, meta_json = '{}'
WHERE key = 'natal.planets.group.inner.count.2' AND locale = 'ru-RU' AND (topic_category = 'career');

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.planets.group.inner.count.2', 'career', 'ru-RU', '(career) Личных планет в группе: 2 из 3.', 98, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.planets.group.inner.count.2' AND locale = 'ru-RU' AND (topic_category = 'career')
);

UPDATE knowledge_items
SET text = '(career) Личных планет в группе: 3 из 3.', priority = 98, is_active = 1, meta_json = '{}'
WHERE key = 'natal.planets.group.inner.count.3' AND locale = 'ru-RU' AND (topic_category = 'career');

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.planets.group.inner.count.3', 'career', 'ru-RU', '(career) Личных планет в группе: 3 из 3.', 98, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.planets.group.inner.count.3' AND locale = 'ru-RU' AND (topic_category = 'career')
);

UPDATE knowledge_items
SET text = '(career) Группа планет: социальные (Юпитер, Сатурн) — рост, правила и долгие цели.', priority = 108, is_active = 1, meta_json = '{}'
WHERE key = 'natal.planets.group.social.present' AND locale = 'ru-RU' AND (topic_category = 'career');

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.planets.group.social.present', 'career', 'ru-RU', '(career) Группа планет: социальные (Юпитер, Сатурн) — рост, правила и долгие цели.', 108, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.planets.group.social.present' AND locale = 'ru-RU' AND (topic_category = 'career')
);

UPDATE knowledge_items
SET text = '(career) Социальных планет в группе: 0 из 2.', priority = 98, is_active = 1, meta_json = '{}'
WHERE key = 'natal.planets.group.social.count.0' AND locale = 'ru-RU' AND (topic_category = 'career');

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.planets.group.social.count.0', 'career', 'ru-RU', '(career) Социальных планет в группе: 0 из 2.', 98, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.planets.group.social.count.0' AND locale = 'ru-RU' AND (topic_category = 'career')
);

UPDATE knowledge_items
SET text = '(career) Социальных планет в группе: 1 из 2.', priority = 98, is_active = 1, meta_json = '{}'
WHERE key = 'natal.planets.group.social.count.1' AND locale = 'ru-RU' AND (topic_category = 'career');

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.planets.group.social.count.1', 'career', 'ru-RU', '(career) Социальных планет в группе: 1 из 2.', 98, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.planets.group.social.count.1' AND locale = 'ru-RU' AND (topic_category = 'career')
);

UPDATE knowledge_items
SET text = '(career) Социальных планет в группе: 2 из 2.', priority = 98, is_active = 1, meta_json = '{}'
WHERE key = 'natal.planets.group.social.count.2' AND locale = 'ru-RU' AND (topic_category = 'career');

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.planets.group.social.count.2', 'career', 'ru-RU', '(career) Социальных планет в группе: 2 из 2.', 98, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.planets.group.social.count.2' AND locale = 'ru-RU' AND (topic_category = 'career')
);

UPDATE knowledge_items
SET text = '(career) Группа планет: высшие (Уран, Нептун, Плутон) — глубинные циклы, трансформация и перемены.', priority = 108, is_active = 1, meta_json = '{}'
WHERE key = 'natal.planets.group.outer.present' AND locale = 'ru-RU' AND (topic_category = 'career');

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.planets.group.outer.present', 'career', 'ru-RU', '(career) Группа планет: высшие (Уран, Нептун, Плутон) — глубинные циклы, трансформация и перемены.', 108, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.planets.group.outer.present' AND locale = 'ru-RU' AND (topic_category = 'career')
);

UPDATE knowledge_items
SET text = '(career) Высших планет в группе: 0 из 3.', priority = 98, is_active = 1, meta_json = '{}'
WHERE key = 'natal.planets.group.outer.count.0' AND locale = 'ru-RU' AND (topic_category = 'career');

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.planets.group.outer.count.0', 'career', 'ru-RU', '(career) Высших планет в группе: 0 из 3.', 98, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.planets.group.outer.count.0' AND locale = 'ru-RU' AND (topic_category = 'career')
);

UPDATE knowledge_items
SET text = '(career) Высших планет в группе: 1 из 3.', priority = 98, is_active = 1, meta_json = '{}'
WHERE key = 'natal.planets.group.outer.count.1' AND locale = 'ru-RU' AND (topic_category = 'career');

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.planets.group.outer.count.1', 'career', 'ru-RU', '(career) Высших планет в группе: 1 из 3.', 98, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.planets.group.outer.count.1' AND locale = 'ru-RU' AND (topic_category = 'career')
);

UPDATE knowledge_items
SET text = '(career) Высших планет в группе: 2 из 3.', priority = 98, is_active = 1, meta_json = '{}'
WHERE key = 'natal.planets.group.outer.count.2' AND locale = 'ru-RU' AND (topic_category = 'career');

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.planets.group.outer.count.2', 'career', 'ru-RU', '(career) Высших планет в группе: 2 из 3.', 98, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.planets.group.outer.count.2' AND locale = 'ru-RU' AND (topic_category = 'career')
);

UPDATE knowledge_items
SET text = '(career) Высших планет в группе: 3 из 3.', priority = 98, is_active = 1, meta_json = '{}'
WHERE key = 'natal.planets.group.outer.count.3' AND locale = 'ru-RU' AND (topic_category = 'career');

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.planets.group.outer.count.3', 'career', 'ru-RU', '(career) Высших планет в группе: 3 из 3.', 98, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.planets.group.outer.count.3' AND locale = 'ru-RU' AND (topic_category = 'career')
);

UPDATE knowledge_items
SET text = '(creativity) Группа планет: светила (Солнце и Луна) — базовый тон личности и эмоциональный фон.', priority = 108, is_active = 1, meta_json = '{}'
WHERE key = 'natal.planets.group.luminaries.present' AND locale = 'ru-RU' AND (topic_category = 'creativity');

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.planets.group.luminaries.present', 'creativity', 'ru-RU', '(creativity) Группа планет: светила (Солнце и Луна) — базовый тон личности и эмоциональный фон.', 108, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.planets.group.luminaries.present' AND locale = 'ru-RU' AND (topic_category = 'creativity')
);

UPDATE knowledge_items
SET text = '(creativity) Светил в группе: 0 из 2.', priority = 98, is_active = 1, meta_json = '{}'
WHERE key = 'natal.planets.group.luminaries.count.0' AND locale = 'ru-RU' AND (topic_category = 'creativity');

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.planets.group.luminaries.count.0', 'creativity', 'ru-RU', '(creativity) Светил в группе: 0 из 2.', 98, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.planets.group.luminaries.count.0' AND locale = 'ru-RU' AND (topic_category = 'creativity')
);

UPDATE knowledge_items
SET text = '(creativity) Светил в группе: 1 из 2.', priority = 98, is_active = 1, meta_json = '{}'
WHERE key = 'natal.planets.group.luminaries.count.1' AND locale = 'ru-RU' AND (topic_category = 'creativity');

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.planets.group.luminaries.count.1', 'creativity', 'ru-RU', '(creativity) Светил в группе: 1 из 2.', 98, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.planets.group.luminaries.count.1' AND locale = 'ru-RU' AND (topic_category = 'creativity')
);

UPDATE knowledge_items
SET text = '(creativity) Светил в группе: 2 из 2.', priority = 98, is_active = 1, meta_json = '{}'
WHERE key = 'natal.planets.group.luminaries.count.2' AND locale = 'ru-RU' AND (topic_category = 'creativity');

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.planets.group.luminaries.count.2', 'creativity', 'ru-RU', '(creativity) Светил в группе: 2 из 2.', 98, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.planets.group.luminaries.count.2' AND locale = 'ru-RU' AND (topic_category = 'creativity')
);

UPDATE knowledge_items
SET text = '(creativity) Группа планет: личные (Меркурий, Венера, Марс) — мышление, притяжение и способ действовать.', priority = 108, is_active = 1, meta_json = '{}'
WHERE key = 'natal.planets.group.inner.present' AND locale = 'ru-RU' AND (topic_category = 'creativity');

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.planets.group.inner.present', 'creativity', 'ru-RU', '(creativity) Группа планет: личные (Меркурий, Венера, Марс) — мышление, притяжение и способ действовать.', 108, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.planets.group.inner.present' AND locale = 'ru-RU' AND (topic_category = 'creativity')
);

UPDATE knowledge_items
SET text = '(creativity) Личных планет в группе: 0 из 3.', priority = 98, is_active = 1, meta_json = '{}'
WHERE key = 'natal.planets.group.inner.count.0' AND locale = 'ru-RU' AND (topic_category = 'creativity');

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.planets.group.inner.count.0', 'creativity', 'ru-RU', '(creativity) Личных планет в группе: 0 из 3.', 98, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.planets.group.inner.count.0' AND locale = 'ru-RU' AND (topic_category = 'creativity')
);

UPDATE knowledge_items
SET text = '(creativity) Личных планет в группе: 1 из 3.', priority = 98, is_active = 1, meta_json = '{}'
WHERE key = 'natal.planets.group.inner.count.1' AND locale = 'ru-RU' AND (topic_category = 'creativity');

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.planets.group.inner.count.1', 'creativity', 'ru-RU', '(creativity) Личных планет в группе: 1 из 3.', 98, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.planets.group.inner.count.1' AND locale = 'ru-RU' AND (topic_category = 'creativity')
);

UPDATE knowledge_items
SET text = '(creativity) Личных планет в группе: 2 из 3.', priority = 98, is_active = 1, meta_json = '{}'
WHERE key = 'natal.planets.group.inner.count.2' AND locale = 'ru-RU' AND (topic_category = 'creativity');

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.planets.group.inner.count.2', 'creativity', 'ru-RU', '(creativity) Личных планет в группе: 2 из 3.', 98, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.planets.group.inner.count.2' AND locale = 'ru-RU' AND (topic_category = 'creativity')
);

UPDATE knowledge_items
SET text = '(creativity) Личных планет в группе: 3 из 3.', priority = 98, is_active = 1, meta_json = '{}'
WHERE key = 'natal.planets.group.inner.count.3' AND locale = 'ru-RU' AND (topic_category = 'creativity');

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.planets.group.inner.count.3', 'creativity', 'ru-RU', '(creativity) Личных планет в группе: 3 из 3.', 98, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.planets.group.inner.count.3' AND locale = 'ru-RU' AND (topic_category = 'creativity')
);

UPDATE knowledge_items
SET text = '(creativity) Группа планет: социальные (Юпитер, Сатурн) — рост, правила и долгие цели.', priority = 108, is_active = 1, meta_json = '{}'
WHERE key = 'natal.planets.group.social.present' AND locale = 'ru-RU' AND (topic_category = 'creativity');

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.planets.group.social.present', 'creativity', 'ru-RU', '(creativity) Группа планет: социальные (Юпитер, Сатурн) — рост, правила и долгие цели.', 108, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.planets.group.social.present' AND locale = 'ru-RU' AND (topic_category = 'creativity')
);

UPDATE knowledge_items
SET text = '(creativity) Социальных планет в группе: 0 из 2.', priority = 98, is_active = 1, meta_json = '{}'
WHERE key = 'natal.planets.group.social.count.0' AND locale = 'ru-RU' AND (topic_category = 'creativity');

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.planets.group.social.count.0', 'creativity', 'ru-RU', '(creativity) Социальных планет в группе: 0 из 2.', 98, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.planets.group.social.count.0' AND locale = 'ru-RU' AND (topic_category = 'creativity')
);

UPDATE knowledge_items
SET text = '(creativity) Социальных планет в группе: 1 из 2.', priority = 98, is_active = 1, meta_json = '{}'
WHERE key = 'natal.planets.group.social.count.1' AND locale = 'ru-RU' AND (topic_category = 'creativity');

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.planets.group.social.count.1', 'creativity', 'ru-RU', '(creativity) Социальных планет в группе: 1 из 2.', 98, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.planets.group.social.count.1' AND locale = 'ru-RU' AND (topic_category = 'creativity')
);

UPDATE knowledge_items
SET text = '(creativity) Социальных планет в группе: 2 из 2.', priority = 98, is_active = 1, meta_json = '{}'
WHERE key = 'natal.planets.group.social.count.2' AND locale = 'ru-RU' AND (topic_category = 'creativity');

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.planets.group.social.count.2', 'creativity', 'ru-RU', '(creativity) Социальных планет в группе: 2 из 2.', 98, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.planets.group.social.count.2' AND locale = 'ru-RU' AND (topic_category = 'creativity')
);

UPDATE knowledge_items
SET text = '(creativity) Группа планет: высшие (Уран, Нептун, Плутон) — глубинные циклы, трансформация и перемены.', priority = 108, is_active = 1, meta_json = '{}'
WHERE key = 'natal.planets.group.outer.present' AND locale = 'ru-RU' AND (topic_category = 'creativity');

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.planets.group.outer.present', 'creativity', 'ru-RU', '(creativity) Группа планет: высшие (Уран, Нептун, Плутон) — глубинные циклы, трансформация и перемены.', 108, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.planets.group.outer.present' AND locale = 'ru-RU' AND (topic_category = 'creativity')
);

UPDATE knowledge_items
SET text = '(creativity) Высших планет в группе: 0 из 3.', priority = 98, is_active = 1, meta_json = '{}'
WHERE key = 'natal.planets.group.outer.count.0' AND locale = 'ru-RU' AND (topic_category = 'creativity');

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.planets.group.outer.count.0', 'creativity', 'ru-RU', '(creativity) Высших планет в группе: 0 из 3.', 98, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.planets.group.outer.count.0' AND locale = 'ru-RU' AND (topic_category = 'creativity')
);

UPDATE knowledge_items
SET text = '(creativity) Высших планет в группе: 1 из 3.', priority = 98, is_active = 1, meta_json = '{}'
WHERE key = 'natal.planets.group.outer.count.1' AND locale = 'ru-RU' AND (topic_category = 'creativity');

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.planets.group.outer.count.1', 'creativity', 'ru-RU', '(creativity) Высших планет в группе: 1 из 3.', 98, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.planets.group.outer.count.1' AND locale = 'ru-RU' AND (topic_category = 'creativity')
);

UPDATE knowledge_items
SET text = '(creativity) Высших планет в группе: 2 из 3.', priority = 98, is_active = 1, meta_json = '{}'
WHERE key = 'natal.planets.group.outer.count.2' AND locale = 'ru-RU' AND (topic_category = 'creativity');

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.planets.group.outer.count.2', 'creativity', 'ru-RU', '(creativity) Высших планет в группе: 2 из 3.', 98, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.planets.group.outer.count.2' AND locale = 'ru-RU' AND (topic_category = 'creativity')
);

UPDATE knowledge_items
SET text = '(creativity) Высших планет в группе: 3 из 3.', priority = 98, is_active = 1, meta_json = '{}'
WHERE key = 'natal.planets.group.outer.count.3' AND locale = 'ru-RU' AND (topic_category = 'creativity');

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.planets.group.outer.count.3', 'creativity', 'ru-RU', '(creativity) Высших планет в группе: 3 из 3.', 98, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.planets.group.outer.count.3' AND locale = 'ru-RU' AND (topic_category = 'creativity')
);

UPDATE knowledge_items
SET text = '(emotional_world) Группа планет: светила (Солнце и Луна) — базовый тон личности и эмоциональный фон.', priority = 108, is_active = 1, meta_json = '{}'
WHERE key = 'natal.planets.group.luminaries.present' AND locale = 'ru-RU' AND (topic_category = 'emotional_world');

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.planets.group.luminaries.present', 'emotional_world', 'ru-RU', '(emotional_world) Группа планет: светила (Солнце и Луна) — базовый тон личности и эмоциональный фон.', 108, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.planets.group.luminaries.present' AND locale = 'ru-RU' AND (topic_category = 'emotional_world')
);

UPDATE knowledge_items
SET text = '(emotional_world) Светил в группе: 0 из 2.', priority = 98, is_active = 1, meta_json = '{}'
WHERE key = 'natal.planets.group.luminaries.count.0' AND locale = 'ru-RU' AND (topic_category = 'emotional_world');

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.planets.group.luminaries.count.0', 'emotional_world', 'ru-RU', '(emotional_world) Светил в группе: 0 из 2.', 98, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.planets.group.luminaries.count.0' AND locale = 'ru-RU' AND (topic_category = 'emotional_world')
);

UPDATE knowledge_items
SET text = '(emotional_world) Светил в группе: 1 из 2.', priority = 98, is_active = 1, meta_json = '{}'
WHERE key = 'natal.planets.group.luminaries.count.1' AND locale = 'ru-RU' AND (topic_category = 'emotional_world');

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.planets.group.luminaries.count.1', 'emotional_world', 'ru-RU', '(emotional_world) Светил в группе: 1 из 2.', 98, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.planets.group.luminaries.count.1' AND locale = 'ru-RU' AND (topic_category = 'emotional_world')
);

UPDATE knowledge_items
SET text = '(emotional_world) Светил в группе: 2 из 2.', priority = 98, is_active = 1, meta_json = '{}'
WHERE key = 'natal.planets.group.luminaries.count.2' AND locale = 'ru-RU' AND (topic_category = 'emotional_world');

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.planets.group.luminaries.count.2', 'emotional_world', 'ru-RU', '(emotional_world) Светил в группе: 2 из 2.', 98, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.planets.group.luminaries.count.2' AND locale = 'ru-RU' AND (topic_category = 'emotional_world')
);

UPDATE knowledge_items
SET text = '(emotional_world) Группа планет: личные (Меркурий, Венера, Марс) — мышление, притяжение и способ действовать.', priority = 108, is_active = 1, meta_json = '{}'
WHERE key = 'natal.planets.group.inner.present' AND locale = 'ru-RU' AND (topic_category = 'emotional_world');

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.planets.group.inner.present', 'emotional_world', 'ru-RU', '(emotional_world) Группа планет: личные (Меркурий, Венера, Марс) — мышление, притяжение и способ действовать.', 108, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.planets.group.inner.present' AND locale = 'ru-RU' AND (topic_category = 'emotional_world')
);

UPDATE knowledge_items
SET text = '(emotional_world) Личных планет в группе: 0 из 3.', priority = 98, is_active = 1, meta_json = '{}'
WHERE key = 'natal.planets.group.inner.count.0' AND locale = 'ru-RU' AND (topic_category = 'emotional_world');

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.planets.group.inner.count.0', 'emotional_world', 'ru-RU', '(emotional_world) Личных планет в группе: 0 из 3.', 98, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.planets.group.inner.count.0' AND locale = 'ru-RU' AND (topic_category = 'emotional_world')
);

UPDATE knowledge_items
SET text = '(emotional_world) Личных планет в группе: 1 из 3.', priority = 98, is_active = 1, meta_json = '{}'
WHERE key = 'natal.planets.group.inner.count.1' AND locale = 'ru-RU' AND (topic_category = 'emotional_world');

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.planets.group.inner.count.1', 'emotional_world', 'ru-RU', '(emotional_world) Личных планет в группе: 1 из 3.', 98, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.planets.group.inner.count.1' AND locale = 'ru-RU' AND (topic_category = 'emotional_world')
);

UPDATE knowledge_items
SET text = '(emotional_world) Личных планет в группе: 2 из 3.', priority = 98, is_active = 1, meta_json = '{}'
WHERE key = 'natal.planets.group.inner.count.2' AND locale = 'ru-RU' AND (topic_category = 'emotional_world');

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.planets.group.inner.count.2', 'emotional_world', 'ru-RU', '(emotional_world) Личных планет в группе: 2 из 3.', 98, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.planets.group.inner.count.2' AND locale = 'ru-RU' AND (topic_category = 'emotional_world')
);

UPDATE knowledge_items
SET text = '(emotional_world) Личных планет в группе: 3 из 3.', priority = 98, is_active = 1, meta_json = '{}'
WHERE key = 'natal.planets.group.inner.count.3' AND locale = 'ru-RU' AND (topic_category = 'emotional_world');

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.planets.group.inner.count.3', 'emotional_world', 'ru-RU', '(emotional_world) Личных планет в группе: 3 из 3.', 98, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.planets.group.inner.count.3' AND locale = 'ru-RU' AND (topic_category = 'emotional_world')
);

UPDATE knowledge_items
SET text = '(emotional_world) Группа планет: социальные (Юпитер, Сатурн) — рост, правила и долгие цели.', priority = 108, is_active = 1, meta_json = '{}'
WHERE key = 'natal.planets.group.social.present' AND locale = 'ru-RU' AND (topic_category = 'emotional_world');

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.planets.group.social.present', 'emotional_world', 'ru-RU', '(emotional_world) Группа планет: социальные (Юпитер, Сатурн) — рост, правила и долгие цели.', 108, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.planets.group.social.present' AND locale = 'ru-RU' AND (topic_category = 'emotional_world')
);

UPDATE knowledge_items
SET text = '(emotional_world) Социальных планет в группе: 0 из 2.', priority = 98, is_active = 1, meta_json = '{}'
WHERE key = 'natal.planets.group.social.count.0' AND locale = 'ru-RU' AND (topic_category = 'emotional_world');

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.planets.group.social.count.0', 'emotional_world', 'ru-RU', '(emotional_world) Социальных планет в группе: 0 из 2.', 98, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.planets.group.social.count.0' AND locale = 'ru-RU' AND (topic_category = 'emotional_world')
);

UPDATE knowledge_items
SET text = '(emotional_world) Социальных планет в группе: 1 из 2.', priority = 98, is_active = 1, meta_json = '{}'
WHERE key = 'natal.planets.group.social.count.1' AND locale = 'ru-RU' AND (topic_category = 'emotional_world');

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.planets.group.social.count.1', 'emotional_world', 'ru-RU', '(emotional_world) Социальных планет в группе: 1 из 2.', 98, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.planets.group.social.count.1' AND locale = 'ru-RU' AND (topic_category = 'emotional_world')
);

UPDATE knowledge_items
SET text = '(emotional_world) Социальных планет в группе: 2 из 2.', priority = 98, is_active = 1, meta_json = '{}'
WHERE key = 'natal.planets.group.social.count.2' AND locale = 'ru-RU' AND (topic_category = 'emotional_world');

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.planets.group.social.count.2', 'emotional_world', 'ru-RU', '(emotional_world) Социальных планет в группе: 2 из 2.', 98, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.planets.group.social.count.2' AND locale = 'ru-RU' AND (topic_category = 'emotional_world')
);

UPDATE knowledge_items
SET text = '(emotional_world) Группа планет: высшие (Уран, Нептун, Плутон) — глубинные циклы, трансформация и перемены.', priority = 108, is_active = 1, meta_json = '{}'
WHERE key = 'natal.planets.group.outer.present' AND locale = 'ru-RU' AND (topic_category = 'emotional_world');

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.planets.group.outer.present', 'emotional_world', 'ru-RU', '(emotional_world) Группа планет: высшие (Уран, Нептун, Плутон) — глубинные циклы, трансформация и перемены.', 108, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.planets.group.outer.present' AND locale = 'ru-RU' AND (topic_category = 'emotional_world')
);

UPDATE knowledge_items
SET text = '(emotional_world) Высших планет в группе: 0 из 3.', priority = 98, is_active = 1, meta_json = '{}'
WHERE key = 'natal.planets.group.outer.count.0' AND locale = 'ru-RU' AND (topic_category = 'emotional_world');

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.planets.group.outer.count.0', 'emotional_world', 'ru-RU', '(emotional_world) Высших планет в группе: 0 из 3.', 98, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.planets.group.outer.count.0' AND locale = 'ru-RU' AND (topic_category = 'emotional_world')
);

UPDATE knowledge_items
SET text = '(emotional_world) Высших планет в группе: 1 из 3.', priority = 98, is_active = 1, meta_json = '{}'
WHERE key = 'natal.planets.group.outer.count.1' AND locale = 'ru-RU' AND (topic_category = 'emotional_world');

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.planets.group.outer.count.1', 'emotional_world', 'ru-RU', '(emotional_world) Высших планет в группе: 1 из 3.', 98, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.planets.group.outer.count.1' AND locale = 'ru-RU' AND (topic_category = 'emotional_world')
);

UPDATE knowledge_items
SET text = '(emotional_world) Высших планет в группе: 2 из 3.', priority = 98, is_active = 1, meta_json = '{}'
WHERE key = 'natal.planets.group.outer.count.2' AND locale = 'ru-RU' AND (topic_category = 'emotional_world');

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.planets.group.outer.count.2', 'emotional_world', 'ru-RU', '(emotional_world) Высших планет в группе: 2 из 3.', 98, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.planets.group.outer.count.2' AND locale = 'ru-RU' AND (topic_category = 'emotional_world')
);

UPDATE knowledge_items
SET text = '(emotional_world) Высших планет в группе: 3 из 3.', priority = 98, is_active = 1, meta_json = '{}'
WHERE key = 'natal.planets.group.outer.count.3' AND locale = 'ru-RU' AND (topic_category = 'emotional_world');

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.planets.group.outer.count.3', 'emotional_world', 'ru-RU', '(emotional_world) Высших планет в группе: 3 из 3.', 98, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.planets.group.outer.count.3' AND locale = 'ru-RU' AND (topic_category = 'emotional_world')
);

UPDATE knowledge_items
SET text = '(how_others_see_me) Группа планет: светила (Солнце и Луна) — базовый тон личности и эмоциональный фон.', priority = 108, is_active = 1, meta_json = '{}'
WHERE key = 'natal.planets.group.luminaries.present' AND locale = 'ru-RU' AND (topic_category = 'how_others_see_me');

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.planets.group.luminaries.present', 'how_others_see_me', 'ru-RU', '(how_others_see_me) Группа планет: светила (Солнце и Луна) — базовый тон личности и эмоциональный фон.', 108, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.planets.group.luminaries.present' AND locale = 'ru-RU' AND (topic_category = 'how_others_see_me')
);

UPDATE knowledge_items
SET text = '(how_others_see_me) Светил в группе: 0 из 2.', priority = 98, is_active = 1, meta_json = '{}'
WHERE key = 'natal.planets.group.luminaries.count.0' AND locale = 'ru-RU' AND (topic_category = 'how_others_see_me');

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.planets.group.luminaries.count.0', 'how_others_see_me', 'ru-RU', '(how_others_see_me) Светил в группе: 0 из 2.', 98, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.planets.group.luminaries.count.0' AND locale = 'ru-RU' AND (topic_category = 'how_others_see_me')
);

UPDATE knowledge_items
SET text = '(how_others_see_me) Светил в группе: 1 из 2.', priority = 98, is_active = 1, meta_json = '{}'
WHERE key = 'natal.planets.group.luminaries.count.1' AND locale = 'ru-RU' AND (topic_category = 'how_others_see_me');

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.planets.group.luminaries.count.1', 'how_others_see_me', 'ru-RU', '(how_others_see_me) Светил в группе: 1 из 2.', 98, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.planets.group.luminaries.count.1' AND locale = 'ru-RU' AND (topic_category = 'how_others_see_me')
);

UPDATE knowledge_items
SET text = '(how_others_see_me) Светил в группе: 2 из 2.', priority = 98, is_active = 1, meta_json = '{}'
WHERE key = 'natal.planets.group.luminaries.count.2' AND locale = 'ru-RU' AND (topic_category = 'how_others_see_me');

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.planets.group.luminaries.count.2', 'how_others_see_me', 'ru-RU', '(how_others_see_me) Светил в группе: 2 из 2.', 98, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.planets.group.luminaries.count.2' AND locale = 'ru-RU' AND (topic_category = 'how_others_see_me')
);

UPDATE knowledge_items
SET text = '(how_others_see_me) Группа планет: личные (Меркурий, Венера, Марс) — мышление, притяжение и способ действовать.', priority = 108, is_active = 1, meta_json = '{}'
WHERE key = 'natal.planets.group.inner.present' AND locale = 'ru-RU' AND (topic_category = 'how_others_see_me');

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.planets.group.inner.present', 'how_others_see_me', 'ru-RU', '(how_others_see_me) Группа планет: личные (Меркурий, Венера, Марс) — мышление, притяжение и способ действовать.', 108, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.planets.group.inner.present' AND locale = 'ru-RU' AND (topic_category = 'how_others_see_me')
);

UPDATE knowledge_items
SET text = '(how_others_see_me) Личных планет в группе: 0 из 3.', priority = 98, is_active = 1, meta_json = '{}'
WHERE key = 'natal.planets.group.inner.count.0' AND locale = 'ru-RU' AND (topic_category = 'how_others_see_me');

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.planets.group.inner.count.0', 'how_others_see_me', 'ru-RU', '(how_others_see_me) Личных планет в группе: 0 из 3.', 98, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.planets.group.inner.count.0' AND locale = 'ru-RU' AND (topic_category = 'how_others_see_me')
);

UPDATE knowledge_items
SET text = '(how_others_see_me) Личных планет в группе: 1 из 3.', priority = 98, is_active = 1, meta_json = '{}'
WHERE key = 'natal.planets.group.inner.count.1' AND locale = 'ru-RU' AND (topic_category = 'how_others_see_me');

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.planets.group.inner.count.1', 'how_others_see_me', 'ru-RU', '(how_others_see_me) Личных планет в группе: 1 из 3.', 98, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.planets.group.inner.count.1' AND locale = 'ru-RU' AND (topic_category = 'how_others_see_me')
);

UPDATE knowledge_items
SET text = '(how_others_see_me) Личных планет в группе: 2 из 3.', priority = 98, is_active = 1, meta_json = '{}'
WHERE key = 'natal.planets.group.inner.count.2' AND locale = 'ru-RU' AND (topic_category = 'how_others_see_me');

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.planets.group.inner.count.2', 'how_others_see_me', 'ru-RU', '(how_others_see_me) Личных планет в группе: 2 из 3.', 98, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.planets.group.inner.count.2' AND locale = 'ru-RU' AND (topic_category = 'how_others_see_me')
);

UPDATE knowledge_items
SET text = '(how_others_see_me) Личных планет в группе: 3 из 3.', priority = 98, is_active = 1, meta_json = '{}'
WHERE key = 'natal.planets.group.inner.count.3' AND locale = 'ru-RU' AND (topic_category = 'how_others_see_me');

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.planets.group.inner.count.3', 'how_others_see_me', 'ru-RU', '(how_others_see_me) Личных планет в группе: 3 из 3.', 98, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.planets.group.inner.count.3' AND locale = 'ru-RU' AND (topic_category = 'how_others_see_me')
);

UPDATE knowledge_items
SET text = '(how_others_see_me) Группа планет: социальные (Юпитер, Сатурн) — рост, правила и долгие цели.', priority = 108, is_active = 1, meta_json = '{}'
WHERE key = 'natal.planets.group.social.present' AND locale = 'ru-RU' AND (topic_category = 'how_others_see_me');

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.planets.group.social.present', 'how_others_see_me', 'ru-RU', '(how_others_see_me) Группа планет: социальные (Юпитер, Сатурн) — рост, правила и долгие цели.', 108, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.planets.group.social.present' AND locale = 'ru-RU' AND (topic_category = 'how_others_see_me')
);

UPDATE knowledge_items
SET text = '(how_others_see_me) Социальных планет в группе: 0 из 2.', priority = 98, is_active = 1, meta_json = '{}'
WHERE key = 'natal.planets.group.social.count.0' AND locale = 'ru-RU' AND (topic_category = 'how_others_see_me');

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.planets.group.social.count.0', 'how_others_see_me', 'ru-RU', '(how_others_see_me) Социальных планет в группе: 0 из 2.', 98, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.planets.group.social.count.0' AND locale = 'ru-RU' AND (topic_category = 'how_others_see_me')
);

UPDATE knowledge_items
SET text = '(how_others_see_me) Социальных планет в группе: 1 из 2.', priority = 98, is_active = 1, meta_json = '{}'
WHERE key = 'natal.planets.group.social.count.1' AND locale = 'ru-RU' AND (topic_category = 'how_others_see_me');

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.planets.group.social.count.1', 'how_others_see_me', 'ru-RU', '(how_others_see_me) Социальных планет в группе: 1 из 2.', 98, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.planets.group.social.count.1' AND locale = 'ru-RU' AND (topic_category = 'how_others_see_me')
);

UPDATE knowledge_items
SET text = '(how_others_see_me) Социальных планет в группе: 2 из 2.', priority = 98, is_active = 1, meta_json = '{}'
WHERE key = 'natal.planets.group.social.count.2' AND locale = 'ru-RU' AND (topic_category = 'how_others_see_me');

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.planets.group.social.count.2', 'how_others_see_me', 'ru-RU', '(how_others_see_me) Социальных планет в группе: 2 из 2.', 98, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.planets.group.social.count.2' AND locale = 'ru-RU' AND (topic_category = 'how_others_see_me')
);

UPDATE knowledge_items
SET text = '(how_others_see_me) Группа планет: высшие (Уран, Нептун, Плутон) — глубинные циклы, трансформация и перемены.', priority = 108, is_active = 1, meta_json = '{}'
WHERE key = 'natal.planets.group.outer.present' AND locale = 'ru-RU' AND (topic_category = 'how_others_see_me');

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.planets.group.outer.present', 'how_others_see_me', 'ru-RU', '(how_others_see_me) Группа планет: высшие (Уран, Нептун, Плутон) — глубинные циклы, трансформация и перемены.', 108, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.planets.group.outer.present' AND locale = 'ru-RU' AND (topic_category = 'how_others_see_me')
);

UPDATE knowledge_items
SET text = '(how_others_see_me) Высших планет в группе: 0 из 3.', priority = 98, is_active = 1, meta_json = '{}'
WHERE key = 'natal.planets.group.outer.count.0' AND locale = 'ru-RU' AND (topic_category = 'how_others_see_me');

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.planets.group.outer.count.0', 'how_others_see_me', 'ru-RU', '(how_others_see_me) Высших планет в группе: 0 из 3.', 98, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.planets.group.outer.count.0' AND locale = 'ru-RU' AND (topic_category = 'how_others_see_me')
);

UPDATE knowledge_items
SET text = '(how_others_see_me) Высших планет в группе: 1 из 3.', priority = 98, is_active = 1, meta_json = '{}'
WHERE key = 'natal.planets.group.outer.count.1' AND locale = 'ru-RU' AND (topic_category = 'how_others_see_me');

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.planets.group.outer.count.1', 'how_others_see_me', 'ru-RU', '(how_others_see_me) Высших планет в группе: 1 из 3.', 98, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.planets.group.outer.count.1' AND locale = 'ru-RU' AND (topic_category = 'how_others_see_me')
);

UPDATE knowledge_items
SET text = '(how_others_see_me) Высших планет в группе: 2 из 3.', priority = 98, is_active = 1, meta_json = '{}'
WHERE key = 'natal.planets.group.outer.count.2' AND locale = 'ru-RU' AND (topic_category = 'how_others_see_me');

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.planets.group.outer.count.2', 'how_others_see_me', 'ru-RU', '(how_others_see_me) Высших планет в группе: 2 из 3.', 98, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.planets.group.outer.count.2' AND locale = 'ru-RU' AND (topic_category = 'how_others_see_me')
);

UPDATE knowledge_items
SET text = '(how_others_see_me) Высших планет в группе: 3 из 3.', priority = 98, is_active = 1, meta_json = '{}'
WHERE key = 'natal.planets.group.outer.count.3' AND locale = 'ru-RU' AND (topic_category = 'how_others_see_me');

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.planets.group.outer.count.3', 'how_others_see_me', 'ru-RU', '(how_others_see_me) Высших планет в группе: 3 из 3.', 98, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.planets.group.outer.count.3' AND locale = 'ru-RU' AND (topic_category = 'how_others_see_me')
);

UPDATE knowledge_items
SET text = '(karmic_tasks) Группа планет: светила (Солнце и Луна) — базовый тон личности и эмоциональный фон.', priority = 108, is_active = 1, meta_json = '{}'
WHERE key = 'natal.planets.group.luminaries.present' AND locale = 'ru-RU' AND (topic_category = 'karmic_tasks');

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.planets.group.luminaries.present', 'karmic_tasks', 'ru-RU', '(karmic_tasks) Группа планет: светила (Солнце и Луна) — базовый тон личности и эмоциональный фон.', 108, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.planets.group.luminaries.present' AND locale = 'ru-RU' AND (topic_category = 'karmic_tasks')
);

UPDATE knowledge_items
SET text = '(karmic_tasks) Светил в группе: 0 из 2.', priority = 98, is_active = 1, meta_json = '{}'
WHERE key = 'natal.planets.group.luminaries.count.0' AND locale = 'ru-RU' AND (topic_category = 'karmic_tasks');

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.planets.group.luminaries.count.0', 'karmic_tasks', 'ru-RU', '(karmic_tasks) Светил в группе: 0 из 2.', 98, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.planets.group.luminaries.count.0' AND locale = 'ru-RU' AND (topic_category = 'karmic_tasks')
);

UPDATE knowledge_items
SET text = '(karmic_tasks) Светил в группе: 1 из 2.', priority = 98, is_active = 1, meta_json = '{}'
WHERE key = 'natal.planets.group.luminaries.count.1' AND locale = 'ru-RU' AND (topic_category = 'karmic_tasks');

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.planets.group.luminaries.count.1', 'karmic_tasks', 'ru-RU', '(karmic_tasks) Светил в группе: 1 из 2.', 98, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.planets.group.luminaries.count.1' AND locale = 'ru-RU' AND (topic_category = 'karmic_tasks')
);

UPDATE knowledge_items
SET text = '(karmic_tasks) Светил в группе: 2 из 2.', priority = 98, is_active = 1, meta_json = '{}'
WHERE key = 'natal.planets.group.luminaries.count.2' AND locale = 'ru-RU' AND (topic_category = 'karmic_tasks');

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.planets.group.luminaries.count.2', 'karmic_tasks', 'ru-RU', '(karmic_tasks) Светил в группе: 2 из 2.', 98, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.planets.group.luminaries.count.2' AND locale = 'ru-RU' AND (topic_category = 'karmic_tasks')
);

UPDATE knowledge_items
SET text = '(karmic_tasks) Группа планет: личные (Меркурий, Венера, Марс) — мышление, притяжение и способ действовать.', priority = 108, is_active = 1, meta_json = '{}'
WHERE key = 'natal.planets.group.inner.present' AND locale = 'ru-RU' AND (topic_category = 'karmic_tasks');

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.planets.group.inner.present', 'karmic_tasks', 'ru-RU', '(karmic_tasks) Группа планет: личные (Меркурий, Венера, Марс) — мышление, притяжение и способ действовать.', 108, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.planets.group.inner.present' AND locale = 'ru-RU' AND (topic_category = 'karmic_tasks')
);

UPDATE knowledge_items
SET text = '(karmic_tasks) Личных планет в группе: 0 из 3.', priority = 98, is_active = 1, meta_json = '{}'
WHERE key = 'natal.planets.group.inner.count.0' AND locale = 'ru-RU' AND (topic_category = 'karmic_tasks');

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.planets.group.inner.count.0', 'karmic_tasks', 'ru-RU', '(karmic_tasks) Личных планет в группе: 0 из 3.', 98, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.planets.group.inner.count.0' AND locale = 'ru-RU' AND (topic_category = 'karmic_tasks')
);

UPDATE knowledge_items
SET text = '(karmic_tasks) Личных планет в группе: 1 из 3.', priority = 98, is_active = 1, meta_json = '{}'
WHERE key = 'natal.planets.group.inner.count.1' AND locale = 'ru-RU' AND (topic_category = 'karmic_tasks');

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.planets.group.inner.count.1', 'karmic_tasks', 'ru-RU', '(karmic_tasks) Личных планет в группе: 1 из 3.', 98, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.planets.group.inner.count.1' AND locale = 'ru-RU' AND (topic_category = 'karmic_tasks')
);

UPDATE knowledge_items
SET text = '(karmic_tasks) Личных планет в группе: 2 из 3.', priority = 98, is_active = 1, meta_json = '{}'
WHERE key = 'natal.planets.group.inner.count.2' AND locale = 'ru-RU' AND (topic_category = 'karmic_tasks');

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.planets.group.inner.count.2', 'karmic_tasks', 'ru-RU', '(karmic_tasks) Личных планет в группе: 2 из 3.', 98, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.planets.group.inner.count.2' AND locale = 'ru-RU' AND (topic_category = 'karmic_tasks')
);

UPDATE knowledge_items
SET text = '(karmic_tasks) Личных планет в группе: 3 из 3.', priority = 98, is_active = 1, meta_json = '{}'
WHERE key = 'natal.planets.group.inner.count.3' AND locale = 'ru-RU' AND (topic_category = 'karmic_tasks');

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.planets.group.inner.count.3', 'karmic_tasks', 'ru-RU', '(karmic_tasks) Личных планет в группе: 3 из 3.', 98, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.planets.group.inner.count.3' AND locale = 'ru-RU' AND (topic_category = 'karmic_tasks')
);

UPDATE knowledge_items
SET text = '(karmic_tasks) Группа планет: социальные (Юпитер, Сатурн) — рост, правила и долгие цели.', priority = 108, is_active = 1, meta_json = '{}'
WHERE key = 'natal.planets.group.social.present' AND locale = 'ru-RU' AND (topic_category = 'karmic_tasks');

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.planets.group.social.present', 'karmic_tasks', 'ru-RU', '(karmic_tasks) Группа планет: социальные (Юпитер, Сатурн) — рост, правила и долгие цели.', 108, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.planets.group.social.present' AND locale = 'ru-RU' AND (topic_category = 'karmic_tasks')
);

UPDATE knowledge_items
SET text = '(karmic_tasks) Социальных планет в группе: 0 из 2.', priority = 98, is_active = 1, meta_json = '{}'
WHERE key = 'natal.planets.group.social.count.0' AND locale = 'ru-RU' AND (topic_category = 'karmic_tasks');

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.planets.group.social.count.0', 'karmic_tasks', 'ru-RU', '(karmic_tasks) Социальных планет в группе: 0 из 2.', 98, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.planets.group.social.count.0' AND locale = 'ru-RU' AND (topic_category = 'karmic_tasks')
);

UPDATE knowledge_items
SET text = '(karmic_tasks) Социальных планет в группе: 1 из 2.', priority = 98, is_active = 1, meta_json = '{}'
WHERE key = 'natal.planets.group.social.count.1' AND locale = 'ru-RU' AND (topic_category = 'karmic_tasks');

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.planets.group.social.count.1', 'karmic_tasks', 'ru-RU', '(karmic_tasks) Социальных планет в группе: 1 из 2.', 98, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.planets.group.social.count.1' AND locale = 'ru-RU' AND (topic_category = 'karmic_tasks')
);

UPDATE knowledge_items
SET text = '(karmic_tasks) Социальных планет в группе: 2 из 2.', priority = 98, is_active = 1, meta_json = '{}'
WHERE key = 'natal.planets.group.social.count.2' AND locale = 'ru-RU' AND (topic_category = 'karmic_tasks');

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.planets.group.social.count.2', 'karmic_tasks', 'ru-RU', '(karmic_tasks) Социальных планет в группе: 2 из 2.', 98, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.planets.group.social.count.2' AND locale = 'ru-RU' AND (topic_category = 'karmic_tasks')
);

UPDATE knowledge_items
SET text = '(karmic_tasks) Группа планет: высшие (Уран, Нептун, Плутон) — глубинные циклы, трансформация и перемены.', priority = 108, is_active = 1, meta_json = '{}'
WHERE key = 'natal.planets.group.outer.present' AND locale = 'ru-RU' AND (topic_category = 'karmic_tasks');

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.planets.group.outer.present', 'karmic_tasks', 'ru-RU', '(karmic_tasks) Группа планет: высшие (Уран, Нептун, Плутон) — глубинные циклы, трансформация и перемены.', 108, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.planets.group.outer.present' AND locale = 'ru-RU' AND (topic_category = 'karmic_tasks')
);

UPDATE knowledge_items
SET text = '(karmic_tasks) Высших планет в группе: 0 из 3.', priority = 98, is_active = 1, meta_json = '{}'
WHERE key = 'natal.planets.group.outer.count.0' AND locale = 'ru-RU' AND (topic_category = 'karmic_tasks');

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.planets.group.outer.count.0', 'karmic_tasks', 'ru-RU', '(karmic_tasks) Высших планет в группе: 0 из 3.', 98, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.planets.group.outer.count.0' AND locale = 'ru-RU' AND (topic_category = 'karmic_tasks')
);

UPDATE knowledge_items
SET text = '(karmic_tasks) Высших планет в группе: 1 из 3.', priority = 98, is_active = 1, meta_json = '{}'
WHERE key = 'natal.planets.group.outer.count.1' AND locale = 'ru-RU' AND (topic_category = 'karmic_tasks');

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.planets.group.outer.count.1', 'karmic_tasks', 'ru-RU', '(karmic_tasks) Высших планет в группе: 1 из 3.', 98, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.planets.group.outer.count.1' AND locale = 'ru-RU' AND (topic_category = 'karmic_tasks')
);

UPDATE knowledge_items
SET text = '(karmic_tasks) Высших планет в группе: 2 из 3.', priority = 98, is_active = 1, meta_json = '{}'
WHERE key = 'natal.planets.group.outer.count.2' AND locale = 'ru-RU' AND (topic_category = 'karmic_tasks');

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.planets.group.outer.count.2', 'karmic_tasks', 'ru-RU', '(karmic_tasks) Высших планет в группе: 2 из 3.', 98, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.planets.group.outer.count.2' AND locale = 'ru-RU' AND (topic_category = 'karmic_tasks')
);

UPDATE knowledge_items
SET text = '(karmic_tasks) Высших планет в группе: 3 из 3.', priority = 98, is_active = 1, meta_json = '{}'
WHERE key = 'natal.planets.group.outer.count.3' AND locale = 'ru-RU' AND (topic_category = 'karmic_tasks');

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.planets.group.outer.count.3', 'karmic_tasks', 'ru-RU', '(karmic_tasks) Высших планет в группе: 3 из 3.', 98, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.planets.group.outer.count.3' AND locale = 'ru-RU' AND (topic_category = 'karmic_tasks')
);

UPDATE knowledge_items
SET text = '(love_intimacy) Группа планет: светила (Солнце и Луна) — базовый тон личности и эмоциональный фон.', priority = 108, is_active = 1, meta_json = '{}'
WHERE key = 'natal.planets.group.luminaries.present' AND locale = 'ru-RU' AND (topic_category = 'love_intimacy');

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.planets.group.luminaries.present', 'love_intimacy', 'ru-RU', '(love_intimacy) Группа планет: светила (Солнце и Луна) — базовый тон личности и эмоциональный фон.', 108, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.planets.group.luminaries.present' AND locale = 'ru-RU' AND (topic_category = 'love_intimacy')
);

UPDATE knowledge_items
SET text = '(love_intimacy) Светил в группе: 0 из 2.', priority = 98, is_active = 1, meta_json = '{}'
WHERE key = 'natal.planets.group.luminaries.count.0' AND locale = 'ru-RU' AND (topic_category = 'love_intimacy');

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.planets.group.luminaries.count.0', 'love_intimacy', 'ru-RU', '(love_intimacy) Светил в группе: 0 из 2.', 98, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.planets.group.luminaries.count.0' AND locale = 'ru-RU' AND (topic_category = 'love_intimacy')
);

UPDATE knowledge_items
SET text = '(love_intimacy) Светил в группе: 1 из 2.', priority = 98, is_active = 1, meta_json = '{}'
WHERE key = 'natal.planets.group.luminaries.count.1' AND locale = 'ru-RU' AND (topic_category = 'love_intimacy');

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.planets.group.luminaries.count.1', 'love_intimacy', 'ru-RU', '(love_intimacy) Светил в группе: 1 из 2.', 98, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.planets.group.luminaries.count.1' AND locale = 'ru-RU' AND (topic_category = 'love_intimacy')
);

UPDATE knowledge_items
SET text = '(love_intimacy) Светил в группе: 2 из 2.', priority = 98, is_active = 1, meta_json = '{}'
WHERE key = 'natal.planets.group.luminaries.count.2' AND locale = 'ru-RU' AND (topic_category = 'love_intimacy');

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.planets.group.luminaries.count.2', 'love_intimacy', 'ru-RU', '(love_intimacy) Светил в группе: 2 из 2.', 98, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.planets.group.luminaries.count.2' AND locale = 'ru-RU' AND (topic_category = 'love_intimacy')
);

UPDATE knowledge_items
SET text = '(love_intimacy) Группа планет: личные (Меркурий, Венера, Марс) — мышление, притяжение и способ действовать.', priority = 108, is_active = 1, meta_json = '{}'
WHERE key = 'natal.planets.group.inner.present' AND locale = 'ru-RU' AND (topic_category = 'love_intimacy');

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.planets.group.inner.present', 'love_intimacy', 'ru-RU', '(love_intimacy) Группа планет: личные (Меркурий, Венера, Марс) — мышление, притяжение и способ действовать.', 108, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.planets.group.inner.present' AND locale = 'ru-RU' AND (topic_category = 'love_intimacy')
);

UPDATE knowledge_items
SET text = '(love_intimacy) Личных планет в группе: 0 из 3.', priority = 98, is_active = 1, meta_json = '{}'
WHERE key = 'natal.planets.group.inner.count.0' AND locale = 'ru-RU' AND (topic_category = 'love_intimacy');

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.planets.group.inner.count.0', 'love_intimacy', 'ru-RU', '(love_intimacy) Личных планет в группе: 0 из 3.', 98, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.planets.group.inner.count.0' AND locale = 'ru-RU' AND (topic_category = 'love_intimacy')
);

UPDATE knowledge_items
SET text = '(love_intimacy) Личных планет в группе: 1 из 3.', priority = 98, is_active = 1, meta_json = '{}'
WHERE key = 'natal.planets.group.inner.count.1' AND locale = 'ru-RU' AND (topic_category = 'love_intimacy');

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.planets.group.inner.count.1', 'love_intimacy', 'ru-RU', '(love_intimacy) Личных планет в группе: 1 из 3.', 98, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.planets.group.inner.count.1' AND locale = 'ru-RU' AND (topic_category = 'love_intimacy')
);

UPDATE knowledge_items
SET text = '(love_intimacy) Личных планет в группе: 2 из 3.', priority = 98, is_active = 1, meta_json = '{}'
WHERE key = 'natal.planets.group.inner.count.2' AND locale = 'ru-RU' AND (topic_category = 'love_intimacy');

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.planets.group.inner.count.2', 'love_intimacy', 'ru-RU', '(love_intimacy) Личных планет в группе: 2 из 3.', 98, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.planets.group.inner.count.2' AND locale = 'ru-RU' AND (topic_category = 'love_intimacy')
);

UPDATE knowledge_items
SET text = '(love_intimacy) Личных планет в группе: 3 из 3.', priority = 98, is_active = 1, meta_json = '{}'
WHERE key = 'natal.planets.group.inner.count.3' AND locale = 'ru-RU' AND (topic_category = 'love_intimacy');

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.planets.group.inner.count.3', 'love_intimacy', 'ru-RU', '(love_intimacy) Личных планет в группе: 3 из 3.', 98, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.planets.group.inner.count.3' AND locale = 'ru-RU' AND (topic_category = 'love_intimacy')
);

UPDATE knowledge_items
SET text = '(love_intimacy) Группа планет: социальные (Юпитер, Сатурн) — рост, правила и долгие цели.', priority = 108, is_active = 1, meta_json = '{}'
WHERE key = 'natal.planets.group.social.present' AND locale = 'ru-RU' AND (topic_category = 'love_intimacy');

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.planets.group.social.present', 'love_intimacy', 'ru-RU', '(love_intimacy) Группа планет: социальные (Юпитер, Сатурн) — рост, правила и долгие цели.', 108, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.planets.group.social.present' AND locale = 'ru-RU' AND (topic_category = 'love_intimacy')
);

UPDATE knowledge_items
SET text = '(love_intimacy) Социальных планет в группе: 0 из 2.', priority = 98, is_active = 1, meta_json = '{}'
WHERE key = 'natal.planets.group.social.count.0' AND locale = 'ru-RU' AND (topic_category = 'love_intimacy');

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.planets.group.social.count.0', 'love_intimacy', 'ru-RU', '(love_intimacy) Социальных планет в группе: 0 из 2.', 98, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.planets.group.social.count.0' AND locale = 'ru-RU' AND (topic_category = 'love_intimacy')
);

UPDATE knowledge_items
SET text = '(love_intimacy) Социальных планет в группе: 1 из 2.', priority = 98, is_active = 1, meta_json = '{}'
WHERE key = 'natal.planets.group.social.count.1' AND locale = 'ru-RU' AND (topic_category = 'love_intimacy');

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.planets.group.social.count.1', 'love_intimacy', 'ru-RU', '(love_intimacy) Социальных планет в группе: 1 из 2.', 98, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.planets.group.social.count.1' AND locale = 'ru-RU' AND (topic_category = 'love_intimacy')
);

UPDATE knowledge_items
SET text = '(love_intimacy) Социальных планет в группе: 2 из 2.', priority = 98, is_active = 1, meta_json = '{}'
WHERE key = 'natal.planets.group.social.count.2' AND locale = 'ru-RU' AND (topic_category = 'love_intimacy');

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.planets.group.social.count.2', 'love_intimacy', 'ru-RU', '(love_intimacy) Социальных планет в группе: 2 из 2.', 98, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.planets.group.social.count.2' AND locale = 'ru-RU' AND (topic_category = 'love_intimacy')
);

UPDATE knowledge_items
SET text = '(love_intimacy) Группа планет: высшие (Уран, Нептун, Плутон) — глубинные циклы, трансформация и перемены.', priority = 108, is_active = 1, meta_json = '{}'
WHERE key = 'natal.planets.group.outer.present' AND locale = 'ru-RU' AND (topic_category = 'love_intimacy');

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.planets.group.outer.present', 'love_intimacy', 'ru-RU', '(love_intimacy) Группа планет: высшие (Уран, Нептун, Плутон) — глубинные циклы, трансформация и перемены.', 108, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.planets.group.outer.present' AND locale = 'ru-RU' AND (topic_category = 'love_intimacy')
);

UPDATE knowledge_items
SET text = '(love_intimacy) Высших планет в группе: 0 из 3.', priority = 98, is_active = 1, meta_json = '{}'
WHERE key = 'natal.planets.group.outer.count.0' AND locale = 'ru-RU' AND (topic_category = 'love_intimacy');

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.planets.group.outer.count.0', 'love_intimacy', 'ru-RU', '(love_intimacy) Высших планет в группе: 0 из 3.', 98, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.planets.group.outer.count.0' AND locale = 'ru-RU' AND (topic_category = 'love_intimacy')
);

UPDATE knowledge_items
SET text = '(love_intimacy) Высших планет в группе: 1 из 3.', priority = 98, is_active = 1, meta_json = '{}'
WHERE key = 'natal.planets.group.outer.count.1' AND locale = 'ru-RU' AND (topic_category = 'love_intimacy');

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.planets.group.outer.count.1', 'love_intimacy', 'ru-RU', '(love_intimacy) Высших планет в группе: 1 из 3.', 98, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.planets.group.outer.count.1' AND locale = 'ru-RU' AND (topic_category = 'love_intimacy')
);

UPDATE knowledge_items
SET text = '(love_intimacy) Высших планет в группе: 2 из 3.', priority = 98, is_active = 1, meta_json = '{}'
WHERE key = 'natal.planets.group.outer.count.2' AND locale = 'ru-RU' AND (topic_category = 'love_intimacy');

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.planets.group.outer.count.2', 'love_intimacy', 'ru-RU', '(love_intimacy) Высших планет в группе: 2 из 3.', 98, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.planets.group.outer.count.2' AND locale = 'ru-RU' AND (topic_category = 'love_intimacy')
);

UPDATE knowledge_items
SET text = '(love_intimacy) Высших планет в группе: 3 из 3.', priority = 98, is_active = 1, meta_json = '{}'
WHERE key = 'natal.planets.group.outer.count.3' AND locale = 'ru-RU' AND (topic_category = 'love_intimacy');

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.planets.group.outer.count.3', 'love_intimacy', 'ru-RU', '(love_intimacy) Высших планет в группе: 3 из 3.', 98, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.planets.group.outer.count.3' AND locale = 'ru-RU' AND (topic_category = 'love_intimacy')
);

UPDATE knowledge_items
SET text = '(money) Группа планет: светила (Солнце и Луна) — базовый тон личности и эмоциональный фон.', priority = 108, is_active = 1, meta_json = '{}'
WHERE key = 'natal.planets.group.luminaries.present' AND locale = 'ru-RU' AND (topic_category = 'money');

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.planets.group.luminaries.present', 'money', 'ru-RU', '(money) Группа планет: светила (Солнце и Луна) — базовый тон личности и эмоциональный фон.', 108, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.planets.group.luminaries.present' AND locale = 'ru-RU' AND (topic_category = 'money')
);

UPDATE knowledge_items
SET text = '(money) Светил в группе: 0 из 2.', priority = 98, is_active = 1, meta_json = '{}'
WHERE key = 'natal.planets.group.luminaries.count.0' AND locale = 'ru-RU' AND (topic_category = 'money');

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.planets.group.luminaries.count.0', 'money', 'ru-RU', '(money) Светил в группе: 0 из 2.', 98, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.planets.group.luminaries.count.0' AND locale = 'ru-RU' AND (topic_category = 'money')
);

UPDATE knowledge_items
SET text = '(money) Светил в группе: 1 из 2.', priority = 98, is_active = 1, meta_json = '{}'
WHERE key = 'natal.planets.group.luminaries.count.1' AND locale = 'ru-RU' AND (topic_category = 'money');

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.planets.group.luminaries.count.1', 'money', 'ru-RU', '(money) Светил в группе: 1 из 2.', 98, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.planets.group.luminaries.count.1' AND locale = 'ru-RU' AND (topic_category = 'money')
);

UPDATE knowledge_items
SET text = '(money) Светил в группе: 2 из 2.', priority = 98, is_active = 1, meta_json = '{}'
WHERE key = 'natal.planets.group.luminaries.count.2' AND locale = 'ru-RU' AND (topic_category = 'money');

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.planets.group.luminaries.count.2', 'money', 'ru-RU', '(money) Светил в группе: 2 из 2.', 98, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.planets.group.luminaries.count.2' AND locale = 'ru-RU' AND (topic_category = 'money')
);

UPDATE knowledge_items
SET text = '(money) Группа планет: личные (Меркурий, Венера, Марс) — мышление, притяжение и способ действовать.', priority = 108, is_active = 1, meta_json = '{}'
WHERE key = 'natal.planets.group.inner.present' AND locale = 'ru-RU' AND (topic_category = 'money');

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.planets.group.inner.present', 'money', 'ru-RU', '(money) Группа планет: личные (Меркурий, Венера, Марс) — мышление, притяжение и способ действовать.', 108, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.planets.group.inner.present' AND locale = 'ru-RU' AND (topic_category = 'money')
);

UPDATE knowledge_items
SET text = '(money) Личных планет в группе: 0 из 3.', priority = 98, is_active = 1, meta_json = '{}'
WHERE key = 'natal.planets.group.inner.count.0' AND locale = 'ru-RU' AND (topic_category = 'money');

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.planets.group.inner.count.0', 'money', 'ru-RU', '(money) Личных планет в группе: 0 из 3.', 98, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.planets.group.inner.count.0' AND locale = 'ru-RU' AND (topic_category = 'money')
);

UPDATE knowledge_items
SET text = '(money) Личных планет в группе: 1 из 3.', priority = 98, is_active = 1, meta_json = '{}'
WHERE key = 'natal.planets.group.inner.count.1' AND locale = 'ru-RU' AND (topic_category = 'money');

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.planets.group.inner.count.1', 'money', 'ru-RU', '(money) Личных планет в группе: 1 из 3.', 98, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.planets.group.inner.count.1' AND locale = 'ru-RU' AND (topic_category = 'money')
);

UPDATE knowledge_items
SET text = '(money) Личных планет в группе: 2 из 3.', priority = 98, is_active = 1, meta_json = '{}'
WHERE key = 'natal.planets.group.inner.count.2' AND locale = 'ru-RU' AND (topic_category = 'money');

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.planets.group.inner.count.2', 'money', 'ru-RU', '(money) Личных планет в группе: 2 из 3.', 98, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.planets.group.inner.count.2' AND locale = 'ru-RU' AND (topic_category = 'money')
);

UPDATE knowledge_items
SET text = '(money) Личных планет в группе: 3 из 3.', priority = 98, is_active = 1, meta_json = '{}'
WHERE key = 'natal.planets.group.inner.count.3' AND locale = 'ru-RU' AND (topic_category = 'money');

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.planets.group.inner.count.3', 'money', 'ru-RU', '(money) Личных планет в группе: 3 из 3.', 98, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.planets.group.inner.count.3' AND locale = 'ru-RU' AND (topic_category = 'money')
);

UPDATE knowledge_items
SET text = '(money) Группа планет: социальные (Юпитер, Сатурн) — рост, правила и долгие цели.', priority = 108, is_active = 1, meta_json = '{}'
WHERE key = 'natal.planets.group.social.present' AND locale = 'ru-RU' AND (topic_category = 'money');

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.planets.group.social.present', 'money', 'ru-RU', '(money) Группа планет: социальные (Юпитер, Сатурн) — рост, правила и долгие цели.', 108, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.planets.group.social.present' AND locale = 'ru-RU' AND (topic_category = 'money')
);

UPDATE knowledge_items
SET text = '(money) Социальных планет в группе: 0 из 2.', priority = 98, is_active = 1, meta_json = '{}'
WHERE key = 'natal.planets.group.social.count.0' AND locale = 'ru-RU' AND (topic_category = 'money');

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.planets.group.social.count.0', 'money', 'ru-RU', '(money) Социальных планет в группе: 0 из 2.', 98, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.planets.group.social.count.0' AND locale = 'ru-RU' AND (topic_category = 'money')
);

UPDATE knowledge_items
SET text = '(money) Социальных планет в группе: 1 из 2.', priority = 98, is_active = 1, meta_json = '{}'
WHERE key = 'natal.planets.group.social.count.1' AND locale = 'ru-RU' AND (topic_category = 'money');

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.planets.group.social.count.1', 'money', 'ru-RU', '(money) Социальных планет в группе: 1 из 2.', 98, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.planets.group.social.count.1' AND locale = 'ru-RU' AND (topic_category = 'money')
);

UPDATE knowledge_items
SET text = '(money) Социальных планет в группе: 2 из 2.', priority = 98, is_active = 1, meta_json = '{}'
WHERE key = 'natal.planets.group.social.count.2' AND locale = 'ru-RU' AND (topic_category = 'money');

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.planets.group.social.count.2', 'money', 'ru-RU', '(money) Социальных планет в группе: 2 из 2.', 98, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.planets.group.social.count.2' AND locale = 'ru-RU' AND (topic_category = 'money')
);

UPDATE knowledge_items
SET text = '(money) Группа планет: высшие (Уран, Нептун, Плутон) — глубинные циклы, трансформация и перемены.', priority = 108, is_active = 1, meta_json = '{}'
WHERE key = 'natal.planets.group.outer.present' AND locale = 'ru-RU' AND (topic_category = 'money');

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.planets.group.outer.present', 'money', 'ru-RU', '(money) Группа планет: высшие (Уран, Нептун, Плутон) — глубинные циклы, трансформация и перемены.', 108, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.planets.group.outer.present' AND locale = 'ru-RU' AND (topic_category = 'money')
);

UPDATE knowledge_items
SET text = '(money) Высших планет в группе: 0 из 3.', priority = 98, is_active = 1, meta_json = '{}'
WHERE key = 'natal.planets.group.outer.count.0' AND locale = 'ru-RU' AND (topic_category = 'money');

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.planets.group.outer.count.0', 'money', 'ru-RU', '(money) Высших планет в группе: 0 из 3.', 98, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.planets.group.outer.count.0' AND locale = 'ru-RU' AND (topic_category = 'money')
);

UPDATE knowledge_items
SET text = '(money) Высших планет в группе: 1 из 3.', priority = 98, is_active = 1, meta_json = '{}'
WHERE key = 'natal.planets.group.outer.count.1' AND locale = 'ru-RU' AND (topic_category = 'money');

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.planets.group.outer.count.1', 'money', 'ru-RU', '(money) Высших планет в группе: 1 из 3.', 98, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.planets.group.outer.count.1' AND locale = 'ru-RU' AND (topic_category = 'money')
);

UPDATE knowledge_items
SET text = '(money) Высших планет в группе: 2 из 3.', priority = 98, is_active = 1, meta_json = '{}'
WHERE key = 'natal.planets.group.outer.count.2' AND locale = 'ru-RU' AND (topic_category = 'money');

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.planets.group.outer.count.2', 'money', 'ru-RU', '(money) Высших планет в группе: 2 из 3.', 98, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.planets.group.outer.count.2' AND locale = 'ru-RU' AND (topic_category = 'money')
);

UPDATE knowledge_items
SET text = '(money) Высших планет в группе: 3 из 3.', priority = 98, is_active = 1, meta_json = '{}'
WHERE key = 'natal.planets.group.outer.count.3' AND locale = 'ru-RU' AND (topic_category = 'money');

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.planets.group.outer.count.3', 'money', 'ru-RU', '(money) Высших планет в группе: 3 из 3.', 98, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.planets.group.outer.count.3' AND locale = 'ru-RU' AND (topic_category = 'money')
);

UPDATE knowledge_items
SET text = '(partnership_marriage) Группа планет: светила (Солнце и Луна) — базовый тон личности и эмоциональный фон.', priority = 108, is_active = 1, meta_json = '{}'
WHERE key = 'natal.planets.group.luminaries.present' AND locale = 'ru-RU' AND (topic_category = 'partnership_marriage');

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.planets.group.luminaries.present', 'partnership_marriage', 'ru-RU', '(partnership_marriage) Группа планет: светила (Солнце и Луна) — базовый тон личности и эмоциональный фон.', 108, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.planets.group.luminaries.present' AND locale = 'ru-RU' AND (topic_category = 'partnership_marriage')
);

UPDATE knowledge_items
SET text = '(partnership_marriage) Светил в группе: 0 из 2.', priority = 98, is_active = 1, meta_json = '{}'
WHERE key = 'natal.planets.group.luminaries.count.0' AND locale = 'ru-RU' AND (topic_category = 'partnership_marriage');

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.planets.group.luminaries.count.0', 'partnership_marriage', 'ru-RU', '(partnership_marriage) Светил в группе: 0 из 2.', 98, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.planets.group.luminaries.count.0' AND locale = 'ru-RU' AND (topic_category = 'partnership_marriage')
);

UPDATE knowledge_items
SET text = '(partnership_marriage) Светил в группе: 1 из 2.', priority = 98, is_active = 1, meta_json = '{}'
WHERE key = 'natal.planets.group.luminaries.count.1' AND locale = 'ru-RU' AND (topic_category = 'partnership_marriage');

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.planets.group.luminaries.count.1', 'partnership_marriage', 'ru-RU', '(partnership_marriage) Светил в группе: 1 из 2.', 98, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.planets.group.luminaries.count.1' AND locale = 'ru-RU' AND (topic_category = 'partnership_marriage')
);

UPDATE knowledge_items
SET text = '(partnership_marriage) Светил в группе: 2 из 2.', priority = 98, is_active = 1, meta_json = '{}'
WHERE key = 'natal.planets.group.luminaries.count.2' AND locale = 'ru-RU' AND (topic_category = 'partnership_marriage');

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.planets.group.luminaries.count.2', 'partnership_marriage', 'ru-RU', '(partnership_marriage) Светил в группе: 2 из 2.', 98, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.planets.group.luminaries.count.2' AND locale = 'ru-RU' AND (topic_category = 'partnership_marriage')
);

UPDATE knowledge_items
SET text = '(partnership_marriage) Группа планет: личные (Меркурий, Венера, Марс) — мышление, притяжение и способ действовать.', priority = 108, is_active = 1, meta_json = '{}'
WHERE key = 'natal.planets.group.inner.present' AND locale = 'ru-RU' AND (topic_category = 'partnership_marriage');

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.planets.group.inner.present', 'partnership_marriage', 'ru-RU', '(partnership_marriage) Группа планет: личные (Меркурий, Венера, Марс) — мышление, притяжение и способ действовать.', 108, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.planets.group.inner.present' AND locale = 'ru-RU' AND (topic_category = 'partnership_marriage')
);

UPDATE knowledge_items
SET text = '(partnership_marriage) Личных планет в группе: 0 из 3.', priority = 98, is_active = 1, meta_json = '{}'
WHERE key = 'natal.planets.group.inner.count.0' AND locale = 'ru-RU' AND (topic_category = 'partnership_marriage');

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.planets.group.inner.count.0', 'partnership_marriage', 'ru-RU', '(partnership_marriage) Личных планет в группе: 0 из 3.', 98, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.planets.group.inner.count.0' AND locale = 'ru-RU' AND (topic_category = 'partnership_marriage')
);

UPDATE knowledge_items
SET text = '(partnership_marriage) Личных планет в группе: 1 из 3.', priority = 98, is_active = 1, meta_json = '{}'
WHERE key = 'natal.planets.group.inner.count.1' AND locale = 'ru-RU' AND (topic_category = 'partnership_marriage');

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.planets.group.inner.count.1', 'partnership_marriage', 'ru-RU', '(partnership_marriage) Личных планет в группе: 1 из 3.', 98, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.planets.group.inner.count.1' AND locale = 'ru-RU' AND (topic_category = 'partnership_marriage')
);

UPDATE knowledge_items
SET text = '(partnership_marriage) Личных планет в группе: 2 из 3.', priority = 98, is_active = 1, meta_json = '{}'
WHERE key = 'natal.planets.group.inner.count.2' AND locale = 'ru-RU' AND (topic_category = 'partnership_marriage');

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.planets.group.inner.count.2', 'partnership_marriage', 'ru-RU', '(partnership_marriage) Личных планет в группе: 2 из 3.', 98, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.planets.group.inner.count.2' AND locale = 'ru-RU' AND (topic_category = 'partnership_marriage')
);

UPDATE knowledge_items
SET text = '(partnership_marriage) Личных планет в группе: 3 из 3.', priority = 98, is_active = 1, meta_json = '{}'
WHERE key = 'natal.planets.group.inner.count.3' AND locale = 'ru-RU' AND (topic_category = 'partnership_marriage');

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.planets.group.inner.count.3', 'partnership_marriage', 'ru-RU', '(partnership_marriage) Личных планет в группе: 3 из 3.', 98, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.planets.group.inner.count.3' AND locale = 'ru-RU' AND (topic_category = 'partnership_marriage')
);

UPDATE knowledge_items
SET text = '(partnership_marriage) Группа планет: социальные (Юпитер, Сатурн) — рост, правила и долгие цели.', priority = 108, is_active = 1, meta_json = '{}'
WHERE key = 'natal.planets.group.social.present' AND locale = 'ru-RU' AND (topic_category = 'partnership_marriage');

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.planets.group.social.present', 'partnership_marriage', 'ru-RU', '(partnership_marriage) Группа планет: социальные (Юпитер, Сатурн) — рост, правила и долгие цели.', 108, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.planets.group.social.present' AND locale = 'ru-RU' AND (topic_category = 'partnership_marriage')
);

UPDATE knowledge_items
SET text = '(partnership_marriage) Социальных планет в группе: 0 из 2.', priority = 98, is_active = 1, meta_json = '{}'
WHERE key = 'natal.planets.group.social.count.0' AND locale = 'ru-RU' AND (topic_category = 'partnership_marriage');

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.planets.group.social.count.0', 'partnership_marriage', 'ru-RU', '(partnership_marriage) Социальных планет в группе: 0 из 2.', 98, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.planets.group.social.count.0' AND locale = 'ru-RU' AND (topic_category = 'partnership_marriage')
);

UPDATE knowledge_items
SET text = '(partnership_marriage) Социальных планет в группе: 1 из 2.', priority = 98, is_active = 1, meta_json = '{}'
WHERE key = 'natal.planets.group.social.count.1' AND locale = 'ru-RU' AND (topic_category = 'partnership_marriage');

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.planets.group.social.count.1', 'partnership_marriage', 'ru-RU', '(partnership_marriage) Социальных планет в группе: 1 из 2.', 98, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.planets.group.social.count.1' AND locale = 'ru-RU' AND (topic_category = 'partnership_marriage')
);

UPDATE knowledge_items
SET text = '(partnership_marriage) Социальных планет в группе: 2 из 2.', priority = 98, is_active = 1, meta_json = '{}'
WHERE key = 'natal.planets.group.social.count.2' AND locale = 'ru-RU' AND (topic_category = 'partnership_marriage');

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.planets.group.social.count.2', 'partnership_marriage', 'ru-RU', '(partnership_marriage) Социальных планет в группе: 2 из 2.', 98, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.planets.group.social.count.2' AND locale = 'ru-RU' AND (topic_category = 'partnership_marriage')
);

UPDATE knowledge_items
SET text = '(partnership_marriage) Группа планет: высшие (Уран, Нептун, Плутон) — глубинные циклы, трансформация и перемены.', priority = 108, is_active = 1, meta_json = '{}'
WHERE key = 'natal.planets.group.outer.present' AND locale = 'ru-RU' AND (topic_category = 'partnership_marriage');

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.planets.group.outer.present', 'partnership_marriage', 'ru-RU', '(partnership_marriage) Группа планет: высшие (Уран, Нептун, Плутон) — глубинные циклы, трансформация и перемены.', 108, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.planets.group.outer.present' AND locale = 'ru-RU' AND (topic_category = 'partnership_marriage')
);

UPDATE knowledge_items
SET text = '(partnership_marriage) Высших планет в группе: 0 из 3.', priority = 98, is_active = 1, meta_json = '{}'
WHERE key = 'natal.planets.group.outer.count.0' AND locale = 'ru-RU' AND (topic_category = 'partnership_marriage');

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.planets.group.outer.count.0', 'partnership_marriage', 'ru-RU', '(partnership_marriage) Высших планет в группе: 0 из 3.', 98, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.planets.group.outer.count.0' AND locale = 'ru-RU' AND (topic_category = 'partnership_marriage')
);

UPDATE knowledge_items
SET text = '(partnership_marriage) Высших планет в группе: 1 из 3.', priority = 98, is_active = 1, meta_json = '{}'
WHERE key = 'natal.planets.group.outer.count.1' AND locale = 'ru-RU' AND (topic_category = 'partnership_marriage');

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.planets.group.outer.count.1', 'partnership_marriage', 'ru-RU', '(partnership_marriage) Высших планет в группе: 1 из 3.', 98, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.planets.group.outer.count.1' AND locale = 'ru-RU' AND (topic_category = 'partnership_marriage')
);

UPDATE knowledge_items
SET text = '(partnership_marriage) Высших планет в группе: 2 из 3.', priority = 98, is_active = 1, meta_json = '{}'
WHERE key = 'natal.planets.group.outer.count.2' AND locale = 'ru-RU' AND (topic_category = 'partnership_marriage');

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.planets.group.outer.count.2', 'partnership_marriage', 'ru-RU', '(partnership_marriage) Высших планет в группе: 2 из 3.', 98, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.planets.group.outer.count.2' AND locale = 'ru-RU' AND (topic_category = 'partnership_marriage')
);

UPDATE knowledge_items
SET text = '(partnership_marriage) Высших планет в группе: 3 из 3.', priority = 98, is_active = 1, meta_json = '{}'
WHERE key = 'natal.planets.group.outer.count.3' AND locale = 'ru-RU' AND (topic_category = 'partnership_marriage');

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.planets.group.outer.count.3', 'partnership_marriage', 'ru-RU', '(partnership_marriage) Высших планет в группе: 3 из 3.', 98, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.planets.group.outer.count.3' AND locale = 'ru-RU' AND (topic_category = 'partnership_marriage')
);

UPDATE knowledge_items
SET text = '(past_lives_symbolic) Группа планет: светила (Солнце и Луна) — базовый тон личности и эмоциональный фон.', priority = 108, is_active = 1, meta_json = '{}'
WHERE key = 'natal.planets.group.luminaries.present' AND locale = 'ru-RU' AND (topic_category = 'past_lives_symbolic');

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.planets.group.luminaries.present', 'past_lives_symbolic', 'ru-RU', '(past_lives_symbolic) Группа планет: светила (Солнце и Луна) — базовый тон личности и эмоциональный фон.', 108, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.planets.group.luminaries.present' AND locale = 'ru-RU' AND (topic_category = 'past_lives_symbolic')
);

UPDATE knowledge_items
SET text = '(past_lives_symbolic) Светил в группе: 0 из 2.', priority = 98, is_active = 1, meta_json = '{}'
WHERE key = 'natal.planets.group.luminaries.count.0' AND locale = 'ru-RU' AND (topic_category = 'past_lives_symbolic');

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.planets.group.luminaries.count.0', 'past_lives_symbolic', 'ru-RU', '(past_lives_symbolic) Светил в группе: 0 из 2.', 98, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.planets.group.luminaries.count.0' AND locale = 'ru-RU' AND (topic_category = 'past_lives_symbolic')
);

UPDATE knowledge_items
SET text = '(past_lives_symbolic) Светил в группе: 1 из 2.', priority = 98, is_active = 1, meta_json = '{}'
WHERE key = 'natal.planets.group.luminaries.count.1' AND locale = 'ru-RU' AND (topic_category = 'past_lives_symbolic');

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.planets.group.luminaries.count.1', 'past_lives_symbolic', 'ru-RU', '(past_lives_symbolic) Светил в группе: 1 из 2.', 98, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.planets.group.luminaries.count.1' AND locale = 'ru-RU' AND (topic_category = 'past_lives_symbolic')
);

UPDATE knowledge_items
SET text = '(past_lives_symbolic) Светил в группе: 2 из 2.', priority = 98, is_active = 1, meta_json = '{}'
WHERE key = 'natal.planets.group.luminaries.count.2' AND locale = 'ru-RU' AND (topic_category = 'past_lives_symbolic');

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.planets.group.luminaries.count.2', 'past_lives_symbolic', 'ru-RU', '(past_lives_symbolic) Светил в группе: 2 из 2.', 98, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.planets.group.luminaries.count.2' AND locale = 'ru-RU' AND (topic_category = 'past_lives_symbolic')
);

UPDATE knowledge_items
SET text = '(past_lives_symbolic) Группа планет: личные (Меркурий, Венера, Марс) — мышление, притяжение и способ действовать.', priority = 108, is_active = 1, meta_json = '{}'
WHERE key = 'natal.planets.group.inner.present' AND locale = 'ru-RU' AND (topic_category = 'past_lives_symbolic');

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.planets.group.inner.present', 'past_lives_symbolic', 'ru-RU', '(past_lives_symbolic) Группа планет: личные (Меркурий, Венера, Марс) — мышление, притяжение и способ действовать.', 108, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.planets.group.inner.present' AND locale = 'ru-RU' AND (topic_category = 'past_lives_symbolic')
);

UPDATE knowledge_items
SET text = '(past_lives_symbolic) Личных планет в группе: 0 из 3.', priority = 98, is_active = 1, meta_json = '{}'
WHERE key = 'natal.planets.group.inner.count.0' AND locale = 'ru-RU' AND (topic_category = 'past_lives_symbolic');

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.planets.group.inner.count.0', 'past_lives_symbolic', 'ru-RU', '(past_lives_symbolic) Личных планет в группе: 0 из 3.', 98, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.planets.group.inner.count.0' AND locale = 'ru-RU' AND (topic_category = 'past_lives_symbolic')
);

UPDATE knowledge_items
SET text = '(past_lives_symbolic) Личных планет в группе: 1 из 3.', priority = 98, is_active = 1, meta_json = '{}'
WHERE key = 'natal.planets.group.inner.count.1' AND locale = 'ru-RU' AND (topic_category = 'past_lives_symbolic');

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.planets.group.inner.count.1', 'past_lives_symbolic', 'ru-RU', '(past_lives_symbolic) Личных планет в группе: 1 из 3.', 98, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.planets.group.inner.count.1' AND locale = 'ru-RU' AND (topic_category = 'past_lives_symbolic')
);

UPDATE knowledge_items
SET text = '(past_lives_symbolic) Личных планет в группе: 2 из 3.', priority = 98, is_active = 1, meta_json = '{}'
WHERE key = 'natal.planets.group.inner.count.2' AND locale = 'ru-RU' AND (topic_category = 'past_lives_symbolic');

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.planets.group.inner.count.2', 'past_lives_symbolic', 'ru-RU', '(past_lives_symbolic) Личных планет в группе: 2 из 3.', 98, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.planets.group.inner.count.2' AND locale = 'ru-RU' AND (topic_category = 'past_lives_symbolic')
);

UPDATE knowledge_items
SET text = '(past_lives_symbolic) Личных планет в группе: 3 из 3.', priority = 98, is_active = 1, meta_json = '{}'
WHERE key = 'natal.planets.group.inner.count.3' AND locale = 'ru-RU' AND (topic_category = 'past_lives_symbolic');

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.planets.group.inner.count.3', 'past_lives_symbolic', 'ru-RU', '(past_lives_symbolic) Личных планет в группе: 3 из 3.', 98, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.planets.group.inner.count.3' AND locale = 'ru-RU' AND (topic_category = 'past_lives_symbolic')
);

UPDATE knowledge_items
SET text = '(past_lives_symbolic) Группа планет: социальные (Юпитер, Сатурн) — рост, правила и долгие цели.', priority = 108, is_active = 1, meta_json = '{}'
WHERE key = 'natal.planets.group.social.present' AND locale = 'ru-RU' AND (topic_category = 'past_lives_symbolic');

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.planets.group.social.present', 'past_lives_symbolic', 'ru-RU', '(past_lives_symbolic) Группа планет: социальные (Юпитер, Сатурн) — рост, правила и долгие цели.', 108, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.planets.group.social.present' AND locale = 'ru-RU' AND (topic_category = 'past_lives_symbolic')
);

UPDATE knowledge_items
SET text = '(past_lives_symbolic) Социальных планет в группе: 0 из 2.', priority = 98, is_active = 1, meta_json = '{}'
WHERE key = 'natal.planets.group.social.count.0' AND locale = 'ru-RU' AND (topic_category = 'past_lives_symbolic');

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.planets.group.social.count.0', 'past_lives_symbolic', 'ru-RU', '(past_lives_symbolic) Социальных планет в группе: 0 из 2.', 98, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.planets.group.social.count.0' AND locale = 'ru-RU' AND (topic_category = 'past_lives_symbolic')
);

UPDATE knowledge_items
SET text = '(past_lives_symbolic) Социальных планет в группе: 1 из 2.', priority = 98, is_active = 1, meta_json = '{}'
WHERE key = 'natal.planets.group.social.count.1' AND locale = 'ru-RU' AND (topic_category = 'past_lives_symbolic');

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.planets.group.social.count.1', 'past_lives_symbolic', 'ru-RU', '(past_lives_symbolic) Социальных планет в группе: 1 из 2.', 98, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.planets.group.social.count.1' AND locale = 'ru-RU' AND (topic_category = 'past_lives_symbolic')
);

UPDATE knowledge_items
SET text = '(past_lives_symbolic) Социальных планет в группе: 2 из 2.', priority = 98, is_active = 1, meta_json = '{}'
WHERE key = 'natal.planets.group.social.count.2' AND locale = 'ru-RU' AND (topic_category = 'past_lives_symbolic');

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.planets.group.social.count.2', 'past_lives_symbolic', 'ru-RU', '(past_lives_symbolic) Социальных планет в группе: 2 из 2.', 98, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.planets.group.social.count.2' AND locale = 'ru-RU' AND (topic_category = 'past_lives_symbolic')
);

UPDATE knowledge_items
SET text = '(past_lives_symbolic) Группа планет: высшие (Уран, Нептун, Плутон) — глубинные циклы, трансформация и перемены.', priority = 108, is_active = 1, meta_json = '{}'
WHERE key = 'natal.planets.group.outer.present' AND locale = 'ru-RU' AND (topic_category = 'past_lives_symbolic');

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.planets.group.outer.present', 'past_lives_symbolic', 'ru-RU', '(past_lives_symbolic) Группа планет: высшие (Уран, Нептун, Плутон) — глубинные циклы, трансформация и перемены.', 108, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.planets.group.outer.present' AND locale = 'ru-RU' AND (topic_category = 'past_lives_symbolic')
);

UPDATE knowledge_items
SET text = '(past_lives_symbolic) Высших планет в группе: 0 из 3.', priority = 98, is_active = 1, meta_json = '{}'
WHERE key = 'natal.planets.group.outer.count.0' AND locale = 'ru-RU' AND (topic_category = 'past_lives_symbolic');

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.planets.group.outer.count.0', 'past_lives_symbolic', 'ru-RU', '(past_lives_symbolic) Высших планет в группе: 0 из 3.', 98, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.planets.group.outer.count.0' AND locale = 'ru-RU' AND (topic_category = 'past_lives_symbolic')
);

UPDATE knowledge_items
SET text = '(past_lives_symbolic) Высших планет в группе: 1 из 3.', priority = 98, is_active = 1, meta_json = '{}'
WHERE key = 'natal.planets.group.outer.count.1' AND locale = 'ru-RU' AND (topic_category = 'past_lives_symbolic');

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.planets.group.outer.count.1', 'past_lives_symbolic', 'ru-RU', '(past_lives_symbolic) Высших планет в группе: 1 из 3.', 98, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.planets.group.outer.count.1' AND locale = 'ru-RU' AND (topic_category = 'past_lives_symbolic')
);

UPDATE knowledge_items
SET text = '(past_lives_symbolic) Высших планет в группе: 2 из 3.', priority = 98, is_active = 1, meta_json = '{}'
WHERE key = 'natal.planets.group.outer.count.2' AND locale = 'ru-RU' AND (topic_category = 'past_lives_symbolic');

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.planets.group.outer.count.2', 'past_lives_symbolic', 'ru-RU', '(past_lives_symbolic) Высших планет в группе: 2 из 3.', 98, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.planets.group.outer.count.2' AND locale = 'ru-RU' AND (topic_category = 'past_lives_symbolic')
);

UPDATE knowledge_items
SET text = '(past_lives_symbolic) Высших планет в группе: 3 из 3.', priority = 98, is_active = 1, meta_json = '{}'
WHERE key = 'natal.planets.group.outer.count.3' AND locale = 'ru-RU' AND (topic_category = 'past_lives_symbolic');

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.planets.group.outer.count.3', 'past_lives_symbolic', 'ru-RU', '(past_lives_symbolic) Высших планет в группе: 3 из 3.', 98, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.planets.group.outer.count.3' AND locale = 'ru-RU' AND (topic_category = 'past_lives_symbolic')
);

UPDATE knowledge_items
SET text = '(personality_core) Группа планет: светила (Солнце и Луна) — базовый тон личности и эмоциональный фон.', priority = 108, is_active = 1, meta_json = '{}'
WHERE key = 'natal.planets.group.luminaries.present' AND locale = 'ru-RU' AND (topic_category = 'personality_core');

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.planets.group.luminaries.present', 'personality_core', 'ru-RU', '(personality_core) Группа планет: светила (Солнце и Луна) — базовый тон личности и эмоциональный фон.', 108, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.planets.group.luminaries.present' AND locale = 'ru-RU' AND (topic_category = 'personality_core')
);

UPDATE knowledge_items
SET text = '(personality_core) Светил в группе: 0 из 2.', priority = 98, is_active = 1, meta_json = '{}'
WHERE key = 'natal.planets.group.luminaries.count.0' AND locale = 'ru-RU' AND (topic_category = 'personality_core');

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.planets.group.luminaries.count.0', 'personality_core', 'ru-RU', '(personality_core) Светил в группе: 0 из 2.', 98, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.planets.group.luminaries.count.0' AND locale = 'ru-RU' AND (topic_category = 'personality_core')
);

UPDATE knowledge_items
SET text = '(personality_core) Светил в группе: 1 из 2.', priority = 98, is_active = 1, meta_json = '{}'
WHERE key = 'natal.planets.group.luminaries.count.1' AND locale = 'ru-RU' AND (topic_category = 'personality_core');

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.planets.group.luminaries.count.1', 'personality_core', 'ru-RU', '(personality_core) Светил в группе: 1 из 2.', 98, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.planets.group.luminaries.count.1' AND locale = 'ru-RU' AND (topic_category = 'personality_core')
);

UPDATE knowledge_items
SET text = '(personality_core) Светил в группе: 2 из 2.', priority = 98, is_active = 1, meta_json = '{}'
WHERE key = 'natal.planets.group.luminaries.count.2' AND locale = 'ru-RU' AND (topic_category = 'personality_core');

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.planets.group.luminaries.count.2', 'personality_core', 'ru-RU', '(personality_core) Светил в группе: 2 из 2.', 98, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.planets.group.luminaries.count.2' AND locale = 'ru-RU' AND (topic_category = 'personality_core')
);

UPDATE knowledge_items
SET text = '(personality_core) Группа планет: личные (Меркурий, Венера, Марс) — мышление, притяжение и способ действовать.', priority = 108, is_active = 1, meta_json = '{}'
WHERE key = 'natal.planets.group.inner.present' AND locale = 'ru-RU' AND (topic_category = 'personality_core');

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.planets.group.inner.present', 'personality_core', 'ru-RU', '(personality_core) Группа планет: личные (Меркурий, Венера, Марс) — мышление, притяжение и способ действовать.', 108, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.planets.group.inner.present' AND locale = 'ru-RU' AND (topic_category = 'personality_core')
);

UPDATE knowledge_items
SET text = '(personality_core) Личных планет в группе: 0 из 3.', priority = 98, is_active = 1, meta_json = '{}'
WHERE key = 'natal.planets.group.inner.count.0' AND locale = 'ru-RU' AND (topic_category = 'personality_core');

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.planets.group.inner.count.0', 'personality_core', 'ru-RU', '(personality_core) Личных планет в группе: 0 из 3.', 98, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.planets.group.inner.count.0' AND locale = 'ru-RU' AND (topic_category = 'personality_core')
);

UPDATE knowledge_items
SET text = '(personality_core) Личных планет в группе: 1 из 3.', priority = 98, is_active = 1, meta_json = '{}'
WHERE key = 'natal.planets.group.inner.count.1' AND locale = 'ru-RU' AND (topic_category = 'personality_core');

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.planets.group.inner.count.1', 'personality_core', 'ru-RU', '(personality_core) Личных планет в группе: 1 из 3.', 98, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.planets.group.inner.count.1' AND locale = 'ru-RU' AND (topic_category = 'personality_core')
);

UPDATE knowledge_items
SET text = '(personality_core) Личных планет в группе: 2 из 3.', priority = 98, is_active = 1, meta_json = '{}'
WHERE key = 'natal.planets.group.inner.count.2' AND locale = 'ru-RU' AND (topic_category = 'personality_core');

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.planets.group.inner.count.2', 'personality_core', 'ru-RU', '(personality_core) Личных планет в группе: 2 из 3.', 98, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.planets.group.inner.count.2' AND locale = 'ru-RU' AND (topic_category = 'personality_core')
);

UPDATE knowledge_items
SET text = '(personality_core) Личных планет в группе: 3 из 3.', priority = 98, is_active = 1, meta_json = '{}'
WHERE key = 'natal.planets.group.inner.count.3' AND locale = 'ru-RU' AND (topic_category = 'personality_core');

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.planets.group.inner.count.3', 'personality_core', 'ru-RU', '(personality_core) Личных планет в группе: 3 из 3.', 98, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.planets.group.inner.count.3' AND locale = 'ru-RU' AND (topic_category = 'personality_core')
);

UPDATE knowledge_items
SET text = '(personality_core) Группа планет: социальные (Юпитер, Сатурн) — рост, правила и долгие цели.', priority = 108, is_active = 1, meta_json = '{}'
WHERE key = 'natal.planets.group.social.present' AND locale = 'ru-RU' AND (topic_category = 'personality_core');

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.planets.group.social.present', 'personality_core', 'ru-RU', '(personality_core) Группа планет: социальные (Юпитер, Сатурн) — рост, правила и долгие цели.', 108, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.planets.group.social.present' AND locale = 'ru-RU' AND (topic_category = 'personality_core')
);

UPDATE knowledge_items
SET text = '(personality_core) Социальных планет в группе: 0 из 2.', priority = 98, is_active = 1, meta_json = '{}'
WHERE key = 'natal.planets.group.social.count.0' AND locale = 'ru-RU' AND (topic_category = 'personality_core');

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.planets.group.social.count.0', 'personality_core', 'ru-RU', '(personality_core) Социальных планет в группе: 0 из 2.', 98, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.planets.group.social.count.0' AND locale = 'ru-RU' AND (topic_category = 'personality_core')
);

UPDATE knowledge_items
SET text = '(personality_core) Социальных планет в группе: 1 из 2.', priority = 98, is_active = 1, meta_json = '{}'
WHERE key = 'natal.planets.group.social.count.1' AND locale = 'ru-RU' AND (topic_category = 'personality_core');

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.planets.group.social.count.1', 'personality_core', 'ru-RU', '(personality_core) Социальных планет в группе: 1 из 2.', 98, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.planets.group.social.count.1' AND locale = 'ru-RU' AND (topic_category = 'personality_core')
);

UPDATE knowledge_items
SET text = '(personality_core) Социальных планет в группе: 2 из 2.', priority = 98, is_active = 1, meta_json = '{}'
WHERE key = 'natal.planets.group.social.count.2' AND locale = 'ru-RU' AND (topic_category = 'personality_core');

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.planets.group.social.count.2', 'personality_core', 'ru-RU', '(personality_core) Социальных планет в группе: 2 из 2.', 98, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.planets.group.social.count.2' AND locale = 'ru-RU' AND (topic_category = 'personality_core')
);

UPDATE knowledge_items
SET text = '(personality_core) Группа планет: высшие (Уран, Нептун, Плутон) — глубинные циклы, трансформация и перемены.', priority = 108, is_active = 1, meta_json = '{}'
WHERE key = 'natal.planets.group.outer.present' AND locale = 'ru-RU' AND (topic_category = 'personality_core');

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.planets.group.outer.present', 'personality_core', 'ru-RU', '(personality_core) Группа планет: высшие (Уран, Нептун, Плутон) — глубинные циклы, трансформация и перемены.', 108, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.planets.group.outer.present' AND locale = 'ru-RU' AND (topic_category = 'personality_core')
);

UPDATE knowledge_items
SET text = '(personality_core) Высших планет в группе: 0 из 3.', priority = 98, is_active = 1, meta_json = '{}'
WHERE key = 'natal.planets.group.outer.count.0' AND locale = 'ru-RU' AND (topic_category = 'personality_core');

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.planets.group.outer.count.0', 'personality_core', 'ru-RU', '(personality_core) Высших планет в группе: 0 из 3.', 98, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.planets.group.outer.count.0' AND locale = 'ru-RU' AND (topic_category = 'personality_core')
);

UPDATE knowledge_items
SET text = '(personality_core) Высших планет в группе: 1 из 3.', priority = 98, is_active = 1, meta_json = '{}'
WHERE key = 'natal.planets.group.outer.count.1' AND locale = 'ru-RU' AND (topic_category = 'personality_core');

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.planets.group.outer.count.1', 'personality_core', 'ru-RU', '(personality_core) Высших планет в группе: 1 из 3.', 98, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.planets.group.outer.count.1' AND locale = 'ru-RU' AND (topic_category = 'personality_core')
);

UPDATE knowledge_items
SET text = '(personality_core) Высших планет в группе: 2 из 3.', priority = 98, is_active = 1, meta_json = '{}'
WHERE key = 'natal.planets.group.outer.count.2' AND locale = 'ru-RU' AND (topic_category = 'personality_core');

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.planets.group.outer.count.2', 'personality_core', 'ru-RU', '(personality_core) Высших планет в группе: 2 из 3.', 98, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.planets.group.outer.count.2' AND locale = 'ru-RU' AND (topic_category = 'personality_core')
);

UPDATE knowledge_items
SET text = '(personality_core) Высших планет в группе: 3 из 3.', priority = 98, is_active = 1, meta_json = '{}'
WHERE key = 'natal.planets.group.outer.count.3' AND locale = 'ru-RU' AND (topic_category = 'personality_core');

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.planets.group.outer.count.3', 'personality_core', 'ru-RU', '(personality_core) Высших планет в группе: 3 из 3.', 98, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.planets.group.outer.count.3' AND locale = 'ru-RU' AND (topic_category = 'personality_core')
);

UPDATE knowledge_items
SET text = '(psychology) Группа планет: светила (Солнце и Луна) — базовый тон личности и эмоциональный фон.', priority = 108, is_active = 1, meta_json = '{}'
WHERE key = 'natal.planets.group.luminaries.present' AND locale = 'ru-RU' AND (topic_category = 'psychology');

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.planets.group.luminaries.present', 'psychology', 'ru-RU', '(psychology) Группа планет: светила (Солнце и Луна) — базовый тон личности и эмоциональный фон.', 108, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.planets.group.luminaries.present' AND locale = 'ru-RU' AND (topic_category = 'psychology')
);

UPDATE knowledge_items
SET text = '(psychology) Светил в группе: 0 из 2.', priority = 98, is_active = 1, meta_json = '{}'
WHERE key = 'natal.planets.group.luminaries.count.0' AND locale = 'ru-RU' AND (topic_category = 'psychology');

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.planets.group.luminaries.count.0', 'psychology', 'ru-RU', '(psychology) Светил в группе: 0 из 2.', 98, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.planets.group.luminaries.count.0' AND locale = 'ru-RU' AND (topic_category = 'psychology')
);

UPDATE knowledge_items
SET text = '(psychology) Светил в группе: 1 из 2.', priority = 98, is_active = 1, meta_json = '{}'
WHERE key = 'natal.planets.group.luminaries.count.1' AND locale = 'ru-RU' AND (topic_category = 'psychology');

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.planets.group.luminaries.count.1', 'psychology', 'ru-RU', '(psychology) Светил в группе: 1 из 2.', 98, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.planets.group.luminaries.count.1' AND locale = 'ru-RU' AND (topic_category = 'psychology')
);

UPDATE knowledge_items
SET text = '(psychology) Светил в группе: 2 из 2.', priority = 98, is_active = 1, meta_json = '{}'
WHERE key = 'natal.planets.group.luminaries.count.2' AND locale = 'ru-RU' AND (topic_category = 'psychology');

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.planets.group.luminaries.count.2', 'psychology', 'ru-RU', '(psychology) Светил в группе: 2 из 2.', 98, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.planets.group.luminaries.count.2' AND locale = 'ru-RU' AND (topic_category = 'psychology')
);

UPDATE knowledge_items
SET text = '(psychology) Группа планет: личные (Меркурий, Венера, Марс) — мышление, притяжение и способ действовать.', priority = 108, is_active = 1, meta_json = '{}'
WHERE key = 'natal.planets.group.inner.present' AND locale = 'ru-RU' AND (topic_category = 'psychology');

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.planets.group.inner.present', 'psychology', 'ru-RU', '(psychology) Группа планет: личные (Меркурий, Венера, Марс) — мышление, притяжение и способ действовать.', 108, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.planets.group.inner.present' AND locale = 'ru-RU' AND (topic_category = 'psychology')
);

UPDATE knowledge_items
SET text = '(psychology) Личных планет в группе: 0 из 3.', priority = 98, is_active = 1, meta_json = '{}'
WHERE key = 'natal.planets.group.inner.count.0' AND locale = 'ru-RU' AND (topic_category = 'psychology');

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.planets.group.inner.count.0', 'psychology', 'ru-RU', '(psychology) Личных планет в группе: 0 из 3.', 98, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.planets.group.inner.count.0' AND locale = 'ru-RU' AND (topic_category = 'psychology')
);

UPDATE knowledge_items
SET text = '(psychology) Личных планет в группе: 1 из 3.', priority = 98, is_active = 1, meta_json = '{}'
WHERE key = 'natal.planets.group.inner.count.1' AND locale = 'ru-RU' AND (topic_category = 'psychology');

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.planets.group.inner.count.1', 'psychology', 'ru-RU', '(psychology) Личных планет в группе: 1 из 3.', 98, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.planets.group.inner.count.1' AND locale = 'ru-RU' AND (topic_category = 'psychology')
);

UPDATE knowledge_items
SET text = '(psychology) Личных планет в группе: 2 из 3.', priority = 98, is_active = 1, meta_json = '{}'
WHERE key = 'natal.planets.group.inner.count.2' AND locale = 'ru-RU' AND (topic_category = 'psychology');

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.planets.group.inner.count.2', 'psychology', 'ru-RU', '(psychology) Личных планет в группе: 2 из 3.', 98, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.planets.group.inner.count.2' AND locale = 'ru-RU' AND (topic_category = 'psychology')
);

UPDATE knowledge_items
SET text = '(psychology) Личных планет в группе: 3 из 3.', priority = 98, is_active = 1, meta_json = '{}'
WHERE key = 'natal.planets.group.inner.count.3' AND locale = 'ru-RU' AND (topic_category = 'psychology');

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.planets.group.inner.count.3', 'psychology', 'ru-RU', '(psychology) Личных планет в группе: 3 из 3.', 98, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.planets.group.inner.count.3' AND locale = 'ru-RU' AND (topic_category = 'psychology')
);

UPDATE knowledge_items
SET text = '(psychology) Группа планет: социальные (Юпитер, Сатурн) — рост, правила и долгие цели.', priority = 108, is_active = 1, meta_json = '{}'
WHERE key = 'natal.planets.group.social.present' AND locale = 'ru-RU' AND (topic_category = 'psychology');

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.planets.group.social.present', 'psychology', 'ru-RU', '(psychology) Группа планет: социальные (Юпитер, Сатурн) — рост, правила и долгие цели.', 108, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.planets.group.social.present' AND locale = 'ru-RU' AND (topic_category = 'psychology')
);

UPDATE knowledge_items
SET text = '(psychology) Социальных планет в группе: 0 из 2.', priority = 98, is_active = 1, meta_json = '{}'
WHERE key = 'natal.planets.group.social.count.0' AND locale = 'ru-RU' AND (topic_category = 'psychology');

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.planets.group.social.count.0', 'psychology', 'ru-RU', '(psychology) Социальных планет в группе: 0 из 2.', 98, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.planets.group.social.count.0' AND locale = 'ru-RU' AND (topic_category = 'psychology')
);

UPDATE knowledge_items
SET text = '(psychology) Социальных планет в группе: 1 из 2.', priority = 98, is_active = 1, meta_json = '{}'
WHERE key = 'natal.planets.group.social.count.1' AND locale = 'ru-RU' AND (topic_category = 'psychology');

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.planets.group.social.count.1', 'psychology', 'ru-RU', '(psychology) Социальных планет в группе: 1 из 2.', 98, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.planets.group.social.count.1' AND locale = 'ru-RU' AND (topic_category = 'psychology')
);

UPDATE knowledge_items
SET text = '(psychology) Социальных планет в группе: 2 из 2.', priority = 98, is_active = 1, meta_json = '{}'
WHERE key = 'natal.planets.group.social.count.2' AND locale = 'ru-RU' AND (topic_category = 'psychology');

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.planets.group.social.count.2', 'psychology', 'ru-RU', '(psychology) Социальных планет в группе: 2 из 2.', 98, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.planets.group.social.count.2' AND locale = 'ru-RU' AND (topic_category = 'psychology')
);

UPDATE knowledge_items
SET text = '(psychology) Группа планет: высшие (Уран, Нептун, Плутон) — глубинные циклы, трансформация и перемены.', priority = 108, is_active = 1, meta_json = '{}'
WHERE key = 'natal.planets.group.outer.present' AND locale = 'ru-RU' AND (topic_category = 'psychology');

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.planets.group.outer.present', 'psychology', 'ru-RU', '(psychology) Группа планет: высшие (Уран, Нептун, Плутон) — глубинные циклы, трансформация и перемены.', 108, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.planets.group.outer.present' AND locale = 'ru-RU' AND (topic_category = 'psychology')
);

UPDATE knowledge_items
SET text = '(psychology) Высших планет в группе: 0 из 3.', priority = 98, is_active = 1, meta_json = '{}'
WHERE key = 'natal.planets.group.outer.count.0' AND locale = 'ru-RU' AND (topic_category = 'psychology');

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.planets.group.outer.count.0', 'psychology', 'ru-RU', '(psychology) Высших планет в группе: 0 из 3.', 98, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.planets.group.outer.count.0' AND locale = 'ru-RU' AND (topic_category = 'psychology')
);

UPDATE knowledge_items
SET text = '(psychology) Высших планет в группе: 1 из 3.', priority = 98, is_active = 1, meta_json = '{}'
WHERE key = 'natal.planets.group.outer.count.1' AND locale = 'ru-RU' AND (topic_category = 'psychology');

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.planets.group.outer.count.1', 'psychology', 'ru-RU', '(psychology) Высших планет в группе: 1 из 3.', 98, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.planets.group.outer.count.1' AND locale = 'ru-RU' AND (topic_category = 'psychology')
);

UPDATE knowledge_items
SET text = '(psychology) Высших планет в группе: 2 из 3.', priority = 98, is_active = 1, meta_json = '{}'
WHERE key = 'natal.planets.group.outer.count.2' AND locale = 'ru-RU' AND (topic_category = 'psychology');

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.planets.group.outer.count.2', 'psychology', 'ru-RU', '(psychology) Высших планет в группе: 2 из 3.', 98, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.planets.group.outer.count.2' AND locale = 'ru-RU' AND (topic_category = 'psychology')
);

UPDATE knowledge_items
SET text = '(psychology) Высших планет в группе: 3 из 3.', priority = 98, is_active = 1, meta_json = '{}'
WHERE key = 'natal.planets.group.outer.count.3' AND locale = 'ru-RU' AND (topic_category = 'psychology');

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.planets.group.outer.count.3', 'psychology', 'ru-RU', '(psychology) Высших планет в группе: 3 из 3.', 98, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.planets.group.outer.count.3' AND locale = 'ru-RU' AND (topic_category = 'psychology')
);

UPDATE knowledge_items
SET text = '(purpose_path) Группа планет: светила (Солнце и Луна) — базовый тон личности и эмоциональный фон.', priority = 108, is_active = 1, meta_json = '{}'
WHERE key = 'natal.planets.group.luminaries.present' AND locale = 'ru-RU' AND (topic_category = 'purpose_path');

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.planets.group.luminaries.present', 'purpose_path', 'ru-RU', '(purpose_path) Группа планет: светила (Солнце и Луна) — базовый тон личности и эмоциональный фон.', 108, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.planets.group.luminaries.present' AND locale = 'ru-RU' AND (topic_category = 'purpose_path')
);

UPDATE knowledge_items
SET text = '(purpose_path) Светил в группе: 0 из 2.', priority = 98, is_active = 1, meta_json = '{}'
WHERE key = 'natal.planets.group.luminaries.count.0' AND locale = 'ru-RU' AND (topic_category = 'purpose_path');

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.planets.group.luminaries.count.0', 'purpose_path', 'ru-RU', '(purpose_path) Светил в группе: 0 из 2.', 98, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.planets.group.luminaries.count.0' AND locale = 'ru-RU' AND (topic_category = 'purpose_path')
);

UPDATE knowledge_items
SET text = '(purpose_path) Светил в группе: 1 из 2.', priority = 98, is_active = 1, meta_json = '{}'
WHERE key = 'natal.planets.group.luminaries.count.1' AND locale = 'ru-RU' AND (topic_category = 'purpose_path');

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.planets.group.luminaries.count.1', 'purpose_path', 'ru-RU', '(purpose_path) Светил в группе: 1 из 2.', 98, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.planets.group.luminaries.count.1' AND locale = 'ru-RU' AND (topic_category = 'purpose_path')
);

UPDATE knowledge_items
SET text = '(purpose_path) Светил в группе: 2 из 2.', priority = 98, is_active = 1, meta_json = '{}'
WHERE key = 'natal.planets.group.luminaries.count.2' AND locale = 'ru-RU' AND (topic_category = 'purpose_path');

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.planets.group.luminaries.count.2', 'purpose_path', 'ru-RU', '(purpose_path) Светил в группе: 2 из 2.', 98, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.planets.group.luminaries.count.2' AND locale = 'ru-RU' AND (topic_category = 'purpose_path')
);

UPDATE knowledge_items
SET text = '(purpose_path) Группа планет: личные (Меркурий, Венера, Марс) — мышление, притяжение и способ действовать.', priority = 108, is_active = 1, meta_json = '{}'
WHERE key = 'natal.planets.group.inner.present' AND locale = 'ru-RU' AND (topic_category = 'purpose_path');

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.planets.group.inner.present', 'purpose_path', 'ru-RU', '(purpose_path) Группа планет: личные (Меркурий, Венера, Марс) — мышление, притяжение и способ действовать.', 108, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.planets.group.inner.present' AND locale = 'ru-RU' AND (topic_category = 'purpose_path')
);

UPDATE knowledge_items
SET text = '(purpose_path) Личных планет в группе: 0 из 3.', priority = 98, is_active = 1, meta_json = '{}'
WHERE key = 'natal.planets.group.inner.count.0' AND locale = 'ru-RU' AND (topic_category = 'purpose_path');

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.planets.group.inner.count.0', 'purpose_path', 'ru-RU', '(purpose_path) Личных планет в группе: 0 из 3.', 98, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.planets.group.inner.count.0' AND locale = 'ru-RU' AND (topic_category = 'purpose_path')
);

UPDATE knowledge_items
SET text = '(purpose_path) Личных планет в группе: 1 из 3.', priority = 98, is_active = 1, meta_json = '{}'
WHERE key = 'natal.planets.group.inner.count.1' AND locale = 'ru-RU' AND (topic_category = 'purpose_path');

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.planets.group.inner.count.1', 'purpose_path', 'ru-RU', '(purpose_path) Личных планет в группе: 1 из 3.', 98, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.planets.group.inner.count.1' AND locale = 'ru-RU' AND (topic_category = 'purpose_path')
);

UPDATE knowledge_items
SET text = '(purpose_path) Личных планет в группе: 2 из 3.', priority = 98, is_active = 1, meta_json = '{}'
WHERE key = 'natal.planets.group.inner.count.2' AND locale = 'ru-RU' AND (topic_category = 'purpose_path');

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.planets.group.inner.count.2', 'purpose_path', 'ru-RU', '(purpose_path) Личных планет в группе: 2 из 3.', 98, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.planets.group.inner.count.2' AND locale = 'ru-RU' AND (topic_category = 'purpose_path')
);

UPDATE knowledge_items
SET text = '(purpose_path) Личных планет в группе: 3 из 3.', priority = 98, is_active = 1, meta_json = '{}'
WHERE key = 'natal.planets.group.inner.count.3' AND locale = 'ru-RU' AND (topic_category = 'purpose_path');

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.planets.group.inner.count.3', 'purpose_path', 'ru-RU', '(purpose_path) Личных планет в группе: 3 из 3.', 98, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.planets.group.inner.count.3' AND locale = 'ru-RU' AND (topic_category = 'purpose_path')
);

UPDATE knowledge_items
SET text = '(purpose_path) Группа планет: социальные (Юпитер, Сатурн) — рост, правила и долгие цели.', priority = 108, is_active = 1, meta_json = '{}'
WHERE key = 'natal.planets.group.social.present' AND locale = 'ru-RU' AND (topic_category = 'purpose_path');

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.planets.group.social.present', 'purpose_path', 'ru-RU', '(purpose_path) Группа планет: социальные (Юпитер, Сатурн) — рост, правила и долгие цели.', 108, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.planets.group.social.present' AND locale = 'ru-RU' AND (topic_category = 'purpose_path')
);

UPDATE knowledge_items
SET text = '(purpose_path) Социальных планет в группе: 0 из 2.', priority = 98, is_active = 1, meta_json = '{}'
WHERE key = 'natal.planets.group.social.count.0' AND locale = 'ru-RU' AND (topic_category = 'purpose_path');

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.planets.group.social.count.0', 'purpose_path', 'ru-RU', '(purpose_path) Социальных планет в группе: 0 из 2.', 98, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.planets.group.social.count.0' AND locale = 'ru-RU' AND (topic_category = 'purpose_path')
);

UPDATE knowledge_items
SET text = '(purpose_path) Социальных планет в группе: 1 из 2.', priority = 98, is_active = 1, meta_json = '{}'
WHERE key = 'natal.planets.group.social.count.1' AND locale = 'ru-RU' AND (topic_category = 'purpose_path');

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.planets.group.social.count.1', 'purpose_path', 'ru-RU', '(purpose_path) Социальных планет в группе: 1 из 2.', 98, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.planets.group.social.count.1' AND locale = 'ru-RU' AND (topic_category = 'purpose_path')
);

UPDATE knowledge_items
SET text = '(purpose_path) Социальных планет в группе: 2 из 2.', priority = 98, is_active = 1, meta_json = '{}'
WHERE key = 'natal.planets.group.social.count.2' AND locale = 'ru-RU' AND (topic_category = 'purpose_path');

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.planets.group.social.count.2', 'purpose_path', 'ru-RU', '(purpose_path) Социальных планет в группе: 2 из 2.', 98, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.planets.group.social.count.2' AND locale = 'ru-RU' AND (topic_category = 'purpose_path')
);

UPDATE knowledge_items
SET text = '(purpose_path) Группа планет: высшие (Уран, Нептун, Плутон) — глубинные циклы, трансформация и перемены.', priority = 108, is_active = 1, meta_json = '{}'
WHERE key = 'natal.planets.group.outer.present' AND locale = 'ru-RU' AND (topic_category = 'purpose_path');

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.planets.group.outer.present', 'purpose_path', 'ru-RU', '(purpose_path) Группа планет: высшие (Уран, Нептун, Плутон) — глубинные циклы, трансформация и перемены.', 108, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.planets.group.outer.present' AND locale = 'ru-RU' AND (topic_category = 'purpose_path')
);

UPDATE knowledge_items
SET text = '(purpose_path) Высших планет в группе: 0 из 3.', priority = 98, is_active = 1, meta_json = '{}'
WHERE key = 'natal.planets.group.outer.count.0' AND locale = 'ru-RU' AND (topic_category = 'purpose_path');

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.planets.group.outer.count.0', 'purpose_path', 'ru-RU', '(purpose_path) Высших планет в группе: 0 из 3.', 98, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.planets.group.outer.count.0' AND locale = 'ru-RU' AND (topic_category = 'purpose_path')
);

UPDATE knowledge_items
SET text = '(purpose_path) Высших планет в группе: 1 из 3.', priority = 98, is_active = 1, meta_json = '{}'
WHERE key = 'natal.planets.group.outer.count.1' AND locale = 'ru-RU' AND (topic_category = 'purpose_path');

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.planets.group.outer.count.1', 'purpose_path', 'ru-RU', '(purpose_path) Высших планет в группе: 1 из 3.', 98, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.planets.group.outer.count.1' AND locale = 'ru-RU' AND (topic_category = 'purpose_path')
);

UPDATE knowledge_items
SET text = '(purpose_path) Высших планет в группе: 2 из 3.', priority = 98, is_active = 1, meta_json = '{}'
WHERE key = 'natal.planets.group.outer.count.2' AND locale = 'ru-RU' AND (topic_category = 'purpose_path');

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.planets.group.outer.count.2', 'purpose_path', 'ru-RU', '(purpose_path) Высших планет в группе: 2 из 3.', 98, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.planets.group.outer.count.2' AND locale = 'ru-RU' AND (topic_category = 'purpose_path')
);

UPDATE knowledge_items
SET text = '(purpose_path) Высших планет в группе: 3 из 3.', priority = 98, is_active = 1, meta_json = '{}'
WHERE key = 'natal.planets.group.outer.count.3' AND locale = 'ru-RU' AND (topic_category = 'purpose_path');

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.planets.group.outer.count.3', 'purpose_path', 'ru-RU', '(purpose_path) Высших планет в группе: 3 из 3.', 98, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.planets.group.outer.count.3' AND locale = 'ru-RU' AND (topic_category = 'purpose_path')
);

UPDATE knowledge_items
SET text = '(self_esteem) Группа планет: светила (Солнце и Луна) — базовый тон личности и эмоциональный фон.', priority = 108, is_active = 1, meta_json = '{}'
WHERE key = 'natal.planets.group.luminaries.present' AND locale = 'ru-RU' AND (topic_category = 'self_esteem');

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.planets.group.luminaries.present', 'self_esteem', 'ru-RU', '(self_esteem) Группа планет: светила (Солнце и Луна) — базовый тон личности и эмоциональный фон.', 108, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.planets.group.luminaries.present' AND locale = 'ru-RU' AND (topic_category = 'self_esteem')
);

UPDATE knowledge_items
SET text = '(self_esteem) Светил в группе: 0 из 2.', priority = 98, is_active = 1, meta_json = '{}'
WHERE key = 'natal.planets.group.luminaries.count.0' AND locale = 'ru-RU' AND (topic_category = 'self_esteem');

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.planets.group.luminaries.count.0', 'self_esteem', 'ru-RU', '(self_esteem) Светил в группе: 0 из 2.', 98, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.planets.group.luminaries.count.0' AND locale = 'ru-RU' AND (topic_category = 'self_esteem')
);

UPDATE knowledge_items
SET text = '(self_esteem) Светил в группе: 1 из 2.', priority = 98, is_active = 1, meta_json = '{}'
WHERE key = 'natal.planets.group.luminaries.count.1' AND locale = 'ru-RU' AND (topic_category = 'self_esteem');

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.planets.group.luminaries.count.1', 'self_esteem', 'ru-RU', '(self_esteem) Светил в группе: 1 из 2.', 98, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.planets.group.luminaries.count.1' AND locale = 'ru-RU' AND (topic_category = 'self_esteem')
);

UPDATE knowledge_items
SET text = '(self_esteem) Светил в группе: 2 из 2.', priority = 98, is_active = 1, meta_json = '{}'
WHERE key = 'natal.planets.group.luminaries.count.2' AND locale = 'ru-RU' AND (topic_category = 'self_esteem');

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.planets.group.luminaries.count.2', 'self_esteem', 'ru-RU', '(self_esteem) Светил в группе: 2 из 2.', 98, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.planets.group.luminaries.count.2' AND locale = 'ru-RU' AND (topic_category = 'self_esteem')
);

UPDATE knowledge_items
SET text = '(self_esteem) Группа планет: личные (Меркурий, Венера, Марс) — мышление, притяжение и способ действовать.', priority = 108, is_active = 1, meta_json = '{}'
WHERE key = 'natal.planets.group.inner.present' AND locale = 'ru-RU' AND (topic_category = 'self_esteem');

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.planets.group.inner.present', 'self_esteem', 'ru-RU', '(self_esteem) Группа планет: личные (Меркурий, Венера, Марс) — мышление, притяжение и способ действовать.', 108, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.planets.group.inner.present' AND locale = 'ru-RU' AND (topic_category = 'self_esteem')
);

UPDATE knowledge_items
SET text = '(self_esteem) Личных планет в группе: 0 из 3.', priority = 98, is_active = 1, meta_json = '{}'
WHERE key = 'natal.planets.group.inner.count.0' AND locale = 'ru-RU' AND (topic_category = 'self_esteem');

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.planets.group.inner.count.0', 'self_esteem', 'ru-RU', '(self_esteem) Личных планет в группе: 0 из 3.', 98, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.planets.group.inner.count.0' AND locale = 'ru-RU' AND (topic_category = 'self_esteem')
);

UPDATE knowledge_items
SET text = '(self_esteem) Личных планет в группе: 1 из 3.', priority = 98, is_active = 1, meta_json = '{}'
WHERE key = 'natal.planets.group.inner.count.1' AND locale = 'ru-RU' AND (topic_category = 'self_esteem');

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.planets.group.inner.count.1', 'self_esteem', 'ru-RU', '(self_esteem) Личных планет в группе: 1 из 3.', 98, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.planets.group.inner.count.1' AND locale = 'ru-RU' AND (topic_category = 'self_esteem')
);

UPDATE knowledge_items
SET text = '(self_esteem) Личных планет в группе: 2 из 3.', priority = 98, is_active = 1, meta_json = '{}'
WHERE key = 'natal.planets.group.inner.count.2' AND locale = 'ru-RU' AND (topic_category = 'self_esteem');

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.planets.group.inner.count.2', 'self_esteem', 'ru-RU', '(self_esteem) Личных планет в группе: 2 из 3.', 98, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.planets.group.inner.count.2' AND locale = 'ru-RU' AND (topic_category = 'self_esteem')
);

UPDATE knowledge_items
SET text = '(self_esteem) Личных планет в группе: 3 из 3.', priority = 98, is_active = 1, meta_json = '{}'
WHERE key = 'natal.planets.group.inner.count.3' AND locale = 'ru-RU' AND (topic_category = 'self_esteem');

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.planets.group.inner.count.3', 'self_esteem', 'ru-RU', '(self_esteem) Личных планет в группе: 3 из 3.', 98, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.planets.group.inner.count.3' AND locale = 'ru-RU' AND (topic_category = 'self_esteem')
);

UPDATE knowledge_items
SET text = '(self_esteem) Группа планет: социальные (Юпитер, Сатурн) — рост, правила и долгие цели.', priority = 108, is_active = 1, meta_json = '{}'
WHERE key = 'natal.planets.group.social.present' AND locale = 'ru-RU' AND (topic_category = 'self_esteem');

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.planets.group.social.present', 'self_esteem', 'ru-RU', '(self_esteem) Группа планет: социальные (Юпитер, Сатурн) — рост, правила и долгие цели.', 108, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.planets.group.social.present' AND locale = 'ru-RU' AND (topic_category = 'self_esteem')
);

UPDATE knowledge_items
SET text = '(self_esteem) Социальных планет в группе: 0 из 2.', priority = 98, is_active = 1, meta_json = '{}'
WHERE key = 'natal.planets.group.social.count.0' AND locale = 'ru-RU' AND (topic_category = 'self_esteem');

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.planets.group.social.count.0', 'self_esteem', 'ru-RU', '(self_esteem) Социальных планет в группе: 0 из 2.', 98, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.planets.group.social.count.0' AND locale = 'ru-RU' AND (topic_category = 'self_esteem')
);

UPDATE knowledge_items
SET text = '(self_esteem) Социальных планет в группе: 1 из 2.', priority = 98, is_active = 1, meta_json = '{}'
WHERE key = 'natal.planets.group.social.count.1' AND locale = 'ru-RU' AND (topic_category = 'self_esteem');

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.planets.group.social.count.1', 'self_esteem', 'ru-RU', '(self_esteem) Социальных планет в группе: 1 из 2.', 98, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.planets.group.social.count.1' AND locale = 'ru-RU' AND (topic_category = 'self_esteem')
);

UPDATE knowledge_items
SET text = '(self_esteem) Социальных планет в группе: 2 из 2.', priority = 98, is_active = 1, meta_json = '{}'
WHERE key = 'natal.planets.group.social.count.2' AND locale = 'ru-RU' AND (topic_category = 'self_esteem');

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.planets.group.social.count.2', 'self_esteem', 'ru-RU', '(self_esteem) Социальных планет в группе: 2 из 2.', 98, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.planets.group.social.count.2' AND locale = 'ru-RU' AND (topic_category = 'self_esteem')
);

UPDATE knowledge_items
SET text = '(self_esteem) Группа планет: высшие (Уран, Нептун, Плутон) — глубинные циклы, трансформация и перемены.', priority = 108, is_active = 1, meta_json = '{}'
WHERE key = 'natal.planets.group.outer.present' AND locale = 'ru-RU' AND (topic_category = 'self_esteem');

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.planets.group.outer.present', 'self_esteem', 'ru-RU', '(self_esteem) Группа планет: высшие (Уран, Нептун, Плутон) — глубинные циклы, трансформация и перемены.', 108, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.planets.group.outer.present' AND locale = 'ru-RU' AND (topic_category = 'self_esteem')
);

UPDATE knowledge_items
SET text = '(self_esteem) Высших планет в группе: 0 из 3.', priority = 98, is_active = 1, meta_json = '{}'
WHERE key = 'natal.planets.group.outer.count.0' AND locale = 'ru-RU' AND (topic_category = 'self_esteem');

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.planets.group.outer.count.0', 'self_esteem', 'ru-RU', '(self_esteem) Высших планет в группе: 0 из 3.', 98, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.planets.group.outer.count.0' AND locale = 'ru-RU' AND (topic_category = 'self_esteem')
);

UPDATE knowledge_items
SET text = '(self_esteem) Высших планет в группе: 1 из 3.', priority = 98, is_active = 1, meta_json = '{}'
WHERE key = 'natal.planets.group.outer.count.1' AND locale = 'ru-RU' AND (topic_category = 'self_esteem');

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.planets.group.outer.count.1', 'self_esteem', 'ru-RU', '(self_esteem) Высших планет в группе: 1 из 3.', 98, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.planets.group.outer.count.1' AND locale = 'ru-RU' AND (topic_category = 'self_esteem')
);

UPDATE knowledge_items
SET text = '(self_esteem) Высших планет в группе: 2 из 3.', priority = 98, is_active = 1, meta_json = '{}'
WHERE key = 'natal.planets.group.outer.count.2' AND locale = 'ru-RU' AND (topic_category = 'self_esteem');

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.planets.group.outer.count.2', 'self_esteem', 'ru-RU', '(self_esteem) Высших планет в группе: 2 из 3.', 98, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.planets.group.outer.count.2' AND locale = 'ru-RU' AND (topic_category = 'self_esteem')
);

UPDATE knowledge_items
SET text = '(self_esteem) Высших планет в группе: 3 из 3.', priority = 98, is_active = 1, meta_json = '{}'
WHERE key = 'natal.planets.group.outer.count.3' AND locale = 'ru-RU' AND (topic_category = 'self_esteem');

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.planets.group.outer.count.3', 'self_esteem', 'ru-RU', '(self_esteem) Высших планет в группе: 3 из 3.', 98, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.planets.group.outer.count.3' AND locale = 'ru-RU' AND (topic_category = 'self_esteem')
);

UPDATE knowledge_items
SET text = '(strengths_weaknesses) Группа планет: светила (Солнце и Луна) — базовый тон личности и эмоциональный фон.', priority = 108, is_active = 1, meta_json = '{}'
WHERE key = 'natal.planets.group.luminaries.present' AND locale = 'ru-RU' AND (topic_category = 'strengths_weaknesses');

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.planets.group.luminaries.present', 'strengths_weaknesses', 'ru-RU', '(strengths_weaknesses) Группа планет: светила (Солнце и Луна) — базовый тон личности и эмоциональный фон.', 108, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.planets.group.luminaries.present' AND locale = 'ru-RU' AND (topic_category = 'strengths_weaknesses')
);

UPDATE knowledge_items
SET text = '(strengths_weaknesses) Светил в группе: 0 из 2.', priority = 98, is_active = 1, meta_json = '{}'
WHERE key = 'natal.planets.group.luminaries.count.0' AND locale = 'ru-RU' AND (topic_category = 'strengths_weaknesses');

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.planets.group.luminaries.count.0', 'strengths_weaknesses', 'ru-RU', '(strengths_weaknesses) Светил в группе: 0 из 2.', 98, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.planets.group.luminaries.count.0' AND locale = 'ru-RU' AND (topic_category = 'strengths_weaknesses')
);

UPDATE knowledge_items
SET text = '(strengths_weaknesses) Светил в группе: 1 из 2.', priority = 98, is_active = 1, meta_json = '{}'
WHERE key = 'natal.planets.group.luminaries.count.1' AND locale = 'ru-RU' AND (topic_category = 'strengths_weaknesses');

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.planets.group.luminaries.count.1', 'strengths_weaknesses', 'ru-RU', '(strengths_weaknesses) Светил в группе: 1 из 2.', 98, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.planets.group.luminaries.count.1' AND locale = 'ru-RU' AND (topic_category = 'strengths_weaknesses')
);

UPDATE knowledge_items
SET text = '(strengths_weaknesses) Светил в группе: 2 из 2.', priority = 98, is_active = 1, meta_json = '{}'
WHERE key = 'natal.planets.group.luminaries.count.2' AND locale = 'ru-RU' AND (topic_category = 'strengths_weaknesses');

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.planets.group.luminaries.count.2', 'strengths_weaknesses', 'ru-RU', '(strengths_weaknesses) Светил в группе: 2 из 2.', 98, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.planets.group.luminaries.count.2' AND locale = 'ru-RU' AND (topic_category = 'strengths_weaknesses')
);

UPDATE knowledge_items
SET text = '(strengths_weaknesses) Группа планет: личные (Меркурий, Венера, Марс) — мышление, притяжение и способ действовать.', priority = 108, is_active = 1, meta_json = '{}'
WHERE key = 'natal.planets.group.inner.present' AND locale = 'ru-RU' AND (topic_category = 'strengths_weaknesses');

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.planets.group.inner.present', 'strengths_weaknesses', 'ru-RU', '(strengths_weaknesses) Группа планет: личные (Меркурий, Венера, Марс) — мышление, притяжение и способ действовать.', 108, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.planets.group.inner.present' AND locale = 'ru-RU' AND (topic_category = 'strengths_weaknesses')
);

UPDATE knowledge_items
SET text = '(strengths_weaknesses) Личных планет в группе: 0 из 3.', priority = 98, is_active = 1, meta_json = '{}'
WHERE key = 'natal.planets.group.inner.count.0' AND locale = 'ru-RU' AND (topic_category = 'strengths_weaknesses');

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.planets.group.inner.count.0', 'strengths_weaknesses', 'ru-RU', '(strengths_weaknesses) Личных планет в группе: 0 из 3.', 98, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.planets.group.inner.count.0' AND locale = 'ru-RU' AND (topic_category = 'strengths_weaknesses')
);

UPDATE knowledge_items
SET text = '(strengths_weaknesses) Личных планет в группе: 1 из 3.', priority = 98, is_active = 1, meta_json = '{}'
WHERE key = 'natal.planets.group.inner.count.1' AND locale = 'ru-RU' AND (topic_category = 'strengths_weaknesses');

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.planets.group.inner.count.1', 'strengths_weaknesses', 'ru-RU', '(strengths_weaknesses) Личных планет в группе: 1 из 3.', 98, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.planets.group.inner.count.1' AND locale = 'ru-RU' AND (topic_category = 'strengths_weaknesses')
);

UPDATE knowledge_items
SET text = '(strengths_weaknesses) Личных планет в группе: 2 из 3.', priority = 98, is_active = 1, meta_json = '{}'
WHERE key = 'natal.planets.group.inner.count.2' AND locale = 'ru-RU' AND (topic_category = 'strengths_weaknesses');

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.planets.group.inner.count.2', 'strengths_weaknesses', 'ru-RU', '(strengths_weaknesses) Личных планет в группе: 2 из 3.', 98, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.planets.group.inner.count.2' AND locale = 'ru-RU' AND (topic_category = 'strengths_weaknesses')
);

UPDATE knowledge_items
SET text = '(strengths_weaknesses) Личных планет в группе: 3 из 3.', priority = 98, is_active = 1, meta_json = '{}'
WHERE key = 'natal.planets.group.inner.count.3' AND locale = 'ru-RU' AND (topic_category = 'strengths_weaknesses');

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.planets.group.inner.count.3', 'strengths_weaknesses', 'ru-RU', '(strengths_weaknesses) Личных планет в группе: 3 из 3.', 98, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.planets.group.inner.count.3' AND locale = 'ru-RU' AND (topic_category = 'strengths_weaknesses')
);

UPDATE knowledge_items
SET text = '(strengths_weaknesses) Группа планет: социальные (Юпитер, Сатурн) — рост, правила и долгие цели.', priority = 108, is_active = 1, meta_json = '{}'
WHERE key = 'natal.planets.group.social.present' AND locale = 'ru-RU' AND (topic_category = 'strengths_weaknesses');

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.planets.group.social.present', 'strengths_weaknesses', 'ru-RU', '(strengths_weaknesses) Группа планет: социальные (Юпитер, Сатурн) — рост, правила и долгие цели.', 108, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.planets.group.social.present' AND locale = 'ru-RU' AND (topic_category = 'strengths_weaknesses')
);

UPDATE knowledge_items
SET text = '(strengths_weaknesses) Социальных планет в группе: 0 из 2.', priority = 98, is_active = 1, meta_json = '{}'
WHERE key = 'natal.planets.group.social.count.0' AND locale = 'ru-RU' AND (topic_category = 'strengths_weaknesses');

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.planets.group.social.count.0', 'strengths_weaknesses', 'ru-RU', '(strengths_weaknesses) Социальных планет в группе: 0 из 2.', 98, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.planets.group.social.count.0' AND locale = 'ru-RU' AND (topic_category = 'strengths_weaknesses')
);

UPDATE knowledge_items
SET text = '(strengths_weaknesses) Социальных планет в группе: 1 из 2.', priority = 98, is_active = 1, meta_json = '{}'
WHERE key = 'natal.planets.group.social.count.1' AND locale = 'ru-RU' AND (topic_category = 'strengths_weaknesses');

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.planets.group.social.count.1', 'strengths_weaknesses', 'ru-RU', '(strengths_weaknesses) Социальных планет в группе: 1 из 2.', 98, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.planets.group.social.count.1' AND locale = 'ru-RU' AND (topic_category = 'strengths_weaknesses')
);

UPDATE knowledge_items
SET text = '(strengths_weaknesses) Социальных планет в группе: 2 из 2.', priority = 98, is_active = 1, meta_json = '{}'
WHERE key = 'natal.planets.group.social.count.2' AND locale = 'ru-RU' AND (topic_category = 'strengths_weaknesses');

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.planets.group.social.count.2', 'strengths_weaknesses', 'ru-RU', '(strengths_weaknesses) Социальных планет в группе: 2 из 2.', 98, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.planets.group.social.count.2' AND locale = 'ru-RU' AND (topic_category = 'strengths_weaknesses')
);

UPDATE knowledge_items
SET text = '(strengths_weaknesses) Группа планет: высшие (Уран, Нептун, Плутон) — глубинные циклы, трансформация и перемены.', priority = 108, is_active = 1, meta_json = '{}'
WHERE key = 'natal.planets.group.outer.present' AND locale = 'ru-RU' AND (topic_category = 'strengths_weaknesses');

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.planets.group.outer.present', 'strengths_weaknesses', 'ru-RU', '(strengths_weaknesses) Группа планет: высшие (Уран, Нептун, Плутон) — глубинные циклы, трансформация и перемены.', 108, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.planets.group.outer.present' AND locale = 'ru-RU' AND (topic_category = 'strengths_weaknesses')
);

UPDATE knowledge_items
SET text = '(strengths_weaknesses) Высших планет в группе: 0 из 3.', priority = 98, is_active = 1, meta_json = '{}'
WHERE key = 'natal.planets.group.outer.count.0' AND locale = 'ru-RU' AND (topic_category = 'strengths_weaknesses');

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.planets.group.outer.count.0', 'strengths_weaknesses', 'ru-RU', '(strengths_weaknesses) Высших планет в группе: 0 из 3.', 98, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.planets.group.outer.count.0' AND locale = 'ru-RU' AND (topic_category = 'strengths_weaknesses')
);

UPDATE knowledge_items
SET text = '(strengths_weaknesses) Высших планет в группе: 1 из 3.', priority = 98, is_active = 1, meta_json = '{}'
WHERE key = 'natal.planets.group.outer.count.1' AND locale = 'ru-RU' AND (topic_category = 'strengths_weaknesses');

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.planets.group.outer.count.1', 'strengths_weaknesses', 'ru-RU', '(strengths_weaknesses) Высших планет в группе: 1 из 3.', 98, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.planets.group.outer.count.1' AND locale = 'ru-RU' AND (topic_category = 'strengths_weaknesses')
);

UPDATE knowledge_items
SET text = '(strengths_weaknesses) Высших планет в группе: 2 из 3.', priority = 98, is_active = 1, meta_json = '{}'
WHERE key = 'natal.planets.group.outer.count.2' AND locale = 'ru-RU' AND (topic_category = 'strengths_weaknesses');

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.planets.group.outer.count.2', 'strengths_weaknesses', 'ru-RU', '(strengths_weaknesses) Высших планет в группе: 2 из 3.', 98, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.planets.group.outer.count.2' AND locale = 'ru-RU' AND (topic_category = 'strengths_weaknesses')
);

UPDATE knowledge_items
SET text = '(strengths_weaknesses) Высших планет в группе: 3 из 3.', priority = 98, is_active = 1, meta_json = '{}'
WHERE key = 'natal.planets.group.outer.count.3' AND locale = 'ru-RU' AND (topic_category = 'strengths_weaknesses');

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.planets.group.outer.count.3', 'strengths_weaknesses', 'ru-RU', '(strengths_weaknesses) Высших планет в группе: 3 из 3.', 98, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.planets.group.outer.count.3' AND locale = 'ru-RU' AND (topic_category = 'strengths_weaknesses')
);

UPDATE knowledge_items
SET text = '(talents) Группа планет: светила (Солнце и Луна) — базовый тон личности и эмоциональный фон.', priority = 108, is_active = 1, meta_json = '{}'
WHERE key = 'natal.planets.group.luminaries.present' AND locale = 'ru-RU' AND (topic_category = 'talents');

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.planets.group.luminaries.present', 'talents', 'ru-RU', '(talents) Группа планет: светила (Солнце и Луна) — базовый тон личности и эмоциональный фон.', 108, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.planets.group.luminaries.present' AND locale = 'ru-RU' AND (topic_category = 'talents')
);

UPDATE knowledge_items
SET text = '(talents) Светил в группе: 0 из 2.', priority = 98, is_active = 1, meta_json = '{}'
WHERE key = 'natal.planets.group.luminaries.count.0' AND locale = 'ru-RU' AND (topic_category = 'talents');

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.planets.group.luminaries.count.0', 'talents', 'ru-RU', '(talents) Светил в группе: 0 из 2.', 98, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.planets.group.luminaries.count.0' AND locale = 'ru-RU' AND (topic_category = 'talents')
);

UPDATE knowledge_items
SET text = '(talents) Светил в группе: 1 из 2.', priority = 98, is_active = 1, meta_json = '{}'
WHERE key = 'natal.planets.group.luminaries.count.1' AND locale = 'ru-RU' AND (topic_category = 'talents');

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.planets.group.luminaries.count.1', 'talents', 'ru-RU', '(talents) Светил в группе: 1 из 2.', 98, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.planets.group.luminaries.count.1' AND locale = 'ru-RU' AND (topic_category = 'talents')
);

UPDATE knowledge_items
SET text = '(talents) Светил в группе: 2 из 2.', priority = 98, is_active = 1, meta_json = '{}'
WHERE key = 'natal.planets.group.luminaries.count.2' AND locale = 'ru-RU' AND (topic_category = 'talents');

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.planets.group.luminaries.count.2', 'talents', 'ru-RU', '(talents) Светил в группе: 2 из 2.', 98, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.planets.group.luminaries.count.2' AND locale = 'ru-RU' AND (topic_category = 'talents')
);

UPDATE knowledge_items
SET text = '(talents) Группа планет: личные (Меркурий, Венера, Марс) — мышление, притяжение и способ действовать.', priority = 108, is_active = 1, meta_json = '{}'
WHERE key = 'natal.planets.group.inner.present' AND locale = 'ru-RU' AND (topic_category = 'talents');

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.planets.group.inner.present', 'talents', 'ru-RU', '(talents) Группа планет: личные (Меркурий, Венера, Марс) — мышление, притяжение и способ действовать.', 108, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.planets.group.inner.present' AND locale = 'ru-RU' AND (topic_category = 'talents')
);

UPDATE knowledge_items
SET text = '(talents) Личных планет в группе: 0 из 3.', priority = 98, is_active = 1, meta_json = '{}'
WHERE key = 'natal.planets.group.inner.count.0' AND locale = 'ru-RU' AND (topic_category = 'talents');

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.planets.group.inner.count.0', 'talents', 'ru-RU', '(talents) Личных планет в группе: 0 из 3.', 98, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.planets.group.inner.count.0' AND locale = 'ru-RU' AND (topic_category = 'talents')
);

UPDATE knowledge_items
SET text = '(talents) Личных планет в группе: 1 из 3.', priority = 98, is_active = 1, meta_json = '{}'
WHERE key = 'natal.planets.group.inner.count.1' AND locale = 'ru-RU' AND (topic_category = 'talents');

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.planets.group.inner.count.1', 'talents', 'ru-RU', '(talents) Личных планет в группе: 1 из 3.', 98, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.planets.group.inner.count.1' AND locale = 'ru-RU' AND (topic_category = 'talents')
);

UPDATE knowledge_items
SET text = '(talents) Личных планет в группе: 2 из 3.', priority = 98, is_active = 1, meta_json = '{}'
WHERE key = 'natal.planets.group.inner.count.2' AND locale = 'ru-RU' AND (topic_category = 'talents');

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.planets.group.inner.count.2', 'talents', 'ru-RU', '(talents) Личных планет в группе: 2 из 3.', 98, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.planets.group.inner.count.2' AND locale = 'ru-RU' AND (topic_category = 'talents')
);

UPDATE knowledge_items
SET text = '(talents) Личных планет в группе: 3 из 3.', priority = 98, is_active = 1, meta_json = '{}'
WHERE key = 'natal.planets.group.inner.count.3' AND locale = 'ru-RU' AND (topic_category = 'talents');

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.planets.group.inner.count.3', 'talents', 'ru-RU', '(talents) Личных планет в группе: 3 из 3.', 98, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.planets.group.inner.count.3' AND locale = 'ru-RU' AND (topic_category = 'talents')
);

UPDATE knowledge_items
SET text = '(talents) Группа планет: социальные (Юпитер, Сатурн) — рост, правила и долгие цели.', priority = 108, is_active = 1, meta_json = '{}'
WHERE key = 'natal.planets.group.social.present' AND locale = 'ru-RU' AND (topic_category = 'talents');

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.planets.group.social.present', 'talents', 'ru-RU', '(talents) Группа планет: социальные (Юпитер, Сатурн) — рост, правила и долгие цели.', 108, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.planets.group.social.present' AND locale = 'ru-RU' AND (topic_category = 'talents')
);

UPDATE knowledge_items
SET text = '(talents) Социальных планет в группе: 0 из 2.', priority = 98, is_active = 1, meta_json = '{}'
WHERE key = 'natal.planets.group.social.count.0' AND locale = 'ru-RU' AND (topic_category = 'talents');

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.planets.group.social.count.0', 'talents', 'ru-RU', '(talents) Социальных планет в группе: 0 из 2.', 98, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.planets.group.social.count.0' AND locale = 'ru-RU' AND (topic_category = 'talents')
);

UPDATE knowledge_items
SET text = '(talents) Социальных планет в группе: 1 из 2.', priority = 98, is_active = 1, meta_json = '{}'
WHERE key = 'natal.planets.group.social.count.1' AND locale = 'ru-RU' AND (topic_category = 'talents');

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.planets.group.social.count.1', 'talents', 'ru-RU', '(talents) Социальных планет в группе: 1 из 2.', 98, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.planets.group.social.count.1' AND locale = 'ru-RU' AND (topic_category = 'talents')
);

UPDATE knowledge_items
SET text = '(talents) Социальных планет в группе: 2 из 2.', priority = 98, is_active = 1, meta_json = '{}'
WHERE key = 'natal.planets.group.social.count.2' AND locale = 'ru-RU' AND (topic_category = 'talents');

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.planets.group.social.count.2', 'talents', 'ru-RU', '(talents) Социальных планет в группе: 2 из 2.', 98, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.planets.group.social.count.2' AND locale = 'ru-RU' AND (topic_category = 'talents')
);

UPDATE knowledge_items
SET text = '(talents) Группа планет: высшие (Уран, Нептун, Плутон) — глубинные циклы, трансформация и перемены.', priority = 108, is_active = 1, meta_json = '{}'
WHERE key = 'natal.planets.group.outer.present' AND locale = 'ru-RU' AND (topic_category = 'talents');

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.planets.group.outer.present', 'talents', 'ru-RU', '(talents) Группа планет: высшие (Уран, Нептун, Плутон) — глубинные циклы, трансформация и перемены.', 108, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.planets.group.outer.present' AND locale = 'ru-RU' AND (topic_category = 'talents')
);

UPDATE knowledge_items
SET text = '(talents) Высших планет в группе: 0 из 3.', priority = 98, is_active = 1, meta_json = '{}'
WHERE key = 'natal.planets.group.outer.count.0' AND locale = 'ru-RU' AND (topic_category = 'talents');

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.planets.group.outer.count.0', 'talents', 'ru-RU', '(talents) Высших планет в группе: 0 из 3.', 98, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.planets.group.outer.count.0' AND locale = 'ru-RU' AND (topic_category = 'talents')
);

UPDATE knowledge_items
SET text = '(talents) Высших планет в группе: 1 из 3.', priority = 98, is_active = 1, meta_json = '{}'
WHERE key = 'natal.planets.group.outer.count.1' AND locale = 'ru-RU' AND (topic_category = 'talents');

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.planets.group.outer.count.1', 'talents', 'ru-RU', '(talents) Высших планет в группе: 1 из 3.', 98, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.planets.group.outer.count.1' AND locale = 'ru-RU' AND (topic_category = 'talents')
);

UPDATE knowledge_items
SET text = '(talents) Высших планет в группе: 2 из 3.', priority = 98, is_active = 1, meta_json = '{}'
WHERE key = 'natal.planets.group.outer.count.2' AND locale = 'ru-RU' AND (topic_category = 'talents');

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.planets.group.outer.count.2', 'talents', 'ru-RU', '(talents) Высших планет в группе: 2 из 3.', 98, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.planets.group.outer.count.2' AND locale = 'ru-RU' AND (topic_category = 'talents')
);

UPDATE knowledge_items
SET text = '(talents) Высших планет в группе: 3 из 3.', priority = 98, is_active = 1, meta_json = '{}'
WHERE key = 'natal.planets.group.outer.count.3' AND locale = 'ru-RU' AND (topic_category = 'talents');

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.planets.group.outer.count.3', 'talents', 'ru-RU', '(talents) Высших планет в группе: 3 из 3.', 98, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.planets.group.outer.count.3' AND locale = 'ru-RU' AND (topic_category = 'talents')
);

COMMIT;

