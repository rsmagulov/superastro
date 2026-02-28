# C:\Projects\superastro\run_focus_topic_core.ps1
# topic-core mini-json -> seed -> apply -> debug -> report
# Standard: max_blocks=160, max_chars=100000, debug=2, locale=ru, one topic per run

[CmdletBinding()]
param(
  [string]$Root = "C:\Projects\superastro",
  [string]$ApiBase = "http://127.0.0.1:8000",
  [ValidateSet(
    "ancestral_topics","career","creativity","emotional_world","how_others_see_me",
    "karmic_tasks","love_intimacy","money","partnership_marriage","past_lives_symbolic",
    "personality_core","psychology","purpose_path","self_esteem","strengths_weaknesses","talents"
  )]
  [string]$Topic = "strengths_weaknesses",
  [string]$Locale = "ru",
  [int]$MaxBlocks = 160,
  [int]$MaxChars = 100000,

  # Files
  [string]$ReqPath = "",

  # Tools
  [string]$PythonExe = "python",
  [string]$SqliteExe = "sqlite3",

  # Generator
  [string]$GeneratorPath = "",

  # Output names
  [string]$RunTag = "",

  # Focus: if empty -> auto builds topic-core regex for given topic
  [string]$FocusRegex = "",
  [ValidateSet("auto","topic_core","house_core","asc_house1_core")]
  [string]$Profile = "auto",

  # Exclusions (keep empty if you want all)
  [string]$ExcludeRegex = "",

  # Generation limits (topic-core texts often 160–420)
  [int]$SeedMaxLen = 420,
  [int]$SeedMaxKeys = 250,

  # Reporting
  [int]$ReportTop = 60
)

Set-StrictMode -Version Latest
$ErrorActionPreference = "Stop"

function Ensure-Path([string]$p) { if (-not (Test-Path $p)) { throw "Path not found: $p" } }
function NowTag() { (Get-Date).ToString("yyyyMMdd_HHmmss") }

function Write-JsonFile([object]$obj, [string]$path) {
  $dir = Split-Path -Parent $path
  if ($dir -and -not (Test-Path $dir)) { New-Item -ItemType Directory -Force -Path $dir | Out-Null }
  $obj | ConvertTo-Json -Depth 30 | Set-Content -Encoding UTF8 $path
}

function Convert-DateToIso([string]$s) {
  $t = $s.Trim()

  # Already ISO date YYYY-MM-DD
  if ($t -match '^\d{4}-\d{2}-\d{2}$') { return $t }

  # Common RU format DD.MM.YYYY
  if ($t -match '^(?<d>\d{2})\.(?<m>\d{2})\.(?<y>\d{4})$') {
    return ("{0}-{1}-{2}" -f $Matches.y, $Matches.m, $Matches.d)
  }

  # Try parse as DateTime (handles many formats)
  try {
    $dt = [DateTime]::Parse($t, [System.Globalization.CultureInfo]::InvariantCulture)
    return $dt.ToString("yyyy-MM-dd")
  } catch {
    return $t
  }
}

function Normalize-Payload([object]$payloadObj) {
  # Enforce topic_categories
  $payloadObj | Add-Member -NotePropertyName topic_categories -NotePropertyValue @($Topic) -Force
  if ($payloadObj.PSObject.Properties.Name -contains "topic_category") { $payloadObj.PSObject.Properties.Remove("topic_category") }

  # Normalize birth.date to ISO if present
  if ($payloadObj.PSObject.Properties.Name -contains "birth" -and $payloadObj.birth) {
    if ($payloadObj.birth.PSObject.Properties.Name -contains "date" -and $payloadObj.birth.date) {
      $payloadObj.birth.date = Convert-DateToIso ([string]$payloadObj.birth.date)
    }
  }

  return $payloadObj
}

