#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
VENV_DIR="$ROOT_DIR/.venv"
ASTRO_DIR="$ROOT_DIR/astroprocessor"

if [[ ! -d "$VENV_DIR" ]]; then
  echo "ERROR: venv not found at $VENV_DIR"
  exit 1
fi

if [[ ! -d "$ASTRO_DIR/app" ]]; then
  echo "ERROR: expected $ASTRO_DIR/app not found"
  exit 1
fi

# shellcheck disable=SC1091
source "$VENV_DIR/bin/activate"

HOST="${HOST:-0.0.0.0}"
PORT="${PORT:-8000}"
WORKERS="${WORKERS:-1}"
RELOAD="${RELOAD:-0}"

# Important: run from astroprocessor/ so imports like "from app...." work.
cd "$ASTRO_DIR"

APP_IMPORT="app.main:app"

if [[ "$RELOAD" == "1" ]]; then
  exec python -m uvicorn "$APP_IMPORT" \
    --host "$HOST" \
    --port "$PORT" \
    --reload
else
  exec python -m uvicorn "$APP_IMPORT" \
    --host "$HOST" \
    --port "$PORT" \
    --workers "$WORKERS"
fi
