import 'package:flutter/material.dart';
import 'package:sayfalar_arasi_gecis_2/SayfaA.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home:Ana_Sayfa(),
    );
  }
}

class Ana_Sayfa extends StatefulWidget {




  @override
  State<Ana_Sayfa> createState() => _Ana_SayfaState();
}

class _Ana_SayfaState extends State<Ana_Sayfa> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Ana Sayfa"),
        backgroundColor: Theme
            .of(context)
            .colorScheme
            .inversePrimary,

      ),
      body: Center(
        child: Column(
          children: [
            ElevatedButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => SayfaA()));
                },
                child: Text("Sayfa A!ya Git"))


          ],
        ),
      ),
    );
  }
}
