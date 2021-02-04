
//este es el mero

//import processing.sound.*;
import cassette.audiofiles.SoundFile;

SoundFile pop1, pop2, pop3, pop1b, pop2b, pop3b, pop4, ghost1, ghost2, ghost3,ding1;
SoundFile arrow1, arrow2, arrow3, arrow4;
SoundFile target1, chimes;
//float arrowPNG;
int px, py, rx, ry, dx, dy; // mouse & pressed and released variables
float x, y, xv, yv, xa, ya;
PImage ballon;
Timer timer, timer1;
Timer ghostTimer;

float delay = 1.5;
BalloonSystem bs;
Balloon balloon;
PlopSystem ps;
//Arrow arrw;
ArrowSystem as;
TailSystem ts;
Target trgt;
PImage arrowMenu;
PImage bkg1, bkg2;
PImage bow, bowArrow, arrowMain;
float arrowX, arrowY,arrowX1, arrowY1,arrowX2, arrowY2,arrowX3, arrowY3,arrowX4, arrowY4,arrowX5, arrowY5;
float moveBow;
//float arrowTipX, arrowTipY, arrowTailX, arrowTailY, 
//float rotateX, rotateY;
int lifeCount, lifeLost;
int points;
int miss, hit, hitCountText, hitCount, ghostCount;
int lifeWon, bull;
boolean showLn = false;
boolean menuBool = true;
boolean scoreBool = false;
int transparency = 0;
float bowTemp;
float minVel = 0;


void setup() {
  //size(394, 700, P2D);
  orientation(PORTRAIT);
  size(displayWidth,displayHeight,P2D);
  pop1 = new SoundFile(this, "burst1.mp3");
  pop2 = new SoundFile(this, "burst2.mp3");
  pop3 = new SoundFile(this, "burst3.mp3");
  pop1b = new SoundFile(this, "burst1b.mp3");
  pop2b = new SoundFile(this, "burst2b.mp3");
  pop3b = new SoundFile(this, "burst3b.mp3");
  pop4 = new SoundFile(this, "pop1.mp3");
  ghost1 = new SoundFile(this, "ghost1.mp3");
  ghost2 = new SoundFile(this, "ghost2Low.mp3");
  ghost3 = new SoundFile(this, "ghost3.mp3");
  arrow1 = new SoundFile(this, "arrow1.mp3");
  arrow2 = new SoundFile(this, "arrow2.mp3");
  arrow3 = new SoundFile(this, "arrow3.mp3");
  arrow4 = new SoundFile(this, "arrow4.mp3");
  //ding1 = new SoundFile(this, "Sound 6.mp3");
  target1 = new SoundFile(this, "target1.mp3");
  chimes = new SoundFile(this, "fairy1.mp3");
  ding1 = new SoundFile(this, "ding1.mp3");

  moveBow = height*0.8;
  bowTemp = height*0.7;
  //rotateX = width*0.5;
  //rotateY = 0;
  bkg1 = loadImage("skyGrass2.jpg");
  bkg1.resize(int(width*1.33), height);
  bkg2 = loadImage("skyGrassLargeR.jpg");
  bkg2.resize(width, height);
  arrowMenu = loadImage("arrowDiagonal.png");
  arrowMenu.resize(int(width*0.35), int(width*0.35));
  bow = loadImage("bow1.png");
  bow.resize(int(width), int(height*0.3));
  bowArrow = loadImage("bow2.png");
  bowArrow.resize(int(width), int(height*0.15));
  arrowMain = loadImage("arrow2.png");
  arrowMain.resize(int(width*0.03), int(height*0.15));
  bs = new BalloonSystem();
  ps = new PlopSystem();
  //arrw = new Arrow(0, 0, 0, 0);
  as = new ArrowSystem();
  ts = new TailSystem();
  trgt = new Target(width, random(height*0.01, height*0.5));
  balloon = new Balloon();
  lifeCount = 3;
  points = 0;
  miss = 0;
  //arrowTailX = width*0.5;
  //arrowTailY = height*0.75;
  //arrowTipX = width*0.5;
  //arrowTipY = arrowTailY-height*0.65;
  timer = new Timer(delay);
  timer1 = new Timer(15);
  ghostTimer = new Timer(random(20, 30));
  rectMode(CENTER);
  strokeWeight(5);
}

