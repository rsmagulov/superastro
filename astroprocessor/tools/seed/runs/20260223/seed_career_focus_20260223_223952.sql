-- AUTO-GENERATED. DO NOT EDIT BY HAND.
-- Overrides from debug shortest used blocks (topic_category=career)
-- Source JSON: C:/Projects/superastro/debug/debug_career_ru-RU_160_20260223_223952_mini_focus.json
-- Filter: len(text)<= 420, max_keys=200

BEGIN;

INSERT INTO knowledge_items(key, topic_category, locale, text, is_active, priority, meta_json, created_at, updated_at)
VALUES('natal.house.10.ruler.venus', 'career', 'ru-RU', 'Управитель 10 дома — Венера. Это влияет на карьерную стратегию и то, как ты достигаешь результата. Сильная сторона — можно построить устойчивую траекторию; риск — застревать в роли или перегружаться. Практика: выбери 1 стандарт качества/границ и удерживай его 14 дней.', 1, 140, '{}', datetime('now'), CAST(strftime('%s','now') AS INTEGER))
ON CONFLICT(key, topic_category, locale) DO UPDATE SET
  text=excluded.text,
  is_active=excluded.is_active,
  priority=excluded.priority,
  meta_json=COALESCE(excluded.meta_json, knowledge_items.meta_json),
  updated_at=excluded.updated_at;

INSERT INTO knowledge_items(key, topic_category, locale, text, is_active, priority, meta_json, created_at, updated_at)
VALUES('natal.house.10.cusp.sign.libra', 'career', 'ru-RU', 'Куспид 10-й дом (карьера и статус) в Весы: стиль входа в ситуации этой сферы окрашен качествами знака. Сильная сторона — проще проявлять сильные качества; риск — перегибать и попадать в крайности знака. Практика: выбери 1 качество {sr} как ресурс и 1 риск как ограничение — и проверь на практике 7 дней.', 1, 140, '{}', datetime('now'), CAST(strftime('%s','now') AS INTEGER))
ON CONFLICT(key, topic_category, locale) DO UPDATE SET
  text=excluded.text,
  is_active=excluded.is_active,
  priority=excluded.priority,
  meta_json=COALESCE(excluded.meta_json, knowledge_items.meta_json),
  updated_at=excluded.updated_at;

INSERT INTO knowledge_items(key, topic_category, locale, text, is_active, priority, meta_json, created_at, updated_at)
VALUES('natal.house.10.ruler.venus.sign.any', 'career', 'ru-RU', 'Управитель 10-й дом (карьера и статус) (Венера) в определённом знаке задаёт стиль решений по теме дома: темп, мотивацию и привычные реакции. Сильная сторона — устойчивый стиль; риск — шаблонные реакции в стрессе. Практика: 7 дней отмечай, где этот стиль помогает, а где мешает — и введи одну корректировку.', 1, 140, '{}', datetime('now'), CAST(strftime('%s','now') AS INTEGER))
ON CONFLICT(key, topic_category, locale) DO UPDATE SET
  text=excluded.text,
  is_active=excluded.is_active,
  priority=excluded.priority,
  meta_json=COALESCE(excluded.meta_json, knowledge_items.meta_json),
  updated_at=excluded.updated_at;

INSERT INTO knowledge_items(key, topic_category, locale, text, is_active, priority, meta_json, created_at, updated_at)
VALUES('natal.angle.mc.sign.libra', 'career', 'ru-RU', 'MC в Весы: стиль проявления по оси «карьера и статус» окрашен качествами знака. Сильная сторона — ясный способ проявляться; риск — перекос в крайности знака. Практика: выбери 1 качество знака и закрепи его в одном стандарте поведения на 2 недели.', 1, 140, '{}', datetime('now'), CAST(strftime('%s','now') AS INTEGER))
ON CONFLICT(key, topic_category, locale) DO UPDATE SET
  text=excluded.text,
  is_active=excluded.is_active,
  priority=excluded.priority,
  meta_json=COALESCE(excluded.meta_json, knowledge_items.meta_json),
  updated_at=excluded.updated_at;

