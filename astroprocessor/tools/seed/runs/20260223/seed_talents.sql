-- AUTO-GENERATED. DO NOT EDIT BY HAND.
-- Overrides from debug shortest used blocks (topic_category=talents)
-- Source JSON: C:/Projects/superastro/debug/debug_talents_ru_160_20260223_125310_mini_focus.json
-- Filter: len(text)<= 420, max_keys=200

BEGIN;

INSERT INTO knowledge_items(key, topic_category, locale, text, is_active, priority, meta_json, created_at, updated_at)
VALUES('natal.planets.group.luminaries.count.2', 'talents', 'ru-RU', 'Группа планет «luminaries»: количество = 2. Это отражает распределение внимания по задачам. Практика: выбери 1 группу и усили её через конкретный навык на неделю.', 1, 140, '{}', datetime('now'), CAST(strftime('%s','now') AS INTEGER))
ON CONFLICT(key, topic_category, locale) DO UPDATE SET
  text=excluded.text,
  is_active=excluded.is_active,
  priority=excluded.priority,
  meta_json=COALESCE(excluded.meta_json, knowledge_items.meta_json),
  updated_at=excluded.updated_at;

INSERT INTO knowledge_items(key, topic_category, locale, text, is_active, priority, meta_json, created_at, updated_at)
VALUES('natal.planets.group.inner.count.3', 'talents', 'ru-RU', 'Группа планет «inner»: количество = 3. Это отражает распределение внимания по задачам. Практика: выбери 1 группу и усили её через конкретный навык на неделю.', 1, 140, '{}', datetime('now'), CAST(strftime('%s','now') AS INTEGER))
ON CONFLICT(key, topic_category, locale) DO UPDATE SET
  text=excluded.text,
  is_active=excluded.is_active,
  priority=excluded.priority,
  meta_json=COALESCE(excluded.meta_json, knowledge_items.meta_json),
  updated_at=excluded.updated_at;

INSERT INTO knowledge_items(key, topic_category, locale, text, is_active, priority, meta_json, created_at, updated_at)
VALUES('natal.planets.group.outer.count.3', 'talents', 'ru-RU', 'Группа планет «outer»: количество = 3. Это отражает распределение внимания по задачам. Практика: выбери 1 группу и усили её через конкретный навык на неделю.', 1, 140, '{}', datetime('now'), CAST(strftime('%s','now') AS INTEGER))
ON CONFLICT(key, topic_category, locale) DO UPDATE SET
  text=excluded.text,
  is_active=excluded.is_active,
  priority=excluded.priority,
  meta_json=COALESCE(excluded.meta_json, knowledge_items.meta_json),
  updated_at=excluded.updated_at;

INSERT INTO knowledge_items(key, topic_category, locale, text, is_active, priority, meta_json, created_at, updated_at)
VALUES('natal.planets.group.social.count.2', 'talents', 'ru-RU', 'Группа планет «social»: количество = 2. Это отражает распределение внимания по задачам. Практика: выбери 1 группу и усили её через конкретный навык на неделю.', 1, 140, '{}', datetime('now'), CAST(strftime('%s','now') AS INTEGER))
ON CONFLICT(key, topic_category, locale) DO UPDATE SET
  text=excluded.text,
  is_active=excluded.is_active,
  priority=excluded.priority,
  meta_json=COALESCE(excluded.meta_json, knowledge_items.meta_json),
  updated_at=excluded.updated_at;

INSERT INTO knowledge_items(key, topic_category, locale, text, is_active, priority, meta_json, created_at, updated_at)
VALUES('natal.planet.jupiter.sign.cancer.house.7', 'talents', 'ru-RU', 'Юпитер в Рак в 7-й дом (партнёрство): это описывает, как функция планеты проявляется в задачах дома. Практика: выбери 1 ситуацию по теме дома и проверь, что будет, если проявить качество знака более осознанно.', 1, 140, '{}', datetime('now'), CAST(strftime('%s','now') AS INTEGER))
ON CONFLICT(key, topic_category, locale) DO UPDATE SET
  text=excluded.text,
  is_active=excluded.is_active,
  priority=excluded.priority,
  meta_json=COALESCE(excluded.meta_json, knowledge_items.meta_json),
  updated_at=excluded.updated_at;

