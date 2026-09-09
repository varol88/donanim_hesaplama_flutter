import 'package:flutter/material.dart';
import '../models/urun.dart';
import '../models/hesap_sonucu.dart';
import '../utils/hesaplama_servisi.dart';

class HesapProvider extends ChangeNotifier {
  // Form değerleri
  int _genislik = 0;
  int _solGenislik = 0;
  int _uzunluk = 0;
  String _guvenlik = 'STANDART';
  String _aks = '9';
  String _acilim = 'YANDAN';
  String _ciftKanatTip = 'TİP1';
  String _kilitTip = 'KOSE_DONUSU';
  String _ortaKayit = 'VAR';
  String _secilenMod = 'tek_kanat'; // tek_kanat, cift_kanat, tek_acilim

  // Sonuç
  HesapSonucu? _sonuc;
  bool _isLoading = false;
  String? _hata;

  // Getters
  int get genislik => _genislik;
  int get solGenislik => _solGenislik;
  int get uzunluk => _uzunluk;
  String get guvenlik => _guvenlik;
  String get aks => _aks;
  String get acilim => _acilim;
  String get ciftKanatTip => _ciftKanatTip;
  String get kilitTip => _kilitTip;
  String get ortaKayit => _ortaKayit;
  String get secilenMod => _secilenMod;
  HesapSonucu? get sonuc => _sonuc;
  bool get isLoading => _isLoading;
  String? get hata => _hata;

  // Setters
  void setGenislik(int value) {
    _genislik = value;
    notifyListeners();
  }

  void setSolGenislik(int value) {
    _solGenislik = value;
    notifyListeners();
  }

  void setUzunluk(int value) {
    _uzunluk = value;
    notifyListeners();
  }

  void setGuvenlik(String value) {
    _guvenlik = value;
    notifyListeners();
  }

  void setAks(String value) {
    _aks = value;
    notifyListeners();
  }

  void setAcilim(String value) {
    _acilim = value;
    notifyListeners();
  }

  void setCiftKanatTip(String value) {
    _ciftKanatTip = value;
    notifyListeners();
  }

  void setKilitTip(String value) {
    _kilitTip = value;
    notifyListeners();
  }

  void setOrtaKayit(String value) {
    _ortaKayit = value;
    notifyListeners();
  }

  void setSecilenMod(String value) {
    _secilenMod = value;
    notifyListeners();
  }

  // Hesaplama fonksiyonları
  Future<void> hesapla() async {
    _isLoading = true;
    _hata = null;
    notifyListeners();

    try {
      // Validasyon
      if (_uzunluk == 0) {
        throw 'Lütfen Kanat Uzunluğunu giriniz';
      }
      if (_genislik == 0) {
        throw 'Lütfen Kanat Genişliğini giriniz';
      }
      if (_secilenMod == 'cift_kanat' && _solGenislik == 0) {
        throw 'Lütfen Sol Kanat Genişliğini giriniz';
      }

      List<Urun> urunler = [];

      if (_secilenMod == 'cift_kanat') {
        urunler = HesaplamaSevisi.hesaplaCiftAcilimCiftKanat(
          _genislik,
          _solGenislik,
          _uzunluk,
          _guvenlik,
          _aks,
          _acilim,
          _ciftKanatTip,
          _kilitTip,
          _ortaKayit,
        );
      } else if (_secilenMod == 'tek_acilim') {
        urunler = HesaplamaSevisi.hesaplaTekAcilim(
          _genislik,
          _uzunluk,
          _guvenlik,
          _aks,
        );
      } else {
        urunler = HesaplamaSevisi.hesaplaCiftAcilimTekKanat(
          _genislik,
          _uzunluk,
          _guvenlik,
          _aks,
          _acilim,
        );
      }

      _sonuc = HesapSonucu(
        genislik: _genislik,
        solGenislik: _secilenMod == 'cift_kanat' ? _solGenislik : null,
        uzunluk: _uzunluk,
        guvenlik: _guvenlik,
        aks: _aks,
        acilim: _acilim,
        urunler: urunler,
        ciftKanatTip: _secilenMod == 'cift_kanat' ? _ciftKanatTip : null,
        kilitTip: _secilenMod == 'cift_kanat' ? _kilitTip : null,
        ortaKayit: _secilenMod == 'cift_kanat' ? _ortaKayit : null,
      );

      _isLoading = false;
      notifyListeners();
    } catch (e) {
      _hata = e.toString();
      _isLoading = false;
      notifyListeners();
    }
  }

  void resetForm() {
    _genislik = 0;
    _solGenislik = 0;
    _uzunluk = 0;
    _guvenlik = 'STANDART';
    _aks = '9';
    _acilim = 'YANDAN';
    _ciftKanatTip = 'TİP1';
    _kilitTip = 'KOSE_DONUSU';
    _ortaKayit = 'VAR';
    _sonuc = null;
    _hata = null;
    notifyListeners();
  }
}
