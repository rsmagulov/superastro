# astroprocessor/tools/check_kb_coverage.ps1
[CmdletBinding()]
param(
  [string]$ApiBaseUrl = "http://127.0.0.1:8000",
  [string]$Locale = "ru",
  [int]$DebugLevel = 2,

  [int]$MaxBlocks = 50,

  # Accept as string: "30,50,80" / "30 50 80" / "30;50;80"
  [string]$MaxBlocksList = "",

  [string]$Name = "Test",
  [string]$BirthDate = "1990-01-01",
  [string]$BirthTime = "12:00",
  [string]$PlaceQuery = "Moscow",
  [string]$Gender = "male",

  [string]$RepoRoot = "",
  [string]$DbPath = "",

  [string[]]$OnlyTopics = @(),

  [string]$PythonExe = "python",
  [string]$TopicRuModule = "app.services.search_intent_builder"
)

Set-StrictMode -Version Latest
$ErrorActionPreference = "Stop"

function Write-Section([string]$Title) {
  Write-Host ""
  Write-Host ("=" * 80) -ForegroundColor DarkGray
  Write-Host $Title -ForegroundColor Cyan
  Write-Host ("=" * 80) -ForegroundColor DarkGray
}

function Require-Command([string]$Cmd) {
  if (-not (Get-Command $Cmd -ErrorAction SilentlyContinue)) {
    throw "Required command not found: $Cmd"
  }
}

function Resolve-RepoRoot {
  param([string]$Provided)
  if ($Provided -and (Test-Path $Provided)) { return (Resolve-Path $Provided).Path }
  $here = Split-Path -Parent $PSCommandPath
  $root = Split-Path -Parent $here
  return (Resolve-Path $root).Path
}

function Resolve-ProjectRootForImports {
  param([string]$Root)
  if (Test-Path (Join-Path $Root "app")) { return (Resolve-Path $Root).Path }
  if (Test-Path (Join-Path $Root "astroprocessor\app")) { return (Resolve-Path (Join-Path $Root "astroprocessor")).Path }
  throw "Could not find app/ for imports. Root=$Root"
}

function Resolve-DbPath {
  param([string]$Provided, [string]$Root)
  if ($Provided) { return (Resolve-Path $Provided).Path }
  $candidates = @(
    (Join-Path $Root "data\knowledge.db"),
    (Join-Path $Root "astroprocessor\data\knowledge.db")
  )
  foreach ($c in $candidates) { if (Test-Path $c) { return (Resolve-Path $c).Path } }
  throw "knowledge.db not found. Provide -DbPath explicitly."
}

function Invoke-SqliteScalar {
  param([string]$Db, [string]$Sql)
  $out = & sqlite3 $Db $Sql 2>$null
  return ($out | Out-String).Trim()
}

function Invoke-SqliteTable {
  param([string]$Db, [string]$Sql)
  & sqlite3 -header -column $Db $Sql
}

function Invoke-Interpret {
  param([string]$Url, [hashtable]$Payload)
  $json = $Payload | ConvertTo-Json -Depth 12
  return Invoke-RestMethod -Method Post -Uri $Url -ContentType "application/json; charset=utf-8" -Body $json
}

function Get-TopicsFromTopicRu {
  param([string]$Python, [string]$ImportRoot, [string]$ModuleName)

  $py = @"
import json, sys
from pathlib import Path
root = Path(r"$ImportRoot").resolve()
sys.path.insert(0, str(root))
m = __import__(r"$ModuleName", fromlist=["TOPIC_RU"])
topic_ru = getattr(m, "TOPIC_RU", None)
if not isinstance(topic_ru, dict):
    raise SystemExit("TOPIC_RU not found or not a dict")
topics = sorted([k for k in topic_ru.keys() if isinstance(k, str) and k.strip()])
print(json.dumps(topics, ensure_ascii=False))
"@

  $raw = & $Python -c $py 2>$null
  if (-not $raw) { throw "Could not load topics from TOPIC_RU via python ($Python)." }
  $parsed = $raw | ConvertFrom-Json

  # FORCE ARRAY (if python returns 1 item, PS can treat as string)
  return @($parsed)
}

