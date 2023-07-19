
void setup(){
  size(300,300); 
  noLoop(); 
  noSmooth(); // draws pixels
}

void draw(){
  background(255); 
  lines(); 

}

void lines(){
  // draws lines using processing
  stroke(255, 0, 0); 
  line(280, 0, 300, 10); 
  line(230, 0, 300, 35); 
  line(190, 0, 300, 55); 
  line(150, 0, 300, 75);
  line(110, 0, 300, 95);
  line(85, 0, 300, 120); 
  line(60, 0, 300, 135);
  line(40, 0, 300, 150); 
  line(20, 0, 300, 170);
  line(0, 0, 300, 190); 
  line(0, 15, 300, 210);
  line(0, 30, 300, 230); 
  line(0, 40, 300, 250); 
  line(0, 60, 300, 270);
  line(0, 80, 300, 290); 

  // draws points using line algorithm
  stroke(0, 0, 255); 
  myLine(280, 0, 300, 10); 
  myLine(230, 0, 300, 35); 
  myLine(190, 0, 300, 55); 
  myLine(150, 0, 300, 75);
  myLine(110, 0, 300, 95);
  myLine(85, 0, 300, 120); 
  myLine(60, 0, 300, 135);
  myLine(40, 0, 300, 150); 
  myLine(20, 0, 300, 170);
  myLine(0, 0, 300, 190); 
  myLine(0, 15, 300, 210);
  myLine(0, 30, 300, 230); 
  myLine(0, 40, 300, 250); 
  myLine(0, 60, 300, 270);
  myLine(0, 80, 300, 290); 
}


void myLine(int x0, int y0, int x1, int y1){
  float a = -(y1 - y0); 
  float b = (x1 - x0); 
  float c = (x0 * y1) - (x1 *  y0); 
  int x = round(x0); 
  int y = round((-a * x - c)/b); 
  float k = a * (x+1)+ b * (y+0.5) + c; 
  
  while( x < round(x1)){
    point(x,y); 
    if(k > 0){
      k = k + a;
    } else{
      k = k + a + b;
      y = y + 1; 
    }
    x = x + 1;
  }

}
