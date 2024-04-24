class Nokta {
  int x = 0;
  int y = 0;
  int z = 0;
  Nokta(int x, int y, int z) {
    this.x = x;
    this.y = y;
    this.z = z;
  }

  void yaz() {
    print("(" + x.toString() + "," + y.toString() + "," + z.toString() + ")");
  }
}

void main(List<String> args) {
  Nokta nokta = new Nokta(11, 8, 7);
  nokta.yaz();
}
