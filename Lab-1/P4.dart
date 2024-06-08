import 'dart:io';

void main() {
  List<double> marks = [];
  for (int i = 1; i <= 5; i++) {
    print("Enter marks for subject $i: ");
    double mark = double.parse(stdin.readLineSync()!);
    marks.add(mark);
  }
  double total = marks.reduce((a, b) => a + b);
  double percentage = (total / (5 * 100)) * 100;
  print("Percentage: $percentage%");
}
