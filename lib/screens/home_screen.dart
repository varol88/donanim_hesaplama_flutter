import 'package:flutter/material.dart';
import 'screens/sistem_secim_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Donanım Hesaplama Sistemi'),
        centerTitle: true,
        elevation: 0,
      ),
      body: const SistemSecimScreen(),
    );
  }
}
