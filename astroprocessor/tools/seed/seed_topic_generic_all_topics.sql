-- tools/seed/seed_topic_generic_all_topics.sql
-- NOTE: no BEGIN/COMMIT here because tests run inside an outer transaction.

-- For each topic_category:
-- - ensure topic generic exists (priority >= 80)
-- - ensure global generic exists in same topic_category (priority == 50)

-- personality_core
UPDATE knowledge_items
SET text='global', priority=50, is_active=1, meta_json='{}'
WHERE key='natal.generic' AND topic_category='personality_core' AND locale='ru-RU';
INSERT INTO knowledge_items (key, topic_category, locale, text, priority, is_active, created_at, meta_json)
SELECT 'natal.generic','personality_core','ru-RU','global',50,1,datetime('now'),'{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key='natal.generic' AND topic_category='personality_core' AND locale='ru-RU'
);

UPDATE knowledge_items
SET text='topic', priority=80, is_active=1, meta_json='{}'
WHERE key='natal.personality_core.generic' AND topic_category='personality_core' AND locale='ru-RU';
INSERT INTO knowledge_items (key, topic_category, locale, text, priority, is_active, created_at, meta_json)
SELECT 'natal.personality_core.generic','personality_core','ru-RU','topic',80,1,datetime('now'),'{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key='natal.personality_core.generic' AND topic_category='personality_core' AND locale='ru-RU'
);

-- psychology
UPDATE knowledge_items
SET text='global', priority=50, is_active=1, meta_json='{}'
WHERE key='natal.generic' AND topic_category='psychology' AND locale='ru-RU';
INSERT INTO knowledge_items (key, topic_category, locale, text, priority, is_active, created_at, meta_json)
SELECT 'natal.generic','psychology','ru-RU','global',50,1,datetime('now'),'{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key='natal.generic' AND topic_category='psychology' AND locale='ru-RU'
);

UPDATE knowledge_items
SET text='topic', priority=80, is_active=1, meta_json='{}'
WHERE key='natal.psychology.generic' AND topic_category='psychology' AND locale='ru-RU';
INSERT INTO knowledge_items (key, topic_category, locale, text, priority, is_active, created_at, meta_json)
SELECT 'natal.psychology.generic','psychology','ru-RU','topic',80,1,datetime('now'),'{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key='natal.psychology.generic' AND topic_category='psychology' AND locale='ru-RU'
);

-- talents
UPDATE knowledge_items
SET text='global', priority=50, is_active=1, meta_json='{}'
WHERE key='natal.generic' AND topic_category='talents' AND locale='ru-RU';
INSERT INTO knowledge_items (key, topic_category, locale, text, priority, is_active, created_at, meta_json)
SELECT 'natal.generic','talents','ru-RU','global',50,1,datetime('now'),'{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key='natal.generic' AND topic_category='talents' AND locale='ru-RU'
);

UPDATE knowledge_items
SET text='topic', priority=80, is_active=1, meta_json='{}'
WHERE key='natal.talents.generic' AND topic_category='talents' AND locale='ru-RU';
INSERT INTO knowledge_items (key, topic_category, locale, text, priority, is_active, created_at, meta_json)
SELECT 'natal.talents.generic','talents','ru-RU','topic',80,1,datetime('now'),'{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key='natal.talents.generic' AND topic_category='talents' AND locale='ru-RU'
);

-- strengths_weaknesses
UPDATE knowledge_items
SET text='global', priority=50, is_active=1, meta_json='{}'
WHERE key='natal.generic' AND topic_category='strengths_weaknesses' AND locale='ru-RU';
INSERT INTO knowledge_items (key, topic_category, locale, text, priority, is_active, created_at, meta_json)
SELECT 'natal.generic','strengths_weaknesses','ru-RU','global',50,1,datetime('now'),'{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key='natal.generic' AND topic_category='strengths_weaknesses' AND locale='ru-RU'
);

UPDATE knowledge_items
SET text='topic', priority=80, is_active=1, meta_json='{}'
WHERE key='natal.strengths_weaknesses.generic' AND topic_category='strengths_weaknesses' AND locale='ru-RU';
INSERT INTO knowledge_items (key, topic_category, locale, text, priority, is_active, created_at, meta_json)
SELECT 'natal.strengths_weaknesses.generic','strengths_weaknesses','ru-RU','topic',80,1,datetime('now'),'{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key='natal.strengths_weaknesses.generic' AND topic_category='strengths_weaknesses' AND locale='ru-RU'
);

