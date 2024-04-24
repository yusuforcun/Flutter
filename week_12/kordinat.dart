class Nokta {
  int x = 0;
  int y = 0;
  Nokta(int x, int y) {
    this.x = x;
    this.y = y;
  }

  void yaz() {
    print("(" + x.toString() + "," + y.toString() + ")");
  }
}

void main(List<String> args) {
  Nokta nokta = new Nokta(11, 8);
  nokta.yaz();
}
