float radius = 25; // radius of the ball
float x = 350; // x of the ball
float y = 200; // y of the ball
float vx = 4.0;
float vy = 3.0;
float ax = 0.0;
float ay = 0.1;

float batWidth = 100;
float batHeight = 50;

Obstacle[] boxes = new Obstacle[10];

void setup(){
  size(700,700);
  boxes[0] = new Obstacle(width/6, 50, 110, 50);
  boxes[1] = new Obstacle(width/6, 125, 110, 50);
  boxes[2] = new Obstacle(width/6 * 2, 50, 110, 50);
  boxes[3] = new Obstacle(width/6 * 2, 125, 110, 50);
  boxes[4] = new Obstacle(width/6 * 3, 50, 110, 50);
  boxes[5] = new Obstacle(width/6 * 3, 125, 110, 50);
  boxes[6] = new Obstacle(width/6 * 4, 50, 110, 50);
  boxes[7] = new Obstacle(width/6 * 4, 125, 110, 50);
  boxes[8] = new Obstacle(width/6 * 5, 50, 110, 50);
  boxes[9] = new Obstacle(width/6 * 5, 125, 110, 50);
}

void draw(){
  
  background(255);
  noStroke();
  fill(255, 0, 0);
  circle(x, y, radius*2);
  
  
  vx = vx + ax/2;
  vy = vy + ay/2;
  x = x + vx;
  y = y + vy;
  vx = vx + ax/2;
  vy = vy + ay/2;
  
 
  fill(0, 0, 255); // making the bat
  rectMode(CENTER);
  rect(mouseX, mouseY, batWidth, batHeight);
  for (int i=0; i<boxes.length; i++){
    boxes[i].drawObstacle();
  }
   
   
  // conditions for bouncing off the walls
  if (x + radius > width || x - radius < 0) {vx = -vx;}
  if (y + radius > height || y - radius < 0) {vy = -vy;}
  
  
  // conditions for bouncing off the bat
  checkBat();
  
  
  // conditions for bouncing off the obstacles
  for (Obstacle ob : boxes){
    if(ob.checkHit(x, y, radius).equals("left")){
      ob.hit();
      vx = -vx;
      x = x - 3;
    }
    else if(ob.checkHit(x, y, radius).equals("right")){
      ob.hit();
      vx = -vx;
      x = x + 3;
    }
    else if(ob.checkHit(x, y, radius).equals("top")){
      ob.hit();
      vy = -vy;
      y = y - 3;
    }
    else if(ob.checkHit(x, y, radius).equals("bottom")){
      ob.hit();
      vy = -vy;
      y = y + 3;
    }
    else if(ob.checkHit(x,y, radius).equals("1")){
      ob.hit();
      x = x - 3;
      y = y - 3;
      vy = -vy;
      vx = -vx;
    }
    else if(ob.checkHit(x, y, radius).equals("2")){
      x = x + 3;
      y = y + 3;
      vy = -vy;
      vx = -vx;
    }
    else if(ob.checkHit(x, y, radius).equals("3")){ // bottom right
      x = x + 3;
      y = y + 3;
      vy = -vy;
      vx = -vx;
    }
    else if(ob.checkHit(x, y, radius).equals("4")){ // bottom left
      x = x - 3;
      y = y + 3;
      vy = -vy;
      vx = -vx;
    }
  }
  
  
}

void checkBat(){
  if ((x - radius < mouseX + batWidth/2) && (y > mouseY - batHeight/2 && y < mouseY + batHeight/2) && (x + radius > mouseX + batWidth/2)){
    x = x + 3;
    vx = -vx;
  }
  else if ((x + radius > mouseX - batWidth/2) && (y > mouseY - batHeight/2 && y < mouseY + batHeight/2) && (x - radius < mouseX - batWidth/2)){
    x = x - 3;
    vx = -vx;
  }
  
  if (y - radius < mouseY + batHeight/2 && (x > mouseX - batWidth/2 && x < mouseX + batWidth/2) && (y + radius > mouseY + batHeight/2)){
    y = y + 3;
    vy = -vy;
  } 
  else if (y + radius > mouseY - batHeight/2 && (x > mouseX - batWidth/2 && x < mouseX + batWidth/2) && (y - radius < mouseY - batHeight/2)){
    y = y - 3;
    vy = -vy;
  }
  

  // if the distance between the center of the ball to the top left corner is less than radius of the ball
  if (dist(x, y, mouseX-batWidth/2, mouseY-batHeight/2) < radius){
    x = x - 3;
    y = y - 3;
    vy = -vy;
    vx = -vx;
  }
  
  // if the distance between the center of the ball to the top right corner is less than radius
  if (dist(x, y, mouseX+batWidth/2, mouseY-batHeight/2) < radius){
    x = x + 3;
    y = y + 3;
    vy = -vy;
    vx = -vx;
  }
  
  // bouncing off bottom right corner
  if (dist(x, y, mouseX+batWidth/2, mouseY+batHeight/2) < radius){
    x = x + 3;
    y = y + 3;
    vy = -vy;
    vx = -vx;
  }
  
  // bouncing off the bottom left corner
  if (dist(x, y, mouseX-batWidth/2, mouseY+batHeight/2) < radius){
    x = x - 3;
    y = y + 3;
    vy = -vy;
    vx = -vx;
  }
}
  
