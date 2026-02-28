param(
  [Parameter(Mandatory=$true)][string]$URL,
  [Parameter(Mandatory=$true)][string]$Req,
  [Parameter(Mandatory=$true)][string]$DbPath,
  [Parameter(Mandatory=$true)][string]$Topic,
  [Parameter(Mandatory=$true)][string]$NegativeKey
)

Set-StrictMode -Version Latest
$ErrorActionPreference = "Stop"

function Invoke-Astro([string]$reqPath) {
  $json = & curl.exe -s -X POST "$URL" -H "Content-Type: application/json" --data-binary "@$reqPath"
  if (-not $json) { throw "Empty response from $URL" }
  return ($json | ConvertFrom-Json)
}

function SqlScalar([string]$sql) {
  $out = & sqlite3.exe "$DbPath" "$sql"
  return ($out | Out-String).Trim()
}

function SqlRow([string]$sql) {
  $s = (& sqlite3.exe "$DbPath" "$sql" | Out-String).Trim()
  if (-not $s) { return $null }
  return ($s -split "\|")
}

function TcOfId([int]$id) {
  $tc = SqlScalar "SELECT COALESCE(topic_category,'<NULL>') FROM knowledge_items WHERE id=$id;"
  if (-not $tc) { return "<MISSING>" }
  return $tc
}

function New-ReqWithTopic([string]$srcPath, [object]$topicValue) {
  $obj = Get-Content $srcPath -Raw | ConvertFrom-Json
  $obj.topic_category = $topicValue
  $tmp = Join-Path $env:TEMP ("req_topic_" + ([guid]::NewGuid().ToString("N")) + ".json")
  ($obj | ConvertTo-Json -Depth 30) | Out-File -Encoding utf8 $tmp
  return $tmp
}

function Get-BlocksMap($resp) {
  $map = @{}
  $blocks = $resp.meta.raw.blocks
  if ($null -eq $blocks) { return $map }
  foreach ($b in $blocks) {
    $id = [string]$b.block_id
    $map[$id] = $b
  }
  return $map
}

function Write-Sanity([string]$label, $resp) {
  $src = $resp.meta.final.source
  $cov = $resp.coverage
  $cnt = 0
  if ($resp.meta.raw.blocks) { $cnt = @($resp.meta.raw.blocks).Count }
  Write-Host ("{0}: final.source={1} coverage={2} raw.blocks={3}" -f $label,$src,$cov,$cnt)
}

# -------------------- preflight --------------------
if (-not (Test-Path $Req))   { throw "Req file not found: $Req" }
if (-not (Test-Path $DbPath)){ throw "DB file not found: $DbPath" }
if ([string]::IsNullOrWhiteSpace($NegativeKey)) { throw "NegativeKey is empty" }
if ([string]::IsNullOrWhiteSpace($Topic)) { throw "Topic is empty" }

$REQ_CAT  = $null
$REQ_NULL = $null

