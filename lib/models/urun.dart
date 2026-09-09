class Urun {
  final String ad;
  final String kod;
  final int adet;
  final String? resim;

  Urun({
    required this.ad,
    required this.kod,
    required this.adet,
    this.resim,
  });

  Map<String, dynamic> toMap() {
    return {
      'ad': ad,
      'kod': kod,
      'adet': adet,
      'resim': resim,
    };
  }

  factory Urun.fromMap(Map<String, dynamic> map) {
    return Urun(
      ad: map['ad'] ?? '',
      kod: map['kod'] ?? '',
      adet: map['adet'] ?? 0,
      resim: map['resim'],
    );
  }
}
