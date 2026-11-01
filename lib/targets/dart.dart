import 'target_definition.dart';

String outputFile = 'output/device_identifiers.dart';

ChunkMapTemplate openAndroidMap =
    (String chunkKey) => 'const Map<String, String> _android$chunkKey = {\n';
String lookupAndroidHeader = '''String lookupAndroidName(String model) {
  if (model.isEmpty) {
    return '';
  }
  final result = switch (model[0]) {\n''';
LookupBody lookupAndroidBody =
    (String chunkKey) => "    '$chunkKey' => _android$chunkKey[model],\n";
String lookupAndroidFooter = '''    _ => null,
  };
  return result ?? model;
}\n''';

String openIosMap = 'const Map<String, String> _iOs = {\n';
String lookupIosMap =
    'String lookupIosName(String model) => _iOs[model] ?? model;\n';

MapEntry mapEntry = (String key, String value) => "  '$key': '$value',\n";
String closeMap = '};\n';

String _addtionalInformation = '''// coverage:ignore-file
// ignore_for_file: type=lint, unused_element, lines_longer_than_80_chars

''';

final targetDart = TargetDefinition(
  Type.dart,
  outputFile,
  openAndroidMap,
  lookupAndroidHeader,
  lookupAndroidBody,
  lookupAndroidFooter,
  openIosMap,
  lookupIosMap,
  closeMap,
  mapEntry,
  _addtionalInformation,
);
