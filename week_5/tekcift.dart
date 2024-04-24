import 'dart:math';

void main(List<String> args) {
  var sayi = List<double>.filled(10, 0);

  var tek = List<double>.filled(10, 0);
  var cift = List<double>.filled(10, 0);

  var rastgele = new Random();

  for (int i = 0; i < 10; i++) {
    sayi[i] = rastgele.nextInt(100) + 1;
    print(sayi[i]);
  }

  for (int i = 0; i < 10; i++) {
    if (sayi[i] / 2 == 0) {
      cift.add(sayi[i]);
    } else {
      tek.add(sayi[i]);
    }
  }

  for (int i = 0; i < sayi.length; i++) {
    print(sayi[i]);
  }
}
