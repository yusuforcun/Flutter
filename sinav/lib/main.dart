//son hali
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: Scaffold(
          appBar: AppBar(

            leading: CircleAvatar(
              child: Image.asset("assets/img/logo.jpeg"),
              radius: 30,
            ),

            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(20),
            )),
            title: Center(child: Text("Borusan Bilişim",)),
            backgroundColor: Colors.grey,
          ),
          body: Column(
            children: [
              SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    decoration: BoxDecoration(color: Colors.grey,border: Border.all(color: Colors.orange)),
                    width: 100,
                    height: 100,

                    child: Center(child: Text("Bilişim")),

                  ),
                  Container(
                    decoration: BoxDecoration(color: Colors.orange,border: Border.all(color: Colors.black)),
                    width: 100,
                    height: 100,
                    child: Center(
                        child: Text(
                      "Teknolojileri",
                      style: TextStyle(color: Colors.grey),
                    )),
                  ),
                  Container(
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(color: Colors.black,border: Border.all(color: Colors.grey)),
                    child: Center(
                        child: Text(
                      "Alanı",
                      style: TextStyle(color: Colors.white),
                    )),
                  ),
                ],
              ),
              SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    decoration: BoxDecoration(color: Colors.grey,border: Border.all(color: Colors.orange)),
                    width: 100,
                    height: 100,
                    child: Center(child: Text("Bilişim")),
                  ),
                  Container(
                    decoration: BoxDecoration(color: Colors.orange,border: Border.all(color: Colors.black)),
                    width: 100,
                    height: 100,
                    child: Center(
                        child: Text(
                      "Teknolojileri",
                      style: TextStyle(color: Colors.grey),
                    )),
                  ),
                  Container(
                    width: 100,
                    height: 100,
                    color: Colors.black,
                    child: Center(
                        child: Text(
                      "Alanı",
                      style: TextStyle(color: Colors.white),
                    )),
                  ),
                ],
              ),
              SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    width: 100,
                    height: 100,
                    color: Colors.grey,
                    child: Center(child: Text("Bilişim")),
                  ),
                  Container(
                    width: 100,
                    height: 100,
                    color: Colors.orange,
                    child: Center(
                        child: Text(
                      "Teknolojileri",
                      style: TextStyle(color: Colors.grey),
                    )),
                  ),
                  Container(
                    width: 100,
                    height: 100,
                    color: Colors.black,
                    child: Center(
                        child: Text(
                      "Alanı",
                      style: TextStyle(color: Colors.white),
                    )),
                  ),
                ],
              ),
              SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 100,
                    height: 100,
                    color: Colors.grey,
                    child: Center(child: Text("Bilişim")),
                  ),
                  Container(
                    width: 100,
                    height: 100,
                    color: Colors.orange,
                    child: Center(
                        child: Text(
                      "Teknolojileri",
                      style: TextStyle(color: Colors.grey),
                    )),
                  ),
                  Container(
                    width: 100,
                    height: 100,
                    color: Colors.black,
                    child: Center(
                        child: Text(
                      "Alanı",
                      style: TextStyle(color: Colors.white),
                    )),
                  ),
                ],
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.grey,

                ),
                onPressed: () {},
                child: Text("Next", style: TextStyle(color: Colors.orange)),
              )
            ],
          )),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Row(
        children: <Widget>[],
      ),
    );
  }
}
