Set-Location (Split-Path -Parent $PSScriptRoot)

Write-Host 'Start Docker backend...'

docker compose up -d db backend

Write-Host 'Run migration...'

docker compose exec backend python manage.py migrate

Write-Host 'Backend started.'
Write-Host 'http://localhost:8000/'