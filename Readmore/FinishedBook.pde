/**
 * FinishedBook
 *
 * @author      Aman Shahid
 * @version     1.0                 
 * @since       1.0          
 *
 * This is an extended book, specifying a date on which the book was completed                        
 *
 */


class FinishedBook extends Book {
  int dateFinished;
  int monthFinished;
  int yearFinished;

  FinishedBook(String Title, String Author, int dateStarted, int monthStarted, int yearStarted, int dateFinished, int monthFinished, int yearFinished) {
    super(Title, Author, dateStarted, monthStarted, yearStarted);
    this.dateFinished = dateFinished;
    this.monthFinished = monthFinished;
    this.yearFinished = yearFinished;
  }
}