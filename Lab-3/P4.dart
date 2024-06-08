import 'dart:io';

void main() {
  print("Enter a number: ");
  int number = int.parse(stdin.readLineSync()!);
  int reversedNumber = 0;

  while (number != 0) {
    int digit = number % 10;
    reversedNumber = reversedNumber * 10 + digit;
    number ~/= 10;
  }

  print("Reversed number is $reversedNumber");
}
