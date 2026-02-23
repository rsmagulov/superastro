-- AUTO-GENERATED. DO NOT EDIT BY HAND.

-- Overrides from debug shortest used blocks (topic_category=ancestral_topics)

-- Source JSON: C:/Projects/superastro/debug_ancestral_topics_ru_160_20260223_145449_mini_topiccore.json

-- Filter: len(text)<= 420, max_keys=250

BEGIN;

UPDATE knowledge_items
SET text = 'Натальный маркер (natal.angle.ic): это подсказка о стиле реакции и типичных сценариях. Практика: отследи, как это проявляется 7 дней (триггеры → реакция → результат) и выбери одну настройку поведения (границы, темп, коммуникация, режим восстановления).', is_active = 1, priority = 140, meta_json = '{}'
WHERE key = 'natal.angle.ic' AND locale = 'ru-RU' AND topic_category = 'ancestral_topics';

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.angle.ic', 'ancestral_topics', 'ru-RU', 'Натальный маркер (natal.angle.ic): это подсказка о стиле реакции и типичных сценариях. Практика: отследи, как это проявляется 7 дней (триггеры → реакция → результат) и выбери одну настройку поведения (границы, темп, коммуникация, режим восстановления).', 140, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.angle.ic' AND locale = 'ru-RU' AND topic_category = 'ancestral_topics'
);

UPDATE knowledge_items
SET text = 'Натальный маркер (natal.angle.ic.sign.gemini): это подсказка о стиле реакции и типичных сценариях. Практика: отследи, как это проявляется 7 дней (триггеры → реакция → результат) и выбери одну настройку поведения (границы, темп, коммуникация, режим восстановления).', is_active = 1, priority = 140, meta_json = '{}'
WHERE key = 'natal.angle.ic.sign.gemini' AND locale = 'ru-RU' AND topic_category = 'ancestral_topics';

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.angle.ic.sign.gemini', 'ancestral_topics', 'ru-RU', 'Натальный маркер (natal.angle.ic.sign.gemini): это подсказка о стиле реакции и типичных сценариях. Практика: отследи, как это проявляется 7 дней (триггеры → реакция → результат) и выбери одну настройку поведения (границы, темп, коммуникация, режим восстановления).', 140, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.angle.ic.sign.gemini' AND locale = 'ru-RU' AND topic_category = 'ancestral_topics'
);

UPDATE knowledge_items
SET text = 'Натальный маркер (natal.house.4.cusp.sign.any): это подсказка о стиле реакции и типичных сценариях. Практика: отследи, как это проявляется 7 дней (триггеры → реакция → результат) и выбери одну настройку поведения (границы, темп, коммуникация, режим восстановления).', is_active = 1, priority = 140, meta_json = '{}'
WHERE key = 'natal.house.4.cusp.sign.any' AND locale = 'ru-RU' AND topic_category = 'ancestral_topics';

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.4.cusp.sign.any', 'ancestral_topics', 'ru-RU', 'Натальный маркер (natal.house.4.cusp.sign.any): это подсказка о стиле реакции и типичных сценариях. Практика: отследи, как это проявляется 7 дней (триггеры → реакция → результат) и выбери одну настройку поведения (границы, темп, коммуникация, режим восстановления).', 140, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.4.cusp.sign.any' AND locale = 'ru-RU' AND topic_category = 'ancestral_topics'
);

UPDATE knowledge_items
SET text = 'Натальный маркер (natal.house.4.ruler.mercury): это подсказка о стиле реакции и типичных сценариях. Практика: отследи, как это проявляется 7 дней (триггеры → реакция → результат) и выбери одну настройку поведения (границы, темп, коммуникация, режим восстановления).', is_active = 1, priority = 140, meta_json = '{}'
WHERE key = 'natal.house.4.ruler.mercury' AND locale = 'ru-RU' AND topic_category = 'ancestral_topics';

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.4.ruler.mercury', 'ancestral_topics', 'ru-RU', 'Натальный маркер (natal.house.4.ruler.mercury): это подсказка о стиле реакции и типичных сценариях. Практика: отследи, как это проявляется 7 дней (триггеры → реакция → результат) и выбери одну настройку поведения (границы, темп, коммуникация, режим восстановления).', 140, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.4.ruler.mercury' AND locale = 'ru-RU' AND topic_category = 'ancestral_topics'
);

