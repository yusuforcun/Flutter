import 'package:flutter/material.dart';

class yamuk extends StatefulWidget {
  const yamuk({super.key});

  @override
  State<yamuk> createState() => _yamukState();
}

//CEVRE : alt+üst+kısa+uzun
//ALAN (alt taban +üst taban)/2 * h

class _yamukState extends State<yamuk> {
  TextEditingController yukseklik = TextEditingController();
  TextEditingController alt_taban = TextEditingController();
  TextEditingController ust_taban = TextEditingController();
  TextEditingController kenar = TextEditingController() ;
  TextEditingController kenar_2 =TextEditingController();
  double alan = 0 ;
  int cevre = 0 ;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Yamuk Alan ve Çevre Hesabı"),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,

      ),
      body: Center(
        child: Column(
          children: [

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                style: TextStyle(color: Colors.blueAccent,fontSize: 25),
                textAlign: TextAlign.left,
                controller: yukseklik,
                decoration: InputDecoration(
                  hintText: "Yüksekliği Giriniz",
                  border: OutlineInputBorder()),
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                style: TextStyle(color: Colors.blueAccent,fontSize: 25),
                textAlign: TextAlign.left,
                controller: ust_taban,
                decoration: InputDecoration(
                    hintText: "Üst Tabanı Giriniz",
                    border: OutlineInputBorder()),
              ),
            ),


            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                style: TextStyle(color: Colors.blueAccent,fontSize: 25),
                textAlign: TextAlign.left,
                controller: alt_taban,
                decoration: InputDecoration(
                    hintText: "Alt Tabanı Giriniz",
                    border: OutlineInputBorder()),
              ),
            ),


            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                style: TextStyle(color: Colors.blueAccent,fontSize: 25),
                textAlign: TextAlign.left,
                controller: kenar,
                decoration: InputDecoration(
                    hintText: "Birinci Kenarı Giriniz",
                    border: OutlineInputBorder()),
              ),
            ),


            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                style: TextStyle(color: Colors.blueAccent,fontSize: 25),
                textAlign: TextAlign.left,
                controller: kenar_2,
                decoration: InputDecoration(
                    hintText: "İkinci Kenarı Giriniz",
                    border: OutlineInputBorder()),
              ),
            ),

//CEVRE : alt+üst+kısa+uzun
//ALAN (alt taban +üst taban)/2 * h


            ElevatedButton(
                onPressed:(){
                  setState(() {
                    cevre = int.parse(alt_taban.text) + int.parse(ust_taban.text) + int.parse(kenar.text) + int.parse(kenar_2.text) ;
                    alan = (int.parse(alt_taban.text) + int.parse(ust_taban.text)) / 2 *int.parse(yukseklik.text) ;
                  });
                },
                child: Text("Hesapla")),


            Text("Çevre : "+cevre.toString(),style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),),

            Text("Alan : " +alan.toString(),style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),)


          ],
        ),
      ),
    );
  }
}
