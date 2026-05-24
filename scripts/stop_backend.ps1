Set-Location (Split-Path -Parent $PSScriptRoot)

Write-Host 'Stop Docker backend...'

docker compose down

Write-Host 'Stopped.'