class Tail {

  PVector location;
  //PVector velocity;
  //PVector acceleration;
  PVector col;
  float rad;
  float lineX, lineY;

  float lifespan = 255;

  Tail(float px, float py, float prevX, float prevY, float lfspn) {
    //for(int i = 0; i < 1;i++) {
    location = new PVector(px, py);
    //velocity = new PVector(vx,vy);
    //acceleration = new PVector0,0;
    col = new PVector(100, 50, 20);
    rad = width*0.03;
    lineX = prevX;
    lineY = prevY;
    lifespan = lfspn;
    //}
  }

  void update() {
    //acceleration.x = -1;
    //velocity.add(acceleration);
    //location.add(velocity);
    lifespan -= 60;
  }

  boolean isDead() {
    if (lifespan <= 0) {
      return true;
    } else {
      return false;
    }
  }

  void display() {
    strokeWeight(2);
    stroke(col.x, col.y, col.z);
    //fill(0);//col.x,col.y,col.z,lifespan);
    //ellipse(location.x,location.y,rad,rad);
    line(lineX, lineY, location.x, location.y);
    //line(location.x,location.y,lineX,lineY);
  }
}
