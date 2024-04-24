import 'dikdortgen.dart';
import 'daire.dart';
import 'eskenarucgen.dart';
import 'faktoriyel.dart';
import 'saniye.dart';
import 'satis_fiyati.dart';
import 'sayi_bolen.dart';
import 'uslusayi.dart';
import 'vergi.dart';
import 'yamuk.dart';
import 'package:flutter/material.dart';

import 'isci_ucreti.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Örnek Proje',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Color.fromRGBO(16, 80, 87,0)),
        useMaterial3: true,
      ),
      home: Ana_Sayfa(),
    );
  }
}

class Ana_Sayfa extends StatefulWidget {
  @override
  State<Ana_Sayfa> createState() => _Ana_SayfaState();
}

class _Ana_SayfaState extends State<Ana_Sayfa> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Ana Sayfa"),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),

      body: Padding(
        padding: const EdgeInsets.all(25),
        child: Center(
          child: Column(
            children: [

              //DİKDORTGEN BUTONU
              ElevatedButton(
                  onPressed: () {
                      Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => dikdortgen()));
                },
                  child: Text("Dikdörtgen Hesaplama Sayfasına Gidiniz")),

              //DAİRE BUTONU
              ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => daire()));
                  },
                  child: Text("Daire Hesaplama Sayfasına Gidiniz")),


              //YAMUK BUTONU
              ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => yamuk()));
                  },
                  child: Text("Yamuk Hesaplama Sayfasına Gidiniz")),


              //ESKENAR ÜCGEN BUTONU
              ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => eskenarucgen()));
                  },
                  child: Text("Eskenar Üçgen Hesaplama Sayfasına Gidiniz")),


              //İKİZKENAR ÜCGEN BUTONU
              ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => eskenarucgen()));
                  },
                  child: Text("İkizkenar Üçgen Hesaplama Sayfasına Gidiniz")),


              //ÜSLÜ SAYI  BUTONU
              ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => uslusayi()));
                  },
                  child: Text("Üslü Sayı Hesaplama Sayfasına Gidiniz")),



              //FAKTÖRİYEL  BUTONU
              ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => faktoriyel()));
                  },
                  child: Text("Faktöriyel Hesaplama Sayfasına Gidiniz")),


              //SAYININ BOLENLERİ BUTONU
              ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => sayi_bolen()));
                  },
                  child: Text("Sayinin Bölenlerini Hesaplama Sayfasına Gidiniz")),


              //UCNOTUN ORTALAMASI  BUTONU
              ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => sayi_bolen()));
                  },
                  child: Text("üÇ Notun Ortalamasını Hesaplama Sayfasına Gidiniz")),


              //İŞCİNİN ÜCRETİNİ HESAPLAMA  BUTONU
              ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => isci_ucreti()));
                  },
                  child: Text("işcinin Ücretini Hesaplama Sayfasına Gidiniz")),



              //VERGİ HESAPLAMA  BUTONU
              ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => vergi()));
                  },
                  child: Text("Vergi Hesaplama Sayfasına Gidiniz")),


              //SANİYE  HESAPLAMA  BUTONU
              ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => saniye()));
                  },
                  child: Text("Saniye Hesaplama Sayfasına Gidiniz")),



              //SATIS FİYATI HESAPLAMA  BUTONU
              ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => satis_fiyati()));
                  },
                  child: Text("Satış Fiyatı Hesaplama Sayfasına Gidiniz"))

            ],
          ),
        ),
      ),
    );
  }
}
