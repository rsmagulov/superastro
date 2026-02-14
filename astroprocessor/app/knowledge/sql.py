# astroprocessor/app/knowledge/sql.py
from __future__ import annotations

def sql_norm(col: str) -> str:
    """
    Normalize a SQLite text column expression:
    - COALESCE NULL -> ''
    - replace NBSP with space
    - replace tabs with space
    - TRIM
    """
    return f"TRIM(REPLACE(REPLACE(COALESCE({col}, ''), char(160), ' '), char(9), ' '))"
