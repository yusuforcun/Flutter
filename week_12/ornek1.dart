class araba {
  String Renk = "kırmızı";
  String Model = "bugatti";
  int Yil = 1985;

  void arabaGoster() {
    print("Renk  : " + Renk);
    print("Model : " + Model);
    print("Yil : " + Yil.toString());
  }
}

void main() {
  araba araba1 = new araba();
  araba1.arabaGoster();

  print("-------------");

  araba1.Model = "Mercedes";
  araba1.arabaGoster();
}
