import 'dart:io';
import 'dart:math';

void main(List<String> args) {
  Random random = new Random();
  int birinci = 0;
  int ikinci = 0;
  List sayilar = [];
  int enbuyuk = 0;

  print("birinci sayi gir");
  birinci = stdin.readLineSync() as int;

  print("ikinci sayi gir");
  ikinci = stdin.readLineSync() as int;

  for (int i = 0; i <= 10; i++) {
    sayilar[i] = random.nextInt(birinci) + ikinci;

    if (enbuyuk > sayilar[i]) {
      enbuyuk = sayilar[i];
    }
  }
  print(enbuyuk);
}
