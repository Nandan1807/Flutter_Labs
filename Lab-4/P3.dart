void generateFibonacci({required int n}) {
  int a = 0, b = 1, next;

  print("Fibonacci series of $n numbers:");
  for (int i = 0; i < n; i++) {
    print(a);
    next = a + b;
    a = b;
    b = next;
  }
}

void main() {
  int n = 10;

  generateFibonacci(n: n);
}
