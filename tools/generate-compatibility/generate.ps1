param (
    [string]$output = "../../docs/compatibility.md"
)

# do not show dotnet welcome text
[System.Environment]::SetEnvironmentVariable('DOTNET_SKIP_FIRST_TIME_EXPERIENCE', '1')

$output_php = & invoke-Expression "php -f program.php" | Out-String
$output_peachpie = & invoke-Expression "dotnet run --no-logo" | Out-String

$set_php = $output_php | ConvertFrom-Json
$set_peachpie = $output_peachpie | ConvertFrom-Json
