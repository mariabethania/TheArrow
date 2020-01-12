class PlopSystem {

  ArrayList<Plop> pArray;
  ArrayList<Points> points;


  PlopSystem() {

    pArray = new ArrayList<Plop>();
    points = new ArrayList<Points>();
  }



  void addPlop(float x_, float y_, float red_, float green_, float blue_) {

    pArray.add(new Plop(x_, y_, red_, green_, blue_));
  }
  void addPoints(float x, float y, String points_,int r_,int g_,int b_, float sz_) {
    points.add(new Points(x, y, points_,r_,g_,b_,sz_));
  }
  void runPlop() {
    for (int i = pArray.size()-1; i >= 0; i--) {
      Plop p = pArray.get(i);
      p.update();
      p.display();

      if (p.isDead()) {
        pArray.remove(i);
      }
    }
  }

  void runPoints() {
    for (int i = points.size()-1; i >= 0; i--) {
      Points p = points.get(i);
      p.update();
      p.display();

      if (p.isDead()) {
        points.remove(i);
      }
    }
  }
}  
