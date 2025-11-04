import 'dart:io';
import 'package:yaml/yaml.dart';

void main(List<String> args) async {
  final file = File('pubspec.yaml');
  if (!await file.exists()) {
    stderr.writeln('Error: pubspec.yaml not found.');
    exit(1);
  }

  final yaml = loadYaml(await file.readAsString());
  final flutter = yaml['flutter'];
  if (flutter == null) {
    stderr.writeln('Error: No "flutter" section found in pubspec.yaml.');
    exit(1);
  }

  final fonts = flutter['fonts'];
  if (fonts is! YamlList) {
    stdout.writeln('No fonts found in pubspec.yaml.');
    exit(0);
  }

  bool allExist = true;
  for (final fontEntry in fonts) {
    final family = fontEntry['family'];
    final fontList = fontEntry['fonts'];
    for (final f in fontList) {
      final assetPath = f['asset'];
      final file = File(assetPath);
      if (!await file.exists()) {
        stderr.writeln('❌ Missing font file: $assetPath (family: $family)');
        allExist = false;
      }
    }
  }

  if (allExist) {
    stdout.writeln('✅ All referenced font asset files exist.');
  } else {
    exit(1);
  }
}
