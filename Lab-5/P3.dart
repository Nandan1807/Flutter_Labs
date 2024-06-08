void main() {
  List<String> cities = ["Delhi", "Mumbai", "Bangalore", "Hyderabad", "Ahmedabad"];

  int index = cities.indexOf("Ahmedabad");
  if (index != -1) {
    cities[index] = "Surat";
  }

  print("Updated cities list: $cities");
}
