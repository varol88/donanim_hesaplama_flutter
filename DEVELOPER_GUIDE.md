# Donanım Hesaplama Sistemi - Developer Guide

## Adding a New Calculation System

### Example: Adding "Kilitli Kapı" (Locked Door) System

#### 1. Create Data File

**File**: `lib/data/kilitli_kapi_data.dart`

```dart
import '../models/urun.dart';

final List<Urun> kilitliKapiUrunler = [
  Urun(
    ad: 'Çelik Kapı Kilidi Model 1',
    kod: 'KK-001',
    adet: 1,
    resim: 'KK-001.jpg',
  ),
  // Add more products...
];
```

#### 2. Create Screen

**File**: `lib/screens/kilitli_kapi_screen.dart`

```dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/hesap_provider.dart';
import 'sonuc_screen.dart';

class KilitliKapiScreen extends StatefulWidget {
  const KilitliKapiScreen({Key? key}) : super(key: key);

  @override
  State<KilitliKapiScreen> createState() => _KilitliKapiScreenState();
}

class _KilitliKapiScreenState extends State<KilitliKapiScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Kilitli Kapı Donanım Hesaplama'),
      ),
      body: // Your UI here
    );
  }
}
```

#### 3. Add Provider Methods

**File**: `lib/providers/hesap_provider.dart`

```dart
// Add to HesapProvider class
Future<void> hesaplaKilitliKapi() async {
  // Implementation
}
```

#### 4. Update Navigation

**File**: `lib/screens/sistem_secim_screen.dart`

```dart
const {
  'icon': '🔒',
  'title': 'KİLİTLİ KAPI',
  'description': 'Kilitli kapı sistemleri donanım hesaplama',
  'active': false,
  'onTap': () {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const KilitliKapiScreen(),
      ),
    );
  },
}
```

## Code Examples

### Adding a New Product to Existing List

```dart
// In lib/data/urun_data.dart
Urun(
  ad: 'Yeni Ürün Adı',
  kod: 'YEN-KOD',
  adet: 1,
  resim: 'YEN-KOD.jpg',
)
```

### Creating a Custom Dropdown

```dart
DropdownButton<String>(
  value: selectedValue,
  isExpanded: true,
  items: [
    DropdownMenuItem(
      value: 'option1',
      child: Text('Seçenek 1'),
    ),
  ],
  onChanged: (value) {
    setState(() => selectedValue = value);
  },
)
```

### Adding Input Validation

```dart
if (genislik < 375 || genislik > 1485) {
  throw 'Genişlik 375-1485 mm aralığında olmalıdır';
}
```

## File Upload & Asset Management

### Adding Product Images

1. Save image as JPG with product code name
2. Place in `assets/images/`
3. Update `pubspec.yaml`:

```yaml
assets:
  - assets/images/
```

4. Reference in code:

```dart
Image.asset('assets/images/710A01NT.jpg')
```

## State Management Pattern

### Using Provider

```dart
// Reading state
final provider = context.read<HesapProvider>();
final genislik = provider.genislik;

// Watching state
Consumer<HesapProvider>(
  builder: (context, provider, child) {
    return Text('Genişlik: ${provider.genislik}');
  },
)

// Modifying state
provider.setGenislik(1000);
```

## Testing Guidelines

### Unit Test Example

```dart
test('Hesaplama sonucu doğru', () {
  final result = HesaplamaSevisi.hesaplaCiftAcilimTekKanat(
    800,
    1500,
    'STANDART',
    '9',
    'YANDAN',
  );
  
  expect(result.isNotEmpty, true);
  expect(result[0].ad, 'VGR-3');
});
```

## Error Handling

```dart
try {
  await provider.hesapla();
} catch (e) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(content: Text(e.toString())),
  );
}
```

## Performance Optimization

1. **Use const constructors**
   ```dart
   const SizedBox(height: 16);
   ```

2. **Avoid unnecessary rebuilds**
   ```dart
   Consumer<HesapProvider>(
     child: Text('Static text'),
     builder: (context, provider, child) {
       return Column(
         children: [
           child!,
           Text('Dynamic: ${provider.genislik}'),
         ],
       );
     },
   )
   ```

3. **Use ListView.builder for lists**
   ```dart
   ListView.builder(
     itemCount: urunler.length,
     itemBuilder: (context, index) => // Widget
   )
   ```

## Debugging Tips

1. **Print statements**
   ```dart
   debugPrint('Debug: $variable');
   ```

2. **Inspect widgets**
   ```bash
   flutter run -d <device-id> --verbose
   ```

3. **Use Flutter DevTools**
   ```bash
   flutter pub global activate devtools
   devtools
   ```

## Common Patterns

### Form Validation
```dart
if (_uzunluk == 0) {
  throw 'Lütfen Kanat Uzunluğunu giriniz';
}
```

### List Filtering
```dart
List<Ispanyolet> liste = guvenlik == 'YÜKSEK GÜVENLİK'
    ? ispanyoletler.where((x) => x.ad.endsWith('S')).toList()
    : ispanyoletler.where((x) => !x.ad.endsWith('S')).toList();
```

### Null Coalescing
```dart
String value = selectedValue ?? 'Varsayılan';
```

## Code Style

- Line length: 80 characters
- Use `const` where possible
- Meaningful variable names
- Document public methods
- Follow Dart conventions

## Resources

- [Flutter Docs](https://flutter.dev/docs)
- [Dart Style Guide](https://dart.dev/guides/language/effective-dart/style)
- [Provider Documentation](https://pub.dev/packages/provider)
- [Material Design 3](https://m3.material.io)

---

For more help, check the code comments or open an issue on GitHub.
