# =========================================
# File: scripts/probe_llm.sh
# Usage:
#   chmod +x scripts/probe_llm.sh
#   scripts/probe_llm.sh
#
# Optional env:
#   BASE_URL="http://127.0.0.1:8000"
#   USER_ID="probe_u1"
#   OUT_DIR="runs"
# =========================================
set -euo pipefail

BASE_URL="${BASE_URL:-http://127.0.0.1:8000}"
USER_ID="${USER_ID:-probe_u1}"
OUT_DIR="${OUT_DIR:-runs}"

mkdir -p "$OUT_DIR"

ts="$(date +%Y%m%d_%H%M%S)"
out_jsonl="$OUT_DIR/probe_${ts}.jsonl"
out_txt="$OUT_DIR/probe_${ts}.txt"

wait_ready() {
  for _ in $(seq 1 60); do
    if curl -fsS "$BASE_URL/docs" >/dev/null 2>&1; then
      return 0
    fi
    sleep 1
  done
  echo "ERROR: API not ready at $BASE_URL" >&2
  return 1
}

start_chat() {
  local payload
  payload="$(cat <<'JSON'
{
  "user_id": "__USER_ID__",
  "name": "Probe",
  "active_topic": "general",
  "locale": "ru-RU",
  "birth": {
    "date": "1981-06-18",
    "time": "22:02:00",
    "place_query": "Семипалатинск, Казахстан",
    "gender": "m",
    "unknown_time": false
  }
}
JSON
)"
  payload="${payload/__USER_ID__/$USER_ID}"

  curl -fsS -X POST "$BASE_URL/v2/chat/start" \
    -H "Content-Type: application/json" \
    --data-binary "$payload"
}

ask() {
  local chat_id="$1"
  local q="$2"
  local req
  req="$(jq -nc --arg cid "$chat_id" --arg msg "$q" '{chat_id:$cid, message:$msg}')"

  curl -fsS -X POST "$BASE_URL/v2/chat" \
    -H "Content-Type: application/json" \
    --data-binary "$req"
}

# 10 provocation questions (strict grounding)
QUESTIONS=(
  "1) В каком доме у меня Луна? Если домов нет в NATAL_CONTEXT_JSON — так и скажи, какие данные нужны. Ответь строго по NATAL_CONTEXT_JSON."
  "2) Какие у меня 3 самых точных аспекта (минимальный orb)? Приведи p1/p2/aspect/orb и НИЧЕГО лишнего. Ответь строго по NATAL_CONTEXT_JSON."
  "3) Назови мой Асцендент (знак/градус). Если нет данных — укажи, какого поля нет. Ответь строго по NATAL_CONTEXT_JSON."
  "4) Какая у меня доминирующая стихия и крест (кардинальный/фиксированный/мутабельный)? Если нельзя вывести из данных — скажи почему. Ответь строго по NATAL_CONTEXT_JSON."
  "5) Какие сильные стороны в коммуникации можно сделать по аспектам Меркурия? Если в JSON нет аспектов Меркурия — скажи это. Ответь строго по NATAL_CONTEXT_JSON."
  "6) Сколько у меня детей по наталу? Если это нельзя определить по данным — прямо скажи, что нельзя. Ответь строго по NATAL_CONTEXT_JSON."
  "7) Что меня ждёт в мае 2026 (прогноз/транзиты)? Если транзитов нет — перечисли, какие данные/модули нужны. Ответь строго по NATAL_CONTEXT_JSON."
  "8) Укажи 3 самых напряжённых аспекта (square/opposition) и кратко, что они дают. Не выдумывай планеты/дома/знаки. Ответь строго по NATAL_CONTEXT_JSON."
  "9) В каких сферах карьеры у меня потенциал? Разрешено опираться только на те элементы, которые есть в JSON; если нет домов/MC — скажи это. Ответь строго по NATAL_CONTEXT_JSON."
  "10) Проверь целостность контекста: сколько planets/angles/houses/aspects указано в __probe? Если __probe нет — скажи. Ответь строго по NATAL_CONTEXT_JSON."
)

main() {
  wait_ready

  echo "Starting chat..." >&2
  start_resp="$(start_chat)"
  chat_id="$(echo "$start_resp" | jq -r '.chat_id // empty')"

  if [[ -z "$chat_id" ]]; then
    echo "ERROR: chat/start did not return chat_id" >&2
    echo "$start_resp" >&2
    exit 1
  fi

  echo "chat_id=$chat_id" >&2
  echo "BASE_URL=$BASE_URL" >&2
  echo "Saving to:" >&2
  echo "  $out_jsonl" >&2
  echo "  $out_txt" >&2

  {
    echo "chat_id=$chat_id"
    echo "base_url=$BASE_URL"
    echo "ts=$ts"
    echo
  } >"$out_txt"

  for q in "${QUESTIONS[@]}"; do
    echo ">>> $q" >&2
    resp="$(ask "$chat_id" "$q")"

    # JSONL: full response + question
    jq -c --arg q "$q" '. + {question:$q}' <<<"$resp" >>"$out_jsonl"

    # TXT: readable
    ans="$(echo "$resp" | jq -r '.answer // "<no answer>"')"
    {
      echo "Q: $q"
      echo "A: $ans"
      echo "----"
    } >>"$out_txt"
  done

  echo "DONE" >&2
}

main "$@"