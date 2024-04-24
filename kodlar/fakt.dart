int fakt(int a) {
  int snc = 1;
  for (int i = 1; i <= a; i++) {
    snc *= i;
  }
  return (snc);
}

void ana(int a, int b) {
  int sonuc = 0;
  for (int i = a; a <= b; a++) {
    sonuc += fakt(a);
  }
  print(sonuc);
}

void main(List<String> args) {
  ana(3, 5);
}
