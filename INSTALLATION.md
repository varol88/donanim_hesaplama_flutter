# Donanım Hesaplama Sistemi - Flutter
## Complete Installation & Setup Guide

### Prerequisites

- **Flutter**: 3.x or higher
- **Dart**: 3.x or higher  
- **Android Studio**: For Android development
- **Xcode**: For iOS development (macOS only)
- **Git**: For version control

### Step 1: Install Flutter

#### Windows
1. Download Flutter SDK from https://flutter.dev/docs/get-started/install/windows
2. Extract to a location (e.g., `C:\flutter`)
3. Add to PATH: `C:\flutter\bin`
4. Run `flutter doctor` to verify installation

#### macOS
```bash
brew install flutter
flutter doctor
```

#### Linux
```bash
sudo apt-get install git curl bash xz-utils zip libglu1-mesa
curl -O https://storage.googleapis.com/flutter_infra_release/releases/stable/linux/flutter_linux_3.x.x-stable.tar.xz
tar xf flutter_linux_3.x.x-stable.tar.xz
export PATH="$PATH:`pwd`/flutter/bin"
flutter doctor
```

### Step 2: Clone the Repository

```bash
git clone https://github.com/varol88/donanim_hesaplama_flutter.git
cd donanim_hesaplama_flutter
```

### Step 3: Get Dependencies

```bash
flutter pub get
```

### Step 4: Run the Application

#### On Android Emulator
```bash
# Start emulator
emulator -avd Pixel_4_API_30

# Run app
flutter run
```

#### On Physical Device
```bash
# Enable USB debugging on your Android device
# Connect device via USB

flutter devices  # Verify device is recognized
flutter run
```

#### On iOS Simulator
```bash
# Start simulator
open -a Simulator

# Run app
flutter run
```

#### On macOS
```bash
flutter run -d macos
```

### Step 5: Development Setup (VS Code)

1. Install VS Code from https://code.visualstudio.com
2. Install extensions:
   - Dart Code
   - Flutter
   - Prettier

3. Configure workspace settings:
   - Settings → Format on Save (enabled)
   - Dart line length: 80

### Step 6: Build for Release

#### Android APK
```bash
flutter build apk --release
# Output: build/app/outputs/apk/release/app-release.apk
```

#### Android App Bundle
```bash
flutter build appbundle --release
# Output: build/app/outputs/bundle/release/app-release.aab
```

#### iOS
```bash
flutter build ios --release
# Output: build/ios/iphoneos/Runner.app
```

### Common Issues & Solutions

#### Issue: "Flutter SDK not found"
**Solution**: Run `flutter config --android-studio-dir=/path/to/android/studio`

#### Issue: "Gradle build failed"
**Solution**: 
```bash
cd android
./gradlew clean
cd ..
flutter clean
flutter pub get
flutter run
```

#### Issue: "CocoaPods dependency error" (iOS)
**Solution**:
```bash
cd ios
pod deintegrate
pod install
cd ..
flutter run
```

#### Issue: Device not recognized
**Solution**: 
```bash
flutter devices  # List all connected devices
flutter run -d <device-id>  # Run on specific device
```

### Project Structure Quick Reference

```
donanim_hesaplama_flutter/
├── lib/
│   ├── main.dart (Entry point)
│   ├── models/ (Data models)
│   ├── data/ (Static product data)
│   ├── providers/ (State management)
│   ├── screens/ (UI screens)
│   ├── widgets/ (Reusable components)
│   └── utils/ (Helper functions)
├── assets/ (Images, fonts)
├── android/ (Android config)
├── ios/ (iOS config)
├── pubspec.yaml (Dependencies)
└── README.md (Documentation)
```

### Development Workflow

1. **Hot Reload** (Fast reload): `r` in terminal
2. **Hot Restart** (Full restart): `R` in terminal
3. **Stop app**: `q` in terminal
4. **View logs**: `flutter logs`
5. **Profile app**: `flutter run --profile`

### Adding New Features

#### 1. Add New Calculation System
```dart
// 1. Create data file in lib/data/
final List<Urun> newSystemProducts = [...]

// 2. Create screen in lib/screens/
class NewSystemScreen extends StatefulWidget { ... }

// 3. Add provider methods
void calculateNewSystem() { ... }

// 4. Add to sistem_secim_screen.dart navigation
```

#### 2. Add Product Images
```
1. Convert image to JPG format
2. Name it with product code (e.g., 710A01NT.jpg)
3. Place in assets/images/ folder
4. Ensure pubspec.yaml includes assets directory
5. Run flutter pub get
```

#### 3. Modify App Theme
```dart
// Edit lib/main.dart
theme: ThemeData(
  useMaterial3: true,
  colorScheme: ColorScheme.fromSeed(
    seedColor: Colors.yourColor, // Change this
  ),
)
```

### Testing

```bash
# Run all tests
flutter test

# Run specific test file
flutter test test/widgets/sistem_card_test.dart

# Run with coverage
flutter test --coverage
```

### Deployment Checklist

- [ ] Update version in `pubspec.yaml`
- [ ] Update changelog in `README.md`
- [ ] Test on multiple devices
- [ ] Check for errors: `flutter analyze`
- [ ] Run tests: `flutter test`
- [ ] Build release APK: `flutter build apk --release`
- [ ] Build iOS app: `flutter build ios --release`
- [ ] Sign Android APK
- [ ] Create GitHub release with build files

### Performance Tips

1. Use `const` constructors
2. Avoid rebuilds with `Consumer` widget
3. Use `ListView.builder` for long lists
4. Cache images with `CachedNetworkImage`
5. Profile with `flutter run --profile`

### Useful Links

- Flutter Docs: https://flutter.dev/docs
- Dart Language: https://dart.dev
- Material Design 3: https://m3.material.io
- Provider Documentation: https://pub.dev/packages/provider

### Support

For issues or questions:
1. Check existing GitHub issues
2. Create new issue with details
3. Include device info and error logs
4. Provide steps to reproduce

---

**Last Updated**: September 2024
**Flutter Version**: 3.x
**Dart Version**: 3.x
