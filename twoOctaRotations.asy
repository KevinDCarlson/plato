import solids;
currentprojection=orthographic(camera=(0.527377237368167,-0.760013744077611,9.16456393013455),
               up=(-0.00135644566436738,0.0268113278627014,0.00230151007735166),
               target=(0,0,0),
               zoom=1);
currentlight=nolight;
animation a;
pen[] fPens={rgb("CEE7E6"),rgb("BFC0C0"),rgb("648767"),rgb("7DC95E"),rgb("30343F"),rgb("FAFAFF"),rgb("E4D9FF"),rgb("273469")};
octahedron o1 = octahedron(fPens=fPens);
octahedron o2 = octahedron(fPens=fPens);

o2.S = shift((3,0,0))*o2;



int frames = 19;
for(int i = 0; i < frames + 1; ++i){
  draw(scale3(2.1)*unitsphere,invisible);
  draw(shift((3,0,0))*scale3(.12)*unitsphere,invisible);
  transform3 t1=rotate(i/frames*90,o1.S.vertices[5]);
  transform3 t2=rotate(-i/frames*90,o2.S.vertices[2],o2.S.vertices[5]);
  draw(t1*o1); draw(t2*o2);
  a.add(); erase();
}

transform3 t1=rotate(90,o1.S.vertices[5]);
transform3 t2=rotate(-90,o2.S.vertices[2],o2.S.vertices[5]);
for(int i = 0; i < frames + 1; ++i){
  pen op = white+opacity(i/frames);
  draw(scale3(2.1)*unitsphere,op);
  draw(shift((3,0,0))*scale3(2.1)*unitsphere,op);  
  draw(t1*o1); draw(t2*o2);
  a.add(); erase();
}

int[] delaysRotate = array(a.pictures.length # 2,50);
int[] delaysFade = array(a.pictures.length # 2,20);
int[] delays = delaysRotate;
delays[0]=1000; delays[delays.length-1]=1000;
delays.append(delaysFade);

a.movie(delays=delays);
