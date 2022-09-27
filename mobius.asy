import graph3;
size(200);

currentprojection=orthographic(4,0,2);

triple partMobius(pair uv, real t) {
  real u =uv.x; real v = uv.y;
  if (t==0) return (1,v,u);
  real radius = 1/tan(pi/4*t);//infty at t=0, 1 at t=1
  //center of equator is at (-radius+1,0,0)
  real x = -radius+1+radius*(1-u*sin(v / (2*radius)))*cos(v/radius);
  real y = radius*(1-u*sin(v / (2*radius)))*sin(v/radius);
  real z = u*cos(v / (2*radius));
  return (x,y,z);
}
triple cylinder(pair t) {
  return (cos(t.x),sin(t.x),t.y+3);
}


pen p=rgb(0.2,0.5,0.7);
surface c=surface(cylinder,(0,-1/2),(2pi,1/2),8,8,Spline);
surface m = surface(new triple(pair uv){return partMobius(uv,1);},(-1/2,0),(1/2,2pi),8,8,Spline);

// surface & mesh
//draw(t,lightgray,meshpen=p,render(merge=true));
draw(c,lightgray,meshpen=p,render(merge=true));
draw(m,lightgray,meshpen=p,render(merge=true));
    
