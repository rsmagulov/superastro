-- AUTO-GENERATED. DO NOT EDIT BY HAND.

-- Seeds natal.sign.<sign>.present for global + per-topic rows.

BEGIN;

UPDATE knowledge_items
SET text = 'Акцент на знаке «Овен». Он заметнее проявляется в характере и сценариях жизни, если в «Овен» находятся личные планеты, углы (ASC/MC/DSC/IC) или куспиды домов.', priority = 100, is_active = 1, meta_json = '{}'
WHERE key = 'natal.sign.aries.present' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.sign.aries.present', '', 'ru-RU', 'Акцент на знаке «Овен». Он заметнее проявляется в характере и сценариях жизни, если в «Овен» находятся личные планеты, углы (ASC/MC/DSC/IC) или куспиды домов.', 100, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.sign.aries.present' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Акцент на знаке «Телец». Он заметнее проявляется в характере и сценариях жизни, если в «Телец» находятся личные планеты, углы (ASC/MC/DSC/IC) или куспиды домов.', priority = 100, is_active = 1, meta_json = '{}'
WHERE key = 'natal.sign.taurus.present' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.sign.taurus.present', '', 'ru-RU', 'Акцент на знаке «Телец». Он заметнее проявляется в характере и сценариях жизни, если в «Телец» находятся личные планеты, углы (ASC/MC/DSC/IC) или куспиды домов.', 100, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.sign.taurus.present' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Акцент на знаке «Близнецы». Он заметнее проявляется в характере и сценариях жизни, если в «Близнецы» находятся личные планеты, углы (ASC/MC/DSC/IC) или куспиды домов.', priority = 100, is_active = 1, meta_json = '{}'
WHERE key = 'natal.sign.gemini.present' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.sign.gemini.present', '', 'ru-RU', 'Акцент на знаке «Близнецы». Он заметнее проявляется в характере и сценариях жизни, если в «Близнецы» находятся личные планеты, углы (ASC/MC/DSC/IC) или куспиды домов.', 100, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.sign.gemini.present' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Акцент на знаке «Рак». Он заметнее проявляется в характере и сценариях жизни, если в «Рак» находятся личные планеты, углы (ASC/MC/DSC/IC) или куспиды домов.', priority = 100, is_active = 1, meta_json = '{}'
WHERE key = 'natal.sign.cancer.present' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.sign.cancer.present', '', 'ru-RU', 'Акцент на знаке «Рак». Он заметнее проявляется в характере и сценариях жизни, если в «Рак» находятся личные планеты, углы (ASC/MC/DSC/IC) или куспиды домов.', 100, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.sign.cancer.present' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Акцент на знаке «Лев». Он заметнее проявляется в характере и сценариях жизни, если в «Лев» находятся личные планеты, углы (ASC/MC/DSC/IC) или куспиды домов.', priority = 100, is_active = 1, meta_json = '{}'
WHERE key = 'natal.sign.leo.present' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.sign.leo.present', '', 'ru-RU', 'Акцент на знаке «Лев». Он заметнее проявляется в характере и сценариях жизни, если в «Лев» находятся личные планеты, углы (ASC/MC/DSC/IC) или куспиды домов.', 100, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.sign.leo.present' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Акцент на знаке «Дева». Он заметнее проявляется в характере и сценариях жизни, если в «Дева» находятся личные планеты, углы (ASC/MC/DSC/IC) или куспиды домов.', priority = 100, is_active = 1, meta_json = '{}'
WHERE key = 'natal.sign.virgo.present' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.sign.virgo.present', '', 'ru-RU', 'Акцент на знаке «Дева». Он заметнее проявляется в характере и сценариях жизни, если в «Дева» находятся личные планеты, углы (ASC/MC/DSC/IC) или куспиды домов.', 100, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.sign.virgo.present' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Акцент на знаке «Весы». Он заметнее проявляется в характере и сценариях жизни, если в «Весы» находятся личные планеты, углы (ASC/MC/DSC/IC) или куспиды домов.', priority = 100, is_active = 1, meta_json = '{}'
WHERE key = 'natal.sign.libra.present' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.sign.libra.present', '', 'ru-RU', 'Акцент на знаке «Весы». Он заметнее проявляется в характере и сценариях жизни, если в «Весы» находятся личные планеты, углы (ASC/MC/DSC/IC) или куспиды домов.', 100, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.sign.libra.present' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Акцент на знаке «Скорпион». Он заметнее проявляется в характере и сценариях жизни, если в «Скорпион» находятся личные планеты, углы (ASC/MC/DSC/IC) или куспиды домов.', priority = 100, is_active = 1, meta_json = '{}'
WHERE key = 'natal.sign.scorpio.present' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.sign.scorpio.present', '', 'ru-RU', 'Акцент на знаке «Скорпион». Он заметнее проявляется в характере и сценариях жизни, если в «Скорпион» находятся личные планеты, углы (ASC/MC/DSC/IC) или куспиды домов.', 100, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.sign.scorpio.present' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Акцент на знаке «Стрелец». Он заметнее проявляется в характере и сценариях жизни, если в «Стрелец» находятся личные планеты, углы (ASC/MC/DSC/IC) или куспиды домов.', priority = 100, is_active = 1, meta_json = '{}'
WHERE key = 'natal.sign.sagittarius.present' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.sign.sagittarius.present', '', 'ru-RU', 'Акцент на знаке «Стрелец». Он заметнее проявляется в характере и сценариях жизни, если в «Стрелец» находятся личные планеты, углы (ASC/MC/DSC/IC) или куспиды домов.', 100, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.sign.sagittarius.present' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Акцент на знаке «Козерог». Он заметнее проявляется в характере и сценариях жизни, если в «Козерог» находятся личные планеты, углы (ASC/MC/DSC/IC) или куспиды домов.', priority = 100, is_active = 1, meta_json = '{}'
WHERE key = 'natal.sign.capricorn.present' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.sign.capricorn.present', '', 'ru-RU', 'Акцент на знаке «Козерог». Он заметнее проявляется в характере и сценариях жизни, если в «Козерог» находятся личные планеты, углы (ASC/MC/DSC/IC) или куспиды домов.', 100, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.sign.capricorn.present' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Акцент на знаке «Водолей». Он заметнее проявляется в характере и сценариях жизни, если в «Водолей» находятся личные планеты, углы (ASC/MC/DSC/IC) или куспиды домов.', priority = 100, is_active = 1, meta_json = '{}'
WHERE key = 'natal.sign.aquarius.present' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.sign.aquarius.present', '', 'ru-RU', 'Акцент на знаке «Водолей». Он заметнее проявляется в характере и сценариях жизни, если в «Водолей» находятся личные планеты, углы (ASC/MC/DSC/IC) или куспиды домов.', 100, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.sign.aquarius.present' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Акцент на знаке «Рыбы». Он заметнее проявляется в характере и сценариях жизни, если в «Рыбы» находятся личные планеты, углы (ASC/MC/DSC/IC) или куспиды домов.', priority = 100, is_active = 1, meta_json = '{}'
WHERE key = 'natal.sign.pisces.present' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL);

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.sign.pisces.present', '', 'ru-RU', 'Акцент на знаке «Рыбы». Он заметнее проявляется в характере и сценариях жизни, если в «Рыбы» находятся личные планеты, углы (ASC/MC/DSC/IC) или куспиды домов.', 100, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.sign.pisces.present' AND locale = 'ru-RU' AND (topic_category = '' OR topic_category IS NULL)
);

UPDATE knowledge_items
SET text = 'Тема «Род»: заметен акцент знака «Овен». Это добавляет стилю проявления темы качества «Овен» (через личные планеты, углы или куспиды домов в этом знаке).', priority = 102, is_active = 1, meta_json = '{}'
WHERE key = 'natal.sign.aries.present' AND locale = 'ru-RU' AND (topic_category = 'ancestral_topics');

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.sign.aries.present', 'ancestral_topics', 'ru-RU', 'Тема «Род»: заметен акцент знака «Овен». Это добавляет стилю проявления темы качества «Овен» (через личные планеты, углы или куспиды домов в этом знаке).', 102, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.sign.aries.present' AND locale = 'ru-RU' AND (topic_category = 'ancestral_topics')
);

UPDATE knowledge_items
SET text = 'Тема «Род»: заметен акцент знака «Телец». Это добавляет стилю проявления темы качества «Телец» (через личные планеты, углы или куспиды домов в этом знаке).', priority = 102, is_active = 1, meta_json = '{}'
WHERE key = 'natal.sign.taurus.present' AND locale = 'ru-RU' AND (topic_category = 'ancestral_topics');

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.sign.taurus.present', 'ancestral_topics', 'ru-RU', 'Тема «Род»: заметен акцент знака «Телец». Это добавляет стилю проявления темы качества «Телец» (через личные планеты, углы или куспиды домов в этом знаке).', 102, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.sign.taurus.present' AND locale = 'ru-RU' AND (topic_category = 'ancestral_topics')
);

UPDATE knowledge_items
SET text = 'Тема «Род»: заметен акцент знака «Близнецы». Это добавляет стилю проявления темы качества «Близнецы» (через личные планеты, углы или куспиды домов в этом знаке).', priority = 102, is_active = 1, meta_json = '{}'
WHERE key = 'natal.sign.gemini.present' AND locale = 'ru-RU' AND (topic_category = 'ancestral_topics');

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.sign.gemini.present', 'ancestral_topics', 'ru-RU', 'Тема «Род»: заметен акцент знака «Близнецы». Это добавляет стилю проявления темы качества «Близнецы» (через личные планеты, углы или куспиды домов в этом знаке).', 102, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.sign.gemini.present' AND locale = 'ru-RU' AND (topic_category = 'ancestral_topics')
);

UPDATE knowledge_items
SET text = 'Тема «Род»: заметен акцент знака «Рак». Это добавляет стилю проявления темы качества «Рак» (через личные планеты, углы или куспиды домов в этом знаке).', priority = 102, is_active = 1, meta_json = '{}'
WHERE key = 'natal.sign.cancer.present' AND locale = 'ru-RU' AND (topic_category = 'ancestral_topics');

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.sign.cancer.present', 'ancestral_topics', 'ru-RU', 'Тема «Род»: заметен акцент знака «Рак». Это добавляет стилю проявления темы качества «Рак» (через личные планеты, углы или куспиды домов в этом знаке).', 102, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.sign.cancer.present' AND locale = 'ru-RU' AND (topic_category = 'ancestral_topics')
);

UPDATE knowledge_items
SET text = 'Тема «Род»: заметен акцент знака «Лев». Это добавляет стилю проявления темы качества «Лев» (через личные планеты, углы или куспиды домов в этом знаке).', priority = 102, is_active = 1, meta_json = '{}'
WHERE key = 'natal.sign.leo.present' AND locale = 'ru-RU' AND (topic_category = 'ancestral_topics');

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.sign.leo.present', 'ancestral_topics', 'ru-RU', 'Тема «Род»: заметен акцент знака «Лев». Это добавляет стилю проявления темы качества «Лев» (через личные планеты, углы или куспиды домов в этом знаке).', 102, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.sign.leo.present' AND locale = 'ru-RU' AND (topic_category = 'ancestral_topics')
);

UPDATE knowledge_items
SET text = 'Тема «Род»: заметен акцент знака «Дева». Это добавляет стилю проявления темы качества «Дева» (через личные планеты, углы или куспиды домов в этом знаке).', priority = 102, is_active = 1, meta_json = '{}'
WHERE key = 'natal.sign.virgo.present' AND locale = 'ru-RU' AND (topic_category = 'ancestral_topics');

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.sign.virgo.present', 'ancestral_topics', 'ru-RU', 'Тема «Род»: заметен акцент знака «Дева». Это добавляет стилю проявления темы качества «Дева» (через личные планеты, углы или куспиды домов в этом знаке).', 102, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.sign.virgo.present' AND locale = 'ru-RU' AND (topic_category = 'ancestral_topics')
);

UPDATE knowledge_items
SET text = 'Тема «Род»: заметен акцент знака «Весы». Это добавляет стилю проявления темы качества «Весы» (через личные планеты, углы или куспиды домов в этом знаке).', priority = 102, is_active = 1, meta_json = '{}'
WHERE key = 'natal.sign.libra.present' AND locale = 'ru-RU' AND (topic_category = 'ancestral_topics');

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.sign.libra.present', 'ancestral_topics', 'ru-RU', 'Тема «Род»: заметен акцент знака «Весы». Это добавляет стилю проявления темы качества «Весы» (через личные планеты, углы или куспиды домов в этом знаке).', 102, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.sign.libra.present' AND locale = 'ru-RU' AND (topic_category = 'ancestral_topics')
);

UPDATE knowledge_items
SET text = 'Тема «Род»: заметен акцент знака «Скорпион». Это добавляет стилю проявления темы качества «Скорпион» (через личные планеты, углы или куспиды домов в этом знаке).', priority = 102, is_active = 1, meta_json = '{}'
WHERE key = 'natal.sign.scorpio.present' AND locale = 'ru-RU' AND (topic_category = 'ancestral_topics');

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.sign.scorpio.present', 'ancestral_topics', 'ru-RU', 'Тема «Род»: заметен акцент знака «Скорпион». Это добавляет стилю проявления темы качества «Скорпион» (через личные планеты, углы или куспиды домов в этом знаке).', 102, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.sign.scorpio.present' AND locale = 'ru-RU' AND (topic_category = 'ancestral_topics')
);

UPDATE knowledge_items
SET text = 'Тема «Род»: заметен акцент знака «Стрелец». Это добавляет стилю проявления темы качества «Стрелец» (через личные планеты, углы или куспиды домов в этом знаке).', priority = 102, is_active = 1, meta_json = '{}'
WHERE key = 'natal.sign.sagittarius.present' AND locale = 'ru-RU' AND (topic_category = 'ancestral_topics');

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.sign.sagittarius.present', 'ancestral_topics', 'ru-RU', 'Тема «Род»: заметен акцент знака «Стрелец». Это добавляет стилю проявления темы качества «Стрелец» (через личные планеты, углы или куспиды домов в этом знаке).', 102, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.sign.sagittarius.present' AND locale = 'ru-RU' AND (topic_category = 'ancestral_topics')
);

UPDATE knowledge_items
SET text = 'Тема «Род»: заметен акцент знака «Козерог». Это добавляет стилю проявления темы качества «Козерог» (через личные планеты, углы или куспиды домов в этом знаке).', priority = 102, is_active = 1, meta_json = '{}'
WHERE key = 'natal.sign.capricorn.present' AND locale = 'ru-RU' AND (topic_category = 'ancestral_topics');

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.sign.capricorn.present', 'ancestral_topics', 'ru-RU', 'Тема «Род»: заметен акцент знака «Козерог». Это добавляет стилю проявления темы качества «Козерог» (через личные планеты, углы или куспиды домов в этом знаке).', 102, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.sign.capricorn.present' AND locale = 'ru-RU' AND (topic_category = 'ancestral_topics')
);

UPDATE knowledge_items
SET text = 'Тема «Род»: заметен акцент знака «Водолей». Это добавляет стилю проявления темы качества «Водолей» (через личные планеты, углы или куспиды домов в этом знаке).', priority = 102, is_active = 1, meta_json = '{}'
WHERE key = 'natal.sign.aquarius.present' AND locale = 'ru-RU' AND (topic_category = 'ancestral_topics');

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.sign.aquarius.present', 'ancestral_topics', 'ru-RU', 'Тема «Род»: заметен акцент знака «Водолей». Это добавляет стилю проявления темы качества «Водолей» (через личные планеты, углы или куспиды домов в этом знаке).', 102, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.sign.aquarius.present' AND locale = 'ru-RU' AND (topic_category = 'ancestral_topics')
);

UPDATE knowledge_items
SET text = 'Тема «Род»: заметен акцент знака «Рыбы». Это добавляет стилю проявления темы качества «Рыбы» (через личные планеты, углы или куспиды домов в этом знаке).', priority = 102, is_active = 1, meta_json = '{}'
WHERE key = 'natal.sign.pisces.present' AND locale = 'ru-RU' AND (topic_category = 'ancestral_topics');

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.sign.pisces.present', 'ancestral_topics', 'ru-RU', 'Тема «Род»: заметен акцент знака «Рыбы». Это добавляет стилю проявления темы качества «Рыбы» (через личные планеты, углы или куспиды домов в этом знаке).', 102, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.sign.pisces.present' AND locale = 'ru-RU' AND (topic_category = 'ancestral_topics')
);

UPDATE knowledge_items
SET text = 'Тема «Карьера»: заметен акцент знака «Овен». Это добавляет стилю проявления темы качества «Овен» (через личные планеты, углы или куспиды домов в этом знаке).', priority = 102, is_active = 1, meta_json = '{}'
WHERE key = 'natal.sign.aries.present' AND locale = 'ru-RU' AND (topic_category = 'career');

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.sign.aries.present', 'career', 'ru-RU', 'Тема «Карьера»: заметен акцент знака «Овен». Это добавляет стилю проявления темы качества «Овен» (через личные планеты, углы или куспиды домов в этом знаке).', 102, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.sign.aries.present' AND locale = 'ru-RU' AND (topic_category = 'career')
);

UPDATE knowledge_items
SET text = 'Тема «Карьера»: заметен акцент знака «Телец». Это добавляет стилю проявления темы качества «Телец» (через личные планеты, углы или куспиды домов в этом знаке).', priority = 102, is_active = 1, meta_json = '{}'
WHERE key = 'natal.sign.taurus.present' AND locale = 'ru-RU' AND (topic_category = 'career');

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.sign.taurus.present', 'career', 'ru-RU', 'Тема «Карьера»: заметен акцент знака «Телец». Это добавляет стилю проявления темы качества «Телец» (через личные планеты, углы или куспиды домов в этом знаке).', 102, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.sign.taurus.present' AND locale = 'ru-RU' AND (topic_category = 'career')
);

UPDATE knowledge_items
SET text = 'Тема «Карьера»: заметен акцент знака «Близнецы». Это добавляет стилю проявления темы качества «Близнецы» (через личные планеты, углы или куспиды домов в этом знаке).', priority = 102, is_active = 1, meta_json = '{}'
WHERE key = 'natal.sign.gemini.present' AND locale = 'ru-RU' AND (topic_category = 'career');

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.sign.gemini.present', 'career', 'ru-RU', 'Тема «Карьера»: заметен акцент знака «Близнецы». Это добавляет стилю проявления темы качества «Близнецы» (через личные планеты, углы или куспиды домов в этом знаке).', 102, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.sign.gemini.present' AND locale = 'ru-RU' AND (topic_category = 'career')
);

UPDATE knowledge_items
SET text = 'Тема «Карьера»: заметен акцент знака «Рак». Это добавляет стилю проявления темы качества «Рак» (через личные планеты, углы или куспиды домов в этом знаке).', priority = 102, is_active = 1, meta_json = '{}'
WHERE key = 'natal.sign.cancer.present' AND locale = 'ru-RU' AND (topic_category = 'career');

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.sign.cancer.present', 'career', 'ru-RU', 'Тема «Карьера»: заметен акцент знака «Рак». Это добавляет стилю проявления темы качества «Рак» (через личные планеты, углы или куспиды домов в этом знаке).', 102, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.sign.cancer.present' AND locale = 'ru-RU' AND (topic_category = 'career')
);

