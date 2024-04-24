import 'dart:io';

void main() {
  int sayi = 0 ;
  print("sayi giriniz");
  sayi=stdin.readLineSync();
  

  if(95<= sayi <=100){print("AA");}
  if(85<= sayi <=95){print("BA");}
  if(70<= sayi <=85){print("BB");}
  if(60<= sayi <=70){print("CB");}
  if(50<= sayi <=60){print("CC");}
  if(40<= sayi <=50){print("DC");}
  if(0<= sayi <=40){print("DD");}
  print(sayi);
}
