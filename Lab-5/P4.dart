void main() {
  Map<String, String> phonebook = {
    "Alice": "123-456-7890",
    "Bob": "987-654-3210",
    "Charlie": "555-666-7777",
  };

  phonebook.forEach((name, number) {
    print("Name: $name, Number: $number");
  });
}