-- purpose_path
UPDATE knowledge_items
SET text='global', priority=50, is_active=1, meta_json='{}'
WHERE key='natal.generic' AND topic_category='purpose_path' AND locale='ru-RU';
INSERT INTO knowledge_items (key, topic_category, locale, text, priority, is_active, created_at, meta_json)
SELECT 'natal.generic','purpose_path','ru-RU','global',50,1,datetime('now'),'{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key='natal.generic' AND topic_category='purpose_path' AND locale='ru-RU'
);

UPDATE knowledge_items
SET text='topic', priority=80, is_active=1, meta_json='{}'
WHERE key='natal.purpose_path.generic' AND topic_category='purpose_path' AND locale='ru-RU';
INSERT INTO knowledge_items (key, topic_category, locale, text, priority, is_active, created_at, meta_json)
SELECT 'natal.purpose_path.generic','purpose_path','ru-RU','topic',80,1,datetime('now'),'{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key='natal.purpose_path.generic' AND topic_category='purpose_path' AND locale='ru-RU'
);

-- career
UPDATE knowledge_items
SET text='global', priority=50, is_active=1, meta_json='{}'
WHERE key='natal.generic' AND topic_category='career' AND locale='ru-RU';
INSERT INTO knowledge_items (key, topic_category, locale, text, priority, is_active, created_at, meta_json)
SELECT 'natal.generic','career','ru-RU','global',50,1,datetime('now'),'{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key='natal.generic' AND topic_category='career' AND locale='ru-RU'
);

UPDATE knowledge_items
SET text='topic', priority=80, is_active=1, meta_json='{}'
WHERE key='natal.career.generic' AND topic_category='career' AND locale='ru-RU';
INSERT INTO knowledge_items (key, topic_category, locale, text, priority, is_active, created_at, meta_json)
SELECT 'natal.career.generic','career','ru-RU','topic',80,1,datetime('now'),'{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key='natal.career.generic' AND topic_category='career' AND locale='ru-RU'
);

-- money
UPDATE knowledge_items
SET text='global', priority=50, is_active=1, meta_json='{}'
WHERE key='natal.generic' AND topic_category='money' AND locale='ru-RU';
INSERT INTO knowledge_items (key, topic_category, locale, text, priority, is_active, created_at, meta_json)
SELECT 'natal.generic','money','ru-RU','global',50,1,datetime('now'),'{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key='natal.generic' AND topic_category='money' AND locale='ru-RU'
);

UPDATE knowledge_items
SET text='topic', priority=80, is_active=1, meta_json='{}'
WHERE key='natal.money.generic' AND topic_category='money' AND locale='ru-RU';
INSERT INTO knowledge_items (key, topic_category, locale, text, priority, is_active, created_at, meta_json)
SELECT 'natal.money.generic','money','ru-RU','topic',80,1,datetime('now'),'{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key='natal.money.generic' AND topic_category='money' AND locale='ru-RU'
);

-- love_intimacy
UPDATE knowledge_items
SET text='global', priority=50, is_active=1, meta_json='{}'
WHERE key='natal.generic' AND topic_category='love_intimacy' AND locale='ru-RU';
INSERT INTO knowledge_items (key, topic_category, locale, text, priority, is_active, created_at, meta_json)
SELECT 'natal.generic','love_intimacy','ru-RU','global',50,1,datetime('now'),'{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key='natal.generic' AND topic_category='love_intimacy' AND locale='ru-RU'
);

UPDATE knowledge_items
SET text='topic', priority=80, is_active=1, meta_json='{}'
WHERE key='natal.love_intimacy.generic' AND topic_category='love_intimacy' AND locale='ru-RU';
INSERT INTO knowledge_items (key, topic_category, locale, text, priority, is_active, created_at, meta_json)
SELECT 'natal.love_intimacy.generic','love_intimacy','ru-RU','topic',80,1,datetime('now'),'{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key='natal.love_intimacy.generic' AND topic_category='love_intimacy' AND locale='ru-RU'
);

