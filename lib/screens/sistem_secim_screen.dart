import 'package:flutter/material.dart';
import 'cift_acilim_tek_kanat_screen.dart';

class SistemSecimScreen extends StatelessWidget {
  const SistemSecimScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> sistemler = [
      {
        'icon': '🔄',
        'title': 'ÇİFT AÇILIM SİSTEMLERİ',
        'description': 'Çift açılım kapı sistemleri donanım hesaplama',
        'active': true,
        'onTap': () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const CiftAcilimTekKanatScreen(),
            ),
          );
        },
      },
      {
        'icon': '🔒',
        'title': 'KİLİTLİ KAPI',
        'description': 'Kilitli kapı sistemleri donanım hesaplama',
        'active': false,
        'onTap': () => _showComingSoon(context),
      },
      {
        'icon': '🚪',
        'title': 'SÜRME SİSTEMLERİ',
        'description': 'Sürme kapı sistemleri donanım hesaplama',
        'active': false,
        'onTap': () => _showComingSoon(context),
      },
      {
        'icon': '🔩',
        'title': 'MENTEŞE',
        'description': 'Menteşe sistemleri donanım hesaplama',
        'active': false,
        'onTap': () => _showComingSoon(context),
      },
      {
        'icon': '🗝️',
        'title': 'GÖMME KİLİT',
        'description': 'Gömme kilit sistemleri donanım hesaplama',
        'active': false,
        'onTap': () => _showComingSoon(context),
      },
      {
        'icon': '🚪',
        'title': 'BAREL / KAPI VE PENCERE KOLU',
        'description': 'Barel ve kol sistemleri donanım hesaplama',
        'active': false,
        'onTap': () => _showComingSoon(context),
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Sistem Seçim Sayfası'),
        centerTitle: true,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            const SizedBox(height: 20),
            Text(
              '🚪 SİSTEM SEÇİM SAYFASI',
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 8),
            Text(
              'Donanım Hesaplama Sistemleri',
              style: Theme.of(context).textTheme.labelLarge?.copyWith(
                    color: Colors.grey[600],
                    letterSpacing: 1.2,
                  ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 32),
            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 300,
                mainAxisSpacing: 16,
                crossAxisSpacing: 16,
                childAspectRatio: 1,
              ),
              itemCount: sistemler.length,
              itemBuilder: (context, index) {
                final sistem = sistemler[index];
                return _buildSistemCard(
                  context,
                  sistem['icon'],
                  sistem['title'],
                  sistem['description'],
                  sistem['active'],
                  sistem['onTap'],
                );
              },
            ),
            const SizedBox(height: 32),
            Divider(
              color: Colors.grey[300],
            ),
            const SizedBox(height: 16),
            Text(
              'Donanım Hesaplama Sistemi v2.0 • Tüm hakları saklıdır.',
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: Colors.grey[600],
                  ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }

  Widget _buildSistemCard(
    BuildContext context,
    String icon,
    String title,
    String description,
    bool isActive,
    VoidCallback onTap,
  ) {
    return Material(
      child: InkWell(
        onTap: onTap,
        child: Card(
          elevation: isActive ? 8 : 2,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
            side: BorderSide(
              color: isActive ? Colors.blue[700]! : Colors.transparent,
              width: isActive ? 2 : 0,
            ),
          ),
          child: Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              gradient: isActive
                  ? LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [Colors.blue[100]!, Colors.blue[200]!],
                    )
                  : null,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      icon,
                      style: const TextStyle(fontSize: 32),
                    ),
                    const SizedBox(height: 12),
                    Text(
                      title,
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      description,
                      style: Theme.of(context).textTheme.bodySmall,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
                if (isActive)
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 4,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: const Text(
                      'AKTİF',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _showComingSoon(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Bu modül yakında eklenecek'),
        duration: Duration(seconds: 2),
      ),
    );
  }
}
