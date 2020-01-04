class ArrowSystem {

   ArrayList<Arrow> aArray;

   ArrowSystem() {
      aArray = new ArrayList<Arrow>();
   }

   void addArrow(float x, float y, float vX,float vY,float rota){
      aArray.add(new Arrow(x,y, vX, vY));
         //hitCount = 0;
         //target1.pause();
         //target1.rewind();
   }

   void runArrow() {
      for (int i = aArray.size()-1; i >= 0; i--) {
         Arrow a = aArray.get(i);
         a.update();
         a.display();

         if (a.isDead()) {
            aArray.remove(i);
            hitCount = 0;
            hitCountText = 0;
         }
      }
   }

}  
  
