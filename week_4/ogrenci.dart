void main() {
  var ogrenci = new Map();
  ogrenci["adi"] = "Büşra";
  ogrenci["soyadi"] = "ÖzZeybekci";
  ogrenci["yasi"] = "13";
  ogrenci["alani"] =
      "Altın madenciliği ve işletmeciliği Limited Anonim Company Anadolu Sirketi";
  print(ogrenci.keys);
  print(ogrenci);
  print("Bos mu " + ogrenci.isEmpty.toString());
  ogrenci.clear();
  print("Bos mu  " + ogrenci.isEmpty.toString());
  print(ogrenci);
}
