import 'dart:math';

var rng = new Random();
int sayi = rng.nextInt(10);

void main() {
//65-90 büyük harf, 97-122 küçük harf, 33-47 sembol, 48-57 rakam

  for (int k = 0; k < 10; k++) {
    int sayi = 0;
    String sifre = "";

    //BÜYÜK HARF
    for (int i = 1; i <= 2; i++) {
      var rng = new Random();
      sayi = rng.nextInt(26) + 65; //(üst sınır-alt sınır)+1
      sifre += String.fromCharCode(sayi);
    }

    //Küçük HARF
    for (int i = 1; i <= 2; i++) {
      var rng = new Random();
      sayi = rng.nextInt(26) + 97;
      sifre += String.fromCharCode(sayi);
    }

    //Sembol
    for (int i = 1; i <= 2; i++) {
      var rng = new Random();
      sayi = rng.nextInt(15) + 33;
      sifre += String.fromCharCode(sayi);
    }
    //Rakam
    for (int i = 1; i <= 2; i++) {
      var rng = new Random();
      sayi = rng.nextInt(10) + 48;
      sifre += String.fromCharCode(sayi);
    }
    print(sifre);
  }
}