function Parse-IntList([string]$s) {
  if (-not $s) { return @() }
  $parts = $s -split '[,\s;]+' | Where-Object { $_ -and $_.Trim() -ne "" }
  $ints = @()
  foreach ($p in $parts) {
    if ($p -notmatch '^\d+$') { throw "Invalid MaxBlocksList token: '$p' (expected integer)" }
    $ints += [int]$p
  }
  return @($ints)  # FORCE ARRAY
}

# ---- Setup ----
Require-Command "sqlite3"
Require-Command $PythonExe

$RepoRoot = Resolve-RepoRoot -Provided $RepoRoot
$ImportRoot = Resolve-ProjectRootForImports -Root $RepoRoot
$DbPath = Resolve-DbPath -Provided $DbPath -Root $RepoRoot

$Budgets = if ($MaxBlocksList) { Parse-IntList $MaxBlocksList } else { @($MaxBlocks) }
$Budgets = @($Budgets) # FORCE ARRAY
if ($Budgets.Count -eq 0) { $Budgets = @($MaxBlocks) }

$Topics = if ($OnlyTopics.Count -gt 0) { @($OnlyTopics) } else { Get-TopicsFromTopicRu -Python $PythonExe -ImportRoot $ImportRoot -ModuleName $TopicRuModule }
$Topics = @($Topics) # FORCE ARRAY

Write-Section "KB Coverage Check"
Write-Host "RepoRoot:    $RepoRoot"
Write-Host "ImportRoot:  $ImportRoot"
Write-Host "DB:          $DbPath"
Write-Host "Python:      $PythonExe"
Write-Host "TOPIC_RU:    $TopicRuModule"
Write-Host ("Budgets:     " + ($Budgets -join ", "))
Write-Host ("Topics:      " + ($Topics -join ", "))

# ---- DB checks ----
Write-Section "DB checks: empty texts / required fallbacks"

$emptyTextCount = [int](Invoke-SqliteScalar -Db $DbPath -Sql `
  "SELECT COUNT(*) FROM knowledge_items WHERE is_active=1 AND locale='ru-RU' AND (text IS NULL OR LENGTH(TRIM(text))=0);")

if ($emptyTextCount -eq 0) {
  Write-Host "OK   empty_text_ru = 0" -ForegroundColor Green
} else {
  Write-Host "FAIL empty_text_ru = $emptyTextCount" -ForegroundColor Red
  Invoke-SqliteTable -Db $DbPath -Sql `
    "SELECT key, COALESCE(topic_category,''), locale, LENGTH(COALESCE(text,'')) AS len
     FROM knowledge_items
     WHERE is_active=1 AND locale='ru-RU' AND (text IS NULL OR LENGTH(TRIM(text))=0)
     ORDER BY key LIMIT 30;"
}

