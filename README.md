# Device Identifiers

A Dart script which fetches Android and iOS device information. Generates directly usable code, which maps the device model to the corresponding device name(s).

<a href="https://idx.google.com/import?url=https://github.com/Boehrsi/device_identifiers">
  <picture>
    <source
      media="(prefers-color-scheme: dark)"
      srcset="https://cdn.idx.dev/btn/open_dark_32.svg">
    <source
      media="(prefers-color-scheme: light)"
      srcset="https://cdn.idx.dev/btn/open_light_32.svg">
    <img
      height="32"
      alt="Open in IDX"
      src="https://cdn.idx.dev/btn/open_purple_32.svg">
  </picture>
</a>

## Supported output languages

- **Dart / Flutter**: https://github.com/Boehrsi/device_identifiers/blob/main/output/device_identifiers.dart
- **Kotlin**: https://github.com/Boehrsi/device_identifiers/blob/main/output/DeviceIdentifiers.kt
  - Required changes: Adjust the `package` to match your project

## Usage
- **Android**: Use the `lookupAndroidName()` method with the key obtained via `Build.MODEL` (https://developer.android.com/reference/android/os/Build#MODEL)
- **iOS**: Use the `lookupIosName()` method with the key obtained via `utsname.machine`

## Sources

- **iOS**: https://github.com/kyle-seongwoo-jun/apple-device-identifiers
- **Android**: https://storage.googleapis.com/play_public/supported_devices.html (via https://support.google.com/googleplay/answer/1727131?hl=en)

## Used in

- https://github.com/Boehrsi/DeviceMarketingNames (Android library)
- https://github.com/Boehrsi/device_marketing_names (Flutter library)
