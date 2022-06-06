import 'target_definition.dart';

String outputFile = 'output/device_identifiers.dart';

ChunkMapTemplate openAndroidMap =
    (String chunkKey) => 'Map<String, String> _android$chunkKey = {\n';
String lookupAndroidHeader = '''String lookupAndroidName(String model) {
  if (model.isEmpty) {
    return "";
  }
  String? result; 
  final chunkKey = model.toString()[0];
  switch (chunkKey) {\n''';
LookupBody lookupAndroidBody = (String chunkKey) => '''    case '$chunkKey':
      result = _android$chunkKey[model];
      break;\n''';
String lookupAndroidFooter = '''    default:
      result = null;
      break;
  }
  return result ?? model;
}\n''';

String openIosMap = 'Map<String, String> _iOs = {\n';
String lookupIosMap =
    'String lookupIosName(String model) => _iOs[model] ?? model;\n';

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
