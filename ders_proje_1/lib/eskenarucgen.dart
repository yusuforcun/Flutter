import 'package:flutter/material.dart';
import 'dart:math' as math;

class eskenarucgen extends StatefulWidget {
  const eskenarucgen({super.key});

  @override
  State<eskenarucgen> createState() => _eskenarucgenState();
}

class _eskenarucgenState extends State<eskenarucgen> {

  TextEditingController kenar_uzunlugu = TextEditingController();
  int cevre = 0 ;
  int alan = 0 ;
  String _result  = "deneme" ;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Eskenar Üçgen Alan ve Çevre Hesabı"),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,

      ),

      //alan taban*yukseklik/iki
      //cevre 3*kenar

      body: Center(
        child: Column(
          children: [


           Padding(
             padding: const EdgeInsets.all(8.0),
             child: TextField(
               style: TextStyle(color: Colors.blueAccent, fontSize: 25),
               textAlign: TextAlign.left,
               controller: kenar_uzunlugu,
               decoration: InputDecoration(
                 hintText: "Kenar Uzunluğunu Giriniz",
                 border: OutlineInputBorder()),
             ),
           ),


            ElevatedButton(
                onPressed:(){ setState (() {
                  cevre = 3* int.parse(kenar_uzunlugu.text);
                });
                },
                child: Text("Hesapla",style: TextStyle(fontSize: 25 , color: Colors.blueAccent),)),

            Text("Çevre : "+ cevre.toString(),style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),)

          ],
        ),
      ),
    );
  }
}
