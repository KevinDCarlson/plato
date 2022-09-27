import solids;
size(300);
currentprojection=
  orthographic(camera=(0.172257697298581,-0.156868089234663,3.78841092845248),
               up=(-0.00839853734200705,-0.000398491894968318,0.000365378008672506),
               target=(4.44089209850063e-16,0,0),
               zoom=0.576183636853657);
currentlight=nolight;
animation a; picture pic;
size(pic,200,keepAspect=false);

pen[] fPens={rgb("CEE7E6"),rgb("BFC0C0"),rgb("648767"),rgb("7DC95E"),rgb("30343F"),rgb("FAFAFF"),rgb("E4D9FF"),rgb("576DC1")};
octahedron o = octahedron(lPen=red+fontsize(24pt),fPens=fPens);
octahedron o2 = octahedron(lPen=red+fontsize(24pt),fPens=fPens);
int frames = 20;
triple[] vs = o.S.vertices;
transform3 g = rotate(1/frames*180,vs[2],vs[5]);
transform3 gm1 = rotate(-1/frames * 180,vs[2],vs[5]);
transform3 t = rotate(1/frames*90,vs[0],vs[3]);
transform3 h = rotate(-1/frames*30,vs[0],vs[3]);

pen p = invisible;
void doDrawings(){
  draw(pic,scale3(1.1)*unitsphere,p);
  draw(pic,o);
  add(pic.fit(),(0,0),W);
  pic.erase();
  draw(pic,scale3(1.1)*unitsphere,p);
  draw(pic,o2);
  add(pic.fit(),(0,0),E);
  pic.erase();
  a.add(); erase();
}

for(int i = 0; i < frames;++i){
  doDrawings();
  o.S = g * o;
  o2.S = h * o2;
}

for(int i = 0; i < frames;++i){
  doDrawings();
  o.S = t * o; o2.S = h*o2;
}

for(int i = 0; i < frames;++i){
  doDrawings();
  o.S = gm1 * o; o2.S = h * o2;
}

for(int i = 0; i < frames;++i){
  p = white+opacity(i/frames);
  doDrawings();
}

int[] delays = array(3*frames,50);
delays[0]=1000; delays[delays.length]=1000;
int[] fadeDelays = array(frames,20);
delays.append(fadeDelays);

a.movie(delays=delays);
