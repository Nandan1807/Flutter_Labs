import 'dart:io';

void main() {
  print("Enter length in meters: ");
  double meters = double.parse(stdin.readLineSync()!);
  double feet = meters * 3.28084;
  print("$meters meters is $feet feet");
}