UPDATE knowledge_items
SET text = 'Тема «Карьера»: заметен акцент знака «Лев». Это добавляет стилю проявления темы качества «Лев» (через личные планеты, углы или куспиды домов в этом знаке).', priority = 102, is_active = 1, meta_json = '{}'
WHERE key = 'natal.sign.leo.present' AND locale = 'ru-RU' AND (topic_category = 'career');

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.sign.leo.present', 'career', 'ru-RU', 'Тема «Карьера»: заметен акцент знака «Лев». Это добавляет стилю проявления темы качества «Лев» (через личные планеты, углы или куспиды домов в этом знаке).', 102, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.sign.leo.present' AND locale = 'ru-RU' AND (topic_category = 'career')
);

UPDATE knowledge_items
SET text = 'Тема «Карьера»: заметен акцент знака «Дева». Это добавляет стилю проявления темы качества «Дева» (через личные планеты, углы или куспиды домов в этом знаке).', priority = 102, is_active = 1, meta_json = '{}'
WHERE key = 'natal.sign.virgo.present' AND locale = 'ru-RU' AND (topic_category = 'career');

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.sign.virgo.present', 'career', 'ru-RU', 'Тема «Карьера»: заметен акцент знака «Дева». Это добавляет стилю проявления темы качества «Дева» (через личные планеты, углы или куспиды домов в этом знаке).', 102, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.sign.virgo.present' AND locale = 'ru-RU' AND (topic_category = 'career')
);

UPDATE knowledge_items
SET text = 'Тема «Карьера»: заметен акцент знака «Весы». Это добавляет стилю проявления темы качества «Весы» (через личные планеты, углы или куспиды домов в этом знаке).', priority = 102, is_active = 1, meta_json = '{}'
WHERE key = 'natal.sign.libra.present' AND locale = 'ru-RU' AND (topic_category = 'career');

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.sign.libra.present', 'career', 'ru-RU', 'Тема «Карьера»: заметен акцент знака «Весы». Это добавляет стилю проявления темы качества «Весы» (через личные планеты, углы или куспиды домов в этом знаке).', 102, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.sign.libra.present' AND locale = 'ru-RU' AND (topic_category = 'career')
);

UPDATE knowledge_items
SET text = 'Тема «Карьера»: заметен акцент знака «Скорпион». Это добавляет стилю проявления темы качества «Скорпион» (через личные планеты, углы или куспиды домов в этом знаке).', priority = 102, is_active = 1, meta_json = '{}'
WHERE key = 'natal.sign.scorpio.present' AND locale = 'ru-RU' AND (topic_category = 'career');

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.sign.scorpio.present', 'career', 'ru-RU', 'Тема «Карьера»: заметен акцент знака «Скорпион». Это добавляет стилю проявления темы качества «Скорпион» (через личные планеты, углы или куспиды домов в этом знаке).', 102, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.sign.scorpio.present' AND locale = 'ru-RU' AND (topic_category = 'career')
);

UPDATE knowledge_items
SET text = 'Тема «Карьера»: заметен акцент знака «Стрелец». Это добавляет стилю проявления темы качества «Стрелец» (через личные планеты, углы или куспиды домов в этом знаке).', priority = 102, is_active = 1, meta_json = '{}'
WHERE key = 'natal.sign.sagittarius.present' AND locale = 'ru-RU' AND (topic_category = 'career');

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.sign.sagittarius.present', 'career', 'ru-RU', 'Тема «Карьера»: заметен акцент знака «Стрелец». Это добавляет стилю проявления темы качества «Стрелец» (через личные планеты, углы или куспиды домов в этом знаке).', 102, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.sign.sagittarius.present' AND locale = 'ru-RU' AND (topic_category = 'career')
);

UPDATE knowledge_items
SET text = 'Тема «Карьера»: заметен акцент знака «Козерог». Это добавляет стилю проявления темы качества «Козерог» (через личные планеты, углы или куспиды домов в этом знаке).', priority = 102, is_active = 1, meta_json = '{}'
WHERE key = 'natal.sign.capricorn.present' AND locale = 'ru-RU' AND (topic_category = 'career');

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.sign.capricorn.present', 'career', 'ru-RU', 'Тема «Карьера»: заметен акцент знака «Козерог». Это добавляет стилю проявления темы качества «Козерог» (через личные планеты, углы или куспиды домов в этом знаке).', 102, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.sign.capricorn.present' AND locale = 'ru-RU' AND (topic_category = 'career')
);

UPDATE knowledge_items
SET text = 'Тема «Карьера»: заметен акцент знака «Водолей». Это добавляет стилю проявления темы качества «Водолей» (через личные планеты, углы или куспиды домов в этом знаке).', priority = 102, is_active = 1, meta_json = '{}'
WHERE key = 'natal.sign.aquarius.present' AND locale = 'ru-RU' AND (topic_category = 'career');

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.sign.aquarius.present', 'career', 'ru-RU', 'Тема «Карьера»: заметен акцент знака «Водолей». Это добавляет стилю проявления темы качества «Водолей» (через личные планеты, углы или куспиды домов в этом знаке).', 102, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.sign.aquarius.present' AND locale = 'ru-RU' AND (topic_category = 'career')
);

UPDATE knowledge_items
SET text = 'Тема «Карьера»: заметен акцент знака «Рыбы». Это добавляет стилю проявления темы качества «Рыбы» (через личные планеты, углы или куспиды домов в этом знаке).', priority = 102, is_active = 1, meta_json = '{}'
WHERE key = 'natal.sign.pisces.present' AND locale = 'ru-RU' AND (topic_category = 'career');

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.sign.pisces.present', 'career', 'ru-RU', 'Тема «Карьера»: заметен акцент знака «Рыбы». Это добавляет стилю проявления темы качества «Рыбы» (через личные планеты, углы или куспиды домов в этом знаке).', 102, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.sign.pisces.present' AND locale = 'ru-RU' AND (topic_category = 'career')
);

UPDATE knowledge_items
SET text = 'Тема «Творчество»: заметен акцент знака «Овен». Это добавляет стилю проявления темы качества «Овен» (через личные планеты, углы или куспиды домов в этом знаке).', priority = 102, is_active = 1, meta_json = '{}'
WHERE key = 'natal.sign.aries.present' AND locale = 'ru-RU' AND (topic_category = 'creativity');

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.sign.aries.present', 'creativity', 'ru-RU', 'Тема «Творчество»: заметен акцент знака «Овен». Это добавляет стилю проявления темы качества «Овен» (через личные планеты, углы или куспиды домов в этом знаке).', 102, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.sign.aries.present' AND locale = 'ru-RU' AND (topic_category = 'creativity')
);

UPDATE knowledge_items
SET text = 'Тема «Творчество»: заметен акцент знака «Телец». Это добавляет стилю проявления темы качества «Телец» (через личные планеты, углы или куспиды домов в этом знаке).', priority = 102, is_active = 1, meta_json = '{}'
WHERE key = 'natal.sign.taurus.present' AND locale = 'ru-RU' AND (topic_category = 'creativity');

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.sign.taurus.present', 'creativity', 'ru-RU', 'Тема «Творчество»: заметен акцент знака «Телец». Это добавляет стилю проявления темы качества «Телец» (через личные планеты, углы или куспиды домов в этом знаке).', 102, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.sign.taurus.present' AND locale = 'ru-RU' AND (topic_category = 'creativity')
);

UPDATE knowledge_items
SET text = 'Тема «Творчество»: заметен акцент знака «Близнецы». Это добавляет стилю проявления темы качества «Близнецы» (через личные планеты, углы или куспиды домов в этом знаке).', priority = 102, is_active = 1, meta_json = '{}'
WHERE key = 'natal.sign.gemini.present' AND locale = 'ru-RU' AND (topic_category = 'creativity');

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.sign.gemini.present', 'creativity', 'ru-RU', 'Тема «Творчество»: заметен акцент знака «Близнецы». Это добавляет стилю проявления темы качества «Близнецы» (через личные планеты, углы или куспиды домов в этом знаке).', 102, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.sign.gemini.present' AND locale = 'ru-RU' AND (topic_category = 'creativity')
);

UPDATE knowledge_items
SET text = 'Тема «Творчество»: заметен акцент знака «Рак». Это добавляет стилю проявления темы качества «Рак» (через личные планеты, углы или куспиды домов в этом знаке).', priority = 102, is_active = 1, meta_json = '{}'
WHERE key = 'natal.sign.cancer.present' AND locale = 'ru-RU' AND (topic_category = 'creativity');

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.sign.cancer.present', 'creativity', 'ru-RU', 'Тема «Творчество»: заметен акцент знака «Рак». Это добавляет стилю проявления темы качества «Рак» (через личные планеты, углы или куспиды домов в этом знаке).', 102, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.sign.cancer.present' AND locale = 'ru-RU' AND (topic_category = 'creativity')
);

UPDATE knowledge_items
SET text = 'Тема «Творчество»: заметен акцент знака «Лев». Это добавляет стилю проявления темы качества «Лев» (через личные планеты, углы или куспиды домов в этом знаке).', priority = 102, is_active = 1, meta_json = '{}'
WHERE key = 'natal.sign.leo.present' AND locale = 'ru-RU' AND (topic_category = 'creativity');

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.sign.leo.present', 'creativity', 'ru-RU', 'Тема «Творчество»: заметен акцент знака «Лев». Это добавляет стилю проявления темы качества «Лев» (через личные планеты, углы или куспиды домов в этом знаке).', 102, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.sign.leo.present' AND locale = 'ru-RU' AND (topic_category = 'creativity')
);

UPDATE knowledge_items
SET text = 'Тема «Творчество»: заметен акцент знака «Дева». Это добавляет стилю проявления темы качества «Дева» (через личные планеты, углы или куспиды домов в этом знаке).', priority = 102, is_active = 1, meta_json = '{}'
WHERE key = 'natal.sign.virgo.present' AND locale = 'ru-RU' AND (topic_category = 'creativity');

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.sign.virgo.present', 'creativity', 'ru-RU', 'Тема «Творчество»: заметен акцент знака «Дева». Это добавляет стилю проявления темы качества «Дева» (через личные планеты, углы или куспиды домов в этом знаке).', 102, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.sign.virgo.present' AND locale = 'ru-RU' AND (topic_category = 'creativity')
);

UPDATE knowledge_items
SET text = 'Тема «Творчество»: заметен акцент знака «Весы». Это добавляет стилю проявления темы качества «Весы» (через личные планеты, углы или куспиды домов в этом знаке).', priority = 102, is_active = 1, meta_json = '{}'
WHERE key = 'natal.sign.libra.present' AND locale = 'ru-RU' AND (topic_category = 'creativity');

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.sign.libra.present', 'creativity', 'ru-RU', 'Тема «Творчество»: заметен акцент знака «Весы». Это добавляет стилю проявления темы качества «Весы» (через личные планеты, углы или куспиды домов в этом знаке).', 102, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.sign.libra.present' AND locale = 'ru-RU' AND (topic_category = 'creativity')
);

UPDATE knowledge_items
SET text = 'Тема «Творчество»: заметен акцент знака «Скорпион». Это добавляет стилю проявления темы качества «Скорпион» (через личные планеты, углы или куспиды домов в этом знаке).', priority = 102, is_active = 1, meta_json = '{}'
WHERE key = 'natal.sign.scorpio.present' AND locale = 'ru-RU' AND (topic_category = 'creativity');

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.sign.scorpio.present', 'creativity', 'ru-RU', 'Тема «Творчество»: заметен акцент знака «Скорпион». Это добавляет стилю проявления темы качества «Скорпион» (через личные планеты, углы или куспиды домов в этом знаке).', 102, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.sign.scorpio.present' AND locale = 'ru-RU' AND (topic_category = 'creativity')
);

UPDATE knowledge_items
SET text = 'Тема «Творчество»: заметен акцент знака «Стрелец». Это добавляет стилю проявления темы качества «Стрелец» (через личные планеты, углы или куспиды домов в этом знаке).', priority = 102, is_active = 1, meta_json = '{}'
WHERE key = 'natal.sign.sagittarius.present' AND locale = 'ru-RU' AND (topic_category = 'creativity');

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.sign.sagittarius.present', 'creativity', 'ru-RU', 'Тема «Творчество»: заметен акцент знака «Стрелец». Это добавляет стилю проявления темы качества «Стрелец» (через личные планеты, углы или куспиды домов в этом знаке).', 102, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.sign.sagittarius.present' AND locale = 'ru-RU' AND (topic_category = 'creativity')
);

UPDATE knowledge_items
SET text = 'Тема «Творчество»: заметен акцент знака «Козерог». Это добавляет стилю проявления темы качества «Козерог» (через личные планеты, углы или куспиды домов в этом знаке).', priority = 102, is_active = 1, meta_json = '{}'
WHERE key = 'natal.sign.capricorn.present' AND locale = 'ru-RU' AND (topic_category = 'creativity');

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.sign.capricorn.present', 'creativity', 'ru-RU', 'Тема «Творчество»: заметен акцент знака «Козерог». Это добавляет стилю проявления темы качества «Козерог» (через личные планеты, углы или куспиды домов в этом знаке).', 102, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.sign.capricorn.present' AND locale = 'ru-RU' AND (topic_category = 'creativity')
);

UPDATE knowledge_items
SET text = 'Тема «Творчество»: заметен акцент знака «Водолей». Это добавляет стилю проявления темы качества «Водолей» (через личные планеты, углы или куспиды домов в этом знаке).', priority = 102, is_active = 1, meta_json = '{}'
WHERE key = 'natal.sign.aquarius.present' AND locale = 'ru-RU' AND (topic_category = 'creativity');

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.sign.aquarius.present', 'creativity', 'ru-RU', 'Тема «Творчество»: заметен акцент знака «Водолей». Это добавляет стилю проявления темы качества «Водолей» (через личные планеты, углы или куспиды домов в этом знаке).', 102, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.sign.aquarius.present' AND locale = 'ru-RU' AND (topic_category = 'creativity')
);

UPDATE knowledge_items
SET text = 'Тема «Творчество»: заметен акцент знака «Рыбы». Это добавляет стилю проявления темы качества «Рыбы» (через личные планеты, углы или куспиды домов в этом знаке).', priority = 102, is_active = 1, meta_json = '{}'
WHERE key = 'natal.sign.pisces.present' AND locale = 'ru-RU' AND (topic_category = 'creativity');

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.sign.pisces.present', 'creativity', 'ru-RU', 'Тема «Творчество»: заметен акцент знака «Рыбы». Это добавляет стилю проявления темы качества «Рыбы» (через личные планеты, углы или куспиды домов в этом знаке).', 102, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.sign.pisces.present' AND locale = 'ru-RU' AND (topic_category = 'creativity')
);

UPDATE knowledge_items
SET text = 'Тема «Эмоции»: заметен акцент знака «Овен». Это добавляет стилю проявления темы качества «Овен» (через личные планеты, углы или куспиды домов в этом знаке).', priority = 102, is_active = 1, meta_json = '{}'
WHERE key = 'natal.sign.aries.present' AND locale = 'ru-RU' AND (topic_category = 'emotional_world');

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.sign.aries.present', 'emotional_world', 'ru-RU', 'Тема «Эмоции»: заметен акцент знака «Овен». Это добавляет стилю проявления темы качества «Овен» (через личные планеты, углы или куспиды домов в этом знаке).', 102, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.sign.aries.present' AND locale = 'ru-RU' AND (topic_category = 'emotional_world')
);

UPDATE knowledge_items
SET text = 'Тема «Эмоции»: заметен акцент знака «Телец». Это добавляет стилю проявления темы качества «Телец» (через личные планеты, углы или куспиды домов в этом знаке).', priority = 102, is_active = 1, meta_json = '{}'
WHERE key = 'natal.sign.taurus.present' AND locale = 'ru-RU' AND (topic_category = 'emotional_world');

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.sign.taurus.present', 'emotional_world', 'ru-RU', 'Тема «Эмоции»: заметен акцент знака «Телец». Это добавляет стилю проявления темы качества «Телец» (через личные планеты, углы или куспиды домов в этом знаке).', 102, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.sign.taurus.present' AND locale = 'ru-RU' AND (topic_category = 'emotional_world')
);

UPDATE knowledge_items
SET text = 'Тема «Эмоции»: заметен акцент знака «Близнецы». Это добавляет стилю проявления темы качества «Близнецы» (через личные планеты, углы или куспиды домов в этом знаке).', priority = 102, is_active = 1, meta_json = '{}'
WHERE key = 'natal.sign.gemini.present' AND locale = 'ru-RU' AND (topic_category = 'emotional_world');

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.sign.gemini.present', 'emotional_world', 'ru-RU', 'Тема «Эмоции»: заметен акцент знака «Близнецы». Это добавляет стилю проявления темы качества «Близнецы» (через личные планеты, углы или куспиды домов в этом знаке).', 102, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.sign.gemini.present' AND locale = 'ru-RU' AND (topic_category = 'emotional_world')
);

UPDATE knowledge_items
SET text = 'Тема «Эмоции»: заметен акцент знака «Рак». Это добавляет стилю проявления темы качества «Рак» (через личные планеты, углы или куспиды домов в этом знаке).', priority = 102, is_active = 1, meta_json = '{}'
WHERE key = 'natal.sign.cancer.present' AND locale = 'ru-RU' AND (topic_category = 'emotional_world');

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.sign.cancer.present', 'emotional_world', 'ru-RU', 'Тема «Эмоции»: заметен акцент знака «Рак». Это добавляет стилю проявления темы качества «Рак» (через личные планеты, углы или куспиды домов в этом знаке).', 102, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.sign.cancer.present' AND locale = 'ru-RU' AND (topic_category = 'emotional_world')
);

UPDATE knowledge_items
SET text = 'Тема «Эмоции»: заметен акцент знака «Лев». Это добавляет стилю проявления темы качества «Лев» (через личные планеты, углы или куспиды домов в этом знаке).', priority = 102, is_active = 1, meta_json = '{}'
WHERE key = 'natal.sign.leo.present' AND locale = 'ru-RU' AND (topic_category = 'emotional_world');

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.sign.leo.present', 'emotional_world', 'ru-RU', 'Тема «Эмоции»: заметен акцент знака «Лев». Это добавляет стилю проявления темы качества «Лев» (через личные планеты, углы или куспиды домов в этом знаке).', 102, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.sign.leo.present' AND locale = 'ru-RU' AND (topic_category = 'emotional_world')
);

UPDATE knowledge_items
SET text = 'Тема «Эмоции»: заметен акцент знака «Дева». Это добавляет стилю проявления темы качества «Дева» (через личные планеты, углы или куспиды домов в этом знаке).', priority = 102, is_active = 1, meta_json = '{}'
WHERE key = 'natal.sign.virgo.present' AND locale = 'ru-RU' AND (topic_category = 'emotional_world');

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.sign.virgo.present', 'emotional_world', 'ru-RU', 'Тема «Эмоции»: заметен акцент знака «Дева». Это добавляет стилю проявления темы качества «Дева» (через личные планеты, углы или куспиды домов в этом знаке).', 102, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.sign.virgo.present' AND locale = 'ru-RU' AND (topic_category = 'emotional_world')
);

