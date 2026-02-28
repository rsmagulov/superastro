# FILE: C:\Projects\superastro\run_focus_topic_core.ps1
# (полный файл — замени содержимое 1:1)

# C:\Projects\superastro\run_focus_topic_core.ps1
# topic-core mini-json -> seed -> apply -> debug -> report
# Standard: max_blocks=160, max_chars=100000, debug=2, locale=ru, one topic per run

[CmdletBinding()]
param(
  [Parameter()][switch]$SaveResponse,
  [Parameter()][switch]$OpenResponse,
  [Parameter()][string]$ResponseDir = "C:\Projects\superastro\debug\responses",
  [Parameter()][string]$ApiLocale = "ru",

  [string]$Root = "C:\Projects\superastro",
  [string]$ApiBase = "http://127.0.0.1:8000",
  [ValidateSet(
    "ancestral_topics","career","creativity","emotional_world","how_others_see_me",
    "karmic_tasks","love_intimacy","money","partnership_marriage","past_lives_symbolic",
    "personality_core","psychology","purpose_path","self_esteem","strengths_weaknesses","talents"
  )]
  [string]$Topic = "career",

  [string]$Locale = "ru-RU",
  [int]$MaxBlocks = 160,
  [int]$MaxChars = 100000,

  [string]$ReqPath = "",
  [string]$GeneratorPath = "",
  [string]$PythonExe = "python",
  [string]$SqliteExe = "sqlite3",

  [string]$RunTag = "",

  # Focus controls
  [string]$FocusRegex = "",
  [string]$ExcludeRegex = "",
  [ValidateSet("auto","topic_core","asc_house1_core","house_core")]
  [string]$Profile = "auto",

  # Seed generator params
  [int]$SeedMaxLen = 420,
  [int]$SeedMaxKeys = 200,
  [int]$SeedPriority = 140,

  # NEW: keep only last N runs for current topic (0 = disable)
  [int]$KeepLastRuns = 0
)

$ErrorActionPreference = "Stop"
function Save-FullResponseJson {
  param(
    [Parameter(Mandatory)]$Resp,
    [Parameter(Mandatory)][string]$Phase
  )

  if (-not $SaveResponse) { return }

  if (-not (Test-Path $ResponseDir)) {
    New-Item -ItemType Directory -Path $ResponseDir | Out-Null
  }

  $respPath = Join-Path $ResponseDir ("resp_{0}_{1}_{2}.json" -f $Topic, $RunTag, $Phase)
  $Resp | ConvertTo-Json -Depth 100 | Set-Content -Encoding UTF8 $respPath

  if (-not (Test-Path $respPath) -or ((Get-Item $respPath).Length -lt 200)) {
    throw "SaveResponse failed: $respPath missing or too small"
  }

  if ($OpenResponse -and $Phase -eq "after") {
    notepad $respPath
  }
}
function NowTag { Get-Date -Format "yyyyMMdd_HHmmss" }

function Ensure-Path([string]$p) {
  if (-not (Test-Path $p)) { throw "Path not found: $p" }
}

# ----------------------------
# Cleanup helpers (KeepLastRuns)
# ----------------------------
function Get-RunTagFromDebugFileName([string]$fileName, [string]$topic, [string]$locale, [int]$maxBlocks) {
  # debug_<topic>_<locale>_<maxBlocks>_<runTag>_{before|after|mini_focus}.json
  $t = [regex]::Escape($topic)
  $l = [regex]::Escape($locale)
  $m = [regex]::Escape([string]$maxBlocks)
  $rx = "^debug_${t}_${l}_${m}_(.+)_(before|after|mini_focus)\.json$"
  $mch = [regex]::Match($fileName, $rx)
  if ($mch.Success) { return $mch.Groups[1].Value }
  return $null
}

