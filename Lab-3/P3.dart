import 'dart:io';

bool isPrime(int n) {
  if (n <= 1) return false;
  for (int i = 2; i <= n ~/ 2; i++) {
    if (n % i == 0) return false;
  }
  return true;
}

void main() {
  print("Enter a number: ");
  int number = int.parse(stdin.readLineSync()!);

  if (isPrime(number)) {
    print("$number is a prime number");
  } else {
    print("$number is not a prime number");
  }
}
