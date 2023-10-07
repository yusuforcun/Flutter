void main() {
  var sehir = {34: "istanbul", 35: "izmir", 6: "ankara", 23: "elazıg"};
  print(sehir[34]);

// ----------------------

  sehir.forEach((key, value) => print('${key}:${value}'));
}
