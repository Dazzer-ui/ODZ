Ball ball; 

Paddle paddleLeft;
Paddle paddleRight;

int scoreLeft = 0;
int scoreRight = 0;

void setup(){
  size(800,600);
  ball = new Ball(width/2, height/2, 50); 
  ball.speedX = 5;
  ball.speedY = random(-3,3); 
  
  paddleLeft = new Paddle(15, height/2, 30,200);
  paddleRight = new Paddle(width-15, height/2, 30,200);

}

void draw(){
  background(0); 
  ball.display(); 
  ball.move(); 
  ball.display(); 
  
  paddleLeft.move();
  paddleLeft.display();
  paddleRight.move();
  paddleRight.display();

  
  if (ball.right() > width) {
    scoreLeft = scoreLeft + 1;
    ball.x = width/2;
    ball.y = height/2;
  }
  if (ball.left() < 0) {
    scoreRight = scoreRight + 1;
    ball.x = width/2;
    ball.y = height/2;
  }

  if (ball.bottom() > height) {
    ball.speedY = -ball.speedY;
  }

  if (ball.top() < 0) {
    ball.speedY = -ball.speedY;
  }
  
  if (paddleLeft.bottom() > height) {
    paddleLeft.y = height-paddleLeft.h/2;
  }

  if (paddleLeft.top() < 0) {
    paddleLeft.y = paddleLeft.h/2;
  }
    
  if (paddleRight.bottom() > height) {
    paddleRight.y = height-paddleRight.h/2;
  }

  if (paddleRight.top() < 0) {
    paddleRight.y = paddleRight.h/2;
  }
  
  
  

  if ( ball.left() < paddleLeft.right() && ball.y > paddleLeft.top() && ball.y < paddleLeft.bottom()){
    ball.speedX = -ball.speedX;
    ball.speedY = map(ball.y - paddleLeft.y, -paddleLeft.h/2, paddleLeft.h/2, -10, 10);
  }

  if ( ball.right() > paddleRight.left() && ball.y > paddleRight.top() && ball.y < paddleRight.bottom()) {
    ball.speedX = -ball.speedX;
    ball.speedY = map(ball.y - paddleRight.y, -paddleRight.h/2, paddleRight.h/2, -10, 10);
  }
  
  
  textSize(40);
  textAlign(CENTER);
  text(scoreRight, width/2+30, 30); 
  text(scoreLeft, width/2-30, 30); 
}

void keyPressed(){
  if(keyCode == UP){
    paddleRight.speedY=-3;
  }
  if(keyCode == DOWN){
    paddleRight.speedY=3;
  }
  if(key == 'w'){
    paddleLeft.speedY=-3;
  }
  if(key == 's'){
    paddleLeft.speedY=3;
  }
}

void keyReleased(){
  if(keyCode == UP){
    paddleRight.speedY=0;
  }
  if(keyCode == DOWN){
    paddleRight.speedY=0;
  }
  if(key == 'w'){
    paddleLeft.speedY=0;
  }
  if(key == 's'){
    paddleLeft.speedY=0;
  }
}


class Ball {
  float x;
  float y;
  float speedX;
  float speedY;
  float diameter;
  color c;
  
  
  Ball(float tempX, float tempY, float tempDiameter) {
    x = tempX;
    y = tempY;
    diameter = tempDiameter;
    speedX = 0;
    speedY = 0;
    c = (225); 
  }
  
  void move() {
   
    y = y + speedY;
    x = x + speedX;
  }
  
  void display() {
    fill(c); 
    ellipse(x,y,diameter,diameter); 
  }
  

  float left(){
    return x-diameter/2;
  }
  float right(){
    return x+diameter/2;
  }
  float top(){
    return y-diameter/2;
  }
  float bottom(){
    return y+diameter/2;
  }

}




class Paddle{

  float x;
  float y;
  float w;
  float h;
  float speedY;
  float speedX;
  color c;
  
  Paddle(float tempX, float tempY, float tempW, float tempH){
    x = tempX;
    y = tempY;
    w = tempW;
    h = tempH;
    speedY = 0;
    speedX = 0;
    c=(255);
  }

  void move(){
    y += speedY;
    x += speedX;
  }

  void display(){
    fill(c);
    rect(x-w/2,y-h/2,w,h);
  } 
  
 
  float left(){
    return x-w/2;
  }
  float right(){
    return x+w/2;
  }
  float top(){
    return y-h/2;
  }
  float bottom(){
    return y+h/2;
  }
}
