# Quick Start Guide

## 5 Dakikada Başlayın

### 1. Projeyi Klonlayın
```bash
git clone https://github.com/varol88/donanim_hesaplama_flutter.git
cd donanim_hesaplama_flutter
```

### 2. Bağımlılıkları Yükleyin
```bash
flutter pub get
```

### 3. Uygulamayı Çalıştırın
```bash
flutter run
```

### 4. İlk Hesaplama Yapın
- "Çift Açılım Sistemleri" kartına dokunun
- Kanat genişliği ve uzunluğunu girin
- "HESAPLA" butonuna basın
- Sonuçları görüntüleyin

## Temel Özellikler

✅ 3 Farklı Hesaplama Modu
✅ Material Design 3 Arayüzü
✅ Dark Mode Desteği
✅ Türkçe Dil Desteği
✅ Responsive Tasarım
✅ 50+ Ürün Veritabanı

## Dosya Yapısı

```
lib/
├── main.dart              # Ana uygulama dosyası
├── models/                # Veri modelleri
├── data/                  # Ürün verileri
├── providers/             # State yönetimi
├── screens/               # Ekranlar
├── widgets/               # Komponenler
└── utils/                 # Yardımcı fonksiyonlar
```

## Sistem Seçenekleri

### 1. Çift Açılım Tek Kanat
- Tek kapılı sistemler için donanım hesplaması
- Kanat genişliği: 375-1485 mm
- Kanat uzunluğu: 480-2350 mm

### 2. Çift Açılım Çift Kanat
- İki kapılı sistemler için hesaplama
- Farklı kilit tipleri seçenekleri
- Orta kayıt durumu seçimi

### 3. Tek Açılım
- Tek açılı kapılar için basit hesaplama
- AKS seçeneği (9 veya 13)

## Yaygın Görevler

### Yeni Ürün Eklemek
1. `assets/images/` klasörüne resim ekleyin (JPG formatında)
2. `lib/data/urun_data.dart` dosyasını düzenleyin
3. Ürün bilgilerini ekleyin

### Tema Rengi Değiştirmek
1. `lib/main.dart` dosyasını açın
2. `ThemeData` bölümünde `seedColor` değişkeni değiştirin
3. Uygulamayı çalıştırın

### Yeni Sistem Eklemek
1. `lib/data/` klasöründe yeni veri dosyası oluşturun
2. `lib/screens/` klasöründe yeni ekran oluşturun
3. `sistem_secim_screen.dart` dosyasında navigasyon ekleyin

## Sorun Giderme

### Problem: "Packages get failed"
**Çözüm:**
```bash
flutter clean
flutter pub get
```

### Problem: Device bulunamıyor
**Çözüm:**
```bash
flutter devices
flutter run -d <device-id>
```

### Problem: Build hatası
**Çözüm:**
```bash
flutter clean
flutter pub get
flutter run
```

## Daha Fazla Yardım

- 📖 [README.md](README.md) - Detaylı bilgiler
- 🔧 [INSTALLATION.md](INSTALLATION.md) - Kurulum rehberi
- 👨‍💻 [DEVELOPER_GUIDE.md](DEVELOPER_GUIDE.md) - Geliştirme kılavuzu
- 📋 [PROJECT_STRUCTURE.md](PROJECT_STRUCTURE.md) - Proje yapısı

## İletişim

Sorularınız veya önerileriniz için:
- GitHub Issues açın
- Pull Request gönderin
- Tartışmalara katılın

---

**Başlamaya hazır mısınız?** 🚀

```bash
flutter run
```
