import 'package:flutter/material.dart';
import '../models/hesap_sonucu.dart';
import '../models/urun.dart';
import '../widgets/sonuc_card.dart';
import '../widgets/urun_table.dart';
import 'urun_detay_screen.dart';

class SonucScreen extends StatelessWidget {
  final HesapSonucu sonuc;

  const SonucScreen({Key? key, required this.sonuc}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Hesaplama Sonuçları'),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.share),
            onPressed: () => _shareResults(context),
          ),
          IconButton(
            icon: const Icon(Icons.download),
            onPressed: () => _exportPDF(context),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SonucCard(sonuc: sonuc),
            const SizedBox(height: 24),
            Text(
              'Ürün Listesi',
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
            const SizedBox(height: 12),
            Card(
              elevation: 2,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8),
                child: UrunTable(
                  urunler: sonuc.urunler,
                  onRowTap: (urun) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => UrunDetayScreen(
                          urun: urun,
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
            const SizedBox(height: 24),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton.icon(
                    onPressed: () => _exportExcel(context),
                    icon: const Icon(Icons.table_chart),
                    label: const Text('Excel'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: ElevatedButton.icon(
                    onPressed: () => Navigator.pop(context),
                    icon: const Icon(Icons.arrow_back),
                    label: const Text('Geri'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.grey[600],
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }

  void _shareResults(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Paylaş özelliği yakında eklenecek'),
        duration: Duration(seconds: 2),
      ),
    );
  }

  void _exportPDF(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('PDF dışa aktarma yakında eklenecek'),
        duration: Duration(seconds: 2),
      ),
    );
  }

  void _exportExcel(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Excel dışa aktarma yakında eklenecek'),
        duration: Duration(seconds: 2),
      ),
    );
  }
}