UPDATE knowledge_items
SET text = 'Тема «Эмоции»: заметен акцент знака «Весы». Это добавляет стилю проявления темы качества «Весы» (через личные планеты, углы или куспиды домов в этом знаке).', priority = 102, is_active = 1, meta_json = '{}'
WHERE key = 'natal.sign.libra.present' AND locale = 'ru-RU' AND (topic_category = 'emotional_world');

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.sign.libra.present', 'emotional_world', 'ru-RU', 'Тема «Эмоции»: заметен акцент знака «Весы». Это добавляет стилю проявления темы качества «Весы» (через личные планеты, углы или куспиды домов в этом знаке).', 102, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.sign.libra.present' AND locale = 'ru-RU' AND (topic_category = 'emotional_world')
);

UPDATE knowledge_items
SET text = 'Тема «Эмоции»: заметен акцент знака «Скорпион». Это добавляет стилю проявления темы качества «Скорпион» (через личные планеты, углы или куспиды домов в этом знаке).', priority = 102, is_active = 1, meta_json = '{}'
WHERE key = 'natal.sign.scorpio.present' AND locale = 'ru-RU' AND (topic_category = 'emotional_world');

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.sign.scorpio.present', 'emotional_world', 'ru-RU', 'Тема «Эмоции»: заметен акцент знака «Скорпион». Это добавляет стилю проявления темы качества «Скорпион» (через личные планеты, углы или куспиды домов в этом знаке).', 102, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.sign.scorpio.present' AND locale = 'ru-RU' AND (topic_category = 'emotional_world')
);

UPDATE knowledge_items
SET text = 'Тема «Эмоции»: заметен акцент знака «Стрелец». Это добавляет стилю проявления темы качества «Стрелец» (через личные планеты, углы или куспиды домов в этом знаке).', priority = 102, is_active = 1, meta_json = '{}'
WHERE key = 'natal.sign.sagittarius.present' AND locale = 'ru-RU' AND (topic_category = 'emotional_world');

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.sign.sagittarius.present', 'emotional_world', 'ru-RU', 'Тема «Эмоции»: заметен акцент знака «Стрелец». Это добавляет стилю проявления темы качества «Стрелец» (через личные планеты, углы или куспиды домов в этом знаке).', 102, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.sign.sagittarius.present' AND locale = 'ru-RU' AND (topic_category = 'emotional_world')
);

UPDATE knowledge_items
SET text = 'Тема «Эмоции»: заметен акцент знака «Козерог». Это добавляет стилю проявления темы качества «Козерог» (через личные планеты, углы или куспиды домов в этом знаке).', priority = 102, is_active = 1, meta_json = '{}'
WHERE key = 'natal.sign.capricorn.present' AND locale = 'ru-RU' AND (topic_category = 'emotional_world');

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.sign.capricorn.present', 'emotional_world', 'ru-RU', 'Тема «Эмоции»: заметен акцент знака «Козерог». Это добавляет стилю проявления темы качества «Козерог» (через личные планеты, углы или куспиды домов в этом знаке).', 102, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.sign.capricorn.present' AND locale = 'ru-RU' AND (topic_category = 'emotional_world')
);

UPDATE knowledge_items
SET text = 'Тема «Эмоции»: заметен акцент знака «Водолей». Это добавляет стилю проявления темы качества «Водолей» (через личные планеты, углы или куспиды домов в этом знаке).', priority = 102, is_active = 1, meta_json = '{}'
WHERE key = 'natal.sign.aquarius.present' AND locale = 'ru-RU' AND (topic_category = 'emotional_world');

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.sign.aquarius.present', 'emotional_world', 'ru-RU', 'Тема «Эмоции»: заметен акцент знака «Водолей». Это добавляет стилю проявления темы качества «Водолей» (через личные планеты, углы или куспиды домов в этом знаке).', 102, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.sign.aquarius.present' AND locale = 'ru-RU' AND (topic_category = 'emotional_world')
);

UPDATE knowledge_items
SET text = 'Тема «Эмоции»: заметен акцент знака «Рыбы». Это добавляет стилю проявления темы качества «Рыбы» (через личные планеты, углы или куспиды домов в этом знаке).', priority = 102, is_active = 1, meta_json = '{}'
WHERE key = 'natal.sign.pisces.present' AND locale = 'ru-RU' AND (topic_category = 'emotional_world');

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.sign.pisces.present', 'emotional_world', 'ru-RU', 'Тема «Эмоции»: заметен акцент знака «Рыбы». Это добавляет стилю проявления темы качества «Рыбы» (через личные планеты, углы или куспиды домов в этом знаке).', 102, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.sign.pisces.present' AND locale = 'ru-RU' AND (topic_category = 'emotional_world')
);

UPDATE knowledge_items
SET text = 'Тема «Восприятие»: заметен акцент знака «Овен». Это добавляет стилю проявления темы качества «Овен» (через личные планеты, углы или куспиды домов в этом знаке).', priority = 102, is_active = 1, meta_json = '{}'
WHERE key = 'natal.sign.aries.present' AND locale = 'ru-RU' AND (topic_category = 'how_others_see_me');

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.sign.aries.present', 'how_others_see_me', 'ru-RU', 'Тема «Восприятие»: заметен акцент знака «Овен». Это добавляет стилю проявления темы качества «Овен» (через личные планеты, углы или куспиды домов в этом знаке).', 102, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.sign.aries.present' AND locale = 'ru-RU' AND (topic_category = 'how_others_see_me')
);

UPDATE knowledge_items
SET text = 'Тема «Восприятие»: заметен акцент знака «Телец». Это добавляет стилю проявления темы качества «Телец» (через личные планеты, углы или куспиды домов в этом знаке).', priority = 102, is_active = 1, meta_json = '{}'
WHERE key = 'natal.sign.taurus.present' AND locale = 'ru-RU' AND (topic_category = 'how_others_see_me');

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.sign.taurus.present', 'how_others_see_me', 'ru-RU', 'Тема «Восприятие»: заметен акцент знака «Телец». Это добавляет стилю проявления темы качества «Телец» (через личные планеты, углы или куспиды домов в этом знаке).', 102, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.sign.taurus.present' AND locale = 'ru-RU' AND (topic_category = 'how_others_see_me')
);

UPDATE knowledge_items
SET text = 'Тема «Восприятие»: заметен акцент знака «Близнецы». Это добавляет стилю проявления темы качества «Близнецы» (через личные планеты, углы или куспиды домов в этом знаке).', priority = 102, is_active = 1, meta_json = '{}'
WHERE key = 'natal.sign.gemini.present' AND locale = 'ru-RU' AND (topic_category = 'how_others_see_me');

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.sign.gemini.present', 'how_others_see_me', 'ru-RU', 'Тема «Восприятие»: заметен акцент знака «Близнецы». Это добавляет стилю проявления темы качества «Близнецы» (через личные планеты, углы или куспиды домов в этом знаке).', 102, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.sign.gemini.present' AND locale = 'ru-RU' AND (topic_category = 'how_others_see_me')
);

UPDATE knowledge_items
SET text = 'Тема «Восприятие»: заметен акцент знака «Рак». Это добавляет стилю проявления темы качества «Рак» (через личные планеты, углы или куспиды домов в этом знаке).', priority = 102, is_active = 1, meta_json = '{}'
WHERE key = 'natal.sign.cancer.present' AND locale = 'ru-RU' AND (topic_category = 'how_others_see_me');

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.sign.cancer.present', 'how_others_see_me', 'ru-RU', 'Тема «Восприятие»: заметен акцент знака «Рак». Это добавляет стилю проявления темы качества «Рак» (через личные планеты, углы или куспиды домов в этом знаке).', 102, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.sign.cancer.present' AND locale = 'ru-RU' AND (topic_category = 'how_others_see_me')
);

UPDATE knowledge_items
SET text = 'Тема «Восприятие»: заметен акцент знака «Лев». Это добавляет стилю проявления темы качества «Лев» (через личные планеты, углы или куспиды домов в этом знаке).', priority = 102, is_active = 1, meta_json = '{}'
WHERE key = 'natal.sign.leo.present' AND locale = 'ru-RU' AND (topic_category = 'how_others_see_me');

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.sign.leo.present', 'how_others_see_me', 'ru-RU', 'Тема «Восприятие»: заметен акцент знака «Лев». Это добавляет стилю проявления темы качества «Лев» (через личные планеты, углы или куспиды домов в этом знаке).', 102, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.sign.leo.present' AND locale = 'ru-RU' AND (topic_category = 'how_others_see_me')
);

UPDATE knowledge_items
SET text = 'Тема «Восприятие»: заметен акцент знака «Дева». Это добавляет стилю проявления темы качества «Дева» (через личные планеты, углы или куспиды домов в этом знаке).', priority = 102, is_active = 1, meta_json = '{}'
WHERE key = 'natal.sign.virgo.present' AND locale = 'ru-RU' AND (topic_category = 'how_others_see_me');

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.sign.virgo.present', 'how_others_see_me', 'ru-RU', 'Тема «Восприятие»: заметен акцент знака «Дева». Это добавляет стилю проявления темы качества «Дева» (через личные планеты, углы или куспиды домов в этом знаке).', 102, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.sign.virgo.present' AND locale = 'ru-RU' AND (topic_category = 'how_others_see_me')
);

UPDATE knowledge_items
SET text = 'Тема «Восприятие»: заметен акцент знака «Весы». Это добавляет стилю проявления темы качества «Весы» (через личные планеты, углы или куспиды домов в этом знаке).', priority = 102, is_active = 1, meta_json = '{}'
WHERE key = 'natal.sign.libra.present' AND locale = 'ru-RU' AND (topic_category = 'how_others_see_me');

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.sign.libra.present', 'how_others_see_me', 'ru-RU', 'Тема «Восприятие»: заметен акцент знака «Весы». Это добавляет стилю проявления темы качества «Весы» (через личные планеты, углы или куспиды домов в этом знаке).', 102, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.sign.libra.present' AND locale = 'ru-RU' AND (topic_category = 'how_others_see_me')
);

UPDATE knowledge_items
SET text = 'Тема «Восприятие»: заметен акцент знака «Скорпион». Это добавляет стилю проявления темы качества «Скорпион» (через личные планеты, углы или куспиды домов в этом знаке).', priority = 102, is_active = 1, meta_json = '{}'
WHERE key = 'natal.sign.scorpio.present' AND locale = 'ru-RU' AND (topic_category = 'how_others_see_me');

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.sign.scorpio.present', 'how_others_see_me', 'ru-RU', 'Тема «Восприятие»: заметен акцент знака «Скорпион». Это добавляет стилю проявления темы качества «Скорпион» (через личные планеты, углы или куспиды домов в этом знаке).', 102, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.sign.scorpio.present' AND locale = 'ru-RU' AND (topic_category = 'how_others_see_me')
);

UPDATE knowledge_items
SET text = 'Тема «Восприятие»: заметен акцент знака «Стрелец». Это добавляет стилю проявления темы качества «Стрелец» (через личные планеты, углы или куспиды домов в этом знаке).', priority = 102, is_active = 1, meta_json = '{}'
WHERE key = 'natal.sign.sagittarius.present' AND locale = 'ru-RU' AND (topic_category = 'how_others_see_me');

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.sign.sagittarius.present', 'how_others_see_me', 'ru-RU', 'Тема «Восприятие»: заметен акцент знака «Стрелец». Это добавляет стилю проявления темы качества «Стрелец» (через личные планеты, углы или куспиды домов в этом знаке).', 102, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.sign.sagittarius.present' AND locale = 'ru-RU' AND (topic_category = 'how_others_see_me')
);

UPDATE knowledge_items
SET text = 'Тема «Восприятие»: заметен акцент знака «Козерог». Это добавляет стилю проявления темы качества «Козерог» (через личные планеты, углы или куспиды домов в этом знаке).', priority = 102, is_active = 1, meta_json = '{}'
WHERE key = 'natal.sign.capricorn.present' AND locale = 'ru-RU' AND (topic_category = 'how_others_see_me');

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.sign.capricorn.present', 'how_others_see_me', 'ru-RU', 'Тема «Восприятие»: заметен акцент знака «Козерог». Это добавляет стилю проявления темы качества «Козерог» (через личные планеты, углы или куспиды домов в этом знаке).', 102, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.sign.capricorn.present' AND locale = 'ru-RU' AND (topic_category = 'how_others_see_me')
);

UPDATE knowledge_items
SET text = 'Тема «Восприятие»: заметен акцент знака «Водолей». Это добавляет стилю проявления темы качества «Водолей» (через личные планеты, углы или куспиды домов в этом знаке).', priority = 102, is_active = 1, meta_json = '{}'
WHERE key = 'natal.sign.aquarius.present' AND locale = 'ru-RU' AND (topic_category = 'how_others_see_me');

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.sign.aquarius.present', 'how_others_see_me', 'ru-RU', 'Тема «Восприятие»: заметен акцент знака «Водолей». Это добавляет стилю проявления темы качества «Водолей» (через личные планеты, углы или куспиды домов в этом знаке).', 102, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.sign.aquarius.present' AND locale = 'ru-RU' AND (topic_category = 'how_others_see_me')
);

UPDATE knowledge_items
SET text = 'Тема «Восприятие»: заметен акцент знака «Рыбы». Это добавляет стилю проявления темы качества «Рыбы» (через личные планеты, углы или куспиды домов в этом знаке).', priority = 102, is_active = 1, meta_json = '{}'
WHERE key = 'natal.sign.pisces.present' AND locale = 'ru-RU' AND (topic_category = 'how_others_see_me');

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.sign.pisces.present', 'how_others_see_me', 'ru-RU', 'Тема «Восприятие»: заметен акцент знака «Рыбы». Это добавляет стилю проявления темы качества «Рыбы» (через личные планеты, углы или куспиды домов в этом знаке).', 102, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.sign.pisces.present' AND locale = 'ru-RU' AND (topic_category = 'how_others_see_me')
);

UPDATE knowledge_items
SET text = 'Тема «Карма»: заметен акцент знака «Овен». Это добавляет стилю проявления темы качества «Овен» (через личные планеты, углы или куспиды домов в этом знаке).', priority = 102, is_active = 1, meta_json = '{}'
WHERE key = 'natal.sign.aries.present' AND locale = 'ru-RU' AND (topic_category = 'karmic_tasks');

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.sign.aries.present', 'karmic_tasks', 'ru-RU', 'Тема «Карма»: заметен акцент знака «Овен». Это добавляет стилю проявления темы качества «Овен» (через личные планеты, углы или куспиды домов в этом знаке).', 102, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.sign.aries.present' AND locale = 'ru-RU' AND (topic_category = 'karmic_tasks')
);

UPDATE knowledge_items
SET text = 'Тема «Карма»: заметен акцент знака «Телец». Это добавляет стилю проявления темы качества «Телец» (через личные планеты, углы или куспиды домов в этом знаке).', priority = 102, is_active = 1, meta_json = '{}'
WHERE key = 'natal.sign.taurus.present' AND locale = 'ru-RU' AND (topic_category = 'karmic_tasks');

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.sign.taurus.present', 'karmic_tasks', 'ru-RU', 'Тема «Карма»: заметен акцент знака «Телец». Это добавляет стилю проявления темы качества «Телец» (через личные планеты, углы или куспиды домов в этом знаке).', 102, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.sign.taurus.present' AND locale = 'ru-RU' AND (topic_category = 'karmic_tasks')
);

UPDATE knowledge_items
SET text = 'Тема «Карма»: заметен акцент знака «Близнецы». Это добавляет стилю проявления темы качества «Близнецы» (через личные планеты, углы или куспиды домов в этом знаке).', priority = 102, is_active = 1, meta_json = '{}'
WHERE key = 'natal.sign.gemini.present' AND locale = 'ru-RU' AND (topic_category = 'karmic_tasks');

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.sign.gemini.present', 'karmic_tasks', 'ru-RU', 'Тема «Карма»: заметен акцент знака «Близнецы». Это добавляет стилю проявления темы качества «Близнецы» (через личные планеты, углы или куспиды домов в этом знаке).', 102, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.sign.gemini.present' AND locale = 'ru-RU' AND (topic_category = 'karmic_tasks')
);

UPDATE knowledge_items
SET text = 'Тема «Карма»: заметен акцент знака «Рак». Это добавляет стилю проявления темы качества «Рак» (через личные планеты, углы или куспиды домов в этом знаке).', priority = 102, is_active = 1, meta_json = '{}'
WHERE key = 'natal.sign.cancer.present' AND locale = 'ru-RU' AND (topic_category = 'karmic_tasks');

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.sign.cancer.present', 'karmic_tasks', 'ru-RU', 'Тема «Карма»: заметен акцент знака «Рак». Это добавляет стилю проявления темы качества «Рак» (через личные планеты, углы или куспиды домов в этом знаке).', 102, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.sign.cancer.present' AND locale = 'ru-RU' AND (topic_category = 'karmic_tasks')
);

UPDATE knowledge_items
SET text = 'Тема «Карма»: заметен акцент знака «Лев». Это добавляет стилю проявления темы качества «Лев» (через личные планеты, углы или куспиды домов в этом знаке).', priority = 102, is_active = 1, meta_json = '{}'
WHERE key = 'natal.sign.leo.present' AND locale = 'ru-RU' AND (topic_category = 'karmic_tasks');

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.sign.leo.present', 'karmic_tasks', 'ru-RU', 'Тема «Карма»: заметен акцент знака «Лев». Это добавляет стилю проявления темы качества «Лев» (через личные планеты, углы или куспиды домов в этом знаке).', 102, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.sign.leo.present' AND locale = 'ru-RU' AND (topic_category = 'karmic_tasks')
);

UPDATE knowledge_items
SET text = 'Тема «Карма»: заметен акцент знака «Дева». Это добавляет стилю проявления темы качества «Дева» (через личные планеты, углы или куспиды домов в этом знаке).', priority = 102, is_active = 1, meta_json = '{}'
WHERE key = 'natal.sign.virgo.present' AND locale = 'ru-RU' AND (topic_category = 'karmic_tasks');

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.sign.virgo.present', 'karmic_tasks', 'ru-RU', 'Тема «Карма»: заметен акцент знака «Дева». Это добавляет стилю проявления темы качества «Дева» (через личные планеты, углы или куспиды домов в этом знаке).', 102, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.sign.virgo.present' AND locale = 'ru-RU' AND (topic_category = 'karmic_tasks')
);

