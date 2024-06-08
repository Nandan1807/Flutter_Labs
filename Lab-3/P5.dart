import 'dart:io';

void main() {
  print("Enter a string: ");
  String input = stdin.readLineSync()!;
  String reversedString = input.split('').reversed.join('');

  print("Reversed string is $reversedString");
}
