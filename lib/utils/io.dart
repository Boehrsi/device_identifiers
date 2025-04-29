import 'dart:io';

import '../targets/target_definition.dart';
import '../utils/text.dart';

extension SinkWriter on IOSink {
  void writeIosIdentifiers(TargetDefinition target, Map map) {
    write(target.openIosMap);
    _writeMap(map, target);
    write(target.closeMap);
  }

  void writeIosLookupMethod(TargetDefinition target) =>
      write(target.lookupIosMethod);

  void writeAndroidIdentifiers(TargetDefinition target, Map<String, Map> maps) {
    maps.forEach((key, value) {
      write(target.openAndroidMap(key));
      _writeMap(value, target);
      write(target.closeMap);
    });
  }

  void writeAndroidLookupMethod(
      TargetDefinition target, List<String> chunkKeys) {
    write(target.lookupAndroidHeader);
    for (final key in chunkKeys) {
      write(target.lookupAndroidBody(key));
    }
    write(target.lookupAndroidFooter);
  }

  void _writeMap(Map map, TargetDefinition target) {
    map.forEach((key, value) {
      final escapedKey = escape(key, target);
      final escapedValue = escape(value, target);
      write(target.mapEntry(escapedKey, escapedValue));
    });
  }
}
