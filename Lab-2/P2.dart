import 'dart:io';

void main() {
  print("Enter first number: ");
  double num1 = double.parse(stdin.readLineSync()!);

  print("Enter second number: ");
  double num2 = double.parse(stdin.readLineSync()!);

  print("Choose an operation (+, -, *, /): ");
  String operation = stdin.readLineSync()!;

  double result;

  // Using if..else..if
  if (operation == '+') {
    result = num1 + num2;
  } else if (operation == '-') {
    result = num1 - num2;
  } else if (operation == '*') {
    result = num1 * num2;
  } else if (operation == '/') {
    result = num1 / num2;
  } else {
    print("Invalid operation");
    return;
  }

  print("Result: $result");
}
