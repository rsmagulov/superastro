import sqlite3

con = sqlite3.connect("data/knowledge.db")
cur = con.cursor()

print("TABLE SQL:")
row = cur.execute(
    "SELECT sql FROM sqlite_master WHERE type='table' AND name='knowledge_items'"
).fetchone()
print(row[0] if row else "no table")

print("\nINDEXES:")
indexes = cur.execute("PRAGMA index_list('knowledge_items')").fetchall()
for idx in indexes:
    print(idx)

print("\nUNIQUE INDEX DETAILS:")
for idx in indexes:
    name = idx[1]
    unique = idx[2]
    if unique:
        cols = cur.execute(f"PRAGMA index_info('{name}')").fetchall()
        print(name, "=>", [c[2] for c in cols])

con.close()
