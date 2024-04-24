import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  const MyApp({super.key});
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text('Turuncu Kutular'),
          backgroundColor: Colors.blueAccent,
        ),
        body: Column(
          children: [
            Container(
                width: 350.0,
                height: 100.0,
                color: Colors.blueAccent,
                margin: EdgeInsets.only(bottom: 10.0, left: 5, top: 15)),
            Row(
              children: [
                Container(
                  width: 350.0,
                  height: 100.0,
                  color: Colors.blue,
                  margin: EdgeInsets.only(bottom: 10.0, left: 25, top: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        width: 80.0,
                        height: 80.0,
                        color: Colors.amber,
                      ),
                      Container(
                        width: 80.0,
                        height: 80.0,
                        color: Colors.amber,
                      ),
                      Container(
                        width: 80.0,
                        height: 80.0,
                        color: Colors.amber,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
            Row(
              children: [
                Container(
                  width: 110.0,
                  height: 220.0,
                  margin: EdgeInsets.only(left: 25),
                  color: Colors.lightBlueAccent,
                ),
                Container(
                  width: 110.0,
                  height: 220.0,
                  margin: EdgeInsets.only(left: 25),
                  color: Colors.lightBlueAccent,
                ),
                Container(
                  width: 95,
                  height: 95,
                  color: Colors.amberAccent,
                  margin: EdgeInsets.only(left: 20, bottom: 120),
                ),
              ],
            ),
            SizedBox(height: 20),
            Row(
              children: [
                Container(
                    width: 350.0,
                    height: 100.0,
                    color: Colors.blueAccent,
                    margin: EdgeInsets.only(bottom: 10.0, left: 25, top: 15)),
              ],
            )
          ],
        ),
      ),
    );
  }
}