UPDATE knowledge_items
SET text = 'Тема «Карма»: заметен акцент знака «Весы». Это добавляет стилю проявления темы качества «Весы» (через личные планеты, углы или куспиды домов в этом знаке).', priority = 102, is_active = 1, meta_json = '{}'
WHERE key = 'natal.sign.libra.present' AND locale = 'ru-RU' AND (topic_category = 'karmic_tasks');

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.sign.libra.present', 'karmic_tasks', 'ru-RU', 'Тема «Карма»: заметен акцент знака «Весы». Это добавляет стилю проявления темы качества «Весы» (через личные планеты, углы или куспиды домов в этом знаке).', 102, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.sign.libra.present' AND locale = 'ru-RU' AND (topic_category = 'karmic_tasks')
);

UPDATE knowledge_items
SET text = 'Тема «Карма»: заметен акцент знака «Скорпион». Это добавляет стилю проявления темы качества «Скорпион» (через личные планеты, углы или куспиды домов в этом знаке).', priority = 102, is_active = 1, meta_json = '{}'
WHERE key = 'natal.sign.scorpio.present' AND locale = 'ru-RU' AND (topic_category = 'karmic_tasks');

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.sign.scorpio.present', 'karmic_tasks', 'ru-RU', 'Тема «Карма»: заметен акцент знака «Скорпион». Это добавляет стилю проявления темы качества «Скорпион» (через личные планеты, углы или куспиды домов в этом знаке).', 102, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.sign.scorpio.present' AND locale = 'ru-RU' AND (topic_category = 'karmic_tasks')
);

UPDATE knowledge_items
SET text = 'Тема «Карма»: заметен акцент знака «Стрелец». Это добавляет стилю проявления темы качества «Стрелец» (через личные планеты, углы или куспиды домов в этом знаке).', priority = 102, is_active = 1, meta_json = '{}'
WHERE key = 'natal.sign.sagittarius.present' AND locale = 'ru-RU' AND (topic_category = 'karmic_tasks');

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.sign.sagittarius.present', 'karmic_tasks', 'ru-RU', 'Тема «Карма»: заметен акцент знака «Стрелец». Это добавляет стилю проявления темы качества «Стрелец» (через личные планеты, углы или куспиды домов в этом знаке).', 102, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.sign.sagittarius.present' AND locale = 'ru-RU' AND (topic_category = 'karmic_tasks')
);

UPDATE knowledge_items
SET text = 'Тема «Карма»: заметен акцент знака «Козерог». Это добавляет стилю проявления темы качества «Козерог» (через личные планеты, углы или куспиды домов в этом знаке).', priority = 102, is_active = 1, meta_json = '{}'
WHERE key = 'natal.sign.capricorn.present' AND locale = 'ru-RU' AND (topic_category = 'karmic_tasks');

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.sign.capricorn.present', 'karmic_tasks', 'ru-RU', 'Тема «Карма»: заметен акцент знака «Козерог». Это добавляет стилю проявления темы качества «Козерог» (через личные планеты, углы или куспиды домов в этом знаке).', 102, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.sign.capricorn.present' AND locale = 'ru-RU' AND (topic_category = 'karmic_tasks')
);

UPDATE knowledge_items
SET text = 'Тема «Карма»: заметен акцент знака «Водолей». Это добавляет стилю проявления темы качества «Водолей» (через личные планеты, углы или куспиды домов в этом знаке).', priority = 102, is_active = 1, meta_json = '{}'
WHERE key = 'natal.sign.aquarius.present' AND locale = 'ru-RU' AND (topic_category = 'karmic_tasks');

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.sign.aquarius.present', 'karmic_tasks', 'ru-RU', 'Тема «Карма»: заметен акцент знака «Водолей». Это добавляет стилю проявления темы качества «Водолей» (через личные планеты, углы или куспиды домов в этом знаке).', 102, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.sign.aquarius.present' AND locale = 'ru-RU' AND (topic_category = 'karmic_tasks')
);

UPDATE knowledge_items
SET text = 'Тема «Карма»: заметен акцент знака «Рыбы». Это добавляет стилю проявления темы качества «Рыбы» (через личные планеты, углы или куспиды домов в этом знаке).', priority = 102, is_active = 1, meta_json = '{}'
WHERE key = 'natal.sign.pisces.present' AND locale = 'ru-RU' AND (topic_category = 'karmic_tasks');

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.sign.pisces.present', 'karmic_tasks', 'ru-RU', 'Тема «Карма»: заметен акцент знака «Рыбы». Это добавляет стилю проявления темы качества «Рыбы» (через личные планеты, углы или куспиды домов в этом знаке).', 102, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.sign.pisces.present' AND locale = 'ru-RU' AND (topic_category = 'karmic_tasks')
);

UPDATE knowledge_items
SET text = 'Тема «Любовь»: заметен акцент знака «Овен». Это добавляет стилю проявления темы качества «Овен» (через личные планеты, углы или куспиды домов в этом знаке).', priority = 102, is_active = 1, meta_json = '{}'
WHERE key = 'natal.sign.aries.present' AND locale = 'ru-RU' AND (topic_category = 'love_intimacy');

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.sign.aries.present', 'love_intimacy', 'ru-RU', 'Тема «Любовь»: заметен акцент знака «Овен». Это добавляет стилю проявления темы качества «Овен» (через личные планеты, углы или куспиды домов в этом знаке).', 102, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.sign.aries.present' AND locale = 'ru-RU' AND (topic_category = 'love_intimacy')
);

UPDATE knowledge_items
SET text = 'Тема «Любовь»: заметен акцент знака «Телец». Это добавляет стилю проявления темы качества «Телец» (через личные планеты, углы или куспиды домов в этом знаке).', priority = 102, is_active = 1, meta_json = '{}'
WHERE key = 'natal.sign.taurus.present' AND locale = 'ru-RU' AND (topic_category = 'love_intimacy');

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.sign.taurus.present', 'love_intimacy', 'ru-RU', 'Тема «Любовь»: заметен акцент знака «Телец». Это добавляет стилю проявления темы качества «Телец» (через личные планеты, углы или куспиды домов в этом знаке).', 102, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.sign.taurus.present' AND locale = 'ru-RU' AND (topic_category = 'love_intimacy')
);

UPDATE knowledge_items
SET text = 'Тема «Любовь»: заметен акцент знака «Близнецы». Это добавляет стилю проявления темы качества «Близнецы» (через личные планеты, углы или куспиды домов в этом знаке).', priority = 102, is_active = 1, meta_json = '{}'
WHERE key = 'natal.sign.gemini.present' AND locale = 'ru-RU' AND (topic_category = 'love_intimacy');

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.sign.gemini.present', 'love_intimacy', 'ru-RU', 'Тема «Любовь»: заметен акцент знака «Близнецы». Это добавляет стилю проявления темы качества «Близнецы» (через личные планеты, углы или куспиды домов в этом знаке).', 102, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.sign.gemini.present' AND locale = 'ru-RU' AND (topic_category = 'love_intimacy')
);

UPDATE knowledge_items
SET text = 'Тема «Любовь»: заметен акцент знака «Рак». Это добавляет стилю проявления темы качества «Рак» (через личные планеты, углы или куспиды домов в этом знаке).', priority = 102, is_active = 1, meta_json = '{}'
WHERE key = 'natal.sign.cancer.present' AND locale = 'ru-RU' AND (topic_category = 'love_intimacy');

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.sign.cancer.present', 'love_intimacy', 'ru-RU', 'Тема «Любовь»: заметен акцент знака «Рак». Это добавляет стилю проявления темы качества «Рак» (через личные планеты, углы или куспиды домов в этом знаке).', 102, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.sign.cancer.present' AND locale = 'ru-RU' AND (topic_category = 'love_intimacy')
);

UPDATE knowledge_items
SET text = 'Тема «Любовь»: заметен акцент знака «Лев». Это добавляет стилю проявления темы качества «Лев» (через личные планеты, углы или куспиды домов в этом знаке).', priority = 102, is_active = 1, meta_json = '{}'
WHERE key = 'natal.sign.leo.present' AND locale = 'ru-RU' AND (topic_category = 'love_intimacy');

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.sign.leo.present', 'love_intimacy', 'ru-RU', 'Тема «Любовь»: заметен акцент знака «Лев». Это добавляет стилю проявления темы качества «Лев» (через личные планеты, углы или куспиды домов в этом знаке).', 102, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.sign.leo.present' AND locale = 'ru-RU' AND (topic_category = 'love_intimacy')
);

UPDATE knowledge_items
SET text = 'Тема «Любовь»: заметен акцент знака «Дева». Это добавляет стилю проявления темы качества «Дева» (через личные планеты, углы или куспиды домов в этом знаке).', priority = 102, is_active = 1, meta_json = '{}'
WHERE key = 'natal.sign.virgo.present' AND locale = 'ru-RU' AND (topic_category = 'love_intimacy');

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.sign.virgo.present', 'love_intimacy', 'ru-RU', 'Тема «Любовь»: заметен акцент знака «Дева». Это добавляет стилю проявления темы качества «Дева» (через личные планеты, углы или куспиды домов в этом знаке).', 102, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.sign.virgo.present' AND locale = 'ru-RU' AND (topic_category = 'love_intimacy')
);

UPDATE knowledge_items
SET text = 'Тема «Любовь»: заметен акцент знака «Весы». Это добавляет стилю проявления темы качества «Весы» (через личные планеты, углы или куспиды домов в этом знаке).', priority = 102, is_active = 1, meta_json = '{}'
WHERE key = 'natal.sign.libra.present' AND locale = 'ru-RU' AND (topic_category = 'love_intimacy');

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.sign.libra.present', 'love_intimacy', 'ru-RU', 'Тема «Любовь»: заметен акцент знака «Весы». Это добавляет стилю проявления темы качества «Весы» (через личные планеты, углы или куспиды домов в этом знаке).', 102, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.sign.libra.present' AND locale = 'ru-RU' AND (topic_category = 'love_intimacy')
);

UPDATE knowledge_items
SET text = 'Тема «Любовь»: заметен акцент знака «Скорпион». Это добавляет стилю проявления темы качества «Скорпион» (через личные планеты, углы или куспиды домов в этом знаке).', priority = 102, is_active = 1, meta_json = '{}'
WHERE key = 'natal.sign.scorpio.present' AND locale = 'ru-RU' AND (topic_category = 'love_intimacy');

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.sign.scorpio.present', 'love_intimacy', 'ru-RU', 'Тема «Любовь»: заметен акцент знака «Скорпион». Это добавляет стилю проявления темы качества «Скорпион» (через личные планеты, углы или куспиды домов в этом знаке).', 102, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.sign.scorpio.present' AND locale = 'ru-RU' AND (topic_category = 'love_intimacy')
);

UPDATE knowledge_items
SET text = 'Тема «Любовь»: заметен акцент знака «Стрелец». Это добавляет стилю проявления темы качества «Стрелец» (через личные планеты, углы или куспиды домов в этом знаке).', priority = 102, is_active = 1, meta_json = '{}'
WHERE key = 'natal.sign.sagittarius.present' AND locale = 'ru-RU' AND (topic_category = 'love_intimacy');

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.sign.sagittarius.present', 'love_intimacy', 'ru-RU', 'Тема «Любовь»: заметен акцент знака «Стрелец». Это добавляет стилю проявления темы качества «Стрелец» (через личные планеты, углы или куспиды домов в этом знаке).', 102, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.sign.sagittarius.present' AND locale = 'ru-RU' AND (topic_category = 'love_intimacy')
);

UPDATE knowledge_items
SET text = 'Тема «Любовь»: заметен акцент знака «Козерог». Это добавляет стилю проявления темы качества «Козерог» (через личные планеты, углы или куспиды домов в этом знаке).', priority = 102, is_active = 1, meta_json = '{}'
WHERE key = 'natal.sign.capricorn.present' AND locale = 'ru-RU' AND (topic_category = 'love_intimacy');

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.sign.capricorn.present', 'love_intimacy', 'ru-RU', 'Тема «Любовь»: заметен акцент знака «Козерог». Это добавляет стилю проявления темы качества «Козерог» (через личные планеты, углы или куспиды домов в этом знаке).', 102, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.sign.capricorn.present' AND locale = 'ru-RU' AND (topic_category = 'love_intimacy')
);

UPDATE knowledge_items
SET text = 'Тема «Любовь»: заметен акцент знака «Водолей». Это добавляет стилю проявления темы качества «Водолей» (через личные планеты, углы или куспиды домов в этом знаке).', priority = 102, is_active = 1, meta_json = '{}'
WHERE key = 'natal.sign.aquarius.present' AND locale = 'ru-RU' AND (topic_category = 'love_intimacy');

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.sign.aquarius.present', 'love_intimacy', 'ru-RU', 'Тема «Любовь»: заметен акцент знака «Водолей». Это добавляет стилю проявления темы качества «Водолей» (через личные планеты, углы или куспиды домов в этом знаке).', 102, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.sign.aquarius.present' AND locale = 'ru-RU' AND (topic_category = 'love_intimacy')
);

UPDATE knowledge_items
SET text = 'Тема «Любовь»: заметен акцент знака «Рыбы». Это добавляет стилю проявления темы качества «Рыбы» (через личные планеты, углы или куспиды домов в этом знаке).', priority = 102, is_active = 1, meta_json = '{}'
WHERE key = 'natal.sign.pisces.present' AND locale = 'ru-RU' AND (topic_category = 'love_intimacy');

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.sign.pisces.present', 'love_intimacy', 'ru-RU', 'Тема «Любовь»: заметен акцент знака «Рыбы». Это добавляет стилю проявления темы качества «Рыбы» (через личные планеты, углы или куспиды домов в этом знаке).', 102, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.sign.pisces.present' AND locale = 'ru-RU' AND (topic_category = 'love_intimacy')
);

UPDATE knowledge_items
SET text = 'Тема «Деньги»: заметен акцент знака «Овен». Это добавляет стилю проявления темы качества «Овен» (через личные планеты, углы или куспиды домов в этом знаке).', priority = 102, is_active = 1, meta_json = '{}'
WHERE key = 'natal.sign.aries.present' AND locale = 'ru-RU' AND (topic_category = 'money');

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.sign.aries.present', 'money', 'ru-RU', 'Тема «Деньги»: заметен акцент знака «Овен». Это добавляет стилю проявления темы качества «Овен» (через личные планеты, углы или куспиды домов в этом знаке).', 102, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.sign.aries.present' AND locale = 'ru-RU' AND (topic_category = 'money')
);

UPDATE knowledge_items
SET text = 'Тема «Деньги»: заметен акцент знака «Телец». Это добавляет стилю проявления темы качества «Телец» (через личные планеты, углы или куспиды домов в этом знаке).', priority = 102, is_active = 1, meta_json = '{}'
WHERE key = 'natal.sign.taurus.present' AND locale = 'ru-RU' AND (topic_category = 'money');

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.sign.taurus.present', 'money', 'ru-RU', 'Тема «Деньги»: заметен акцент знака «Телец». Это добавляет стилю проявления темы качества «Телец» (через личные планеты, углы или куспиды домов в этом знаке).', 102, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.sign.taurus.present' AND locale = 'ru-RU' AND (topic_category = 'money')
);

UPDATE knowledge_items
SET text = 'Тема «Деньги»: заметен акцент знака «Близнецы». Это добавляет стилю проявления темы качества «Близнецы» (через личные планеты, углы или куспиды домов в этом знаке).', priority = 102, is_active = 1, meta_json = '{}'
WHERE key = 'natal.sign.gemini.present' AND locale = 'ru-RU' AND (topic_category = 'money');

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.sign.gemini.present', 'money', 'ru-RU', 'Тема «Деньги»: заметен акцент знака «Близнецы». Это добавляет стилю проявления темы качества «Близнецы» (через личные планеты, углы или куспиды домов в этом знаке).', 102, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.sign.gemini.present' AND locale = 'ru-RU' AND (topic_category = 'money')
);

UPDATE knowledge_items
SET text = 'Тема «Деньги»: заметен акцент знака «Рак». Это добавляет стилю проявления темы качества «Рак» (через личные планеты, углы или куспиды домов в этом знаке).', priority = 102, is_active = 1, meta_json = '{}'
WHERE key = 'natal.sign.cancer.present' AND locale = 'ru-RU' AND (topic_category = 'money');

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.sign.cancer.present', 'money', 'ru-RU', 'Тема «Деньги»: заметен акцент знака «Рак». Это добавляет стилю проявления темы качества «Рак» (через личные планеты, углы или куспиды домов в этом знаке).', 102, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.sign.cancer.present' AND locale = 'ru-RU' AND (topic_category = 'money')
);

UPDATE knowledge_items
SET text = 'Тема «Деньги»: заметен акцент знака «Лев». Это добавляет стилю проявления темы качества «Лев» (через личные планеты, углы или куспиды домов в этом знаке).', priority = 102, is_active = 1, meta_json = '{}'
WHERE key = 'natal.sign.leo.present' AND locale = 'ru-RU' AND (topic_category = 'money');

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.sign.leo.present', 'money', 'ru-RU', 'Тема «Деньги»: заметен акцент знака «Лев». Это добавляет стилю проявления темы качества «Лев» (через личные планеты, углы или куспиды домов в этом знаке).', 102, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.sign.leo.present' AND locale = 'ru-RU' AND (topic_category = 'money')
);

UPDATE knowledge_items
SET text = 'Тема «Деньги»: заметен акцент знака «Дева». Это добавляет стилю проявления темы качества «Дева» (через личные планеты, углы или куспиды домов в этом знаке).', priority = 102, is_active = 1, meta_json = '{}'
WHERE key = 'natal.sign.virgo.present' AND locale = 'ru-RU' AND (topic_category = 'money');

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.sign.virgo.present', 'money', 'ru-RU', 'Тема «Деньги»: заметен акцент знака «Дева». Это добавляет стилю проявления темы качества «Дева» (через личные планеты, углы или куспиды домов в этом знаке).', 102, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.sign.virgo.present' AND locale = 'ru-RU' AND (topic_category = 'money')
);

UPDATE knowledge_items
SET text = 'Тема «Деньги»: заметен акцент знака «Весы». Это добавляет стилю проявления темы качества «Весы» (через личные планеты, углы или куспиды домов в этом знаке).', priority = 102, is_active = 1, meta_json = '{}'
WHERE key = 'natal.sign.libra.present' AND locale = 'ru-RU' AND (topic_category = 'money');

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.sign.libra.present', 'money', 'ru-RU', 'Тема «Деньги»: заметен акцент знака «Весы». Это добавляет стилю проявления темы качества «Весы» (через личные планеты, углы или куспиды домов в этом знаке).', 102, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.sign.libra.present' AND locale = 'ru-RU' AND (topic_category = 'money')
);

UPDATE knowledge_items
SET text = 'Тема «Деньги»: заметен акцент знака «Скорпион». Это добавляет стилю проявления темы качества «Скорпион» (через личные планеты, углы или куспиды домов в этом знаке).', priority = 102, is_active = 1, meta_json = '{}'
WHERE key = 'natal.sign.scorpio.present' AND locale = 'ru-RU' AND (topic_category = 'money');

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.sign.scorpio.present', 'money', 'ru-RU', 'Тема «Деньги»: заметен акцент знака «Скорпион». Это добавляет стилю проявления темы качества «Скорпион» (через личные планеты, углы или куспиды домов в этом знаке).', 102, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.sign.scorpio.present' AND locale = 'ru-RU' AND (topic_category = 'money')
);