UPDATE knowledge_items
SET text = 'Этот блок описывает родовые темы как повторяющиеся семейные сценарии: что передаётся через установки, роли и эмоциональные правила «дома». Сильная сторона — можно осознанно взять ресурс рода; риск — автоматически повторять чужой сценарий (вина, контроль, спасательство, молчание) вместо выбора. Практика: выбери 1 семейный паттерн и разложи его на шаги (триггер → реакция → итог). Затем замени один шаг на новый — и повторяй 14 дней.', is_active = 1, priority = 140, meta_json = '{}'
WHERE key = 'natal.ancestral_topics.generic' AND locale = 'ru-RU' AND topic_category = 'ancestral_topics';

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.ancestral_topics.generic', 'ancestral_topics', 'ru-RU', 'Этот блок описывает родовые темы как повторяющиеся семейные сценарии: что передаётся через установки, роли и эмоциональные правила «дома». Сильная сторона — можно осознанно взять ресурс рода; риск — автоматически повторять чужой сценарий (вина, контроль, спасательство, молчание) вместо выбора. Практика: выбери 1 семейный паттерн и разложи его на шаги (триггер → реакция → итог). Затем замени один шаг на новый — и повторяй 14 дней.', 140, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.ancestral_topics.generic' AND locale = 'ru-RU' AND topic_category = 'ancestral_topics'
);

UPDATE knowledge_items
SET text = 'Натальный маркер (natal.house.4.cusp.sign.gemini): это подсказка о стиле реакции и типичных сценариях. Практика: отследи, как это проявляется 7 дней (триггеры → реакция → результат) и выбери одну настройку поведения (границы, темп, коммуникация, режим восстановления).', is_active = 1, priority = 140, meta_json = '{}'
WHERE key = 'natal.house.4.cusp.sign.gemini' AND locale = 'ru-RU' AND topic_category = 'ancestral_topics';

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.4.cusp.sign.gemini', 'ancestral_topics', 'ru-RU', 'Натальный маркер (natal.house.4.cusp.sign.gemini): это подсказка о стиле реакции и типичных сценариях. Практика: отследи, как это проявляется 7 дней (триггеры → реакция → результат) и выбери одну настройку поведения (границы, темп, коммуникация, режим восстановления).', 140, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.4.cusp.sign.gemini' AND locale = 'ru-RU' AND topic_category = 'ancestral_topics'
);

UPDATE knowledge_items
SET text = 'Натальный маркер (natal.house.4.ruler.mercury.sign.any): это подсказка о стиле реакции и типичных сценариях. Практика: отследи, как это проявляется 7 дней (триггеры → реакция → результат) и выбери одну настройку поведения (границы, темп, коммуникация, режим восстановления).', is_active = 1, priority = 140, meta_json = '{}'
WHERE key = 'natal.house.4.ruler.mercury.sign.any' AND locale = 'ru-RU' AND topic_category = 'ancestral_topics';

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.4.ruler.mercury.sign.any', 'ancestral_topics', 'ru-RU', 'Натальный маркер (natal.house.4.ruler.mercury.sign.any): это подсказка о стиле реакции и типичных сценариях. Практика: отследи, как это проявляется 7 дней (триггеры → реакция → результат) и выбери одну настройку поведения (границы, темп, коммуникация, режим восстановления).', 140, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.4.ruler.mercury.sign.any' AND locale = 'ru-RU' AND topic_category = 'ancestral_topics'
);

UPDATE knowledge_items
SET text = 'Натальный маркер (natal.house.4.ruler.mercury.aspects.present): это подсказка о стиле реакции и типичных сценариях. Практика: отследи, как это проявляется 7 дней (триггеры → реакция → результат) и выбери одну настройку поведения (границы, темп, коммуникация, режим восстановления).', is_active = 1, priority = 140, meta_json = '{}'
WHERE key = 'natal.house.4.ruler.mercury.aspects.present' AND locale = 'ru-RU' AND topic_category = 'ancestral_topics';

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.4.ruler.mercury.aspects.present', 'ancestral_topics', 'ru-RU', 'Натальный маркер (natal.house.4.ruler.mercury.aspects.present): это подсказка о стиле реакции и типичных сценариях. Практика: отследи, как это проявляется 7 дней (триггеры → реакция → результат) и выбери одну настройку поведения (границы, темп, коммуникация, режим восстановления).', 140, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.4.ruler.mercury.aspects.present' AND locale = 'ru-RU' AND topic_category = 'ancestral_topics'
);

