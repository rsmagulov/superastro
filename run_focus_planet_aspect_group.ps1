# C:\Projects\superastro\run_focus_planet_aspect_group.ps1
# mini-json (planet/aspect/group) -> seed -> apply -> debug -> report
# Requires: python, sqlite3, running FastAPI on $ApiBase

[CmdletBinding()]
param(
  [string]$Root = "C:\Projects\superastro",
  [string]$ApiBase = "http://127.0.0.1:8000",
  [string]$Locale = "ru",
  [string]$Topic = "career",
  [int]$MaxBlocks = 160,
  [int]$MaxChars = 100000,

  # Files
  [string]$ReqPath = "",

  # Tools
  [string]$PythonExe = "python",
  [string]$SqliteExe = "sqlite3",

  # Generator
  [string]$GeneratorPath = "",

  # Output names (auto if empty)
  [string]$RunTag = "",

  # Filters
  [string]$FocusRegex = '^natal\.(planet\.|aspect\.|planets\.group\.)',
  [string]$ExcludeRegex = '',

  # Generation limits
  [int]$SeedMaxLen = 450,
  [int]$SeedMaxKeys = 200,

  # Reporting
  [int]$ReportTop = 40
)

Set-StrictMode -Version Latest
$ErrorActionPreference = "Stop"

function Ensure-Path([string]$p) {
  if ([string]::IsNullOrWhiteSpace($p)) { throw "Empty path" }
  if (-not (Test-Path $p)) { throw "Path not found: $p" }
}

function NowTag() {
  return (Get-Date).ToString("yyyyMMdd_HHmmss")
}

function Write-JsonFile([object]$obj, [string]$path) {
  $dir = Split-Path -Parent $path
  if ($dir -and -not (Test-Path $dir)) { New-Item -ItemType Directory -Force -Path $dir | Out-Null }
  # Depth <= 100 in Windows PowerShell; keep small
  $obj | ConvertTo-Json -Depth 30 | Set-Content -Encoding UTF8 $path
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
  $used = @($jp.meta.debug.topics.$Topic.used_blocks_sample)
  return ,$used
}

function Print-Table([object[]]$rows, [int]$top, [string]$title) {
  if ($title) { Write-Host "`n=== $title ===" -ForegroundColor Cyan }
  $rows |
    Select-Object key, @{n='len';e={$_.text.Length}}, priority |
    Format-Table -AutoSize
}

# --- Resolve defaults ---
if ([string]::IsNullOrWhiteSpace($ReqPath)) {
  $ReqPath = Join-Path $Root "astroprocessor\tools\requests\req_career.json"
}
if ([string]::IsNullOrWhiteSpace($GeneratorPath)) {
  $GeneratorPath = Join-Path $Root "astroprocessor\tools\seed\generate_career_overrides_from_debug_shortest.py"
}

Ensure-Path $Root
Ensure-Path $ReqPath
Ensure-Path $GeneratorPath

$SeedDir = Join-Path $Root "astroprocessor\tools\seed"
$DbPath  = Join-Path $Root "astroprocessor\data\knowledge.db"
Ensure-Path $DbPath

if ([string]::IsNullOrWhiteSpace($RunTag)) {
  $RunTag = NowTag
}

$DebugBefore = Join-Path $Root ("debug_{0}_{1}_{2}_{3}_before.json" -f $Topic, $Locale, $MaxBlocks, $RunTag)
$MiniJson    = Join-Path $Root ("debug_{0}_{1}_{2}_{3}_mini_focus.json" -f $Topic, $Locale, $MaxBlocks, $RunTag)
$SeedSql     = Join-Path $SeedDir ("seed_{0}_focus_planet_aspect_group_{1}.sql" -f $Topic, $RunTag)
$DebugAfter  = Join-Path $Root ("debug_{0}_{1}_{2}_{3}_after.json" -f $Topic, $Locale, $MaxBlocks, $RunTag)

Set-Location $Root

Write-Host "Root:        $Root"
Write-Host "API:         $ApiBase"
Write-Host "Topic:       $Topic"
Write-Host "Locale:      $Locale"
Write-Host "Budget:      max_blocks=$MaxBlocks, max_chars=$MaxChars"
Write-Host "FocusRegex:  $FocusRegex"
if ($ExcludeRegex) { Write-Host "ExcludeRegex:$ExcludeRegex" }
Write-Host "RunTag:      $RunTag"
Write-Host ""

