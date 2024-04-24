import 'dart:math';

import 'package:flutter/material.dart';

class uslusayi extends StatefulWidget {
  const uslusayi({super.key});

  @override
  State<uslusayi> createState() => _uslusayiState();
}

class _uslusayiState extends State<uslusayi> {
  TextEditingController baseController = TextEditingController();
  TextEditingController exponentController = TextEditingController();
  String result = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Üs Hesaplayıcı'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: baseController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Taban'),
            ),
            SizedBox(height: 20),
            TextField(
              controller: exponentController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Üs'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: calculatePower,
              child: Text('Hesapla'),
            ),
            SizedBox(height: 20),
            Text(
              'Sonuç: $result',
              style: TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }

  void calculatePower() {
    double base = double.tryParse(baseController.text) ?? 0.0;
    double exponent = double.tryParse(exponentController.text) ?? 0.0;

    num resultValue = pow(base, exponent);

    setState(() {
      result = resultValue.toString();
    });
  }
}
