import 'package:flutter/material.dart';

class ikizkenarucgen extends StatefulWidget {
  const ikizkenarucgen({super.key});

  @override
  State<ikizkenarucgen> createState() => _ikizkenarucgenState();
}

class _ikizkenarucgenState extends State<ikizkenarucgen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("İkizkenar Üçgen Alan ve Çevre Hesabı"),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,

        //kenar1 + kenar1 +  kenar2

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
