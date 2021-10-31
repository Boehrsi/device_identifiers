import 'package:csv/csv.dart';
import 'package:http/http.dart' as http;

final androidCsv = 'https://storage.googleapis.com/play_public/supported_devices.csv';
final androidMap = 'Map<String, String> android = {';

Future<Map<dynamic, dynamic>> requestAndroidIdentifiers(String target) async {
  final resultMap = Map<dynamic, dynamic>();
  final url = Uri.parse(target);
  final response = await http.get(url);
  final decodedResponse = decode(response);
  removeHeader(decodedResponse);
  removeNullOrEmpty(decodedResponse);
  removeDuplicates(decodedResponse).forEach((key, value) {
    resultMap[key] = value.join(' / ');
  });
  return resultMap;
}

List<List<dynamic>> decode(http.Response response) {
  var utf16Bytes = response.bodyBytes.buffer.asUint16List();
  var responseString = String.fromCharCodes(utf16Bytes);
  List<List<dynamic>> decodedResponse = const CsvToListConverter().convert(responseString);
  return decodedResponse;
}

void removeHeader(List<List<dynamic>> list) => list.removeAt(0);

void removeNullOrEmpty(List<List<dynamic>> list) {
  list.removeWhere((element) {
    var key = getKey(element);
    var value = getValue(element);
    return key == null || value == null || key.toString().isEmpty || value.toString().isEmpty;
  });
}

Map<dynamic, List<dynamic>> removeDuplicates(List<List<dynamic>> list) {
  final correctedMap = Map<dynamic, List<dynamic>>();
  list.forEach((element) {
    final key = getKey(element);
    final value = getValue(element);
    correctedMap.update(key, (existingValue) {
      if (!existingValue.contains(value)) {
        existingValue.add(value);
      }
      return existingValue;
    }, ifAbsent: () => [value]);
  });
  return correctedMap;
}

getValue(List<dynamic> element) => element[1];

getKey(List<dynamic> element) => element[3];
