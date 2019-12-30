class Arrow {
   //PVector tail;
   PVector tip;
   PVector vel;
   PVector acc;
   float rad = width*0.02;
   float lifespan;
   float grvt;
   float prevX,prevY;
   float tempX,tempY;
   boolean tempBool;
PImage arrow; 
float rotateArrow;
float rotaIncDec;
int hitCount;

   Arrow(float x, float y, float vX,float vY,float rota) {
      //for (int i =0; i < 1; i++) {
         tip = new PVector(x,y);
         //tail = new PVector(tailX,tailY);
         vel = new PVector(vX,vY);
         acc = new PVector(0,0);
         grvt = -height*0.00005;
         lifespan = 255;
         tempBool = true;
    arrow = loadImage("arrowDiagonal.png");
    arrow.resize(int(height*0.1),int(height*0.1));
    rotateArrow = rota;
    hitCount = 0;
      //}
   }
  
   void update(){
     //prevX = tip.x;
     //prevY = tip.y;
    //if (bs.runBalloon().b.isDead()) 
    //{ 
      //hitCount += 1;
      //hitCountText = hitCount;
      //if (hitCount > 1) {
      //  lifeCount += 1;
      //  hitCount = 0;
      //}
    //}
     
  if (tip.y <= trgt.y+(trgt.rad*0.99) && tip.y >= trgt.y+(trgt.rad*0.1) && tip.x >= trgt.x+(trgt.rad*0.01) 
      && tip.x <= trgt.x+(trgt.rad*0.99)) {
     prevX = tip.x;
     prevY = tip.y;
        if (tempBool) {
          //target1.stop();
          target1.play();
          tempX = tip.x-trgt.x;
          tempY = random(trgt.y+(trgt.rad*0.25),trgt.y+(trgt.rad*0.75));
          //println(trgt.x+" + "+temp);
          points++;
          tempBool = false;
            if (tempX >= width*0.065 && tempX <= width*0.088) {
      for (int i = 0; i < 10; i++) {
        bs.addBalloon();
      }
              lifeCount += 1;
              lifeWon += 1;
              bull += 1;
              points += 50;
              delay -= 0.01;
              tempY = trgt.y+(trgt.rad/2);
              hitCountText += 1;
            }
        }
    tip.y = tempY;//trgt.y+(trgt.rad/2);
    tip.x = trgt.x+(tempX);//+(arrowX-trgt.x);
    //lifespan = 0;
    if (tempX >= width*0.065 && tempX <= width*0.088) {
      fill(255,220,0);
      textAlign(LEFT,BOTTOM);
      textSize(height*0.046);
      text("+50",trgt.x,trgt.y);
    }
} else 
  {
     prevX = tip.x;
     prevY = tip.y;
      acc.y -= grvt;
      vel.add(acc);
      tip.add(vel);
      
      arrowX = tip.x;
      arrowY = tip.y;
      //if (arrowX < 0 || arrowX > width || arrowY < 0 || arrowY > height) {
      //  arrowX = width/2;
      //  arrowY = height;
      //}
     rotaIncDec = (rotateArrow);

     //if (vel.x < 0){
     //rotaIncDec -= vel.y*0.1;
     //} else 
     if (vel.y > 0) {
       if ( vel.x < 0) {
         rotaIncDec -= vel.y*0.05;
       } else 
       if ( vel.x > 0) {
         rotaIncDec += vel.y*0.05;
       }  
     }
      //lifespan -= 2;
  }   //rota -= 0.1;
 }
  
   boolean isDead() {
      if (tip.x < 0 || tip.x > width || tip.y < -height*0.15 || tip.y > height) {
         return true;
      } else if (lifespan <= 0){
         return true;
      }
         else {
           return false;
         }
      }
   
   void display() {
    //strokeWeight(1);
    fill(255,255,0);
    noStroke();
    ellipse(tip.x,tip.y,rad,rad);
    //pushMatrix();
    //imageMode(CORNER);
    //translate(tip.x,tip.y);
    //rotate(PI*0.25);
    //rotate(rotaIncDec);
    //image(arrow,0,0);//-arrowTipY);
    //popMatrix();
  ts.addTail(tip.x,tip.y,prevX,prevY,lifespan);//arrow.tip.x,arrow.tip.y);  
    
   }

}  
  