INSERT INTO knowledge_items(key, topic_category, locale, text, is_active, priority, meta_json, created_at, updated_at)
VALUES('natal.house.10.ruler.venus.aspects.present', 'career', 'ru-RU', 'Управитель 10-й дом (карьера и статус) (Венера) имеет значимые аспекты: задачи дома связаны с другими функциями карты. Сильная сторона — многогранность; риск — внутренние конфликты, влияющие на решения. Практика: опиши 1 повторяющийся сценарий по теме дома и добавь одно стабилизирующее правило.', 1, 140, '{}', datetime('now'), CAST(strftime('%s','now') AS INTEGER))
ON CONFLICT(key, topic_category, locale) DO UPDATE SET
  text=excluded.text,
  is_active=excluded.is_active,
  priority=excluded.priority,
  meta_json=COALESCE(excluded.meta_json, knowledge_items.meta_json),
  updated_at=excluded.updated_at;

INSERT INTO knowledge_items(key, topic_category, locale, text, is_active, priority, meta_json, created_at, updated_at)
VALUES('natal.career.generic', 'career', 'ru-RU', 'Карьерный маркер: показывает, где проще получить результат и что мешает стабильности. Практика: выбери 1 конкретный навык/процесс на 2 недели (приоритеты, дедлайны, коммуникации, контроль качества) и замерь эффект по метрикам: скорость, качество, доход, устойчивость.', 1, 140, '{}', datetime('now'), CAST(strftime('%s','now') AS INTEGER))
ON CONFLICT(key, topic_category, locale) DO UPDATE SET
  text=excluded.text,
  is_active=excluded.is_active,
  priority=excluded.priority,
  meta_json=COALESCE(excluded.meta_json, knowledge_items.meta_json),
  updated_at=excluded.updated_at;

INSERT INTO knowledge_items(key, topic_category, locale, text, is_active, priority, meta_json, created_at, updated_at)
VALUES('natal.elements.air.count.2', 'career', 'ru-RU', 'Стихия Воздух: количество значимых объектов = 2. Это отражает выраженность качества и то, где проще действовать. Практика: используй эту стихию как ресурс (1 действие в день), но добавь баланс через противоположный навык.', 1, 140, '{}', datetime('now'), CAST(strftime('%s','now') AS INTEGER))
ON CONFLICT(key, topic_category, locale) DO UPDATE SET
  text=excluded.text,
  is_active=excluded.is_active,
  priority=excluded.priority,
  meta_json=COALESCE(excluded.meta_json, knowledge_items.meta_json),
  updated_at=excluded.updated_at;

INSERT INTO knowledge_items(key, topic_category, locale, text, is_active, priority, meta_json, created_at, updated_at)
VALUES('natal.elements.deficient.fire', 'career', 'ru-RU', 'Стихия Огонь выражена слабее. Это не «плохо», но может требовать осознанного развития соответствующих навыков. Практика: 7 дней делай одно маленькое действие в логике этой стихии.', 1, 140, '{}', datetime('now'), CAST(strftime('%s','now') AS INTEGER))
ON CONFLICT(key, topic_category, locale) DO UPDATE SET
  text=excluded.text,
  is_active=excluded.is_active,
  priority=excluded.priority,
  meta_json=COALESCE(excluded.meta_json, knowledge_items.meta_json),
  updated_at=excluded.updated_at;

INSERT INTO knowledge_items(key, topic_category, locale, text, is_active, priority, meta_json, created_at, updated_at)
VALUES('natal.elements.dominant.earth', 'career', 'ru-RU', 'Доминирует стихия Земля. Сильная сторона — проще действовать в её логике; риск — перекос и слепая зона. Практика: на неделю выбери 1 ресурс доминанты и 1 компенсирующее действие.', 1, 140, '{}', datetime('now'), CAST(strftime('%s','now') AS INTEGER))
ON CONFLICT(key, topic_category, locale) DO UPDATE SET
  text=excluded.text,
  is_active=excluded.is_active,
  priority=excluded.priority,
  meta_json=COALESCE(excluded.meta_json, knowledge_items.meta_json),
  updated_at=excluded.updated_at;

INSERT INTO knowledge_items(key, topic_category, locale, text, is_active, priority, meta_json, created_at, updated_at)
VALUES('natal.elements.earth.count.4p', 'career', 'ru-RU', 'Карьерный маркер: показывает, где проще получить результат и что мешает стабильности. Практика: выбери 1 конкретный навык/процесс на 2 недели (приоритеты, дедлайны, коммуникации, контроль качества) и замерь эффект по метрикам: скорость, качество, доход, устойчивость.', 1, 140, '{}', datetime('now'), CAST(strftime('%s','now') AS INTEGER))
ON CONFLICT(key, topic_category, locale) DO UPDATE SET
  text=excluded.text,
  is_active=excluded.is_active,
  priority=excluded.priority,
  meta_json=COALESCE(excluded.meta_json, knowledge_items.meta_json),
  updated_at=excluded.updated_at;

