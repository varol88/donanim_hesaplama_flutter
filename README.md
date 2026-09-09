# Donanım Hesaplama Sistemi - Flutter

HTML, CSS ve JavaScript ile geliştirilmiş Donanım Hesaplama Sistemi'nin Flutter uygulamasıdır. Android ve iOS platformlarında çalışır.

## Özellikler

- ✅ Çift Açılım Sistemleri Hesaplama
- ✅ Çift Kanat Desteği
- ✅ Tek Açılım Modu
- ✅ Material Design 3
- ✅ Dark Mode Desteği
- ✅ Responsive Tasarım
- ✅ Provider State Management
- ✅ Ürün Listesi ve Detayları
- ⏳ PDF Dışa Aktarma
- ⏳ Excel Dışa Aktarma
- ⏳ Paylaş Özelliği

## Kurulum

### Gereksinimler
- Flutter 3.x
- Dart 3.x
- Android Studio (Android geliştirme için)
- Xcode (iOS geliştirme için)

### Başlangıç

1. Projeyi klonlayın:
```bash
git clone https://github.com/varol88/donanim_hesaplama_flutter.git
cd donanim_hesaplama_flutter
```

2. Bağımlılıkları yükleyin:
```bash
flutter pub get
```

3. Uygulamayı çalıştırın:
```bash
flutter run
```

## Proje Yapısı

```
lib/
├── main.dart
├── models/
│   ├── urun.dart
│   ├── ispanyolet.dart
│   ├── makas.dart
│   └── hesap_sonucu.dart
├── data/
│   ├── ispanyolet_data.dart
│   ├── makas_data.dart
│   ├── levye_data.dart
│   └── urun_data.dart
├── providers/
│   └── hesap_provider.dart
├── screens/
│   ├── home_screen.dart
│   ├── sistem_secim_screen.dart
│   ├── cift_acilim_tek_kanat_screen.dart
│   ├── sonuc_screen.dart
│   └── urun_detay_screen.dart
├── widgets/
│   ├── sistem_card.dart
│   ├── urun_table.dart
│   ├── sonuc_card.dart
│   └── custom_input.dart
└── utils/
    └── hesaplama_servisi.dart
```

## Kullanım

### 1. Sistem Seçimi
Uygulama başlandığında sistem seçim sayfası gösterilir. Kullanıcı hesaplamak istediği sistemi seçer.

### 2. Hesaplama
- **Çift Açılım Tek Kanat**: Tek kapıya ait donanım hesaplaması
- **Çift Açılım Çift Kanat**: İki kapılı sistem için donanım hesaplaması
- **Tek Açılım**: Tek açılı kapılar için hesaplama

### 3. Sonuçlar
Hesaplama sonrası ürün tablosu gösterilir. Ürüne tıklanarak detaylar görülebilir.

## API Endpoints (Bilgi amaçlı)

Uygulama hiçbir API çağrısı yapmaz. Tüm veriler lokal olarak saklanır.

## Bağımlılıklar

- **provider**: State management
- **intl**: Tarih ve sayı formatlama
- **pdf**: PDF oluşturma (hazır)
- **path_provider**: Dosya yönetimi
- **excel**: Excel dışa aktarma (hazır)
- **share_plus**: Paylaş özelliği (hazır)
- **google_fonts**: Font desteği

## Geliştirme

### Yeni Sistem Ekleme

1. `lib/data/` klasörüne yeni veri dosyası ekleyin
2. `lib/screens/` klasörüne yeni ekran ekleyin
3. Provider'a gerekli state ekleyin
4. Ana ekranda navigasyon ekleyin

### Yeni Ürün Ekleme

`lib/data/urun_data.dart` dosyasında ilgili listeye ürün ekleyin:

```dart
Urun(
  ad: 'Ürün Adı',
  kod: 'URUN-KOD',
  adet: 1,
  resim: 'urun-kod.jpg',
)
```

## Ürün Resimleri

Ürün resimleri `assets/images/` klasörüne `.jpg` formatında yerleştirilir.
Dosya adı ürün kodunun aynısı olmalıdır (örn: `710A01NT.jpg`).

## Build

### Android Release Build
```bash
flutter build apk --release
```

### iOS Release Build
```bash
flutter build ios --release
```

## Lisans

Bu proje MIT Lisansı altında dağıtılır.

## İletişim

Sorunlar veya öneriler için GitHub Issues kullanınız.

## Sürüm Geçmişi

### 1.0.0 (2024)
- İlk sürüm yayınlandı
- Temel donanım hesaplama işlevleri
- Material Design 3 arayüzü
