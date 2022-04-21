import 'target_definition.dart';

String outputFile = 'output/DeviceIdentifiers.kt';

ChunkMapTemplate openAndroidMap = (String chunkKey) {
  final adjustedchunkKey = _getAdjustedChunkKey(chunkKey);
  return '''object Android$adjustedchunkKey {
  internal val map by lazy {
    buildMap {
''';
};
String lookupAndroidHeader = '''fun lookupAndroidName(model: String): String {
  val result = when (model[0]) {
''';
LookupBody lookupAndroidBody = (String chunkKey) {
  final adjustedChunkedKey = _getAdjustedChunkKey(chunkKey);
  return "    '$chunkKey' -> Android$adjustedChunkedKey.map[model]\n";
};
String lookupAndroidFooter = '''    else -> null
  }
  return result ?: model
}
''';

String openIosMap = '''object Ios {
  internal val map by lazy {
    buildMap {
''';
String lookupIosMap =
    'fun lookupIosName(model: String): String = Ios.map[model] ?: model\n';

MapEntry mapEntry =
    (String key, String value) => '      put("$key", "$value")\n';
String closeMap = '''    }
  }
}
''';

String _getAdjustedChunkKey(String chunkKey) =>
    chunkKey != chunkKey.toUpperCase()
        ? "Lowercase${chunkKey.toUpperCase()}"
        : chunkKey;

final targetKotlin = TargetDefinition(
  Type.kotlin,
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
