$ProjectRoot = Resolve-Path (Join-Path $PSScriptRoot "..")

Set-Location $ProjectRoot

$appName = Read-Host "Input new project name"

if ([string]::IsNullOrWhiteSpace($appName)) {
    Write-Host "Project name is empty."
    exit 1
}

$appName = $appName.Trim()
$appNameLower = $appName.ToLower()

Write-Host "Initialize project: $appNameLower"

# Create .env
if (!(Test-Path ".env")) {
    Copy-Item ".env.example" ".env"
    Write-Host ".env created"
}

# frontend/pubspec.yaml
$pubspecPath = "frontend/pubspec.yaml"

if (Test-Path $pubspecPath) {

    (Get-Content $pubspecPath -Encoding UTF8) `
        -replace '^name:\s*.*$', "name: $appNameLower" `
        | Set-Content $pubspecPath -Encoding UTF8

    Write-Host "pubspec updated"
}

# docker-compose.yml
$dockerComposePath = "docker-compose.yml"

if (Test-Path $dockerComposePath) {

    (Get-Content $dockerComposePath -Encoding UTF8) `
        -replace 'planmark_', "$($appNameLower)_" `
        | Set-Content $dockerComposePath -Encoding UTF8

    Write-Host "docker-compose updated"
}

# README.md
$readmePath = "README.md"

if (Test-Path $readmePath) {

    (Get-Content $readmePath -Encoding UTF8) `
        -replace 'PlanMark_app', $appName `
        | Set-Content $readmePath -Encoding UTF8

    Write-Host "README updated"
}

# VSCode workspace
$workspacePath = ".vscode/PlanMark_app.code-workspace"

if (Test-Path $workspacePath) {
    Rename-Item -Path $workspacePath -NewName "$appName.code-workspace"
    Write-Host "workspace renamed"
}
Write-Host ""
Write-Host "Initialization complete."