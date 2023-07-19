float radius = 25;
float x = 100;
float y = 100;

float vx = 3.0;
float vy = 2.0;

float ax = 0.0;
float ay = 0.2;

float batWidth = 75;
float batHeight = 25;

void setup(){
  size(700,700);
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
  
  // making the bat
  fill(0, 0, 255);
  rectMode(CENTER);
  rect(mouseX, mouseY, batWidth, batHeight);
  
  
  // conditions for bouncing off walls
  if (x + radius > width || x - radius < 0) {vx = -vx;}
  if (y + radius > height || y - radius < 0) {vy = -vy;}
  
  
  // bouncing off left of bat
  if (x + radius > mouseX - batWidth/2 && (y > mouseY - batHeight/2 && y < mouseY + batHeight/2)){
    vx = -vx;
  }
  
  // bouncing off right of bat
  if (x - radius > mouseX + batWidth/2 && (y > mouseY - batHeight/2 && y < mouseY + batHeight/2)){
    vx = -vx;
  }

  // bouncing off top of bat
  if (y + radius > mouseY - batHeight/2 && (x > mouseX - batWidth/2 && x < mouseX + batWidth/2)){
    vy = -vy;
  }
  
  // bouncing off bottom
  if (y - radius > mouseY + batHeight/2 && (x > mouseX - batWidth/2 && x < mouseX + batWidth/2)){
    vy = -vy;
  }
}