UPDATE knowledge_items
SET text = 'Тема «Деньги»: заметен акцент знака «Стрелец». Это добавляет стилю проявления темы качества «Стрелец» (через личные планеты, углы или куспиды домов в этом знаке).', priority = 102, is_active = 1, meta_json = '{}'
WHERE key = 'natal.sign.sagittarius.present' AND locale = 'ru-RU' AND (topic_category = 'money');

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.sign.sagittarius.present', 'money', 'ru-RU', 'Тема «Деньги»: заметен акцент знака «Стрелец». Это добавляет стилю проявления темы качества «Стрелец» (через личные планеты, углы или куспиды домов в этом знаке).', 102, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.sign.sagittarius.present' AND locale = 'ru-RU' AND (topic_category = 'money')
);

UPDATE knowledge_items
SET text = 'Тема «Деньги»: заметен акцент знака «Козерог». Это добавляет стилю проявления темы качества «Козерог» (через личные планеты, углы или куспиды домов в этом знаке).', priority = 102, is_active = 1, meta_json = '{}'
WHERE key = 'natal.sign.capricorn.present' AND locale = 'ru-RU' AND (topic_category = 'money');

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.sign.capricorn.present', 'money', 'ru-RU', 'Тема «Деньги»: заметен акцент знака «Козерог». Это добавляет стилю проявления темы качества «Козерог» (через личные планеты, углы или куспиды домов в этом знаке).', 102, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.sign.capricorn.present' AND locale = 'ru-RU' AND (topic_category = 'money')
);

UPDATE knowledge_items
SET text = 'Тема «Деньги»: заметен акцент знака «Водолей». Это добавляет стилю проявления темы качества «Водолей» (через личные планеты, углы или куспиды домов в этом знаке).', priority = 102, is_active = 1, meta_json = '{}'
WHERE key = 'natal.sign.aquarius.present' AND locale = 'ru-RU' AND (topic_category = 'money');

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.sign.aquarius.present', 'money', 'ru-RU', 'Тема «Деньги»: заметен акцент знака «Водолей». Это добавляет стилю проявления темы качества «Водолей» (через личные планеты, углы или куспиды домов в этом знаке).', 102, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.sign.aquarius.present' AND locale = 'ru-RU' AND (topic_category = 'money')
);

UPDATE knowledge_items
SET text = 'Тема «Деньги»: заметен акцент знака «Рыбы». Это добавляет стилю проявления темы качества «Рыбы» (через личные планеты, углы или куспиды домов в этом знаке).', priority = 102, is_active = 1, meta_json = '{}'
WHERE key = 'natal.sign.pisces.present' AND locale = 'ru-RU' AND (topic_category = 'money');

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.sign.pisces.present', 'money', 'ru-RU', 'Тема «Деньги»: заметен акцент знака «Рыбы». Это добавляет стилю проявления темы качества «Рыбы» (через личные планеты, углы или куспиды домов в этом знаке).', 102, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.sign.pisces.present' AND locale = 'ru-RU' AND (topic_category = 'money')
);

UPDATE knowledge_items
SET text = 'Тема «Партнерство»: заметен акцент знака «Овен». Это добавляет стилю проявления темы качества «Овен» (через личные планеты, углы или куспиды домов в этом знаке).', priority = 102, is_active = 1, meta_json = '{}'
WHERE key = 'natal.sign.aries.present' AND locale = 'ru-RU' AND (topic_category = 'partnership_marriage');

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.sign.aries.present', 'partnership_marriage', 'ru-RU', 'Тема «Партнерство»: заметен акцент знака «Овен». Это добавляет стилю проявления темы качества «Овен» (через личные планеты, углы или куспиды домов в этом знаке).', 102, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.sign.aries.present' AND locale = 'ru-RU' AND (topic_category = 'partnership_marriage')
);

UPDATE knowledge_items
SET text = 'Тема «Партнерство»: заметен акцент знака «Телец». Это добавляет стилю проявления темы качества «Телец» (через личные планеты, углы или куспиды домов в этом знаке).', priority = 102, is_active = 1, meta_json = '{}'
WHERE key = 'natal.sign.taurus.present' AND locale = 'ru-RU' AND (topic_category = 'partnership_marriage');

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.sign.taurus.present', 'partnership_marriage', 'ru-RU', 'Тема «Партнерство»: заметен акцент знака «Телец». Это добавляет стилю проявления темы качества «Телец» (через личные планеты, углы или куспиды домов в этом знаке).', 102, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.sign.taurus.present' AND locale = 'ru-RU' AND (topic_category = 'partnership_marriage')
);

UPDATE knowledge_items
SET text = 'Тема «Партнерство»: заметен акцент знака «Близнецы». Это добавляет стилю проявления темы качества «Близнецы» (через личные планеты, углы или куспиды домов в этом знаке).', priority = 102, is_active = 1, meta_json = '{}'
WHERE key = 'natal.sign.gemini.present' AND locale = 'ru-RU' AND (topic_category = 'partnership_marriage');

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.sign.gemini.present', 'partnership_marriage', 'ru-RU', 'Тема «Партнерство»: заметен акцент знака «Близнецы». Это добавляет стилю проявления темы качества «Близнецы» (через личные планеты, углы или куспиды домов в этом знаке).', 102, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.sign.gemini.present' AND locale = 'ru-RU' AND (topic_category = 'partnership_marriage')
);

UPDATE knowledge_items
SET text = 'Тема «Партнерство»: заметен акцент знака «Рак». Это добавляет стилю проявления темы качества «Рак» (через личные планеты, углы или куспиды домов в этом знаке).', priority = 102, is_active = 1, meta_json = '{}'
WHERE key = 'natal.sign.cancer.present' AND locale = 'ru-RU' AND (topic_category = 'partnership_marriage');

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.sign.cancer.present', 'partnership_marriage', 'ru-RU', 'Тема «Партнерство»: заметен акцент знака «Рак». Это добавляет стилю проявления темы качества «Рак» (через личные планеты, углы или куспиды домов в этом знаке).', 102, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.sign.cancer.present' AND locale = 'ru-RU' AND (topic_category = 'partnership_marriage')
);

UPDATE knowledge_items
SET text = 'Тема «Партнерство»: заметен акцент знака «Лев». Это добавляет стилю проявления темы качества «Лев» (через личные планеты, углы или куспиды домов в этом знаке).', priority = 102, is_active = 1, meta_json = '{}'
WHERE key = 'natal.sign.leo.present' AND locale = 'ru-RU' AND (topic_category = 'partnership_marriage');

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.sign.leo.present', 'partnership_marriage', 'ru-RU', 'Тема «Партнерство»: заметен акцент знака «Лев». Это добавляет стилю проявления темы качества «Лев» (через личные планеты, углы или куспиды домов в этом знаке).', 102, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.sign.leo.present' AND locale = 'ru-RU' AND (topic_category = 'partnership_marriage')
);

UPDATE knowledge_items
SET text = 'Тема «Партнерство»: заметен акцент знака «Дева». Это добавляет стилю проявления темы качества «Дева» (через личные планеты, углы или куспиды домов в этом знаке).', priority = 102, is_active = 1, meta_json = '{}'
WHERE key = 'natal.sign.virgo.present' AND locale = 'ru-RU' AND (topic_category = 'partnership_marriage');

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.sign.virgo.present', 'partnership_marriage', 'ru-RU', 'Тема «Партнерство»: заметен акцент знака «Дева». Это добавляет стилю проявления темы качества «Дева» (через личные планеты, углы или куспиды домов в этом знаке).', 102, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.sign.virgo.present' AND locale = 'ru-RU' AND (topic_category = 'partnership_marriage')
);

UPDATE knowledge_items
SET text = 'Тема «Партнерство»: заметен акцент знака «Весы». Это добавляет стилю проявления темы качества «Весы» (через личные планеты, углы или куспиды домов в этом знаке).', priority = 102, is_active = 1, meta_json = '{}'
WHERE key = 'natal.sign.libra.present' AND locale = 'ru-RU' AND (topic_category = 'partnership_marriage');

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.sign.libra.present', 'partnership_marriage', 'ru-RU', 'Тема «Партнерство»: заметен акцент знака «Весы». Это добавляет стилю проявления темы качества «Весы» (через личные планеты, углы или куспиды домов в этом знаке).', 102, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.sign.libra.present' AND locale = 'ru-RU' AND (topic_category = 'partnership_marriage')
);

UPDATE knowledge_items
SET text = 'Тема «Партнерство»: заметен акцент знака «Скорпион». Это добавляет стилю проявления темы качества «Скорпион» (через личные планеты, углы или куспиды домов в этом знаке).', priority = 102, is_active = 1, meta_json = '{}'
WHERE key = 'natal.sign.scorpio.present' AND locale = 'ru-RU' AND (topic_category = 'partnership_marriage');

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.sign.scorpio.present', 'partnership_marriage', 'ru-RU', 'Тема «Партнерство»: заметен акцент знака «Скорпион». Это добавляет стилю проявления темы качества «Скорпион» (через личные планеты, углы или куспиды домов в этом знаке).', 102, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.sign.scorpio.present' AND locale = 'ru-RU' AND (topic_category = 'partnership_marriage')
);

UPDATE knowledge_items
SET text = 'Тема «Партнерство»: заметен акцент знака «Стрелец». Это добавляет стилю проявления темы качества «Стрелец» (через личные планеты, углы или куспиды домов в этом знаке).', priority = 102, is_active = 1, meta_json = '{}'
WHERE key = 'natal.sign.sagittarius.present' AND locale = 'ru-RU' AND (topic_category = 'partnership_marriage');

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.sign.sagittarius.present', 'partnership_marriage', 'ru-RU', 'Тема «Партнерство»: заметен акцент знака «Стрелец». Это добавляет стилю проявления темы качества «Стрелец» (через личные планеты, углы или куспиды домов в этом знаке).', 102, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.sign.sagittarius.present' AND locale = 'ru-RU' AND (topic_category = 'partnership_marriage')
);

UPDATE knowledge_items
SET text = 'Тема «Партнерство»: заметен акцент знака «Козерог». Это добавляет стилю проявления темы качества «Козерог» (через личные планеты, углы или куспиды домов в этом знаке).', priority = 102, is_active = 1, meta_json = '{}'
WHERE key = 'natal.sign.capricorn.present' AND locale = 'ru-RU' AND (topic_category = 'partnership_marriage');

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.sign.capricorn.present', 'partnership_marriage', 'ru-RU', 'Тема «Партнерство»: заметен акцент знака «Козерог». Это добавляет стилю проявления темы качества «Козерог» (через личные планеты, углы или куспиды домов в этом знаке).', 102, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.sign.capricorn.present' AND locale = 'ru-RU' AND (topic_category = 'partnership_marriage')
);

UPDATE knowledge_items
SET text = 'Тема «Партнерство»: заметен акцент знака «Водолей». Это добавляет стилю проявления темы качества «Водолей» (через личные планеты, углы или куспиды домов в этом знаке).', priority = 102, is_active = 1, meta_json = '{}'
WHERE key = 'natal.sign.aquarius.present' AND locale = 'ru-RU' AND (topic_category = 'partnership_marriage');

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.sign.aquarius.present', 'partnership_marriage', 'ru-RU', 'Тема «Партнерство»: заметен акцент знака «Водолей». Это добавляет стилю проявления темы качества «Водолей» (через личные планеты, углы или куспиды домов в этом знаке).', 102, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.sign.aquarius.present' AND locale = 'ru-RU' AND (topic_category = 'partnership_marriage')
);

UPDATE knowledge_items
SET text = 'Тема «Партнерство»: заметен акцент знака «Рыбы». Это добавляет стилю проявления темы качества «Рыбы» (через личные планеты, углы или куспиды домов в этом знаке).', priority = 102, is_active = 1, meta_json = '{}'
WHERE key = 'natal.sign.pisces.present' AND locale = 'ru-RU' AND (topic_category = 'partnership_marriage');

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.sign.pisces.present', 'partnership_marriage', 'ru-RU', 'Тема «Партнерство»: заметен акцент знака «Рыбы». Это добавляет стилю проявления темы качества «Рыбы» (через личные планеты, углы или куспиды домов в этом знаке).', 102, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.sign.pisces.present' AND locale = 'ru-RU' AND (topic_category = 'partnership_marriage')
);

UPDATE knowledge_items
SET text = 'Тема «Прошлые жизни»: заметен акцент знака «Овен». Это добавляет стилю проявления темы качества «Овен» (через личные планеты, углы или куспиды домов в этом знаке).', priority = 102, is_active = 1, meta_json = '{}'
WHERE key = 'natal.sign.aries.present' AND locale = 'ru-RU' AND (topic_category = 'past_lives_symbolic');

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.sign.aries.present', 'past_lives_symbolic', 'ru-RU', 'Тема «Прошлые жизни»: заметен акцент знака «Овен». Это добавляет стилю проявления темы качества «Овен» (через личные планеты, углы или куспиды домов в этом знаке).', 102, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.sign.aries.present' AND locale = 'ru-RU' AND (topic_category = 'past_lives_symbolic')
);

UPDATE knowledge_items
SET text = 'Тема «Прошлые жизни»: заметен акцент знака «Телец». Это добавляет стилю проявления темы качества «Телец» (через личные планеты, углы или куспиды домов в этом знаке).', priority = 102, is_active = 1, meta_json = '{}'
WHERE key = 'natal.sign.taurus.present' AND locale = 'ru-RU' AND (topic_category = 'past_lives_symbolic');

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.sign.taurus.present', 'past_lives_symbolic', 'ru-RU', 'Тема «Прошлые жизни»: заметен акцент знака «Телец». Это добавляет стилю проявления темы качества «Телец» (через личные планеты, углы или куспиды домов в этом знаке).', 102, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.sign.taurus.present' AND locale = 'ru-RU' AND (topic_category = 'past_lives_symbolic')
);

UPDATE knowledge_items
SET text = 'Тема «Прошлые жизни»: заметен акцент знака «Близнецы». Это добавляет стилю проявления темы качества «Близнецы» (через личные планеты, углы или куспиды домов в этом знаке).', priority = 102, is_active = 1, meta_json = '{}'
WHERE key = 'natal.sign.gemini.present' AND locale = 'ru-RU' AND (topic_category = 'past_lives_symbolic');

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.sign.gemini.present', 'past_lives_symbolic', 'ru-RU', 'Тема «Прошлые жизни»: заметен акцент знака «Близнецы». Это добавляет стилю проявления темы качества «Близнецы» (через личные планеты, углы или куспиды домов в этом знаке).', 102, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.sign.gemini.present' AND locale = 'ru-RU' AND (topic_category = 'past_lives_symbolic')
);

UPDATE knowledge_items
SET text = 'Тема «Прошлые жизни»: заметен акцент знака «Рак». Это добавляет стилю проявления темы качества «Рак» (через личные планеты, углы или куспиды домов в этом знаке).', priority = 102, is_active = 1, meta_json = '{}'
WHERE key = 'natal.sign.cancer.present' AND locale = 'ru-RU' AND (topic_category = 'past_lives_symbolic');

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.sign.cancer.present', 'past_lives_symbolic', 'ru-RU', 'Тема «Прошлые жизни»: заметен акцент знака «Рак». Это добавляет стилю проявления темы качества «Рак» (через личные планеты, углы или куспиды домов в этом знаке).', 102, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.sign.cancer.present' AND locale = 'ru-RU' AND (topic_category = 'past_lives_symbolic')
);

UPDATE knowledge_items
SET text = 'Тема «Прошлые жизни»: заметен акцент знака «Лев». Это добавляет стилю проявления темы качества «Лев» (через личные планеты, углы или куспиды домов в этом знаке).', priority = 102, is_active = 1, meta_json = '{}'
WHERE key = 'natal.sign.leo.present' AND locale = 'ru-RU' AND (topic_category = 'past_lives_symbolic');

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.sign.leo.present', 'past_lives_symbolic', 'ru-RU', 'Тема «Прошлые жизни»: заметен акцент знака «Лев». Это добавляет стилю проявления темы качества «Лев» (через личные планеты, углы или куспиды домов в этом знаке).', 102, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.sign.leo.present' AND locale = 'ru-RU' AND (topic_category = 'past_lives_symbolic')
);

UPDATE knowledge_items
SET text = 'Тема «Прошлые жизни»: заметен акцент знака «Дева». Это добавляет стилю проявления темы качества «Дева» (через личные планеты, углы или куспиды домов в этом знаке).', priority = 102, is_active = 1, meta_json = '{}'
WHERE key = 'natal.sign.virgo.present' AND locale = 'ru-RU' AND (topic_category = 'past_lives_symbolic');

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.sign.virgo.present', 'past_lives_symbolic', 'ru-RU', 'Тема «Прошлые жизни»: заметен акцент знака «Дева». Это добавляет стилю проявления темы качества «Дева» (через личные планеты, углы или куспиды домов в этом знаке).', 102, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.sign.virgo.present' AND locale = 'ru-RU' AND (topic_category = 'past_lives_symbolic')
);

UPDATE knowledge_items
SET text = 'Тема «Прошлые жизни»: заметен акцент знака «Весы». Это добавляет стилю проявления темы качества «Весы» (через личные планеты, углы или куспиды домов в этом знаке).', priority = 102, is_active = 1, meta_json = '{}'
WHERE key = 'natal.sign.libra.present' AND locale = 'ru-RU' AND (topic_category = 'past_lives_symbolic');

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.sign.libra.present', 'past_lives_symbolic', 'ru-RU', 'Тема «Прошлые жизни»: заметен акцент знака «Весы». Это добавляет стилю проявления темы качества «Весы» (через личные планеты, углы или куспиды домов в этом знаке).', 102, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.sign.libra.present' AND locale = 'ru-RU' AND (topic_category = 'past_lives_symbolic')
);

UPDATE knowledge_items
SET text = 'Тема «Прошлые жизни»: заметен акцент знака «Скорпион». Это добавляет стилю проявления темы качества «Скорпион» (через личные планеты, углы или куспиды домов в этом знаке).', priority = 102, is_active = 1, meta_json = '{}'
WHERE key = 'natal.sign.scorpio.present' AND locale = 'ru-RU' AND (topic_category = 'past_lives_symbolic');

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.sign.scorpio.present', 'past_lives_symbolic', 'ru-RU', 'Тема «Прошлые жизни»: заметен акцент знака «Скорпион». Это добавляет стилю проявления темы качества «Скорпион» (через личные планеты, углы или куспиды домов в этом знаке).', 102, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.sign.scorpio.present' AND locale = 'ru-RU' AND (topic_category = 'past_lives_symbolic')
);

