void main() {
  var a = [10, 2, 10, 3, 2, 3, 4, 3, 5, 11];
  int sayac = 0;
  var yazilan = [];
  for (int i = 0; i < a.length; i++) {
    sayac = 0;
    for (int j = 0; j < a.length; j++) {
      if (a[i] == a[j]) {
        sayac++;
      }
    }
    if (!yazilan.contains(a[i])) {
      yazilan.add(a[i]);
      print(a[i].toString() + "den" + sayac.toString() + "tane var");
    }
  }
}
