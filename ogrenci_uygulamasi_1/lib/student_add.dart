import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_android/student.dart';

class StudentAdd extends StatefulWidget{

  List <Student> students ;

  StudentAdd(this.students);
  //cok kısa bir yol , kullanılır .


  State  createState(){
  return _StudentAddState() ;
}
}

class _StudentAddState extends State<StudentAdd>{

  var formKey = GlobalKey();

  Student student = Student("","",0);

  @override
  Widget build (BuildContext context){
    return Scaffold(
      appBar: AppBar(title: Text("Yeni Ögrenci "),),
      body: Container(
      margin: EdgeInsets.all(20.00),
        //Tüm Kenarlardan 20 Birim Boşluk Bırak all yerine only kullanıp kenara ozel verebiliyorsun
        child:Form(
          key: formKey,
        child: Column(
          children: [
            buildFirstNameField(),
            buildLastNameField(),
            buildGradeField(),
            buildSubmitButton()
          ],
    ),
        ),
    ),
    );
  }

  buildFirstNameField() {
    return TextFormField(
      decoration: InputDecoration(labelText: "Öğrenci Adı", hintText: "Engin"),
      // İnput kısmı alır ve ipucu kelime olarak Engin yazdırır

        onSaved: (String? val) {
          student.firstName = val!;
        }
    );
  }


  buildLastNameField() {
    return TextFormField(
      decoration: InputDecoration(labelText: "Öğrenci Soyadı", hintText: "Demiroğ"),
      // İnput kısmı alır ve ipucu kelime olarak Engin yazdırır

      onSaved: (String? val){
         student.lastName = val! ;
      },
    );
  }


  buildGradeField() {
    return TextFormField(
      decoration: InputDecoration(labelText: "Aldığı Not ", hintText: "65"),
      // İnput kısmı alır ve ipucu kelime olarak Engin yazdırır

      onSaved: (String? val){
        student.grade = int.parse(val!) ;
      },
    );
  }


  Widget buildSubmitButton(){
    return ElevatedButton(
        child: Text("Kaydet"),
        onPressed : (){
        //formKey.currentState.onSaved();
        widget.students.add(student);
        Navigator.pop(context);
        },

    );
  }





}