import 'package:flutter/material.dart';

class sayi_bolen extends StatefulWidget {
  const sayi_bolen({super.key});

  @override
  State<sayi_bolen> createState() => _sayi_bolenState();
}

class _sayi_bolenState extends State<sayi_bolen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Girilen Sayının Bölenlerini Hesaplama"),
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
