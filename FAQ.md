# Donanım Hesaplama Sistemi - Flutter
## Sık Sorulan Sorular (FAQ)

## Kurulum & Başlangıç

### S: Flutter'ı nasıl yüklerim?
**C:** https://flutter.dev/docs/get-started/install adresindeki resmi rehberi izleyin.

### S: Proje dizininde `flutter pub get` çalışmıyor
**C:** 
```bash
flutter clean
flutter pub get
```

### S: Android emülatörü açılmıyor
**C:** Android Studio açın ve emülatörü başlatın:
```bash
emulator -list-avds
emulator -avd Pixel_4_API_30
```

## Geliştirme

### S: Değişiklikler sırasında uygulama güncellenmiyorum
**C:** Terminal'de `r` tuşuna basarak sıcak yeniden yükleme yapın.

### S: Cihaz tanınmıyor
**C:**
```bash
flutter devices
flutter run -d <device-id>
```

## Özellikler & Kullanım

### S: Nasıl hesaplama yapabilirim?
**C:**
1. Başlangıç sayfasında sistem seçin
2. Ölçüleri girin (mm cinsinden)
3. "HESAPLA" butonuna basın
4. Sonuçları görüntüleyin

### S: Ürün resimleri neden gösterilmiyor?
**C:**
1. Resim dosyası `assets/images/` klasöründe olduğundan emin olun
2. Dosya adı ürün koduyla aynı olmalıdır (ör: 710A01NT.jpg)
3. `pubspec.yaml` dosyasında assets klasörü tanımlandığından emin olun

### S: Dark mode nasıl etkinleştirilir?
**C:** Cihazın sistem ayarlarında dark mode'u açın. Uygulama otomatik olarak uyum sağlayacaktır.

## Hesaplama

### S: VIL hesplaması ne demek?
**C:** VIL (Vertical Integration Lock), kanat boyutları maksimum sınırlarını aştığında kullanılan ek donanımlardır.

### S: Standart ve Yüksek Güvenlik arasındaki fark nedir?
**C:** Yüksek güvenlik modu daha güçlü makas ve bileşenler seçer.

### S: 9 AKS ve 13 AKS nedir?
**C:** AKS tipi, kapı sisteminin taşıyabildiği ağırlığı belirtir.

## Build & Deployment

### S: APK dosyasını nasıl oluştururum?
**C:**
```bash
flutter build apk --release
```
APK dosyası `build/app/outputs/apk/release/` klasöründe yer alacaktır.

### S: iOS app nasıl oluştururum?
**C:**
```bash
flutter build ios --release
```

## Geliştirici

### S: Proje açık kaynak mı?
**C:** Evet, MIT Lisansı altında açık kaynaktır.

### S: Katkıda bulunabilir miyim?
**C:** Evet! Pull request göndererek katkıda bulunabilirsiniz.

### S: Bug raporu nasıl açarım?
**C:** GitHub Issues bölümünde ayrıntılı bug raporu açın.

---

## Daha Fazla Yardım

- 📖 [README.md](README.md)
- 🔧 [INSTALLATION.md](INSTALLATION.md)  
- 👨‍💻 [DEVELOPER_GUIDE.md](DEVELOPER_GUIDE.md)
- 📚 [API_REFERENCE.md](API_REFERENCE.md)
- 🚀 [QUICKSTART.md](QUICKSTART.md)

---

**Sorgunuz burada mı yoksa?** GitHub Issues'de yeni soru açın! 👇