-- partnership_marriage
UPDATE knowledge_items
SET text='global', priority=50, is_active=1, meta_json='{}'
WHERE key='natal.generic' AND topic_category='partnership_marriage' AND locale='ru-RU';
INSERT INTO knowledge_items (key, topic_category, locale, text, priority, is_active, created_at, meta_json)
SELECT 'natal.generic','partnership_marriage','ru-RU','global',50,1,datetime('now'),'{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key='natal.generic' AND topic_category='partnership_marriage' AND locale='ru-RU'
);

UPDATE knowledge_items
SET text='topic', priority=80, is_active=1, meta_json='{}'
WHERE key='natal.partnership_marriage.generic' AND topic_category='partnership_marriage' AND locale='ru-RU';
INSERT INTO knowledge_items (key, topic_category, locale, text, priority, is_active, created_at, meta_json)
SELECT 'natal.partnership_marriage.generic','partnership_marriage','ru-RU','topic',80,1,datetime('now'),'{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key='natal.partnership_marriage.generic' AND topic_category='partnership_marriage' AND locale='ru-RU'
);

-- karmic_tasks
UPDATE knowledge_items
SET text='global', priority=50, is_active=1, meta_json='{}'
WHERE key='natal.generic' AND topic_category='karmic_tasks' AND locale='ru-RU';
INSERT INTO knowledge_items (key, topic_category, locale, text, priority, is_active, created_at, meta_json)
SELECT 'natal.generic','karmic_tasks','ru-RU','global',50,1,datetime('now'),'{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key='natal.generic' AND topic_category='karmic_tasks' AND locale='ru-RU'
);

UPDATE knowledge_items
SET text='topic', priority=80, is_active=1, meta_json='{}'
WHERE key='natal.karmic_tasks.generic' AND topic_category='karmic_tasks' AND locale='ru-RU';
INSERT INTO knowledge_items (key, topic_category, locale, text, priority, is_active, created_at, meta_json)
SELECT 'natal.karmic_tasks.generic','karmic_tasks','ru-RU','topic',80,1,datetime('now'),'{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key='natal.karmic_tasks.generic' AND topic_category='karmic_tasks' AND locale='ru-RU'
);

-- past_lives_symbolic
UPDATE knowledge_items
SET text='global', priority=50, is_active=1, meta_json='{}'
WHERE key='natal.generic' AND topic_category='past_lives_symbolic' AND locale='ru-RU';
INSERT INTO knowledge_items (key, topic_category, locale, text, priority, is_active, created_at, meta_json)
SELECT 'natal.generic','past_lives_symbolic','ru-RU','global',50,1,datetime('now'),'{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key='natal.generic' AND topic_category='past_lives_symbolic' AND locale='ru-RU'
);

UPDATE knowledge_items
SET text='topic', priority=80, is_active=1, meta_json='{}'
WHERE key='natal.past_lives_symbolic.generic' AND topic_category='past_lives_symbolic' AND locale='ru-RU';
INSERT INTO knowledge_items (key, topic_category, locale, text, priority, is_active, created_at, meta_json)
SELECT 'natal.past_lives_symbolic.generic','past_lives_symbolic','ru-RU','topic',80,1,datetime('now'),'{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key='natal.past_lives_symbolic.generic' AND topic_category='past_lives_symbolic' AND locale='ru-RU'
);

-- emotional_world
UPDATE knowledge_items
SET text='global', priority=50, is_active=1, meta_json='{}'
WHERE key='natal.generic' AND topic_category='emotional_world' AND locale='ru-RU';
INSERT INTO knowledge_items (key, topic_category, locale, text, priority, is_active, created_at, meta_json)
SELECT 'natal.generic','emotional_world','ru-RU','global',50,1,datetime('now'),'{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key='natal.generic' AND topic_category='emotional_world' AND locale='ru-RU'
);

UPDATE knowledge_items
SET text='topic', priority=80, is_active=1, meta_json='{}'
WHERE key='natal.emotional_world.generic' AND topic_category='emotional_world' AND locale='ru-RU';
INSERT INTO knowledge_items (key, topic_category, locale, text, priority, is_active, created_at, meta_json)
SELECT 'natal.emotional_world.generic','emotional_world','ru-RU','topic',80,1,datetime('now'),'{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key='natal.emotional_world.generic' AND topic_category='emotional_world' AND locale='ru-RU'
);

