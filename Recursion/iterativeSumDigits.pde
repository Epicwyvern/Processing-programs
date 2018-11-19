class IterativeSumDigitsCalculator {


  int sum;


  IterativeSumDigitsCalculator() {
  }


  void sumOfDigits(int num) {

    sum=0;

    while (num > 0) {
      sum = sum + num % 10;  // gives us the right most digit
      num = num / 10; // removes the right most digit
    }
    println(sum);
  }
}