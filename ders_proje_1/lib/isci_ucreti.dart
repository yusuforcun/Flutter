import 'package:flutter/material.dart';

class isci_ucreti extends StatefulWidget {
  const isci_ucreti({super.key});

  @override
  State<isci_ucreti> createState() => _isci_ucretiState();
}

class _isci_ucretiState extends State<isci_ucreti> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("İşcinin Ücretini Hesaplama"),
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
