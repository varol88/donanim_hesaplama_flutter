# Project Structure

## Directory Breakdown

### lib/
Main application code

#### lib/main.dart
Application entry point. Sets up Material app with Provider.

#### lib/models/
Data model classes:
- `urun.dart` - Product model
- `ispanyolet.dart` - Gate model
- `makas.dart` - Scissors model
- `hesap_sonucu.dart` - Calculation result model

#### lib/data/
Static data and product information:
- `ispanyolet_data.dart` - Gate product list
- `makas_data.dart` - Scissors product list
- `levye_data.dart` - Lever-handled gates list
- `urun_data.dart` - Other products (springs, locks, etc.)

#### lib/providers/
State management:
- `hesap_provider.dart` - Main calculator state provider

#### lib/screens/
Full-screen widgets:
- `home_screen.dart` - Home screen wrapper
- `sistem_secim_screen.dart` - System selection
- `cift_acilim_tek_kanat_screen.dart` - Dual swing calculation
- `sonuc_screen.dart` - Results display
- `urun_detay_screen.dart` - Product details

#### lib/widgets/
Reusable UI components:
- `sistem_card.dart` - System selection card
- `custom_input.dart` - Customized text input
- `urun_table.dart` - Product data table
- `sonuc_card.dart` - Results summary card

#### lib/utils/
Utility functions and services:
- `hesaplama_servisi.dart` - Calculation algorithms

### android/
Android-specific configuration

### ios/
iOS-specific configuration

### assets/
Application resources (images, fonts, etc.)

## File Naming Conventions

- Dart files: `snake_case.dart`
- Classes: `PascalCase`
- Methods: `camelCase`
- Constants: `CONSTANT_CASE`

## Key Files to Modify

1. **Adding a new system type**: 
   - Create new screen in `lib/screens/`
   - Add data file in `lib/data/`
   - Add provider methods

2. **Adding products**:
   - Edit `lib/data/urun_data.dart`
   - Add product image to `assets/images/`

3. **Changing colors/theme**:
   - Modify `lib/main.dart` ThemeData

4. **Adding new calculation logic**:
   - Add method to `lib/utils/hesaplama_servisi.dart`
