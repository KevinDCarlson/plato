import solids;
currentprojection=
  orthographic(camera=(-0.578502274841648,0.861070426185901,-3.65012923899408),
               up=(-0.0102485338217331,-0.000751010508387096,0.00144710689547882),
               target=(0,0,0),
               zoom=1);
pen[] fPens = array(8,white+opacity(0));
string[] fLabels = {"$X$","$A$","$B$","$C$","$D$","$E$","$F$","$G$"};

pen op = opacity(1);
fPens[0]=white+op;
fPens[1]=red+op; fPens[2]=red+op; fPens[4]=red+op;
fPens[3]=blue+op; fPens[5]=blue+op; fPens[6]=blue+op;
fPens[7]=rgb("CC33FF")+op;



pen[] vPens = array(8,black);
vPens[0]=green;

currentlight=nolight;
octahedron o = octahedron(vPens=vPens,fPens=fPens);

for(int i = 0;i<o.S.faces.length;++i){
  path3 face = o.S.faces[i];
  triple middle = 1/3*(point(face,0)+point(face,1)+point(face,2));
  middle = 1.1 * middle;
  label(fLabels[i],middle);
}
draw(o);