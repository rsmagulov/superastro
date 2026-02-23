-- AUTO-GENERATED. DO NOT EDIT BY HAND.

-- Career overrides from debug shortest used blocks (topic_category=personality_core)

-- Source JSON: C:/Projects/superastro/debug_personality_core_ru_160_20260223_125210_mini_focus.json

-- Filter: len(text)<= 450, max_keys=200

BEGIN;

UPDATE knowledge_items
SET text = 'Группа планет: светила (Солнце+Луна) (кол-во = 2). В карьере это показывает, какая подсистема чаще ведёт решения: мотивация, направление и выгорание/ресурс. Практика: проверь, поддерживает ли текущая роль эту подсистему (формат задач, KPI, уровень ответственности). Если нет — добавь компенсатор: процесс, партнёр в команде или смена фокуса проекта.', is_active = 1, priority = 140, meta_json = '{}'
WHERE key = 'natal.planets.group.luminaries.count.2' AND locale = 'ru-RU' AND topic_category = 'personality_core';

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.planets.group.luminaries.count.2', 'personality_core', 'ru-RU', 'Группа планет: светила (Солнце+Луна) (кол-во = 2). В карьере это показывает, какая подсистема чаще ведёт решения: мотивация, направление и выгорание/ресурс. Практика: проверь, поддерживает ли текущая роль эту подсистему (формат задач, KPI, уровень ответственности). Если нет — добавь компенсатор: процесс, партнёр в команде или смена фокуса проекта.', 140, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.planets.group.luminaries.count.2' AND locale = 'ru-RU' AND topic_category = 'personality_core'
);

UPDATE knowledge_items
SET text = 'Группа планет: личные (Меркурий/Венера/Марс) (кол-во = 3). В карьере это показывает, какая подсистема чаще ведёт решения: навыки, сделки, коммуникации и скорость выполнения. Практика: проверь, поддерживает ли текущая роль эту подсистему (формат задач, KPI, уровень ответственности). Если нет — добавь компенсатор: процесс, партнёр в команде или смена фокуса проекта.', is_active = 1, priority = 140, meta_json = '{}'
WHERE key = 'natal.planets.group.inner.count.3' AND locale = 'ru-RU' AND topic_category = 'personality_core';

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.planets.group.inner.count.3', 'personality_core', 'ru-RU', 'Группа планет: личные (Меркурий/Венера/Марс) (кол-во = 3). В карьере это показывает, какая подсистема чаще ведёт решения: навыки, сделки, коммуникации и скорость выполнения. Практика: проверь, поддерживает ли текущая роль эту подсистему (формат задач, KPI, уровень ответственности). Если нет — добавь компенсатор: процесс, партнёр в команде или смена фокуса проекта.', 140, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.planets.group.inner.count.3' AND locale = 'ru-RU' AND topic_category = 'personality_core'
);

UPDATE knowledge_items
SET text = 'Группа планет: высшие (Уран/Нептун/Плутон) (кол-во = 3). В карьере это показывает, какая подсистема чаще ведёт решения: инновации, стратегия, изменения и работа с неопределённостью. Практика: проверь, поддерживает ли текущая роль эту подсистему (формат задач, KPI, уровень ответственности). Если нет — добавь компенсатор: процесс, партнёр в команде или смена фокуса проекта.', is_active = 1, priority = 140, meta_json = '{}'
WHERE key = 'natal.planets.group.outer.count.3' AND locale = 'ru-RU' AND topic_category = 'personality_core';

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.planets.group.outer.count.3', 'personality_core', 'ru-RU', 'Группа планет: высшие (Уран/Нептун/Плутон) (кол-во = 3). В карьере это показывает, какая подсистема чаще ведёт решения: инновации, стратегия, изменения и работа с неопределённостью. Практика: проверь, поддерживает ли текущая роль эту подсистему (формат задач, KPI, уровень ответственности). Если нет — добавь компенсатор: процесс, партнёр в команде или смена фокуса проекта.', 140, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.planets.group.outer.count.3' AND locale = 'ru-RU' AND topic_category = 'personality_core'
);

