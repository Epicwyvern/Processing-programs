/*

 Description: Protect the civillians of Paradox universe from space thugs!
 Author: Aman Shahid
 Date of last edit: 20th January 2018
 
 Song: Crisis 2 - DJ IMMUNE
 song credits go to DJ IMMUNE
 
 */


import ddf.minim.*;   // sound library , used to run theme song
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;


Minim minim; // sound library 
AudioPlayer song; // theme song



int timer; // Mr.Seidel's timer based on framecount.
int startTime;

float [] starsY; // array used to display the  stars Y position
float [] xSpeeds;// array used to change the star speed
float [] starsX;// array used to display stars X position



float ballX; // X position of the laser beam
float ballY; // Y position of the laser beam
float dY=50;// speed of the laser beam
boolean mouseWasPressed=false;// boolean which helps us shoot the laser beam when it is true
float laserSize=50;// size of the laser beam

PImage spaceRanger; // image file for the spaceranger
float rangerX=920; // X position of the spaceranger
float rangerY=950;// Y position of the spaceranger

boolean wasShot = false;// used to bring the position of the laser beam back to the spaceranger


boolean aWasPressed=false;// used to move left
boolean dWasPressed=false;// used to move right

boolean titleScreen=true;// boolean that displays title screen while true
PImage spacetitle;// title image
PImage startbutton;// start button image
PImage leftright;// controls image
PImage mouseshoot;//controls image
PImage enemycivilian;// scoring image
float titleX=550;// title image X position
float titleY=-350;// title image y position
float titleSpeed=5;// used to control the title moving down

float starSpeeds=(10); // how fast the stars move

int score=0; // score count
PImage scoreCount;// score image



PImage enemycar1; // enemy car image
PImage enemycar2;// second enemy car image
PImage enemycar3;// high ranking enemy image
float enemycarX1=random(-900, -7000);// X and Y positions of the enemy cars
float enemycarY1=random(0, 900);
float enemycarX2=random(-900, -7000);
float enemycarY2=random(0, 900);
float enemycarX3=random(-900, -7000);
float enemycarY3=random(0, 900);




PImage civiliancar1;// civilian cars 1 & 2 and their X and Y positions
PImage civiliancar2;
float civiliancarX1=random(-900, -7000);
float civiliancarY1=random(0, 900);
float civiliancarX2=random(-900, -7000);
float civiliancarY2=random(0, 900);


PImage powerUp;// powerup image and X and Y position
PImage powerupInfo;// power up info on title screen
float powerup;
float powerupX=920;
float powerupY=0;
boolean powerupActivated=false; // used to activate the powerup





void settings() {
  fullScreen(P3D); // P3D used as renderer for the 3D stars
}



void setup() {





  spaceRanger = loadImage("SPACE RANGER.png"); // initializing all of the images
  spacetitle = loadImage("SPACE TITLE.png");
  startbutton = loadImage("START BUTTON.png");
  leftright = loadImage("controls.png");
  mouseshoot = loadImage("MOUSE_SHOOT.png");
  enemycivilian = loadImage("CIVILIAN AND ENEMY.png");
  scoreCount = loadImage("SCORE.png");
  enemycar1= loadImage("enemy car.png");
  enemycar2= loadImage("enemy car.png");
  enemycar3= loadImage("enemy car3.png");
  civiliancar1= loadImage("Civilian car.png");
  civiliancar2= loadImage("Civilian car.png");
  powerUp= loadImage("POWERUP.png");
  powerupInfo= loadImage("POWERUP INFO.png");


  ballX=rangerX+50; // X and Y positions of the laser beam in relation to the spaceranger
  ballY=rangerY+50;

  starsY = new float[100];// amount of stars on screen at once
  xSpeeds = new float [100];
  starsX= new float [100];

  for (int i = 0; i < starsY.length; i++) { // getting 100 star values

    starsY[i]= random (0, height); // putting them in a random Y position
  }


  for (int i = 0; i < xSpeeds.length; i++) {// getting 100 star values
    xSpeeds[i] = random(-1, -2); // giving them random speeds
  }

  for (int i = 0; i < starsX.length; i++) { // getting 100 star values from the array

    starsX[i]= random (0, width);// giving them a random X value
  }

  startTime =-100000000; // used to control the timer and make it start once start is pressed

  minim = new Minim(this); // sound library

  song =  minim.loadFile("song.mp3");// loading the song using the library
  song.loop(); // putting the song on an indefinite loop
}






void draw() {
  background(0); // background

  if (titleScreen==true) { // what to display if the titlescreen si true

    instructions();
  }

  stars (); // stars display on titlescreen and in game
  song.play();// same with the song
  scorecount();// score always shows and resets when start is pressed



  if (titleScreen==false) {// the game which is displayed if title screen is false. game runs only when game is not over
    timer();
    spaceranger();
    laserbeam();
    enemycar1();
    enemycar2();
    enemycar3();
    civiliancar1();
    civiliancar2();
    gameOver();
  }
}





