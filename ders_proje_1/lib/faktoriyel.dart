import 'package:flutter/material.dart';

class faktoriyel extends StatefulWidget {
  const faktoriyel({super.key});

  @override
  State<faktoriyel> createState() => _faktoriyelState();
}

class _faktoriyelState extends State<faktoriyel> {
  TextEditingController numberController = TextEditingController();
  String result = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Faktöriyel Hesaplayıcı'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: numberController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Sayı'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: calculateFactorial,
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

  void calculateFactorial() {
    int number = int.tryParse(numberController.text) ?? 0;

    int resultValue = factorial(number);

    setState(() {
      result = resultValue.toString();
    });
  }

  int factorial(int n) {
    if (n == 0 || n == 1) {
      return 1;
    } else {
      return n * factorial(n - 1);
    }
  }
}