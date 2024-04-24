class Sekil {
  void alanHesapla(String sekil, int kenar) {
    int alan = kenar * kenar;
    print("Şekil : " + sekil);
    print("Alan : " + alan.toString());
  }

  void cevreHesapla(String sekil, int kenar) {
    int cevre = (2 * kenar) + (2 * kenar);
    print("Şekil : " + sekil);
    print("Cevre : " + cevre.toString());
  }
}

class Sekil2 {
  void alanHesapla(String sekil, int kenar) {
    int alan = (3 * kenar) * (3 * kenar);
    print("Şekil : " + sekil);
    print("Alan : " + alan.toString());
  }

  void cevreHesapla(String sekil, int kenar) {
    int cevre = 2 * 3 * kenar;
    print("Şekil : " + sekil);
    print("Cevre : " + cevre.toString());
  }
}

class Sekil3 {
  void alanHesapla(String sekil, int kisa_kenar, int uzun_kenar) {
    int alan = kisa_kenar * uzun_kenar;
    print("Şekil : " + sekil);
    print("Alan : " + alan.toString());
  }

  void cevreHesapla(String sekil, int kisa_kenar, int uzun_kenar) {
    int cevre = (2 * kisa_kenar) + (2 * uzun_kenar);
    print("Şekil : " + sekil);
    print("Cevre : " + cevre.toString());
  }
}

void main() {
  Sekil sekil1 = new Sekil();
  sekil1.alanHesapla("kare", 3);
  sekil1.cevreHesapla("kare", 3);

  Sekil2 daire = new Sekil2();
  daire.alanHesapla("daire", 3);
  daire.cevreHesapla("daire", 3);

  Sekil3 dikdortgen = new Sekil3();
  dikdortgen.alanHesapla("dikdörtgen", 3, 8);
  dikdortgen.cevreHesapla("dikdörtgen", 3, 8);
}
