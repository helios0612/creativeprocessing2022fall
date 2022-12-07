

PImage img;
int x, y;

void setup() {
  size(600, 900);
  background(255);
  noStroke();
  img = loadImage("wy.jpg");
}
  
void draw() {
  x = round(random(width));
  y = round(random(height));
  color c = img.get(x, y);
  fill(c, 80);
  ellipse(x, y,20,20 );
}