void stars () {



  for (int i = 0; i < starsY.length; i++) { // getting star values


    stroke(255);// stars are white

    strokeWeight(4);// using translate, pushMatrix and popMatrix to make the stars in the middle layer
    pushMatrix();
    translate(0, 0, 300);
    line(starsX[i], starsY[i], 100, starsX[i]+120, starsY[i], 100 );
    popMatrix();

    pushMatrix();// using translate, pushMatrix and popMatrix to make the stars in the background layer
    translate(0, 0, 100);
    strokeWeight(1);
    line(starsX[i], starsY[i], 100, starsX[i]+120, starsY[i], 100 );
    popMatrix();


    pushMatrix();// using translate, pushMatrix and popMatrix to make the stars in the foreground layer
    translate(0, 0, 500);
    strokeWeight(7);
    line(starsX[i], starsY[i], 100, starsX[i]+120, starsY[i], 100 );
    popMatrix();
  }

  for (int i = 0; i < xSpeeds.length; i++) { // getting values for each stars speed
    starsX[i] += xSpeeds[i]*starSpeeds;// starSpeeds and XSpeeds multiplied to make the stars go very fast 

    if (starsX[i]<0) { // used to reset the stars if they move off screen

      starsX[i]=random (width, width-20);
    }
  }
}




void laserbeam() {  // laserbeam code

  if ( mouseWasPressed ) { // activates as you press the mouse
    noStroke();
    fill(0, 255, 255);
    ellipse(ballX, ballY, 10, laserSize);

    ballY = ballY - dY; // makes the laser move
    if (wasShot==false) { // the reload system and makes it so that bullets dont shoot from your previous position
      ballX = rangerX + 50;
    }
    wasShot = true;
  }
  if (ballY<0) { // the reload system

    wasShot = false;
    mouseWasPressed=false; 
    ballY=rangerY+50;
  }




  if (mousePressed) { // used to fire laser beams
    mouseWasPressed=true;
  }
}




void spaceranger () { // spaceranger code

  image(spaceRanger, rangerX, rangerY, spaceRanger.height/4, spaceRanger.width/4);  //loading image

  if (keyPressed) { // used to move ranger left
    if (key == 'a' || key == 'A') {
      aWasPressed=true;
    }
  }


  if ( aWasPressed ) { // moves the ranger if you pressed a
    rangerX=rangerX-30;
    aWasPressed=false;// written so that you dont move indefinitely if you pressed a once
    if ( ballY < 0) {// used to shoot while moving left
      ballX = rangerX + 50;
    }
  }


  if (keyPressed) {// used to move ranger right
    if (key == 'd' || key == 'D') {
      dWasPressed=true;
    }
  }


  if ( dWasPressed ) {// moves the ranger if you pressed d
    rangerX=rangerX+30;
    dWasPressed=false;// written so that you dont move indefinitely if you pressed d once
    if ( ballY < 0) {//used to shoot while moving right
      ballX = rangerX + 50;
    }
  }


  if (rangerX>width-90) { // ranger cant move out of screen

    rangerX=width-90;
  }


  if (rangerX<0) { // ranger cant move out of screen

    rangerX=0;
  }
}




void instructions () { // title screen instructions,title and start button

  image(spacetitle, titleX, titleY, spacetitle.width, spacetitle.height);// load image of title


  if (titleY>150) { // stops the title when it reaches a certain point
    titleSpeed=0;

    image(startbutton, 870, 550, startbutton.width, startbutton.height);// loading images for controls, scoring and powerup info
    image(leftright, 600, 640, leftright.width, leftright.height);
    image(mouseshoot, 400, 620, mouseshoot.width, mouseshoot.height);
    image(enemycivilian, 500, 790, enemycivilian.width, enemycivilian.height);
    image(powerupInfo, 1200, 620);

    if (mousePressed) { // game and timer starts if start button pressed
      if (mouseX > 870 && mouseX < 870+200 && mouseY > 550 && mouseY < 550+200) {
        titleScreen=false;
        startTime=frameCount;
        score=0;
      }
    }
  } else { 
    titleY=titleY+titleSpeed;// makes title move down
  }
}
void scorecount() { // used to count the score

  textSize(64);
  fill(255);
  text(" " + score, 250, 80);
  image(scoreCount, 0, 0, scoreCount.width*5, scoreCount.height*5);// loading image of score
}




void timer () { // timer made by Mr. Seidel based on framecount

  timer = (frameCount-startTime)/60; //this is /60 because Processing defaults to 60 frames per second
  textSize(50);
  fill(255);
  text(timer+"s", width-90, 40);
}



