import 'dart:io';

void main() {
  print("Enter first number: ");
  double num1 = double.parse(stdin.readLineSync()!);

  print("Enter second number: ");
  double num2 = double.parse(stdin.readLineSync()!);

  print("Enter third number: ");
  double num3 = double.parse(stdin.readLineSync()!);

  double largest = num1;

  if (num2 > largest) {
    largest = num2;
  }

  if (num3 > largest) {
    largest = num3;
  }

  print("Largest number is $largest");
}
