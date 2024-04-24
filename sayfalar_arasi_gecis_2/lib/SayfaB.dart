import 'package:flutter/material.dart';
import 'package:sayfalar_arasi_gecis_2/SayfaA.dart';
import 'package:sayfalar_arasi_gecis_2/main.dart';

class SayfaB extends StatefulWidget {
  const SayfaB({super.key});

  @override
  State<SayfaB> createState() => _SayfaBState();
}

class _SayfaBState extends State<SayfaB> {
  @override
  Widget build(BuildContext context) { return Scaffold(
      appBar: AppBar(
        title: Text("Sayfa B"),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,

      ),
      body: Center(
        child: Column(
          children: [
            ElevatedButton(
                onPressed:(){
                  Navigator.pop(context);
                },
                child: Text("Geldiği yere dön")
            ),


            ElevatedButton(
                onPressed:(){
                  Navigator.of(context).popUntil((route) => route.isFirst);
                  //İLK DEFAYMIŞ GİBİ SAYFAYI AÇTI
                },
                child: Text("Ana Sayfaya dön")
            ),

            ElevatedButton(
                onPressed:(){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => Ana_Sayfa()));
                  //SAYFAYI TEKRARDAN AÇTI ANASAYFANIN SOL ÜSTÜNDE GERİ SİMGESİ VAR
                },
                child: Text("Ana Sayfaya Geçiş Yap"))

          ],
        ),
      ),
  );
  }
}