function Cleanup-DebugRuns([string]$debugDir, [string]$topic, [string]$locale, [int]$maxBlocks, [int]$keepLast) {
  if ($keepLast -le 0) { return }
  if (-not (Test-Path $debugDir)) { return }

  $files = Get-ChildItem -Path $debugDir -Filter "debug_*.json" -File

  $byRunTag = @{}
  foreach ($f in $files) {
    $tag = Get-RunTagFromDebugFileName -fileName $f.Name -topic $topic -locale $locale -maxBlocks $maxBlocks
    if (-not $tag) { continue }
    if (-not $byRunTag.ContainsKey($tag)) { $byRunTag[$tag] = @() }
    $byRunTag[$tag] += $f
  }

  if ($byRunTag.Keys.Count -le $keepLast) { return }

  # runTag обычно yyyyMMdd_HHmmss — сортировка строкой работает
  $sortedTags = $byRunTag.Keys | Sort-Object -Descending
  $keepTags = $sortedTags | Select-Object -First $keepLast
  $deleteTags = $sortedTags | Where-Object { $_ -notin $keepTags }

  $toDelete = @()
  foreach ($tag in $deleteTags) { $toDelete += $byRunTag[$tag] }

  if (@($toDelete).Count -gt 0) {
    Write-Host ("Cleanup: deleting {0} debug files (keep last {1} runs) in {2}" -f @($toDelete).Count, $keepLast, $debugDir) -ForegroundColor DarkYellow
    foreach ($f in $toDelete) {
      Remove-Item -LiteralPath $f.FullName -Force
    }
  }
}

function Cleanup-SeedRuns([string]$seedDir, [string]$topic, [int]$keepLast) {
  if ($keepLast -le 0) { return }
  if (-not (Test-Path $seedDir)) { return }

  $runsRoot = Join-Path $seedDir "runs"
  if (-not (Test-Path $runsRoot)) { return }

  $pattern = ("seed_{0}_focus_*.sql" -f $topic)
  $files = Get-ChildItem -Path $runsRoot -Recurse -File -Filter $pattern

  if (@($files).Count -le $keepLast) { return }

  $sorted = $files | Sort-Object LastWriteTime -Descending
  $delete = $sorted | Select-Object -Skip $keepLast

  if (@($delete).Count -gt 0) {
    Write-Host ("Cleanup: deleting {0} seed SQL files (keep last {1}) under {2}" -f @($delete).Count, $keepLast, $runsRoot) -ForegroundColor DarkYellow
    foreach ($f in $delete) {
      Remove-Item -LiteralPath $f.FullName -Force
    }

    # delete empty date folders
    Get-ChildItem -Path $runsRoot -Directory | ForEach-Object {
      $any = Get-ChildItem -Path $_.FullName -File -Recurse -ErrorAction SilentlyContinue | Select-Object -First 1
      if (-not $any) { Remove-Item -LiteralPath $_.FullName -Force }
    }
  }
}

function Invoke-RunCleanup([string]$debugDir, [string]$seedDir, [string]$topic, [string]$locale, [int]$maxBlocks, [int]$keepLast) {
  if ($keepLast -le 0) { return }
  Cleanup-DebugRuns -debugDir $debugDir -topic $topic -locale $locale -maxBlocks $maxBlocks -keepLast $keepLast
  Cleanup-SeedRuns -seedDir $seedDir -topic $topic -keepLast $keepLast
}

# ----------------------------
# rest of your script
# ----------------------------
function Normalize-Payload([pscustomobject]$payloadObj) {
  if (-not $payloadObj) { throw "Request JSON is empty." }

  $hasBirth = ($payloadObj.PSObject.Properties.Match('birth').Count -gt 0)
  if (-not $hasBirth -or -not $payloadObj.birth) { throw "Request JSON must contain 'birth' object." }

  $hasName = ($payloadObj.PSObject.Properties.Match('name').Count -gt 0)
  if (-not $hasName -or -not $payloadObj.name) { $payloadObj | Add-Member -NotePropertyName name -NotePropertyValue "Test User" -Force }

  # --- IMPORTANT: v2 expects topic_categories (NOT topics) ---
  $hasTC = ($payloadObj.PSObject.Properties.Match('topic_categories').Count -gt 0)
  if (-not $hasTC) {
    $payloadObj | Add-Member -NotePropertyName topic_categories -NotePropertyValue @() -Force
  }

  $tc = @()
  if ($payloadObj.topic_categories) { $tc = @($payloadObj.topic_categories) }

  if ($tc.Count -eq 0 -or $tc -notcontains $Topic) {
    $payloadObj.topic_categories = @($Topic)
  }

  # Back-compat cleanup: if "topics" exists, keep it but it won't drive v2.
  return $payloadObj
}

