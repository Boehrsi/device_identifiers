import 'dart:io';

import 'lib/android.dart';
import 'lib/ios.dart';
import 'lib/targets/dart.dart';
import 'lib/targets/kotlin.dart';
import 'lib/targets/target_definition.dart';
import 'lib/utils/io.dart';

Future<void> main(List<String> args) async {
  final targets = [targetDart, targetKotlin];
  final information = setupInformation();

  final iOsData = await requestIosIdentifiers(iOsJson);
  final androidData = await requestAndroidIdentifiers(androidCsv);

  await Future.forEach(targets, (TargetDefinition target) async {
    final file = File(target.outputFile);
    final sink = file.openWrite();

    sink.write(information);
    sink.write(target.additionalInformation);
    sink.writeIosIdentifiers(target, iOsData);
    sink.writeIosLookupMethod(target);
    sink.writeAndroidIdentifiers(target, androidData);
    sink.writeAndroidLookupMethod(target, androidData.keys.toList());

    sink.close();
  });
}

String setupInformation() =>
    '// [${DateTime.now()}] Auto generated file, do not change.\n\n';
