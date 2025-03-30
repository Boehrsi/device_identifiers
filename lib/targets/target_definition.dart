typedef MapEntry = String Function(String key, String value);

typedef ChunkMapTemplate = String Function(String chunkKeys);

typedef LookupBody = String Function(String chunkKey);

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
