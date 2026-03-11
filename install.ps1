# install.ps1 — Install design-system Claude Code skills to ~/.claude/skills/
# Run from the design-system repo root: .\install.ps1
# Safe to run multiple times — overwrites with the latest version of each skill.

$sourceDir = Join-Path $PSScriptRoot "skills"
$targetDir = Join-Path $env:USERPROFILE ".claude\skills"

if (-not (Test-Path $sourceDir)) {
    Write-Host "No skills\ directory found in $PSScriptRoot" -ForegroundColor Yellow
    exit 1
}

$skillDirs = Get-ChildItem -Path $sourceDir -Directory

if ($skillDirs.Count -eq 0) {
    Write-Host "No skill directories found in $sourceDir" -ForegroundColor Yellow
    exit 1
}

foreach ($dir in $skillDirs) {
    $destDir = Join-Path $targetDir $dir.Name
    if (-not (Test-Path $destDir)) {
        New-Item -ItemType Directory -Path $destDir | Out-Null
    }
    $files = Get-ChildItem -Path $dir.FullName -Filter "*.md"
    foreach ($file in $files) {
        Copy-Item -Path $file.FullName -Destination (Join-Path $destDir $file.Name) -Force
    }
    Write-Host "  Installed: $($dir.Name)" -ForegroundColor Cyan
}

Write-Host ""
Write-Host "$($skillDirs.Count) skill(s) installed to $targetDir" -ForegroundColor Green
Write-Host ""
Write-Host "Available in Claude Code as:" -ForegroundColor White
foreach ($dir in $skillDirs) {
    Write-Host "  /$($dir.Name)" -ForegroundColor White
}
