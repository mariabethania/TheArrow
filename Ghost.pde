class Ghost {
   PImage ghost;
   PVector pos;
   PVector vel;
   PVector acc;
   float rad = height*0.075;
   int lifespan;
   int num;

  Ghost() {
        pos = new PVector(random(width*0.25,width*0.75),0);
        vel = new PVector(random(-0.75,0.75),random(0.5,1.5));
        acc = new PVector(0,0);
        ghost = loadImage("ghost1.png");
        ghost.resize(int(rad),int(rad));
        lifespan = 255;
  }
   void update(){
     vel.add(acc);
      pos.add(vel);
    if  (arrowX >= pos.x-(rad*0.5) 
      && arrowY >= pos.y-(rad*0.5)
      && arrowX <= pos.x+(rad*0.5) 
      && arrowY <= pos.y+(rad*0.5) 
      )
    { 
      //hitCount++;
      //points -= 50;
      ghostCount -= 1;
      lifeLost -= 1;
      lifeCount -= 1;
      ps.addPoints(pos.x,pos.y,"-1");
      //ghost2.setGain(-10);
      //ghost2.amp(0.5);
      ghost2.play();
      lifespan = 0;
    }
 }
  
   boolean isDead() {
      if (pos.y+(rad*0.5) > height) {
        //points -= 50;
        //lifeCount -= 1;
        //miss -= 1;
        //pop4.setGain(-5);
        //pop4.amp(0.5);
        pop4.play();
        ghost3.play();
         return true;
      } else if(pos.x-(rad*0.5) < 0 || pos.x+(rad*0.5) > width)
       {
         //points--;
         //miss++;
         //vel.x *= -1;
        //pop4.setGain(-5);
        //pop4.amp(0.5);
        pop4.play();
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
      image(ghost,pos.x,pos.y);
   }
}
