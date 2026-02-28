# FILE: C:\Projects\superastro\astroprocessor\tools\seed\smoke_synth_text.py
from __future__ import annotations

import runpy
from pathlib import Path


GEN = Path(r"C:\Projects\superastro\astroprocessor\tools\seed\generate_career_overrides_from_debug_shortest.py")
mod = runpy.run_path(str(GEN))
synth_text = mod["synth_text"]

TOPIC = "career"

KEYS = [
    "natal.house.7.ruler.mercury",
    "natal.house.7.ruler.mercury.sign.any",
    "natal.house.7.ruler.mercury.aspects.present",
    "natal.house.7.ruler.mercury.aspect.square.mars",
    "natal.house.2.ruler.venus",
    "natal.house.2.ruler.venus.aspect.trine.jupiter",
    "natal.house.10.ruler.saturn",
    "natal.house.10.ruler.saturn.sign.any",
    "natal.house.1.ruler.mars",
    "natal.house.1.ruler.mars.aspects.present",
    "natal.house.12.ruler.neptune",
    "natal.house.12.ruler.neptune.aspect.opposition.mercury",
]

# --- cusp.sign.* smoke keys
KEYS += [
    "natal.house.1.cusp.sign.any",
    "natal.house.1.cusp.sign.pisces",
    "natal.house.2.cusp.sign.any",
    "natal.house.2.cusp.sign.taurus",
    "natal.house.4.cusp.sign.cancer",
    "natal.house.5.cusp.sign.leo",
    "natal.house.7.cusp.sign.any",
    "natal.house.7.cusp.sign.libra",
    "natal.house.8.cusp.sign.scorpio",
    "natal.house.9.cusp.sign.sagittarius",
    "natal.house.10.cusp.sign.capricorn",
    "natal.house.12.cusp.sign.any",
]

KEYS += [
    "natal.house.1",
    "natal.house.2",
    "natal.house.3",
    "natal.house.4",
    "natal.house.5",
    "natal.house.6",
    "natal.house.7",
    "natal.house.8",
    "natal.house.9",
    "natal.house.10",
    "natal.house.11",
    "natal.house.12",
]

KEYS += [
    "natal.angle.mc",
    "natal.angle.ic",
    "natal.angle.dc",
    "natal.angle.dsc",
    "natal.angle.mc.sign.capricorn",
    "natal.angle.dc.sign.libra",
]
bad = 0
for k in KEYS:
    t = synth_text(key=k, topic=TOPIC)
    is_default = t.startswith(("Натальный маркер", "Карьерный маркер"))

    one_line = t.replace("\n", " ").strip()
    cut = 220
    chunk = one_line[:cut]

    tail = one_line[cut:cut + 400]
    end_pos = -1
    for p in [".", "!", "?"]:
        i = tail.find(p)
        if i != -1:
            end_pos = i
            break
    if end_pos != -1:
        chunk = one_line[:cut + end_pos + 1]

print(f"{k} DEFAULT_FALLBACK={is_default} len={len(t)}")
print(chunk)

print("\nRESULT:", "OK" if bad == 0 else f"BAD={bad}")
raise SystemExit(0 if bad == 0 else 2)