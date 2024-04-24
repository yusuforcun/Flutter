import 'package:flutter/material.dart';

class dikdortgen extends StatefulWidget {
  const dikdortgen({super.key});

  @override
  State<dikdortgen> createState() => _dikdortgenState();
}

class _dikdortgenState extends State<dikdortgen> {
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
                  },
                  child: Text("Sayfa B'ye Git"))




            ],
          ),

      ),
      );
  }
}
