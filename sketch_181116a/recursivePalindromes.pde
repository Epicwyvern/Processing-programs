class RecursivePalindromesCalculator {

  String text;
  String reverse;
  String textFinal;
  String reverseFinal;
  boolean palindrome;


  RecursivePalindromesCalculator() {
  }



  boolean checkPalindrome (String  text) {    

    text = new String(text.toCharArray());
    reverse = new String(reverse(text.toCharArray())); 


    textFinal= new String(text.replaceAll("[^A-Z]", "").toLowerCase());
    reverseFinal= new String(reverse.replaceAll("[^A-Z]", "").toLowerCase());



    if (textFinal.length()==1 || textFinal.length()==0) {
      palindrome=true;
    }

    if (textFinal.length()>1) {
      if (reverseFinal.equals(textFinal)) {

        palindrome=true;
      }

      if (reverseFinal.equals(textFinal)==false) {

        palindrome=false;
      }
    }


    return palindrome;
  }



  void printOut() { 

    println(palindrome);
  }
}