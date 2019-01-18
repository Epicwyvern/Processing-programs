import controlP5.*;


ControlP5 cp5;
ControlP5 cp5s2;
ControlP5 cp5s3;
ControlP5 cp5s4;
ControlP5 cp5s5;
ControlP5 cp5s6;
ControlP5 cp5s6b;
ControlP5 cp5s6c;
ControlP5 cp5s7;

String [] bookmarks;
String [] bookmarksTitleSort;
String [] bookmarksAuthorSort;
String [] bookmarksPageSort;
String [] bookmarkSections = {"0", "Title", "Author", "Page"};
String newestBookmark;
String bookmarkSection;
int bookmarkSectionIndex;
String selectedBookmark;
String [] bookmarkList;


String [] log;
String [] bookStrings;
Book [] books; 
Book newestBook;
String newestBookString;
String [] booksTitleSort;
String [] booksAuthorSort;
String [] booksStartDateSort;
int bookSectionIndex;
String selectedBook;
String [] bookList;

String [] finishedBooksLog;
String [] finishedBooksTitleSort;
String [] finishedBooksAuthorSort;
String [] finishedBooksStartDateSort;
String [] finishedBooksEndDateSort;


PImage background;
PImage title;
PImage info;
PImage booklog;
PImage bookmark;
PImage returnMenu;
PImage cog;
PImage settingsTitle;
PImage backgroundLow;
PImage backgroundHigh;
PImage faststartOn;
PImage faststartOff;
PImage borderOn;
PImage borderOff;
PImage bookmarksTitle;
PImage addBookmark;
PImage viewBookmarks;
PImage textColor;
PImage textColorTitle;
PImage resetTextColor;
PImage applyTextColor;
PImage addBookmarksTitle;
PImage saveBookmarks;
PImage scroll;
PImage viewBookmarksTitle;
PImage bookmarkSortPage;
PImage bookmarkSortTitle;
PImage bookmarkSortAuthor;
PImage search;
PImage newestFirst;
PImage deleteBookmark;
PImage editBookmark;
PImage editBookmarksTitle; 
PImage divider;
PImage booksTitle;
PImage addBooks;
PImage manageBooks;
PImage bookSortStartDate;
PImage bookSortEndDate;
PImage editBook;
PImage deleteBook;
PImage addBookTitle; 
PImage viewBookTitle;
PImage markComplete;
PImage viewComplete;
PImage completedBooksTitle;
PImage saveBook;
PImage editBookTitle;





PFont font;
PFont font4;

float titleTransparency;
float buttonSpeed;
float buttonTransparency;



int bookmarkState;
int logState;
int infoState;
int settingsState;


boolean faststart;
boolean backgroundImage;
boolean borders;


ColorPicker colorPicker;


boolean newest;




void settings () {
  fullScreen(P2D);
}

