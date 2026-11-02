import 'package:device_identifiers/targets/target_definition.dart';

String escape(dynamic content, TargetDefinition target) =>
    switch (target.type) {
      Type.dart =>
        content.toString().replaceAll('\\', '').replaceAll("'", "\\'"),
      Type.kotlin =>
        content.toString().replaceAll('\\', '').replaceAll('"', '\\"'),
    };
