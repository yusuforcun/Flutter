void main() {
  int nufus = 2000;
  int yil = 0;
  while (nufus != 50000) {
    yil += 1;
    nufus += (nufus % 20);
  }
  print(yil);
}
