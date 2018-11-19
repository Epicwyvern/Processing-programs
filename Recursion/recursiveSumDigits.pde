class RecursiveSumDigitsCalculator {


  int sum;


  RecursiveSumDigitsCalculator() {
  }


  int sumOfDigits(int num) {

    sum=0;

    if (num==0) {

      sum=0;
    } 

    if (num!=0) {

      sum = num % 10 + sumOfDigits(num / 10);
    }

    return sum;
  }


  void printOut() { 

    println(sum);
  }
}