import controlP5.*;

ControlP5 cp5;
Circle cl;//申明：cl是Circle类的一个具体对象
Circle[] cls;
int num = 100;
int connections;
 


void setup() {
  size(800, 800);
  initiateData();
  cp5 = new ControlP5(this);
   cp5.addButton("play")
     .setValue(128)
     .setPosition(140,300)
  
     .updateSize();
}
void initiateData() {
  cls=new Circle[num];
  for (int i = 0; i<cls.length; i++) {
    float d = random(50, 100);
    float x = random(d/2, width-d/2);
    float y = random(d/2, height-d/2);

    color c =color(random(0, 255), random(0, 255), random(0, 255));
    cls[i]=new Circle(x, y, d, c);
    //指针 针对元素的独立赋值
    //数组.length 数组长度
  }
}


void draw() {
  background(0);
  //cl.drawCircle();
  connections=0;
  for (int i = 0; i<cls.length; i++) {
    cls[i].drawCircle();
  }
  for (int i = 0; i<cls.length; i++) {
    for (int j = 0; j<cls.length; j++) {
      float dcc =dist(cls[i].x, cls[i].y, cls[j].x, cls[j].y);
      if (dcc>0 && dcc<100) {
        strokeWeight(1);
        stroke(#FFFFFF);
        line(cls[i].x, cls[i].y, cls[j].x, cls[j].y);

        connections++;
      }
    }
  }
  fill(255);
  text("connections:"+connections, 50, 50);
}
public void play() {
  initiateData();
}