function Invoke-Debug([string]$payloadJson, [string]$outPath) {
  $uri = "$ApiBase/v2/interpret?locale=$Locale&debug=2&max_blocks=$MaxBlocks&max_chars=$MaxChars"
  Invoke-RestMethod -Method Post `
    -Uri $uri `
    -ContentType "application/json; charset=utf-8" `
    -Body $payloadJson `
  | ConvertTo-Json -Depth 100 `
  | Set-Content -Encoding UTF8 $outPath
}

function Load-UsedBlocks([string]$debugPath) {
  $jp = Get-Content -Raw -Encoding UTF8 $debugPath | ConvertFrom-Json
  return ,@($jp.meta.debug.topics.$Topic.used_blocks_sample)
}

function Get-TopicProfile([string]$topicName) {
  # Smart defaults (heuristics). Edit freely.
  $map = @{
    # topic-core (no houses/angles in used)
    "strengths_weaknesses" = "topic_core"

    # ASC / 1st house core
    "how_others_see_me" = "asc_house1_core"
    "personality_core"  = "asc_house1_core"
    "psychology"        = "topic_core"

    # house-core (profiled houses / angles)
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

  # Safe fallback: if unknown topic => topic_core (won’t accidentally grab unrelated houses).
  return "topic_core"
}

function Build-DefaultFocusRegex([string]$topicName, [string]$profileOverride) {
  $t = [regex]::Escape($topicName)

  $profile =
    if ($profileOverride -and $profileOverride -ne "auto") { $profileOverride }
    else { Get-TopicProfile -topicName $topicName }

  # Common “topic core” blocks (usually cheap and appear often)
  $topicCoreTail = "$t\.|polarity\.|elements\.|modality\.|sign\."

  switch ($profile) {
    "topic_core" {
      return "^natal\.($topicCoreTail)"
    }

    "asc_house1_core" {
      # ASC + 1 дом (+ topic-core blocks so they still get waves)
      # Includes typical KB namespaces you mentioned: cusp/ruler/planet-in-house
      return "^natal\.(angle\.asc(\.|$)|house\.1(\.|$)|house\.1\.cusp\.sign\.|house\.1\.ruler\.|house\.1\.planet\.|$topicCoreTail)"
    }

    "house_core" {
      # Per-topic house/angle focus. Conservative: only grabs the most relevant houses.
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
        default                { "1|2|4|5|7|8|9|10|12" } # broad but still bounded
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

    default {
      return "^natal\.($topicCoreTail)"
    }
  }
}

# --- Resolve defaults ---
Ensure-Path $Root
Set-Location $Root

if ([string]::IsNullOrWhiteSpace($ReqPath)) {
  $ReqPath = Join-Path $Root "astroprocessor\tools\requests\req_general.json"
}
if ([string]::IsNullOrWhiteSpace($GeneratorPath)) {
  $GeneratorPath = Join-Path $Root "astroprocessor\tools\seed\generate_career_overrides_from_debug_shortest.py"
}
if ([string]::IsNullOrWhiteSpace($FocusRegex)) {
  $FocusRegex = Build-DefaultFocusRegex -topicName $Topic -profileOverride $Profile
}

Ensure-Path $ReqPath
Ensure-Path $GeneratorPath

$SeedDir = Join-Path $Root "astroprocessor\tools\seed"
$DbPath  = Join-Path $Root "astroprocessor\data\knowledge.db"
Ensure-Path $DbPath
if (-not (Test-Path $SeedDir)) { New-Item -ItemType Directory -Force -Path $SeedDir | Out-Null }

if ([string]::IsNullOrWhiteSpace($RunTag)) { $RunTag = NowTag }

$DebugBefore = Join-Path $Root ("debug_{0}_{1}_{2}_{3}_before.json" -f $Topic, $Locale, $MaxBlocks, $RunTag)
$MiniJson    = Join-Path $Root ("debug_{0}_{1}_{2}_{3}_mini_topiccore.json" -f $Topic, $Locale, $MaxBlocks, $RunTag)
$SeedSql     = Join-Path $SeedDir ("seed_{0}_topiccore_{1}.sql" -f $Topic, $RunTag)
$DebugAfter  = Join-Path $Root ("debug_{0}_{1}_{2}_{3}_after.json" -f $Topic, $Locale, $MaxBlocks, $RunTag)

Write-Host "Root:        $Root"
Write-Host "API:         $ApiBase"
Write-Host "Topic:       $Topic"
Write-Host "Locale:      $Locale"
Write-Host "Budget:      max_blocks=$MaxBlocks, max_chars=$MaxChars"
Write-Host "FocusRegex:  $FocusRegex"
if ($ExcludeRegex) { Write-Host "ExcludeRegex:$ExcludeRegex" }
Write-Host "RunTag:      $RunTag"
Write-Host ""

# --- Build payload (with normalization) ---
$payloadObj = Get-Content -Raw -Encoding UTF8 $ReqPath | ConvertFrom-Json
$payloadObj | Add-Member -NotePropertyName name -NotePropertyValue "Test User" -Force
$payloadObj = Normalize-Payload -payloadObj $payloadObj
$payloadJson = $payloadObj | ConvertTo-Json -Depth 100

# --- Debug before ---
Write-Host "1) Fetch debug (before) -> $DebugBefore" -ForegroundColor Yellow
Invoke-Debug -payloadJson $payloadJson -outPath $DebugBefore

$usedBefore = Load-UsedBlocks -debugPath $DebugBefore
Write-Host ("used_count(before) = {0}" -f @($usedBefore).Count) -ForegroundColor Green

# --- Focus selection ---
$focusBefore = @(
  $usedBefore | Where-Object {
    $_.key -match $FocusRegex -and
    (-not $ExcludeRegex -or $_.key -notmatch $ExcludeRegex)
  }
)

Write-Host ("focus_count(before) = {0}" -f @($focusBefore).Count) -ForegroundColor Green
if (@($focusBefore).Count -eq 0) {
  Write-Host "No focus keys matched. Widen -FocusRegex or check if this topic uses these namespaces." -ForegroundColor Red
  Write-Host "Debug(before): $DebugBefore"
  exit 0
}

$focusAsc  = @($focusBefore | Sort-Object { $_.text.Length })
$focusDesc = @($focusBefore | Sort-Object { $_.text.Length } -Descending)

Write-Host "`n--- Topic-core BEFORE: shortest ---" -ForegroundColor Cyan
$focusAsc |
  Select-Object key, @{n='len';e={$_.text.Length}}, priority |
  Select-Object -First $ReportTop |
  Format-Table -AutoSize

Write-Host "`n--- Topic-core BEFORE: longest ---" -ForegroundColor Cyan
$focusDesc |
  Select-Object key, @{n='len';e={$_.text.Length}}, priority |
  Select-Object -First $ReportTop |
  Format-Table -AutoSize

# --- Mini JSON ---
Write-Host "`n2) Build mini JSON -> $MiniJson" -ForegroundColor Yellow
$miniObj = @{ meta = @{ debug = @{ topics = @{ $Topic = @{ used_blocks_sample = $focusBefore } } } } }
Write-JsonFile -obj $miniObj -path $MiniJson

# --- Generate seed ---
Write-Host "`n3) Generate seed SQL -> $SeedSql" -ForegroundColor Yellow
& $PythonExe $GeneratorPath `
  --in $MiniJson `
  --out $SeedSql `
  --topic $Topic `
  --locale "ru-RU" `
  --priority 140 `
  --max-len $SeedMaxLen `
  --max-keys $SeedMaxKeys
if ($LASTEXITCODE -ne 0) {
  throw "Seed generator failed (exit=$LASTEXITCODE). See console output above."
}
if (-not (Test-Path $SeedSql)) {
  throw "Seed SQL not created: $SeedSql"
}
# --- Apply seed ---
Write-Host "`n4) Apply seed to SQLite -> $DbPath" -ForegroundColor Yellow
& $SqliteExe $DbPath ".read $SeedSql"
if ($LASTEXITCODE -ne 0) {
  throw "sqlite3 apply failed (exit=$LASTEXITCODE). Seed: $SeedSql"
}
# --- Debug after ---
Write-Host "`n5) Fetch debug (after) -> $DebugAfter" -ForegroundColor Yellow
Invoke-Debug -payloadJson $payloadJson -outPath $DebugAfter