INSERT INTO knowledge_items(key, topic_category, locale, text, is_active, priority, meta_json, created_at, updated_at)
VALUES('natal.elements.fire.count.1', 'career', 'ru-RU', 'Стихия Огонь: количество значимых объектов = 1. Это отражает выраженность качества и то, где проще действовать. Практика: используй эту стихию как ресурс (1 действие в день), но добавь баланс через противоположный навык.', 1, 140, '{}', datetime('now'), CAST(strftime('%s','now') AS INTEGER))
ON CONFLICT(key, topic_category, locale) DO UPDATE SET
  text=excluded.text,
  is_active=excluded.is_active,
  priority=excluded.priority,
  meta_json=COALESCE(excluded.meta_json, knowledge_items.meta_json),
  updated_at=excluded.updated_at;

INSERT INTO knowledge_items(key, topic_category, locale, text, is_active, priority, meta_json, created_at, updated_at)
VALUES('natal.elements.water.count.2', 'career', 'ru-RU', 'Стихия Вода: количество значимых объектов = 2. Это отражает выраженность качества и то, где проще действовать. Практика: используй эту стихию как ресурс (1 действие в день), но добавь баланс через противоположный навык.', 1, 140, '{}', datetime('now'), CAST(strftime('%s','now') AS INTEGER))
ON CONFLICT(key, topic_category, locale) DO UPDATE SET
  text=excluded.text,
  is_active=excluded.is_active,
  priority=excluded.priority,
  meta_json=COALESCE(excluded.meta_json, knowledge_items.meta_json),
  updated_at=excluded.updated_at;

INSERT INTO knowledge_items(key, topic_category, locale, text, is_active, priority, meta_json, created_at, updated_at)
VALUES('natal.modality.dominant.cardinal', 'career', 'ru-RU', 'Доминирует качество «кардинальный». Это влияет на стиль изменений: старт/удержание/адаптация. Практика: выбери 1 привычку в логике доминанты и закрепи её на 14 дней.', 1, 140, '{}', datetime('now'), CAST(strftime('%s','now') AS INTEGER))
ON CONFLICT(key, topic_category, locale) DO UPDATE SET
  text=excluded.text,
  is_active=excluded.is_active,
  priority=excluded.priority,
  meta_json=COALESCE(excluded.meta_json, knowledge_items.meta_json),
  updated_at=excluded.updated_at;

INSERT INTO knowledge_items(key, topic_category, locale, text, is_active, priority, meta_json, created_at, updated_at)
VALUES('natal.polarity.balance.yin', 'career', 'ru-RU', 'Баланс полярности смещён в сторону «Инь». Это влияет на темп решений, активность и стиль контакта. Практика: выбери 1 способ уравновесить полярность на неделю (паузы, планирование, восстановление).', 1, 140, '{}', datetime('now'), CAST(strftime('%s','now') AS INTEGER))
ON CONFLICT(key, topic_category, locale) DO UPDATE SET
  text=excluded.text,
  is_active=excluded.is_active,
  priority=excluded.priority,
  meta_json=COALESCE(excluded.meta_json, knowledge_items.meta_json),
  updated_at=excluded.updated_at;

INSERT INTO knowledge_items(key, topic_category, locale, text, is_active, priority, meta_json, created_at, updated_at)
VALUES('natal.sign.aries.present', 'career', 'ru-RU', 'Овен заметно проявлен в карте. Сильные стороны: инициатива, смелость, прямота. Риски перекоса: импульсивность, конфликты, спешка. Практика: выбери 1 сильную сторону и 1 риск и закрепи их в конкретном действии на неделю (что усиливаю, что ограничиваю, по каким признакам пойму, что баланс соблюдён).', 1, 140, '{}', datetime('now'), CAST(strftime('%s','now') AS INTEGER))
ON CONFLICT(key, topic_category, locale) DO UPDATE SET
  text=excluded.text,
  is_active=excluded.is_active,
  priority=excluded.priority,
  meta_json=COALESCE(excluded.meta_json, knowledge_items.meta_json),
  updated_at=excluded.updated_at;

