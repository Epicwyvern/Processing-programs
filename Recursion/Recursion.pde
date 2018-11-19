IterativeSumDigitsCalculator iterativeSumDigits;
RecursiveSumDigitsCalculator recursiveSumDigits;
RecursivePalindromesCalculator recursivePalindromes;




void settings () {
}


void setup () {

  iterativeSumDigits = new IterativeSumDigitsCalculator();
  recursiveSumDigits = new RecursiveSumDigitsCalculator();
  recursivePalindromes = new RecursivePalindromesCalculator();
  /*---------------------------------------------------------------------------------------*/

  iterativeSumDigits.sumOfDigits(1221);

  /*---------------------------------------------------------------------------------------*/

  recursiveSumDigits.sumOfDigits(2112);
  recursiveSumDigits.printOut();

  /*---------------------------------------------------------------------------------------*/

  recursivePalindromes.checkPalindrome("raceCar");
  recursivePalindromes.printOut();

  /*---------------------------------------------------------------------------------------*/
}