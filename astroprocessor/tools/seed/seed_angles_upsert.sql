@"
BEGIN;

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
VALUES ('natal.angle.mc.sign.any','', 'ru-RU',
        'MC: общий вектор карьеры, амбиций и социальной реализации.',
        110, strftime('%s','now'), 1, '{}')
ON CONFLICT(key, locale, topic_category) DO UPDATE SET
  text=excluded.text,
  priority=excluded.priority,
  is_active=1,
  meta_json=excluded.meta_json;

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
VALUES ('natal.angle.mc.sign.any','career','ru-RU',
        'MC (в теме карьеры): что приносит признание, как вы растёте в статусе и где лучше делать ставку на амбиции.',
        125, strftime('%s','now'), 1, '{}')
ON CONFLICT(key, locale, topic_category) DO UPDATE SET
  text=excluded.text,
  priority=excluded.priority,
  is_active=1,
  meta_json=excluded.meta_json;

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
VALUES ('natal.angle.dsc.sign.any','', 'ru-RU',
        'DSC: образ партнёрства, тип притяжения и то, что вы ищете во взаимодействии я-мы.',
        110, strftime('%s','now'), 1, '{}')
ON CONFLICT(key, locale, topic_category) DO UPDATE SET
  text=excluded.text,
  priority=excluded.priority,
  is_active=1,
  meta_json=excluded.meta_json;

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
VALUES ('natal.angle.dsc.sign.any','love_intimacy','ru-RU',
        'DSC (в теме любви): какой партнёрский стиль усиливает близость и какие сценарии отношений включаются сильнее всего.',
        125, strftime('%s','now'), 1, '{}')
ON CONFLICT(key, locale, topic_category) DO UPDATE SET
  text=excluded.text,
  priority=excluded.priority,
  is_active=1,
  meta_json=excluded.meta_json;

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
VALUES ('natal.angle.dsc.sign.any','partnership_marriage','ru-RU',
        'DSC (в теме брака): какие качества важны для долгосрочного союза и где нужны договорённости и ответственность.',
        125, strftime('%s','now'), 1, '{}')
ON CONFLICT(key, locale, topic_category) DO UPDATE SET
  text=excluded.text,
  priority=excluded.priority,
  is_active=1,
  meta_json=excluded.meta_json;

COMMIT;
"@ | Set-Content -Encoding UTF8 .\tools\seed\seed_angles_upsert.sql