INSERT INTO knowledge_items(key, topic_category, locale, text, is_active, priority, meta_json, created_at, updated_at)
VALUES('natal.sign.libra.present', 'career', 'ru-RU', 'Весы заметно проявлен в карте. Сильные стороны: дипломатия, чувство меры, эстетика. Риски перекоса: колебания, зависимость от одобрения, избегание конфликтов. Практика: выбери 1 сильную сторону и 1 риск и закрепи их в конкретном действии на неделю (что усиливаю, что ограничиваю, по каким признакам пойму, что баланс соблюдён).', 1, 140, '{}', datetime('now'), CAST(strftime('%s','now') AS INTEGER))
ON CONFLICT(key, topic_category, locale) DO UPDATE SET
  text=excluded.text,
  is_active=excluded.is_active,
  priority=excluded.priority,
  meta_json=COALESCE(excluded.meta_json, knowledge_items.meta_json),
  updated_at=excluded.updated_at;

INSERT INTO knowledge_items(key, topic_category, locale, text, is_active, priority, meta_json, created_at, updated_at)
VALUES('natal.sign.virgo.present', 'career', 'ru-RU', 'Дева заметно проявлен в карте. Сильные стороны: точность, анализ, сервис. Риски перекоса: критичность, тревожность, перфекционизм. Практика: выбери 1 сильную сторону и 1 риск и закрепи их в конкретном действии на неделю (что усиливаю, что ограничиваю, по каким признакам пойму, что баланс соблюдён).', 1, 140, '{}', datetime('now'), CAST(strftime('%s','now') AS INTEGER))
ON CONFLICT(key, topic_category, locale) DO UPDATE SET
  text=excluded.text,
  is_active=excluded.is_active,
  priority=excluded.priority,
  meta_json=COALESCE(excluded.meta_json, knowledge_items.meta_json),
  updated_at=excluded.updated_at;

INSERT INTO knowledge_items(key, topic_category, locale, text, is_active, priority, meta_json, created_at, updated_at)
VALUES('natal.house.10.ruler.any', 'career', 'ru-RU', 'Управитель 10 дома — ключ к карьере и статусу: через что ты строишь результат, репутацию и долгую траекторию. Он показывает, где легче взять лидерство, а где важнее система, дисциплина и правила игры. Практика: выбери 1 стандарт качества/границ на 14 дней (что делаю всегда, а что не беру) и закрепи как правило.', 1, 140, '{}', datetime('now'), CAST(strftime('%s','now') AS INTEGER))
ON CONFLICT(key, topic_category, locale) DO UPDATE SET
  text=excluded.text,
  is_active=excluded.is_active,
  priority=excluded.priority,
  meta_json=COALESCE(excluded.meta_json, knowledge_items.meta_json),
  updated_at=excluded.updated_at;

INSERT INTO knowledge_items(key, topic_category, locale, text, is_active, priority, meta_json, created_at, updated_at)
VALUES('natal.house.10.ruler.venus.aspect.sextile.mars', 'career', 'ru-RU', 'Управитель 10-й дом (карьера и статус) (Венера) в аспекте секстиле с Марс: это влияет на то, как ты решаешь задачи дома. Обычно это даёт ресурс и проще превращается в навык/результат. Практика: опиши 1 сценарий (триггер → реакция → итог) и заранее задай правило, которое улучшает итог.', 1, 140, '{}', datetime('now'), CAST(strftime('%s','now') AS INTEGER))
ON CONFLICT(key, topic_category, locale) DO UPDATE SET
  text=excluded.text,
  is_active=excluded.is_active,
  priority=excluded.priority,
  meta_json=COALESCE(excluded.meta_json, knowledge_items.meta_json),
  updated_at=excluded.updated_at;

INSERT INTO knowledge_items(key, topic_category, locale, text, is_active, priority, meta_json, created_at, updated_at)
VALUES('natal.sign.gemini.present', 'career', 'ru-RU', 'Близнецы заметно проявлен в карте. Сильные стороны: гибкость, любознательность, коммуникации. Риски перекоса: поверхностность, распыление, нервозность. Практика: выбери 1 сильную сторону и 1 риск и закрепи их в конкретном действии на неделю (что усиливаю, что ограничиваю, по каким признакам пойму, что баланс соблюдён).', 1, 140, '{}', datetime('now'), CAST(strftime('%s','now') AS INTEGER))
ON CONFLICT(key, topic_category, locale) DO UPDATE SET
  text=excluded.text,
  is_active=excluded.is_active,
  priority=excluded.priority,
  meta_json=COALESCE(excluded.meta_json, knowledge_items.meta_json),
  updated_at=excluded.updated_at;

