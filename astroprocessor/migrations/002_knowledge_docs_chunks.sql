-- migrations/002_knowledge_docs_chunks.sql
PRAGMA foreign_keys = ON;

-- 1) Документы (книги/статьи)
CREATE TABLE IF NOT EXISTS knowledge_docs (
    id           INTEGER PRIMARY KEY AUTOINCREMENT,
    source_path  TEXT NOT NULL UNIQUE,
    title        TEXT,
    author       TEXT,
    lang         TEXT NOT NULL DEFAULT 'ru-RU',
    format       TEXT,
    bytes        INTEGER,
    sha256       TEXT,
    created_at   TEXT NOT NULL DEFAULT (strftime('%Y-%m-%dT%H:%M:%SZ','now'))
);

CREATE INDEX IF NOT EXISTS idx_knowledge_docs_lang ON knowledge_docs(lang);

-- 2) Чанки текста
CREATE TABLE IF NOT EXISTS knowledge_chunks (
    id            INTEGER PRIMARY KEY AUTOINCREMENT,
    doc_id        INTEGER NOT NULL REFERENCES knowledge_docs(id) ON DELETE CASCADE,
    chunk_index   INTEGER NOT NULL,
    topic_domain  TEXT NOT NULL DEFAULT 'general',  -- natal/synastry/transits/...
    tags_json     TEXT NOT NULL DEFAULT '{}',       -- JSON со списками/счётчиками
    text          TEXT NOT NULL,
    created_at    TEXT NOT NULL DEFAULT (strftime('%Y-%m-%dT%H:%M:%SZ','now')),
    UNIQUE(doc_id, chunk_index)
);

CREATE INDEX IF NOT EXISTS idx_knowledge_chunks_doc ON knowledge_chunks(doc_id);
CREATE INDEX IF NOT EXISTS idx_knowledge_chunks_domain ON knowledge_chunks(topic_domain);

-- 3) Полнотекстовый индекс
-- Используем внешнее содержимое (content=knowledge_chunks) + BM25
CREATE VIRTUAL TABLE IF NOT EXISTS knowledge_chunks_fts
USING fts5(
    text,
    content='knowledge_chunks',
    content_rowid='id',
    tokenize='unicode61 remove_diacritics 2'
);

-- 4) Триггеры синхронизации FTS
CREATE TRIGGER IF NOT EXISTS knowledge_chunks_ai AFTER INSERT ON knowledge_chunks BEGIN
    INSERT INTO knowledge_chunks_fts(rowid, text) VALUES (new.id, new.text);
END;

CREATE TRIGGER IF NOT EXISTS knowledge_chunks_ad AFTER DELETE ON knowledge_chunks BEGIN
    INSERT INTO knowledge_chunks_fts(knowledge_chunks_fts, rowid, text)
    VALUES ('delete', old.id, old.text);
END;

CREATE TRIGGER IF NOT EXISTS knowledge_chunks_au AFTER UPDATE ON knowledge_chunks BEGIN
    INSERT INTO knowledge_chunks_fts(knowledge_chunks_fts, rowid, text)
    VALUES ('delete', old.id, old.text);
    INSERT INTO knowledge_chunks_fts(rowid, text) VALUES (new.id, new.text);
END;
