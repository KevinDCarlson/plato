import graph3;

currentprojection=orthographic(4,0,2);


triple torus(pair t) {
  return ((1+1/2*cos(t.y))*cos(t.x),(1+1/2*cos(t.y))*sin(t.x),1/2*sin(t.y)+2);
}
triple klein(pair t) {
  real u = t.x; real v = t.y;
  real x = 3/4*cos(u)*(1+sin(u));
  real y = 2*sin(u);
  real r = 1/2*(1-cos(u)/2);
  real X = (pi < u) ? x+r*cos(v+pi) : x+r*cos(u)*cos(v);
  real Y = (pi < u) ? y : y + r*sin(u)*cos(v);
  real Z = r*sin(v);
  return (X,Y,Z);
}


pen p=rgb(0.2,0.5,0.7);
surface t=surface(torus,(0,0),(2pi,2pi),8,8,Spline);
surface k=surface(klein,(0,0),(2pi,2pi),8,8,Spline);


picture pic;
// surface & mesh
draw(t,lightgray,meshpen=p,render(merge=true));
draw(k,lightgray+opacity(0.5),meshpen=p,render(merge=true));

