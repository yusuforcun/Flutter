import 'dart:io' ;
void main(){
  int bki , boy , kilo ;
  print("kilo");
  kilo = int.parse(stdin.readLineSync()!);

  print("boy");
  boy = int.parse(stdin.readLineSync()!);
  
  bki = kilo/(boy*boy);
  
  if (bki < 20)
    
    print("zayıf");
  else if (20 < bki && bki < 25)
    print("normal");
  else if (25<bki && bki<30)
    print("hafif sisman");
  else if (30<bki && bki<35)
    print("sisman");
  else if (35<bki && bki<45)
    print("saglık acısından önemli");
  else if (45<bki && bki<50)
    print("agır sişsmnan");
   else if (bki<50)
    print("morbid");
}