# Changelog

All notable changes to this project will be documented in this file.

## [Unreleased]
- Add asset validator (Dart) to check `pubspec.yaml` asset paths.
- Add CI workflow to validate assets on push/PR.
- Add pre-commit hooks and installer to run validator locally.
- Fix font filenames and update `pubspec.yaml` entries to match.
- Add locale-aware theme chooser that picks colors and fonts based on system language.
  - Hindi: warm red accent + Noto Sans
  - Bengali: emerald accent + Noto Sans
  - Spanish: amber accent + Poppins
  - Default/English: blue accent + Poppins
