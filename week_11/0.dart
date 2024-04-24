import 'dart:io';

void main() {
  int ortalama = 0;
  int toplam = 0;
  int sayiSayisi = 0;
  while (true) {
    stdout.write("Lütfen sayıyı giriniz : ");
    int girilenSayi = int.parse(stdin.readLineSync()!);
    if (girilenSayi != 0) {
      sayiSayisi += 1;
      toplam = toplam + girilenSayi;
      ortalama = toplam ~/ sayiSayisi;
    } else {
      stdout.write("Çıkmak istiyormusun ???? : ");
      String cevap = stdin.readLineSync()!;
      if (cevap == "H") {
        continue;
      }
      if (cevap == "E") {
        break;
      }
    }
  }
  print("ORTALAMA : " + ortalama.toString());
  print("TOPLAM : " + toplam.toString());
}
