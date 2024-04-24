void buyukBul(List<int> dizi) {
  int enbuyuk = dizi[0];

  for (int i = 0; i < dizi.length; i++) {
    if (dizi[i] > enbuyuk) enbuyuk = dizi[i];
  }
  return (enbuyuk);
}

void main() {
  var sayilar = List<int>.filled(5, 0);
  sayilar[0] = 10;
  sayilar[1] = 11;
  sayilar[2] = 12;
  sayilar[3] = 13;
  sayilar[4] = 14;
  sayilar[5] = 15;

  int sonuc = buyukBul(sayilar);
  print(sonuc);
}
