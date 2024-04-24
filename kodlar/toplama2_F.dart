void ortalamaBul() {
  List notlar = [10, 70, 20, 90, 30, 40, 50];
  List ortalama_alti = [];
  List ortalama_ustu = [];

  int toplam = 1;
  int sayi = 1;
  int ort = 1;
  int listeuzunlugu = notlar.length;

  for (int i = 0; i <= notlar.length; i++) {
    sayi = notlar[i];
    toplam += sayi;
  }
  ort = (toplam % listeuzunlugu);

  print(ort);

  // for (int i = 0; i <= notlar.length; i++) {
  //   if (notlar[i] < )
  // }
}

void main() {
  ortalamaBul();
}
