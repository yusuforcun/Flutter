import 'package:flutter/material.dart';
import 'package:flutter_android/student.dart';
import 'package:flutter_android/student_add.dart';

void main()=> runApp(MyApp());


class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(home : HomeScreen());
  }
}

class HomeScreen extends StatefulWidget{
  @override
  State createState(){
    return _HomeScreenState();
  }
}

class _HomeScreenState extends State {
  List<Student> students = [
    Student.withId(1,"Engin","Demiroğ",100),
    Student.withId(2,"Yusuf","Orçun",45),
    Student.withId(3,"Kerem","Barış",30),
    Student.withId(4, "talha", "ssssss", 89),
  ];


  Student selectedStudent = Student.withId(0, "", "", 0);

  @override
  Widget build(BuildContext context) {
  return Scaffold(
      appBar: AppBar(title:Text("Öğrenci Takip Sistemi")),
      body:buildBody());
  }

  Widget buildBody() {
    return Column(
      children:<Widget> [
        Expanded(
    child: ListView.builder(
      itemCount: students.length,
      itemBuilder: (BuildContext context , int index){
        return ListTile(
          title: Text(students[index].firstName + " " + students[index].lastName),
          subtitle: Text("Sınavdan Aldığı Not : "+ students[index].grade.toString()+"["+students[index].getStatus+"]"),
          leading: CircleAvatar(
            backgroundImage: NetworkImage("https://cdn.pixabay.com/photo/2016/12/02/08/30/man-1877208_960_720.jpg"),
          ),
          trailing: buildStatusIcon(students[index].grade),
          onTap:(){
            setState(() {
              this.selectedStudent = students[index];
            });
            ;},
          onLongPress:(){print("Uzun Basıldı");}
        );
    })
    ),
      Text("Seçili Öğrenci : "+selectedStudent.firstName),

      Expanded(child: Row(
          children:<Widget> [
              Flexible(
                fit: FlexFit.tight,
                flex: 2,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue, // Renk belirleme
                    ),
                  onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context)=> StudentAdd(students)));
                  },
                  child : Row(
                    children: [
                      Icon(Icons.add),
                      SizedBox( width :5.0, ),
                      Text("Yeni Öğrenci")
                    ],
                  )
                )
              ),

            Flexible(
                fit: FlexFit.tight,
                flex: 2,
                child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                backgroundColor: Colors.amber, // Renk belirleme
                ),
                    onPressed: () {  },
                    child : Row(
                      children: [
                        Icon(Icons.add),
                        SizedBox( width :5.0, ),
                        Text("Güncelle")
                      ],
                    )
                )
            ),

            Flexible(
                fit: FlexFit.tight,
                flex: 1,
                child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                backgroundColor: Colors.grey, // Renk belirleme
                ),
                    onPressed: () {  },
                    child : Row(
                      children: [
                        Icon(Icons.add),
                        SizedBox( width :5.0, ),
                        Text("Sil")
                      ],
                    )
                )
            )
          ],
      )
      )
      ],
    );



  }



  Widget buildStatusIcon(int grade) {
      if(grade>=50){
        return Icon(Icons.done);
      }else if(grade>=40){
        return Icon(Icons.album);
      }else{
        return Icon(Icons.clear);
      }
  }
}

//5.12