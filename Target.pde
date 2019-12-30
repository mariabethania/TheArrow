class Target {
  float rad = width*0.15;
    float x;
    float y;
    PImage buEy;
  
  Target(float x_,float y_) {
    x = x_;
    y = y_;
  //imageMode(CENTER);
    buEy = loadImage("target.png");
    buEy.resize(int(rad),int(rad));
  }

void update() {
  x -= 2;
}

   boolean isDead() {
      if (x < 0)
        {
          return true;
        } else {
         return false;
        }
      }
       
void display() {
  imageMode(CORNER);
image(buEy,x,y);
      //if (showLn) {
      //  fill(255,175,0);
      //textAlign(LEFT,BOTTOM);
      //textSize(32);
      //text("+50",trgt.x,trgt.y);
      //}
  //fill(255,0,0);
  //  ellipse(x,y,rad,rad);
  //fill(255);
  //  ellipse(x,y,rad*0.8,rad*0.8);
  //fill(255,0,0);
  //  ellipse(x,y,rad*0.6,rad*0.6);
  //fill(255);
  //  ellipse(x,y,rad*0.4,rad*0.4);
  //fill(255,0,0);
  //  ellipse(x,y,rad*0.2,rad*0.2);
}


}