UPDATE knowledge_items
SET text = 'Тема «Прошлые жизни»: заметен акцент знака «Стрелец». Это добавляет стилю проявления темы качества «Стрелец» (через личные планеты, углы или куспиды домов в этом знаке).', priority = 102, is_active = 1, meta_json = '{}'
WHERE key = 'natal.sign.sagittarius.present' AND locale = 'ru-RU' AND (topic_category = 'past_lives_symbolic');

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.sign.sagittarius.present', 'past_lives_symbolic', 'ru-RU', 'Тема «Прошлые жизни»: заметен акцент знака «Стрелец». Это добавляет стилю проявления темы качества «Стрелец» (через личные планеты, углы или куспиды домов в этом знаке).', 102, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.sign.sagittarius.present' AND locale = 'ru-RU' AND (topic_category = 'past_lives_symbolic')
);

UPDATE knowledge_items
SET text = 'Тема «Прошлые жизни»: заметен акцент знака «Козерог». Это добавляет стилю проявления темы качества «Козерог» (через личные планеты, углы или куспиды домов в этом знаке).', priority = 102, is_active = 1, meta_json = '{}'
WHERE key = 'natal.sign.capricorn.present' AND locale = 'ru-RU' AND (topic_category = 'past_lives_symbolic');

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.sign.capricorn.present', 'past_lives_symbolic', 'ru-RU', 'Тема «Прошлые жизни»: заметен акцент знака «Козерог». Это добавляет стилю проявления темы качества «Козерог» (через личные планеты, углы или куспиды домов в этом знаке).', 102, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.sign.capricorn.present' AND locale = 'ru-RU' AND (topic_category = 'past_lives_symbolic')
);

UPDATE knowledge_items
SET text = 'Тема «Прошлые жизни»: заметен акцент знака «Водолей». Это добавляет стилю проявления темы качества «Водолей» (через личные планеты, углы или куспиды домов в этом знаке).', priority = 102, is_active = 1, meta_json = '{}'
WHERE key = 'natal.sign.aquarius.present' AND locale = 'ru-RU' AND (topic_category = 'past_lives_symbolic');

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.sign.aquarius.present', 'past_lives_symbolic', 'ru-RU', 'Тема «Прошлые жизни»: заметен акцент знака «Водолей». Это добавляет стилю проявления темы качества «Водолей» (через личные планеты, углы или куспиды домов в этом знаке).', 102, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.sign.aquarius.present' AND locale = 'ru-RU' AND (topic_category = 'past_lives_symbolic')
);

UPDATE knowledge_items
SET text = 'Тема «Прошлые жизни»: заметен акцент знака «Рыбы». Это добавляет стилю проявления темы качества «Рыбы» (через личные планеты, углы или куспиды домов в этом знаке).', priority = 102, is_active = 1, meta_json = '{}'
WHERE key = 'natal.sign.pisces.present' AND locale = 'ru-RU' AND (topic_category = 'past_lives_symbolic');

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.sign.pisces.present', 'past_lives_symbolic', 'ru-RU', 'Тема «Прошлые жизни»: заметен акцент знака «Рыбы». Это добавляет стилю проявления темы качества «Рыбы» (через личные планеты, углы или куспиды домов в этом знаке).', 102, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.sign.pisces.present' AND locale = 'ru-RU' AND (topic_category = 'past_lives_symbolic')
);

UPDATE knowledge_items
SET text = 'Тема «Личность»: заметен акцент знака «Овен». Это добавляет стилю проявления темы качества «Овен» (через личные планеты, углы или куспиды домов в этом знаке).', priority = 102, is_active = 1, meta_json = '{}'
WHERE key = 'natal.sign.aries.present' AND locale = 'ru-RU' AND (topic_category = 'personality_core');

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.sign.aries.present', 'personality_core', 'ru-RU', 'Тема «Личность»: заметен акцент знака «Овен». Это добавляет стилю проявления темы качества «Овен» (через личные планеты, углы или куспиды домов в этом знаке).', 102, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.sign.aries.present' AND locale = 'ru-RU' AND (topic_category = 'personality_core')
);

UPDATE knowledge_items
SET text = 'Тема «Личность»: заметен акцент знака «Телец». Это добавляет стилю проявления темы качества «Телец» (через личные планеты, углы или куспиды домов в этом знаке).', priority = 102, is_active = 1, meta_json = '{}'
WHERE key = 'natal.sign.taurus.present' AND locale = 'ru-RU' AND (topic_category = 'personality_core');

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.sign.taurus.present', 'personality_core', 'ru-RU', 'Тема «Личность»: заметен акцент знака «Телец». Это добавляет стилю проявления темы качества «Телец» (через личные планеты, углы или куспиды домов в этом знаке).', 102, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.sign.taurus.present' AND locale = 'ru-RU' AND (topic_category = 'personality_core')
);

UPDATE knowledge_items
SET text = 'Тема «Личность»: заметен акцент знака «Близнецы». Это добавляет стилю проявления темы качества «Близнецы» (через личные планеты, углы или куспиды домов в этом знаке).', priority = 102, is_active = 1, meta_json = '{}'
WHERE key = 'natal.sign.gemini.present' AND locale = 'ru-RU' AND (topic_category = 'personality_core');

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.sign.gemini.present', 'personality_core', 'ru-RU', 'Тема «Личность»: заметен акцент знака «Близнецы». Это добавляет стилю проявления темы качества «Близнецы» (через личные планеты, углы или куспиды домов в этом знаке).', 102, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.sign.gemini.present' AND locale = 'ru-RU' AND (topic_category = 'personality_core')
);

UPDATE knowledge_items
SET text = 'Тема «Личность»: заметен акцент знака «Рак». Это добавляет стилю проявления темы качества «Рак» (через личные планеты, углы или куспиды домов в этом знаке).', priority = 102, is_active = 1, meta_json = '{}'
WHERE key = 'natal.sign.cancer.present' AND locale = 'ru-RU' AND (topic_category = 'personality_core');

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.sign.cancer.present', 'personality_core', 'ru-RU', 'Тема «Личность»: заметен акцент знака «Рак». Это добавляет стилю проявления темы качества «Рак» (через личные планеты, углы или куспиды домов в этом знаке).', 102, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.sign.cancer.present' AND locale = 'ru-RU' AND (topic_category = 'personality_core')
);

UPDATE knowledge_items
SET text = 'Тема «Личность»: заметен акцент знака «Лев». Это добавляет стилю проявления темы качества «Лев» (через личные планеты, углы или куспиды домов в этом знаке).', priority = 102, is_active = 1, meta_json = '{}'
WHERE key = 'natal.sign.leo.present' AND locale = 'ru-RU' AND (topic_category = 'personality_core');

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.sign.leo.present', 'personality_core', 'ru-RU', 'Тема «Личность»: заметен акцент знака «Лев». Это добавляет стилю проявления темы качества «Лев» (через личные планеты, углы или куспиды домов в этом знаке).', 102, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.sign.leo.present' AND locale = 'ru-RU' AND (topic_category = 'personality_core')
);

UPDATE knowledge_items
SET text = 'Тема «Личность»: заметен акцент знака «Дева». Это добавляет стилю проявления темы качества «Дева» (через личные планеты, углы или куспиды домов в этом знаке).', priority = 102, is_active = 1, meta_json = '{}'
WHERE key = 'natal.sign.virgo.present' AND locale = 'ru-RU' AND (topic_category = 'personality_core');

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.sign.virgo.present', 'personality_core', 'ru-RU', 'Тема «Личность»: заметен акцент знака «Дева». Это добавляет стилю проявления темы качества «Дева» (через личные планеты, углы или куспиды домов в этом знаке).', 102, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.sign.virgo.present' AND locale = 'ru-RU' AND (topic_category = 'personality_core')
);

UPDATE knowledge_items
SET text = 'Тема «Личность»: заметен акцент знака «Весы». Это добавляет стилю проявления темы качества «Весы» (через личные планеты, углы или куспиды домов в этом знаке).', priority = 102, is_active = 1, meta_json = '{}'
WHERE key = 'natal.sign.libra.present' AND locale = 'ru-RU' AND (topic_category = 'personality_core');

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.sign.libra.present', 'personality_core', 'ru-RU', 'Тема «Личность»: заметен акцент знака «Весы». Это добавляет стилю проявления темы качества «Весы» (через личные планеты, углы или куспиды домов в этом знаке).', 102, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.sign.libra.present' AND locale = 'ru-RU' AND (topic_category = 'personality_core')
);

UPDATE knowledge_items
SET text = 'Тема «Личность»: заметен акцент знака «Скорпион». Это добавляет стилю проявления темы качества «Скорпион» (через личные планеты, углы или куспиды домов в этом знаке).', priority = 102, is_active = 1, meta_json = '{}'
WHERE key = 'natal.sign.scorpio.present' AND locale = 'ru-RU' AND (topic_category = 'personality_core');

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.sign.scorpio.present', 'personality_core', 'ru-RU', 'Тема «Личность»: заметен акцент знака «Скорпион». Это добавляет стилю проявления темы качества «Скорпион» (через личные планеты, углы или куспиды домов в этом знаке).', 102, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.sign.scorpio.present' AND locale = 'ru-RU' AND (topic_category = 'personality_core')
);

UPDATE knowledge_items
SET text = 'Тема «Личность»: заметен акцент знака «Стрелец». Это добавляет стилю проявления темы качества «Стрелец» (через личные планеты, углы или куспиды домов в этом знаке).', priority = 102, is_active = 1, meta_json = '{}'
WHERE key = 'natal.sign.sagittarius.present' AND locale = 'ru-RU' AND (topic_category = 'personality_core');

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.sign.sagittarius.present', 'personality_core', 'ru-RU', 'Тема «Личность»: заметен акцент знака «Стрелец». Это добавляет стилю проявления темы качества «Стрелец» (через личные планеты, углы или куспиды домов в этом знаке).', 102, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.sign.sagittarius.present' AND locale = 'ru-RU' AND (topic_category = 'personality_core')
);

UPDATE knowledge_items
SET text = 'Тема «Личность»: заметен акцент знака «Козерог». Это добавляет стилю проявления темы качества «Козерог» (через личные планеты, углы или куспиды домов в этом знаке).', priority = 102, is_active = 1, meta_json = '{}'
WHERE key = 'natal.sign.capricorn.present' AND locale = 'ru-RU' AND (topic_category = 'personality_core');

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.sign.capricorn.present', 'personality_core', 'ru-RU', 'Тема «Личность»: заметен акцент знака «Козерог». Это добавляет стилю проявления темы качества «Козерог» (через личные планеты, углы или куспиды домов в этом знаке).', 102, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.sign.capricorn.present' AND locale = 'ru-RU' AND (topic_category = 'personality_core')
);

UPDATE knowledge_items
SET text = 'Тема «Личность»: заметен акцент знака «Водолей». Это добавляет стилю проявления темы качества «Водолей» (через личные планеты, углы или куспиды домов в этом знаке).', priority = 102, is_active = 1, meta_json = '{}'
WHERE key = 'natal.sign.aquarius.present' AND locale = 'ru-RU' AND (topic_category = 'personality_core');

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.sign.aquarius.present', 'personality_core', 'ru-RU', 'Тема «Личность»: заметен акцент знака «Водолей». Это добавляет стилю проявления темы качества «Водолей» (через личные планеты, углы или куспиды домов в этом знаке).', 102, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.sign.aquarius.present' AND locale = 'ru-RU' AND (topic_category = 'personality_core')
);

UPDATE knowledge_items
SET text = 'Тема «Личность»: заметен акцент знака «Рыбы». Это добавляет стилю проявления темы качества «Рыбы» (через личные планеты, углы или куспиды домов в этом знаке).', priority = 102, is_active = 1, meta_json = '{}'
WHERE key = 'natal.sign.pisces.present' AND locale = 'ru-RU' AND (topic_category = 'personality_core');

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.sign.pisces.present', 'personality_core', 'ru-RU', 'Тема «Личность»: заметен акцент знака «Рыбы». Это добавляет стилю проявления темы качества «Рыбы» (через личные планеты, углы или куспиды домов в этом знаке).', 102, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.sign.pisces.present' AND locale = 'ru-RU' AND (topic_category = 'personality_core')
);

UPDATE knowledge_items
SET text = 'Тема «Психология»: заметен акцент знака «Овен». Это добавляет стилю проявления темы качества «Овен» (через личные планеты, углы или куспиды домов в этом знаке).', priority = 102, is_active = 1, meta_json = '{}'
WHERE key = 'natal.sign.aries.present' AND locale = 'ru-RU' AND (topic_category = 'psychology');

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.sign.aries.present', 'psychology', 'ru-RU', 'Тема «Психология»: заметен акцент знака «Овен». Это добавляет стилю проявления темы качества «Овен» (через личные планеты, углы или куспиды домов в этом знаке).', 102, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.sign.aries.present' AND locale = 'ru-RU' AND (topic_category = 'psychology')
);

UPDATE knowledge_items
SET text = 'Тема «Психология»: заметен акцент знака «Телец». Это добавляет стилю проявления темы качества «Телец» (через личные планеты, углы или куспиды домов в этом знаке).', priority = 102, is_active = 1, meta_json = '{}'
WHERE key = 'natal.sign.taurus.present' AND locale = 'ru-RU' AND (topic_category = 'psychology');

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.sign.taurus.present', 'psychology', 'ru-RU', 'Тема «Психология»: заметен акцент знака «Телец». Это добавляет стилю проявления темы качества «Телец» (через личные планеты, углы или куспиды домов в этом знаке).', 102, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.sign.taurus.present' AND locale = 'ru-RU' AND (topic_category = 'psychology')
);

UPDATE knowledge_items
SET text = 'Тема «Психология»: заметен акцент знака «Близнецы». Это добавляет стилю проявления темы качества «Близнецы» (через личные планеты, углы или куспиды домов в этом знаке).', priority = 102, is_active = 1, meta_json = '{}'
WHERE key = 'natal.sign.gemini.present' AND locale = 'ru-RU' AND (topic_category = 'psychology');

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.sign.gemini.present', 'psychology', 'ru-RU', 'Тема «Психология»: заметен акцент знака «Близнецы». Это добавляет стилю проявления темы качества «Близнецы» (через личные планеты, углы или куспиды домов в этом знаке).', 102, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.sign.gemini.present' AND locale = 'ru-RU' AND (topic_category = 'psychology')
);

UPDATE knowledge_items
SET text = 'Тема «Психология»: заметен акцент знака «Рак». Это добавляет стилю проявления темы качества «Рак» (через личные планеты, углы или куспиды домов в этом знаке).', priority = 102, is_active = 1, meta_json = '{}'
WHERE key = 'natal.sign.cancer.present' AND locale = 'ru-RU' AND (topic_category = 'psychology');

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.sign.cancer.present', 'psychology', 'ru-RU', 'Тема «Психология»: заметен акцент знака «Рак». Это добавляет стилю проявления темы качества «Рак» (через личные планеты, углы или куспиды домов в этом знаке).', 102, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.sign.cancer.present' AND locale = 'ru-RU' AND (topic_category = 'psychology')
);

UPDATE knowledge_items
SET text = 'Тема «Психология»: заметен акцент знака «Лев». Это добавляет стилю проявления темы качества «Лев» (через личные планеты, углы или куспиды домов в этом знаке).', priority = 102, is_active = 1, meta_json = '{}'
WHERE key = 'natal.sign.leo.present' AND locale = 'ru-RU' AND (topic_category = 'psychology');

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.sign.leo.present', 'psychology', 'ru-RU', 'Тема «Психология»: заметен акцент знака «Лев». Это добавляет стилю проявления темы качества «Лев» (через личные планеты, углы или куспиды домов в этом знаке).', 102, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.sign.leo.present' AND locale = 'ru-RU' AND (topic_category = 'psychology')
);

UPDATE knowledge_items
SET text = 'Тема «Психология»: заметен акцент знака «Дева». Это добавляет стилю проявления темы качества «Дева» (через личные планеты, углы или куспиды домов в этом знаке).', priority = 102, is_active = 1, meta_json = '{}'
WHERE key = 'natal.sign.virgo.present' AND locale = 'ru-RU' AND (topic_category = 'psychology');

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.sign.virgo.present', 'psychology', 'ru-RU', 'Тема «Психология»: заметен акцент знака «Дева». Это добавляет стилю проявления темы качества «Дева» (через личные планеты, углы или куспиды домов в этом знаке).', 102, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.sign.virgo.present' AND locale = 'ru-RU' AND (topic_category = 'psychology')
);

UPDATE knowledge_items
SET text = 'Тема «Психология»: заметен акцент знака «Весы». Это добавляет стилю проявления темы качества «Весы» (через личные планеты, углы или куспиды домов в этом знаке).', priority = 102, is_active = 1, meta_json = '{}'
WHERE key = 'natal.sign.libra.present' AND locale = 'ru-RU' AND (topic_category = 'psychology');

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.sign.libra.present', 'psychology', 'ru-RU', 'Тема «Психология»: заметен акцент знака «Весы». Это добавляет стилю проявления темы качества «Весы» (через личные планеты, углы или куспиды домов в этом знаке).', 102, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.sign.libra.present' AND locale = 'ru-RU' AND (topic_category = 'psychology')
);

UPDATE knowledge_items
SET text = 'Тема «Психология»: заметен акцент знака «Скорпион». Это добавляет стилю проявления темы качества «Скорпион» (через личные планеты, углы или куспиды домов в этом знаке).', priority = 102, is_active = 1, meta_json = '{}'
WHERE key = 'natal.sign.scorpio.present' AND locale = 'ru-RU' AND (topic_category = 'psychology');

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.sign.scorpio.present', 'psychology', 'ru-RU', 'Тема «Психология»: заметен акцент знака «Скорпион». Это добавляет стилю проявления темы качества «Скорпион» (через личные планеты, углы или куспиды домов в этом знаке).', 102, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.sign.scorpio.present' AND locale = 'ru-RU' AND (topic_category = 'psychology')
);

UPDATE knowledge_items
SET text = 'Тема «Психология»: заметен акцент знака «Стрелец». Это добавляет стилю проявления темы качества «Стрелец» (через личные планеты, углы или куспиды домов в этом знаке).', priority = 102, is_active = 1, meta_json = '{}'
WHERE key = 'natal.sign.sagittarius.present' AND locale = 'ru-RU' AND (topic_category = 'psychology');

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.sign.sagittarius.present', 'psychology', 'ru-RU', 'Тема «Психология»: заметен акцент знака «Стрелец». Это добавляет стилю проявления темы качества «Стрелец» (через личные планеты, углы или куспиды домов в этом знаке).', 102, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.sign.sagittarius.present' AND locale = 'ru-RU' AND (topic_category = 'psychology')
);

UPDATE knowledge_items
SET text = 'Тема «Психология»: заметен акцент знака «Козерог». Это добавляет стилю проявления темы качества «Козерог» (через личные планеты, углы или куспиды домов в этом знаке).', priority = 102, is_active = 1, meta_json = '{}'
WHERE key = 'natal.sign.capricorn.present' AND locale = 'ru-RU' AND (topic_category = 'psychology');

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.sign.capricorn.present', 'psychology', 'ru-RU', 'Тема «Психология»: заметен акцент знака «Козерог». Это добавляет стилю проявления темы качества «Козерог» (через личные планеты, углы или куспиды домов в этом знаке).', 102, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.sign.capricorn.present' AND locale = 'ru-RU' AND (topic_category = 'psychology')
);

