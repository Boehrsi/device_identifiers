import 'dart:collection';

extension Adjust on Map {
  Map sortByKey() => SplayTreeMap.from(this, (left, right) => left.toString().compareTo(right.toString()));

  Map<String, Map> chunk() {
    String chunkKey = "";
    final resultMap = <String, Map>{};
    forEach((key, value) {
      if (chunkKey != key.toString()[0]) {
        chunkKey = key.toString()[0];
        resultMap[chunkKey] = {}..putIfAbsent(key, () => value);
      } else {
        resultMap[chunkKey]!.putIfAbsent(key, () => value);
      }
    });
    return resultMap;
  }
}