UPDATE knowledge_items
SET text = 'Натальный маркер (natal.house.4.ruler.mercury.aspect.sextile.mars): это подсказка о стиле реакции и типичных сценариях. Практика: отследи, как это проявляется 7 дней (триггеры → реакция → результат) и выбери одну настройку поведения (границы, темп, коммуникация, режим восстановления).', is_active = 1, priority = 140, meta_json = '{}'
WHERE key = 'natal.house.4.ruler.mercury.aspect.sextile.mars' AND locale = 'ru-RU' AND topic_category = 'ancestral_topics';

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.4.ruler.mercury.aspect.sextile.mars', 'ancestral_topics', 'ru-RU', 'Натальный маркер (natal.house.4.ruler.mercury.aspect.sextile.mars): это подсказка о стиле реакции и типичных сценариях. Практика: отследи, как это проявляется 7 дней (триггеры → реакция → результат) и выбери одну настройку поведения (границы, темп, коммуникация, режим восстановления).', 140, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.4.ruler.mercury.aspect.sextile.mars' AND locale = 'ru-RU' AND topic_category = 'ancestral_topics'
);

UPDATE knowledge_items
SET text = 'Рак заметно проявлен в карте. Сильные стороны: эмпатия, забота, интуиция, память. Риски перекоса: ранимость, обидчивость, уход в защиту. Практика: выбери 1 сильную сторону и 1 риск и закрепи их в конкретном действии на неделю (что усиливаю, что ограничиваю, по каким признакам пойму, что баланс соблюдён).', is_active = 1, priority = 140, meta_json = '{}'
WHERE key = 'natal.sign.cancer.present' AND locale = 'ru-RU' AND topic_category = 'ancestral_topics';

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.sign.cancer.present', 'ancestral_topics', 'ru-RU', 'Рак заметно проявлен в карте. Сильные стороны: эмпатия, забота, интуиция, память. Риски перекоса: ранимость, обидчивость, уход в защиту. Практика: выбери 1 сильную сторону и 1 риск и закрепи их в конкретном действии на неделю (что усиливаю, что ограничиваю, по каким признакам пойму, что баланс соблюдён).', 140, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.sign.cancer.present' AND locale = 'ru-RU' AND topic_category = 'ancestral_topics'
);

UPDATE knowledge_items
SET text = 'Дева заметно проявлен в карте. Сильные стороны: точность, анализ, полезность, порядок. Риски перекоса: критичность, тревожность, перфекционизм. Практика: выбери 1 сильную сторону и 1 риск и закрепи их в конкретном действии на неделю (что усиливаю, что ограничиваю, по каким признакам пойму, что баланс соблюдён).', is_active = 1, priority = 140, meta_json = '{}'
WHERE key = 'natal.sign.virgo.present' AND locale = 'ru-RU' AND topic_category = 'ancestral_topics';

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.sign.virgo.present', 'ancestral_topics', 'ru-RU', 'Дева заметно проявлен в карте. Сильные стороны: точность, анализ, полезность, порядок. Риски перекоса: критичность, тревожность, перфекционизм. Практика: выбери 1 сильную сторону и 1 риск и закрепи их в конкретном действии на неделю (что усиливаю, что ограничиваю, по каким признакам пойму, что баланс соблюдён).', 140, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.sign.virgo.present' AND locale = 'ru-RU' AND topic_category = 'ancestral_topics'
);

UPDATE knowledge_items
SET text = 'Близнецы заметно проявлен в карте. Сильные стороны: гибкость ума, коммуникации, обучение. Риски перекоса: распыление, поверхностность, нервозность. Практика: выбери 1 сильную сторону и 1 риск и закрепи их в конкретном действии на неделю (что усиливаю, что ограничиваю, по каким признакам пойму, что баланс соблюдён).', is_active = 1, priority = 140, meta_json = '{}'
WHERE key = 'natal.sign.gemini.present' AND locale = 'ru-RU' AND topic_category = 'ancestral_topics';

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.sign.gemini.present', 'ancestral_topics', 'ru-RU', 'Близнецы заметно проявлен в карте. Сильные стороны: гибкость ума, коммуникации, обучение. Риски перекоса: распыление, поверхностность, нервозность. Практика: выбери 1 сильную сторону и 1 риск и закрепи их в конкретном действии на неделю (что усиливаю, что ограничиваю, по каким признакам пойму, что баланс соблюдён).', 140, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.sign.gemini.present' AND locale = 'ru-RU' AND topic_category = 'ancestral_topics'
);

