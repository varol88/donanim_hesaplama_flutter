import 'package:flutter/material.dart';
import '../models/hesap_sonucu.dart';

class SonucCard extends StatelessWidget {
  final HesapSonucu sonuc;

  const SonucCard({Key? key, required this.sonuc}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      color: Colors.blue[50],
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Wrap(
              spacing: 16,
              runSpacing: 12,
              children: [
                _buildInfo('Kanat Uzunluğu', '${sonuc.uzunluk} mm'),
                _buildInfo('Güvenlik', sonuc.guvenlik),
                _buildInfo('AKS', sonuc.aks),
                _buildInfo('Kanat Genişliği', '${sonuc.genislik} mm'),
                if (sonuc.solGenislik != null)
                  _buildInfo('Sol Kanat Genişliği', '${sonuc.solGenislik} mm'),
                if (sonuc.ciftKanatTip != null)
                  _buildInfo('Çift Kanat Tipi', sonuc.ciftKanatTip!),
                if (sonuc.kilitTip != null) _buildInfo('Kilit Tipi', sonuc.kilitTip!),
                if (sonuc.ortaKayit != null) _buildInfo('Orta Kayıt', sonuc.ortaKayit!),
                _buildInfo('Açılım Tipi', sonuc.acilim),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInfo(String label, String value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontSize: 12,
            color: Colors.grey,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          value,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
