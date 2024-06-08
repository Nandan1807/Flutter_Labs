void countEvenOdd({required List<int> numbers}) {
  int evenCount = 0;
  int oddCount = 0;

  for (int num in numbers) {
    if (num % 2 == 0) {
      evenCount++;
    } else {
      oddCount++;
    }
  }

  print("Number of even numbers: $evenCount");
  print("Number of odd numbers: $oddCount");
}

void main() {
  List<int> numbers = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];

  countEvenOdd(numbers: numbers);
}
