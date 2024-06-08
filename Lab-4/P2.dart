double findMax(double a, double b) {
  return (a > b) ? a : b;
}

void main() {
  double num1 = 10;
  double num2 = 20;

  double max = findMax(num1, num2);
  print("Maximum number is: $max");
}
