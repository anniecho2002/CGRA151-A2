class Obstacle{
  float x, y, w, h;
  int status = 0;
  Obstacle(float x, float y, float w, float h){
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
  }
  
  void hit(){
    this.status++;
    if (status >= 3){ // makes the obstacle disappear
      this.x = 0;
      this.y = 0;
      this.w = 0;
      this.h = 0;
    }
  }  
  
  void drawObstacle(){
    rectMode(CENTER);
    if (status == 0){
      fill(0, 255, 0);
    }
    else if (status == 1){
      fill(255, 255, 0);
    }
    else if (status == 2){
      fill(255, 0, 0);
    }
    rect(this.x, this.y, this.w, this.h);
  }
  
  
  String checkHit(float ballX, float ballY, float radius){
    
    if ((ballX - radius < this.x + this.w/2) && (ballY > this.y - this.h/2 && ballY < this.y + this.h/2) && (ballX + radius > this.x + this.w/2)){
      return "right"; // bouncing off right
    }
    else if ((ballX + radius > this.x - this.w/2) && (ballY > this.y - this.h/2 && ballY < this.y + this.h/2) && (ballX - radius < this.x - this.w/2)){
      return "left"; // bouncing off left
    }
    if (ballY - radius < this.y + this.h/2 && (ballX > this.x - this.w/2 && ballX < this.x + this.w/2) && (ballY + radius > this.y + this.h/2)){
      return "bottom"; // bouncing off bottom
    } 
    else if (ballY + radius > this.y - this.h/2 && (ballX > this.x - this.w/2 && ballX < this.x + this.w/2) && (ballY - radius < this.y - this.h/2)){
      return "top"; // bouncing off top
    }
    
    
    // bouncing off corners
    if (dist(ballX, ballY, this.x-this.w/2, this.y-this.h/2) < radius){
      return "1"; // top left
    }
    else if(dist(x, y, this.x+batWidth/2, this.y-batHeight/2) < radius){
      return "2"; // top right
    }
    else if (dist(x, y, this.x+batWidth/2, this.y+batHeight/2) < radius){
      return "3"; // bottom right
    }
    else if (dist(x, y, this.x-batWidth/2, this.y+batHeight/2) < radius){
      return "4"; // bottom left
    }
    return "none";
  }
  
}