void setup () {




  log = loadStrings("books.txt"); 
  books = new Book [log.length];
  bookStrings = new String [log.length];


  for (int i = 0; i < log.length; i++) {

    String[] bookParam = log[i].split(",");

    String [] bookDates = bookParam[2].split("/");

    books[i] = new Book(bookParam[0], bookParam[1], int(bookDates[0]), int(bookDates[1]), int(bookDates[2]));

    bookStrings[i] = books[i].title.toString() + "," + books[i].author.toString() + "," + int(books[i].dateStarted) + "/" + int(books[i].monthStarted) + "/" + int(books[i].yearStarted);
  }



  font = createFont ("font.ttf", 50);
  font4 = createFont("font.ttf", 35);

  PFont font2 = createFont("font.ttf", 50);
  PFont font3 = createFont("times.ttf", 20);
  PFont font5 = createFont("font.ttf", 30);


  cp5 = new ControlP5(this);
  cp5s2 = new ControlP5(this);
  cp5s3 = new ControlP5(this);
  cp5s4 = new ControlP5(this);
  cp5s5 = new ControlP5(this);
  cp5s6 = new ControlP5(this);
  cp5s6b = new ControlP5(this);
  cp5s6c = new ControlP5(this);
  cp5s7 = new ControlP5(this);


  bookmarks = loadStrings("bookmark.txt"); 
  bookmarksTitleSort = loadStrings("bookmark_titlesort.txt");
  bookmarksAuthorSort = loadStrings("bookmark_authorsort.txt");
  bookmarksPageSort = loadStrings("bookmark_pagesort.txt");


  bookmarkSectionIndex = -1;
  bookmarkSection = join(bookmarks, ",");
  selectedBookmark = null;
  bookmarkList = null;


  bookSectionIndex = -1;
  booksTitleSort = loadStrings("books_titlesort.txt");
  booksAuthorSort = loadStrings("books_authorsort.txt");
  booksStartDateSort = loadStrings("books_startdatesort.txt");







  finishedBooksTitleSort = loadStrings("finishedbooks_titlesort.txt");
  finishedBooksAuthorSort = loadStrings("finishedbooks_authorsort.txt");
  finishedBooksStartDateSort = loadStrings("finishedbooks_startdatesort.txt");
  finishedBooksEndDateSort = loadStrings("finishedbooks_enddatesort.txt");


  colorPicker = cp5s2.addColorPicker("picker")
    .setPosition(width/2.3, height/2.5)
    .setColorValue(color(0, 0, 0, 255))
    .setWidth(0)
    ;    


  colorPicker.hide();


  cp5.addTextfield("Book Title")
    .setPosition(width/6, height/2)
    .setColorBackground(#B5882B)
    .setColor(#000000)
    .setSize(600, 80)
    .setFont(font2)
    .setFocus(true)
    .hide()
    ;
  cp5.getController("Book Title").getCaptionLabel().setColor(color(0, 0, 0));


  cp5.addTextfield("Author Name")
    .setPosition(width/6, height/1.5)
    .setColorBackground(#B5882B)
    .setColor(#000000)
    .setSize(600, 80)
    .setFont(font2)
    .setFocus(true)
    .hide()
    ;
  cp5.getController("Author Name").getCaptionLabel().setColor(color(0, 0, 0));


  cp5.addTextfield("Page Number")
    .setPosition(width/1.5, height/1.8)
    .setColorBackground(#B5882B)
    .setColor(#000000)
    .setSize(200, 80)
    .setFont(font2)
    .setFocus(true)
    .setInputFilter(ControlP5.INTEGER)
    .hide()
    ;
  cp5.getController("Page Number").getCaptionLabel().setColor(color(0, 0, 0));


  cp5s3.addScrollableList("Title_Author_Page")
    .setPosition(width/2.925, height/2.2-50)
    .setColorBackground(#DFB760)
    .setColorForeground(#B5882B)
    .setColorActive(#B5882B)
    .setSize(600, 400)
    .setFont(font3)
    .setBarHeight(50)
    .setItemHeight(50)
    .addItems(bookmarks)
    .setType(ControlP5.LIST)
    .hide()
    .getCaptionLabel().toUpperCase(false) 
    ;
  cp5s3.get(ScrollableList.class, "Title_Author_Page").getValueLabel().toUpperCase(false);


  cp5s3.addTextfield("")
    .setPosition(width/2.925, height/3)
    .setColorBackground(#B5882B)
    .setColor(#000000)
    .setSize(500, 80)
    .setFont(font2)
    .setFocus(true)
    .hide()
    ;
  cp5s3.getController("").getCaptionLabel().setColor(color(0, 0, 0));


  cp5s4.addTextfield("New Book Title")
    .setPosition(width/2.35, height/2.5)
    .setColorBackground(#B5882B)
    .setColor(#000000)
    .setSize(600, 80)
    .setFont(font5)
    .setFocus(true)
    .hide()
    ;
  cp5s4.getController("New Book Title").getCaptionLabel().setColor(color(0, 0, 0));

  cp5s4.addTextfield("New Author Name")
    .setPosition(width/2.35, height/1.7)
    .setColorBackground(#B5882B)
    .setColor(#000000)
    .setSize(600, 80)
    .setFont(font5)
    .setFocus(true)
    .hide()
    ;
  cp5s4.getController("New Author Name").getCaptionLabel().setColor(color(0, 0, 0));


  cp5s4.addTextfield("New Page Number")
    .setPosition(width/1.25, height/2.0)
    .setColorBackground(#B5882B)
    .setColor(#000000)
    .setSize(200, 80)
    .setFont(font5)
    .setFocus(true)
    .setInputFilter(ControlP5.INTEGER)
    .hide()
    ;
  cp5s4.getController("New Page Number").getCaptionLabel().setColor(color(0, 0, 0));



  cp5s5.addTextfield("Title")
    .setPosition(width/6-200, height/2)
    .setColorBackground(#B5882B)
    .setColor(#000000)
    .setSize(600, 80)
    .setFont(font2)
    .setFocus(true)
    .hide()
    ;
  cp5s5.getController("Title").getCaptionLabel().setColor(color(0, 0, 0));


  cp5s5.addTextfield("Authors Name")
    .setPosition(width/6-200, height/1.5)
    .setColorBackground(#B5882B)
    .setColor(#000000)
    .setSize(600, 80)
    .setFont(font2)
    .setFocus(true)
    .hide()
    ;
  cp5s5.getController("Authors Name").getCaptionLabel().setColor(color(0, 0, 0));


  cp5s5.addTextfield("Date Started")
    .setPosition(width/1.6-350, height/1.75)
    .setColorBackground(#B5882B)
    .setColor(#000000)
    .setSize(200, 80)
    .setFont(font5)
    .setFocus(true)
    .setInputFilter(ControlP5.INTEGER)
    .hide()
    ;
  cp5s5.getController("Date Started").getCaptionLabel().setColor(color(0, 0, 0));


  cp5s5.addTextfield("Month Started")
    .setPosition(width/1.6, height/1.75)
    .setColorBackground(#B5882B)
    .setColor(#000000)
    .setSize(200, 80)
    .setFont(font5)
    .setFocus(true)
    .setInputFilter(ControlP5.INTEGER)
    .hide()
    ;
  cp5s5.getController("Month Started").getCaptionLabel().setColor(color(0, 0, 0));


  cp5s5.addTextfield("Year Started")
    .setPosition(width/1.6+350, height/1.75)
    .setColorBackground(#B5882B)
    .setColor(#000000)
    .setSize(200, 80)
    .setFont(font5)
    .setFocus(true)
    .setInputFilter(ControlP5.INTEGER)
    .hide()
    ;
  cp5s5.getController("Year Started").getCaptionLabel().setColor(color(0, 0, 0));


  cp5s6.addScrollableList("Title_Author_DateStarted")
    .setPosition(width/2.925, height/2.2-50)
    .setColorBackground(#DFB760)
    .setColorForeground(#B5882B)
    .setColorActive(#B5882B)
    .setSize(600, 400)
    .setFont(font3)
    .setBarHeight(50)
    .setItemHeight(50)
    .addItems(bookStrings)
    .setType(ControlP5.LIST)
    .hide()
    .getCaptionLabel().toUpperCase(false) 
    ;
  cp5s6.get(ScrollableList.class, "Title_Author_DateStarted").getValueLabel().toUpperCase(false);

  cp5s6.addTextfield("")
    .setPosition(width/2.925, height/3)
    .setColorBackground(#B5882B)
    .setColor(#000000)
    .setSize(500, 80)
    .setFont(font2)
    .setFocus(true)
    .hide()
    ;
  cp5s6.getController("").getCaptionLabel().setColor(color(0, 0, 0));




  cp5s6b.addTextfield("New Title")
    .setPosition(width/2.35, height/2.5)
    .setColorBackground(#B5882B)
    .setColor(#000000)
    .setSize(600, 80)
    .setFont(font5)
    .setFocus(true)
    .hide()
    ;
  cp5s6b.getController("New Title").getCaptionLabel().setColor(color(0, 0, 0));


  cp5s6b.addTextfield("New Authors Name")
    .setPosition(width/2.35, height/1.7)
    .setColorBackground(#B5882B)
    .setColor(#000000)
    .setSize(600, 80)
    .setFont(font5)
    .setFocus(true)
    .hide()
    ;
  cp5s6b.getController("New Authors Name").getCaptionLabel().setColor(color(0, 0, 0));


  cp5s6b.addTextfield("New Date Started")
    .setPosition(width/1.25-30, height/3)
    .setColorBackground(#B5882B)
    .setColor(#000000)
    .setSize(200, 80)
    .setFont(font5)
    .setFocus(true)
    .setInputFilter(ControlP5.INTEGER)
    .hide()
    ;
  cp5s6b.getController("New Date Started").getCaptionLabel().setColor(color(0, 0, 0));


  cp5s6b.addTextfield("New Month Started")
    .setPosition(width/1.25-30, height/2.0)
    .setColorBackground(#B5882B)
    .setColor(#000000)
    .setSize(200, 80)
    .setFont(font5)
    .setFocus(true)
    .setInputFilter(ControlP5.INTEGER)
    .hide()
    ;
  cp5s6b.getController("New Month Started").getCaptionLabel().setColor(color(0, 0, 0));


  cp5s6b.addTextfield("New Year Started")
    .setPosition(width/1.25-30, height/1.5)
    .setColorBackground(#B5882B)
    .setColor(#000000)
    .setSize(200, 80)
    .setFont(font5)
    .setFocus(true)
    .setInputFilter(ControlP5.INTEGER)
    .hide()
    ;
  cp5s6b.getController("New Year Started").getCaptionLabel().setColor(color(0, 0, 0));








  cp5s6c.addTextfield("Date Finished")
    .setPosition(width/2.4, height/2)
    .setColorBackground(#B5882B)
    .setColor(#000000)
    .setSize(200, 80)
    .setFont(font5)
    .setFocus(true)
    .setInputFilter(ControlP5.INTEGER)
    .hide()
    ;
  cp5s6c.getController("Date Finished").getCaptionLabel().setColor(color(0, 0, 0));


  cp5s6c.addTextfield("Month Finished")
    .setPosition(width/1.7, height/2.0)
    .setColorBackground(#B5882B)
    .setColor(#000000)
    .setSize(200, 80)
    .setFont(font5)
    .setFocus(true)
    .setInputFilter(ControlP5.INTEGER)
    .hide()
    ;
  cp5s6c.getController("Month Finished").getCaptionLabel().setColor(color(0, 0, 0));


  cp5s6c.addTextfield("Year Finished")
    .setPosition(width/1.25-30, height/2)
    .setColorBackground(#B5882B)
    .setColor(#000000)
    .setSize(200, 80)
    .setFont(font5)
    .setFocus(true)
    .setInputFilter(ControlP5.INTEGER)
    .hide()
    ;
  cp5s6c.getController("Year Finished").getCaptionLabel().setColor(color(0, 0, 0));








  cp5s7.addScrollableList("Title_Author_DateStarted_DateFinished")
    .setPosition(width/2.925, height/2.2-50)
    .setColorBackground(#DFB760)
    .setColorForeground(#B5882B)
    .setColorActive(#B5882B)
    .setSize(600, 400)
    .setFont(font3)
    .setBarHeight(50)
    .setItemHeight(50)
    //.addItems(finishedBooksLog)
    .setType(ControlP5.LIST)
    .hide()
    .getCaptionLabel().toUpperCase(false) 
    ;
  cp5s7.get(ScrollableList.class, "Title_Author_DateStarted_DateFinished").getValueLabel().toUpperCase(false);

  cp5s7.addTextfield("")
    .setPosition(width/2.925, height/3)
    .setColorBackground(#B5882B)
    .setColor(#000000)
    .setSize(500, 80)
    .setFont(font2)
    .setFocus(true)
    .hide()
    ;
  cp5s7.getController("").getCaptionLabel().setColor(color(0, 0, 0));





  frameRate(100);

  background = loadImage ("background.jpg");
  title = loadImage ("title.png");
  info = loadImage ("infobutton.png");
  booklog = loadImage ("logbutton.png");
  bookmark = loadImage ("top10button.png");
  returnMenu = loadImage ("return.png");
  cog = loadImage ("settings.png");
  settingsTitle = loadImage("settingstitle.png");
  backgroundLow = loadImage("backgroundlow.png");
  backgroundHigh = loadImage("backgroundhigh.png");
  borderOn = loadImage("borderon.png");
  borderOff = loadImage("borderoff.png");
  faststartOn = loadImage("faststarton.png");
  faststartOff = loadImage("faststartoff.png");
  bookmarksTitle = loadImage("bookmarkstitle.png");
  addBookmark = loadImage("addbookmark.png");
  viewBookmarks = loadImage("viewbookmarks.png");
  textColor = loadImage("textcolor.png");
  textColorTitle = loadImage("textcolortitle.png");
  resetTextColor = loadImage("resettextcolor.png");
  applyTextColor = loadImage("applytextcolor.png");
  addBookmarksTitle = loadImage("addbookmarkstitle.png");
  saveBookmarks = loadImage("savebookmark.png");
  scroll = loadImage("scroll.png");
  viewBookmarksTitle = loadImage("Viewbookmarkstitle.png");
  bookmarkSortPage = loadImage("sortpagenumber.png");
  bookmarkSortTitle = loadImage("bookmarksorttitle.png");
  bookmarkSortAuthor = loadImage("bookmarksortauthor.png");
  search =  loadImage("search.png");
  newestFirst = loadImage("newestfirst.png");
  deleteBookmark = loadImage("deletebookmark.png");
  editBookmark = loadImage("editbookmark.png");
  editBookmarksTitle = loadImage("editbookmarktitle.png");
  divider = loadImage("divider.png");
  booksTitle = loadImage("booktitle.png");
  addBooks = loadImage("addbook.png");
  manageBooks = loadImage("managebooks.png");
  bookSortStartDate = loadImage("booksortstartdate.png");
  bookSortEndDate = loadImage("booksortenddate.png");
  editBook = loadImage("editbook.png");
  deleteBook = loadImage("deletebook.png");
  addBookTitle = loadImage("addbooktitle.png");
  viewBookTitle = loadImage("viewbookstitle.png");
  markComplete = loadImage("markcomplete.png");
  viewComplete = loadImage("viewfinishedbooks.png");
  completedBooksTitle = loadImage("finishedbookstitle.png");
  saveBook = loadImage("savebook.png");
  editBookTitle = loadImage("editbooktitle.png");




  bookmarkState = 0;
  logState = 0;
  infoState = 0;
  settingsState = 0;


  titleTransparency = 0;
  buttonTransparency = 0;
  buttonSpeed = height;


  faststart = true;
  backgroundImage = true;
  borders = true;

  newest = false;
}

void draw () {

  if (backgroundImage==true) {
    Background();
  }

  if (backgroundImage==false) {
    background(223, 195, 123);
  }  

  if (borders==true) {
    border();
  }



  textAlign(LEFT);

  if (bookmarkState==0 && logState==0 && infoState==0 && settingsState==0) {
    Title();
    infoButton();
    logButton();
    bookmarkButton();
    menuInformation();
    settingsButton();
  }


  if (infoState==1 || bookmarkState==1 || logState==1 || settingsState==1) {
    returnMenu();
  }


  if (infoState==1) {
    infoScreen();
  }

  if (settingsState==1) {
    settingsScreen();
  }

  if (settingsState==2) {
    textColorMenu();
  }

  if (bookmarkState==1) {
    bookmarkScreen();
  }

  if (bookmarkState==2) {
    addBookmarks();
    return2Menu();
  }

  if (bookmarkState==3) {
    viewBookmarks();
    return2Menu();
  }

  if (bookmarkState==4) {
    editBookmarks();
    return3Menu();
  }


  if (logState==1) {
    logScreen();
  }   

  if (logState==2) {
    return2Menu();
    addBooksScreen();
  }  

  if (logState==3) {
    return2Menu();
    viewBooksScreen();
  }

  if (logState==4) {
    return3Menu();
    editBooks();
  }

  if (logState==5) {
    return3Menu();
    markComplete();
  }

  if (logState==6) {
    return2Menu();
    viewFinishedBooks();
  }
}




/**
 * Background
 *
 * This is a function for the background image of the program.    
 */


void Background () {
  image(background, 0, 0, width, height);
}


/**
 * Title
 *
 * This is a function for the main menu title of the program.    
 */


void Title () {

  tint(255, titleTransparency);
  image(title, width/3.764705882, height/10.5);

  if (faststart==false) {
    titleTransparency += 2;
  }
}


/**
 * infoButton
 *
 * This is a function for the button that takes you to the info screen    
 */


void infoButton () {

  tint(255, buttonTransparency);
  image(info, width/5.647058824, buttonSpeed);
}


/**
 * logButton
 *
 * This is a function for the button that takes you to the booklog screen    
 */


void logButton () {

  tint(255, buttonTransparency);
  image(booklog, width/2.37037037, buttonSpeed-20);
}


/**
 * bookmarkButton
 *
 * This is a function for the button that takes you to the bookmarks screen    
 */


void bookmarkButton () {

  tint(255, buttonTransparency);
  image(bookmark, width/1.5, buttonSpeed);
}


/**
 * menuInformation
 *
 * This is a function that controls text prompts on the munu screen, as well as the startup fade effect
 */


void menuInformation () {

  if (titleTransparency>254) {
    if (faststart==false) {
      buttonTransparency += 2.5;
      if (buttonSpeed>height/2) {
        buttonSpeed -= 4;
      }
    }
  }

  if (faststart==true) {

    titleTransparency=255;
    buttonTransparency=255;
    buttonSpeed=height/2;
  }

  if (buttonSpeed<=height/2) {

    if (mouseX > width/1.5+25 && mouseX < width/1.5+250 && mouseY > height/2+25 && mouseY < height/2+250) {
      fill(colorPicker.getColorValue());
      textFont(font);
      text("Click here to view your bookmarks", 20, height-40);
    }

    if (mouseX > width/5.647058824+25 && mouseX < width/5.647058824+250 && mouseY > height/2+25 && mouseY < height/2+250) {
      fill(colorPicker.getColorValue());   
      textFont(font);
      text("Click here for more information on ReadMore", 20, height-40);
    }

    if (mouseX > width/2.37037037+25 && mouseX < width/2.37037037+250 && mouseY > height/2+25 && mouseY < height/2+250) {
      fill(colorPicker.getColorValue());
      textFont(font);
      text("Click here to create and manage your book log", 20, height-40);
    }

    if (mouseX > width/1.2 && mouseX < width/1.2+421 && mouseY > 0 && mouseY < 324) {

      fill(colorPicker.getColorValue());
      textFont(font);
      text("Click here to manage your program preferences", 20, height-40);
    }
  }
}


/**
 * border
 *
 * This is a function used to draw the programs borders  
 */


void border () {

  strokeWeight(30);
  stroke(0);
  line(0, 0, width, 0);
  line(0, 0, 0, height);
  line(0, height, width, height);
  line(width, 0, width, height);
}


/**
 * returnMenu
 *
 * This is a function that draws the return button to the main menu when necessary   
 */


void returnMenu() {

  image(returnMenu, width/38.4, height/21.6, 70, 70);



  if (mouseX > width/38.4 && mouseX < width/38.4+70 && mouseY > height/21.6 && mouseY < height/21.6+70) {
    fill(colorPicker.getColorValue());
    textFont(font);
    text("Click here to return to the main menu", 20, height-40);
  }
}


/**
 * return2Menu
 *
 * This is a function that draws the return button back to the first state screens when necessary   
 */


void return2Menu() {

  image(returnMenu, width/38.4, height/21.6, 70, 70);



  if (mouseX > width/38.4 && mouseX < width/38.4+70 && mouseY > height/21.6 && mouseY < height/21.6+70) {
    fill(colorPicker.getColorValue());
    textFont(font);
    text("Click here to return to the previous menu", 20, height-40);
  }
}


/**
 * return3Menu
 *
 * This is a function that draws the return button back to the second state screens when necessary   
 */


void return3Menu() {

  image(returnMenu, width/38.4, height/21.6, 70, 70);



  if (mouseX > width/38.4 && mouseX < width/38.4+70 && mouseY > height/21.6 && mouseY < height/21.6+70) {
    fill(colorPicker.getColorValue());
    textFont(font);
    text("Click here to return to the previous menu", 20, height-40);
  }
}



/**
 * infoScreen
 *
 * This is a function that displays the information screen when the particular switch is activated  
 */

void infoScreen () {

  fill(colorPicker.getColorValue());
  textAlign(CENTER);
  textFont(font);


  textMode(SHAPE);
  textSize(100);
  text("ReadMore", width/2, height/5.4);

  textMode(MODEL);
  textSize(50);
  text("Readmore is a freeware application that helps \n people log and record all of the books they \n have read over time. it can help keep track of books \n you have finished, books you have not finished and can also help keep \n track of books you are currently reading with bookmarks", width/2, height/2.7);

  textMode(MODEL);
  textSize(35);
  text("Design and Code by Aman Shahid \n Processing 3.0 (Java) was used to \n create this application", width/2, height/1.22727272727);
}


/**
 * settingsButton
 *
 * This is a function that displays the settings button that can be contrrolled via a switch  
 */

void settingsButton () {

  image(cog, width/1.2, 0);
}


/**
 * settingsScreen
 *
 * This is a function that displays the settings screen when the particular switch is activated. 
 */

void settingsScreen() {

  image(settingsTitle, width/3.764705882, height/19.5);


  if (backgroundImage==true) {

    image(backgroundHigh, width/5.647058824+70, height/2);
  }

  if (backgroundImage==false) {

    image(backgroundLow, width/5.647058824+70, height/1.4);
  }


  if (borders==true) {

    image(borderOn, width/2.37037037+70, height/2);
  }

  if (borders==false) {

    image(borderOff, width/2.37037037+70, height/1.4);
  }


  if (faststart==true) {

    image(faststartOn, width/1.5+70, height/2);
  }

  if (faststart==false) {

    image(faststartOff, width/1.5+70, height/1.4);
  } 

  image(textColor, width/2.37037037+70, height/3);
}


/**
 * textColorMenu
 *
 * This is a function that displays the text color selector when the switch is activated in the settings screen 
 */

void textColorMenu () {

  image(textColorTitle, width/3.764705882, height/19.5);
  image(resetTextColor, width/5.647058824+70, height/1.2);
  image(applyTextColor, width/1.5+70, height/1.2);

  noStroke();

  fill(0, 80);
  rect(width/2.3-10, height/2.5-10, 275, 70);

  colorPicker.show();
  fill(colorPicker.getColorValue());
  textSize(50);
  textAlign(CENTER);
  text("The quick brown Fox jumps over the lazy dog \n Darker Colors Are Recommended! ", width/2, height/1.5);
}



/**
 * bookmarkScreen
 *
 * This is a function that displays the bookmarks hub when the switch is activated in the main menu 
 */


void bookmarkScreen () {

  image(bookmarksTitle, width/3.764705882, height/10.5);
  image(addBookmark, width/5.647058824+70, height/2);
  image(viewBookmarks, width/1.5+70, height/2);
}

/**
 * addBookmarks
 *
 * This is a function that displays the add bookmarks page when the switch is activated in bookmarks hub 
 */

void addBookmarks () {

  image(saveBookmarks, width/2.2, height/1.2);
  image(addBookmarksTitle, width/3.764705882, height/10.5);
  cp5.get(Textfield.class, "Book Title").show();
  cp5.get(Textfield.class, "Page Number").show();
  cp5.get(Textfield.class, "Author Name").show();



  textAlign(CENTER);
  fill(colorPicker.getColorValue());
  text("Each field must contain data to save bookmarks", width/2, height/2.5);
  textAlign(LEFT);
}


/**
 * Title_Authour_Page
 *
 * This is a special function that is used to communicate with the controlP5 scrollable list (in this case the bookmarks list)
 *
 *
 *
 * @param  n  The selected index entry of the scrollable list 
 *
 */


void Title_Author_Page (int n) {

  bookmarkSectionIndex=n;

  selectedBookmark = cp5s3.get(ScrollableList.class, "Title_Author_Page").getItem(n).get("name").toString();
  bookmarkList = split(selectedBookmark, ",");
}


/**
 * viewBookmarks
 *
 * This is a function that displays the bookmarks list and some actions you can take once the switch is activated in the bookmarks hub 
 */


void viewBookmarks () {

  image(scroll, width/3.764705882, height/21.6);
  image(viewBookmarksTitle, width/2.612244898, height/5.2, viewBookmarksTitle.width/2, viewBookmarksTitle.height/2);
  image(bookmarkSortPage, width/1.15, height/5.2);
  image(bookmarkSortTitle, width/1.15, height/2.649056604);
  image(bookmarkSortAuthor, width/1.15, height/1.77721519);
  image(search, width/1.627118644, height/3+20, 50, 50);
  image(newestFirst, width/1.4, height/5.2);
  image(deleteBookmark, width/38.4, height/1.77721519);
  image(editBookmark, width/6.981818182, height/1.77721519);


  cp5s3.get(ScrollableList.class, "Title_Author_Page").show();
  cp5s3.get(Textfield.class, "").show();

  textFont(font4);

  if (selectedBookmark != null) {
    text("Title: " + bookmarkList[0], 50, 300);
    text("Author: " + bookmarkList[1], 50, 400);
    text("Page Number: " + bookmarkList[2], 50, 500);
  }
}



/**
 * editBookmarks
 *
 * This is a function that displays the edit bookmarks screen page when the switch is activated in the manage bookmarks page
 */


void editBookmarks () {

  image(saveBookmarks, width/2.2, height/1.2);
  image(editBookmarksTitle, width/3.764705882, height/99.5);
  image(divider, width/4+50, height/2.5);

  cp5s4.get(Textfield.class, "New Book Title").show();
  cp5s4.get(Textfield.class, "New Page Number").show();
  cp5s4.get(Textfield.class, "New Author Name").show();

  textFont(font);

  text("Current Bookmark", width/15, height/2-170);
  text("New Bookmark", width/2.35, height/2-170);


  textFont(font4);


  if (bookmarkSectionIndex>=0) {
    text("Title: " + bookmarkList[0], width/10, height/2-70);
    text("Author: " + bookmarkList[1], width/10, height/2+30);
    text("Page Number: " + bookmarkList[2], width/10, height/2+130);
  }
}



/**
 * logScreen
 *
 * This is a function that displays the booklog hub once the switch is activated in the main menu
 */

void logScreen() {

  image(booksTitle, width/3.764705882-40, height/9);
  image(addBooks, width/5.647058824+70, height/2);
  image(viewComplete, width/1.5+70, height/2);
  image(manageBooks, width/2-87.5, height/2);
}


/**
 * addBooksScreen
 *
 * This is a function that displays the add books page when the switch is activated in the booklog hub 
 */

void addBooksScreen() {

  image(saveBook, width/2.2, height/1.2);
  image(addBookTitle, width/3.764705882, height/10.5);

  cp5s5.show();

  textAlign(CENTER);
  fill(colorPicker.getColorValue());
  text("Each field must contain data to save books", width/2, height/2.5);
  textAlign(LEFT);
}



/**
 * Title_Authour_DateStarted
 *
 * This is a special function that is used to communicate with the controlP5 scrollable list (in this case the unfinished books list)
 *
 *
 *
 * @param  n  index of the selected entry of the scrollable list 
 *
 */

void Title_Author_DateStarted (int n) {

  bookSectionIndex=n;

  selectedBook = cp5s6.get(ScrollableList.class, "Title_Author_DateStarted").getItem(n).get("name").toString();
  bookList = split(selectedBook, ",");
}

/**
 * viewBooksScreen
 *
 * This is a function that displays the view unfinished books screen once the switch is activated in the booklog hub
 *
 */


void viewBooksScreen() {

  image(scroll, width/3.764705882, height/21.6);
  image(viewBookTitle, width/2.612244898, height/5.2, viewBookmarksTitle.width/2, viewBookmarksTitle.height/2);
  image(bookSortStartDate, width/1.4, height/5.2);
  image(bookmarkSortAuthor, width/1.15, height/5.2);
  image(bookmarkSortTitle, width/1.15, height/2.649056604);
  image(search, width/1.627118644, height/3+20, 50, 50);
  image(newestFirst, width/1.4, height/2.649056604);
  image(deleteBook, width/38.4, height/1.77721519);
  image(editBook, width/6.981818182, height/1.77721519);
  image(markComplete, width/38.4+110, height/1.77721519+150);


  cp5s6.show();

  textFont(font4);

  if (selectedBook != null) {
    text("Title: " + bookList[0], 50, 300);
    text("Author: " + bookList[1], 50, 400);
    text("Date Started: " + bookList[2], 50, 500);
  }
}


/**
 * viewFinishedBooks
 *
 * This is a function that displays the finished books log once the switch is activated in the booklog hub
 */


void viewFinishedBooks() {

  image(scroll, width/3.764705882, height/21.6);
  image(completedBooksTitle, width/2.612244898, height/5.2, viewBookmarksTitle.width/2, viewBookmarksTitle.height/2);
  image(bookSortStartDate, width/1.4, height/5.2);
  image(bookSortEndDate, width/1.15, height/5.2);
  image(bookmarkSortTitle, width/1.15, height/2.649056604);
  image(bookmarkSortAuthor, width/1.15, height/1.77721519);  
  image(search, width/1.627118644, height/3+20, 50, 50);
  image(newestFirst, width/1.4, height/2.649056604);
  image(deleteBook, width/38.4, height/1.77721519);
  image(editBook, width/6.981818182, height/1.77721519);


  cp5s7.show();
}


/**
 * editBooks
 *
 * This is a function that displays the edit books screen once the switch is activated in the unfinished books log
 */


void editBooks () {

  image(saveBook, width/2.2, height/1.2);
  image(editBookTitle, width/3.764705882, height/99.5);
  image(divider, width/4+50, height/2.5);

  cp5s6b.get(Textfield.class, "New Title").show();  
  cp5s6b.get(Textfield.class, "New Authors Name").show();
  cp5s6b.get(Textfield.class, "New Date Started").show();
  cp5s6b.get(Textfield.class, "New Month Started").show();
  cp5s6b.get(Textfield.class, "New Year Started").show();

  textFont(font);

  text("Current Book", width/15, height/2-170);
  text("New Book", width/2.35, height/2-170);


  textFont(font4);


  if (bookSectionIndex>=0) {
    text("Title: " + bookList[0], width/10, height/2-70);
    text("Author: " + bookList[1], width/10, height/2+30);
    text("Date Started: " + bookList[2], width/10, height/2+130);
  }
}




/**
 * markComplete
 *
 * This is a function that displays the mark compleye screen once the switch is activated in the unfinished books log
 */



void markComplete () {

  image(saveBook, width/2.2, height/1.2);
  image(editBookTitle, width/3.764705882, height/99.5);
  image(divider, width/4+50, height/2.5);

  cp5s6c.get(Textfield.class, "Date Finished").show();
  cp5s6c.get(Textfield.class, "Month Finished").show();
  cp5s6c.get(Textfield.class, "Year Finished").show();



  textFont(font);

  text("Current Book", width/15, height/2-170);
  text("Completion Date", width/2.35, height/2-170);


  textFont(font4);


  if (bookSectionIndex>=0) {
    text("Title: " + bookList[0], width/10, height/2-70);
    text("Author: " + bookList[1], width/10, height/2+30);
    text("Date Started: " + bookList[2], width/10, height/2+130);
  }
}










void mouseReleased () {


  //--------------------------------------------------------------------------------------------------------------
  //Below: main menu buttons only active if slow startup animation is complete ( already complete in fast startup)
  //--------------------------------------------------------------------------------------------------------------


  if (buttonSpeed<=height/2) {

    //------------------------------------------------------------------------------
    //Below: takes the user to the bookmarks screen from the main menu (in main menu)
    //------------------------------------------------------------------------------   


    if (mouseX > width/1.5+25 && mouseX < width/1.5+250 && mouseY > height/2+25 && mouseY < height/2+250 && logState==0 && infoState==0 && settingsState==0 && bookmarkState==0) {
      bookmarkState=1;
    }




    //---------------------------------------------------------------------------
    //Below: takes the user to the books screen from the main menu (in main menu)
    //---------------------------------------------------------------------------


    if (mouseX > width/2.37037037+25 && mouseX < width/2.37037037+250 && mouseY > height/2+25 && mouseY < height/2+250 && bookmarkState==0 && infoState==0 && settingsState==0 && logState<=0) {

      logState=1;
    }



    //--------------------------------------------------------------------------
    //Below: takes the user to the info screen from the main menu (in main menu)
    //--------------------------------------------------------------------------


    if (mouseX > width/5.647058824+25 && mouseX < width/5.647058824+250 && mouseY > height/2+25 && mouseY < height/2+250 && bookmarkState==0 && logState==0 && settingsState==0) {
      infoState=1;
    }




    //------------------------------------------------------------------------------
    //Below: takes the user to the settings screen from the main menu (in main menu)
    //------------------------------------------------------------------------------


    if (mouseX > width/1.2 && mouseX < width/1.2+421 && mouseY > 0 && mouseY < 324 && bookmarkState==0 && infoState==0 && logState==0) {
      settingsState=1;
    }





    //------------------------------------------------------------------------------------------------------------------------------------------------------------------------
    //Below: returns the user to the main menu from the books screen, the bookmarks screen, the info screen or the settings screen ( in all state 1 screens, to the main menu)
    //------------------------------------------------------------------------------------------------------------------------------------------------------------------------


    if (infoState==1 || bookmarkState==1 || logState==1 || settingsState==1) {

      if (mouseX > width/38.4 && mouseX < width/38.4+70 && mouseY > height/21.6 && mouseY < height/21.6+70) {

        infoState=0;
        logState=0;
        bookmarkState=0;
        settingsState=0;

        titleTransparency = 0;
        buttonTransparency = 0;
        buttonSpeed = height;
      }
    }
  }






  //------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
  //Below: returns the user to the books screen from either the finished books log, the unfinished books log or the "add a book" page, performing no changes (in view finished books, view unfinished books or add book , in bookmarks screen)
  //------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------


  if (logState==2 || logState==3) {


    if (mouseX > width/38.4 && mouseX < width/38.4+70 && mouseY > height/21.6 && mouseY < height/21.6+70) {

      cp5s5.hide();
      cp5s5.get(Textfield.class, "Title").clear();
      cp5s5.get(Textfield.class, "Authors Name").clear();
      cp5s5.get(Textfield.class, "Date Started").clear();
      cp5s5.get(Textfield.class, "Month Started").clear();
      cp5s5.get(Textfield.class, "Year Started").clear();





      cp5s6.get(Textfield.class, "").hide();
      cp5s6.hide();

      infoState=0;
      logState=1;
      bookmarkState=0;
      settingsState=0;
    }
  }




  //------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
  //Below: returns the user to the bookmark screen from either the bookmarks log or the "add a bookmark" page, performing no changes (in view bookmarks or add bookmark , in bookmarks screen)
  //------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------


  if (bookmarkState==2 || bookmarkState==3) {

    if (mouseX > width/38.4 && mouseX < width/38.4+70 && mouseY > height/21.6 && mouseY < height/21.6+70) {

      infoState=0;
      logState=0;
      bookmarkState=1;
      settingsState=0;

      cp5.hide();

      cp5s3.get(ScrollableList.class, "Title_Author_Page").clear();
      cp5s3.get(ScrollableList.class, "Title_Author_Page").addItems(bookmarks);
      cp5s3.get(ScrollableList.class, "Title_Author_Page").hide();

      cp5s3.get(Textfield.class, "").clear();
      cp5s3.get(Textfield.class, "").hide();
    }
  }




  //---------------------------------------------------------------------------------------------------------------------------------------
  //Below: returns the user to the bookmark log from the edit bookmark screen, performing no changes (in edit bookmarks, in view bookmarks)
  //---------------------------------------------------------------------------------------------------------------------------------------


  if (bookmarkState==4) {

    if (mouseX > width/38.4 && mouseX < width/38.4+70 && mouseY > height/21.6 && mouseY < height/21.6+70) {

      bookmarkSectionIndex=-1;

      infoState=0;
      logState=0;
      bookmarkState=3;
      settingsState=0;

      cp5s4.get(Textfield.class, "New Book Title").clear();
      cp5s4.get(Textfield.class, "New Page Number").clear();
      cp5s4.get(Textfield.class, "New Author Name").clear();

      cp5s4.hide();
    }
  }



  //-------------------------------------------------
  //Below: toggles background Image off (in settings)
  //-------------------------------------------------


  if (settingsState==1 && backgroundImage==true && mouseX > width/5.647058824+70 && mouseX < width/5.647058824+70+175 && mouseY > height/2 && mouseY <height/2+100 && bookmarkState==0 && infoState==0 && logState==0) {

    backgroundImage=false;
  }  




  //------------------------------------------------
  //Below: toggles background Image on (in settings)
  //------------------------------------------------


  if (settingsState==1 && backgroundImage==false && mouseX > width/5.647058824+70 && mouseX < width/5.647058824+70+175 && mouseY > height/1.4 && mouseY <height/1.4+100 && bookmarkState==0 && infoState==0 && logState==0) {

    backgroundImage=true;
  }




  //-----------------------------------------
  //Below: toggles faststart on (in settings)
  //-----------------------------------------


  if (settingsState==1 && faststart==true && mouseX > width/1.5+70 && mouseX < width/1.5+70+175 && mouseY > height/2 && mouseY <height/2+100 && bookmarkState==0 && infoState==0 && logState==0) {

    faststart=false;
  }  




  //-----------------------------------------
  //Below: toggles faststart on (in settings)
  //-----------------------------------------


  if (settingsState==1 && faststart==false && mouseX > width/1.5+70 && mouseX < width/1.5+70+175 && mouseY > height/1.4 && mouseY <height/1.4+100 && bookmarkState==0 && infoState==0 && logState==0) {

    faststart=true;
  }




  //---------------------------------------
  //Below: toggles borders off (in settings)
  //---------------------------------------


  if (settingsState==1 && borders==true && mouseX > width/2.37037037+70 && mouseX < width/2.37037037+70+175 && mouseY > height/2 && mouseY <height/2+100 && bookmarkState==0 && infoState==0 && logState==0) {

    borders=false;
  }  




  //---------------------------------------
  //Below: toggles borders on (in settings)
  //---------------------------------------


  if (settingsState==1 && borders==false && mouseX > width/2.37037037+70 && mouseX < width/2.37037037+70+175 && mouseY > height/1.4 && mouseY <height/1.4+100 && bookmarkState==0 && infoState==0 && logState==0) {

    borders=true;
  }





  //--------------------------------------------------------------------------------
  //Below: takes the user to the color picker from the settings screen (in settings)
  //--------------------------------------------------------------------------------


  if (settingsState==1 && mouseX > width/2.37037037+70 && mouseX < width/2.37037037+70+175 && mouseY > height/3 && mouseY <height/3+100 && bookmarkState==0 && infoState==0 && logState==0) {
    cp5s2.show();
    colorPicker.show();
    settingsState=2;
  }





  //----------------------------------------------------------------------------------
  //Below: resets the text color to black (default color) (in colopicker, in settings)
  //----------------------------------------------------------------------------------


  if (settingsState==2 && mouseX > width/5.647058824+70 && mouseX < width/5.647058824+70+175 && mouseY > height/1.2 && mouseY <height/1.2+100 && bookmarkState==0 && infoState==0 && logState==0) {

    colorPicker.setColorValue(color(0, 0, 0, 255));
  }  



  //------------------------------------------------------------------------------------------------------------------------------------
  //Below: returns the user to the settings screen from the color picker screen (in colopicker, in settings), applying all color changes
  //------------------------------------------------------------------------------------------------------------------------------------


  if (settingsState==2 && mouseX > width/1.5+70 && mouseX < width/1.5+70+175 && mouseY > height/1.2 && mouseY <height/1.2+100 && bookmarkState==0 && infoState==0 && logState==0) {
    settingsState=1;
    colorPicker.hide();
  } 



  //-----------------------------------------------------------------
  //Below: takes the user to the "add-a-bookmark" page (in bookmarks)
  //-----------------------------------------------------------------


  if (bookmarkState==1 && mouseX > width/5.647058824+70 && mouseX < width/5.647058824+70+175 && mouseY > height/2 && mouseY <height/2+100 && settingsState==0 && infoState==0 && logState==0) {

    bookmarkState=2;
    cp5.show();
  }



  //---------------------------------------------------------------
  //Below: takes the user to the view bookmarks page (in bookmarks)
  //---------------------------------------------------------------


  if (bookmarkState==1 && mouseX > width/1.5+70 && mouseX < width/1.5+70+175 && mouseY > height/2 && mouseY <height/2+100 && settingsState==0 && infoState==0 && logState==0) {

    bookmarkState=3;
  }









  //---------------------------------------------------------------------------------------------------------------------------------
  //Below: if conditions are met, adds a bookmark to the bookmark log and updates the bookmark log ( in view bookmarks, in bookmarks)
  //---------------------------------------------------------------------------------------------------------------------------------


  if (bookmarkState==2 && mouseX > width/2.2 && mouseX < width/2.2+175 && mouseY > height/1.2 && mouseY <height/1.2+100 && settingsState==0 && infoState==0 && logState==0) {




    newestBookmark=(cp5.get(Textfield.class, "Book Title").getText() + "," + cp5.get(Textfield.class, "Author Name").getText() + "," +  nf(int(cp5.get(Textfield.class, "Page Number").getText()), 3));



    if (cp5.get(Textfield.class, "Book Title").getText() != null && !cp5.get(Textfield.class, "Book Title").getText().isEmpty() && cp5.get(Textfield.class, "Author Name").getText() != null && !cp5.get(Textfield.class, "Author Name").getText().isEmpty() && cp5.get(Textfield.class, "Page Number").getText() != null && !cp5.get(Textfield.class, "Page Number").getText().isEmpty()) {


      bookmarks = append(bookmarks, newestBookmark);


      saveStrings(dataPath("bookmark.txt"), bookmarks);



      cp5s3.get(ScrollableList.class, "Title_Author_Page").addItem(newestBookmark, 1);

      cp5.get(Textfield.class, "Book Title").clear();
      cp5.get(Textfield.class, "Page Number").clear();
      cp5.get(Textfield.class, "Author Name").clear();

      bookmarkState=1;
      cp5.hide();
    } else {   
      bookmarkState=2;
    }
  }







  //-------------------------------------------------------------------------------------------------------------
  //Below: sorts the bookmarks by the page number and updates the bookmark log ( in view bookmarks, in bookmarks)
  //-------------------------------------------------------------------------------------------------------------


  if (bookmarkState==3 && mouseX > width/1.15 && mouseX < width/1.15+175 && mouseY > height/5.2 && mouseY < height/5.2+100) {

    cp5s3.get(ScrollableList.class, "Title_Author_Page").clear(); 

    String infilename = "data/bookmark.txt";
    String outfilename = "data/bookmark_pagesort.txt";    
    Table table = loadTable(infilename, "csv");

    table.sort(2);
    saveTable(table, outfilename, "csv");

    bookmarksPageSort = loadStrings("bookmark_pagesort.txt");
    cp5s3.get(ScrollableList.class, "Title_Author_Page").addItems(bookmarksPageSort);
  }








  //------------------------------------------------------------------------------------------------------------
  //Below: sorts the bookmarks by the title name and updates the bookmark log ( in view bookmarks, in bookmarks)
  //------------------------------------------------------------------------------------------------------------


  if (bookmarkState==3 && mouseX > width/1.15 && mouseX < width/1.15+175 && mouseY > height/2.649056604 && mouseY < height/2.649056604+100) {

    cp5s3.get(ScrollableList.class, "Title_Author_Page").clear(); 


    String infilename = "data/bookmark.txt";
    String outfilename = "data/bookmark_titlesort.txt";    
    Table table = loadTable(infilename, "csv");



    table.sort(0);
    saveTable(table, outfilename, "csv");

    bookmarksTitleSort = loadStrings("bookmark_titlesort.txt");
    cp5s3.get(ScrollableList.class, "Title_Author_Page").addItems(bookmarksTitleSort);
  }







  //-------------------------------------------------------------------------------------------------------------
  //Below: sorts the bookmarks by the author name and updates the bookmark log ( in view bookmarks, in bookmarks)
  //-------------------------------------------------------------------------------------------------------------


  if (bookmarkState==3 && mouseX > width/1.15 && mouseX < width/1.15+175 && mouseY > height/1.77721519 && mouseY < height/1.77721519+100) {

    cp5s3.get(ScrollableList.class, "Title_Author_Page").clear();    

    String infilename = "data/bookmark.txt"; 
    String outfilename = "data/bookmark_authorsort.txt";    
    Table table = loadTable(infilename, "csv");

    table.sort(1);
    saveTable(table, outfilename, "csv");


    bookmarksAuthorSort = loadStrings("bookmark_authorsort.txt");  
    cp5s3.get(ScrollableList.class, "Title_Author_Page").addItems(bookmarksAuthorSort);
  }









  //-------------------------------------------------------------------------------------------
  //Below: searches for the users query in the bookmarks log ( in view bookmarks, in bookmarks)
  //-------------------------------------------------------------------------------------------


  if (bookmarkState==3 && mouseX > width/1.627118644 && mouseX < width/1.627118644+100 && mouseY > height/3+20 && mouseY < height/3+20+100 || key == ENTER) {


    cp5s3.get(ScrollableList.class, "Title_Author_Page").clear();
    cp5s3.get(ScrollableList.class, "Title_Author_Page").addItems(bookmarks);

    String x = cp5s3.get(Textfield.class, "").getText();

    x = x.toLowerCase();

    for (int i = 0; i < bookmarks.length; i++) {

      if (bookmarks[i].toLowerCase().contains(x)) {
      } else {       

        cp5s3.get(ScrollableList.class, "Title_Author_Page").removeItem(bookmarks[i]);
      }
    }
  }




  //---------------------------------------------------------------------------------
  //Below: sorts bookmarks by the newest bookmarks ( in view bookmarks, in bookmarks)
  //---------------------------------------------------------------------------------


  if (bookmarkState==3 && mouseX > width/1.4 && mouseX < width/1.4+175 && mouseY > height/5.2 && mouseY < height/5.2+100) {



    cp5s3.get(ScrollableList.class, "Title_Author_Page").clear();
    cp5s3.get(ScrollableList.class, "Title_Author_Page").addItems(bookmarks);

    if (newest==false) {
      bookmarks = reverse(bookmarks);
      newest = true;
    }
    cp5s3.get(ScrollableList.class, "Title_Author_Page").clear();
    cp5s3.get(ScrollableList.class, "Title_Author_Page").addItems(bookmarks);
  }


  //----------------------------------------------------------------------------------------------------
  //Below: removes the selected bookmark and updates the bookmark log ( in view bookmarks, in bookmarks)
  //----------------------------------------------------------------------------------------------------


  if (bookmarkState==3 && mouseX > width/38.4 && mouseX < width/38.4+175 && mouseY > height/1.77721519 && mouseY < height/1.77721519+100) {

    if (bookmarkSectionIndex>=0) {


      cp5s3.get(ScrollableList.class, "Title_Author_Page").clear();

      String infilename = "data/bookmark.txt"; 
      String outfilename = "data/bookmark.txt";    
      Table table = loadTable(infilename, "csv");


      table.removeRow(bookmarkSectionIndex);
      saveTable(table, outfilename, "csv");


      bookmarks = loadStrings("bookmark.txt");  
      cp5s3.get(ScrollableList.class, "Title_Author_Page").addItems(bookmarks);



      bookmarkSectionIndex=-1;
    }
  }



  //---------------------------------------------------------------------------------------
  //Below: takes user to the edit bookmark page from the view bookmarks page (in bookmarks)
  //---------------------------------------------------------------------------------------



  if (bookmarkState==3 && mouseX > width/6.981818182 && mouseX < width/6.981818182+175 && mouseY > height/1.77721519 && mouseY < height/1.77721519+100  && bookmarkSectionIndex>=0) {

    bookmarkState=4;

    cp5s3.get(ScrollableList.class, "Title_Author_Page").clear();
    cp5s3.get(ScrollableList.class, "Title_Author_Page").addItems(bookmarks);
    cp5s3.get(ScrollableList.class, "Title_Author_Page").hide();

    cp5s3.get(Textfield.class, "").clear();
    cp5s3.get(Textfield.class, "").hide();



    cp5s4.show();
  } 





  //-------------------------------------------------------------------------------------------------------------------------------
  //Below: If conditions are met, edits the bookmark by deleting old one and adding new one. (in edit bookmarks, in view bookmarks)
  //-------------------------------------------------------------------------------------------------------------------------------



  if (bookmarkState==4 && mouseX > width/2.2 && mouseX < width/2.2+175 && mouseY > height/1.2 && mouseY <height/1.2+100 && settingsState==0 && infoState==0 && logState==0) {

    boolean newCheck = false;


    newestBookmark=(cp5s4.get(Textfield.class, "New Book Title").getText() + "," + cp5s4.get(Textfield.class, "New Author Name").getText() + "," +  nf(int(cp5s4.get(Textfield.class, "New Page Number").getText()), 3));



    if (cp5s4.get(Textfield.class, "New Book Title").getText() != null && !cp5s4.get(Textfield.class, "New Book Title").getText().isEmpty() && cp5s4.get(Textfield.class, "New Author Name").getText() != null && !cp5s4.get(Textfield.class, "New Author Name").getText().isEmpty() && cp5s4.get(Textfield.class, "New Page Number").getText() != null && !cp5s4.get(Textfield.class, "New Page Number").getText().isEmpty()) {


      bookmarks = append(bookmarks, newestBookmark);


      saveStrings(dataPath("bookmark.txt"), bookmarks);



      cp5s3.get(ScrollableList.class, "Title_Author_Page").addItem(newestBookmark, 1);

      cp5s4.get(Textfield.class, "New Book Title").clear();
      cp5s4.get(Textfield.class, "New Page Number").clear();
      cp5s4.get(Textfield.class, "New Author Name").clear();

      newCheck=true;
    } else {   
      bookmarkState=4;
    }


    if (bookmarkSectionIndex>=0 && newCheck==true) {


      cp5s3.get(ScrollableList.class, "Title_Author_Page").clear();

      String infilename = "data/bookmark.txt"; 
      String outfilename = "data/bookmark.txt";    
      Table table = loadTable(infilename, "csv");


      table.removeRow(bookmarkSectionIndex);
      saveTable(table, outfilename, "csv");


      bookmarks = loadStrings("bookmark.txt");  
      cp5s3.get(ScrollableList.class, "Title_Author_Page").addItems(bookmarks);



      bookmarkSectionIndex = -1;
      newCheck=false;


      cp5s4.get(Textfield.class, "New Book Title").clear();
      cp5s4.get(Textfield.class, "New Page Number").clear();
      cp5s4.get(Textfield.class, "New Author Name").clear();
      cp5s4.hide();

      bookmarkState=3;
    }
  }



  //-------------------------------------------------------------------------
  //Below: takes the user into the "add a book" page from the view books page
  //-------------------------------------------------------------------------


  if (logState==1 && mouseX > width/5.647058824+70 && mouseX < width/5.647058824+70+175 && mouseY > height/2 && mouseY <height/2+100 && settingsState==0 && infoState==0 && bookmarkState==0) {


    logState=2;
    cp5s5.show();
    cp5s5.get(Textfield.class, "Title").show();
    cp5s5.get(Textfield.class, "Authors Name").show();
    cp5s5.get(Textfield.class, "Date Started").show();
    cp5s5.get(Textfield.class, "Month Started").show();
    cp5s5.get(Textfield.class, "Year Started").show();
  } 



  //----------------------------------------------------------------------------
  //Below: takes the user into the unfinished books log from the view books page
  //----------------------------------------------------------------------------


  if (logState==1 && logState!=3 && logState!=2 && mouseX > width/2-87.5 && mouseX < width/2+87.5 && mouseY > height/2 && mouseY <height/2+100 && settingsState==0 && infoState==0 && bookmarkState==0) {

    logState=3;
    cp5s6.show();
    cp5s6.get(ScrollableList.class, "Title_Author_DateStarted").show();
    cp5s6.get(Textfield.class, "").show();
  }



  //--------------------------------------------------------------------------------------------
  //Below: takes the user to the FINISHED books log from the book log screen (in booklog screen)
  //--------------------------------------------------------------------------------------------


  if (logState==1 && logState!=3 && logState!=2 && mouseX > width/1.5+70 && mouseX < width/1.5+70+175 && mouseY > height/2 && mouseY <height/2+100 && settingsState==0 && infoState==0 && bookmarkState==0) {

    logState=6;
    cp5s7.show();
    cp5s7.get(ScrollableList.class, "Title_Author_DateStarted_DateFinished").show();
    cp5s7.get(Textfield.class, "").show();
  }


  //-------------------------------------------------------------------------------------------------------------------
  //Below: if conditions are met, adds the Book object to the "books" array and its string corespondent to the book log
  //--------------------------------------------------------------------------------------------------------------------


  if (logState==2 && mouseX > width/2.2 && mouseX < width/2.2+175 && mouseY > height/1.2 && mouseY <height/1.2+100 && settingsState==0 && infoState==0 && bookmarkState==0) {


    newestBook= new Book (cp5s5.get(Textfield.class, "Title").getText(), cp5s5.get(Textfield.class, "Authors Name").getText(), int(cp5s5.get(Textfield.class, "Date Started").getText()), int(cp5s5.get(Textfield.class, "Month Started").getText()), int(cp5s5.get(Textfield.class, "Year Started").getText()));

    newestBookString = newestBook.author + "," + newestBook.title + "," + nf(newestBook.dateStarted, 2) + "/" + nf(newestBook.monthStarted, 2) + "/" + nf(newestBook.yearStarted, 4);


    if (cp5s5.get(Textfield.class, "Title").getText() != null && !cp5s5.get(Textfield.class, "Title").getText().isEmpty() && cp5s5.get(Textfield.class, "Authors Name").getText() != null && !cp5s5.get(Textfield.class, "Authors Name").getText().isEmpty() && cp5s5.get(Textfield.class, "Date Started").getText() != null && !cp5s5.get(Textfield.class, "Date Started").getText().isEmpty() && cp5s5.get(Textfield.class, "Month Started").getText() != null && !cp5s5.get(Textfield.class, "Month Started").getText().isEmpty() && cp5s5.get(Textfield.class, "Year Started").getText() != null && !cp5s5.get(Textfield.class, "Year Started").getText().isEmpty()) {


      log = append(log, newestBookString);

      books = (Book[]) append(books, newestBook);

      saveStrings(dataPath("books.txt"), log);


      cp5s6.get(ScrollableList.class, "Title_Author_DateStarted").addItem(newestBookString, 1);

      cp5s5.get(Textfield.class, "Title").clear();
      cp5s5.get(Textfield.class, "Date Started").clear();
      cp5s5.get(Textfield.class, "Authors Name").clear();
      cp5s5.get(Textfield.class, "Month Started").clear();
      cp5s5.get(Textfield.class, "Year Started").clear();


      logState=1;
      cp5s5.hide();
    } else {   
      logState=2;
    }
  }

  //-----------------------------------------------------------
  //Below: Searches the UNFINISHED book log for the users query
  //-----------------------------------------------------------


  if (logState==3 && mouseX > width/1.627118644 && mouseX < width/1.627118644+100 && mouseY > height/3+20 && mouseY < height/3+20+100 || key == ENTER) {


    cp5s6.get(ScrollableList.class, "Title_Author_DateStarted").clear();
    cp5s6.get(ScrollableList.class, "Title_Author_DateStarted").addItems(log);

    String x = cp5s6.get(Textfield.class, "").getText();

    x = x.toLowerCase();

    for (int i = 0; i < log.length; i++) {

      if (log[i].toLowerCase().contains(x)) {
      } else {       

        cp5s6.get(ScrollableList.class, "Title_Author_DateStarted").removeItem(log[i]);
      }
    }
  }



  //-----------------------------------------------
  //Below: Sort books by title in manage books
  //-----------------------------------------------


  if (logState==3 && mouseX > width/1.15 && mouseX < width/1.15+175 && mouseY > height/2.649056604 && mouseY < height/2.649056604+100) {

    cp5s6.get(ScrollableList.class, "Title_Author_DateStarted").clear(); 


    String infilename = "data/books.txt";
    String outfilename = "data/books_titlesort.txt";    
    Table table = loadTable(infilename, "csv");



    table.sort(0);
    saveTable(table, outfilename, "csv");

    booksTitleSort = loadStrings("books_titlesort.txt");
    cp5s6.get(ScrollableList.class, "Title_Author_DateStarted").addItems(booksTitleSort);
  }


  //-----------------------------------------------
  //Below: Sort books by Author name in manage books
  //-----------------------------------------------


  if (logState==3 && mouseX > width/1.15 && mouseX < width/1.15+175 && mouseY > height/5.2 && mouseY < height/5.2+100) {

    cp5s6.get(ScrollableList.class, "Title_Author_DateStarted").clear();    

    String infilename = "data/books.txt"; 
    String outfilename = "data/books_authorsort.txt";    
    Table table = loadTable(infilename, "csv");

    table.sort(1);
    saveTable(table, outfilename, "csv");


    booksAuthorSort = loadStrings("books_authorsort.txt");  
    cp5s6.get(ScrollableList.class, "Title_Author_DateStarted").addItems(booksAuthorSort);
  }


  //-----------------------------------------------
  //Below: Sort books by start date in manage books
  //-----------------------------------------------

  if (logState==3 && mouseX > width/1.4 && mouseX < width/1.4+175 && mouseY > height/5.2 && mouseY < height/5.2+100) {

    cp5s6.get(ScrollableList.class, "Title_Author_DateStarted").clear();    

    String infilename = "data/books.txt"; 
    String outfilename = "data/books_startdatesort.txt";    
    Table table = loadTable(infilename, "csv");



    table.sort(2);
    saveTable(table, outfilename, "csv");


    booksStartDateSort = loadStrings("books_startdatesort.txt");  
    cp5s6.get(ScrollableList.class, "Title_Author_DateStarted").addItems(booksStartDateSort);
  }




  //------------------------------------------------------
  //Below: sorts by newest First for books in manage books
  //------------------------------------------------------


  if (logState==3 && mouseX > width/1.4 && mouseX < width/1.4+175 && mouseY > height/2.649056604 && mouseY < height/2.649056604+100) {



    cp5s6.get(ScrollableList.class, "Title_Author_DateStarted").clear();
    cp5s6.get(ScrollableList.class, "Title_Author_DateStarted").addItems(log);

    if (newest==false) {
      log = reverse(log);
      newest = true;
    }
    cp5s6.get(ScrollableList.class, "Title_Author_DateStarted").clear();
    cp5s6.get(ScrollableList.class, "Title_Author_DateStarted").addItems(log);
  }





  //-------------------------------------------------------------------------------
  //Below: Functionality for the delete book button in delete books in manage books
  //-------------------------------------------------------------------------------


  if (logState==3 && mouseX > width/38.4 && mouseX < width/38.4+175 && mouseY > height/1.77721519 && mouseY < height/1.77721519+100) {

    if (bookSectionIndex>=0) {


      cp5s6.get(ScrollableList.class, "Title_Author_DateStarted").clear();

      String infilename = "data/books.txt"; 
      String outfilename = "data/books.txt";    
      Table table = loadTable(infilename, "csv");


      table.removeRow(bookSectionIndex);
      saveTable(table, outfilename, "csv");


      log = loadStrings("books.txt");  
      cp5s6.get(ScrollableList.class, "Title_Author_DateStarted").addItems(log);

      bookmarkSectionIndex=-1;
    }
  }





  //--------------------------------------------------
  //Below: Opens the Edit books screen in manage books
  //--------------------------------------------------


  if (logState==3 && mouseX > width/6.981818182 && mouseX < width/6.981818182+175 && mouseY > height/1.77721519 && mouseY < height/1.77721519+100  && bookSectionIndex>=0) {

    logState=4;

    cp5s6.get(ScrollableList.class, "Title_Author_DateStarted").clear();
    cp5s6.get(ScrollableList.class, "Title_Author_DateStarted").addItems(log);
    cp5s6.get(ScrollableList.class, "Title_Author_DateStarted").hide();

    cp5s6.get(Textfield.class, "").clear();
    cp5s6.get(Textfield.class, "").hide();



    cp5s6b.show();
  }


  //--------------------------------------------------------------------------------------------------------------------
  //Below: If conditions are met, edits the book by deleting old one and adding new one. (in edit book, in manage books)
  //--------------------------------------------------------------------------------------------------------------------



  if (logState==4 && mouseX > width/2.2 && mouseX < width/2.2+175 && mouseY > height/1.2 && mouseY <height/1.2+100 && settingsState==0 && infoState==0 && bookmarkState==0) {

    boolean newCheck = false;

    newestBook= new Book (cp5s6b.get(Textfield.class, "New Title").getText(), cp5s6b.get(Textfield.class, "New Authors Name").getText(), int(cp5s6b.get(Textfield.class, "New Date Started").getText()), int(cp5s6b.get(Textfield.class, "New Month Started").getText()), int(cp5s6b.get(Textfield.class, "New Year Started").getText()));

    newestBookString = newestBook.author + "," + newestBook.title + "," + nf(newestBook.dateStarted, 2) + "/" + nf(newestBook.monthStarted, 2) + "/" + nf(newestBook.yearStarted, 4);



    if (cp5s6b.get(Textfield.class, "New Title").getText() != null && !cp5s6b.get(Textfield.class, "New Title").getText().isEmpty() && cp5s6b.get(Textfield.class, "New Authors Name").getText() != null && !cp5s6b.get(Textfield.class, "New Authors Name").getText().isEmpty() && cp5s6b.get(Textfield.class, "New Date Started").getText() != null && !cp5s6b.get(Textfield.class, "New Date Started").getText().isEmpty() && cp5s6b.get(Textfield.class, "New Month Started").getText() != null && !cp5s6b.get(Textfield.class, "New Month Started").getText().isEmpty() && cp5s6b.get(Textfield.class, "New Year Started").getText() != null && !cp5s6b.get(Textfield.class, "New Year Started").getText().isEmpty()) {


      log = append(log, newestBookString);
      books = (Book[]) append(books, newestBook);


      saveStrings(dataPath("books.txt"), log);



      cp5s6.get(ScrollableList.class, "Title_Author_DateStarted").addItem(newestBookString, 1);

      cp5s6b.get(Textfield.class, "New Title").clear();
      cp5s6b.get(Textfield.class, "New Authors Name").clear();
      cp5s6b.get(Textfield.class, "New Date Started").clear();
      cp5s6b.get(Textfield.class, "New Month Started").clear();
      cp5s6b.get(Textfield.class, "New Year Started").clear();

      newCheck=true;
    } else {   
      logState=4;
    }


    if (bookSectionIndex>=0 && newCheck==true) {


      cp5s6.get(ScrollableList.class, "Title_Author_DateStarted").clear();

      String infilename = "data/books.txt"; 
      String outfilename = "data/books.txt";    
      Table table = loadTable(infilename, "csv");


      table.removeRow(bookSectionIndex);
      books[bookSectionIndex] = null;      // note : setting to null does not remove deleted book objects from the object array "books" in the same instance of the program, but wgenever the program is rerun, they will be removed
      saveTable(table, outfilename, "csv");


      log = loadStrings("books.txt");  
      cp5s6.get(ScrollableList.class, "Title_Author_DateStarted").addItems(log);



      bookSectionIndex = -1;
      newCheck=false;


      cp5s6b.get(Textfield.class, "New Title").clear();
      cp5s6b.get(Textfield.class, "New Authors Name").clear();
      cp5s6b.get(Textfield.class, "New Date Started").clear();
      cp5s6b.get(Textfield.class, "New Month Started").clear();
      cp5s6b.get(Textfield.class, "New Year Started").clear();
      cp5s6b.hide();

      cp5s6.get(ScrollableList.class, "Title_Author_DateStarted").show();
      cp5s6.get(Textfield.class, "").show();
      logState=3;
    }
  }



  //------------------------------------------------------------------------------------------------------------------------------
  //Below: If on edit screen, provides functionality for the return button back to the book viewer (in edit book, in manage Books)
  //------------------------------------------------------------------------------------------------------------------------------



  if (logState==4 && mouseX > width/38.4 && mouseX < width/38.4+70 && mouseY > height/21.6 && mouseY < height/21.6+70) {

    bookSectionIndex=-1;

    infoState=0;
    logState=3;
    bookmarkState=0;
    settingsState=0;

    cp5s6b.get(Textfield.class, "New Title").clear();
    cp5s6b.get(Textfield.class, "New Authors Name").clear();
    cp5s6b.get(Textfield.class, "New Date Started").clear();
    cp5s6b.get(Textfield.class, "New Month Started").clear();
    cp5s6b.get(Textfield.class, "New Year Started").clear();

    cp5s6.get(ScrollableList.class, "Title_Author_DateStarted").show();
    cp5s6.get(Textfield.class, "").show();

    cp5s6b.hide();
  }







  //------------------------------------------------------------------------------------------------------------------------
  //Below: takes the user to the mark complete screen from the bookmark log screen if a bookmark is selected ( in bookmarks)
  //------------------------------------------------------------------------------------------------------------------------



  if (bookSectionIndex>=0 && logState==3 && mouseX > width/38.4+110 && mouseX < width/38.4+110+175 && mouseY > height/1.77721519+150 && mouseY < height/1.77721519+150+100 && settingsState==0 && infoState==0 && bookmarkState==0) {


    cp5s6.hide();

    logState=5;
  }




  //---------------------------------------------------------------------------------------------------------------------------------------
  //Below: If on mark complete screen, provides functionality for the return button back to the book viewer (in edit book, in manage Books)
  //---------------------------------------------------------------------------------------------------------------------------------------



  if (logState==5 && mouseX > width/38.4 && mouseX < width/38.4+70 && mouseY > height/21.6 && mouseY < height/21.6+70) {

    bookSectionIndex=-1;

    infoState=0;
    logState=3;
    bookmarkState=0;
    settingsState=0;

    cp5s6c.get(Textfield.class, "Date Finished").clear();
    cp5s6c.get(Textfield.class, "Month Finished").clear();
    cp5s6c.get(Textfield.class, "Year Finished").clear();

    cp5s6c.hide();


    cp5s6.get(ScrollableList.class, "Title_Author_DateStarted").show();
    cp5s6.get(Textfield.class, "").show();

    cp5s6b.hide();
  }
}