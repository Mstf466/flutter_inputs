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
            SayacWidget(),
          ],
        ),
      ),
    );
  }
}

class SayacWidget extends StatefulWidget {
  const SayacWidget({super.key});

  @override
  State<SayacWidget> createState() => _SayacWidgetState();
}

class _SayacWidgetState extends State<SayacWidget> {
  int _sayac = 0;
  
  @override
  Widget build(BuildContext context) {
    return Text(_sayac.toString(), style: Theme.of(context).textTheme.headlineSmall,);
  }
}
