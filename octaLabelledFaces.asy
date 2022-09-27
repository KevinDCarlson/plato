import solids;
currentprojection=
  orthographic(camera=(-0.578502274841648,0.861070426185901,-3.65012923899408),
               up=(-0.0102485338217331,-0.000751010508387096,0.00144710689547882),
               target=(0,0,0),
               zoom=1);
pen[] fPens = array(8,white+opacity(0));
string[] fLabels = {"$X$","$A$","$B$","$C$","$D$","$E$","$F$","$G$"};

fPens[0]=yellow+opacity(0.3);
pen[] vPens = array(8,black);
vPens[0]=green;

currentlight=nolight;
octahedron o = octahedron(vPens=vPens,fPens=fPens);

for(int i = 0;i<o.S.faces.length;++i){
  path3 face = o.S.faces[i];
  triple middle = 1/3*(point(face,0)+point(face,1)+point(face,2));
  label(fLabels[i],middle);
}
draw(o);