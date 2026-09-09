# API Reference

## HesapProvider

State yönetimi için ana provider sınıfı.

### Properties

```dart
int genislik              // Kanat genişliği (mm)
int solGenislik           // Sol kanat genişliği (mm)
int uzunluk               // Kanat uzunluğu (mm)
String guvenlik           // Güvenlik seviyesi
String aks                // AKS tipi (9 veya 13)
String acilim             // Açılım şekli
String ciftKanatTip       // Çift kanat tipi
String kilitTip           // Kilit tipi
String ortaKayit          // Orta kayıt durumu
HesapSonucu? sonuc        // Hesaplama sonucu
bool isLoading            // Yükleme durumu
String? hata              // Hata mesajı
```

### Methods

#### hesapla()
```dart
Future<void> hesapla()
```
Tüm formlar için hesaplama yapar.

**Throws**: String (Validation error)

#### resetForm()
```dart
void resetForm()
```
Tüm form alanlarını sıfırlar.

#### setGenislik(int value)
```dart
void setGenislik(int value)
```
Kanat genişliğini ayarlar.

#### setUzunluk(int value)
```dart
void setUzunluk(int value)
```
Kanat uzunluğunu ayarlar.

## HesaplamaSevisi

Hesaplama algoritmalarını içeren stateless service.

### Static Methods

#### genislikIcinVilHesapla()
```dart
static VilHesaplama genislikIcinVilHesapla(
  int genislik, {
  int maxGenislikSiniri = 1485,
}
```
Genişlik için VIL hesplaması yapar.

**Returns**: `VilHesaplama(vilCount, vil0Count)`

#### uzunlukIcinVilHesapla()
```dart
static VilHesaplama uzunlukIcinVilHesapla(
  int uzunluk,
  Ispanyolet? ispanyolet,
  List<Ispanyolet> liste,
)
```
Uzunluk için VIL hesplaması yapar.

**Returns**: `VilHesaplama(vilCount, vil0Count)`

#### hesaplaCiftAcilimTekKanat()
```dart
static List<Urun> hesaplaCiftAcilimTekKanat(
  int genislik,
  int uzunluk,
  String guvenlik,
  String aks,
  String acilim,
)
```
Çift açılım tek kanat hesplaması.

**Returns**: Ürün listesi

## Models

### Urun
```dart
class Urun {
  final String ad;          // Ürün adı
  final String kod;         // Ürün kodu
  final int adet;           // Miktar
  final String? resim;      // Resim dosya adı
}
```

### Ispanyolet
```dart
class Ispanyolet {
  final String ad;          // Model adı
  final String kod;         // Ürün kodu
  final int min;            // Minimum uzunluk
  final int max;            // Maksimum uzunluk
  final String resim;       // Resim dosya adı
}
```

## Enum Values

### Güvenlik
- `'STANDART'`
- `'YÜKSEK GÜVENLİK'`

### AKS
- `'9'` - 9 AKS
- `'13'` - 13 AKS

### Açılım Şekli
- `'YANDAN'` - Yandan Devirme
- `'ALTTAN'` - Alttan Devirme

---

**Sürüm**: 1.0.0
**Son Güncelleme**: September 2024
