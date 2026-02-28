-- staging_schema.sql
PRAGMA foreign_keys = ON;
PRAGMA journal_mode = WAL;
PRAGMA synchronous = NORMAL;

-- Версия схемы/миграций
CREATE TABLE IF NOT EXISTS kb_schema_meta (
  key TEXT PRIMARY KEY,
  value TEXT NOT NULL
);

-- Источники (книги/документы/файлы)
CREATE TABLE IF NOT EXISTS kb_sources (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  title TEXT NOT NULL,
  path TEXT,
  sha256 TEXT,
  imported_at TEXT NOT NULL,
  notes TEXT
);

CREATE INDEX IF NOT EXISTS idx_kb_sources_sha256 ON kb_sources(sha256);

-- Атом знаний (фрагмент)
CREATE TABLE IF NOT EXISTS kb_fragments (
  id INTEGER PRIMARY KEY AUTOINCREMENT,

  -- уникальный ключ фрагмента в рамках языка
  key TEXT NOT NULL,
  locale TEXT NOT NULL DEFAULT 'ru-RU',

  topic_category TEXT NOT NULL,

  text TEXT NOT NULL,

  tone TEXT NOT NULL CHECK (tone IN ('supportive','neutral','warning')),
  abstraction_level TEXT NOT NULL CHECK (abstraction_level IN ('psychological','symbolic','behavioral')),

  state TEXT NOT NULL CHECK (state IN (
    'draft','needs_review','reviewed','annotated','validated','enabled','archived'
  )),

  -- привязки к астрологическим факторам (планета/дом/аспект и т.п.)
  factors_json TEXT NOT NULL DEFAULT '{}',

  -- мета/тэги/доп. поля (на будущее)
  meta_json TEXT NOT NULL DEFAULT '{}',

  source_id INTEGER,
  author TEXT,

  created_at TEXT NOT NULL,
  updated_at TEXT NOT NULL,

  FOREIGN KEY (source_id) REFERENCES kb_sources(id) ON DELETE SET NULL,
  UNIQUE (key, locale)
);

CREATE INDEX IF NOT EXISTS idx_kb_fragments_state ON kb_fragments(state);
CREATE INDEX IF NOT EXISTS idx_kb_fragments_topic ON kb_fragments(topic_category);
CREATE INDEX IF NOT EXISTS idx_kb_fragments_locale ON kb_fragments(locale);
CREATE INDEX IF NOT EXISTS idx_kb_fragments_key ON kb_fragments(key);

-- Аудит переходов состояний
CREATE TABLE IF NOT EXISTS kb_events (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  fragment_id INTEGER NOT NULL,
  from_state TEXT,
  to_state TEXT NOT NULL,
  who TEXT,
  note TEXT,
  ts TEXT NOT NULL,
  FOREIGN KEY (fragment_id) REFERENCES kb_fragments(id) ON DELETE CASCADE
);

CREATE INDEX IF NOT EXISTS idx_kb_events_fragment ON kb_events(fragment_id);
CREATE INDEX IF NOT EXISTS idx_kb_events_ts ON kb_events(ts);

-- Информация о сборках (manifest + stats)
CREATE TABLE IF NOT EXISTS kb_builds (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  version TEXT NOT NULL UNIQUE,           -- v0001, v0002, ...
  created_at TEXT NOT NULL,
  manifest_json TEXT NOT NULL DEFAULT '{}',
  stats_json TEXT NOT NULL DEFAULT '{}'
);
