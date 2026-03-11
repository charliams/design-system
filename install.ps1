# install.ps1 — Install design-system Claude Code skills to ~/.claude/commands/
# Run from the design-system repo root: .\install.ps1
# Safe to run multiple times — overwrites with the latest version of each skill.

$sourceDir = Join-Path $PSScriptRoot "commands"
$targetDir = Join-Path $env:USERPROFILE ".claude\commands"

if (-not (Test-Path $targetDir)) {
    New-Item -ItemType Directory -Path $targetDir | Out-Null
    Write-Host "Created $targetDir" -ForegroundColor Green
}

$files = Get-ChildItem -Path $sourceDir -Filter "*.md"

if ($files.Count -eq 0) {
    Write-Host "No skill files found in $sourceDir" -ForegroundColor Yellow
    exit 1
}

foreach ($file in $files) {
    $dest = Join-Path $targetDir $file.Name
    Copy-Item -Path $file.FullName -Destination $dest -Force
    Write-Host "  Installed: $($file.Name)" -ForegroundColor Cyan
}

Write-Host ""
Write-Host "$($files.Count) skill(s) installed to $targetDir" -ForegroundColor Green
Write-Host ""
Write-Host "Available in Claude Code as:" -ForegroundColor White
foreach ($file in $files) {
    $cmdName = [System.IO.Path]::GetFileNameWithoutExtension($file.Name)
    Write-Host "  /$cmdName" -ForegroundColor White
}