INSERT INTO knowledge_items(key, topic_category, locale, text, is_active, priority, meta_json, created_at, updated_at)
VALUES('natal.sign.taurus.present', 'career', 'ru-RU', 'Телец заметно проявлен в карте. Сильные стороны: устойчивость, терпение, практичность. Риски перекоса: инертность, упрямство, страх перемен. Практика: выбери 1 сильную сторону и 1 риск и закрепи их в конкретном действии на неделю (что усиливаю, что ограничиваю, по каким признакам пойму, что баланс соблюдён).', 1, 140, '{}', datetime('now'), CAST(strftime('%s','now') AS INTEGER))
ON CONFLICT(key, topic_category, locale) DO UPDATE SET
  text=excluded.text,
  is_active=excluded.is_active,
  priority=excluded.priority,
  meta_json=COALESCE(excluded.meta_json, knowledge_items.meta_json),
  updated_at=excluded.updated_at;

INSERT INTO knowledge_items(key, topic_category, locale, text, is_active, priority, meta_json, created_at, updated_at)
VALUES('natal.sign.leo.present', 'career', 'ru-RU', 'Лев заметно проявлен в карте. Сильные стороны: творчество, лидерство, щедрость. Риски перекоса: гордыня, драматизация, потребность в признании. Практика: выбери 1 сильную сторону и 1 риск и закрепи их в конкретном действии на неделю (что усиливаю, что ограничиваю, по каким признакам пойму, что баланс соблюдён).', 1, 140, '{}', datetime('now'), CAST(strftime('%s','now') AS INTEGER))
ON CONFLICT(key, topic_category, locale) DO UPDATE SET
  text=excluded.text,
  is_active=excluded.is_active,
  priority=excluded.priority,
  meta_json=COALESCE(excluded.meta_json, knowledge_items.meta_json),
  updated_at=excluded.updated_at;

INSERT INTO knowledge_items(key, topic_category, locale, text, is_active, priority, meta_json, created_at, updated_at)
VALUES('natal.sign.pisces.present', 'career', 'ru-RU', 'Рыбы заметно проявлен в карте. Сильные стороны: эмпатия, воображение, тонкость. Риски перекоса: уход в иллюзии, размытые границы, усталость. Практика: выбери 1 сильную сторону и 1 риск и закрепи их в конкретном действии на неделю (что усиливаю, что ограничиваю, по каким признакам пойму, что баланс соблюдён).', 1, 140, '{}', datetime('now'), CAST(strftime('%s','now') AS INTEGER))
ON CONFLICT(key, topic_category, locale) DO UPDATE SET
  text=excluded.text,
  is_active=excluded.is_active,
  priority=excluded.priority,
  meta_json=COALESCE(excluded.meta_json, knowledge_items.meta_json),
  updated_at=excluded.updated_at;

INSERT INTO knowledge_items(key, topic_category, locale, text, is_active, priority, meta_json, created_at, updated_at)
VALUES('natal.sign.capricorn.present', 'career', 'ru-RU', 'Козерог заметно проявлен в карте. Сильные стороны: дисциплина, стратегия, ответственность. Риски перекоса: жёсткость, перегруз, холодность. Практика: выбери 1 сильную сторону и 1 риск и закрепи их в конкретном действии на неделю (что усиливаю, что ограничиваю, по каким признакам пойму, что баланс соблюдён).', 1, 140, '{}', datetime('now'), CAST(strftime('%s','now') AS INTEGER))
ON CONFLICT(key, topic_category, locale) DO UPDATE SET
  text=excluded.text,
  is_active=excluded.is_active,
  priority=excluded.priority,
  meta_json=COALESCE(excluded.meta_json, knowledge_items.meta_json),
  updated_at=excluded.updated_at;

