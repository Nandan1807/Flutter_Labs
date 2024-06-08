import 'dart:io';

void main() {
  List<int> numbers = [];

  for (int i = 0; i < 5; i++) {
    print("Enter number ${i + 1}: ");
    int number = int.parse(stdin.readLineSync()!);
    numbers.add(number);
  }

  numbers.sort();
  print("Numbers in increasing order: $numbers");
}
