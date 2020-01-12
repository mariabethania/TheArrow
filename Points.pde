class Points {
  String points;
  PVector vel;
  PVector pos;
  PVector acc;
  int r,g,b;
  float sz;
  Points(float x, float y, String points_, int r_,int g_,int b_,float sz_) {
    points = new String(points_);
    pos = new PVector(x, y);
    vel = new PVector(0, -2);
    acc = new PVector(0, 0.2);
    r = r_;
    g = g_;
    b = b_;
    sz = sz_;    
  }

  void update() {
    vel.add(acc);
    pos.add(vel);
  }

  void display() {
    fill(r, g, b);
    textSize(sz);
    text(points, pos.x, pos.y);
  }

  boolean isDead() {
    if (pos.y > height || pos.y < 0) {
      return true;
    } else {
      return false;
    }
  }
}
