import 'package:flutter/material.dart';
import 'package:proje_uygulamasi_3/dikdortgen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Ana Sayfa"),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Center(
        child: Column(
          children: [
            ElevatedButton(
                onPressed:(){ Navigator.push(context,
                    MaterialPageRoute(builder: (context) => dikdortgen()));
            },
                child: Text("Dikdörtgen Sayfasına Git "))

          ],
        ),
      ),
    );
  }
}