$usedAfter = Load-UsedBlocks -debugPath $DebugAfter
Write-Host ("used_count(after) = {0}" -f @($usedAfter).Count) -ForegroundColor Green

$focusAfter = @(
  $usedAfter | Where-Object {
    $_.key -match $FocusRegex -and
    (-not $ExcludeRegex -or $_.key -notmatch $ExcludeRegex)
  }
)
Write-Host ("focus_count(after) = {0}" -f @($focusAfter).Count) -ForegroundColor Green

$afterAsc  = @($focusAfter | Sort-Object { $_.text.Length })
$afterDesc = @($focusAfter | Sort-Object { $_.text.Length } -Descending)

Write-Host "`n--- Topic-core AFTER: shortest ---" -ForegroundColor Cyan
$afterAsc |
  Select-Object key, @{n='len';e={$_.text.Length}}, priority |
  Select-Object -First $ReportTop |
  Format-Table -AutoSize

Write-Host "`n--- Topic-core AFTER: longest ---" -ForegroundColor Cyan
$afterDesc |
  Select-Object key, @{n='len';e={$_.text.Length}}, priority |
  Select-Object -First $ReportTop |
  Format-Table -AutoSize

# --- Delta report ---
Write-Host "`n6) Delta report (topic-core keys):" -ForegroundColor Yellow
$beforeMap = @{}
foreach ($b in $focusBefore) { $beforeMap[$b.key] = [int]$b.text.Length }

$deltaRows = foreach ($a in $focusAfter) {
  $k = $a.key
  $afterLen = [int]$a.text.Length
  $beforeLen = if ($beforeMap.ContainsKey($k)) { [int]$beforeMap[$k] } else { -1 }
  [pscustomobject]@{
    key = $k
    before_len = $beforeLen
    after_len  = $afterLen
    delta      = if ($beforeLen -ge 0) { $afterLen - $beforeLen } else { $null }
    priority   = $a.priority
  }
}

$deltaRows |
  Sort-Object -Property delta -Descending |
  Select-Object -First $ReportTop |
  Format-Table -AutoSize

Write-Host "`nDONE." -ForegroundColor Green
Write-Host "Debug(before): $DebugBefore"
Write-Host "Mini JSON:      $MiniJson"
Write-Host "Seed SQL:       $SeedSql"
Write-Host "Debug(after):   $DebugAfter"