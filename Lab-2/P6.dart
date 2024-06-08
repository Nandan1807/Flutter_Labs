import 'dart:io';

void main() {
  print("Enter first number: ");
  double num1 = double.parse(stdin.readLineSync()!);

  print("Enter second number: ");
  double num2 = double.parse(stdin.readLineSync()!);

  print("Choose an operation (+, -, *, /): ");
  String operation = stdin.readLineSync()!;

  double result;

  // Using switch..case
  switch (operation) {
    case '+':
      result = num1 + num2;
      break;
    case '-':
      result = num1 - num2;
      break;
    case '*':
      result = num1 * num2;
      break;
    case '/':
      result = num1 / num2;
      break;
    default:
      print("Invalid operation");
      return;
  }

  print("Result: $result");
}
