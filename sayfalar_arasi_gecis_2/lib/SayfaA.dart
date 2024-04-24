import 'package:flutter/material.dart';
import 'package:sayfalar_arasi_gecis_2/SayfaB.dart';

class SayfaA extends StatefulWidget {
  const SayfaA({super.key});

  @override
  State<SayfaA> createState() => _SayfaAState();
}

class _SayfaAState extends State<SayfaA> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Sayfa A"),
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,

        ),
        body: Center(
          child: Column(
            children: [
              ElevatedButton(
                  onPressed:(){
                    Navigator.push(context, MaterialPageRoute(builder:(context) => SayfaB()));
                  },
                  child: Text("Sayfa B'ye Git"))




            ],
          ),
        ),
    );
  }
}
