/**
 * UnfinishedBook
 *
 * @author      Aman Shahid
 * @version     1.0                 
 * @since       1.0          
 *
 * This is a basic book class, which has not yet been completed              
 *
 */


class UnfinishedBook extends Book {


  UnfinishedBook(String Title, String Author, int dateStarted, int monthStarted, int yearStarted) {
    super(Title, Author, dateStarted, monthStarted, yearStarted);

  }



String toString() {
    return super.toString();
  }
}