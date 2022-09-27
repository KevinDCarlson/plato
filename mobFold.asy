import animation2;
import graph3;

int frames = 20;
size(300);
currentprojection=orthographic(4,0,2);
animation a; 

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
triple partCylinder(pair uv, real t) {
  real u = uv.x; real v = uv.y;
  if (t == 0) return (1,u,v+3);
  real radius = 1/tan(pi/4*t);
  return (-radius+1+radius*cos(u/radius),radius*sin(u/radius),v+3);
}


pen p=rgb(0.2,0.5,0.7);


for(int i = 0; i < frames + 1; ++i){
  surface m = surface(new triple(pair uv){return partMobius(uv,i/frames);},(-1/2,0),(1/2,2pi),8,8,Spline);
  surface c=surface(new triple(pair uv){return partCylinder(uv,i/frames);},(0,-1/2),(2pi,1/2),8,8,Spline);
  draw(m,lightgray,meshpen=p,render(merge=true));
  draw(c,lightgray,meshpen=p,render(merge=true));
  a.add();
  erase();
  }

int[] delays = array(frames+1,50);
delays[0]=1000; delays[delays.length-1]=1000;
a.movie(delays=delays);
