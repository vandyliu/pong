float x = 50;
float dx = 1;
int paddleWidth = 15;
int paddleHeight = 80;
boolean p1Up, p1Down, p2Up, p2Down;
Paddle player1;
Paddle player2;
Ball ball;


void setup() {
 size(800,400); 
 frameRate(144);
 player1 = new Paddle(paddleWidth, paddleHeight, 30, height/2 - paddleHeight/2);
 player2 = new Paddle(paddleWidth, paddleHeight, width - 30 - paddleWidth, height/2 - paddleHeight/2);
 ball = new Ball(10);
 ball.p1 = player1;
 ball.p2 = player2;
}

void draw() {
  background(0);
  stroke(100, 100, 100);
  line(width/2, 0, width/2, height);
  mouseClicked();
  movePaddles();
  ball.moveBall();
  ball.drawBall();
  player1.drawPaddle();
  player2.drawPaddle();
  System.out.println(player2.paddleY);
}

void mouseClicked() {
  System.out.println("x :" + mouseX);
  System.out.println("y :" + mouseY);
}

void movePaddles() {
 if (p1Up) player1.moveUp();
 if (p1Down) player1.moveDown();
 if (p2Up) player2.moveUp();
 if (p2Down) player2.moveDown();
}

void keyPressed() {
  if (key == CODED)
    move(keyCode, true);
  else
    move(true);
}
 
void keyReleased() {
  if (key == CODED)
    move(keyCode, false);
  else
    move(false);
}
 
boolean move(int k, boolean b) {
  switch (k) {
    case UP: return p2Up = b;
    case DOWN: return p2Down = b;
    default: return b;
  }
}

boolean move(boolean b) {
 switch (key) {
   case 'w': return p1Up = b;
   case 's': return p1Down = b;
   default: return b;
 }
}
