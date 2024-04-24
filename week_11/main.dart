import 'dart:io';
import 'dart:math';

void main() {
  Random random = new Random();
  int arananSayi = random.nextInt(100);

  int birinciPuan = 0;
  int ikinciPuan = 0;

  int kalanHak = 5;

  int turSayisi = 10;

  if (turSayisi >= 0) {
    if (kalanHak < 0) {
      stdout.write("Lütfen sayıyı giriniz : ");
      var girilenSayi = stdin.readLineSync();
      if (girilenSayi == arananSayi) {
        print("Girilen Sayi Dogru");
      }
      if (girilenSayi != arananSayi) {
        kalanHak -= 1;
        print("Son" + kalanHak.toString() + "hakkınız kaldı.");
      }
    }
    print(turSayisi);
    print(kalanHak);
    turSayisi -= 1;
  }
}
