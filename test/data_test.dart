import 'package:test/test.dart';

import '../output/device_identifiers.dart';

void main() {
  test('No iOS match', () {
    final model = 'ios';
    final result = lookupIosName(model);
    expect(result, null);
  });

  test('iOS match', () {
    final model = 'iPhone7,2';
    final result = lookupIosName(model);
    expect(result, 'iPhone 6');
  });

  test('No Android match', () {
    final model = 'android';
    final result = lookupAndroidName(model);
    expect(result, null);
  });

  test('Android match', () {
    final model = 'KB2005';
    final result = lookupAndroidName(model);
    expect(result, 'OnePlus 8T');
  });
}
