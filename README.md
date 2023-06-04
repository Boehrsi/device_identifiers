# Device Identifiers

A Dart script which fetches Android and iOS device information. Generates directly usable code, which maps the device model to the corresponding device name(s).

## Supported output languages

- **Dart / Flutter**: https://github.com/Boehrsi/device_identifiers/blob/main/output/device_identifiers.dart
- **Kotlin**: https://github.com/Boehrsi/device_identifiers/blob/main/output/DeviceIdentifiers.kt
  - Required changes: Adjust the `package` to match your project

## Usage
- **Android**: Use the `lookupAndroidName()` method with the key obtained via `Build.MODEL` (https://developer.android.com/reference/android/os/Build#MODEL)
- **iOS**: Use the `lookupIosName()` method with the key obtained via `utsname.machine`

## Sources

- **iOS**: https://github.com/SeparateRecords/apple_device_identifiers
- **Android**: https://storage.googleapis.com/play_public/supported_devices.html (via https://support.google.com/googleplay/answer/1727131?hl=en)
