import 'dart:io';

void main() {
  List<double> marks = [];
  for (int i = 1; i <= 5; i++) {
    print("Enter marks for subject $i: ");
    double mark = double.parse(stdin.readLineSync()!);
    marks.add(mark);
  }

  double total = marks.reduce((a, b) => a + b);
  double percentage = total / 5;

  print("Percentage: $percentage%");

  if (percentage < 35) {
    print("Class: Fail");
  } else if (percentage >= 35 && percentage < 45) {
    print("Class: Pass Class");
  } else if (percentage >= 45 && percentage < 60) {
    print("Class: Second Class");
  } else if (percentage >= 60 && percentage < 70) {
    print("Class: First Class");
  } else {
    print("Class: Distinction");
  }
}