$natalGenericOk = [int](Invoke-SqliteScalar -Db $DbPath -Sql `
  "SELECT COUNT(*) FROM knowledge_items WHERE key='natal.generic' AND is_active=1 AND locale='ru-RU' AND LENGTH(TRIM(text))>0;")

if ($natalGenericOk -ge 1) {
  Write-Host "OK   natal.generic present (ru-RU, active, non-empty)" -ForegroundColor Green
} else {
  Write-Host "FAIL natal.generic missing/empty (ru-RU)" -ForegroundColor Red
}

# ---- API checks ----
Write-Section "API checks per topic & budget"
Write-Host "Criteria per topic+budget:"
Write-Host "  - used_natal_generic_count == 0"
Write-Host "  - candidate_keys_no_active_nonempty_count == 0"
Write-Host ""

$results = New-Object System.Collections.Generic.List[object]
$anyFail = $false

foreach ($budget in $Budgets) {
  $apiUrl = "$ApiBaseUrl/v2/interpret?locale=$Locale&debug=$DebugLevel&max_blocks=$budget"
  Write-Host ("Running budget max_blocks=" + $budget + " -> " + $apiUrl) -ForegroundColor DarkCyan

  foreach ($t in $Topics) {
    $payload = @{
      name = $Name
      birth = @{ date = $BirthDate; time = $BirthTime; place_query = $PlaceQuery; gender = $Gender }
      topic_categories = @($t)
    }

    try { $r = Invoke-Interpret -Url $apiUrl -Payload $payload }
    catch {
      $anyFail = $true
      $results.Add([pscustomobject]@{
        topic=$t; max_blocks=$budget; ok=$false; used_natal_generic="ERR"; missing_nonempty="ERR";
        note=("API error: " + $_.Exception.Message)
      })
      continue
    }

    $dbgTopic = $r.meta.debug.topics.$t
    $kdTopic  = $r.meta.debug.keydiff.topics.$t

    $usedGen = [int]($dbgTopic.used_natal_generic_count)
    $missingNonEmpty = [int]($kdTopic.candidate_keys_no_active_nonempty_count)

    $ok = ($usedGen -eq 0 -and $missingNonEmpty -eq 0)
    if (-not $ok) { $anyFail = $true }

    $noteParts = @()
    if ($usedGen -ne 0) { $noteParts += "used_natal_generic_count=$usedGen" }
    if ($missingNonEmpty -ne 0) { $noteParts += "missing_nonempty=$missingNonEmpty" }

    $results.Add([pscustomobject]@{
      topic=$t; max_blocks=$budget; ok=$ok; used_natal_generic=$usedGen; missing_nonempty=$missingNonEmpty; note=($noteParts -join "; ")
    })
  }
}

Write-Section "Summary (OK/FAIL per topic+budget)"
$results | Sort-Object ok, max_blocks, topic | Format-Table -AutoSize max_blocks, topic, ok, used_natal_generic, missing_nonempty, note

if ($anyFail) {
  Write-Section "FAILED details (samples)"
  foreach ($row in $results | Where-Object { -not $_.ok } | Sort-Object max_blocks, topic) {
    $t = $row.topic
    $budget = $row.max_blocks
    $apiUrl = "$ApiBaseUrl/v2/interpret?locale=$Locale&debug=$DebugLevel&max_blocks=$budget"

    Write-Host ""
    Write-Host ("--- topic=" + $t + " max_blocks=" + $budget + " ---") -ForegroundColor Yellow

    $payload = @{
      name = $Name
      birth = @{ date=$BirthDate; time=$BirthTime; place_query=$PlaceQuery; gender=$Gender }
      topic_categories = @($t)
    }

    try {
      $r = Invoke-Interpret -Url $apiUrl -Payload $payload
      $dbgTopic = $r.meta.debug.topics.$t
      $kdTopic  = $r.meta.debug.keydiff.topics.$t

      if ([int]$dbgTopic.used_natal_generic_count -gt 0) {
        Write-Host "used natal.generic blocks (sample):" -ForegroundColor DarkYellow
        ($dbgTopic.used_blocks_sample | Where-Object { $_.key -eq "natal.generic" } |
          Select-Object -First 120 block_id, key, priority, knowledge_item_id) |
          Format-Table -Auto
      }

      if ([int]$kdTopic.candidate_keys_no_active_nonempty_count -gt 0) {
        Write-Host "candidate_keys_no_active_nonempty_sample:" -ForegroundColor DarkYellow
        $kdTopic.candidate_keys_no_active_nonempty_sample | Select-Object -First 200 | ForEach-Object { "  $_" }
      }
    } catch {
      Write-Host ("Could not fetch samples: " + $_.Exception.Message) -ForegroundColor Red
    }
  }
}

Write-Section "Final"
$okDb = ($emptyTextCount -eq 0 -and $natalGenericOk -ge 1)
if ($okDb -and -not $anyFail) { Write-Host "OK: KB coverage looks good." -ForegroundColor Green; exit 0 }
else { Write-Host "FAIL: Some checks failed. See output above." -ForegroundColor Red; exit 1 }