UPDATE knowledge_items
SET text = 'Группа планет: социальные (Юпитер/Сатурн) (кол-во = 2). В карьере это показывает, какая подсистема чаще ведёт решения: структура, статус, правила и управляемый рост. Практика: проверь, поддерживает ли текущая роль эту подсистему (формат задач, KPI, уровень ответственности). Если нет — добавь компенсатор: процесс, партнёр в команде или смена фокуса проекта.', is_active = 1, priority = 140, meta_json = '{}'
WHERE key = 'natal.planets.group.social.count.2' AND locale = 'ru-RU' AND topic_category = 'personality_core';

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.planets.group.social.count.2', 'personality_core', 'ru-RU', 'Группа планет: социальные (Юпитер/Сатурн) (кол-во = 2). В карьере это показывает, какая подсистема чаще ведёт решения: структура, статус, правила и управляемый рост. Практика: проверь, поддерживает ли текущая роль эту подсистему (формат задач, KPI, уровень ответственности). Если нет — добавь компенсатор: процесс, партнёр в команде или смена фокуса проекта.', 140, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.planets.group.social.count.2' AND locale = 'ru-RU' AND topic_category = 'personality_core'
);

UPDATE knowledge_items
SET text = 'Луна в Водолее во 2-м доме: деньги через нестандарт, технологии, сеть и ценность «по-новому». Важно не только заработать, но и иметь свободу/смысл в монетизации. Луна: доход зависит от ощущения безопасности; возможны колебания. Практика: введи финансовый буфер и стабильную систему учёта, чтобы ресурс не «качало».', is_active = 1, priority = 140, meta_json = '{}'
WHERE key = 'natal.planet.moon.sign.aquarius.house.2' AND locale = 'ru-RU' AND topic_category = 'personality_core';

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.planet.moon.sign.aquarius.house.2', 'personality_core', 'ru-RU', 'Луна в Водолее во 2-м доме: деньги через нестандарт, технологии, сеть и ценность «по-новому». Важно не только заработать, но и иметь свободу/смысл в монетизации. Луна: доход зависит от ощущения безопасности; возможны колебания. Практика: введи финансовый буфер и стабильную систему учёта, чтобы ресурс не «качало».', 140, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.planet.moon.sign.aquarius.house.2' AND locale = 'ru-RU' AND topic_category = 'personality_core'
);

UPDATE knowledge_items
SET text = 'Марс в Стрельце в 12-м доме: энергия уходит в закулисье — исследование, подготовку, смысловые проекты. Сильны работа «в тишине», обучение, дальние цели. Риск — выгорание и скрытая раздражительность. Практика: планируй нагрузку циклами (спринт/восстановление) и выноси результат наружу маленькими релизами.', is_active = 1, priority = 140, meta_json = '{}'
WHERE key = 'natal.planet.mars.sign.sagittarius.house.12' AND locale = 'ru-RU' AND topic_category = 'personality_core';

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.planet.mars.sign.sagittarius.house.12', 'personality_core', 'ru-RU', 'Марс в Стрельце в 12-м доме: энергия уходит в закулисье — исследование, подготовку, смысловые проекты. Сильны работа «в тишине», обучение, дальние цели. Риск — выгорание и скрытая раздражительность. Практика: планируй нагрузку циклами (спринт/восстановление) и выноси результат наружу маленькими релизами.', 140, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.planet.mars.sign.sagittarius.house.12' AND locale = 'ru-RU' AND topic_category = 'personality_core'
);

UPDATE knowledge_items
SET text = 'Солнце в Козероге в 1-м доме: карьерный стиль «собранность, ответственность, результат». Сильная ставка на репутацию, статус и долгий цикл. Риск — жёсткость и перегруз. Солнце здесь усиливает лидерство через пример: тебя считывают как опору. Практика: формализуй роль (зона ответственности, KPI) и веди портфолио результатов.', is_active = 1, priority = 140, meta_json = '{}'
WHERE key = 'natal.planet.sun.sign.capricorn.house.1' AND locale = 'ru-RU' AND topic_category = 'personality_core';

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.planet.sun.sign.capricorn.house.1', 'personality_core', 'ru-RU', 'Солнце в Козероге в 1-м доме: карьерный стиль «собранность, ответственность, результат». Сильная ставка на репутацию, статус и долгий цикл. Риск — жёсткость и перегруз. Солнце здесь усиливает лидерство через пример: тебя считывают как опору. Практика: формализуй роль (зона ответственности, KPI) и веди портфолио результатов.', 140, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.planet.sun.sign.capricorn.house.1' AND locale = 'ru-RU' AND topic_category = 'personality_core'
);

