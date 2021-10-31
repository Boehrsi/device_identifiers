import 'dart:io';

import 'lib/android.dart';
import 'lib/io.dart';
import 'lib/ios.dart';

main(List<String> args) async {
  final file = await File(output);
  final sink = file.openWrite();

  await writeIosIdentifiers(sink);
  await writeAndroidIdentifiers(sink);

  sink.close();
}

Future<void> writeIosIdentifiers(IOSink sink) async {
  sink.write(iOsMap);

  final iPhoneMap = await requestIosIdentifiers(iPhoneJson);
  sink.writeMapToSink(iPhoneMap);
  final iPadMap = await requestIosIdentifiers(iPadJson);
  sink.writeMapToSink(iPadMap);

  sink.write(closeMap);
}

Future<void> writeAndroidIdentifiers(IOSink sink) async {
  sink.write(androidMap);

  final deviceMap = await requestAndroidIdentifiers(androidCsv);
  sink.writeMapToSink(deviceMap);

  sink.write(closeMap);
}
