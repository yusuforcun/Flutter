import 'dart:io';

void main(List<String> args) {
  int sayi = 0;
  print("sayi giriniz");
  sayi = int.parse(stdin.readLineSync()!);

  int enbuyuk = 0;
  int ilksayi = 0;
  List girilensayilar = [];

  if (sayi != -1) {
    girilensayilar.add(sayi);
  }
  for (int i = 0; i < girilensayilar.length; i++) {
    if (ilksayi < girilensayilar[i]) {
      if (enbuyuk < girilensayilar[i]) {
        enbuyuk = girilensayilar[i];
      }
    }
  }
}
