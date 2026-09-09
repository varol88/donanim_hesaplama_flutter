class Ispanyolet {
  final String ad;
  final String kod;
  final int min;
  final int max;
  final String resim;

  Ispanyolet({
    required this.ad,
    required this.kod,
    required this.min,
    required this.max,
    required this.resim,
  });

  Map<String, dynamic> toMap() {
    return {
      'ad': ad,
      'kod': kod,
      'min': min,
      'max': max,
      'resim': resim,
    };
  }

  factory Ispanyolet.fromMap(Map<String, dynamic> map) {
    return Ispanyolet(
      ad: map['ad'] ?? '',
      kod: map['kod'] ?? '',
      min: map['min'] ?? 0,
      max: map['max'] ?? 0,
      resim: map['resim'] ?? '',
    );
  }
}
