import 'urun.dart';

class HesapSonucu {
  final int genislik;
  final int? solGenislik;
  final int uzunluk;
  final String guvenlik;
  final String aks;
  final String acilim;
  final List<Urun> urunler;
  final String? ciftKanatTip;
  final String? kilitTip;
  final String? ortaKayit;

  HesapSonucu({
    required this.genislik,
    this.solGenislik,
    required this.uzunluk,
    required this.guvenlik,
    required this.aks,
    required this.acilim,
    required this.urunler,
    this.ciftKanatTip,
    this.kilitTip,
    this.ortaKayit,
  });
}
