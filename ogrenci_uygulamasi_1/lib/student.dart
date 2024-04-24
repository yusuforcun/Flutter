class Student{
  int id =0;
  String firstName ="first";
  String lastName ="last";
  int grade =8;
  String status ="bekar";

  Student(String firstName , String lastName , int grade){
    this.firstName = firstName ;
    this.lastName = lastName;
    this.grade = grade;
  }


  //Name Constructor
  Student.withId(int id,String firstName , String lastName , int grade){
    this.id = id ;
    this.firstName = firstName ;
    this.lastName = lastName;
    this.grade = grade;
  }

  String get getStatus{
    String message=" " ;
    if(this.grade >=50){
      message = "Geçti";
    } else if(this.grade>=40){
      message = "Bütünlemeyle Kaldı";
    } else{
      message = "Kaldı";
    }
    this.status = message ;
    return message ;
  }



}
