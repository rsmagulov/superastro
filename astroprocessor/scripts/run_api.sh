#!/usr/bin/env bash
set -euo pipefail

PORT="${PORT:-8001}"

cd "$HOME/Documents/LLM/superastro/astroprocessor"
source "$HOME/Documents/LLM/superastro/.venv/bin/activate"

echo "[run_api] killing listeners on port $PORT (if any)..."
PIDS="$(lsof -t -iTCP:"$PORT" -sTCP:LISTEN 2>/dev/null || true)"
if [[ -n "${PIDS}" ]]; then
  echo "$PIDS" | xargs -r kill -TERM
  sleep 1
  # если не умерли — добиваем
  PIDS2="$(lsof -t -iTCP:"$PORT" -sTCP:LISTEN 2>/dev/null || true)"
  if [[ -n "${PIDS2}" ]]; then
    echo "$PIDS2" | xargs -r kill -KILL
  fi
fi

# опционально: если saiga-hot когда-то мешал
if systemctl is-active --quiet saiga-hot.service 2>/dev/null; then
  echo "[run_api] stopping saiga-hot.service..."
  sudo systemctl stop saiga-hot.service || true
fi

export PYTORCH_CUDA_ALLOC_CONF="${PYTORCH_CUDA_ALLOC_CONF:-expandable_segments:True,max_split_size_mb:128}"
export TOKENIZERS_PARALLELISM="${TOKENIZERS_PARALLELISM:-false}"
export OMP_NUM_THREADS="${OMP_NUM_THREADS:-1}"
export MKL_NUM_THREADS="${MKL_NUM_THREADS:-1}"

echo "[run_api] starting uvicorn..."
exec uvicorn app.main:app --host 0.0.0.0 --port "$PORT" --env-file .env