import solids;
currentprojection=
  orthographic(camera=(-0.578502274841648,0.861070426185901,-3.65012923899408),
               up=(-0.0102485338217331,-0.000751010508387096,0.00144710689547882),
               target=(0,0,0),
               zoom=1);
pen[] fPens = array(8,white+opacity(0));
string[] fLabels = {"$X$","$A$","$B$","$C$","$D$","$E$","$F$","$G$"};

pen[] vPens = array(8,black);

pen[] ePens  = array(12,black+1.5bp);
ePens[1] = red+1.5bp;
ePens[10]=red+1.5bp;


currentlight=nolight;
octahedron o = octahedron(vPens=vPens,fPens=fPens,ePens=ePens);

triple p1 = point(o.S.edges[1],0)+point(o.S.edges[1],1);
triple p2 = point(o.S.edges[10],0)+point(o.S.edges[10],1);
dot(p1/2,green); dot(p2/2,green);
draw(0.6*p1--0.6*p2,dotted);

for(int i = 0;i<o.S.faces.length;++i){
  path3 face = o.S.faces[i];
  triple middle = 1/3*(point(face,0)+point(face,1)+point(face,2));
  middle = 1.1*middle;
  label(fLabels[i],middle);
}
draw(o);