INSERT INTO knowledge_items(key, topic_category, locale, text, is_active, priority, meta_json, created_at, updated_at)
VALUES('natal.planet.moon.sign.aquarius.house.2', 'talents', 'ru-RU', 'Луна в Водолей в 2-й дом (деньги и самооценка): это описывает, как функция планеты проявляется в задачах дома. Практика: выбери 1 ситуацию по теме дома и проверь, что будет, если проявить качество знака более осознанно.', 1, 140, '{}', datetime('now'), CAST(strftime('%s','now') AS INTEGER))
ON CONFLICT(key, topic_category, locale) DO UPDATE SET
  text=excluded.text,
  is_active=excluded.is_active,
  priority=excluded.priority,
  meta_json=COALESCE(excluded.meta_json, knowledge_items.meta_json),
  updated_at=excluded.updated_at;

INSERT INTO knowledge_items(key, topic_category, locale, text, is_active, priority, meta_json, created_at, updated_at)
VALUES('natal.planet.uranus.sign.capricorn.house.1', 'talents', 'ru-RU', 'Уран в Козерог в 1-й дом (личность и проявление): это описывает, как функция планеты проявляется в задачах дома. Практика: выбери 1 ситуацию по теме дома и проверь, что будет, если проявить качество знака более осознанно.', 1, 140, '{}', datetime('now'), CAST(strftime('%s','now') AS INTEGER))
ON CONFLICT(key, topic_category, locale) DO UPDATE SET
  text=excluded.text,
  is_active=excluded.is_active,
  priority=excluded.priority,
  meta_json=COALESCE(excluded.meta_json, knowledge_items.meta_json),
  updated_at=excluded.updated_at;

INSERT INTO knowledge_items(key, topic_category, locale, text, is_active, priority, meta_json, created_at, updated_at)
VALUES('natal.planet.mars.sign.sagittarius.house.12', 'talents', 'ru-RU', 'Марс в Стрелец в 12-й дом (подсознание и восстановление): это описывает, как функция планеты проявляется в задачах дома. Практика: выбери 1 ситуацию по теме дома и проверь, что будет, если проявить качество знака более осознанно.', 1, 140, '{}', datetime('now'), CAST(strftime('%s','now') AS INTEGER))
ON CONFLICT(key, topic_category, locale) DO UPDATE SET
  text=excluded.text,
  is_active=excluded.is_active,
  priority=excluded.priority,
  meta_json=COALESCE(excluded.meta_json, knowledge_items.meta_json),
  updated_at=excluded.updated_at;

INSERT INTO knowledge_items(key, topic_category, locale, text, is_active, priority, meta_json, created_at, updated_at)
VALUES('natal.planet.neptune.sign.capricorn.house.1', 'talents', 'ru-RU', 'Нептун в Козерог в 1-й дом (личность и проявление): это описывает, как функция планеты проявляется в задачах дома. Практика: выбери 1 ситуацию по теме дома и проверь, что будет, если проявить качество знака более осознанно.', 1, 140, '{}', datetime('now'), CAST(strftime('%s','now') AS INTEGER))
ON CONFLICT(key, topic_category, locale) DO UPDATE SET
  text=excluded.text,
  is_active=excluded.is_active,
  priority=excluded.priority,
  meta_json=COALESCE(excluded.meta_json, knowledge_items.meta_json),
  updated_at=excluded.updated_at;

