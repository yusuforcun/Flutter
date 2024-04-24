import 'package:flutter/material.dart';

void main()=>runApp(MaterialApp(

  home: Scaffold(
    appBar: AppBar(title: const Text("flutter row deneme",style: TextStyle(color: Colors.blueAccent,fontSize: 30),),
    ),
    body: Row(
      children: [
          Image.asset("img/pp.png")
      ],

    ),





  ),
),
);