# generate docs/compatibility-status.md
invoke-expression -Command "$PSScriptRoot/generate-compatibility/generate.ps1" | Out-File -FilePath "$PSScriptRoot/../docs/compatibility-status.md" -Encoding UTF8
