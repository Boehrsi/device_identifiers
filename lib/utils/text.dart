import '../targets/target_definition.dart';

String escape(dynamic content, TargetDefinition target) {
  if (Type.dart == target.type) {
    return content.toString().replaceAll("\\", "").replaceAll("'", "\\'");
  } else if (Type.kotlin == target.type) {
    return content.toString().replaceAll('\\', '').replaceAll('"', '\\"');
  } else {
    throw Exception("Unknown target");
  }
}
