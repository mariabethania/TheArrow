class TailSystem {
  ArrayList<Tail> tArray;

  TailSystem() {
    tArray = new ArrayList<Tail>();
  }

  void addTail(float psx, float psy, float prevX, float prevY, float lfspn) {
    tArray.add(new Tail(psx, psy, prevX, prevY, lfspn));
  }


  void runTail() {
    for (int i = tArray.size()-1; i >= 0; i--) {
      Tail t = tArray.get(i); 
      t.update();
      t.display();

      if (t.isDead()) {
        tArray.remove(i);
      }
    }
  }
}
