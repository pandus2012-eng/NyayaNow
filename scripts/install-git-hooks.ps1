<#
Install git hooks from .githooks/ into .git/hooks

Usage (PowerShell):
  .\scripts\install-git-hooks.ps1

This script copies the sample hooks into the repository's `.git/hooks` folder
and sets the execute bit where applicable.
#>

Param()

Set-StrictMode -Version Latest

$repoRoot = Get-Location
$githooksDir = Join-Path $repoRoot '.githooks'
$destDir = Join-Path $repoRoot '.git\hooks'

if (-not (Test-Path $githooksDir)) {
    Write-Error "Directory not found: $githooksDir"
    exit 2
}
if (-not (Test-Path $destDir)) {
    Write-Error "Git hooks directory not found: $destDir. Is this a git repo?"
    exit 2
}

Get-ChildItem -Path $githooksDir -File | ForEach-Object {
    $src = $_.FullName
    $dest = Join-Path $destDir $_.Name
    Copy-Item -Path $src -Destination $dest -Force
    Write-Host "Installed hook: $($_.Name)"
}

# Try to set execute permission for Unix (if running in an environment that respects it)
try {
    if (Get-Command git -ErrorAction SilentlyContinue) {
        & git update-index --add --chmod=+x .git/hooks/* 2>$null
    }
} catch { }

Write-Host "Hooks installed. You can remove or customize them in .git/hooks if needed."
exit 0
