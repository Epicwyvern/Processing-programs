/**
 * Common pitfalls of Recursion
 *
 * 1. recursive methods must follow a specific order to function (, 
 * otherwise they wont work. ( can not call recursive at the start).
 * 
 * 2. The stack increases with each recursive call, and can cause stack crashes and overflow errors if 
 * the recursion is not implemented properly.    
 *
 * 3. recursion usually takes more memory than iterative methods while also being slower than iterative methods.
 * 
 * for this reason it is recommended to only use recursion when it comes naturally, 
 * rather than turning a conveniant iterative method into recursive
 *
 */


RecursiveSumDigitsCalculator recursiveSumDigits;
RecursivePalindromesCalculator recursivePalindromes;




void settings () {
}


void setup () {
  
  // I am running all recursive functions in setup as I only want them to run once


  recursiveSumDigits = new RecursiveSumDigitsCalculator();
  recursivePalindromes = new RecursivePalindromesCalculator();
  /*---------------------------------------------------------------------------------------*/

  recursiveSumDigits.sumOfDigits(2112);
  recursiveSumDigits.printOut();

  /*---------------------------------------------------------------------------------------*/

  recursivePalindromes.checkPalindrome("raceCar");

  /*---------------------------------------------------------------------------------------*/
}