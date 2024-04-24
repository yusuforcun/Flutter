import 'dart:math';

double ortalamaBul(List<double> a) {
  double toplam = 0;
  for (int i = 0; i < a.length; i++) {
    toplam += a[i];
  }
  double ortalama = toplam / a.length;
  return ortalama;
}

void main(List<String> args) {
  var sayi = List<double>.filled(3, 0);
  var rastgele = new Random();
  for (int i = 0; i < 3; i++) {
    sayi[i] = rastgele.nextInt(100) + 1;
    print(sayi[i]);
  }

  double sonuc = ortalamaBul(sayi);
  print("Ortalama Sonucu : " + sonuc.toString());
}
