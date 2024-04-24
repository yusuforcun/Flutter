import 'package:flutter/material.dart';

class vergi extends StatefulWidget {
  const vergi({super.key});

  @override
  State<vergi> createState() => _vergiState();
}

class _vergiState extends State<vergi> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Vergi Hesaplama (%20)"),
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