void enemycar1 () { // first enemy car code

  image(enemycar1, enemycarX1, enemycarY1); // loading its image


  enemycarX1=enemycarX1+20; // speed at which it flies off screen


  if (enemycarX1>width) { // after it goes off screen it is reset and you get -5 score for not killing it

    enemycarX1=random(-5000, -900);
    enemycarY1=random(0, 900);
    score=score-5;
  }


  if (ballX>enemycarX1 && ballX<enemycarX1+250 && ballY>enemycarY1 && ballY<enemycarY1+114) { // collision detection for the laser and enemy car. +10 for killing it

    enemycarX1=random(-5000, -900);
    enemycarY1=random(0, 900);
    score=score+10;
  }
}



void enemycar2 () {// second enemy car code

  image(enemycar2, enemycarX2, enemycarY2);// speed at which it flies off screen


  enemycarX2=enemycarX2+20;


  if (enemycarX2>width) {// after it goes off screen it is reset and you get -5 score for not killing it

    enemycarX2=random(-5000, -900);
    enemycarY2=random(0, 900);
    score=score-5;
  }


  if (ballX>enemycarX2 && ballX<enemycarX2+250 && ballY>enemycarY2 && ballY<enemycarY2+114) {// collision detection for the laser and enemy car. +10 for killing it


    enemycarX2=random(-5000, -900);
    enemycarY2=random(0, 900);
    score=score+10;
  }
}





void enemycar3 () { // high ranking enemy car

  image(enemycar3, enemycarX3, enemycarY3);// loading the cars image


  enemycarX3=enemycarX3+20;// speed at which it flies off screen


  if (enemycarX3>width) {// after it goes off screen it is reset and you get -5 score for not killing it

    enemycarX3=random(-5000, -900);
    enemycarY3=random(0, 900);
    score=score-5;
  }


  if (ballX>enemycarX3 && ballX<enemycarX3+250 && ballY>enemycarY3 && ballY<enemycarY3+114) {// collision detection for the laser and high ranking enemy car. +10 for killing it

    score=score+10;
    powerup=random(1, 10);// powerup only drops from high ranking car
    enemycarX3=random(-5000, -900);
    enemycarY3=random(0, 900);
  }   


  if (powerup>9) { // my way of saying there is a 10% chance to get the powerup
    powerupActivated=true;
  }

  if (powerupActivated==true) { //image loads for power up if you have it and you get the HYPERBEAM
    image(powerUp, powerupX, powerupY);
    laserSize=1000;
    dY=100;
  }
}



void civiliancar1 () { // first civilian car

  image(civiliancar1, civiliancarX1, civiliancarY1);// loading image for the car


  civiliancarX1=civiliancarX1+10;// how fast it flies off the screen


  if (civiliancarX1>width) {// resets if it reaches the end of the screen

    civiliancarX1=random(-5000, -900);
    civiliancarY1=random(0, 900);
  }


  if (ballX>civiliancarX1 && ballX<civiliancarX1+250 && ballY>civiliancarY1 && ballY<civiliancarY1+114) { // hit detection for the civilian car. -25 for killing it

    civiliancarX1=random(-5000, -900);
    civiliancarY1=random(0, 900);
    score=score-25;
  }
}





void civiliancar2 () {// second civilian car

  image(civiliancar2, civiliancarX2, civiliancarY2);// loading image for the car


  civiliancarX2=civiliancarX2+10;// how fast it flies off the screen


  if (civiliancarX2>width) {// resets if it reaches the end of the screen

    civiliancarX2=random(-5000, -900);
    civiliancarY2=random(0, 900);
  }


  if (ballX>civiliancarX2 && ballX<civiliancarX2+250 && ballY>civiliancarY2 && ballY<civiliancarY2+114) {// hit detection for the civilian car. -25 for killing it

    civiliancarX2=random(-5000, -900);
    civiliancarY2=random(0, 900);
    score=score-25;
  }
}


void gameOver () { // gameover code

  if (timer==60) { //returns to tile screen and saves score if 60s have passed


    mouseWasPressed=false;
    titleScreen=true;
    text(" " + score, 250, 80);
    image(scoreCount, 0, 0, scoreCount.width*5, scoreCount.height*5);// loading image of score
    powerupActivated=false; //powerup is false after starting again


    enemycarX1=random(-5000, -900); //reseting positions of cars
    enemycarY1=random(0, 900);
    enemycarX2=random(-5000, -900);
    enemycarY2=random(0, 900);
    enemycarX3=random(-5000, -900);
    enemycarY3=random(0, 900);
    civiliancarX1=random(-5000, -900);
    civiliancarY1=random(0, 900);
    civiliancarX2=random(-5000, -900);
    civiliancarY2=random(0, 900);
  }
}