INSERT INTO knowledge_items(key, topic_category, locale, text, is_active, priority, meta_json, created_at, updated_at)
VALUES('natal.planet.saturn.sign.capricorn.house.1', 'talents', 'ru-RU', 'Сатурн в Козерог в 1-й дом (личность и проявление): это описывает, как функция планеты проявляется в задачах дома. Практика: выбери 1 ситуацию по теме дома и проверь, что будет, если проявить качество знака более осознанно.', 1, 140, '{}', datetime('now'), CAST(strftime('%s','now') AS INTEGER))
ON CONFLICT(key, topic_category, locale) DO UPDATE SET
  text=excluded.text,
  is_active=excluded.is_active,
  priority=excluded.priority,
  meta_json=COALESCE(excluded.meta_json, knowledge_items.meta_json),
  updated_at=excluded.updated_at;

INSERT INTO knowledge_items(key, topic_category, locale, text, is_active, priority, meta_json, created_at, updated_at)
VALUES('natal.planet.sun.sign.capricorn.house.1', 'talents', 'ru-RU', 'Солнце в Козерог в 1-й дом (личность и проявление): это описывает, как функция планеты проявляется в задачах дома. Практика: выбери 1 ситуацию по теме дома и проверь, что будет, если проявить качество знака более осознанно.', 1, 140, '{}', datetime('now'), CAST(strftime('%s','now') AS INTEGER))
ON CONFLICT(key, topic_category, locale) DO UPDATE SET
  text=excluded.text,
  is_active=excluded.is_active,
  priority=excluded.priority,
  meta_json=COALESCE(excluded.meta_json, knowledge_items.meta_json),
  updated_at=excluded.updated_at;

INSERT INTO knowledge_items(key, topic_category, locale, text, is_active, priority, meta_json, created_at, updated_at)
VALUES('natal.planet.venus.sign.aquarius.house.2', 'talents', 'ru-RU', 'Венера в Водолей в 2-й дом (деньги и самооценка): это описывает, как функция планеты проявляется в задачах дома. Практика: выбери 1 ситуацию по теме дома и проверь, что будет, если проявить качество знака более осознанно.', 1, 140, '{}', datetime('now'), CAST(strftime('%s','now') AS INTEGER))
ON CONFLICT(key, topic_category, locale) DO UPDATE SET
  text=excluded.text,
  is_active=excluded.is_active,
  priority=excluded.priority,
  meta_json=COALESCE(excluded.meta_json, knowledge_items.meta_json),
  updated_at=excluded.updated_at;

INSERT INTO knowledge_items(key, topic_category, locale, text, is_active, priority, meta_json, created_at, updated_at)
VALUES('natal.planet.mercury.sign.capricorn.house.1', 'talents', 'ru-RU', 'Меркурий в Козерог в 1-й дом (личность и проявление): это описывает, как функция планеты проявляется в задачах дома. Практика: выбери 1 ситуацию по теме дома и проверь, что будет, если проявить качество знака более осознанно.', 1, 140, '{}', datetime('now'), CAST(strftime('%s','now') AS INTEGER))
ON CONFLICT(key, topic_category, locale) DO UPDATE SET
  text=excluded.text,
  is_active=excluded.is_active,
  priority=excluded.priority,
  meta_json=COALESCE(excluded.meta_json, knowledge_items.meta_json),
  updated_at=excluded.updated_at;

INSERT INTO knowledge_items(key, topic_category, locale, text, is_active, priority, meta_json, created_at, updated_at)
VALUES('natal.planet.pluto.sign.scorpio.house.11', 'talents', 'ru-RU', 'Плутон в Скорпион в 11-й дом (сообщества и цели): это описывает, как функция планеты проявляется в задачах дома. Практика: выбери 1 ситуацию по теме дома и проверь, что будет, если проявить качество знака более осознанно.', 1, 140, '{}', datetime('now'), CAST(strftime('%s','now') AS INTEGER))
ON CONFLICT(key, topic_category, locale) DO UPDATE SET
  text=excluded.text,
  is_active=excluded.is_active,
  priority=excluded.priority,
  meta_json=COALESCE(excluded.meta_json, knowledge_items.meta_json),
  updated_at=excluded.updated_at;

