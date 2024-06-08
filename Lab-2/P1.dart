import 'dart:io';

void main() {
  print("Enter a number: ");
  double number = double.parse(stdin.readLineSync()!);

  if (number > 0) {
    print("$number is positive");
  } else if (number < 0) {
    print("$number is negative");
  } else {
    print("$number is zero");
  }
}
