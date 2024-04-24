import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  TextEditingController sayi1 = TextEditingController();
  TextEditingController sayi2 = TextEditingController();
  int toplam = 0;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SafeArea(
          child: Column(
            children: [
              Text(
                "TOPLAMA İŞLEMİ",
                style: TextStyle(fontSize: 33),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  style: TextStyle(color: Colors.red, fontSize: 25),
                  textAlign: TextAlign.center,
                  controller: sayi1,
                  decoration: InputDecoration(border: OutlineInputBorder()),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  style: TextStyle(color: Colors.amber, fontSize: 25),
                  textAlign: TextAlign.center,
                  controller: sayi2,
                  decoration: InputDecoration(border: OutlineInputBorder()),
                ),
              ),
              ElevatedButton(
                  onPressed: () {
                    setState(() {
                      toplam = int.parse(sayi1.text) + int.parse(sayi2.text);
                    });
                  },
                  child: Text(
                    "HESAPLA",
                    style: TextStyle(color: Colors.blueAccent, fontSize: 25),
                  )),
              Text("SONUÇ = " + toplam.toString(),
                  style: TextStyle(color: Colors.orange, fontSize: 32)),
            ],
          ),
        ),
      ),
    );
  }
}
