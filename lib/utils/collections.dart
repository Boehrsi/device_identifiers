import 'dart:collection';

extension Adjust<K, V> on Map<K, V> {
  Map<K, V> sortByKey() => SplayTreeMap<K, V>.from(
      this, (left, right) => left.toString().compareTo(right.toString()));

  Map<String, Map<K, V>> chunk() {
    String chunkKey = '';
    final resultMap = <String, Map<K, V>>{};
    forEach((key, value) {
      if (chunkKey != key.toString()[0]) {
        chunkKey = key.toString()[0];
        resultMap[chunkKey] = <K, V>{}..putIfAbsent(key, () => value);
      } else {
        resultMap[chunkKey]!.putIfAbsent(key, () => value);
      }
    });
    return resultMap;
  }
}