void draw() {
  background(0, 150, 100);
  imageMode(CORNER);
  if (height > width) {
    image(bkg1, 0, 0);
  } else {
    image(bkg2, 0, 0);
  }
  image(bowArrow, 0, moveBow); 
  //println(arrw.tip.x,arrw.tip.y);
  if (lifeCount <= 0 && !menuBool) {
    scoreBool = true;
    menuBool = false;
  }

  if (menuBool && !scoreBool) { //************************** starts game Menu
    menu();
  } else if (scoreBool && !menuBool) {
    score();
  } else {
    stroke(255, 100);
    line(0, moveBow, width, moveBow);
    textAlign(CENTER, TOP);
    textSize(height*0.07);
    fill(255, 255*(lifeCount*0.3), 0);
    text(lifeCount, width*0.5, height*0.03);
    textSize(height*0.028);
    text("Lifes", width*0.5, 0);
    //textAlign(CENTER, TOP);
    textSize(height*0.07);
    //fill(255, 255*(lifeCount*0.3), 0);
    fill(255, 220, 0);
    if (hitCountText > 0) {
      text("+"+hitCountText+" lifes", width*0.5, height*0.5);
      balloon.vel.y += 0.1;
    }

    textSize(height*0.04);
    fill(50, 200, 255);
    text(points, width*0.1, height*0.03);
    textSize(height*0.028);
    text("Points", width*0.1, 0);

    textSize(height*0.04);
    fill(255);
    text(bull, width*0.9, height*0.03);
    textSize(height*0.028);
    text("BEye", width*0.9, 0);
    // runs skull
    ghostTimer.countDown();
    if (ghostTimer.getTime() <= 0) {
      for (int i = 0; i < 1; i++) {
        bs.addGhost();
        ghostTimer.setTime(random(20, 30));
        ghost1.play();
      }
    }
    bs.runGhost();
    // runs target
    timer1.countDown();
    if (timer1.getTime() <= 0) {
      trgt.update();
      trgt.display();
      //bs.runTarget();
    }

    if (trgt.x+(trgt.rad*2) <= 0) {
      trgt.x = width+trgt.rad;
      trgt.y = random(height*0.1, moveBow*0.5);
      timer1.setTime(15);
      bs.addTarget();
    }

    //arrowTailY = dy;//arrowTailY+height*0.15;
    //pushMatrix();
    //imageMode(CENTER);
    //translate(dx,dy);//(arrowTailX,arrowTailY);
    //rotate(rotateX);
    //image(arrowMain,0,-arrowTipY);
    //popMatrix();
    if (py > moveBow) {
      noStroke();
      fill(255, 255, 0, transparency);
      ellipse(px, py, width*0.02, width*0.02);
      strokeWeight(2);
      stroke(100, 50, 20, transparency);
      line(px, py, dx, dy);
    }
    // runs balloons
    timer.countDown();
    if (timer.getTime() <= 0) {
      for (int i = 0; i < 1; i++) {
        bs.addBalloon();
        timer.setTime(delay);
      }
    }
    bs.runBalloon();

    as.runArrow();
    ts.runTail();
  }
  // determines mouse position in order to show arrow guide
}

