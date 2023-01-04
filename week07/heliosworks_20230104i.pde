import geomerative.*;

// Declare the objects we are going to use, so that they are accesible from setup() and from draw()
RFont f;
RShape grp;

void setup() {

  size(400, 400);
  frameRate(24);


  RG.init(this);

  // Choice of colors
  background(#050000);
  fill(#FF0000);
  stroke(0);


  grp = RG.getText("NXDE", "sjtu2022-zhuhanyu.ttf",100, CENTER);


  smooth();
}

void draw() {

  background(#050000);


  translate(width/2, height/2);


  grp.children[1].rotate(PI/20, grp.children[1].getCenter());


  grp.draw();
}
