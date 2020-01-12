class Ghost {
  PImage ghost;
  PVector pos;
  PVector vel;
  PVector acc;
  float rad = height*0.085;
  int lifespan;
  int num;

  Ghost() {
    pos = new PVector(random(width*0.3, width*0.7), -(rad*0.5));
    vel = new PVector(random(-(height*0.0010715), (height*0.0010715)), random((height*0.0007), (height*0.0015)));
    acc = new PVector(0, 0);
    ghost = loadImage("skull1.png");
    ghost.resize(int(rad), int(rad));
    lifespan = 255;
  }
  void update() {
    if  (arrowX >= pos.x-(rad*0.5) 
      && arrowY >= pos.y-(rad*0.5)
      && arrowX <= pos.x+(rad*0.5) 
      && arrowY <= pos.y+(rad*0.5) 
      && pos.y > 0
      )
    { 
background(255,0,0);
      //hitCount++;
      //points -= 50;
      ghostCount -= 1;
      lifeLost -= 1;
      lifeCount -= 1;
      ps.addPoints(pos.x, pos.y, "-1 Lives",255,0,0,height*0.057);
      //ghost2.setGain(-10);
      //ghost2.amp(0.5);
      ghost2.play();
      lifespan = 0;
      for (int n = 0; n < 20; n++) {
        ps.addPlop(pos.x, pos.y, 200, 0, 0);//random(75,200),random(50),random(50));
      }
    }
    vel.add(acc);
    pos.add(vel);
  }

  boolean isDead() {
    if (pos.y > height-(rad*0.5)) {
      //points -= 50;
      //lifeCount -= 1;
      //miss -= 1;
      //pop4.setGain(-5);
      //pop4.amp(0.5);
      //pop4.play();
      for (int n = 0; n < 5; n++) {
        ps.addPlop(pos.x, pos.y, 255, 255, 255);//random(75,200),random(50),random(50));
      }
      ghost3.play();
      return true;
    } else if (pos.x < + 0 || pos.x > width)
    {
      //points--;
      //miss++;
      //vel.x *= -1;
      //pop4.setGain(-5);
      //pop4.amp(0.5);
      //pop4.play();
      for (int n = 0; n < 5; n++) {
        ps.addPlop(pos.x, pos.y, 255, 255, 255);//random(75,200),random(50),random(50));
      }
      ghost3.play();
      return true;
    } else if (lifespan == 0) {
      return true;
    } else {
      return false;
    }
  }

  void display() {
    imageMode(CENTER);
    image(ghost, pos.x, pos.y);
  }
}