UPDATE knowledge_items
SET text = 'Тема «Психология»: заметен акцент знака «Водолей». Это добавляет стилю проявления темы качества «Водолей» (через личные планеты, углы или куспиды домов в этом знаке).', priority = 102, is_active = 1, meta_json = '{}'
WHERE key = 'natal.sign.aquarius.present' AND locale = 'ru-RU' AND (topic_category = 'psychology');

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.sign.aquarius.present', 'psychology', 'ru-RU', 'Тема «Психология»: заметен акцент знака «Водолей». Это добавляет стилю проявления темы качества «Водолей» (через личные планеты, углы или куспиды домов в этом знаке).', 102, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.sign.aquarius.present' AND locale = 'ru-RU' AND (topic_category = 'psychology')
);

UPDATE knowledge_items
SET text = 'Тема «Психология»: заметен акцент знака «Рыбы». Это добавляет стилю проявления темы качества «Рыбы» (через личные планеты, углы или куспиды домов в этом знаке).', priority = 102, is_active = 1, meta_json = '{}'
WHERE key = 'natal.sign.pisces.present' AND locale = 'ru-RU' AND (topic_category = 'psychology');

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.sign.pisces.present', 'psychology', 'ru-RU', 'Тема «Психология»: заметен акцент знака «Рыбы». Это добавляет стилю проявления темы качества «Рыбы» (через личные планеты, углы или куспиды домов в этом знаке).', 102, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.sign.pisces.present' AND locale = 'ru-RU' AND (topic_category = 'psychology')
);

UPDATE knowledge_items
SET text = 'Тема «Предназначение»: заметен акцент знака «Овен». Это добавляет стилю проявления темы качества «Овен» (через личные планеты, углы или куспиды домов в этом знаке).', priority = 102, is_active = 1, meta_json = '{}'
WHERE key = 'natal.sign.aries.present' AND locale = 'ru-RU' AND (topic_category = 'purpose_path');

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.sign.aries.present', 'purpose_path', 'ru-RU', 'Тема «Предназначение»: заметен акцент знака «Овен». Это добавляет стилю проявления темы качества «Овен» (через личные планеты, углы или куспиды домов в этом знаке).', 102, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.sign.aries.present' AND locale = 'ru-RU' AND (topic_category = 'purpose_path')
);

UPDATE knowledge_items
SET text = 'Тема «Предназначение»: заметен акцент знака «Телец». Это добавляет стилю проявления темы качества «Телец» (через личные планеты, углы или куспиды домов в этом знаке).', priority = 102, is_active = 1, meta_json = '{}'
WHERE key = 'natal.sign.taurus.present' AND locale = 'ru-RU' AND (topic_category = 'purpose_path');

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.sign.taurus.present', 'purpose_path', 'ru-RU', 'Тема «Предназначение»: заметен акцент знака «Телец». Это добавляет стилю проявления темы качества «Телец» (через личные планеты, углы или куспиды домов в этом знаке).', 102, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.sign.taurus.present' AND locale = 'ru-RU' AND (topic_category = 'purpose_path')
);

UPDATE knowledge_items
SET text = 'Тема «Предназначение»: заметен акцент знака «Близнецы». Это добавляет стилю проявления темы качества «Близнецы» (через личные планеты, углы или куспиды домов в этом знаке).', priority = 102, is_active = 1, meta_json = '{}'
WHERE key = 'natal.sign.gemini.present' AND locale = 'ru-RU' AND (topic_category = 'purpose_path');

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.sign.gemini.present', 'purpose_path', 'ru-RU', 'Тема «Предназначение»: заметен акцент знака «Близнецы». Это добавляет стилю проявления темы качества «Близнецы» (через личные планеты, углы или куспиды домов в этом знаке).', 102, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.sign.gemini.present' AND locale = 'ru-RU' AND (topic_category = 'purpose_path')
);

UPDATE knowledge_items
SET text = 'Тема «Предназначение»: заметен акцент знака «Рак». Это добавляет стилю проявления темы качества «Рак» (через личные планеты, углы или куспиды домов в этом знаке).', priority = 102, is_active = 1, meta_json = '{}'
WHERE key = 'natal.sign.cancer.present' AND locale = 'ru-RU' AND (topic_category = 'purpose_path');

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.sign.cancer.present', 'purpose_path', 'ru-RU', 'Тема «Предназначение»: заметен акцент знака «Рак». Это добавляет стилю проявления темы качества «Рак» (через личные планеты, углы или куспиды домов в этом знаке).', 102, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.sign.cancer.present' AND locale = 'ru-RU' AND (topic_category = 'purpose_path')
);

UPDATE knowledge_items
SET text = 'Тема «Предназначение»: заметен акцент знака «Лев». Это добавляет стилю проявления темы качества «Лев» (через личные планеты, углы или куспиды домов в этом знаке).', priority = 102, is_active = 1, meta_json = '{}'
WHERE key = 'natal.sign.leo.present' AND locale = 'ru-RU' AND (topic_category = 'purpose_path');

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.sign.leo.present', 'purpose_path', 'ru-RU', 'Тема «Предназначение»: заметен акцент знака «Лев». Это добавляет стилю проявления темы качества «Лев» (через личные планеты, углы или куспиды домов в этом знаке).', 102, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.sign.leo.present' AND locale = 'ru-RU' AND (topic_category = 'purpose_path')
);

UPDATE knowledge_items
SET text = 'Тема «Предназначение»: заметен акцент знака «Дева». Это добавляет стилю проявления темы качества «Дева» (через личные планеты, углы или куспиды домов в этом знаке).', priority = 102, is_active = 1, meta_json = '{}'
WHERE key = 'natal.sign.virgo.present' AND locale = 'ru-RU' AND (topic_category = 'purpose_path');

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.sign.virgo.present', 'purpose_path', 'ru-RU', 'Тема «Предназначение»: заметен акцент знака «Дева». Это добавляет стилю проявления темы качества «Дева» (через личные планеты, углы или куспиды домов в этом знаке).', 102, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.sign.virgo.present' AND locale = 'ru-RU' AND (topic_category = 'purpose_path')
);

UPDATE knowledge_items
SET text = 'Тема «Предназначение»: заметен акцент знака «Весы». Это добавляет стилю проявления темы качества «Весы» (через личные планеты, углы или куспиды домов в этом знаке).', priority = 102, is_active = 1, meta_json = '{}'
WHERE key = 'natal.sign.libra.present' AND locale = 'ru-RU' AND (topic_category = 'purpose_path');

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.sign.libra.present', 'purpose_path', 'ru-RU', 'Тема «Предназначение»: заметен акцент знака «Весы». Это добавляет стилю проявления темы качества «Весы» (через личные планеты, углы или куспиды домов в этом знаке).', 102, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.sign.libra.present' AND locale = 'ru-RU' AND (topic_category = 'purpose_path')
);

UPDATE knowledge_items
SET text = 'Тема «Предназначение»: заметен акцент знака «Скорпион». Это добавляет стилю проявления темы качества «Скорпион» (через личные планеты, углы или куспиды домов в этом знаке).', priority = 102, is_active = 1, meta_json = '{}'
WHERE key = 'natal.sign.scorpio.present' AND locale = 'ru-RU' AND (topic_category = 'purpose_path');

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.sign.scorpio.present', 'purpose_path', 'ru-RU', 'Тема «Предназначение»: заметен акцент знака «Скорпион». Это добавляет стилю проявления темы качества «Скорпион» (через личные планеты, углы или куспиды домов в этом знаке).', 102, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.sign.scorpio.present' AND locale = 'ru-RU' AND (topic_category = 'purpose_path')
);

UPDATE knowledge_items
SET text = 'Тема «Предназначение»: заметен акцент знака «Стрелец». Это добавляет стилю проявления темы качества «Стрелец» (через личные планеты, углы или куспиды домов в этом знаке).', priority = 102, is_active = 1, meta_json = '{}'
WHERE key = 'natal.sign.sagittarius.present' AND locale = 'ru-RU' AND (topic_category = 'purpose_path');

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.sign.sagittarius.present', 'purpose_path', 'ru-RU', 'Тема «Предназначение»: заметен акцент знака «Стрелец». Это добавляет стилю проявления темы качества «Стрелец» (через личные планеты, углы или куспиды домов в этом знаке).', 102, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.sign.sagittarius.present' AND locale = 'ru-RU' AND (topic_category = 'purpose_path')
);

UPDATE knowledge_items
SET text = 'Тема «Предназначение»: заметен акцент знака «Козерог». Это добавляет стилю проявления темы качества «Козерог» (через личные планеты, углы или куспиды домов в этом знаке).', priority = 102, is_active = 1, meta_json = '{}'
WHERE key = 'natal.sign.capricorn.present' AND locale = 'ru-RU' AND (topic_category = 'purpose_path');

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.sign.capricorn.present', 'purpose_path', 'ru-RU', 'Тема «Предназначение»: заметен акцент знака «Козерог». Это добавляет стилю проявления темы качества «Козерог» (через личные планеты, углы или куспиды домов в этом знаке).', 102, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.sign.capricorn.present' AND locale = 'ru-RU' AND (topic_category = 'purpose_path')
);

UPDATE knowledge_items
SET text = 'Тема «Предназначение»: заметен акцент знака «Водолей». Это добавляет стилю проявления темы качества «Водолей» (через личные планеты, углы или куспиды домов в этом знаке).', priority = 102, is_active = 1, meta_json = '{}'
WHERE key = 'natal.sign.aquarius.present' AND locale = 'ru-RU' AND (topic_category = 'purpose_path');

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.sign.aquarius.present', 'purpose_path', 'ru-RU', 'Тема «Предназначение»: заметен акцент знака «Водолей». Это добавляет стилю проявления темы качества «Водолей» (через личные планеты, углы или куспиды домов в этом знаке).', 102, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.sign.aquarius.present' AND locale = 'ru-RU' AND (topic_category = 'purpose_path')
);

UPDATE knowledge_items
SET text = 'Тема «Предназначение»: заметен акцент знака «Рыбы». Это добавляет стилю проявления темы качества «Рыбы» (через личные планеты, углы или куспиды домов в этом знаке).', priority = 102, is_active = 1, meta_json = '{}'
WHERE key = 'natal.sign.pisces.present' AND locale = 'ru-RU' AND (topic_category = 'purpose_path');

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.sign.pisces.present', 'purpose_path', 'ru-RU', 'Тема «Предназначение»: заметен акцент знака «Рыбы». Это добавляет стилю проявления темы качества «Рыбы» (через личные планеты, углы или куспиды домов в этом знаке).', 102, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.sign.pisces.present' AND locale = 'ru-RU' AND (topic_category = 'purpose_path')
);

UPDATE knowledge_items
SET text = 'Тема «Самооценка»: заметен акцент знака «Овен». Это добавляет стилю проявления темы качества «Овен» (через личные планеты, углы или куспиды домов в этом знаке).', priority = 102, is_active = 1, meta_json = '{}'
WHERE key = 'natal.sign.aries.present' AND locale = 'ru-RU' AND (topic_category = 'self_esteem');

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.sign.aries.present', 'self_esteem', 'ru-RU', 'Тема «Самооценка»: заметен акцент знака «Овен». Это добавляет стилю проявления темы качества «Овен» (через личные планеты, углы или куспиды домов в этом знаке).', 102, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.sign.aries.present' AND locale = 'ru-RU' AND (topic_category = 'self_esteem')
);

UPDATE knowledge_items
SET text = 'Тема «Самооценка»: заметен акцент знака «Телец». Это добавляет стилю проявления темы качества «Телец» (через личные планеты, углы или куспиды домов в этом знаке).', priority = 102, is_active = 1, meta_json = '{}'
WHERE key = 'natal.sign.taurus.present' AND locale = 'ru-RU' AND (topic_category = 'self_esteem');

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.sign.taurus.present', 'self_esteem', 'ru-RU', 'Тема «Самооценка»: заметен акцент знака «Телец». Это добавляет стилю проявления темы качества «Телец» (через личные планеты, углы или куспиды домов в этом знаке).', 102, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.sign.taurus.present' AND locale = 'ru-RU' AND (topic_category = 'self_esteem')
);

UPDATE knowledge_items
SET text = 'Тема «Самооценка»: заметен акцент знака «Близнецы». Это добавляет стилю проявления темы качества «Близнецы» (через личные планеты, углы или куспиды домов в этом знаке).', priority = 102, is_active = 1, meta_json = '{}'
WHERE key = 'natal.sign.gemini.present' AND locale = 'ru-RU' AND (topic_category = 'self_esteem');

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.sign.gemini.present', 'self_esteem', 'ru-RU', 'Тема «Самооценка»: заметен акцент знака «Близнецы». Это добавляет стилю проявления темы качества «Близнецы» (через личные планеты, углы или куспиды домов в этом знаке).', 102, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.sign.gemini.present' AND locale = 'ru-RU' AND (topic_category = 'self_esteem')
);

UPDATE knowledge_items
SET text = 'Тема «Самооценка»: заметен акцент знака «Рак». Это добавляет стилю проявления темы качества «Рак» (через личные планеты, углы или куспиды домов в этом знаке).', priority = 102, is_active = 1, meta_json = '{}'
WHERE key = 'natal.sign.cancer.present' AND locale = 'ru-RU' AND (topic_category = 'self_esteem');

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.sign.cancer.present', 'self_esteem', 'ru-RU', 'Тема «Самооценка»: заметен акцент знака «Рак». Это добавляет стилю проявления темы качества «Рак» (через личные планеты, углы или куспиды домов в этом знаке).', 102, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.sign.cancer.present' AND locale = 'ru-RU' AND (topic_category = 'self_esteem')
);

UPDATE knowledge_items
SET text = 'Тема «Самооценка»: заметен акцент знака «Лев». Это добавляет стилю проявления темы качества «Лев» (через личные планеты, углы или куспиды домов в этом знаке).', priority = 102, is_active = 1, meta_json = '{}'
WHERE key = 'natal.sign.leo.present' AND locale = 'ru-RU' AND (topic_category = 'self_esteem');

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.sign.leo.present', 'self_esteem', 'ru-RU', 'Тема «Самооценка»: заметен акцент знака «Лев». Это добавляет стилю проявления темы качества «Лев» (через личные планеты, углы или куспиды домов в этом знаке).', 102, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.sign.leo.present' AND locale = 'ru-RU' AND (topic_category = 'self_esteem')
);

UPDATE knowledge_items
SET text = 'Тема «Самооценка»: заметен акцент знака «Дева». Это добавляет стилю проявления темы качества «Дева» (через личные планеты, углы или куспиды домов в этом знаке).', priority = 102, is_active = 1, meta_json = '{}'
WHERE key = 'natal.sign.virgo.present' AND locale = 'ru-RU' AND (topic_category = 'self_esteem');

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.sign.virgo.present', 'self_esteem', 'ru-RU', 'Тема «Самооценка»: заметен акцент знака «Дева». Это добавляет стилю проявления темы качества «Дева» (через личные планеты, углы или куспиды домов в этом знаке).', 102, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.sign.virgo.present' AND locale = 'ru-RU' AND (topic_category = 'self_esteem')
);

UPDATE knowledge_items
SET text = 'Тема «Самооценка»: заметен акцент знака «Весы». Это добавляет стилю проявления темы качества «Весы» (через личные планеты, углы или куспиды домов в этом знаке).', priority = 102, is_active = 1, meta_json = '{}'
WHERE key = 'natal.sign.libra.present' AND locale = 'ru-RU' AND (topic_category = 'self_esteem');

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.sign.libra.present', 'self_esteem', 'ru-RU', 'Тема «Самооценка»: заметен акцент знака «Весы». Это добавляет стилю проявления темы качества «Весы» (через личные планеты, углы или куспиды домов в этом знаке).', 102, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.sign.libra.present' AND locale = 'ru-RU' AND (topic_category = 'self_esteem')
);

UPDATE knowledge_items
SET text = 'Тема «Самооценка»: заметен акцент знака «Скорпион». Это добавляет стилю проявления темы качества «Скорпион» (через личные планеты, углы или куспиды домов в этом знаке).', priority = 102, is_active = 1, meta_json = '{}'
WHERE key = 'natal.sign.scorpio.present' AND locale = 'ru-RU' AND (topic_category = 'self_esteem');

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.sign.scorpio.present', 'self_esteem', 'ru-RU', 'Тема «Самооценка»: заметен акцент знака «Скорпион». Это добавляет стилю проявления темы качества «Скорпион» (через личные планеты, углы или куспиды домов в этом знаке).', 102, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.sign.scorpio.present' AND locale = 'ru-RU' AND (topic_category = 'self_esteem')
);

UPDATE knowledge_items
SET text = 'Тема «Самооценка»: заметен акцент знака «Стрелец». Это добавляет стилю проявления темы качества «Стрелец» (через личные планеты, углы или куспиды домов в этом знаке).', priority = 102, is_active = 1, meta_json = '{}'
WHERE key = 'natal.sign.sagittarius.present' AND locale = 'ru-RU' AND (topic_category = 'self_esteem');

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.sign.sagittarius.present', 'self_esteem', 'ru-RU', 'Тема «Самооценка»: заметен акцент знака «Стрелец». Это добавляет стилю проявления темы качества «Стрелец» (через личные планеты, углы или куспиды домов в этом знаке).', 102, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.sign.sagittarius.present' AND locale = 'ru-RU' AND (topic_category = 'self_esteem')
);

UPDATE knowledge_items
SET text = 'Тема «Самооценка»: заметен акцент знака «Козерог». Это добавляет стилю проявления темы качества «Козерог» (через личные планеты, углы или куспиды домов в этом знаке).', priority = 102, is_active = 1, meta_json = '{}'
WHERE key = 'natal.sign.capricorn.present' AND locale = 'ru-RU' AND (topic_category = 'self_esteem');

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.sign.capricorn.present', 'self_esteem', 'ru-RU', 'Тема «Самооценка»: заметен акцент знака «Козерог». Это добавляет стилю проявления темы качества «Козерог» (через личные планеты, углы или куспиды домов в этом знаке).', 102, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.sign.capricorn.present' AND locale = 'ru-RU' AND (topic_category = 'self_esteem')
);

UPDATE knowledge_items
SET text = 'Тема «Самооценка»: заметен акцент знака «Водолей». Это добавляет стилю проявления темы качества «Водолей» (через личные планеты, углы или куспиды домов в этом знаке).', priority = 102, is_active = 1, meta_json = '{}'
WHERE key = 'natal.sign.aquarius.present' AND locale = 'ru-RU' AND (topic_category = 'self_esteem');

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.sign.aquarius.present', 'self_esteem', 'ru-RU', 'Тема «Самооценка»: заметен акцент знака «Водолей». Это добавляет стилю проявления темы качества «Водолей» (через личные планеты, углы или куспиды домов в этом знаке).', 102, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.sign.aquarius.present' AND locale = 'ru-RU' AND (topic_category = 'self_esteem')
);

