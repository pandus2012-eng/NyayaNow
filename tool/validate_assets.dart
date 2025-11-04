// Simple Dart validator for Flutter asset font entries in pubspec.yaml
// Usage: `dart run tool/validate_assets.dart`

import 'dart:io';
import 'package:yaml/yaml.dart';

void main(List<String> args) {
  final repoRoot = Directory.current.path;
  final pubspec = File('${repoRoot}${Platform.pathSeparator}pubspec.yaml');

  if (!pubspec.existsSync()) {
    stderr.writeln('pubspec.yaml not found at ${pubspec.path}');
    exit(2);
  }

  final content = pubspec.readAsStringSync();
  final doc = loadYaml(content);

  if (doc == null || doc is! YamlMap) {
    stdout.writeln('No pubspec content parsed. Nothing to validate.');
    exit(0);
  }

  final flutterSection = doc['flutter'];
  if (flutterSection == null || flutterSection is! YamlMap) {
    stdout.writeln('No `flutter:` section in pubspec.yaml. Nothing to validate.');
    exit(0);
  }

  final missing = <String>[];

  // Validate top-level assets block (images, etc.)
  final assetsBlock = flutterSection['assets'];
  if (assetsBlock is YamlList) {
    for (final a in assetsBlock) {
      if (a is String) {
        final rel = a.replaceAll('/', Platform.pathSeparator);
        if (rel.endsWith(Platform.pathSeparator)) {
          // directory reference
          final dir = Directory(rel);
          if (!dir.existsSync()) missing.add(a);
        } else {
          final file = File(rel);
          if (!file.existsSync()) missing.add(a);
        }
      }
    }
  }

  // Validate fonts block
  final fonts = flutterSection['fonts'];
  if (fonts is YamlList) {
    for (final fontEntry in fonts) {
      if (fontEntry is! YamlMap) continue;
      final fontsList = fontEntry['fonts'];
      if (fontsList is YamlList) {
        for (final f in fontsList) {
          if (f is YamlMap) {
            final asset = f['asset'] ?? f['assets'];
            if (asset is String) {
              final candidate = asset.replaceAll('/', Platform.pathSeparator);
              final file = File(candidate);
              if (!file.existsSync()) {
                missing.add(asset);
              }
            }
          }
        }
      }
    }
  }

  if (missing.isEmpty) {
    stdout.writeln('All referenced font asset files exist.');
    exit(0);
  } else {
    stderr.writeln('Missing asset files referenced in pubspec.yaml:');
    for (final m in missing) {
      stderr.writeln(' - $m');
    }
    exit(1);
  }
}
