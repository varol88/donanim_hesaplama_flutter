import '../models/urun.dart';
import '../models/ispanyolet.dart';
import '../models/makas.dart';
import '../models/hesap_sonucu.dart';
import '../data/ispanyolet_data.dart';
import '../data/makas_data.dart';
import '../data/levye_data.dart';
import '../data/urun_data.dart';

class VilHesaplama {
  final int vilCount;
  final int vil0Count;

  VilHesaplama({required this.vilCount, required this.vil0Count});
}

class HesaplamaSevisi {
  /// Genişlik için VIL hesaplama
  static VilHesaplama genislikIcinVilHesapla(
    int genislik, {
    int maxGenislikSiniri = 1485,
  }) {
    int vilCount = 0;
    int vil0Count = 0;

    if (genislik > maxGenislikSiniri) {
      int fark = genislik - maxGenislikSiniri;
      while (fark > 660) {
        vilCount++;
        fark -= 660;
      }
      if (fark > 160) {
        vilCount++;
      } else if (fark > 0) {
        vil0Count = 1;
      }
    }

    return VilHesaplama(vilCount: vilCount, vil0Count: vil0Count);
  }

  /// Uzunluk için VIL hesaplama
  static VilHesaplama uzunlukIcinVilHesapla(
    int uzunluk,
    Ispanyolet? ispanyolet,
    List<Ispanyolet> liste,
  ) {
    int vilCount = 0;
    int vil0Count = 0;
    int fark = 0;

    if (ispanyolet == null) {
      Ispanyolet enBuyuk = liste.reduce(
        (a, b) => a.max > b.max ? a : b,
      );
      fark = uzunluk - enBuyuk.max;
    } else if (ispanyolet.max < uzunluk) {
      fark = uzunluk - ispanyolet.max;
    }

    if (fark > 0) {
      int tempFark = fark;
      while (tempFark > 660) {
        vilCount++;
        tempFark -= 660;
      }
      if (tempFark > 160) {
        vilCount++;
      } else if (tempFark > 0) {
        vil0Count = 1;
      }
    }

    return VilHesaplama(vilCount: vilCount, vil0Count: vil0Count);
  }

  /// Çift Açılım Tek Kanat - Tam Hesaplama
  static List<Urun> hesaplaCiftAcilimTekKanat(
    int genislik,
    int uzunluk,
    String guvenlik,
    String aks,
    String acilim,
  ) {
    List<Urun> urunler = [];

    // İspanyolet seçimi
    List<Ispanyolet> liste = guvenlik == 'YÜKSEK GÜVENLİK'
        ? ispanyoletler.where((x) => x.ad.endsWith('S')).toList()
        : ispanyoletler.where((x) => !x.ad.endsWith('S')).toList();

    Ispanyolet? ispanyolet =
        liste.firstWhere((x) => uzunluk >= x.min && uzunluk <= x.max,
            orElse: () => liste.reduce((a, b) => a.max > b.max ? a : b));

    urunler.add(Urun(
      ad: ispanyolet.ad,
      kod: ispanyolet.kod,
      adet: 1,
      resim: ispanyolet.resim,
    ));

    // VIL hesaplaması
    VilHesaplama uzunlukVil = uzunlukIcinVilHesapla(uzunluk, ispanyolet, liste);
    VilHesaplama genislikVil = genislikIcinVilHesapla(genislik, maxGenislikSiniri: 1485);

    if (uzunlukVil.vilCount > 0) {
      urunler.add(Urun(
        ad: 'VIL',
        kod: '718A03NT',
        adet: uzunlukVil.vilCount,
        resim: '718A03NT.jpg',
      ));
    }
    if (uzunlukVil.vil0Count > 0) {
      urunler.add(Urun(
        ad: 'VIL-0',
        kod: '718A77NT',
        adet: uzunlukVil.vil0Count,
        resim: '718A77NT.jpg',
      ));
    }
    if (genislikVil.vilCount > 0) {
      urunler.add(Urun(
        ad: 'VIL',
        kod: '718A03NT',
        adet: genislikVil.vilCount,
        resim: '718A03NT.jpg',
      ));
    }
    if (genislikVil.vil0Count > 0) {
      urunler.add(Urun(
        ad: 'VIL-0',
        kod: '718A77NT',
        adet: genislikVil.vil0Count,
        resim: '718A77NT.jpg',
      ));
    }

    // Makas seçimi
    Makas? makas = makaslar.firstWhere(
        (x) => genislik >= x.min && genislik <= x.max,
        orElse: () => makaslar.reduce((a, b) => a.max > b.max ? a : b));

    String makasKod = guvenlik == 'YÜKSEK GÜVENLİK' && (makas.security?.isNotEmpty ?? false)
        ? makas.security!
        : makas.standart;

    urunler.add(Urun(
      ad: makas.model,
      kod: makasKod,
      adet: 1,
      resim: makas.resim,
    ));

    // Açılım tipi ürünleri
    if (acilim == 'YANDAN') {
      urunler.add(Urun(
        ad: 'VAK',
        kod: '728A07NT',
        adet: 1,
        resim: '728A07NT.jpg',
      ));

      if (aks == '9') {
        urunler.add(Urun(
          ad: 'VY-9',
          kod: '726A22NT',
          adet: 1,
          resim: '726A22NT.jpg',
        ));
      }
      if (aks == '13') {
        urunler.add(Urun(
          ad: 'VY-13',
          kod: '726A24NT',
          adet: 1,
          resim: '726A24NT.jpg',
        ));
      }
    }

    if (acilim == 'ALTTAN') {
      urunler.add(Urun(
        ad: 'VCD-2',
        kod: '713A02NT',
        adet: 1,
        resim: '713A02NT.jpg',
      ));

      if (aks == '9') {
        urunler.add(Urun(
          ad: 'VM2035-9 240',
          kod: '726A17NT',
          adet: 1,
          resim: '726A17NT.jpg',
        ));
        urunler.add(Urun(
          ad: 'VM2045-9',
          kod: '726A27NT',
          adet: 1,
          resim: '726A27NT.jpg',
        ));
        urunler.add(Urun(
          ad: 'VM009',
          kod: '726A22NT',
          adet: 1,
          resim: '726A22NT.jpg',
        ));
      }
      if (aks == '13') {
        urunler.add(Urun(
          ad: 'VM203513',
          kod: '726A18NT',
          adet: 1,
          resim: '726A18NT.jpg',
        ));
        urunler.add(Urun(
          ad: 'VM2045',
          kod: '726A28NT',
          adet: 1,
          resim: '726A28NT.jpg',
        ));
      }
    }

    return urunler;
  }

