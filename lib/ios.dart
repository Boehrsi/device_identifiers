import 'dart:convert';

import 'package:http/http.dart' as http;

final iosJson =
    'https://raw.githubusercontent.com/kyle-seongwoo-jun/apple-device-identifiers/refs/heads/main/ios-device-identifiers.json';

Future<Map> requestIosIdentifiers(String target) async {
  final resultMap = {};
  final url = Uri.parse(target);
  final response = await http.get(url);
  final decodedResponse = jsonDecode(utf8.decode(response.bodyBytes)) as Map;
  decodedResponse.forEach((key, value) {
    resultMap.update(value, (existingKey) => '$existingKey / $key',
        ifAbsent: () => key);
  });
  return resultMap;
}
