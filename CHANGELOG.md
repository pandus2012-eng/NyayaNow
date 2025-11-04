# Changelog

All notable changes to NyayaNow will be documented in this file.

## [v1.0.0] - 2025-11-04

### Added
- Cross-platform asset validation workflow
  - Dart CLI tool to validate `pubspec.yaml` asset paths
  - GitHub Actions workflow for CI validation
  - Git pre-commit hooks for local validation
  - PowerShell-to-Dart migration for cross-platform scripts
- Language & theme system
  - Runtime locale switching via Profile screen dropdown
  - Font handling for Kannada (Noto Sans Kannada) and Hindi (Noto Sans Devanagari)
  - Locale-aware themes with Material 3 color schemes

### Changed
- Asset organization
  - Fixed font filenames and paths in `pubspec.yaml`
  - Moved fonts to correct locations for consistent asset structure
- Route handling
  - Removed leading slashes from route names
  - Using `home: SplashScreen()` for direct startup
  - Standard route naming throughout app

### Developer experience
- Added asset validation to prevent missing/misnamed files
- Cross-platform tooling support (Windows/macOS/Linux)
- Git hooks installation script
- Locale-aware development setup
