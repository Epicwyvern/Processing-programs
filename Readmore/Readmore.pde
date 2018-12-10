import controlP5.*;


ControlP5 cp5;
ControlP5 cp5s2;
ControlP5 cp5s3;

String [] bookmarks;
String [] bookmarksTitleSort;
String [] bookmarksAuthorSort;
String [] bookmarksPageSort;


String newestBookmark;


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

PFont font;

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


boolean nullField;

void settings () {


  fullScreen(P2D);
}

void setup () {

  PFont font2 = createFont("font.ttf", 50);
  PFont font3 = createFont("times.ttf", 20);

  cp5 = new ControlP5(this);
  cp5s2 = new ControlP5(this);
  cp5s3 = new ControlP5(this);

  bookmarks = loadStrings("bookmark.txt"); 
  bookmarksTitleSort = loadStrings("bookmark_titlesort.txt");
  bookmarksAuthorSort = loadStrings("bookmark_authorsort.txt");
  bookmarksPageSort = loadStrings("bookmark_pagesort.txt");


  colorPicker = cp5s2.addColorPicker("picker")
    .setPosition(width/2.3, height/2.5)
    .setColorValue(color(0, 0, 0, 255))
    .setWidth(0)
    ;    


  colorPicker.hide();


  cp5.addTextfield("Book Title")
    .setPosition(width/6, height/2)
    .setSize(600, 80)
    .setFont(font2)
    .setFocus(true)
    .setColor(color(255))
    .hide()
    ;

  cp5.addTextfield("Author Name")
    .setPosition(width/6, height/1.5)
    .setSize(600, 80)
    .setFont(font2)
    .setFocus(true)
    .setColor(color(255))
    .hide()
    ;


  cp5.addTextfield("Page Number")
    .setPosition(width/1.5, height/1.8)
    .setSize(200, 80)
    .setFont(font2)
    .setFocus(true)
    .setColor(color(255))
    .setInputFilter(ControlP5.INTEGER)
    .hide()
    ;





  cp5s3.addScrollableList("(Bookmark Title, Bookmark Author, Bookmark Page)")
    .setPosition(width/2.925, height/2.2)
    .setSize(600, 400)
    .setFont(font3)
    .setBarHeight(50)
    .setItemHeight(50)
    .addItems(bookmarks)
    .setType(ControlP5.LIST)
    .hide()
    .getCaptionLabel().toUpperCase(false) 
    ;
  cp5s3.get(ScrollableList.class, "(Bookmark Title, Bookmark Author, Bookmark Page)").getValueLabel().toUpperCase(false);


  cp5s3.addTextfield("")
    .setPosition(width/2.925, height/3)
    .setSize(500, 80)
    .setFont(font2)
    .setFocus(true)
    .setColor(color(255))
    .hide()
    ;













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

  font = createFont ("font.ttf", 50);

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

  nullField = false;
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
}


void Background () {
  image(background, 0, 0, width, height);
}



void Title () {

  tint(255, titleTransparency);
  image(title, width/3.764705882, height/10.5);

  if (faststart==false) {
    titleTransparency += 2;
  }
}


void infoButton () {

  tint(255, buttonTransparency);
  image(info, width/5.647058824, buttonSpeed);
}


void logButton () {

  tint(255, buttonTransparency);
  image(booklog, width/2.37037037, buttonSpeed-20);
}


void bookmarkButton () {

  tint(255, buttonTransparency);
  image(bookmark, width/1.5, buttonSpeed);
}


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



void border () {

  strokeWeight(30);
  stroke(0);
  line(0, 0, width, 0);
  line(0, 0, 0, height);
  line(0, height, width, height);
  line(width, 0, width, height);
}


void returnMenu() {

  image(returnMenu, width/38.4, height/21.6, 70, 70);



  if (mouseX > width/38.4 && mouseX < width/38.4+70 && mouseY > height/21.6 && mouseY < height/21.6+70) {
    fill(colorPicker.getColorValue());
    textFont(font);
    text("Click here to return to the main menu", 20, height-40);
  }
}





void return2Menu() {

  image(returnMenu, width/38.4, height/21.6, 70, 70);



  if (mouseX > width/38.4 && mouseX < width/38.4+70 && mouseY > height/21.6 && mouseY < height/21.6+70) {
    fill(colorPicker.getColorValue());
    textFont(font);
    text("Click here to return to the previous menu", 20, height-40);
  }
}



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
  text("Design and Code by Aman Shahid \n Processing 3.0 was used to \n create this application", width/2, height/1.22727272727);
}


void settingsButton () {

  image(cog, width/1.2, 0);
}


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








void bookmarkScreen () {

  image(bookmarksTitle, width/3.764705882, height/10.5);
  image(addBookmark, width/5.647058824+70, height/2);
  image(viewBookmarks, width/1.5+70, height/2);
}


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


