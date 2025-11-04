Param()

Write-Host "Running asset validator (PowerShell)..."
try {
  if (Get-Command dart -ErrorAction SilentlyContinue) {
    dart run tool/validate_assets.dart
    if ($LASTEXITCODE -ne 0) { exit $LASTEXITCODE }
  } elseif (Get-Command flutter -ErrorAction SilentlyContinue) {
    flutter pub get | Out-Null
    dart run tool/validate_assets.dart
    if ($LASTEXITCODE -ne 0) { exit $LASTEXITCODE }
  } else {
    Write-Warning 'dart or flutter not found in PATH; skipping asset validation.'
  }
} catch {
  Write-Error "Asset validator failed: $_"
  exit 1
}

exit 0