-- how_others_see_me
UPDATE knowledge_items
SET text='global', priority=50, is_active=1, meta_json='{}'
WHERE key='natal.generic' AND topic_category='how_others_see_me' AND locale='ru-RU';
INSERT INTO knowledge_items (key, topic_category, locale, text, priority, is_active, created_at, meta_json)
SELECT 'natal.generic','how_others_see_me','ru-RU','global',50,1,datetime('now'),'{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key='natal.generic' AND topic_category='how_others_see_me' AND locale='ru-RU'
);

UPDATE knowledge_items
SET text='topic', priority=80, is_active=1, meta_json='{}'
WHERE key='natal.how_others_see_me.generic' AND topic_category='how_others_see_me' AND locale='ru-RU';
INSERT INTO knowledge_items (key, topic_category, locale, text, priority, is_active, created_at, meta_json)
SELECT 'natal.how_others_see_me.generic','how_others_see_me','ru-RU','topic',80,1,datetime('now'),'{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key='natal.how_others_see_me.generic' AND topic_category='how_others_see_me' AND locale='ru-RU'
);

-- self_esteem
UPDATE knowledge_items
SET text='global', priority=50, is_active=1, meta_json='{}'
WHERE key='natal.generic' AND topic_category='self_esteem' AND locale='ru-RU';
INSERT INTO knowledge_items (key, topic_category, locale, text, priority, is_active, created_at, meta_json)
SELECT 'natal.generic','self_esteem','ru-RU','global',50,1,datetime('now'),'{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key='natal.generic' AND topic_category='self_esteem' AND locale='ru-RU'
);

UPDATE knowledge_items
SET text='topic', priority=80, is_active=1, meta_json='{}'
WHERE key='natal.self_esteem.generic' AND topic_category='self_esteem' AND locale='ru-RU';
INSERT INTO knowledge_items (key, topic_category, locale, text, priority, is_active, created_at, meta_json)
SELECT 'natal.self_esteem.generic','self_esteem','ru-RU','topic',80,1,datetime('now'),'{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key='natal.self_esteem.generic' AND topic_category='self_esteem' AND locale='ru-RU'
);

-- creativity
UPDATE knowledge_items
SET text='global', priority=50, is_active=1, meta_json='{}'
WHERE key='natal.generic' AND topic_category='creativity' AND locale='ru-RU';
INSERT INTO knowledge_items (key, topic_category, locale, text, priority, is_active, created_at, meta_json)
SELECT 'natal.generic','creativity','ru-RU','global',50,1,datetime('now'),'{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key='natal.generic' AND topic_category='creativity' AND locale='ru-RU'
);

UPDATE knowledge_items
SET text='topic', priority=80, is_active=1, meta_json='{}'
WHERE key='natal.creativity.generic' AND topic_category='creativity' AND locale='ru-RU';
INSERT INTO knowledge_items (key, topic_category, locale, text, priority, is_active, created_at, meta_json)
SELECT 'natal.creativity.generic','creativity','ru-RU','topic',80,1,datetime('now'),'{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key='natal.creativity.generic' AND topic_category='creativity' AND locale='ru-RU'
);

-- ancestral_topics
UPDATE knowledge_items
SET text='global', priority=50, is_active=1, meta_json='{}'
WHERE key='natal.generic' AND topic_category='ancestral_topics' AND locale='ru-RU';
INSERT INTO knowledge_items (key, topic_category, locale, text, priority, is_active, created_at, meta_json)
SELECT 'natal.generic','ancestral_topics','ru-RU','global',50,1,datetime('now'),'{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key='natal.generic' AND topic_category='ancestral_topics' AND locale='ru-RU'
);

UPDATE knowledge_items
SET text='topic', priority=80, is_active=1, meta_json='{}'
WHERE key='natal.ancestral_topics.generic' AND topic_category='ancestral_topics' AND locale='ru-RU';
INSERT INTO knowledge_items (key, topic_category, locale, text, priority, is_active, created_at, meta_json)
SELECT 'natal.ancestral_topics.generic','ancestral_topics','ru-RU','topic',80,1,datetime('now'),'{}'
WHERE NOT EXISTS (
  SELECT 1 FROM knowledge_items
  WHERE key='natal.ancestral_topics.generic' AND topic_category='ancestral_topics' AND locale='ru-RU'
);