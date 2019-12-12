#
# generates compatibility-status.md markdown page
#

param (
)

function progress {
  param ([string]$title, [array]$php ,[array]$peachpie)

  if (!$php) { return }
  
  # dfference of two arrays:
  $diff = Compare-Object -ReferenceObject $php -DifferenceObject $peachpie

  # filter only items present in $php and not present in $peachpie
  # InputObject, SideIndicator
  $missing = $diff | where SideIndicator -eq "<=" | Select-Object -ExpandProperty InputObject

  # render progress
  $progress = $php.count - $missing.count
  "??? tiny ""[=$( [int](100 * $progress / $php.count) )% ""**$title** $progress / $($php.count)""]"""

  if ($missing.count -eq 0) {
    "    happy face"
  } else {
    foreach ($item in $missing) {
      if ($item -match "\w+\s+(\w+)::" -and $missing.contains("class $($Matches.1)")) {
        continue; # containing class was already reported, do not report its member functions
      }
      "    - ``$item``"
    }
  }
}

# do not show dotnet welcome text:
[System.Environment]::SetEnvironmentVariable('DOTNET_SKIP_FIRST_TIME_EXPERIENCE', '1')

# run collect features from php & peachpie:
$output_php = & invoke-Expression "php -f ""$PSScriptRoot/program.php""" | Out-String
$output_peachpie = & invoke-Expression "dotnet run --no-logo -p ""$PSScriptRoot""" | Out-String

$php = $output_php | ConvertFrom-Json
$peachpie = $output_peachpie | ConvertFrom-Json

# prolog
"!!! tip ""PeachPie $($peachpie.version) vs. PHP $($php.version)"""
"    Following table compares defined extensions, functions and classes of a regular ``php`` against ``peachpie``. Not implemented entries are listed below each category."

""
"### Extensions"
""

# extensions
progress "extensions" $php.extensions $peachpie.extensions

""
"### Classes & Functions"
""

$peachpie_all = @()

foreach ($ext in $peachpie.extensions) {
    $peachpie_all = $peachpie_all + $peachpie."ext-$ext"
}

foreach ($ext in $peachpie.extensions) {
    #if ($php."ext-$ext")
    progress $ext $php."ext-$ext" $peachpie_all #$peachpie."ext-$ext"
}

# TODO: overall
# TODO: constants
