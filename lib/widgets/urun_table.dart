import 'package:flutter/material.dart';
import '../models/urun.dart';

class UrunTable extends StatelessWidget {
  final List<Urun> urunler;
  final Function(Urun) onRowTap;

  const UrunTable({
    Key? key,
    required this.urunler,
    required this.onRowTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: DataTable(
        columns: const [
          DataColumn(label: Text('Ürün Adı')),
          DataColumn(label: Text('Kod')),
          DataColumn(label: Text('Adet')),
          DataColumn(label: Text('Resim')),
        ],
        rows: urunler
            .map(
              (urun) => DataRow(
                onSelectChanged: (selected) {
                  if (selected ?? false) {
                    onRowTap(urun);
                  }
                },
                cells: [
                  DataCell(Text(urun.ad)),
                  DataCell(Text(urun.kod)),
                  DataCell(Text(urun.adet.toString())),
                  DataCell(
                    urun.resim != null
                        ? InkWell(
                            onTap: () => onRowTap(urun),
                            child: const Text(
                              '📷 Gör',
                              style: TextStyle(
                                color: Colors.blue,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          )
                        : const Text('-'),
                  ),
                ],
              ),
            )
            .toList(),
      ),
    );
  }
}