UPDATE knowledge_items
SET text = 'Венера в Водолее во 2-м доме: деньги через нестандарт, технологии, сеть и ценность «по-новому». Важно не только заработать, но и иметь свободу/смысл в монетизации. Венера: монетизация через вкус, упаковку ценности, отношения и договорённости. Практика: прокачай позиционирование (оффер, прайс, кейсы) и держи прозрачные правила оплаты.', is_active = 1, priority = 140, meta_json = '{}'
WHERE key = 'natal.planet.venus.sign.aquarius.house.2' AND locale = 'ru-RU' AND topic_category = 'personality_core';

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.planet.venus.sign.aquarius.house.2', 'personality_core', 'ru-RU', 'Венера в Водолее во 2-м доме: деньги через нестандарт, технологии, сеть и ценность «по-новому». Важно не только заработать, но и иметь свободу/смысл в монетизации. Венера: монетизация через вкус, упаковку ценности, отношения и договорённости. Практика: прокачай позиционирование (оффер, прайс, кейсы) и держи прозрачные правила оплаты.', 140, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.planet.venus.sign.aquarius.house.2' AND locale = 'ru-RU' AND topic_category = 'personality_core'
);

UPDATE knowledge_items
SET text = 'Меркурий в Козероге в 1-м доме: карьерный стиль «собранность, ответственность, результат». Сильная ставка на репутацию, статус и долгий цикл. Риск — жёсткость и перегруз. Меркурий: сильны стратегия, документы, аналитика и переговоры «по фактам». Практика: стандартизируй коммуникации (шаблоны писем, протоколы решений, чек-листы).', is_active = 1, priority = 140, meta_json = '{}'
WHERE key = 'natal.planet.mercury.sign.capricorn.house.1' AND locale = 'ru-RU' AND topic_category = 'personality_core';

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.planet.mercury.sign.capricorn.house.1', 'personality_core', 'ru-RU', 'Меркурий в Козероге в 1-м доме: карьерный стиль «собранность, ответственность, результат». Сильная ставка на репутацию, статус и долгий цикл. Риск — жёсткость и перегруз. Меркурий: сильны стратегия, документы, аналитика и переговоры «по фактам». Практика: стандартизируй коммуникации (шаблоны писем, протоколы решений, чек-листы).', 140, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.planet.mercury.sign.capricorn.house.1' AND locale = 'ru-RU' AND topic_category = 'personality_core'
);

UPDATE knowledge_items
SET text = 'Марс ✧ Венера (секстиль): энергия + ценность. В карьере это про умение действовать и одновременно «продавать» результат — инициатива, переговоры, упаковка и отношения. Практика: закрепи связку «действие → демонстрация ценности»: каждую неделю один релиз/инициатива + один артефакт (кейс, презентация, предложение).', is_active = 1, priority = 140, meta_json = '{}'
WHERE key = 'natal.aspect.mars.sextile.venus' AND locale = 'ru-RU' AND topic_category = 'personality_core';

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.aspect.mars.sextile.venus', 'personality_core', 'ru-RU', 'Марс ✧ Венера (секстиль): энергия + ценность. В карьере это про умение действовать и одновременно «продавать» результат — инициатива, переговоры, упаковка и отношения. Практика: закрепи связку «действие → демонстрация ценности»: каждую неделю один релиз/инициатива + один артефакт (кейс, презентация, предложение).', 140, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.aspect.mars.sextile.venus' AND locale = 'ru-RU' AND topic_category = 'personality_core'
);

