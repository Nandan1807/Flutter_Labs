import 'dart:io';

int factorial(int n) {
  if (n == 0) return 1;
  return n * factorial(n - 1);
}

void main() {
  print("Enter a number: ");
  int number = int.parse(stdin.readLineSync()!);

  int result = factorial(number);
  print("Factorial of $number is $result");
}
