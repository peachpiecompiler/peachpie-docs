#
# generates compatibility-status.md markdown page
#

param (
)

function progress {
  param ([string]$title, [array]$php , [array]$peachpie)

  if (!$php) { return }

  $peachpie_matched = @()
  $rows = @() #table rows

  foreach ($element in $php) {
    $matched = $false
    if ($element -match "([^\(]*)\((.*)\)") {
      # function, has parameter list
      $element_name = $Matches.1
      $element_params = $Matches.2
      foreach ($x in $peachpie) {
        if ($x -match "([^\(]*)\((.*)\)" -and $element_name -eq $Matches.1) {
          $matched = $true
          $peachpie_matched += $x
          $x_params = $Matches.2
          if ($element_params -eq $x_params) {
            # $rows += "$($element) | $($x)"
          }
          else {
            # $rows += "$($element_name)(<span style='color:green;'>$($element_params)</span>) | $($element_name)(<span style='font-weight:bold;text-decoration:underline;'>$($x_params)</span>)"
          }
          break
        }
      }
    }
    else {
      if ($peachpie -contains $element) {
        $matched = $true
        $peachpie_matched += $element
        # $rows += "$($element) | $($element)"
      }
    }
    if (-not $matched) {
      if ($element -match "\w+\s+(\w+)::" -and -not $peachpie_matched.contains("class $($Matches.1)")) {
        continue; # containing class was already reported, do not report its members
      }

      $rows += "$($element) | - <span style='color:red;font-weight:bold;'>$($element)</span>"
    }
  }

  foreach ($element in $peachpie) {
    if (-not $peachpie_matched.contains($element)) {
      $rows += " | + <span style='color:red;font-weight:bold;'>$($element)</span>"
    }
  }

  # render progress
  $progress = $peachpie_matched.count
  "??? tiny ""[=$( [int](100 * $progress / $php.count) )% ""**$title** $progress / $($php.count)""]"""

  # ""
  # "# **$title**"
  # ""
  
  if ($rows.count -ne 0) {
    "    | PHP | PeachPie |"
    "    | --- | ---      |"
  }

  foreach ($row in $rows) {
    "    | $row |"
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
"    The table lists PHP extensions that the project aims for"
"    and compares the public functions, classes, and constants."

# ""
# "### Extensions"
# ""
# # extensions
# progress "extensions" $php.extensions $peachpie.extensions

# ""
# "### Classes & Functions"
# ""

# $peachpie_all = @()
# foreach ($ext in $peachpie.extensions) {
#   $peachpie_all = $peachpie_all + $peachpie."ext-$ext"
# }

foreach ($ext in $php.extensions) {
  #if ($php."ext-$ext")
  progress $ext $php."ext-$ext" $peachpie."ext-$ext"
}

# TODO: overall
