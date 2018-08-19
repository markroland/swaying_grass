// Swaying Grass
// MARK ROLAND <http://www.markrolanddesign.com>
// September 23, 2005

// This is a simple program to display a swaying grass blade
// such as one underwater

float angle = 0.0;
float dx = 0.0;
float dy = 0.0;
float x, y;
float rot = 0.0;

int radius = 5;

void setup(){
  size(420,260);
  background(128, 128, 196);
  stroke(255);
  smooth();
  x = width/2;
  y = height;
  frameRate(30);
}

void draw(){
  noStroke();
  fill(128, 128, 196, 100);
  rect(0,0,width, height);
  stroke(255);
  
  draw_blade(.2*width, height, -.075*PI);
  draw_blade(.5*width, height, 0.0);
  draw_blade(.8*width, height, .075*PI);
  
  rot += 0.005*PI;
  
}

void draw_blade(float x, float y, float sway_delay){
  
  pushMatrix();
  translate(x, y);
  angle = .03*sin(rot) + 1.5*PI;
  rotate(angle);
  dx = radius*cos(angle);
  dy = radius*sin(angle);
  line(0,0,radius,0);
  popMatrix();

  for(int a=2; a<20; a++){    
    pushMatrix();
    translate(x+dx, y+dy);
    angle = pow(a,1.5)*.03*sin(rot + sway_delay) + 1.5*PI;  //change this to adjust range of motion
    rotate(angle);
    dx += radius*cos(angle);
    dy += radius*sin(angle);
    line(0,0,radius,0);
    stroke(196);
    line(0,0,radius/sqrt(2),radius); 
    line(0,0,radius/sqrt(2),-radius);
    stroke(255);
    popMatrix(); 
  }  
  
}
