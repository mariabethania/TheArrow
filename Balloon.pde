class Balloon {
  PVector pos;
  PVector vel;
  PVector acc;
  float red, green, blue;
  float lifespan = 255;
  float rad = height*0.06;
  float not = rad*0.3;
  float triB = rad*0.07;
  int num = 0;

  Balloon() {
    //for (int i =0; i < 1; i++) {
    vel = new PVector(random(-0.75, 0.75), random(0.5, 1.5));
    acc = new PVector(0, 0);
    pos = new PVector(random(width*0.25, width*0.75), 0);
    red = random(50, 255);
    green = random(50, 235);
    blue = random(50, 235);
    //}
  }

  void update() {
    vel.add(acc);
    pos.add(vel);
    //lifespan -= 0.2;
    if  ((arrowX >= pos.x-(rad*0.5) || arrowX-5 >= pos.x-(rad*0.5)) 
      && (arrowY >= pos.y-(rad*0.5) || arrowY-5 >= pos.y-(rad*0.5))
      && (arrowX <= pos.x+(rad*0.5) || arrowX+3 <= pos.x+(rad*0.5)) 
      && (arrowY <= pos.y+(rad*0.5) || arrowY+5 <= pos.y+(rad*0.5) || arrowY-5 <= pos.y+(rad*0.5)) 
      )
    { 
      hitCount++;
      points++;
      //hitCountText = hitCount;
      if (hitCount > 3) {
        lifeWon += 1;
        lifeCount += 1;
        hitCountText += 1;
        hit += 1;
      }        
      //if (num < 3) {
      //  num++;
      //} else {
      //  num = 0;
      //}
      num = int(random(1,7));
      println(num);
      switch (num) {
      case 1:
        pop1.play();
        break;
      case 2:
        pop2.play();
        break;
      case 3:
        pop3.play();
        break;
      case 4:
        pop1b.play();
        break;
      case 5:
        pop2b.play();
        break;
      case 6:
        pop3b.play();
        break;
      }
      lifespan = 0;
    }
  }

  boolean isDead() {
    if (pos.y+(rad*0.49) > moveBow) {
      points -= 10;
      lifeCount -= 1;
      lifeLost -= 1;
      miss -= 1;
      ps.addPoints(pos.x, pos.y, "-1");
      //pop4.setGain(-5);
      //pop4.amp(0.5);
      pop4.play();
      return true;
    } else if (pos.x < rad*0.49 || pos.x+(rad*0.49) > width)
    {
      //points--;
      //miss++;
      vel.x *= -1;
      return false;
    } else if (lifespan == 0) {
      return true;
    } else {
      return false;
    }
  }
  //void displayGhost() {
  //image(ghost,pos.x,pos.y); 
  //}
  void display() {
    //noStroke();
    strokeWeight(2);
    stroke(red+20, green+20, blue+20);
    fill(red, green, blue);
    //pushMatrix();
    triangle(pos.x, pos.y+(not+triB), pos.x-triB, pos.y+(not*2), pos.x+triB, pos.y+(not*2));
    ellipse(pos.x, pos.y, rad*0.9, rad);
    //image(ghost,pos.x,pos.y);
  }
}  