UPDATE knowledge_items
SET text = 'Тема «Самооценка»: заметен акцент знака «Рыбы». Это добавляет стилю проявления темы качества «Рыбы» (через личные планеты, углы или куспиды домов в этом знаке).', priority = 102, is_active = 1, meta_json = '{}'
WHERE key = 'natal.sign.pisces.present' AND locale = 'ru-RU' AND (topic_category = 'self_esteem');

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.sign.pisces.present', 'self_esteem', 'ru-RU', 'Тема «Самооценка»: заметен акцент знака «Рыбы». Это добавляет стилю проявления темы качества «Рыбы» (через личные планеты, углы или куспиды домов в этом знаке).', 102, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.sign.pisces.present' AND locale = 'ru-RU' AND (topic_category = 'self_esteem')
);

UPDATE knowledge_items
SET text = 'Тема «Сильные стороны»: заметен акцент знака «Овен». Это добавляет стилю проявления темы качества «Овен» (через личные планеты, углы или куспиды домов в этом знаке).', priority = 102, is_active = 1, meta_json = '{}'
WHERE key = 'natal.sign.aries.present' AND locale = 'ru-RU' AND (topic_category = 'strengths_weaknesses');

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.sign.aries.present', 'strengths_weaknesses', 'ru-RU', 'Тема «Сильные стороны»: заметен акцент знака «Овен». Это добавляет стилю проявления темы качества «Овен» (через личные планеты, углы или куспиды домов в этом знаке).', 102, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.sign.aries.present' AND locale = 'ru-RU' AND (topic_category = 'strengths_weaknesses')
);

UPDATE knowledge_items
SET text = 'Тема «Сильные стороны»: заметен акцент знака «Телец». Это добавляет стилю проявления темы качества «Телец» (через личные планеты, углы или куспиды домов в этом знаке).', priority = 102, is_active = 1, meta_json = '{}'
WHERE key = 'natal.sign.taurus.present' AND locale = 'ru-RU' AND (topic_category = 'strengths_weaknesses');

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.sign.taurus.present', 'strengths_weaknesses', 'ru-RU', 'Тема «Сильные стороны»: заметен акцент знака «Телец». Это добавляет стилю проявления темы качества «Телец» (через личные планеты, углы или куспиды домов в этом знаке).', 102, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.sign.taurus.present' AND locale = 'ru-RU' AND (topic_category = 'strengths_weaknesses')
);

UPDATE knowledge_items
SET text = 'Тема «Сильные стороны»: заметен акцент знака «Близнецы». Это добавляет стилю проявления темы качества «Близнецы» (через личные планеты, углы или куспиды домов в этом знаке).', priority = 102, is_active = 1, meta_json = '{}'
WHERE key = 'natal.sign.gemini.present' AND locale = 'ru-RU' AND (topic_category = 'strengths_weaknesses');

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.sign.gemini.present', 'strengths_weaknesses', 'ru-RU', 'Тема «Сильные стороны»: заметен акцент знака «Близнецы». Это добавляет стилю проявления темы качества «Близнецы» (через личные планеты, углы или куспиды домов в этом знаке).', 102, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.sign.gemini.present' AND locale = 'ru-RU' AND (topic_category = 'strengths_weaknesses')
);

UPDATE knowledge_items
SET text = 'Тема «Сильные стороны»: заметен акцент знака «Рак». Это добавляет стилю проявления темы качества «Рак» (через личные планеты, углы или куспиды домов в этом знаке).', priority = 102, is_active = 1, meta_json = '{}'
WHERE key = 'natal.sign.cancer.present' AND locale = 'ru-RU' AND (topic_category = 'strengths_weaknesses');

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.sign.cancer.present', 'strengths_weaknesses', 'ru-RU', 'Тема «Сильные стороны»: заметен акцент знака «Рак». Это добавляет стилю проявления темы качества «Рак» (через личные планеты, углы или куспиды домов в этом знаке).', 102, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.sign.cancer.present' AND locale = 'ru-RU' AND (topic_category = 'strengths_weaknesses')
);

UPDATE knowledge_items
SET text = 'Тема «Сильные стороны»: заметен акцент знака «Лев». Это добавляет стилю проявления темы качества «Лев» (через личные планеты, углы или куспиды домов в этом знаке).', priority = 102, is_active = 1, meta_json = '{}'
WHERE key = 'natal.sign.leo.present' AND locale = 'ru-RU' AND (topic_category = 'strengths_weaknesses');

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.sign.leo.present', 'strengths_weaknesses', 'ru-RU', 'Тема «Сильные стороны»: заметен акцент знака «Лев». Это добавляет стилю проявления темы качества «Лев» (через личные планеты, углы или куспиды домов в этом знаке).', 102, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.sign.leo.present' AND locale = 'ru-RU' AND (topic_category = 'strengths_weaknesses')
);

UPDATE knowledge_items
SET text = 'Тема «Сильные стороны»: заметен акцент знака «Дева». Это добавляет стилю проявления темы качества «Дева» (через личные планеты, углы или куспиды домов в этом знаке).', priority = 102, is_active = 1, meta_json = '{}'
WHERE key = 'natal.sign.virgo.present' AND locale = 'ru-RU' AND (topic_category = 'strengths_weaknesses');

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.sign.virgo.present', 'strengths_weaknesses', 'ru-RU', 'Тема «Сильные стороны»: заметен акцент знака «Дева». Это добавляет стилю проявления темы качества «Дева» (через личные планеты, углы или куспиды домов в этом знаке).', 102, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.sign.virgo.present' AND locale = 'ru-RU' AND (topic_category = 'strengths_weaknesses')
);

UPDATE knowledge_items
SET text = 'Тема «Сильные стороны»: заметен акцент знака «Весы». Это добавляет стилю проявления темы качества «Весы» (через личные планеты, углы или куспиды домов в этом знаке).', priority = 102, is_active = 1, meta_json = '{}'
WHERE key = 'natal.sign.libra.present' AND locale = 'ru-RU' AND (topic_category = 'strengths_weaknesses');

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.sign.libra.present', 'strengths_weaknesses', 'ru-RU', 'Тема «Сильные стороны»: заметен акцент знака «Весы». Это добавляет стилю проявления темы качества «Весы» (через личные планеты, углы или куспиды домов в этом знаке).', 102, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.sign.libra.present' AND locale = 'ru-RU' AND (topic_category = 'strengths_weaknesses')
);

UPDATE knowledge_items
SET text = 'Тема «Сильные стороны»: заметен акцент знака «Скорпион». Это добавляет стилю проявления темы качества «Скорпион» (через личные планеты, углы или куспиды домов в этом знаке).', priority = 102, is_active = 1, meta_json = '{}'
WHERE key = 'natal.sign.scorpio.present' AND locale = 'ru-RU' AND (topic_category = 'strengths_weaknesses');

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.sign.scorpio.present', 'strengths_weaknesses', 'ru-RU', 'Тема «Сильные стороны»: заметен акцент знака «Скорпион». Это добавляет стилю проявления темы качества «Скорпион» (через личные планеты, углы или куспиды домов в этом знаке).', 102, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.sign.scorpio.present' AND locale = 'ru-RU' AND (topic_category = 'strengths_weaknesses')
);

UPDATE knowledge_items
SET text = 'Тема «Сильные стороны»: заметен акцент знака «Стрелец». Это добавляет стилю проявления темы качества «Стрелец» (через личные планеты, углы или куспиды домов в этом знаке).', priority = 102, is_active = 1, meta_json = '{}'
WHERE key = 'natal.sign.sagittarius.present' AND locale = 'ru-RU' AND (topic_category = 'strengths_weaknesses');

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.sign.sagittarius.present', 'strengths_weaknesses', 'ru-RU', 'Тема «Сильные стороны»: заметен акцент знака «Стрелец». Это добавляет стилю проявления темы качества «Стрелец» (через личные планеты, углы или куспиды домов в этом знаке).', 102, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.sign.sagittarius.present' AND locale = 'ru-RU' AND (topic_category = 'strengths_weaknesses')
);

UPDATE knowledge_items
SET text = 'Тема «Сильные стороны»: заметен акцент знака «Козерог». Это добавляет стилю проявления темы качества «Козерог» (через личные планеты, углы или куспиды домов в этом знаке).', priority = 102, is_active = 1, meta_json = '{}'
WHERE key = 'natal.sign.capricorn.present' AND locale = 'ru-RU' AND (topic_category = 'strengths_weaknesses');

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.sign.capricorn.present', 'strengths_weaknesses', 'ru-RU', 'Тема «Сильные стороны»: заметен акцент знака «Козерог». Это добавляет стилю проявления темы качества «Козерог» (через личные планеты, углы или куспиды домов в этом знаке).', 102, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.sign.capricorn.present' AND locale = 'ru-RU' AND (topic_category = 'strengths_weaknesses')
);

UPDATE knowledge_items
SET text = 'Тема «Сильные стороны»: заметен акцент знака «Водолей». Это добавляет стилю проявления темы качества «Водолей» (через личные планеты, углы или куспиды домов в этом знаке).', priority = 102, is_active = 1, meta_json = '{}'
WHERE key = 'natal.sign.aquarius.present' AND locale = 'ru-RU' AND (topic_category = 'strengths_weaknesses');

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.sign.aquarius.present', 'strengths_weaknesses', 'ru-RU', 'Тема «Сильные стороны»: заметен акцент знака «Водолей». Это добавляет стилю проявления темы качества «Водолей» (через личные планеты, углы или куспиды домов в этом знаке).', 102, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.sign.aquarius.present' AND locale = 'ru-RU' AND (topic_category = 'strengths_weaknesses')
);

UPDATE knowledge_items
SET text = 'Тема «Сильные стороны»: заметен акцент знака «Рыбы». Это добавляет стилю проявления темы качества «Рыбы» (через личные планеты, углы или куспиды домов в этом знаке).', priority = 102, is_active = 1, meta_json = '{}'
WHERE key = 'natal.sign.pisces.present' AND locale = 'ru-RU' AND (topic_category = 'strengths_weaknesses');

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.sign.pisces.present', 'strengths_weaknesses', 'ru-RU', 'Тема «Сильные стороны»: заметен акцент знака «Рыбы». Это добавляет стилю проявления темы качества «Рыбы» (через личные планеты, углы или куспиды домов в этом знаке).', 102, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.sign.pisces.present' AND locale = 'ru-RU' AND (topic_category = 'strengths_weaknesses')
);

UPDATE knowledge_items
SET text = 'Тема «Таланты»: заметен акцент знака «Овен». Это добавляет стилю проявления темы качества «Овен» (через личные планеты, углы или куспиды домов в этом знаке).', priority = 102, is_active = 1, meta_json = '{}'
WHERE key = 'natal.sign.aries.present' AND locale = 'ru-RU' AND (topic_category = 'talents');

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.sign.aries.present', 'talents', 'ru-RU', 'Тема «Таланты»: заметен акцент знака «Овен». Это добавляет стилю проявления темы качества «Овен» (через личные планеты, углы или куспиды домов в этом знаке).', 102, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.sign.aries.present' AND locale = 'ru-RU' AND (topic_category = 'talents')
);

UPDATE knowledge_items
SET text = 'Тема «Таланты»: заметен акцент знака «Телец». Это добавляет стилю проявления темы качества «Телец» (через личные планеты, углы или куспиды домов в этом знаке).', priority = 102, is_active = 1, meta_json = '{}'
WHERE key = 'natal.sign.taurus.present' AND locale = 'ru-RU' AND (topic_category = 'talents');

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.sign.taurus.present', 'talents', 'ru-RU', 'Тема «Таланты»: заметен акцент знака «Телец». Это добавляет стилю проявления темы качества «Телец» (через личные планеты, углы или куспиды домов в этом знаке).', 102, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.sign.taurus.present' AND locale = 'ru-RU' AND (topic_category = 'talents')
);

UPDATE knowledge_items
SET text = 'Тема «Таланты»: заметен акцент знака «Близнецы». Это добавляет стилю проявления темы качества «Близнецы» (через личные планеты, углы или куспиды домов в этом знаке).', priority = 102, is_active = 1, meta_json = '{}'
WHERE key = 'natal.sign.gemini.present' AND locale = 'ru-RU' AND (topic_category = 'talents');

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.sign.gemini.present', 'talents', 'ru-RU', 'Тема «Таланты»: заметен акцент знака «Близнецы». Это добавляет стилю проявления темы качества «Близнецы» (через личные планеты, углы или куспиды домов в этом знаке).', 102, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.sign.gemini.present' AND locale = 'ru-RU' AND (topic_category = 'talents')
);

UPDATE knowledge_items
SET text = 'Тема «Таланты»: заметен акцент знака «Рак». Это добавляет стилю проявления темы качества «Рак» (через личные планеты, углы или куспиды домов в этом знаке).', priority = 102, is_active = 1, meta_json = '{}'
WHERE key = 'natal.sign.cancer.present' AND locale = 'ru-RU' AND (topic_category = 'talents');

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.sign.cancer.present', 'talents', 'ru-RU', 'Тема «Таланты»: заметен акцент знака «Рак». Это добавляет стилю проявления темы качества «Рак» (через личные планеты, углы или куспиды домов в этом знаке).', 102, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.sign.cancer.present' AND locale = 'ru-RU' AND (topic_category = 'talents')
);

UPDATE knowledge_items
SET text = 'Тема «Таланты»: заметен акцент знака «Лев». Это добавляет стилю проявления темы качества «Лев» (через личные планеты, углы или куспиды домов в этом знаке).', priority = 102, is_active = 1, meta_json = '{}'
WHERE key = 'natal.sign.leo.present' AND locale = 'ru-RU' AND (topic_category = 'talents');

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.sign.leo.present', 'talents', 'ru-RU', 'Тема «Таланты»: заметен акцент знака «Лев». Это добавляет стилю проявления темы качества «Лев» (через личные планеты, углы или куспиды домов в этом знаке).', 102, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.sign.leo.present' AND locale = 'ru-RU' AND (topic_category = 'talents')
);

UPDATE knowledge_items
SET text = 'Тема «Таланты»: заметен акцент знака «Дева». Это добавляет стилю проявления темы качества «Дева» (через личные планеты, углы или куспиды домов в этом знаке).', priority = 102, is_active = 1, meta_json = '{}'
WHERE key = 'natal.sign.virgo.present' AND locale = 'ru-RU' AND (topic_category = 'talents');

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.sign.virgo.present', 'talents', 'ru-RU', 'Тема «Таланты»: заметен акцент знака «Дева». Это добавляет стилю проявления темы качества «Дева» (через личные планеты, углы или куспиды домов в этом знаке).', 102, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.sign.virgo.present' AND locale = 'ru-RU' AND (topic_category = 'talents')
);

UPDATE knowledge_items
SET text = 'Тема «Таланты»: заметен акцент знака «Весы». Это добавляет стилю проявления темы качества «Весы» (через личные планеты, углы или куспиды домов в этом знаке).', priority = 102, is_active = 1, meta_json = '{}'
WHERE key = 'natal.sign.libra.present' AND locale = 'ru-RU' AND (topic_category = 'talents');

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.sign.libra.present', 'talents', 'ru-RU', 'Тема «Таланты»: заметен акцент знака «Весы». Это добавляет стилю проявления темы качества «Весы» (через личные планеты, углы или куспиды домов в этом знаке).', 102, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.sign.libra.present' AND locale = 'ru-RU' AND (topic_category = 'talents')
);

UPDATE knowledge_items
SET text = 'Тема «Таланты»: заметен акцент знака «Скорпион». Это добавляет стилю проявления темы качества «Скорпион» (через личные планеты, углы или куспиды домов в этом знаке).', priority = 102, is_active = 1, meta_json = '{}'
WHERE key = 'natal.sign.scorpio.present' AND locale = 'ru-RU' AND (topic_category = 'talents');

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.sign.scorpio.present', 'talents', 'ru-RU', 'Тема «Таланты»: заметен акцент знака «Скорпион». Это добавляет стилю проявления темы качества «Скорпион» (через личные планеты, углы или куспиды домов в этом знаке).', 102, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.sign.scorpio.present' AND locale = 'ru-RU' AND (topic_category = 'talents')
);

UPDATE knowledge_items
SET text = 'Тема «Таланты»: заметен акцент знака «Стрелец». Это добавляет стилю проявления темы качества «Стрелец» (через личные планеты, углы или куспиды домов в этом знаке).', priority = 102, is_active = 1, meta_json = '{}'
WHERE key = 'natal.sign.sagittarius.present' AND locale = 'ru-RU' AND (topic_category = 'talents');

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.sign.sagittarius.present', 'talents', 'ru-RU', 'Тема «Таланты»: заметен акцент знака «Стрелец». Это добавляет стилю проявления темы качества «Стрелец» (через личные планеты, углы или куспиды домов в этом знаке).', 102, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.sign.sagittarius.present' AND locale = 'ru-RU' AND (topic_category = 'talents')
);

UPDATE knowledge_items
SET text = 'Тема «Таланты»: заметен акцент знака «Козерог». Это добавляет стилю проявления темы качества «Козерог» (через личные планеты, углы или куспиды домов в этом знаке).', priority = 102, is_active = 1, meta_json = '{}'
WHERE key = 'natal.sign.capricorn.present' AND locale = 'ru-RU' AND (topic_category = 'talents');

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.sign.capricorn.present', 'talents', 'ru-RU', 'Тема «Таланты»: заметен акцент знака «Козерог». Это добавляет стилю проявления темы качества «Козерог» (через личные планеты, углы или куспиды домов в этом знаке).', 102, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.sign.capricorn.present' AND locale = 'ru-RU' AND (topic_category = 'talents')
);

UPDATE knowledge_items
SET text = 'Тема «Таланты»: заметен акцент знака «Водолей». Это добавляет стилю проявления темы качества «Водолей» (через личные планеты, углы или куспиды домов в этом знаке).', priority = 102, is_active = 1, meta_json = '{}'
WHERE key = 'natal.sign.aquarius.present' AND locale = 'ru-RU' AND (topic_category = 'talents');

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.sign.aquarius.present', 'talents', 'ru-RU', 'Тема «Таланты»: заметен акцент знака «Водолей». Это добавляет стилю проявления темы качества «Водолей» (через личные планеты, углы или куспиды домов в этом знаке).', 102, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.sign.aquarius.present' AND locale = 'ru-RU' AND (topic_category = 'talents')
);

UPDATE knowledge_items
SET text = 'Тема «Таланты»: заметен акцент знака «Рыбы». Это добавляет стилю проявления темы качества «Рыбы» (через личные планеты, углы или куспиды домов в этом знаке).', priority = 102, is_active = 1, meta_json = '{}'
WHERE key = 'natal.sign.pisces.present' AND locale = 'ru-RU' AND (topic_category = 'talents');

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.sign.pisces.present', 'talents', 'ru-RU', 'Тема «Таланты»: заметен акцент знака «Рыбы». Это добавляет стилю проявления темы качества «Рыбы» (через личные планеты, углы или куспиды домов в этом знаке).', 102, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.sign.pisces.present' AND locale = 'ru-RU' AND (topic_category = 'talents')
);

COMMIT;

