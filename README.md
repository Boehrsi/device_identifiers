# device_identifiers

A Dart script which fetches device information for Android and iOS. Generates directly usable code. 

## Supported output languages

- Dart / Flutter: https://github.com/Boehrsi/device_identifiers/blob/main/output/device_identifiers.dart

## Usage
- Android: Use the `android` map with the key obtained via `Build.MODEL` (https://developer.android.com/reference/android/os/Build#MODEL)
- iOS: Use the `iOS` map with the key obtained via `utsname.machine`

## Sources

- **iOS**: https://github.com/SeparateRecords/apple_device_identifiers
- **Android**: https://storage.googleapis.com/play_public/supported_devices.html (via https://support.google.com/googleplay/answer/1727131?hl=en)