UPDATE knowledge_items
SET text = 'Юпитер ☍ Уран: рост через рывки и неожиданные возможности. В карьере это про масштабирование и смену траектории. Риск — переоценка возможностей и хаос в приоритетах. Практика: делай «большие ставки» через короткие пилоты и держи финансовую/временную подушку.', is_active = 1, priority = 140, meta_json = '{}'
WHERE key = 'natal.aspect.jupiter.opposition.uranus' AND locale = 'ru-RU' AND topic_category = 'personality_core';

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.aspect.jupiter.opposition.uranus', 'personality_core', 'ru-RU', 'Юпитер ☍ Уран: рост через рывки и неожиданные возможности. В карьере это про масштабирование и смену траектории. Риск — переоценка возможностей и хаос в приоритетах. Практика: делай «большие ставки» через короткие пилоты и держи финансовую/временную подушку.', 140, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.aspect.jupiter.opposition.uranus' AND locale = 'ru-RU' AND topic_category = 'personality_core'
);

UPDATE knowledge_items
SET text = 'Нептун ✧ Плутон (секстиль): глубокое видение + трансформационная сила. В карьере — способность работать с большими изменениями: культура, смыслы, кризисы, «пересборка» систем. Практика: выбирай проекты с долгим эффектом и фиксируй границы ответственности, чтобы не утонуть в эмоциях и неопределённости.', is_active = 1, priority = 140, meta_json = '{}'
WHERE key = 'natal.aspect.neptune.sextile.pluto' AND locale = 'ru-RU' AND topic_category = 'personality_core';

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.aspect.neptune.sextile.pluto', 'personality_core', 'ru-RU', 'Нептун ✧ Плутон (секстиль): глубокое видение + трансформационная сила. В карьере — способность работать с большими изменениями: культура, смыслы, кризисы, «пересборка» систем. Практика: выбирай проекты с долгим эффектом и фиксируй границы ответственности, чтобы не утонуть в эмоциях и неопределённости.', 140, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.aspect.neptune.sextile.pluto' AND locale = 'ru-RU' AND topic_category = 'personality_core'
);

UPDATE knowledge_items
SET text = 'Плутон ✧ Сатурн (секстиль): управляемая трансформация. В карьере — умение менять систему без разрушения: кризис-менеджмент, оптимизация, власть через компетентность. Практика: веди изменения через план (этапы, риски, контрольные точки), чтобы рост был безопасным.', is_active = 1, priority = 140, meta_json = '{}'
WHERE key = 'natal.aspect.pluto.sextile.saturn' AND locale = 'ru-RU' AND topic_category = 'personality_core';

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.aspect.pluto.sextile.saturn', 'personality_core', 'ru-RU', 'Плутон ✧ Сатурн (секстиль): управляемая трансформация. В карьере — умение менять систему без разрушения: кризис-менеджмент, оптимизация, власть через компетентность. Практика: веди изменения через план (этапы, риски, контрольные точки), чтобы рост был безопасным.', 140, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.aspect.pluto.sextile.saturn' AND locale = 'ru-RU' AND topic_category = 'personality_core'
);

UPDATE knowledge_items
SET text = 'Солнце ☌ Уран: независимый стиль лидерства и потребность в свободе/инновациях. Сильны технологии, реформы, нестандартные решения. Риск — резкие повороты и конфликт с жёсткими правилами. Практика: оформляй новизну в пилоты и метрики (срок, гипотеза, критерий успеха).', is_active = 1, priority = 140, meta_json = '{}'
WHERE key = 'natal.aspect.sun.conjunction.uranus' AND locale = 'ru-RU' AND topic_category = 'personality_core';

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.aspect.sun.conjunction.uranus', 'personality_core', 'ru-RU', 'Солнце ☌ Уран: независимый стиль лидерства и потребность в свободе/инновациях. Сильны технологии, реформы, нестандартные решения. Риск — резкие повороты и конфликт с жёсткими правилами. Практика: оформляй новизну в пилоты и метрики (срок, гипотеза, критерий успеха).', 140, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.aspect.sun.conjunction.uranus' AND locale = 'ru-RU' AND topic_category = 'personality_core'
);