  /// Çift Açılım Tek Kanat - Sadece VGR
  static List<Urun> hesaplaCiftAcilimTekKanatSadeceVgr(
    int genislik,
    int uzunluk,
    String guvenlik,
  ) {
    List<Urun> urunler = [];

    List<Ispanyolet> liste = guvenlik == 'YÜKSEK GÜVENLİK'
        ? ispanyoletler.where((x) => x.ad.endsWith('S')).toList()
        : ispanyoletler.where((x) => !x.ad.endsWith('S')).toList();

    Ispanyolet? ispanyolet =
        liste.firstWhere((x) => uzunluk >= x.min && uzunluk <= x.max,
            orElse: () => liste.reduce((a, b) => a.max > b.max ? a : b));

    urunler.add(Urun(
      ad: ispanyolet.ad,
      kod: ispanyolet.kod,
      adet: 1,
      resim: ispanyolet.resim,
    ));

    return urunler;
  }

  /// Çift Açılım Çift Kanat Hesaplama
  static List<Urun> hesaplaCiftAcilimCiftKanat(
    int sagGenislik,
    int solGenislik,
    int uzunluk,
    String guvenlik,
    String aks,
    String acilim,
    String ciftKanatTip,
    String kilitTip,
    String ortaKayit,
  ) {
    List<Urun> urunler = [];

    // SAĞ KANAT
    if (ciftKanatTip == 'TİP2') {
      urunler.addAll(
        hesaplaCiftAcilimTekKanatSadeceVgr(sagGenislik, uzunluk, guvenlik),
      );
    } else {
      urunler.addAll(
        hesaplaCiftAcilimTekKanat(sagGenislik, uzunluk, guvenlik, aks, acilim),
      );
    }

    // SOL KANAT
    if (kilitTip == 'FISEK_SURGU') {
      urunler.addAll(fisekSurguUrunler);
    } else if (kilitTip == 'ISPANYOLET_SURGUSU') {
      Ispanyolet? levyeIsp =
          levyeKolluIspanyoletler.firstWhere(
              (x) => uzunluk >= x.min && uzunluk <= x.max,
              orElse: () =>
                  levyeKolluIspanyoletler.reduce((a, b) => a.max > b.max ? a : b));

      urunler.add(Urun(
        ad: levyeIsp.ad,
        kod: levyeIsp.kod,
        adet: 1,
        resim: levyeIsp.resim,
      ));

      urunler.addAll(ispanyoletSurguUrunler);
    } else {
      // KÖŞE DÖNÜŞÜ
      Ispanyolet? levyeIsp =
          levyeKolluIspanyoletler.firstWhere(
              (x) => uzunluk >= x.min && uzunluk <= x.max,
              orElse: () =>
                  levyeKolluIspanyoletler.reduce((a, b) => a.max > b.max ? a : b));

      urunler.add(Urun(
        ad: levyeIsp.ad,
        kod: levyeIsp.kod,
        adet: 1,
        resim: levyeIsp.resim,
      ));

      urunler.addAll(koseDonusuUrunler);
    }

    // ORTA KAYIT
    if (ortaKayit == 'VAR') {
      urunler.addAll(ortaKayitUrunler);
    }

    return urunler;
  }

  /// Tek Açılım Hesaplama
  static List<Urun> hesaplaTekAcilim(
    int genislik,
    int uzunluk,
    String guvenlik,
    String aks,
  ) {
    List<Urun> urunler = [];

    urunler.add(Urun(
      ad: 'TEK AÇILIM ÜRÜN',
      kod: 'TEK-KOD',
      adet: 1,
      resim: null,
    ));

    if (aks == '9') {
      urunler.add(Urun(
        ad: 'TEK AÇILIM AKS-9',
        kod: 'TEK-9-KOD',
        adet: 1,
        resim: null,
      ));
    }
    if (aks == '13') {
      urunler.add(Urun(
        ad: 'TEK AÇILIM AKS-13',
        kod: 'TEK-13-KOD',
        adet: 1,
        resim: null,
      ));
    }

    return urunler;
  }
}
