import 'dart:io';

void main() {
  print("Enter the start number: ");
  int start = int.parse(stdin.readLineSync()!);

  print("Enter the end number: ");
  int end = int.parse(stdin.readLineSync()!);

  print("Numbers divisible by 2 but not by 3 between $start and $end:");
  for (int i = start; i <= end; i++) {
    if (i % 2 == 0 && i % 3 != 0) {
      print(i);
    }
  }
}
