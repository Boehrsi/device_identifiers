import 'dart:convert';

import 'package:http/http.dart' as http;

final iOsJson =
    'https://raw.githubusercontent.com/kyle-seongwoo-jun/apple-device-identifiers/refs/heads/main/ios-device-identifiers.json';

Future<Map> requestIosIdentifiers(String target) async {
  final resultMap = {};
  final url = Uri.parse(target);
  final response = await http.get(url);
  final decodedResponse = jsonDecode(utf8.decode(response.bodyBytes)) as Map;
  decodedResponse.forEach((key, value) {
    if (!_isIPod(key)) {
      resultMap.update(key, (existingValue) => '$existingValue / $value',
          ifAbsent: () => value);
    }
  });
  return resultMap;
}

bool _isIPod(dynamic key) {
  return key.toString().startsWith("iPod");
}
