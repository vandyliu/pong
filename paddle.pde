class Paddle {

  // fields
  int paddleWidth;
  int paddleHeight;
  int paddleX;
  int paddleY;
  int paddleSpeed = 2;
  
  
  // constructor
  Paddle(int pwidth, int pheight, int paddleX, int paddleY) {
   paddleWidth = pwidth;
   paddleHeight = pheight;
   this.paddleX = paddleX;
   this.paddleY = paddleY;
  }
  
  // methods
  void drawPaddle() {
   fill(255);
   rect(paddleX, paddleY, paddleWidth, paddleHeight); 
  }
  
  void moveUp() {
    if (!paddleOffScreenTop())
      paddleY -= paddleSpeed;
  }
  
  void moveDown() {
    if (!paddleOffScreenBottom())
      paddleY += paddleSpeed;
  }
  
  boolean paddleOffScreenTop() {
    return (paddleY - paddleSpeed < 0);
  }
  
  boolean paddleOffScreenBottom() {
    return (paddleY + paddleSpeed + paddleHeight > height);
  }
}
