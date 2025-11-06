import 'dart:io';
import 'package:yaml/yaml.dart';

/// Simple utility that validates all asset paths listed in pubspec.yaml.
/// Run it with:  `dart run tool/validate_assets.dart`

Future<void> main() async {
  final pubspecFile = File('pubspec.yaml');

  if (!pubspecFile.existsSync()) {
    print('❌ ERROR: pubspec.yaml not found in this directory.');
    exit(1);
  }

  final pubspecContent = pubspecFile.readAsStringSync();
  final yaml = loadYaml(pubspecContent);

  final flutterSection = yaml['flutter'];
  if (flutterSection == null) {
    print('⚠️ No "flutter" section found in pubspec.yaml.');
    exit(0);
  }

  final assets = <String>[];

  if (flutterSection['assets'] != null) {
    for (final entry in flutterSection['assets']) {
      assets.add(entry.toString());
    }
  }

  if (flutterSection['fonts'] != null) {
    for (final font in flutterSection['fonts']) {
      if (font['fonts'] != null) {
        for (final f in font['fonts']) {
          assets.add(f['asset'].toString());
        }
      }
    }
  }

  print('🔍 Validating ${assets.length} assets from pubspec.yaml...\n');

  bool allExist = true;

  for (final assetPath in assets) {
    final file = File(assetPath);
    final directory = Directory(assetPath);

    if (!file.existsSync() && !directory.existsSync()) {
      print('❌ Missing: $assetPath');
      allExist = false;
    } else {
      print('✅ Found: $assetPath');
    }
  }

  if (!allExist) {
    print(
        '\n🚨 One or more assets are missing. Please fix them before building.');
    exit(1);
  } else {
    print('\n🎉 All asset paths are valid!');
  }
}