INSERT INTO knowledge_items(key, topic_category, locale, text, is_active, priority, meta_json, created_at, updated_at)
VALUES('natal.aspect.mars.sextile.venus', 'talents', 'ru-RU', 'Аспект Марс секстиле Венера: взаимодействие функций. Обычно это даёт ресурс и проще превращается в навык/результат. Практика: опиши 1 повторяющийся сценарий (триггер → реакция → результат) и заранее задай правило поведения.', 1, 140, '{}', datetime('now'), CAST(strftime('%s','now') AS INTEGER))
ON CONFLICT(key, topic_category, locale) DO UPDATE SET
  text=excluded.text,
  is_active=excluded.is_active,
  priority=excluded.priority,
  meta_json=COALESCE(excluded.meta_json, knowledge_items.meta_json),
  updated_at=excluded.updated_at;

INSERT INTO knowledge_items(key, topic_category, locale, text, is_active, priority, meta_json, created_at, updated_at)
VALUES('natal.aspect.jupiter.opposition.uranus', 'talents', 'ru-RU', 'Аспект Юпитер оппозиции Уран: взаимодействие функций. Обычно это даёт напряжение и рост: нужно управлять рисками, границами и приоритетами. Практика: опиши 1 повторяющийся сценарий (триггер → реакция → результат) и заранее задай правило поведения.', 1, 140, '{}', datetime('now'), CAST(strftime('%s','now') AS INTEGER))
ON CONFLICT(key, topic_category, locale) DO UPDATE SET
  text=excluded.text,
  is_active=excluded.is_active,
  priority=excluded.priority,
  meta_json=COALESCE(excluded.meta_json, knowledge_items.meta_json),
  updated_at=excluded.updated_at;

INSERT INTO knowledge_items(key, topic_category, locale, text, is_active, priority, meta_json, created_at, updated_at)
VALUES('natal.aspect.neptune.sextile.pluto', 'talents', 'ru-RU', 'Аспект Нептун секстиле Плутон: взаимодействие функций. Обычно это даёт ресурс и проще превращается в навык/результат. Практика: опиши 1 повторяющийся сценарий (триггер → реакция → результат) и заранее задай правило поведения.', 1, 140, '{}', datetime('now'), CAST(strftime('%s','now') AS INTEGER))
ON CONFLICT(key, topic_category, locale) DO UPDATE SET
  text=excluded.text,
  is_active=excluded.is_active,
  priority=excluded.priority,
  meta_json=COALESCE(excluded.meta_json, knowledge_items.meta_json),
  updated_at=excluded.updated_at;

INSERT INTO knowledge_items(key, topic_category, locale, text, is_active, priority, meta_json, created_at, updated_at)
VALUES('natal.aspect.pluto.sextile.saturn', 'talents', 'ru-RU', 'Аспект Плутон секстиле Сатурн: взаимодействие функций. Обычно это даёт ресурс и проще превращается в навык/результат. Практика: опиши 1 повторяющийся сценарий (триггер → реакция → результат) и заранее задай правило поведения.', 1, 140, '{}', datetime('now'), CAST(strftime('%s','now') AS INTEGER))
ON CONFLICT(key, topic_category, locale) DO UPDATE SET
  text=excluded.text,
  is_active=excluded.is_active,
  priority=excluded.priority,
  meta_json=COALESCE(excluded.meta_json, knowledge_items.meta_json),
  updated_at=excluded.updated_at;

