class Ball {
 // fields
 int x;
 int y;
 int radius;
 int speedX;
 float speedY;
 int acceleration;
 Paddle p1;
 Paddle p2;
 // constructors
 
 Ball(int radius) {
   this.radius = radius;
   speedX = 2;
   speedY = 2;
   x = width/2;
   y = height/2;
 }
 
 // methods
  void moveBall() {
    if (x + radius >= width || x - radius <0) { // ball touches end
      float dir = random(0,1);
      if (dir >= 0.5)
        speedX = -speedX;
      x = width/2;
    } else if (ballHitsPaddle()) { // ball touches paddle
      speedX = -speedX;
      x += speedX;
    } else if (ballHitsTopOrBottom()) {
      speedY = -speedY;
      y += speedY;
    } else {
      x += speedX;
      y += speedY;
      System.out.println("ball: " + x + " , " + y);
    }
  }
  
  void bounce() {
    
  }
  
  void drawBall() {
    stroke(255);
    ellipse(x, y, 2*radius, 2*radius);
  }
  
  boolean ballHitsPaddle() {
   return (x + radius >= p2.paddleX && y + radius >= p2.paddleY && y - radius <= p2.paddleY + p2.paddleHeight) 
     || (x - radius <= p1.paddleX + p1.paddleWidth && y + radius >= p1.paddleY && y - radius <= p1.paddleY + p1.paddleHeight);
  }
  
  boolean ballHitsTopOrBottom() {
    return (y - radius <= 0 || y + radius >= height); 
  }
}
