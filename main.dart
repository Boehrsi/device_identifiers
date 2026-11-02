import 'dart:io';

import 'package:device_identifiers/sources/android.dart';
import 'package:device_identifiers/sources/ios.dart';
import 'package:device_identifiers/targets/dart.dart';
import 'package:device_identifiers/targets/kotlin.dart';
import 'package:device_identifiers/targets/target_definition.dart';
import 'package:device_identifiers/utils/io.dart';

Future<void> main(List<String> args) async {
  final targets = [targetDart, targetKotlin];
  final information = setupInformation();

  final iosData = await requestIosIdentifiers(iosApi);
  final androidData = await requestAndroidIdentifiers(androidCsv);

  await Future.forEach(targets, (TargetDefinition target) async {
    final file = File(target.outputFile);
    final sink = file.openWrite();

    sink.write(information);
    sink.write(target.additionalInformation);
    sink.writeIosIdentifiers(target, iosData);
    sink.writeIosLookupMethod(target);
    sink.writeAndroidIdentifiers(target, androidData);
    sink.writeAndroidLookupMethod(target, androidData.keys.toList());

    await sink.close();
  });
}

String setupInformation() =>
    '// [${DateTime.now()}] Auto generated file, do not change.\n\n';
