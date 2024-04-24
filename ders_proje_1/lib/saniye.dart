import 'package:flutter/material.dart';

class saniye extends StatefulWidget {
  const saniye({super.key});

  @override
  State<saniye> createState() => _saniyeState();
}

class _saniyeState extends State<saniye> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Saniye Hesaplama"),
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
