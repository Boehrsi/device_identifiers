import 'package:csv/csv.dart';
import 'utils/collections.dart';
import 'package:http/http.dart' as http;

final androidCsv =
    'https://storage.googleapis.com/play_public/supported_devices.csv';

Future<Map<String, Map>> requestAndroidIdentifiers(String target) async {
  final resultMap = {};
  final url = Uri.parse(target);
  final response = await http.get(url);
  final decodedResponse = decode(response);
  removeHeader(decodedResponse);
  removeNullOrEmpty(decodedResponse);
  removeDuplicates(decodedResponse).forEach((key, value) {
    resultMap[key] = value.join(' / ');
  });
  removeEqualKeyValue(resultMap);
  return resultMap.sortByKey().chunk();
}

List<List<dynamic>> decode(http.Response response) {
  final utf16Bytes = response.bodyBytes.buffer.asUint16List();
  final responseString = String.fromCharCodes(utf16Bytes);
  final List<List<dynamic>> decodedResponse =
      const CsvToListConverter().convert(
    responseString,
    eol: '\n',
  );
  return decodedResponse;
}

void removeHeader(List<List<dynamic>> list) => list.removeAt(0);

void removeNullOrEmpty(List<List<dynamic>> list) {
  list.removeWhere((element) {
    final key = getKey(element);
    final value = getValue(element);
    return key == null ||
        value == null ||
        key.toString().isEmpty ||
        value.toString().isEmpty;
  });
}

Map<dynamic, List<dynamic>> removeDuplicates(List<List<dynamic>> list) {
  final correctedMap = <dynamic, List<dynamic>>{};
  for (final element in list) {
    final key = getKey(element);
    final value = getValue(element);
    correctedMap.update(key, (existingValue) {
      if (!existingValue.contains(value)) {
        existingValue.add(value);
      }
      return existingValue;
    }, ifAbsent: () => [value]);
  }
  return correctedMap;
}

void removeEqualKeyValue(Map<dynamic, dynamic> map) =>
    map.removeWhere((key, value) => key.toString() == value
      ..toString());

getValue(List<dynamic> element) => element[1];

getKey(List<dynamic> element) => element[3];
