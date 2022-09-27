import solids;
import animation2;
currentprojection=orthographic(.8,1.2,1);

animation a;
picture left;
left.size(200);
picture right;
right.size(200);

cube c = cube();
tetrahedron t = tetrahedron();

pen h = red+4bp;
pen b = black+4bp;
pen ed = deepred+2bp;

int frames = 20;
real stepleft = 120/(frames-1);
real stepright = 180/(frames-1);

for(int i = 0; i < frames; ++i){
  transform3 tl = rotate(i*stepleft,(1,1,1));
  transform3 tr = rotate(i*stepright,(0,0,1));
  save();
  draw(left,scale3(sqrt(3))*unitsphere,invisible);
  draw(right,scale3(sqrt(3))*unitsphere,invisible);
  draw(left,tl*c); draw(right, tr*c);
  draw(left,tl*t,
       vertexPens=array(t.S.vertices.length,h),
       edgePens=array(t.S.edges.length,ed),
       facePens=array(t.S.faces.length,deepred));
  draw(right,tr*t,
       vertexPens=array(t.S.vertices.length,h),
       edgePens=array(t.S.edges.length,ed),
       facePens=array(t.S.faces.length,deepred+opacity(0.5)));
  add(left.fit(),(0,0),W);
  add(right.fit(),(0,0),E);
  a.add();
  erase(left); erase(right); restore();
}

a.movie(enclosure=BBox(p=white,filltype=Fill),delay=50,firstDelay=400,lastDelay=750);

