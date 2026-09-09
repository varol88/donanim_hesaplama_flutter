# VS Code Settings

```json
{
  "[dart]": {
    "editor.formatOnSave": true,
    "editor.defaultFormatter": "Dart-Code.dart-code",
    "editor.rulers": [80, 120]
  },
  "[json]": {
    "editor.defaultFormatter": "esbenp.prettier-vscode"
  },
  "dart.flutterSdkPath": "/path/to/flutter",
  "dart.devToolsLocation": "remote"
}
```

# Project Setup

1. Install Flutter: https://flutter.dev/docs/get-started/install
2. Install VS Code
3. Install Dart and Flutter extensions
4. Run `flutter pub get`
5. Connect device or start emulator
6. Run `flutter run`

# Common Commands

- `flutter run` - Run the app
- `flutter run --release` - Run release build
- `flutter build apk` - Build APK
- `flutter build ios` - Build iOS
- `flutter pub get` - Get dependencies
- `flutter clean` - Clean build
- `flutter pub upgrade` - Upgrade dependencies