UPDATE knowledge_items
SET text = 'Телец заметно проявлен в карте. Сильные стороны: устойчивость, практичность, вкус и качество. Риски перекоса: инертность, упрямство, страх перемен. Практика: выбери 1 сильную сторону и 1 риск и закрепи их в конкретном действии на неделю (что усиливаю, что ограничиваю, по каким признакам пойму, что баланс соблюдён).', is_active = 1, priority = 140, meta_json = '{}'
WHERE key = 'natal.sign.taurus.present' AND locale = 'ru-RU' AND topic_category = 'ancestral_topics';

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.sign.taurus.present', 'ancestral_topics', 'ru-RU', 'Телец заметно проявлен в карте. Сильные стороны: устойчивость, практичность, вкус и качество. Риски перекоса: инертность, упрямство, страх перемен. Практика: выбери 1 сильную сторону и 1 риск и закрепи их в конкретном действии на неделю (что усиливаю, что ограничиваю, по каким признакам пойму, что баланс соблюдён).', 140, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.sign.taurus.present' AND locale = 'ru-RU' AND topic_category = 'ancestral_topics'
);

UPDATE knowledge_items
SET text = 'Лев заметно проявлен в карте. Сильные стороны: самовыражение, лидерство, творчество. Риски перекоса: самолюбие, драматизация, зависимость от оценки. Практика: выбери 1 сильную сторону и 1 риск и закрепи их в конкретном действии на неделю (что усиливаю, что ограничиваю, по каким признакам пойму, что баланс соблюдён).', is_active = 1, priority = 140, meta_json = '{}'
WHERE key = 'natal.sign.leo.present' AND locale = 'ru-RU' AND topic_category = 'ancestral_topics';

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.sign.leo.present', 'ancestral_topics', 'ru-RU', 'Лев заметно проявлен в карте. Сильные стороны: самовыражение, лидерство, творчество. Риски перекоса: самолюбие, драматизация, зависимость от оценки. Практика: выбери 1 сильную сторону и 1 риск и закрепи их в конкретном действии на неделю (что усиливаю, что ограничиваю, по каким признакам пойму, что баланс соблюдён).', 140, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.sign.leo.present' AND locale = 'ru-RU' AND topic_category = 'ancestral_topics'
);

UPDATE knowledge_items
SET text = 'Рыбы заметно проявлен в карте. Сильные стороны: воображение, сострадание, тонкость, вдохновение. Риски перекоса: размытые границы, избегание, иллюзии. Практика: выбери 1 сильную сторону и 1 риск и закрепи их в конкретном действии на неделю (что усиливаю, что ограничиваю, по каким признакам пойму, что баланс соблюдён).', is_active = 1, priority = 140, meta_json = '{}'
WHERE key = 'natal.sign.pisces.present' AND locale = 'ru-RU' AND topic_category = 'ancestral_topics';

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.sign.pisces.present', 'ancestral_topics', 'ru-RU', 'Рыбы заметно проявлен в карте. Сильные стороны: воображение, сострадание, тонкость, вдохновение. Риски перекоса: размытые границы, избегание, иллюзии. Практика: выбери 1 сильную сторону и 1 риск и закрепи их в конкретном действии на неделю (что усиливаю, что ограничиваю, по каким признакам пойму, что баланс соблюдён).', 140, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.sign.pisces.present' AND locale = 'ru-RU' AND topic_category = 'ancestral_topics'
);

UPDATE knowledge_items
SET text = 'Козерог заметно проявлен в карте. Сильные стороны: ответственность, стратегия, дисциплина, результат. Риски перекоса: жёсткость, перегруз, страх ошибки. Практика: выбери 1 сильную сторону и 1 риск и закрепи их в конкретном действии на неделю (что усиливаю, что ограничиваю, по каким признакам пойму, что баланс соблюдён).', is_active = 1, priority = 140, meta_json = '{}'
WHERE key = 'natal.sign.capricorn.present' AND locale = 'ru-RU' AND topic_category = 'ancestral_topics';

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.sign.capricorn.present', 'ancestral_topics', 'ru-RU', 'Козерог заметно проявлен в карте. Сильные стороны: ответственность, стратегия, дисциплина, результат. Риски перекоса: жёсткость, перегруз, страх ошибки. Практика: выбери 1 сильную сторону и 1 риск и закрепи их в конкретном действии на неделю (что усиливаю, что ограничиваю, по каким признакам пойму, что баланс соблюдён).', 140, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.sign.capricorn.present' AND locale = 'ru-RU' AND topic_category = 'ancestral_topics'
);

