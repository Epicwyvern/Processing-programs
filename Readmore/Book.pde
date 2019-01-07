/**
 * Book
 *
 * @author      Aman Shahid
 * @version     1.0                 
 * @since       1.0          
 *
 * This is a class used for books                         
 *
 */

abstract class Book {
  String Title;
  String Author;
  int dateStarted;
  int monthStarted;
  int yearStarted;
 
  Book(String Title, String Author, int dateStarted, int monthStarted, int yearStarted) {
    this.Title = Title;
    this.Author = Author;
    this.dateStarted = dateStarted;
    this.monthStarted = monthStarted;
    this.yearStarted = yearStarted;
  }
} 