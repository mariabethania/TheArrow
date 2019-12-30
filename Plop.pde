class Plop {
   PVector pos;
   PVector vel;
   PVector acc;
   float red,green,blue;
   float lifespan = 255;
   float rad = width*0.03;
   float rota;
   boolean hitBool;
 
   Plop(float x, float y,float red_,float green_, float blue_) {
      //for (int i =0; i < 1; i++) {
         pos = new PVector(x,y);
         vel = new PVector(random(-2,2),random(-4,0));
         acc = new PVector(0,0.1);
         red = red_;
         green = green_;
         blue = blue_;
         hitBool = true;
      //}
   }
  
   void update(){
      vel.add(acc);
      pos.add(vel);
      lifespan -= 1;
      //rota -= 0.1;
   }
  
   boolean isDead() {
      if (lifespan < 0) {
         return true;
      } else {
         return false;
      }
   }

   void display() {
      noStroke();
      fill(red,green,blue,lifespan);
      //pushMatrix();
      //translate(pos.x,pos.y);
      //rotate(random(-rota,rota));
      ellipse(pos.x,pos.y,rad,rad);
//fill(255,150,0);
//textSize(24);
//textAlign(CENTER,CENTER);
//text("+"+hitCount,pos.x,pos.y);

//popMatrix();
      //ellipse(pos.x,pos.y,rad*0.725,rad*0.75);
 }

}  
  
