typedef String MapEntry(String key, String value);

typedef String ChunkMapTemplate(String chunkKeys);

typedef String LookupBody(String chunkKey);

enum Type {
  dart,
  kotlin,
}

class TargetDefinition {
  TargetDefinition(
    this.type,
    this.outputFile,
    this.openAndroidMap,
    this.lookupAndroidHeader,
    this.lookupAndroidBody,
    this.lookupAndroidFooter,
    this.openIosMap,
    this.lookupIosMethod,
    this.closeMap,
    this.mapEntry,
    this.additionalInformation,
  );

  final Type type;
  final String outputFile;
  final ChunkMapTemplate openAndroidMap;
  final String lookupAndroidHeader;
  final LookupBody lookupAndroidBody;
  final String lookupAndroidFooter;
  final String openIosMap;
  final String lookupIosMethod;
  final MapEntry mapEntry;
  final String closeMap;
  final String additionalInformation;
}
