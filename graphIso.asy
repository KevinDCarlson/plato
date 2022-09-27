import animation2;

animation a;
size(1200,300,(-1.5,-1.5),(10.5,1.5));
int frames = 19;

real angle = 180;
pair shift = (3,0);
pen p = black+1.5bp;
pen q = blue+1.5bp;

path startGraph1 = (-1,-1)--(-1,1)--(1,1)--(1,-1);
path endGraph1 = (2,1)--(2,-1)--(4,-1)--(4,1);
path startGraph2 = shift((6,0))*startGraph1;
path endGraph2 = (8,1)--(10,1)--(8,-1)--(10,-1);

transform spinShift(int n) {
  return shift(n/frames*shift)*rotate(n/frames*angle);
}

path zigZag(int n) {
  path zig;
  for(int i = 0;i<size(startGraph2);++i) {
  real t = n/frames;
  pair next = (1-t)*point(startGraph2,i)+t*point(endGraph2,i);
  zig = zig--next;
  }
  return zig;
}

void doDrawing(path startGraph, pen q, path endGraph, pen p, int i){
  draw(endGraph,p);
  draw(startGraph,q);
  for(int j = 0; j < 4;++j){
    dot(point(endGraph,j));
    dot(point(startGraph,j),blue);
  }
}

for(int i = 0; i < frames+1;++i){
  transform t = spinShift(i);
  doDrawing(t*startGraph1,q,endGraph1,p,i);
  path temp = zigZag(i);
  doDrawing(temp,q,endGraph2,p,i);
  a.add(); erase();
}

a.movie(firstDelay=400,lastDelay=400);