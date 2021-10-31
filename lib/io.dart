import 'dart:io';

final output = 'output/device_identifiers.dart';
final closeMap = '};\n';

extension SinkWriter on IOSink {
  void writeMapToSink(Map map) {
    map.forEach((key, value) {
      final escapedKey = key.toString().replaceAll("'", "\\\'");
      final escapedValue = value.toString().replaceAll("'", "\\\'");
      write("'$escapedKey': '$escapedValue', ");
    });
  }
}
