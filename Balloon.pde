class Balloon {
  PVector pos;
  PVector vel;
  PVector acc;
  float red, green, blue;
  float lifespan = 255;
  float rad = height*0.06;
  float not = rad*0.3;
  float triB = rad*0.07;
//float arrowX, arrowY;
  int num = 0;

  Balloon() {
    //for (int i =0; i < 1; i++) {
    vel = new PVector(random(-(height*0.0010715), (height*0.0010715)), random((height*0.0007)+minVel, (height*0.0015)+minVel));
    acc = new PVector(0, 0);
    pos = new PVector(random(width*0.2, width*0.8), -(rad*0.5));
    red = random(100, 255);
    green = random(50, 255);
    blue = random(50, 255);
      //arrowX = x;
      //arrowY = y;
    //}
  }

  void update() {
    //lifespan -= 0.2;
    if  ((arrowX >= pos.x-(rad*0.5)) 
      && (arrowY >= pos.y-(rad))
      && (arrowX <= pos.x+(rad*0.5)) 
      && (arrowY <= pos.y+(rad*0.5))
      && pos.y+(rad*0.5) > 0
      )
      //if  ((arrw.tip.x >= pos.x-(rad*0.5)) 
      //  && (arrw.tip.y >= pos.y-(rad))
      //  && (arrw.tip.x <= pos.x+(rad*0.5)) 
      //  && (arrw.tip.y <= pos.y+(rad*0.5)) 
      //  )
    { 
      hitCount++;
      points++;
      //hitCountText = hitCount;
      if (hitCount > 3) {
        lifeWon += 1;
        lifeCount += 1;
        hitCountText += 1;
        hit += 1;
        minVel += height*0.00007;
      }        
      //if (num < 3) {
      //  num++;
      //} else {
      //  num = 0;
      //}
      num = int(random(1, 7));
      //println(num);
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
    vel.add(acc);
    pos.add(vel);
  }

  boolean isDead() {
    if (pos.y+(rad*0.49) > moveBow || pos.y+(rad*0.49) > height) {
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
    } else if (lifespan <= 0) {
      return true;
    } else {
      return false;
    }
  }
  //void displayGhost() {
  //image(ghost,pos.x,pos.y); 
  //}
  void display() {
    noStroke();
    strokeWeight(2);
    //stroke(red+20, green+20, blue+20);
    fill(red, green, blue);
    //pushMatrix();
    triangle(pos.x, pos.y+(not+triB), pos.x-triB, pos.y+(not*2), pos.x+triB, pos.y+(not*2));
    ellipse(pos.x, pos.y, rad*0.85, rad);
    //image(ghost,pos.x,pos.y);
  }
}  
