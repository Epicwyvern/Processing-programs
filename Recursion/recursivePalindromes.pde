class RecursivePalindromesCalculator {








  RecursivePalindromesCalculator() {
  }



  boolean checkPalindrome (String  text) {    

    text = new String(text.toCharArray());
    String reverse = new String(reverse(text.toCharArray())); 


    String textFinal= new String(text.replaceAll("[^A-Z]", "").toLowerCase());
    String reverseFinal= new String(reverse.replaceAll("[^A-Z]", "").toLowerCase());

    boolean palindrome=false;


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

    println(palindrome);
    return palindrome;
  }
}