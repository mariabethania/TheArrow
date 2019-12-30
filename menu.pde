void menu() {
  //bowTemp = moveBow;
  moveBow = height*0.8;
  strokeWeight(2);
  stroke(25);
  noFill();
  rect(width*0.505,height*0.504,width*0.6,height*0.5);
  stroke(200,150,0);
  fill(0,0,255,100);
  rect(width*0.5,height*0.5,width*0.6,height*0.5);
    pushMatrix();
    imageMode(CENTER);
    translate(width*0.5, height*0.35);
    rotate(PI*0.75);
    image(arrowMenu,0, 0);
    popMatrix();
  textAlign(CENTER,CENTER);
  textSize(height*0.063);
  fill(25);
  text("The Arrow", width*0.505,height*0.295);
  fill(0,225,0);
  text("The Arrow", width*0.5,height*0.29);
  if (timer1.getTime() < 15 && lifeCount > 0) {
      fill(25);
      text("Resume",width*0.503,height*0.453); // shadow
      text("Restart",width*0.5,height*0.573);
      fill(255,255,0);
      text("Resume",width*0.5,height*0.45);
      text("Restart",width*0.5,height*0.57);
  } else
    if (lifeCount == 0) {
      fill(25);
      text("Play Again",width*0.503,height*0.513); // shadow
      fill(255,255,0);
      text("Play Again",width*0.5,height*0.51);
    }
    else {

      fill(25);
      text("Play",width*0.503,height*0.513); // shadow
      fill(255,255,0);
      text("Play",width*0.5,height*0.51);
    }
  textSize(height*0.04);
  textAlign(RIGHT,BOTTOM);
  fill(25);
  text("Stats>",width*0.802,height*0.752);
  textAlign(LEFT,BOTTOM);
  text("<Quit",width*0.202,height*0.752);
  textAlign(RIGHT,BOTTOM);
  fill(255,255,0);
  text("Stats>",width*0.8,height*0.75);
  textAlign(LEFT,BOTTOM);
  text("<Quit",width*0.2,height*0.75);
}

void score() {
  //bowTemp = moveBow;
  moveBow = height*0.8;
  textAlign(CENTER,TOP);
  if (lifeCount == 0) {
    fill(255);
    textSize(height*0.074);
    text("GAME OVER", width*0.5,height*0.03);
    textSize(height*0.07);
    fill(255,255*(lifeCount*0.3),0);
    text(lifeCount+" Lives left", width*0.5,height*0.13);
  }
  noFill();
  stroke(25);
  rect(width*0.505,height*0.504,width*0.6,height*0.5);
  stroke(200,150,0);
  fill(0,0,255,100);
  rect(width*0.5,height*0.5,width*0.6,height*0.5);
    pushMatrix();
    imageMode(CENTER);
    translate(width*0.5, height*0.35);
    rotate(PI*0.75);
    image(arrowMenu,0, 0);
    popMatrix();
    if (lifeCount > 0) {
      textSize(height*0.07);
      fill(255,255*(lifeCount*0.3),0);
      text(lifeCount+" Lives left", width*0.5,height*0.13);
    }
  textAlign(CENTER,CENTER);
  textSize(height*0.063);
  fill(25);
  text("The Arrow", width*0.505,height*0.295);
  fill(0,225,0);
  text("The Arrow", width*0.5,height*0.29);
  textAlign(LEFT,BOTTOM);
  textSize(height*0.034);
  fill(255,255,0);
  text(" Points",width*0.2,height*0.42);
  text(" Lives Won",width*0.2,height*0.48);
  fill(255);
  text("  Bull's Eye",width*0.2,height*0.52);
  text("  4+ MultiHit",width*0.2,height*0.56);
  fill(255,255,0);
  text(" Lives Lost",width*0.2,height*0.6);
  fill(255);
  text("  Ghosts",width*0.2,height*0.64);
  text("  Balloons",width*0.2,height*0.68);
  fill(25);
  text("<Menu",width*0.202,height*0.752);
  fill(255,255,0);
  text("<Menu",width*0.2,height*0.75);
  textAlign(RIGHT,BOTTOM);
  fill(255,255,0);
  text(points+" ",width*0.8,height*0.42);
  text(lifeWon+" ",width*0.8,height*0.48);
  fill(255);
  text(bull+" ",width*0.8,height*0.52);
  text(hit+" ",width*0.8,height*0.56);
  fill(255,255,0);
  text(lifeLost+" ",width*0.8,height*0.6);
  fill(255);
  text(ghostCount+" ",width*0.8,height*0.64);
  text(miss+" ",width*0.8,height*0.68);

}

//pop1 = new SoundFile(this,"burst1.mp3");
//pop2 = new SoundFile(this,"burst2.mp3");
//pop3 = new SoundFile(this,"burst3.mp3");
//pop4 = new SoundFile(this,"pop1.mp3");
//arrow1 = new SoundFile(this,"arrow1.mp3");