void viewBookmarks () {

  image(scroll, width/3.764705882, height/21.6);
  image(viewBookmarksTitle, width/2.612244898, height/5.2, viewBookmarksTitle.width/2, viewBookmarksTitle.height/2);
  image(bookmarkSortPage, width/1.4, height/5.2);
  image(bookmarkSortTitle, width/1.4, height/2.649056604);
  image(bookmarkSortAuthor, width/1.4, height/1.77721519);
  image(search, width/1.627118644, height/3+20, 50, 50);

  cp5s3.get(ScrollableList.class, "(Bookmark Title, Bookmark Author, Bookmark Page)").show();
  cp5s3.get(Textfield.class, "").show();
}











void mouseReleased () {

  if (buttonSpeed<=height/2) {

    if (mouseX > width/1.5+25 && mouseX < width/1.5+250 && mouseY > height/2+25 && mouseY < height/2+250 && logState==0 && infoState==0 && settingsState==0 && bookmarkState==0) {
      bookmarkState=1;
    }


    if (mouseX > width/2.37037037+25 && mouseX < width/2.37037037+250 && mouseY > height/2+25 && mouseY < height/2+250 && bookmarkState==0 && infoState==0 && settingsState==0) {
      logState=1;
    }


    if (mouseX > width/5.647058824+25 && mouseX < width/5.647058824+250 && mouseY > height/2+25 && mouseY < height/2+250 && bookmarkState==0 && logState==0 && settingsState==0) {
      infoState=1;
    }

    if (mouseX > width/1.2 && mouseX < width/1.2+421 && mouseY > 0 && mouseY < 324 && bookmarkState==0 && infoState==0 && logState==0) {
      settingsState=1;
    }


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


  if (logState==2 ) {

    if (mouseX > width/38.4 && mouseX < width/38.4+70 && mouseY > height/21.6 && mouseY < height/21.6+70) {

      infoState=0;
      logState=1;
      bookmarkState=0;
      settingsState=0;
    }
  }


  if (bookmarkState==2 || bookmarkState==3) {

    if (mouseX > width/38.4 && mouseX < width/38.4+70 && mouseY > height/21.6 && mouseY < height/21.6+70) {

      infoState=0;
      logState=0;
      bookmarkState=1;
      settingsState=0;

      cp5.hide();

      cp5s3.get(ScrollableList.class, "(Bookmark Title, Bookmark Author, Bookmark Page)").clear();
      cp5s3.get(ScrollableList.class, "(Bookmark Title, Bookmark Author, Bookmark Page)").addItems(bookmarks);
      cp5s3.get(ScrollableList.class, "(Bookmark Title, Bookmark Author, Bookmark Page)").hide();

      cp5s3.get(Textfield.class, "").clear();
      cp5s3.get(Textfield.class, "").hide();
    }
  }





  if (settingsState==1 && backgroundImage==true && mouseX > width/5.647058824+70 && mouseX < width/5.647058824+70+175 && mouseY > height/2 && mouseY <height/2+100 && bookmarkState==0 && infoState==0 && logState==0) {

    backgroundImage=false;
  }  

  if (settingsState==1 && backgroundImage==false && mouseX > width/5.647058824+70 && mouseX < width/5.647058824+70+175 && mouseY > height/1.4 && mouseY <height/1.4+100 && bookmarkState==0 && infoState==0 && logState==0) {

    backgroundImage=true;
  }




  if (settingsState==1 && faststart==true && mouseX > width/1.5+70 && mouseX < width/1.5+70+175 && mouseY > height/2 && mouseY <height/2+100 && bookmarkState==0 && infoState==0 && logState==0) {

    faststart=false;
  }  

  if (settingsState==1 && faststart==false && mouseX > width/1.5+70 && mouseX < width/1.5+70+175 && mouseY > height/1.4 && mouseY <height/1.4+100 && bookmarkState==0 && infoState==0 && logState==0) {

    faststart=true;
  }




  if (settingsState==1 && borders==true && mouseX > width/2.37037037+70 && mouseX < width/2.37037037+70+175 && mouseY > height/2 && mouseY <height/2+100 && bookmarkState==0 && infoState==0 && logState==0) {

    borders=false;
  }  

  if (settingsState==1 && borders==false && mouseX > width/2.37037037+70 && mouseX < width/2.37037037+70+175 && mouseY > height/1.4 && mouseY <height/1.4+100 && bookmarkState==0 && infoState==0 && logState==0) {

    borders=true;
  }


  if (settingsState==1 && mouseX > width/2.37037037+70 && mouseX < width/2.37037037+70+175 && mouseY > height/3 && mouseY <height/3+100 && bookmarkState==0 && infoState==0 && logState==0) {
    cp5s2.show();
    colorPicker.show();
    settingsState=2;
  }





  if (settingsState==2 && mouseX > width/5.647058824+70 && mouseX < width/5.647058824+70+175 && mouseY > height/1.2 && mouseY <height/1.2+100 && bookmarkState==0 && infoState==0 && logState==0) {

    colorPicker.setColorValue(color(0, 0, 0, 255));
  }  

  if (settingsState==2 && mouseX > width/1.5+70 && mouseX < width/1.5+70+175 && mouseY > height/1.2 && mouseY <height/1.2+100 && bookmarkState==0 && infoState==0 && logState==0) {

    settingsState=1;
    colorPicker.hide();
  } 



  if (bookmarkState==1 && mouseX > width/5.647058824+70 && mouseX < width/5.647058824+70+175 && mouseY > height/2 && mouseY <height/2+100 && settingsState==0 && infoState==0 && logState==0) {

    bookmarkState=2;
    cp5.show();
  }


  if (bookmarkState==1 && mouseX > width/1.5+70 && mouseX < width/1.5+70+175 && mouseY > height/2 && mouseY <height/2+100 && settingsState==0 && infoState==0 && logState==0) {

    bookmarkState=3;
  }


  if (bookmarkState==2 && mouseX > width/2.2 && mouseX < width/2.2+175 && mouseY > height/1.2 && mouseY <height/1.2+100 && settingsState==0 && infoState==0 && logState==0) {




    newestBookmark=(cp5.get(Textfield.class, "Book Title").getText() + "," + cp5.get(Textfield.class, "Author Name").getText() + "," +  nf(int(cp5.get(Textfield.class, "Page Number").getText()), 3));



    if (cp5.get(Textfield.class, "Book Title").getText() != null && !cp5.get(Textfield.class, "Book Title").getText().isEmpty() && cp5.get(Textfield.class, "Author Name").getText() != null && !cp5.get(Textfield.class, "Author Name").getText().isEmpty() && cp5.get(Textfield.class, "Page Number").getText() != null && !cp5.get(Textfield.class, "Page Number").getText().isEmpty()) {


      bookmarks = append(bookmarks, newestBookmark);


      saveStrings(dataPath("bookmark.txt"), bookmarks);



      cp5s3.get(ScrollableList.class, "(Bookmark Title, Bookmark Author, Bookmark Page)").addItem(newestBookmark, 1);

      cp5.get(Textfield.class, "Book Title").clear();
      cp5.get(Textfield.class, "Page Number").clear();
      cp5.get(Textfield.class, "Author Name").clear();

      bookmarkState=1;
      cp5.hide();
    } else {   
      bookmarkState=2;
    }
  }



  if (bookmarkState==3 && mouseX > width/1.4 && mouseX < width/1.4+175 && mouseY > height/5.2 && mouseY < height/5.2+100) {

    cp5s3.get(ScrollableList.class, "(Bookmark Title, Bookmark Author, Bookmark Page)").clear(); 

    String infilename = "data/bookmark.txt";
    String outfilename = "data/bookmark_pagesort.txt";    
    Table table = loadTable(infilename, "csv");

    table.sort(2);
    saveTable(table, outfilename, "csv");


    cp5s3.get(ScrollableList.class, "(Bookmark Title, Bookmark Author, Bookmark Page)").addItems(bookmarksPageSort);
  }


  if ( bookmarkState==3 && mouseX > width/1.4 && mouseX < width/1.4+175 && mouseY > height/2.649056604 && mouseY < height/2.649056604+100) {

    cp5s3.get(ScrollableList.class, "(Bookmark Title, Bookmark Author, Bookmark Page)").clear(); 


    String infilename = "data/bookmark.txt";
    String outfilename = "data/bookmark_titlesort.txt";    
    Table table = loadTable(infilename, "csv");

    table.sort(0);
    saveTable(table, outfilename, "csv");


    cp5s3.get(ScrollableList.class, "(Bookmark Title, Bookmark Author, Bookmark Page)").addItems(bookmarksTitleSort);
  }


  if ( bookmarkState==3 && mouseX > width/1.4 && mouseX < width/1.4+175 && mouseY > height/1.77721519 && mouseY < height/1.77721519+100) {

    cp5s3.get(ScrollableList.class, "(Bookmark Title, Bookmark Author, Bookmark Page)").clear();    

    String infilename = "data/bookmark.txt"; 
    String outfilename = "data/bookmark_authorsort.txt";    
    Table table = loadTable(infilename, "csv");

    table.sort(1);
    saveTable(table, outfilename, "csv");



    cp5s3.get(ScrollableList.class, "(Bookmark Title, Bookmark Author, Bookmark Page)").addItems(bookmarksAuthorSort);
  }


  if ( bookmarkState==3 && mouseX > width/1.627118644 && mouseX < width/1.627118644+100 && mouseY > height/3+20 && mouseY < height/3+20+100) {


    cp5s3.get(ScrollableList.class, "(Bookmark Title, Bookmark Author, Bookmark Page)").clear();
    cp5s3.get(ScrollableList.class, "(Bookmark Title, Bookmark Author, Bookmark Page)").addItems(bookmarks);

    String x = cp5s3.get(Textfield.class, "").getText();

    x= x.toLowerCase();

    for (int i = 0; i < bookmarks.length; i++) {

      if (bookmarks[i].toLowerCase().contains(x)) {
      } else {       

        cp5s3.get(ScrollableList.class, "(Bookmark Title, Bookmark Author, Bookmark Page)").removeItem(bookmarks[i]);
      }
    }
  }
}