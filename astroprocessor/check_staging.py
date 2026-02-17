import sqlite3, os, sys
from pathlib import Path

candidates = [
    Path(r"data\staging.db"),
    Path(r"data\staging\staging.db"),
]

db_path = None
for p in candidates:
    if p.exists():
        db_path = p
        break

print("found staging db:", str(db_path) if db_path else None)
if db_path is None:
    print("staging exists: False")
    sys.exit(0)

print("staging exists: True")

con = sqlite3.connect(str(db_path))
con.row_factory = sqlite3.Row

tables = [r["name"] for r in con.execute("select name from sqlite_master where type='table'").fetchall()]
print("tables_total:", len(tables))
print("tables_sample:", [t for t in tables if ("chunk" in t.lower() or "source" in t.lower() or t.lower().startswith("kb_"))][:50])

for t in tables:
    tl = t.lower()
    if ("chunk" in tl) or ("source" in tl) or tl.startswith("kb_"):
        try:
            n = con.execute(f"select count(*) from {t}").fetchone()[0]
            print(f"{t}: rows={n}")
        except Exception as e:
            print(f"{t}: error={e}")

con.close()
