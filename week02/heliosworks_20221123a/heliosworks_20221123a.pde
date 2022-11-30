/*
 
 358. A 12" (30 cm) grid covering the wall.
 Within each 12" (30 cm) square, one arc from
 the corner. (The direction of the arcs and
 their placement are determined by the draftsman.)
 
 (Inches must be translated into pixels)
 
 */

void setup()
{
  size(800, 800  );
  noFill();




  background(0);
  frameRate(12);
}

int res = 50;   // Resolution of grid
int arcres = 48; // Resolution of the arc
color c1;
color c2;
void draw()
{
  noStroke();
  colorMode(HSB, 100);
  color c1=color(random(100), 100, 100);
  color c2=color(random(100), 100, 255);
  for (int y=0; y<height; y++) {
    float n = map(y, 0, height, 0, 1);
    color newc=lerpColor(c1, c2, n);
    stroke(newc);
  }




  background(0);
  for (int i=0; i<height; i+=res) {
    for (int j=0; j<width; j+=res) {
      int r = int(random(4));
      if (r == 0) {
        arc_0(j, i, res);
      } else if (r == 1) {
        arc_1(j, i, res);
      } else if (r == 2) {
        arc_2(j, i, res);
      } else if (r == 3) {
        arc_3(j, i, res);
      }
    }
  }
}

void arc_0(int xC, int yC, int r)
{
  int x = 0, y = r, u = 1, v = 2 * r - 1, E = 0;
  while (x < y) {
    thin_point(xC + y, yC - x + res); // ESE
    x++;
    E += u;
    u += 2;
    if (v < 2 * E) {
      y--;
      E -= v;
      v -= 2;
    }
    if (x > y) break;
    thin_point(xC + x, yC - y + res); // SSE
  }
}

void arc_1(int xC, int yC, int r)
{
  int x = 0, y = r, u = 1, v = 2 * r - 1, E = 0;
  while (x < y) {
    thin_point(xC + x, yC + y); // NNE
    x++;
    E += u;
    u += 2;
    if (v < 2 * E) {
      y--;
      E -= v;
      v -= 2;
    }
    if (x > y) break;
    thin_point(xC + y, yC + x); // ENE
  }
}

void arc_2(int xC, int yC, int r)
{
  int x = 0, y = r, u = 1, v = 2 * r - 1, E = 0;
  while (x < y) {
    thin_point(xC - y + res, yC + x); // WNW
    x++;
    E += u;
    u += 2;
    if (v < 2 * E) {
      y--;
      E -= v;
      v -= 2;
    }
    if (x > y) break;
    thin_point(xC - x + res, yC + y); // NNW
  }
}

void arc_3(int xC, int yC, int r)
{
  int x = 0, y = r, u = 1, v = 2 * r - 1, E = 0;
  while (x < y) {
    thin_point(xC - x + res, yC - y + res); // SSW
    x++;
    E += u;
    u += 2;
    if (v < 2 * E) {
      y--;
      E -= v;
      v -= 2;
    }
    if (x > y) break;
    thin_point(xC - y + res, yC - x + res); // WSW
  }
}

void thin_point(int x, int y)
{
  point(x, y);
}
