import 'dart:convert';

import 'package:device_identifiers/utils/collections.dart';
import 'package:http/http.dart' as http;

final iosApi = 'https://api.ipsw.me/v4/devices';

class IosDevice {
  const IosDevice({required this.identifier, required this.name});

  factory IosDevice.fromJson(Map<String, dynamic> json) => IosDevice(
        identifier: json['identifier'] as String? ?? '',
        name: json['name'] as String? ?? '',
      );

  final String identifier;
  final String name;

  bool get isIPod => identifier.startsWith('iPod');
  bool get isValid => identifier.isNotEmpty && name.isNotEmpty && !isIPod;
}

Future<Map<String, String>> requestIosIdentifiers(String target) async {
  final resultMap = <String, String>{};
  final url = Uri.parse(target);
  final response = await http.get(url);
  final decodedResponse = jsonDecode(utf8.decode(response.bodyBytes)) as List;

  for (final item in decodedResponse) {
    if (item is Map) {
      final device = IosDevice.fromJson(Map<String, dynamic>.from(item));
      if (device.isValid) {
        resultMap.putIfAbsent(device.identifier, () => device.name);
      }
    }
  }

  return Map<String, String>.from(resultMap.sortByKey());
}
