import 'package:flutter/material.dart';

class satis_fiyati extends StatefulWidget {
  const satis_fiyati({super.key});

  @override
  State<satis_fiyati> createState() => _satis_fiyatiState();
}

class _satis_fiyatiState extends State<satis_fiyati> {
  final TextEditingController fiyatController = TextEditingController();
  double toplamFiyat = 0.0;
  final double kdvOrani = 0.18; // KDV oranı


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Fiyat ve KDV Hesaplayıcı'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                controller: fiyatController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(labelText: 'Fiyat girin'),
              ),
              SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {setState(() {
                  double fiyat = double.parse(fiyatController.text);
                  double kdv = fiyat * kdvOrani;
                  toplamFiyat = fiyat + kdv;
                });
                },
                child: Text('Hesapla'),
              ),


            //Text('Fiyat: $fiyat');
            //Text('KDV (%${kdvOrani * 100}): $kdv'); // Yüzde işareti eklendi
            Text('Toplam Fiyat: $toplamFiyat')
            ],
          ),
        ),
      ),
    );
  }
}
