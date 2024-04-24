import 'package:flutter/material.dart';

class daire extends StatefulWidget {
  const daire({super.key});

  @override
  State<daire> createState() => _daireState();
}

//çevresi 2*3*yarıcap(input
// alanı 3*(yarıcap*yarıcap)


class _daireState extends State<daire> {
  TextEditingController yaricap = TextEditingController();
  int cevre = 0 ;
  int alan = 0 ;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("dairein Alan ve Çevre Hesabı"),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,

      ),
      body: Center(
        child: Column(
          children: [

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                style: TextStyle(color:Colors.blueAccent,fontSize: 25 ),
                textAlign: TextAlign.left,
                controller:yaricap ,
                decoration: InputDecoration(
                  hintText: "Yarı Çapı Giriniz",
                  border: OutlineInputBorder()),
              ),
            ),

            ElevatedButton(
                onPressed:(){
                  setState(() {
                    alan = ( int.parse(yaricap.text)* int.parse(yaricap.text) ) * 3 ;
                    cevre = 2 * 3 * int.parse(yaricap.text);
                  });
                },
                child: Text("Hesapla",
                style: TextStyle(color: Colors.blueAccent,fontSize: 25),)),

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text("Alan : " + alan.toString(),style: TextStyle(fontSize: 30,fontWeight:FontWeight.bold),),
            ),

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text("Çevre : " + cevre.toString(),style: TextStyle(fontSize: 30 , fontWeight: FontWeight.bold),),
            ),
          ],
        ),
      ),
    );
  }
}
