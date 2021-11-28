import 'target_definition.dart';

String outputFile = 'output/device_identifiers.dart';

ChunkMapTemplate openAndroidMap = (String chunkKey) => 'late Map<String, String> _android_$chunkKey = {\n';
String lookupAndroidHeader = '''String? lookupAndroidName(String model) {
  final chunkKey = model.toString()[0];
  switch (chunkKey) {\n''';
LookupBody lookupAndroidBody = (String chunkKey) => '''    case '$chunkKey':
      return _android_$chunkKey[model];\n''';
String lookupAndroidFooter = '''    default:
      return null;
  }
}\n''';

String openIosMap = 'late Map<String, String> _iOs = {\n';
String lookupIosMap = 'String? lookupIosName(String model) => _iOs[model];\n';

MapEntry mapEntry = (String key, String value) => "  '$key': '$value', \n";
String closeMap = '};\n';

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
);
