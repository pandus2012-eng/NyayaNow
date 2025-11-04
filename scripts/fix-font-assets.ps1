<#
Fix-font-assets.ps1

Renames font files that accidentally have duplicate extensions like
`*.ttf.ttf` -> `*.ttf` and updates `pubspec.yaml` to match.

Usage (from repo root):
  .\scripts\fix-font-assets.ps1

This script is safe to run multiple times; it only renames files that
end with `.ttf.ttf` and replaces matching paths in `pubspec.yaml`.
#>

Param()

Set-StrictMode -Version Latest

$repoRoot = Get-Location
$fontsDir = Join-Path $repoRoot 'assets\fonts'
$pubspec = Join-Path $repoRoot 'pubspec.yaml'

if (-not (Test-Path $fontsDir)) {
    Write-Error "Fonts directory not found: $fontsDir"
    exit 2
}
if (-not (Test-Path $pubspec)) {
    Write-Error "pubspec.yaml not found at expected path: $pubspec"
    exit 2
}

$renamed = @()

Get-ChildItem -Path $fontsDir -File -Recurse | Where-Object { $_.Name -match '\.ttf\.ttf$' } | ForEach-Object {
    $oldPath = $_.FullName
    $newName = $_.Name -replace '\.ttf\.ttf$','.ttf'
    $newPath = Join-Path $_.DirectoryName $newName

    if (Test-Path $newPath) {
        $base = [System.IO.Path]::GetFileNameWithoutExtension($newName)
        $ext = [System.IO.Path]::GetExtension($newName)
        $i = 1
        do {
            $candidate = "$base-$i$ext"
            $newPath = Join-Path $_.DirectoryName $candidate
            $i++
        } while (Test-Path $newPath)
    }

    Rename-Item -LiteralPath $oldPath -NewName (Split-Path -Leaf $newPath)
    $renamed += @{ Old = $oldPath; New = $newPath }
    Write-Host "Renamed: $oldPath -> $newPath"
}

if ($renamed.Count -eq 0) {
    Write-Host "No `.ttf.ttf` files found; nothing to rename."
} else {
    $content = Get-Content -Raw -Path $pubspec
    foreach ($r in $renamed) {
        $oldRel = $r.Old -replace [regex]::Escape((Get-Location).Path + '\\'), '' -replace '\\','/'
        $newRel = $r.New -replace [regex]::Escape((Get-Location).Path + '\\'), '' -replace '\\','/'
        if ($content -like "*$oldRel*") {
            $content = $content -replace [regex]::Escape($oldRel), [regex]::Escape($newRel)
            Write-Host "Updated pubspec: $oldRel -> $newRel"
        }
    }
    Set-Content -Path $pubspec -Value $content -Encoding UTF8
    Write-Host "pubspec.yaml updated. Running 'flutter pub get' to refresh assets..."
    & flutter pub get
}

Write-Host "Done."
exit 0
