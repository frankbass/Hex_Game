
void setup() {
 surface.setLocation(0,0);
 size(600, 600);
 noFill();
 background(255);
 float wide = 200;
 float h = (sqrt(3)*100);
 PVector start = new PVector(300, 300);
 float triY = (sqrt(3) * 50);
 PVector mid = new PVector(start.x+150, start.y - triY);
 float high = sqrt(pow(wide, 2) - pow(wide / 2, 2));
 
  float x = 100;
 float y = 300;
 
  beginShape();
    vertex(x, y);
    vertex(x + wide / 2, y - high);
    vertex(x + wide / 2 + wide, y - high);
    vertex(x + 2 * wide, y);
    vertex(x + wide / 2 + wide, y + high);
    vertex(x + wide / 2, y + high);
    endShape(CLOSE);
 
 //triangle(start.x,start.y, start.x + 100, start.y - h, start.x + wide, start.y); 
 //line(start.x, start.y, mid.x, mid.y);
 line(mid.x, mid.y, start.x+100, start.y);
 line(mid.x, mid.y, start.x + 50, mid.y);
 ellipse(mid.x, mid.y , 5, 5);
 

}
