import 'package:flutter/material.dart';

class ucnotun_ortalamasi extends StatefulWidget {
  const ucnotun_ortalamasi({super.key});

  @override
  State<ucnotun_ortalamasi> createState() => _ucnotun_ortalamasiState();
}

class _ucnotun_ortalamasiState extends State<ucnotun_ortalamasi> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Üç Notun Ortalamasını Hesaplama"),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,

      ),
      body: Center(
        child: Column(
          children: [
            ElevatedButton(
                onPressed:(){
                  Navigator.pop(context);
                },
                child: Text("Ana Sayfaya Dön"))




          ],
        ),
      ),
    );
  }
}
