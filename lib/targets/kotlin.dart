import 'package:device_identifiers/targets/target_definition.dart';

String outputFile = 'output/DeviceIdentifiers.kt';

ChunkMapTemplate openAndroidMap =
    (String chunkKey) => '''object Android${_getAdjustedChunkKey(chunkKey)} {
    internal val map by lazy {
        buildMap {
''';

String lookupAndroidHeader = '''fun lookupAndroidName(model: String): String {
    if (model.isBlank()) {
        return ""
    }
    val result = when (model[0]) {
''';
LookupBody lookupAndroidBody = (String chunkKey) =>
    "        '$chunkKey' -> Android${_getAdjustedChunkKey(chunkKey)}.map[model]\n";
String lookupAndroidFooter = '''        else -> null
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
    (String key, String value) => '            put("$key", "$value")\n';
String closeMap = '''        }
    }
}
''';

String _getAdjustedChunkKey(String chunkKey) =>
    chunkKey != chunkKey.toUpperCase()
        ? 'Lowercase${chunkKey.toUpperCase()}'
        : chunkKey;

String _addtionalInformation = '''// ktlint-disable
@file:Suppress("ktlint", "MaxLineLength", "unused", "SpellCheckingInspection")

package com.example.mypackage // Adjust to match your desired package

''';

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
  _addtionalInformation,
);