void mousePressed() {
  if (menuBool && !scoreBool) {
    if (mouseX > width*0.4 && mouseX < width*0.6 && mouseY > height*0.42 && mouseY < height * 0.48 
      && timer1.getTime() < 15 && lifeCount > 0) {
      menuBool = false;
      scoreBool = false;
      moveBow = bowTemp;
    } else 
    if (mouseX > width*0.4 && mouseX < width*0.6 && mouseY > height*0.54 && mouseY < height *0.6 
      && timer1.getTime() < 15 && lifeCount > 0) {
      menuBool = false;
      scoreBool = false;
      bs = new BalloonSystem();
      ps = new PlopSystem();
      as = new ArrowSystem();
      ts = new TailSystem();
      balloon = new Balloon();
      trgt = new Target(width, random(height*0.01, moveBow*0.5));
      lifeCount = 3;
      points = 0;
      miss = 0;
      hit = 0;
      timer1.setTime(15);
      lifeWon = 0;
      lifeLost = 0;
      bull = 0;
      moveBow = bowTemp;
      delay = 1.5;
      ghostCount = 0;
      minVel = 0;
    } else 
    if (mouseX > width*0.4 && mouseX < width*0.6 && mouseY > height*0.48 && mouseY < height * 0.54 
      && timer1.getTime() == 15 && lifeCount > 0) {
      menuBool = false;
      scoreBool = false;
      moveBow = bowTemp;
    } else 
    if (mouseX > width*0.2 && mouseX < width*0.8 && mouseY > height*0.48 && mouseY < height * 0.54 && lifeCount == 0) {
      menuBool = false;
      scoreBool = false;
      bs = new BalloonSystem();
      ps = new PlopSystem();
      as = new ArrowSystem();
      ts = new TailSystem();
      balloon = new Balloon();
      trgt = new Target(width, random(height*0.01, moveBow*0.5));
      lifeCount = 3;
      points = 0;
      miss = 0;
      hit = 0;
      timer1.setTime(15);
      lifeWon = 0;
      lifeLost = 0;
      bull = 0;
      moveBow = bowTemp;
      delay = 1.5;
      ghostCount = 0;
      minVel = 0;
    } else
      if (mouseX > width*0.57 && mouseX < width*0.8 && mouseY > height*0.7 &mouseY < height*0.75) {
        menuBool = false;
        scoreBool = true;
        //moveBow = height*0.7;
      } else 
      if (mouseX > width*0.2 && mouseX < width*0.4 && mouseY > height*0.7 &mouseY < height*0.75) {
        exit();
        //moveBow = height*0.7;
      }
  } else if (!menuBool && scoreBool) {
    if (mouseX > width*0.2 && mouseX < width*0.8 && mouseY > height*0.25 && mouseY < height*0.75) {
      menuBool = true;
      scoreBool = false;
      //bs = new BalloonSystem();
      //ps = new PlopSystem();
      //as = new ArrowSystem();
      //ts = new TailSystem();
      //balloon = new Balloon();
      //trgt = new Target(width, random(height*0.01, moveBow*0.5));
      //lifeCount = 3;
      //points = 0;
      //miss = 0;
      //timer1.setTime(15);
      //lifeWon = 0;
      //bull = 0;
    }
  } else 
  if (!menuBool && !scoreBool) {
    if (mouseX > width*0.47 && mouseX < width*0.55 && mouseY < height*0.1) {
      menuBool = true;
      scoreBool = false;
    }
  }
  //if (mouseY > height*0.7) {
  px = mouseX; 
  py = mouseY;
}

void mouseDragged() {
  //rotateX = (pmouseX-mouseX)*0.09;
  //rotateY = (pmouseY-mouseY)*0.09;
  //arrowTailX = mouseX;
  //arrowTailY = mouseY;
  //arrowTipX = mouseX;
  //line(px,py,mouseX,mouseY);  
  if ((mouseX < width*0.1 || mouseX > width*0.9) && mouseY < moveBow) {
    moveBow = mouseY+(height*0.1);
    bowTemp = mouseY+(height*0.1);
  }
  //if (mouseY < moveBow) {
  //moveBow = mouseY;
  //}
  transparency = 255;//}
  dx = mouseX;
  dy = mouseY;
}

void mouseReleased() {
  transparency = 0;
  rx = mouseX;
  ry = mouseY;
  if (py > moveBow && ry > moveBow) {
    xv = map((px - rx), 0, width, 0, width*0.2);
    yv = map((py - ry), 0, height, 0, height*0.2);
    //arrowTailY -= yv;
    //arrowTailX += xv;
    //arrowTipY += arrowTailY-height*0.15;
    //arrowTipX += xv;
    if (!menuBool) {
      as.addArrow(px, py, xv, yv, xv*0.05);
      //arrow1.setGain(-10);
      //arrow1.amp(-0.7);
      int num = floor(random(1, 5));
      //println(num);
      switch(num) {
      case 1:
        arrow1.play();
        break;
      case 2:
        arrow2.play();
        break;
      case 3:
        arrow3.play();
        break;
      case 4:
        arrow4.play();
        break;
      }
    }
  }
  dx = px;
  dy = py;
}