function Invoke-Debug([string]$payloadJson, [string]$outPath, [string]$Phase) {
  $uri = "$ApiBase/v2/interpret?locale=$ApiLocale&debug=2&max_blocks=$MaxBlocks&max_chars=$MaxChars"
  try {
    $resp = Invoke-RestMethod -Method Post -Uri $uri -ContentType "application/json; charset=utf-8" -Body $payloadJson

    Save-FullResponseJson -Resp $resp -Phase $Phase

    $resp | ConvertTo-Json -Depth 100 | Set-Content -Encoding UTF8 $outPath
  } 
  catch {
    $msg = $_.Exception.Message
    $respText = $null

    try {
      $webResp = $_.Exception.Response
      if ($webResp -and $webResp.GetResponseStream()) {
        $reader = New-Object System.IO.StreamReader($webResp.GetResponseStream())
        $respText = $reader.ReadToEnd()
        $reader.Close()
      }
    } catch { }

    if ($respText) {
      Write-Host "HTTP error body:" -ForegroundColor Yellow
      Write-Host $respText
      throw "HTTP debug fetch failed: $msg"
    }

    throw "HTTP debug fetch failed: $msg"
  }

  if (-not (Test-Path $outPath)) { throw "Debug output was not written: $outPath" }
  if ((Get-Item $outPath).Length -lt 10) { throw "Debug output is too small (likely broken): $outPath" }
}

function Load-UsedBlocks([string]$debugPath) {
  $jp = Get-Content -Raw -Encoding UTF8 $debugPath | ConvertFrom-Json
  return ,@($jp.meta.debug.topics.$Topic.used_blocks_sample)
}

function Detect-ProfileFromUsed([object[]]$usedBlocks) {
  $keys = @($usedBlocks | ForEach-Object { $_.key })
  $hasAsc = $keys | Where-Object { $_ -match '^natal\.(angle\.asc(\.|$)|house\.1(\.|$))' }
  if (@($hasAsc).Count -gt 0) { return "asc_house1_core" }

  $hasHouseOther = $keys | Where-Object { $_ -match '^natal\.house\.(?:[2-9]|1[0-2])(\.|$)' }
  $hasAngleOther = $keys | Where-Object { $_ -match '^natal\.angle\.(?:mc|ic|dc|dsc)(\.|$)' }
  if (@($hasHouseOther).Count -gt 0 -or @($hasAngleOther).Count -gt 0) { return "house_core" }

  return "topic_core"
}

function Get-TopicProfile([string]$topicName) {
  $map = @{
    "strengths_weaknesses" = "topic_core"
    "how_others_see_me" = "asc_house1_core"
    "personality_core"  = "asc_house1_core"
    "psychology"        = "topic_core"
    "career"               = "house_core"
    "money"                = "house_core"
    "self_esteem"          = "house_core"
    "partnership_marriage" = "house_core"
    "love_intimacy"        = "house_core"
    "creativity"           = "house_core"
    "emotional_world"      = "house_core"
    "ancestral_topics"     = "house_core"
    "talents"              = "house_core"
    "purpose_path"         = "house_core"
    "karmic_tasks"         = "house_core"
    "past_lives_symbolic"  = "house_core"
  }
  if ($map.ContainsKey($topicName)) { return $map[$topicName] }
  return "topic_core"
}

function Build-DefaultFocusRegex([string]$topicName, [string]$profileOverride) {
  $t = [regex]::Escape($topicName)
  $profile =
    if ($profileOverride -and $profileOverride -ne "auto") { $profileOverride }
    else { Get-TopicProfile -topicName $topicName }

  $topicCoreTail = "$t\.|polarity\.|elements\.|modality\.|sign\."

  switch ($profile) {
    "topic_core" { return "^natal\.($topicCoreTail)" }

    "asc_house1_core" {
      return "^natal\.(angle\.asc(\.|$)|house\.1(\.|$)|house\.1\.cusp\.sign\.|house\.1\.ruler\.|house\.1\.planet\.|$topicCoreTail)"
    }

    "house_core" {
      $houses = switch ($topicName) {
        "career"               { "10" }
        "money"                { "2" }
        "self_esteem"          { "2" }
        "partnership_marriage" { "7" }
        "love_intimacy"        { "7" }
        "creativity"           { "5" }
        "emotional_world"      { "4" }
        "ancestral_topics"     { "4" }
        "talents"              { "2|3|5" }
        "purpose_path"         { "9|10" }
        "karmic_tasks"         { "8|12" }
        "past_lives_symbolic"  { "12|8" }
        default                { "1|2|4|5|7|8|9|10|12" }
      }

      $angles = switch ($topicName) {
        "career"               { "mc" }
        "emotional_world"      { "ic" }
        "ancestral_topics"     { "ic" }
        "partnership_marriage" { "dc" }
        "love_intimacy"        { "dc" }
        "purpose_path"         { "mc" }
        default                { "asc|mc|ic|dc" }
      }

      return "^natal\.(angle\.($angles)(\.|$)|house\.($houses)(\.|$)|house\.(?:$houses)\.(cusp\.sign|ruler|planet)\.|$topicCoreTail)"
    }

    default { return "^natal\.($topicCoreTail)" }
  }
}

