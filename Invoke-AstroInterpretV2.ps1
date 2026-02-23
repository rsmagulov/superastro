# C:\Projects\superastro\Invoke-AstroInterpretV2.ps1
Set-StrictMode -Version Latest

function Invoke-AstroInterpretV2 {
  <#
  .SYNOPSIS
    Calls astroprocessor POST /v2/interpret with query params (locale/debug/max_blocks/max_chars) and body (name/birth/topic/button).
  .PARAMETER BaseUrl
    Example: http://127.0.0.1:8000
  .PARAMETER Name
    User name (required by API).
  .PARAMETER BirthDate
    YYYY-MM-DD
  .PARAMETER BirthTime
    HH:MM or HH:MM:SS. Optional if UnknownTime=$true
  .PARAMETER PlaceQuery
    Freeform place, e.g. "Semipalatinsk, Kazakhstan"
  .PARAMETER Gender
    "male" / "female" (as your API expects)
  .PARAMETER UnknownTime
    If true -> time=null and unknown_time=true
  .PARAMETER Topic
    e.g. "career". Sent as topic_categories=[Topic]
  .PARAMETER ButtonId
    Alternative to Topic. Mutually exclusive with Topic.
  .PARAMETER Locale
    MUST be "ru" for your API (only_ru_locale_supported).
  .PARAMETER Debug
    0/1/2
  .PARAMETER MaxBlocks
  .PARAMETER MaxChars
  .PARAMETER OutPath
    If set -> saves full response JSON to file (utf8).
  .OUTPUTS
    Parsed JSON object (Invoke-RestMethod result).
  #>

  [CmdletBinding()]
  param(
    [Parameter()][string]$BaseUrl = "http://127.0.0.1:8000",

    [Parameter(Mandatory)][string]$Name,
    [Parameter(Mandatory)][ValidatePattern('^\d{4}-\d{2}-\d{2}$')][string]$BirthDate,
    [Parameter()][string]$BirthTime,
    [Parameter(Mandatory)][string]$PlaceQuery,
    [Parameter()][ValidateSet("male","female")][string]$Gender = "male",
    [Parameter()][bool]$UnknownTime = $false,

    [Parameter()][string]$Topic,
    [Parameter()][string]$ButtonId,

    [Parameter()][ValidateSet("ru")][string]$Locale = "ru",
    [Parameter()][ValidateRange(0,2)][int]$Debug = 0,
    [Parameter()][int]$MaxBlocks = 160,
    [Parameter()][int]$MaxChars = 100000,

    [Parameter()][string]$OutPath
  )

  if ($Topic -and $ButtonId) { throw "Use either -Topic OR -ButtonId (mutually exclusive)." }

  if (-not $UnknownTime) {
    if (-not $BirthTime) { throw "BirthTime is required unless -UnknownTime `$true." }
    if ($BirthTime -match '^\d{2}:\d{2}$') { $BirthTime = "$BirthTime`:00" }
    if ($BirthTime -notmatch '^\d{2}:\d{2}:\d{2}$') { throw "BirthTime must be HH:MM or HH:MM:SS." }
  } else {
    $BirthTime = $null
  }

  $bodyObj = @{
    name  = $Name
    birth = @{
      date         = $BirthDate
      time         = $BirthTime
      place_query  = $PlaceQuery
      gender       = $Gender
      unknown_time = $UnknownTime
    }
  }

  if ($Topic)   { $bodyObj.topic_categories = @($Topic) }
  if ($ButtonId){ $bodyObj.button_id = $ButtonId }

  $uri = "{0}/v2/interpret?locale={1}&debug={2}&max_blocks={3}&max_chars={4}" -f $BaseUrl.TrimEnd('/'), $Locale, $Debug, $MaxBlocks, $MaxChars

  $jsonBody = $bodyObj | ConvertTo-Json -Depth 100

  $resp = Invoke-RestMethod -Method Post -Uri $uri -ContentType "application/json" -Body $jsonBody

  if ($OutPath) {
    $dir = Split-Path -Parent $OutPath
    if ($dir -and -not (Test-Path $dir)) { New-Item -ItemType Directory -Path $dir | Out-Null }
    $resp | ConvertTo-Json -Depth 100 | Set-Content -Encoding utf8 $OutPath
  }

  return $resp
}