import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/hesap_provider.dart';
import '../widgets/custom_input.dart';
import 'sonuc_screen.dart';

class CiftAcilimTekKanatScreen extends StatefulWidget {
  const CiftAcilimTekKanatScreen({Key? key}) : super(key: key);

  @override
  State<CiftAcilimTekKanatScreen> createState() =>
      _CiftAcilimTekKanatScreenState();
}

class _CiftAcilimTekKanatScreenState extends State<CiftAcilimTekKanatScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  late TextEditingController _genislikController;
  late TextEditingController _solGenislikController;
  late TextEditingController _uzunlukController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
    _tabController.addListener(_handleTabChange);
    _genislikController = TextEditingController();
    _solGenislikController = TextEditingController();
    _uzunlukController = TextEditingController();
  }

  @override
  void dispose() {
    _tabController.dispose();
    _genislikController.dispose();
    _solGenislikController.dispose();
    _uzunlukController.dispose();
    super.dispose();
  }

  void _handleTabChange() {
    final provider = context.read<HesapProvider>();
    if (_tabController.index == 0) {
      provider.setSecilenMod('tek_kanat');
    } else if (_tabController.index == 1) {
      provider.setSecilenMod('cift_kanat');
    } else if (_tabController.index == 2) {
      provider.setSecilenMod('tek_acilim');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Donanım Hesaplama'),
        centerTitle: true,
        bottom: TabBar(
          controller: _tabController,
          tabs: const [
            Tab(text: '1 - Tek Kanat'),
            Tab(text: '2 - Çift Kanat'),
            Tab(text: '3 - Tek Açılım'),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          _buildTekKanatTab(),
          _buildCiftKanatTab(),
          _buildTekAcilimTab(),
        ],
      ),
    );
  }

  Widget _buildTekKanatTab() {
    return Consumer<HesapProvider>(
      builder: (context, provider, child) {
        return SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              CustomInput(
                label: 'Kanat Genişliği (mm)',
                placeholder: '375 - 1485 mm',
                inputType: TextInputType.number,
                onChanged: (value) {
                  if (value.isNotEmpty) {
                    provider.setGenislik(int.parse(value));
                  }
                },
              ),
              const SizedBox(height: 16),
              _buildDropdown(
                'Kanat Uzunluğu (mm)',
                '480 - 2350 mm',
                provider.uzunluk.toString(),
                onChanged: (value) {
                  if (value.isNotEmpty) {
                    provider.setUzunluk(int.parse(value));
                  }
                },
              ),
              const SizedBox(height: 16),
              _buildGuvenlikDropdown(provider),
              const SizedBox(height: 16),
              _buildAksDropdown(provider),
              const SizedBox(height: 16),
              _buildAcilimDropdown(provider),
              const SizedBox(height: 28),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () async {
                    await provider.hesapla();
                    if (provider.sonuc != null) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SonucScreen(
                            sonuc: provider.sonuc!,
                          ),
                        ),
                      );
                    } else if (provider.hata != null) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(provider.hata!),
                          backgroundColor: Colors.red,
                        ),
                      );
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    backgroundColor: Colors.blue[700],
                  ),
                  child: provider.isLoading
                      ? const SizedBox(
                          height: 20,
                          width: 20,
                          child: CircularProgressIndicator(
                            strokeWidth: 2,
                            valueColor:
                                AlwaysStoppedAnimation<Color>(Colors.white),
                          ),
                        )
                      : const Text(
                          'HESAPLA',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildCiftKanatTab() {
    return Consumer<HesapProvider>(
      builder: (context, provider, child) {
        return SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              CustomInput(
                label: 'Sağ Kanat Genişliği (mm)',
                placeholder: '375 - 1485 mm',
                inputType: TextInputType.number,
                onChanged: (value) {
                  if (value.isNotEmpty) {
                    provider.setGenislik(int.parse(value));
                  }
                },
              ),
              const SizedBox(height: 16),
              CustomInput(
                label: 'Sol Kanat Genişliği (mm)',
                placeholder: '375 - 1485 mm',
                inputType: TextInputType.number,
                onChanged: (value) {
                  if (value.isNotEmpty) {
                    provider.setSolGenislik(int.parse(value));
                  }
                },
              ),
              const SizedBox(height: 16),
              _buildDropdown(
                'Kanat Uzunluğu (mm)',
                '480 - 2350 mm',
                provider.uzunluk.toString(),
                onChanged: (value) {
                  if (value.isNotEmpty) {
                    provider.setUzunluk(int.parse(value));
                  }
                },
              ),
              const SizedBox(height: 16),
              _buildGuvenlikDropdown(provider),
              const SizedBox(height: 16),
              _buildAksDropdown(provider),
              const SizedBox(height: 16),
              _buildCiftKanatTipDropdown(provider),
              const SizedBox(height: 16),
              if (provider.ciftKanatTip == 'TİP1')
                Column(
                  children: [
                    _buildAcilimDropdown(provider),
                    const SizedBox(height: 16),
                  ],
                ),
              _buildKilitTipDropdown(provider),
              const SizedBox(height: 16),
              _buildOrtaKayitDropdown(provider),
              const SizedBox(height: 28),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () async {
                    await provider.hesapla();
                    if (provider.sonuc != null) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SonucScreen(
                            sonuc: provider.sonuc!,
                          ),
                        ),
                      );
                    } else if (provider.hata != null) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(provider.hata!),
                          backgroundColor: Colors.red,
                        ),
                      );
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    backgroundColor: Colors.blue[700],
                  ),
                  child: provider.isLoading
                      ? const SizedBox(
                          height: 20,
                          width: 20,
                          child: CircularProgressIndicator(
                            strokeWidth: 2,
                            valueColor:
                                AlwaysStoppedAnimation<Color>(Colors.white),
                          ),
                        )
                      : const Text(
                          'HESAPLA',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildTekAcilimTab() {
    return Consumer<HesapProvider>(
      builder: (context, provider, child) {
        return SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              CustomInput(
                label: 'Kanat Genişliği (mm)',
                placeholder: '375 - 1485 mm',
                inputType: TextInputType.number,
                onChanged: (value) {
                  if (value.isNotEmpty) {
                    provider.setGenislik(int.parse(value));
                  }
                },
              ),
              const SizedBox(height: 16),
              _buildDropdown(
                'Kanat Uzunluğu (mm)',
                '480 - 2350 mm',
                provider.uzunluk.toString(),
                onChanged: (value) {
                  if (value.isNotEmpty) {
                    provider.setUzunluk(int.parse(value));
                  }
                },
              ),
              const SizedBox(height: 16),
              _buildGuvenlikDropdown(provider),
              const SizedBox(height: 16),
              _buildAksDropdown(provider),
              const SizedBox(height: 28),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () async {
                    await provider.hesapla();
                    if (provider.sonuc != null) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SonucScreen(
                            sonuc: provider.sonuc!,
                          ),
                        ),
                      );
                    } else if (provider.hata != null) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(provider.hata!),
                          backgroundColor: Colors.red,
                        ),
                      );
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    backgroundColor: Colors.blue[700],
                  ),
                  child: provider.isLoading
                      ? const SizedBox(
                          height: 20,
                          width: 20,
                          child: CircularProgressIndicator(
                            strokeWidth: 2,
                            valueColor:
                                AlwaysStoppedAnimation<Color>(Colors.white),
                          ),
                        )
                      : const Text(
                          'HESAPLA',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildDropdown(
    String label,
    String hint,
    String value, {
    required Function(String) onChanged,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 14,
          ),
        ),
        const SizedBox(height: 8),
        TextField(
          keyboardType: TextInputType.number,
          onChanged: onChanged,
          decoration: InputDecoration(
            hintText: hint,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 12,
              vertical: 12,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildGuvenlikDropdown(HesapProvider provider) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Güvenlik',
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 14,
          ),
        ),
        const SizedBox(height: 8),
        DropdownButton<String>(
          value: provider.guvenlik,
          isExpanded: true,
          items: const [
            DropdownMenuItem(value: 'STANDART', child: Text('STANDART')),
            DropdownMenuItem(
              value: 'YÜKSEK GÜVENLİK',
              child: Text('YÜKSEK GÜVENLİK'),
            ),
          ],
          onChanged: (value) {
            if (value != null) {
              provider.setGuvenlik(value);
            }
          },
        ),
      ],
    );
  }

  Widget _buildAksDropdown(HesapProvider provider) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'AKS',
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 14,
          ),
        ),
        const SizedBox(height: 8),
        DropdownButton<String>(
          value: provider.aks,
          isExpanded: true,
          items: const [
            DropdownMenuItem(value: '9', child: Text('9 AKS')),
            DropdownMenuItem(value: '13', child: Text('13 AKS')),
          ],
          onChanged: (value) {
            if (value != null) {
              provider.setAks(value);
            }
          },
        ),
      ],
    );
  }

  Widget _buildAcilimDropdown(HesapProvider provider) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Çift Açılım Şekli',
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 14,
          ),
        ),
        const SizedBox(height: 8),
        DropdownButton<String>(
          value: provider.acilim,
          isExpanded: true,
          items: const [
            DropdownMenuItem(
              value: 'YANDAN',
              child: Text('YANDAN DEVİRME'),
            ),
            DropdownMenuItem(
              value: 'ALTTAN',
              child: Text('ALTTAN DEVİRME'),
            ),
          ],
          onChanged: (value) {
            if (value != null) {
              provider.setAcilim(value);
            }
          },
        ),
      ],
    );
  }

  Widget _buildCiftKanatTipDropdown(HesapProvider provider) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Çift Kanat Tipi',
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 14,
          ),
        ),
        const SizedBox(height: 8),
        DropdownButton<String>(
          value: provider.ciftKanatTip,
          isExpanded: true,
          items: const [
            DropdownMenuItem(
              value: 'TİP1',
              child: Text('ÇİFT KANAT ÇİFT AÇILIM'),
            ),
            DropdownMenuItem(
              value: 'TİP2',
              child: Text('ÇİFT KANAT TEK AÇILIM'),
            ),
          ],
          onChanged: (value) {
            if (value != null) {
              provider.setCiftKanatTip(value);
            }
          },
        ),
      ],
    );
  }

  Widget _buildKilitTipDropdown(HesapProvider provider) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Kilit Tipi',
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 14,
          ),
        ),
        const SizedBox(height: 8),
        DropdownButton<String>(
          value: provider.kilitTip,
          isExpanded: true,
          items: const [
            DropdownMenuItem(
              value: 'KOSE_DONUSU',
              child: Text('KÖŞE DÖNÜŞÜ İLE'),
            ),
            DropdownMenuItem(
              value: 'FISEK_SURGU',
              child: Text('FİŞEK SÜRGÜ İLE'),
            ),
            DropdownMenuItem(
              value: 'ISPANYOLET_SURGUSU',
              child: Text('İSPANYOLET SÜRGÜSÜ'),
            ),
          ],
          onChanged: (value) {
            if (value != null) {
              provider.setKilitTip(value);
            }
          },
        ),
      ],
    );
  }

  Widget _buildOrtaKayitDropdown(HesapProvider provider) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Orta Kayıt Durumu',
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 14,
          ),
        ),
        const SizedBox(height: 8),
        DropdownButton<String>(
          value: provider.ortaKayit,
          isExpanded: true,
          items: const [
            DropdownMenuItem(value: 'VAR', child: Text('VAR')),
            DropdownMenuItem(value: 'YOK', child: Text('YOK')),
          ],
          onChanged: (value) {
            if (value != null) {
              provider.setOrtaKayit(value);
            }
          },
        ),
      ],
    );
  }
}