# --- Build payload ---
$payloadObj = Get-Content -Raw -Encoding UTF8 $ReqPath | ConvertFrom-Json
$payloadObj | Add-Member -NotePropertyName name -NotePropertyValue "Test User" -Force
$payloadObj | Add-Member -NotePropertyName topic_categories -NotePropertyValue @($Topic) -Force
if ($payloadObj.PSObject.Properties.Name -contains "topic_category") { $payloadObj.PSObject.Properties.Remove("topic_category") }
$payloadJson = $payloadObj | ConvertTo-Json -Depth 100

# --- Debug before ---
Write-Host "1) Fetch debug (before) -> $DebugBefore" -ForegroundColor Yellow
Invoke-Debug -payloadJson $payloadJson -outPath $DebugBefore

$usedBefore = Load-UsedBlocks -debugPath $DebugBefore
Write-Host ("used_count(before) = {0}" -f @($usedBefore).Count) -ForegroundColor Green

# Focus selection
$focusBefore = @(
  $usedBefore | Where-Object {
    $_.key -match $FocusRegex -and
    (-not $ExcludeRegex -or $_.key -notmatch $ExcludeRegex)
  }
)

Write-Host ("focus_count(before) = {0}" -f @($focusBefore).Count) -ForegroundColor Green

# Report focus before (shortest & longest)
$focusSortedAsc  = @($focusBefore | Sort-Object { $_.text.Length })
$focusSortedDesc = @($focusBefore | Sort-Object { $_.text.Length } -Descending)

Write-Host "`n--- Focus BEFORE: shortest ---" -ForegroundColor Cyan
$focusSortedAsc |
  Select-Object key, @{n='len';e={$_.text.Length}}, priority |
  Select-Object -First $ReportTop |
  Format-Table -AutoSize

Write-Host "`n--- Focus BEFORE: longest ---" -ForegroundColor Cyan
$focusSortedDesc |
  Select-Object key, @{n='len';e={$_.text.Length}}, priority |
  Select-Object -First $ReportTop |
  Format-Table -AutoSize

# --- Build mini JSON ---
Write-Host "`n2) Build mini JSON -> $MiniJson" -ForegroundColor Yellow
$miniObj = @{
  meta = @{
    debug = @{
      topics = @{
        $Topic = @{
          used_blocks_sample = $focusBefore
        }
      }
    }
  }
}
Write-JsonFile -obj $miniObj -path $MiniJson

# --- Generate seed ---
Write-Host "`n3) Generate seed SQL -> $SeedSql" -ForegroundColor Yellow
if (-not (Test-Path $SeedDir)) { New-Item -ItemType Directory -Force -Path $SeedDir | Out-Null }

& $PythonExe $GeneratorPath `
  --in $MiniJson `
  --out $SeedSql `
  --topic $Topic `
  --locale "ru-RU" `
  --priority 140 `
  --max-len $SeedMaxLen `
  --max-keys $SeedMaxKeys

# --- Apply seed ---
Write-Host "`n4) Apply seed to SQLite -> $DbPath" -ForegroundColor Yellow
& $SqliteExe $DbPath ".read $SeedSql"

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

$focusAfterAsc  = @($focusAfter | Sort-Object { $_.text.Length })
$focusAfterDesc = @($focusAfter | Sort-Object { $_.text.Length } -Descending)

Write-Host "`n--- Focus AFTER: shortest ---" -ForegroundColor Cyan
$focusAfterAsc |
  Select-Object key, @{n='len';e={$_.text.Length}}, priority |
  Select-Object -First $ReportTop |
  Format-Table -AutoSize

Write-Host "`n--- Focus AFTER: longest ---" -ForegroundColor Cyan
$focusAfterDesc |
  Select-Object key, @{n='len';e={$_.text.Length}}, priority |
  Select-Object -First $ReportTop |
  Format-Table -AutoSize

# --- Delta (len changes for focus keys) ---
Write-Host "`n6) Delta report (focus keys):" -ForegroundColor Yellow

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