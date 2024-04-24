double toplamBul(List a) {
  double toplam = 0;
  for (int i = 0; i < a.length; i++) toplam += a[i];
  return (toplam);
}

void main(List<String> args) {
  var notlar = List<double>.filled(3, 0);
  notlar[0] = 42.123;
  notlar[1] = 42.123;
  notlar[2] = 49.123;

  double sonuc = toplamBul(notlar);
  print("Sonuc" + sonuc.toString());
}