try {
  $REQ_CAT  = New-ReqWithTopic $Req $Topic
  $REQ_NULL = New-ReqWithTopic $Req $null

  Write-Host "== SANITY ==" -ForegroundColor Cyan
  $respCat0  = Invoke-Astro $REQ_CAT
  $respNull0 = Invoke-Astro $REQ_NULL
  Write-Sanity "cat"  $respCat0
  Write-Sanity "null" $respNull0
  Write-Host ""

  $catMap  = Get-BlocksMap $respCat0
  $nullMap = Get-BlocksMap $respNull0

  # union of keys
  $allIds = @{}
  foreach ($k in $catMap.Keys)  { $allIds[$k] = $true }
  foreach ($k in $nullMap.Keys) { $allIds[$k] = $true }
  $blockIds = $allIds.Keys | Sort-Object

  $rows = @()
  foreach ($bid in $blockIds) {
    $catB  = $catMap[$bid]
    $nullB = $nullMap[$bid]

    $catKey = if ($catB) { [string]$catB.key } else { "" }
    $catHit = if ($catB) { [int]$catB.knowledge_item_id } else { 0 }
    $catTc  = if ($catHit -gt 0) { TcOfId $catHit } else { "" }

    $nullKey = if ($nullB) { [string]$nullB.key } else { "" }
    $nullHit = if ($nullB) { [int]$nullB.knowledge_item_id } else { 0 }
    $nullTc  = if ($nullHit -gt 0) { TcOfId $nullHit } else { "" }

    $note = ""
    if ($nullHit -gt 0 -and $nullTc -ne "<NULL>") { $note = "❌ null picked non-NULL tc" }

    $rows += [pscustomobject]@{
      block_id  = $bid
      cat_key   = $catKey
      cat_tc    = $catTc
      null_key  = $nullKey
      null_tc   = $nullTc
      note      = $note
    }
  }

  Write-Host "== MATRIX ==" -ForegroundColor Cyan
  $rows | Format-Table -AutoSize
  Write-Host ""

  Write-Host "== ASSERTIONS ==" -ForegroundColor Cyan
  $badNull = $rows | Where-Object { $_.null_tc -and $_.null_tc -ne "<NULL>" }
  if (@($badNull).Count -gt 0) {
    Write-Host "❌ FAIL: null-mode returned non-NULL topic_category for some hits" -ForegroundColor Red
    $badNull | Format-Table -AutoSize
    throw "Assertions failed"
  } else {
    Write-Host "✅ OK: null-mode only returns <NULL> rows" -ForegroundColor Green
  }

  Write-Host ""
  Write-Host "== NEGATIVE TEST ==" -ForegroundColor Cyan

  # IMPORTANT: escape key for SQL literal
  $escapedKey = $NegativeKey.Replace("'","''")

  # Find an ACTIVE NULL row for this key
  $sqlProbe = @"
SELECT id || '|' || is_active
FROM knowledge_items
WHERE locale='ru-RU'
  AND key='$escapedKey'
  AND topic_category IS NULL
  AND is_active=1
ORDER BY id DESC
LIMIT 1;
"@

  $probe = SqlRow $sqlProbe
  if ($null -eq $probe) {
    Write-Host ("⚠️ No ACTIVE NULL row found for key={0}. Skipping negative test." -f $NegativeKey) -ForegroundColor Yellow
    return
  }

  $nullId    = [int]$probe[0]
  $wasActive = [int]$probe[1]
  Write-Host ("Found ACTIVE NULL row: id={0} is_active={1}" -f $nullId,$wasActive)

  # Disable it
  [void](SqlScalar ("UPDATE knowledge_items SET is_active=0 WHERE id={0};" -f $nullId))

  # Call null-mode again: it MUST NOT fall back to category rows
  $respNull1 = Invoke-Astro $REQ_NULL
  $nullMap1  = Get-BlocksMap $respNull1

  $bad2 = @()
  foreach ($bid in $nullMap1.Keys) {
    $b = $nullMap1[$bid]
    $hid = [int]$b.knowledge_item_id
    if ($hid -gt 0) {
      $tc = TcOfId $hid
      if ($tc -ne "<NULL>") {
        $bad2 += [pscustomobject]@{ block_id=$bid; key=$b.key; hit_id=$hid; tc=$tc }
      }
    }
  }

  if (@($bad2).Count -gt 0) {
    Write-Host "❌ FAIL: after disabling NULL row, null-mode picked category rows" -ForegroundColor Red
    $bad2 | Format-Table -AutoSize
    throw "Negative test failed"
  } else {
    Write-Host ("✅ OK: after disabling NULL row for {0}, null-mode still did not pick category rows." -f $NegativeKey) -ForegroundColor Green
  }

  # Restore
  [void](SqlScalar ("UPDATE knowledge_items SET is_active={0} WHERE id={1};" -f $wasActive,$nullId))
  Write-Host ("Restored NULL row id={0} is_active={1}" -f $nullId,$wasActive)

} finally {
  if ($REQ_CAT -and (Test-Path $REQ_CAT))   { Remove-Item -Force $REQ_CAT  -ErrorAction SilentlyContinue }
  if ($REQ_NULL -and (Test-Path $REQ_NULL)) { Remove-Item -Force $REQ_NULL -ErrorAction SilentlyContinue }
}
