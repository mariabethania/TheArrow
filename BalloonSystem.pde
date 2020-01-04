class BalloonSystem {
  ArrayList<Balloon> bArray;
  ArrayList<Target> target;
  ArrayList<Ghost> ghost;

  BalloonSystem() {
    bArray = new ArrayList<Balloon>();
    target = new ArrayList<Target>();
    ghost = new ArrayList<Ghost>();
  }

  void addBalloon() {
    bArray.add(new Balloon());
  }

  void addTarget() {
    target.add(new Target(width, random(height)));
  }

  void addGhost() {
    ghost.add(new Ghost());
  }

  void runBalloon() {
    for (int i = bArray.size()-1; i >= 0; i--) {
      Balloon b = bArray.get(i);
      b.update();
      b.display();

      if (b.isDead()) {
        bArray.remove(i);
        for (int n = 0; n < 5; n++) {
          ps.addPlop(b.pos.x, b.pos.y, b.red, b.green, b.blue);
        }
      }
    }
    ps.runPlop();
  }

  void runTarget() {
    for (int i = target.size()-1; i >= 0; i--) {
      Target t = target.get(i);
      t.update();
      t.display();

      if (t.isDead()) {
        target.remove(i);
      }
    }
  }

  void runGhost() {
    for (int i = ghost.size()-1; i >= 0; i--) {
      Ghost g = ghost.get(i);
      g.update();
      g.display();

      if (g.isDead()) {
        //pop4.setGain(-5);
        //pop4.amp(0.5);
        //pop4.play();
        ghost.remove(i);
      }
    }
    ps.runPlop();
    ps.runPoints();
  }
}  
