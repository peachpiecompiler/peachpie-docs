param (
)

# do not show dotnet welcome text
[System.Environment]::SetEnvironmentVariable('DOTNET_SKIP_FIRST_TIME_EXPERIENCE', '1')

$output_php = & invoke-Expression "php -f program.php" | Out-String
$output_peachpie = & invoke-Expression "dotnet run --no-logo" | Out-String

$php = $output_php | ConvertFrom-Json
$peachpie = $output_peachpie | ConvertFrom-Json

# prolog
"Following table compares regular ``php`` and ``peachpie``:"
"> PeachPie $($peachpie.version) vs. PHP $($php.version)"

# extensions

