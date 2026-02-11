import json
import sys
import requests

URL = "http://127.0.0.1:8000/admin/knowledge/items"
PATH = sys.argv[1]

ok = 0
bad = 0

with open(PATH, "r", encoding="utf-8") as f:
    for i, line in enumerate(f, 1):
        line = line.strip()
        if not line:
            continue
        payload = json.loads(line)

        r = requests.post(URL, json=payload, timeout=30)
        if r.status_code in (200, 201):
            ok += 1
        else:
            bad += 1
            print(f"[{i}] FAIL {r.status_code}: {r.text}")

print(f"DONE ok={ok} bad={bad}")
