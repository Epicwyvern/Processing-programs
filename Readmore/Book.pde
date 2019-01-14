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

class Book {
  String title;
  String author;
  int dateStarted;
  int monthStarted;
  int yearStarted;
 
  Book(String title, String author, int dateStarted, int monthStarted, int yearStarted) {
    this.title = title;
    this.author = author;
    this.dateStarted = dateStarted;
    this.monthStarted = monthStarted;
    this.yearStarted = yearStarted;
  }
} 