UPDATE knowledge_items
SET text = 'Скорпион заметно проявлен в карте. Сильные стороны: глубина, стойкость, концентрация, трансформация. Риски перекоса: контроль, подозрительность, крайности. Практика: выбери 1 сильную сторону и 1 риск и закрепи их в конкретном действии на неделю (что усиливаю, что ограничиваю, по каким признакам пойму, что баланс соблюдён).', is_active = 1, priority = 140, meta_json = '{}'
WHERE key = 'natal.sign.scorpio.present' AND locale = 'ru-RU' AND topic_category = 'ancestral_topics';

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.sign.scorpio.present', 'ancestral_topics', 'ru-RU', 'Скорпион заметно проявлен в карте. Сильные стороны: глубина, стойкость, концентрация, трансформация. Риски перекоса: контроль, подозрительность, крайности. Практика: выбери 1 сильную сторону и 1 риск и закрепи их в конкретном действии на неделю (что усиливаю, что ограничиваю, по каким признакам пойму, что баланс соблюдён).', 140, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.sign.scorpio.present' AND locale = 'ru-RU' AND topic_category = 'ancestral_topics'
);

UPDATE knowledge_items
SET text = 'Водолей заметно проявлен в карте. Сильные стороны: независимость, инновации, идеи, команда. Риски перекоса: отстранённость, упрямство идей, непредсказуемость. Практика: выбери 1 сильную сторону и 1 риск и закрепи их в конкретном действии на неделю (что усиливаю, что ограничиваю, по каким признакам пойму, что баланс соблюдён).', is_active = 1, priority = 140, meta_json = '{}'
WHERE key = 'natal.sign.aquarius.present' AND locale = 'ru-RU' AND topic_category = 'ancestral_topics';

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.sign.aquarius.present', 'ancestral_topics', 'ru-RU', 'Водолей заметно проявлен в карте. Сильные стороны: независимость, инновации, идеи, команда. Риски перекоса: отстранённость, упрямство идей, непредсказуемость. Практика: выбери 1 сильную сторону и 1 риск и закрепи их в конкретном действии на неделю (что усиливаю, что ограничиваю, по каким признакам пойму, что баланс соблюдён).', 140, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.sign.aquarius.present' AND locale = 'ru-RU' AND topic_category = 'ancestral_topics'
);

UPDATE knowledge_items
SET text = 'Стрелец заметно проявлен в карте. Сильные стороны: широта взглядов, смысл, честность, рост. Риски перекоса: прямолинейность, обещания без расчёта, беспокойство. Практика: выбери 1 сильную сторону и 1 риск и закрепи их в конкретном действии на неделю (что усиливаю, что ограничиваю, по каким признакам пойму, что баланс соблюдён).', is_active = 1, priority = 140, meta_json = '{}'
WHERE key = 'natal.sign.sagittarius.present' AND locale = 'ru-RU' AND topic_category = 'ancestral_topics';

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.sign.sagittarius.present', 'ancestral_topics', 'ru-RU', 'Стрелец заметно проявлен в карте. Сильные стороны: широта взглядов, смысл, честность, рост. Риски перекоса: прямолинейность, обещания без расчёта, беспокойство. Практика: выбери 1 сильную сторону и 1 риск и закрепи их в конкретном действии на неделю (что усиливаю, что ограничиваю, по каким признакам пойму, что баланс соблюдён).', 140, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.sign.sagittarius.present' AND locale = 'ru-RU' AND topic_category = 'ancestral_topics'
);

UPDATE knowledge_items
SET text = 'Управитель 4 дома — ключ к внутренней опоре и эмоциональной безопасности: через что ты восстанавливаешься и чувствуешь «дом». Он показывает, какие условия успокаивают нервную систему, а какие делают фон тревожным или нестабильным. Практика: выбери 1 ритуал поддержки (сон/тишина/общение/пространство/границы) и соблюдай 14 дней, отмечая изменения в состоянии.', is_active = 1, priority = 140, meta_json = '{}'
WHERE key = 'natal.house.4.ruler.any' AND locale = 'ru-RU' AND topic_category = 'ancestral_topics';

INSERT INTO knowledge_items (key, topic_category, locale, text, priority, created_at, is_active, meta_json)
SELECT 'natal.house.4.ruler.any', 'ancestral_topics', 'ru-RU', 'Управитель 4 дома — ключ к внутренней опоре и эмоциональной безопасности: через что ты восстанавливаешься и чувствуешь «дом». Он показывает, какие условия успокаивают нервную систему, а какие делают фон тревожным или нестабильным. Практика: выбери 1 ритуал поддержки (сон/тишина/общение/пространство/границы) и соблюдай 14 дней, отмечая изменения в состоянии.', 140, CURRENT_TIMESTAMP, 1, '{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key = 'natal.house.4.ruler.any' AND locale = 'ru-RU' AND topic_category = 'ancestral_topics'
);

COMMIT;