# --- Resolve defaults ---
Ensure-Path $Root
Set-Location $Root

# --- DEFAULT REQUEST PATH (avoid 422 on empty payload) ---
if ([string]::IsNullOrWhiteSpace($ReqPath)) {
  $candidate1 = Join-Path $Root "astroprocessor\tools\requests\req_career.json"
  $candidate2 = Join-Path $Root "astroprocessor\payload.json"

  if (Test-Path $candidate1) { $ReqPath = $candidate1 }
  elseif (Test-Path $candidate2) { $ReqPath = $candidate2 }
  else { throw "ReqPath is empty and no default request file found. Checked: $candidate1 ; $candidate2" }
}

Write-Host "Using ReqPath -> $ReqPath"

if ([string]::IsNullOrWhiteSpace($ReqPath)) {
  $ReqPath = Join-Path $Root "astroprocessor\tools\requests\req_general.json"
}
if ([string]::IsNullOrWhiteSpace($GeneratorPath)) {
  $GeneratorPath = Join-Path $Root "astroprocessor\tools\seed\generate_career_overrides_from_debug_shortest.py"
}

Ensure-Path $ReqPath
Ensure-Path $GeneratorPath

# Debug folder
$DebugDir = Join-Path $Root "debug"
if (-not (Test-Path $DebugDir)) { New-Item -ItemType Directory -Force -Path $DebugDir | Out-Null }

# Seed folders
$SeedDir = Join-Path $Root "astroprocessor\tools\seed"
$DbPath  = Join-Path $Root "astroprocessor\data\knowledge.db"
Ensure-Path $DbPath
if (-not (Test-Path $SeedDir)) { New-Item -ItemType Directory -Force -Path $SeedDir | Out-Null }

$SeedRunDate = Get-Date -Format "yyyyMMdd"
$SeedRunsDir = Join-Path $SeedDir ("runs\{0}" -f $SeedRunDate)
if (-not (Test-Path $SeedRunsDir)) { New-Item -ItemType Directory -Force -Path $SeedRunsDir | Out-Null }

if ([string]::IsNullOrWhiteSpace($RunTag)) { $RunTag = NowTag }

# ✅ Cleanup BEFORE run
Invoke-RunCleanup -debugDir $DebugDir -seedDir $SeedDir -topic $Topic -locale $Locale -maxBlocks $MaxBlocks -keepLast $KeepLastRuns

$DebugBefore = Join-Path $DebugDir ("debug_{0}_{1}_{2}_{3}_before.json" -f $Topic, $Locale, $MaxBlocks, $RunTag)
$MiniJson    = Join-Path $DebugDir ("debug_{0}_{1}_{2}_{3}_mini_focus.json" -f $Topic, $Locale, $MaxBlocks, $RunTag)
$SeedSql     = Join-Path $SeedRunsDir ("seed_{0}_focus_{1}.sql" -f $Topic, $RunTag)
$DebugAfter  = Join-Path $DebugDir ("debug_{0}_{1}_{2}_{3}_after.json" -f $Topic, $Locale, $MaxBlocks, $RunTag)

Write-Host "Root:        $Root"
Write-Host "API:         $ApiBase"
Write-Host "Topic:       $Topic"
Write-Host "Locale:      $Locale"
Write-Host "Budget:      max_blocks=$MaxBlocks, max_chars=$MaxChars"
if ($ExcludeRegex) { Write-Host "ExcludeRegex:$ExcludeRegex" }
Write-Host "RunTag:      $RunTag"
Write-Host ""

# --- Build payload ---
$payloadObj = Get-Content -Raw -Encoding UTF8 $ReqPath | ConvertFrom-Json
$payloadObj | Add-Member -NotePropertyName name -NotePropertyValue "Test User" -Force
$payloadObj = Normalize-Payload -payloadObj $payloadObj
$payloadJson = $payloadObj | ConvertTo-Json -Depth 100

