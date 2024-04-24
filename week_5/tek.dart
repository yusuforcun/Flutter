import 'dart:math';

List<int> tekcifttoplam(List<int> dizi) {
  int tektoplam = 0;
  int cifttoplam = 0;
  var sonuc = List<int>.filled(2, 0);

  for (int i = 0; i < dizi.length; i++) {
    if (dizi[i] % 2 == 0) {
      cifttoplam += dizi[i];
    } else {
      tektoplam += dizi[i];
    }
  }

  sonuc[0] = cifttoplam;
  sonuc[1] = tektoplam;
  return sonuc;
}

void main(List<String> args) {
  var sayi = List<int>.filled(10, 0);
  var tcsonuc = List<int>.filled(2, 0);
  var rastgele = new Random();
  for (int i = 0; i < 3; i++) {
    sayi[i] = rastgele.nextInt(100);
    print(sayi[i]);
  }
  tcsonuc = tekcifttoplam(sayi);
  print("Çift toplam : " + tcsonuc[0].toString());
  print("Tek toplam : " + tcsonuc[1].toString());
}
