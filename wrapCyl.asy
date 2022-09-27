import three;
import graph3;

size(200,0);
currentprojection=orthographic(4,0,2);

real R=pi/2;

triple cyl(pair t) {
  return (t.x,R*cos(t.y),R*sin(t.y));
}

pen p=rgb(0.2,0.5,0.7);
surface s=surface(f,(-pi/2,-2),(pi/2,2),8,8,Spline);

// surface only
//draw(s,lightgray);

// mesh only
// draw(s,nullpen,meshpen=p);

// surface & mesh
draw(s,lightgray,meshpen=p,render(merge=true));