# --- Debug before ---
Write-Host "1) Fetch debug (before) -> $DebugBefore" -ForegroundColor Yellow
Invoke-Debug -payloadJson $payloadJson -outPath $DebugBefore -Phase "before"
$debugObj = Get-Content $DebugBefore -Raw | ConvertFrom-Json
# actual topic returned by API (StrictMode-safe)
if (-not $debugObj.meta -or -not $debugObj.meta.topics -or @($debugObj.meta.topics).Count -lt 1) {
  throw "Debug JSON has no meta.topics[] (cannot determine actual topic)."
}
$actualTopic = $debugObj.meta.topics[0]
Write-Host "API returned topic -> $actualTopic (requested: $Topic)" -ForegroundColor Yellow
$usedBefore = Load-UsedBlocks -debugPath $DebugBefore
Write-Host ("used_count(before) = {0}" -f @($usedBefore).Count) -ForegroundColor Green

$topicsDbg = $debugObj.meta.debug.topics
  $topicProp = $topicsDbg.PSObject.Properties.Match($actualTopic)
  if ($topicProp.Count -eq 0) {
    $avail = ($topicsDbg.PSObject.Properties.Name) -join ", "
    throw "Debug JSON has no topic '$actualTopic' under meta.debug.topics. Available: $avail"
  }
  $used = $topicProp[0].Value.used_blocks_sample

# Auto profile detection / focus regex (based on real used keys)
if ([string]::IsNullOrWhiteSpace($FocusRegex)) {
  $detected = if ($Profile -eq "auto") { Detect-ProfileFromUsed -usedBlocks $usedBefore } else { $Profile }
  $FocusRegex = Build-DefaultFocusRegex -topicName $Topic -profileOverride $detected
  Write-Host ("AutoProfile: {0}" -f $detected) -ForegroundColor Green
  Write-Host ("FocusRegex(auto): {0}" -f $FocusRegex) -ForegroundColor Green
}

# Focus selection
$focusBefore = @(
  $usedBefore | Where-Object {
    $_.key -match $FocusRegex -and
    (-not $ExcludeRegex -or $_.key -notmatch $ExcludeRegex)
  }
)

Write-Host ("focus_count(before) = {0}" -f @($focusBefore).Count) -ForegroundColor Green
if (@($focusBefore).Count -eq 0) {
  Write-Host "No focus keys matched. Widen -FocusRegex or check namespaces." -ForegroundColor Red
  Write-Host "Debug(before): $DebugBefore"
  exit 0
}

$focusAsc  = @($focusBefore | Sort-Object { $_.text.Length })
$focusDesc = @($focusBefore | Sort-Object { $_.text.Length } -Descending)

Write-Host "`n--- BEFORE: shortest ---" -ForegroundColor Cyan
$focusAsc | Select-Object -First 15 key, @{n="len";e={$_.text.Length}} | Format-Table -AutoSize

Write-Host "`n--- BEFORE: longest ---" -ForegroundColor Cyan
$focusDesc | Select-Object -First 8 key, @{n="len";e={$_.text.Length}} | Format-Table -AutoSize

# Mini JSON
Write-Host "`n2) Build mini JSON -> $MiniJson" -ForegroundColor Yellow
$miniObj = [ordered]@{
  meta = [ordered]@{
    topic = $Topic
    locale = $Locale
    focus_regex = $FocusRegex
    exclude_regex = $ExcludeRegex
    generated_at = (Get-Date).ToString("s")
    source_debug = $DebugBefore
  }
  focus = @($focusBefore | ForEach-Object {
    [ordered]@{ key = $_.key; text = $_.text; len = $_.text.Length }
  })
}
$miniObj | ConvertTo-Json -Depth 100 | Set-Content -Encoding UTF8 $MiniJson
if (-not (Test-Path $MiniJson)) { throw "Mini JSON not created: $MiniJson" }
if ((Get-Item $MiniJson).Length -lt 10) { throw "Mini JSON too small: $MiniJson" }

# Seed generation
Write-Host "`n3) Generate seed SQL -> $SeedSql" -ForegroundColor Yellow
& $PythonExe $GeneratorPath --from-mini $MiniJson --out $SeedSql --topic $Topic --locale $Locale --max-len $SeedMaxLen --max-keys $SeedMaxKeys --priority $SeedPriority
if ($LASTEXITCODE -ne 0) { throw "Seed generator failed (exit=$LASTEXITCODE)." }
if (-not (Test-Path $SeedSql)) { throw "Seed SQL not created: $SeedSql" }
if ((Get-Item $SeedSql).Length -lt 10) { throw "Seed SQL too small: $SeedSql" }

