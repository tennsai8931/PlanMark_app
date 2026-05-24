$ProjectRoot = Split-Path $PSScriptRoot -Parent
$FrontendPath = Join-Path $ProjectRoot "frontend"

cd $FrontendPath

flutter run -d chrome