UPDATE knowledge_items
SET text = 'Солнце ☍ Юпитер: амбиции и стремление к масштабу. В карьере это помогает брать большие роли, но важно не обещать лишнего. Практика: фиксируй объём работ и критерии успеха, дели цель на этапы и держи контроль качества, чтобы рост был устойчивым.', is_active = 1, priority = 140, meta_json = '{}'
WHERE key = 'natal.aspect.jupiter.opposition.sun' AND locale = 'ru-RU' AND topic_category = 'personality_core';

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.aspect.jupiter.opposition.sun', 'personality_core', 'ru-RU', 'Солнце ☍ Юпитер: амбиции и стремление к масштабу. В карьере это помогает брать большие роли, но важно не обещать лишнего. Практика: фиксируй объём работ и критерии успеха, дели цель на этапы и держи контроль качества, чтобы рост был устойчивым.', 140, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.aspect.jupiter.opposition.sun' AND locale = 'ru-RU' AND topic_category = 'personality_core'
);

UPDATE knowledge_items
SET text = 'Нептун ☌ Сатурн: соединение мечты и структуры. В карьере — умение превращать видение в систему (креатив/смысл → регламент/план). Риск — туман целей или чрезмерная жёсткость. Практика: всегда задавай измеримые критерии и сроки, чтобы вдохновение давало результат.', is_active = 1, priority = 140, meta_json = '{}'
WHERE key = 'natal.aspect.neptune.conjunction.saturn' AND locale = 'ru-RU' AND topic_category = 'personality_core';

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.aspect.neptune.conjunction.saturn', 'personality_core', 'ru-RU', 'Нептун ☌ Сатурн: соединение мечты и структуры. В карьере — умение превращать видение в систему (креатив/смысл → регламент/план). Риск — туман целей или чрезмерная жёсткость. Практика: всегда задавай измеримые критерии и сроки, чтобы вдохновение давало результат.', 140, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.aspect.neptune.conjunction.saturn' AND locale = 'ru-RU' AND topic_category = 'personality_core'
);

UPDATE knowledge_items
SET text = 'Нептун ☌ Солнце: сильное видение, эмпатия и творческая идентичность. Подходит работа со смыслом, образом, вдохновением. Риск — размытые границы и самообман в целях. Практика: держи чёткий контракт (что делаем/когда/за сколько) и проверяй гипотезы фактами.', is_active = 1, priority = 140, meta_json = '{}'
WHERE key = 'natal.aspect.neptune.conjunction.sun' AND locale = 'ru-RU' AND topic_category = 'personality_core';

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.aspect.neptune.conjunction.sun', 'personality_core', 'ru-RU', 'Нептун ☌ Солнце: сильное видение, эмпатия и творческая идентичность. Подходит работа со смыслом, образом, вдохновением. Риск — размытые границы и самообман в целях. Практика: держи чёткий контракт (что делаем/когда/за сколько) и проверяй гипотезы фактами.', 140, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.aspect.neptune.conjunction.sun' AND locale = 'ru-RU' AND topic_category = 'personality_core'
);

UPDATE knowledge_items
SET text = 'Солнце ☌ Сатурн: лидерство через ответственность и дисциплину. Карьера растёт по долгому циклу: качество, статус, доверие. Риск — самокритика и перегруз. Практика: формализуй роль (KPI, зона ответственности) и держи ритм отчётности/ревью, чтобы усилия превращались в видимый результат.', is_active = 1, priority = 140, meta_json = '{}'
WHERE key = 'natal.aspect.saturn.conjunction.sun' AND locale = 'ru-RU' AND topic_category = 'personality_core';

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.aspect.saturn.conjunction.sun', 'personality_core', 'ru-RU', 'Солнце ☌ Сатурн: лидерство через ответственность и дисциплину. Карьера растёт по долгому циклу: качество, статус, доверие. Риск — самокритика и перегруз. Практика: формализуй роль (KPI, зона ответственности) и держи ритм отчётности/ревью, чтобы усилия превращались в видимый результат.', 140, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.aspect.saturn.conjunction.sun' AND locale = 'ru-RU' AND topic_category = 'personality_core'
);

COMMIT;

