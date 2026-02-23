param(
  [string]$DebugIn = ".\debug_career_after_round2.json",
  [int]$ShortestN = 10,
  [int]$MaxKeys = 80,
  [int]$MaxBlocks = 50,
  [string]$Locale = "ru",
  [string]$DbLocale = "ru-RU",
  [int]$Priority = 140,
  [string]$ExcludeRegex = '^natal\.sign\..*\.present$',
  [int]$MaxLenCap = 420,
  [int]$MinLen = 0,
  [switch]$DryRun
)

Set-StrictMode -Version Latest
$ErrorActionPreference = "Stop"

function Resolve-RepoRoot {
  if (Test-Path ".\astroprocessor\tools\requests\req_career.json") { return (Resolve-Path ".").Path }
  if (Test-Path ".\astroprocessor\astroprocessor\tools\requests\req_career.json") { return (Resolve-Path ".\astroprocessor").Path }
  throw "Repo root not found. Expected astroprocessor\tools\requests\req_career.json"
}

function Read-Json([string]$Path) {
  $raw = Get-Content -Raw -Encoding UTF8 $Path
  return $raw | ConvertFrom-Json
}

function Get-UsedBlocks($jp) {
  $blocks = $jp.meta.debug.topics.career.used_blocks_sample
  # Force array, even if 1 item or null
  if ($null -eq $blocks) { return @() }
  return @($blocks)
}

function Ensure-Commands {
  foreach ($cmd in @("python", "sqlite3")) {
    if (-not (Get-Command $cmd -ErrorAction SilentlyContinue)) {
      throw "Command not found: $cmd. Install it or add to PATH."
    }
  }
}

function Build-Payload([string]$reqPath, [string]$name, [string]$topic) {
  $payloadObj = Get-Content -Raw -Encoding UTF8 $reqPath | ConvertFrom-Json
  $payloadObj | Add-Member -NotePropertyName name -NotePropertyValue $name -Force
  $payloadObj | Add-Member -NotePropertyName topic_categories -NotePropertyValue @($topic) -Force
  if ($payloadObj.PSObject.Properties.Name -contains "topic_category") { $payloadObj.PSObject.Properties.Remove("topic_category") }
  return ($payloadObj | ConvertTo-Json -Depth 100)
}

function Filter-Used([object[]]$used, [string]$excludeRegex, [int]$minLen, [int]$maxLenCap) {
  $filtered =
    $used |
      Where-Object { $_.text -and $_.key } |
      Where-Object { $_.key -notmatch $excludeRegex } |
      Where-Object { $_.text.Length -ge $minLen -and $_.text.Length -le $maxLenCap }

  # Force array output
  return @($filtered)
}

function Pick-Shortest([object[]]$used, [int]$n) {
  return @(
    $used |
      Select-Object key, @{n='len';e={$_.text.Length}}, priority |
      Sort-Object len, key |
      Select-Object -First $n
  )
}

# ---- Main ----
Ensure-Commands
$repo = Resolve-RepoRoot

$debugInPath = Resolve-Path (Join-Path $repo $DebugIn) -ErrorAction Stop
$debugBaseName = [IO.Path]::GetFileNameWithoutExtension($debugInPath.Path)

$generator = Join-Path $repo "astroprocessor\tools\seed\generate_career_overrides_from_debug_shortest.py"
if (-not (Test-Path $generator)) { throw "Generator not found: $generator" }

$dbPath = Join-Path $repo "astroprocessor\data\knowledge.db"
if (-not (Test-Path $dbPath)) { throw "DB not found: $dbPath" }

$reqPath = Join-Path $repo "astroprocessor\tools\requests\req_career.json"
if (-not (Test-Path $reqPath)) { throw "Request template not found: $reqPath" }

Write-Host "Repo: $repo"
Write-Host "DebugIn: $($debugInPath.Path)"
Write-Host "ExcludeRegex: $ExcludeRegex"
Write-Host "Len filter: [$MinLen..$MaxLenCap]"
Write-Host "Generator: $generator"
Write-Host "DB: $dbPath"

$jp = Read-Json $debugInPath.Path
$usedAll = @(Get-UsedBlocks $jp)

Write-Host "`nused_blocks_sample total = $($usedAll.Count)"

if ($usedAll.Count -eq 0) {
  throw "used_blocks_sample missing/empty in $($debugInPath.Path)"
}

$used = @(Filter-Used $usedAll $ExcludeRegex $MinLen $MaxLenCap)

Write-Host "used after filters      = $($used.Count)"

if ($used.Count -eq 0) {
  Write-Host "Nothing left after filters. This debug snapshot has no candidates <= $MaxLenCap after ExcludeRegex."
  Write-Host "Tip: generate a NEW debug with a larger max_blocks (e.g. 80) to bring more diverse keys into used."
  exit 0
}

$shortest = @(Pick-Shortest $used $ShortestN)
Write-Host "`nShortest-$ShortestN (filtered):"
$shortest | Format-Table -AutoSize

$targetMaxLen = ($shortest | Select-Object -Last 1).len
if (-not $targetMaxLen -or $targetMaxLen -lt 1) { $targetMaxLen = 200 }
Write-Host "`nAuto max-len = $targetMaxLen"

$seedOut = Join-Path $repo ("astroprocessor\tools\seed\seed_career_auto_{0}_len{1}.sql" -f $debugBaseName, $targetMaxLen)

$genArgs = @(
  $generator,
  "--in", $debugInPath.Path,
  "--out", $seedOut,
  "--topic", "career",
  "--locale", $DbLocale,
  "--priority", $Priority,
  "--max-len", $targetMaxLen,
  "--max-keys", $MaxKeys
)

Write-Host "`nGenerating seed: $seedOut"
if (-not $DryRun) { & python @genArgs } else { Write-Host "DRYRUN: python $($genArgs -join ' ')" }

if (-not (Test-Path $seedOut)) { throw "Seed not created: $seedOut" }

Write-Host "`nApplying seed to DB..."
if (-not $DryRun) { & sqlite3 $dbPath ".read $seedOut" } else { Write-Host "DRYRUN: sqlite3 $dbPath .read $seedOut" }

$name = "AutoIter"
$payload = Build-Payload $reqPath $name "career"

$outDebug = Join-Path $repo ("debug_career_auto_after_{0}.json" -f $debugBaseName)

Write-Host "`nRequesting new debug JSON -> $outDebug"
if (-not $DryRun) {
  Invoke-RestMethod -Method Post `
    -Uri ("http://127.0.0.1:8000/v2/interpret?locale={0}&debug=2&max_blocks={1}" -f $Locale, $MaxBlocks) `
    -ContentType "application/json; charset=utf-8" `
    -Body $payload `
  | ConvertTo-Json -Depth 100 `
  | Set-Content -Encoding UTF8 $outDebug
}

Write-Host "`nShortest-20 (after apply + new request):"
if (-not $DryRun) {
  $jp2 = Read-Json $outDebug
  $used2 = @(Get-UsedBlocks $jp2)
  $used2 |
    Select-Object key, @{n='len';e={$_.text.Length}}, priority |
    Sort-Object len, key |
    Select-Object -First 20 |
    Format-Table -AutoSize
}

Write-Host "`nDONE."
Write-Host "Seed SQL: $seedOut"
Write-Host "New debug: $outDebug"