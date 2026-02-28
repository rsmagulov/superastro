import sqlite3

def ensure_staging_schema(conn: sqlite3.Connection) -> None:
    conn.executescript("""
    -- (тот же CREATE TABLE скрипт что выше)
    """)
