import 'dart:io';

void main() {
  List<int> numbers = [];
  print("Enter the number of elements: ");
  int n = int.parse(stdin.readLineSync()!);

  for (int i = 0; i < n; i++) {
    print("Enter number ${i + 1}: ");
    int number = int.parse(stdin.readLineSync()!);
    numbers.add(number);
  }

  int sum = numbers.where((num) => num % 3 == 0 || num % 5 == 0).reduce((a, b) => a + b);
  print("Sum of numbers divisible by 3 or 5: $sum");
}
