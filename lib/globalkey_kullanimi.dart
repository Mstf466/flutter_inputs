import 'package:flutter/material.dart';

class GlobalKeyKullanimi extends StatelessWidget {
  const GlobalKeyKullanimi({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Global Key Kullanimi'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Butona Basilma Miktari :'),
            Text('0'),
          ],
        ),
      ),
    );
  }
}
