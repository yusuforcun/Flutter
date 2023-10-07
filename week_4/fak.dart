void fak(int a) {
  int top = 1;
  for (int i = 1; i <= a; i++) {
    top *= i;
  }
  print(top.toString());
}

void main() {
  fak(5);
}
