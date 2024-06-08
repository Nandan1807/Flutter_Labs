double calculateSimpleInterest({required double principal, required double rate, required double time}) {
  return (principal * rate * time) / 100;
}

void main() {
  double principal = 1000;
  double rate = 5;
  double time = 2;

  double interest = calculateSimpleInterest(principal: principal, rate: rate, time: time);
  print("Simple Interest is: $interest");
}
