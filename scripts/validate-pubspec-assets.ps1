<#
validate-pubspec-assets.ps1

Validates that asset paths under `fonts:` in `pubspec.yaml` exist on disk.

Usage (from repo root):
  .\scripts\validate-pubspec-assets.ps1

Exits with code 0 when all assets exist, or 1 when any are missing.
#>

Param()

Set-StrictMode -Version Latest

$repoRoot = Get-Location
$pubspec = Join-Path $repoRoot 'pubspec.yaml'

if (-not (Test-Path $pubspec)) {
    Write-Error "pubspec.yaml not found at: $pubspec"
    exit 2
}

$content = Get-Content -Raw -Path $pubspec

# Extract lines that look like: - asset: "assets/fonts/...."
$regex = '(?m)^[ \t]*- asset:[ \t]*"(?<path>assets/[^"]+)"'

$matches = [regex]::Matches($content, $regex)

if ($matches.Count -eq 0) {
    Write-Host "No asset font entries found in pubspec.yaml."
    exit 0
}

$missing = @()
foreach ($m in $matches) {
    $rel = $m.Groups['path'].Value -replace '/','\\'
    $abs = Join-Path $repoRoot $rel
    if (-not (Test-Path $abs)) {
        $missing += $rel
    }
}

if ($missing.Count -eq 0) {
    Write-Host "All referenced font asset files exist."
    exit 0
} else {
    Write-Host "Missing asset files referenced in pubspec.yaml:`n"
    foreach ($r in $missing) { Write-Host " - $r" }
    exit 1
}