INSERT INTO knowledge_items(key, topic_category, locale, text, is_active, priority, meta_json, created_at, updated_at)
VALUES('natal.aspect.sun.conjunction.uranus', 'talents', 'ru-RU', 'Аспект Солнце соединении Уран: взаимодействие функций. Обычно это создаёт сильную сцепку функций: тема становится центральной. Практика: опиши 1 повторяющийся сценарий (триггер → реакция → результат) и заранее задай правило поведения.', 1, 140, '{}', datetime('now'), CAST(strftime('%s','now') AS INTEGER))
ON CONFLICT(key, topic_category, locale) DO UPDATE SET
  text=excluded.text,
  is_active=excluded.is_active,
  priority=excluded.priority,
  meta_json=COALESCE(excluded.meta_json, knowledge_items.meta_json),
  updated_at=excluded.updated_at;

INSERT INTO knowledge_items(key, topic_category, locale, text, is_active, priority, meta_json, created_at, updated_at)
VALUES('natal.aspect.jupiter.opposition.sun', 'talents', 'ru-RU', 'Аспект Юпитер оппозиции Солнце: взаимодействие функций. Обычно это даёт напряжение и рост: нужно управлять рисками, границами и приоритетами. Практика: опиши 1 повторяющийся сценарий (триггер → реакция → результат) и заранее задай правило поведения.', 1, 140, '{}', datetime('now'), CAST(strftime('%s','now') AS INTEGER))
ON CONFLICT(key, topic_category, locale) DO UPDATE SET
  text=excluded.text,
  is_active=excluded.is_active,
  priority=excluded.priority,
  meta_json=COALESCE(excluded.meta_json, knowledge_items.meta_json),
  updated_at=excluded.updated_at;

INSERT INTO knowledge_items(key, topic_category, locale, text, is_active, priority, meta_json, created_at, updated_at)
VALUES('natal.aspect.neptune.conjunction.saturn', 'talents', 'ru-RU', 'Аспект Нептун соединении Сатурн: взаимодействие функций. Обычно это создаёт сильную сцепку функций: тема становится центральной. Практика: опиши 1 повторяющийся сценарий (триггер → реакция → результат) и заранее задай правило поведения.', 1, 140, '{}', datetime('now'), CAST(strftime('%s','now') AS INTEGER))
ON CONFLICT(key, topic_category, locale) DO UPDATE SET
  text=excluded.text,
  is_active=excluded.is_active,
  priority=excluded.priority,
  meta_json=COALESCE(excluded.meta_json, knowledge_items.meta_json),
  updated_at=excluded.updated_at;

INSERT INTO knowledge_items(key, topic_category, locale, text, is_active, priority, meta_json, created_at, updated_at)
VALUES('natal.aspect.neptune.conjunction.sun', 'talents', 'ru-RU', 'Аспект Нептун соединении Солнце: взаимодействие функций. Обычно это создаёт сильную сцепку функций: тема становится центральной. Практика: опиши 1 повторяющийся сценарий (триггер → реакция → результат) и заранее задай правило поведения.', 1, 140, '{}', datetime('now'), CAST(strftime('%s','now') AS INTEGER))
ON CONFLICT(key, topic_category, locale) DO UPDATE SET
  text=excluded.text,
  is_active=excluded.is_active,
  priority=excluded.priority,
  meta_json=COALESCE(excluded.meta_json, knowledge_items.meta_json),
  updated_at=excluded.updated_at;

INSERT INTO knowledge_items(key, topic_category, locale, text, is_active, priority, meta_json, created_at, updated_at)
VALUES('natal.aspect.saturn.conjunction.sun', 'talents', 'ru-RU', 'Аспект Сатурн соединении Солнце: взаимодействие функций. Обычно это создаёт сильную сцепку функций: тема становится центральной. Практика: опиши 1 повторяющийся сценарий (триггер → реакция → результат) и заранее задай правило поведения.', 1, 140, '{}', datetime('now'), CAST(strftime('%s','now') AS INTEGER))
ON CONFLICT(key, topic_category, locale) DO UPDATE SET
  text=excluded.text,
  is_active=excluded.is_active,
  priority=excluded.priority,
  meta_json=COALESCE(excluded.meta_json, knowledge_items.meta_json),
  updated_at=excluded.updated_at;


COMMIT;
