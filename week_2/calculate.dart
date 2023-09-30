import 'dart:io';
void main() {
  
  print("satis gir");
  int satis = int.parse(stdin.readLineSync()!);
  print("maas miktari");
  int maas = int.parse(stdin.readLineSync()!);
  double prim = 0 ;

  if (satis<2000)
    prim = 0 ;
  
  else if(satis > 2000 && satis<5000)
    prim = satis * 5 / 100 ;

  else if (satis > 5000 && satis <7000)
    prim = satis * 10 / 100 ;

  else if (satis >= 7000) 
    prim = satis * 15 / 100 ;
  
  
  int elegecen = maas + prim.toInt() ;
  print("ele gecen miktar :"+ elegecen.toString());

  
}