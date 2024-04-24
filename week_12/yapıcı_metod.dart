class cicek {
  String? turu;
  String? renkg;
  int? yaprakSayisi;
  bool? saksi_cicegi;

  cicek() {
    turu = "kambocya canavari";
    renkg = "turkuvaz";
    yaprakSayisi = 13;
    saksi_cicegi = true;
  }

  cicekGoster() {
    print(turu);
    print(renkg);
    print(yaprakSayisi);
    print(saksi_cicegi);
  }
}

void main(List<String> args) {
  cicek cicek1 = new cicek();
  cicek1.cicekGoster();

  cicek1.renkg = "simsiyah";
  cicek1.cicekGoster();
}
