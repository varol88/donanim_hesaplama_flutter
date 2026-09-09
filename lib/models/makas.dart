class Makas {
  final String model;
  final String standart;
  final String? security;
  final int min;
  final int max;
  final String resim;

  Makas({
    required this.model,
    required this.standart,
    this.security,
    required this.min,
    required this.max,
    required this.resim,
  });

  Map<String, dynamic> toMap() {
    return {
      'model': model,
      'standart': standart,
      'security': security,
      'min': min,
      'max': max,
      'resim': resim,
    };
  }

  factory Makas.fromMap(Map<String, dynamic> map) {
    return Makas(
      model: map['model'] ?? '',
      standart: map['standart'] ?? '',
      security: map['security'],
      min: map['min'] ?? 0,
      max: map['max'] ?? 0,
      resim: map['resim'] ?? '',
    );
  }
}
