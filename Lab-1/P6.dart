import 'dart:io';

void main() {
  print("Enter weight in pounds: ");
  double weightPounds = double.parse(stdin.readLineSync()!);
  print("Enter height in inches: ");
  double heightInches = double.parse(stdin.readLineSync()!);

  double weightKg = weightPounds * 0.45359237;
  double heightMeters = heightInches * 0.0254;
  double bmi = weightKg / (heightMeters * heightMeters);

  print("Your BMI is $bmi");
}