INSERT INTO knowledge_items(key, topic_category, locale, text, is_active, priority, meta_json, created_at, updated_at)
VALUES('natal.sign.scorpio.present', 'career', 'ru-RU', 'Скорпион заметно проявлен в карте. Сильные стороны: интенсивность, глубина, воля. Риски перекоса: контроль, крайности, ревность. Практика: выбери 1 сильную сторону и 1 риск и закрепи их в конкретном действии на неделю (что усиливаю, что ограничиваю, по каким признакам пойму, что баланс соблюдён).', 1, 140, '{}', datetime('now'), CAST(strftime('%s','now') AS INTEGER))
ON CONFLICT(key, topic_category, locale) DO UPDATE SET
  text=excluded.text,
  is_active=excluded.is_active,
  priority=excluded.priority,
  meta_json=COALESCE(excluded.meta_json, knowledge_items.meta_json),
  updated_at=excluded.updated_at;

INSERT INTO knowledge_items(key, topic_category, locale, text, is_active, priority, meta_json, created_at, updated_at)
VALUES('natal.sign.aquarius.present', 'career', 'ru-RU', 'Водолей заметно проявлен в карте. Сильные стороны: оригинальность, свобода, идеи. Риски перекоса: отстранённость, упрямство, бунт ради бунта. Практика: выбери 1 сильную сторону и 1 риск и закрепи их в конкретном действии на неделю (что усиливаю, что ограничиваю, по каким признакам пойму, что баланс соблюдён).', 1, 140, '{}', datetime('now'), CAST(strftime('%s','now') AS INTEGER))
ON CONFLICT(key, topic_category, locale) DO UPDATE SET
  text=excluded.text,
  is_active=excluded.is_active,
  priority=excluded.priority,
  meta_json=COALESCE(excluded.meta_json, knowledge_items.meta_json),
  updated_at=excluded.updated_at;

INSERT INTO knowledge_items(key, topic_category, locale, text, is_active, priority, meta_json, created_at, updated_at)
VALUES('natal.sign.sagittarius.present', 'career', 'ru-RU', 'Стрелец заметно проявлен в карте. Сильные стороны: оптимизм, смысл, расширение горизонтов. Риски перекоса: прямолинейность, обещания без выполнения, избыток риска. Практика: выбери 1 сильную сторону и 1 риск и закрепи их в конкретном действии на неделю (что усиливаю, что ограничиваю, по каким признакам пойму, что баланс соблюдён).', 1, 140, '{}', datetime('now'), CAST(strftime('%s','now') AS INTEGER))
ON CONFLICT(key, topic_category, locale) DO UPDATE SET
  text=excluded.text,
  is_active=excluded.is_active,
  priority=excluded.priority,
  meta_json=COALESCE(excluded.meta_json, knowledge_items.meta_json),
  updated_at=excluded.updated_at;

INSERT INTO knowledge_items(key, topic_category, locale, text, is_active, priority, meta_json, created_at, updated_at)
VALUES('natal.house.10', 'career', 'ru-RU', '10-й дом (карьера и статус): это основная тема дома — где разворачиваются важные сценарии и задачи. Сильная сторона — можно выстроить устойчивую стратегию; риск — реагировать по привычке и терять ресурс. Практика: выбери 1 повторяющуюся ситуацию по теме дома и задай правило на 7 дней (границы/темп/приоритет/коммуникация), затем оцени результат.', 1, 140, '{}', datetime('now'), CAST(strftime('%s','now') AS INTEGER))
ON CONFLICT(key, topic_category, locale) DO UPDATE SET
  text=excluded.text,
  is_active=excluded.is_active,
  priority=excluded.priority,
  meta_json=COALESCE(excluded.meta_json, knowledge_items.meta_json),
  updated_at=excluded.updated_at;

INSERT INTO knowledge_items(key, topic_category, locale, text, is_active, priority, meta_json, created_at, updated_at)
VALUES('natal.angle.mc', 'career', 'ru-RU', 'MC: базовый угол карты, который описывает ось «карьера и статус (вектор реализации)». Сильная сторона — даёт ясный вектор, где настраивать стратегию; риск — действовать по привычке и получать повторяющийся результат. Практика: выбери 1 ситуацию по теме угла и задай правило на 7 дней (границы/темп/ответственность), затем оцени эффект.', 1, 140, '{}', datetime('now'), CAST(strftime('%s','now') AS INTEGER))
ON CONFLICT(key, topic_category, locale) DO UPDATE SET
  text=excluded.text,
  is_active=excluded.is_active,
  priority=excluded.priority,
  meta_json=COALESCE(excluded.meta_json, knowledge_items.meta_json),
  updated_at=excluded.updated_at;


COMMIT;
