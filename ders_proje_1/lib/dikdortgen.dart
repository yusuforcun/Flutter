import 'package:flutter/material.dart';

class dikdortgen extends StatefulWidget {
  const dikdortgen({super.key});

  @override
  State<dikdortgen> createState() => _dikdortgenState();
}

class _dikdortgenState extends State<dikdortgen> {
  TextEditingController kisa_kenar = TextEditingController();
  TextEditingController uzun_kenar = TextEditingController();
  int sonuc = 0;
  int sonuc2 = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Dikdortgenin Alan ve Çevre Hesabı"),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,

      ),
      body: Center(
        child: Column(
          children: [

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                style: TextStyle(color: Colors.blueAccent, fontSize: 25),
                textAlign: TextAlign.center,
                controller: kisa_kenar,
                decoration: InputDecoration(
                    hintText: "Kısa Kenarı Giriniz",
                    border: OutlineInputBorder()),
              ),
            ),


            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                style: TextStyle(color: Colors.blueAccent,fontSize: 25),
                textAlign: TextAlign.center,
                controller: uzun_kenar,
                decoration: InputDecoration(
                    hintText: "Uzun Kenarı Giriniz",
                    border: OutlineInputBorder()),
              ),
            ),

            ElevatedButton(
                onPressed: (){
                  setState(() {
                    sonuc = int.parse(kisa_kenar.text) * int.parse(uzun_kenar.text);
                    sonuc2 = 2*(int.parse(kisa_kenar.text) + int.parse(uzun_kenar.text));
                  });
                }, child: Text("Hesapla",
              style: TextStyle(color :Colors.blueAccent, fontSize: 25),)),



            Padding(
              padding: const EdgeInsets.all(35.0),
              child: Text("Alan : "+ sonuc.toString(),style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),),
            ),

            Padding(
              padding: const EdgeInsets.all(35.0),
              child: Text("Çevre : "+ sonuc2.toString(),style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold,),),
            )



          ],
        ),
      ),
    );
  }
}