# Apply seed
Write-Host "`n4) Apply seed to SQLite -> $DbPath" -ForegroundColor Yellow
& $SqliteExe $DbPath ".read $SeedSql"
if ($LASTEXITCODE -ne 0) { throw "sqlite3 apply failed (exit=$LASTEXITCODE). Seed: $SeedSql" }

$cnt = & $SqliteExe $DbPath "SELECT COUNT(1) FROM knowledge_items WHERE topic_category = '$Topic' AND locale = '$Locale' AND priority = 140 AND is_active = 1;"
if ($LASTEXITCODE -ne 0) { throw "sqlite3 verify query failed (exit=$LASTEXITCODE)." }
if ([int]$cnt -le 0) { throw "sqlite3 verification failed: no active priority=140 rows for topic=$Topic locale=$Locale." }

# verify: updated_at set for seed keys (fail-fast)
$seedKeys = (Select-String $SeedSql -Pattern "VALUES\('([^']+)'" | ForEach-Object { $_.Matches[0].Groups[1].Value })
if (-not $seedKeys -or $seedKeys.Count -lt 1) { throw "Seed verify failed: no keys parsed from $SeedSql" }

$inList = ($seedKeys | ForEach-Object { "'" + ($_ -replace "'","''") + "'" }) -join ","
$verifySql = @"
SELECT
  COUNT(*) AS matched,
  SUM(CASE WHEN updated_at IS NOT NULL THEN 1 ELSE 0 END) AS with_updated_at
FROM knowledge_items
WHERE topic_category='$Topic' AND locale='$Locale' AND priority=$SeedPriority AND is_active=1
  AND key IN ($inList);
"@

# machine-parsable output: "matched|with_updated_at"
$line = sqlite3 -noheader -batch -separator "|" $DbPath $verifySql
Write-Host "verify(raw) = $line"

$parts = $line -split "\|"
if ($parts.Count -lt 2) { throw "Seed verify failed: cannot parse sqlite output: '$line'" }

$matched = [int]$parts[0]
$withUpdated = [int]$parts[1]
$expected = [int]$seedKeys.Count

Write-Host ("matched={0} with_updated_at={1} expected={2}" -f $matched, $withUpdated, $expected)

if ($matched -ne $expected) {
  throw "Seed verify failed: expected matched=$expected, got matched=$matched (topic=$Topic)"
}
if ($withUpdated -ne $expected) {
  throw "Seed verify failed: expected with_updated_at=$expected, got with_updated_at=$withUpdated (topic=$Topic)"
}

# Debug after
Write-Host "`n5) Fetch debug (after) -> $DebugAfter" -ForegroundColor Yellow
Invoke-Debug -payloadJson $payloadJson -outPath $DebugAfter -Phase "after"
$debugObjAfter = Get-Content $DebugAfter -Raw | ConvertFrom-Json
$usedAfter = Load-UsedBlocks -debugPath $DebugAfter
Write-Host ("used_count(after) = {0}" -f @($usedAfter).Count) -ForegroundColor Green

# Diff report
Write-Host "`n--- Delta check (keys + text lens) ---" -ForegroundColor Cyan
$beforeMap = @{}
$usedBefore | ForEach-Object { $beforeMap[$_.key] = $_.text.Length }

$deltaRows = @()
$usedAfter | ForEach-Object {
  $k = $_.key
  $afterLen = $_.text.Length
  $beforeLen = if ($beforeMap.ContainsKey($k)) { [int]$beforeMap[$k] } else { -1 }
  $delta = if ($beforeLen -ge 0) { $afterLen - $beforeLen } else { $null }
  $deltaRows += [pscustomobject]@{ key = $k; before = $beforeLen; after = $afterLen; delta = $delta }
}

$deltaRows | Sort-Object @{e="delta";Descending=$false}, @{e="after";Descending=$true} | Select-Object -First 25 | Format-Table -AutoSize

Write-Host "`nOK." -ForegroundColor Green
Write-Host "Debug(before): $DebugBefore"
Write-Host "Debug(after):  $DebugAfter"
Write-Host "Seed SQL:      $SeedSql"
Write-Host "Mini JSON:     $MiniJson"