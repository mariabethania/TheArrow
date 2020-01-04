class Points {
  String points;
  PVector vel;
  PVector pos;
  PVector acc;
  Points(float x, float y, String points_) {
    points = new String(points_);
    pos = new PVector(x, y);
    vel = new PVector(0, -2);
    acc = new PVector(0, 0.2);
  }

  void update() {
    vel.add(acc);
    pos.add(vel);
  }

  void display() {
    fill(255, 0, 0);
    textSize(height*0.057);
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
