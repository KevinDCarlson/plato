import solids;
currentprojection=
  orthographic(camera=(-1.64564232937789,2.40382523817976,-2.4330686843093),
               up=(-0.00730269999221215,-0.000854718087102804,0.00409484507399091));
pen op = opacity(1);
pen r = red+op;
pen b = blue+op;
pen w = white+op;
pen p = rgb("CC33FF");
pen[] vPens = array(8,black);
vPens[0]=green;

currentlight=nolight;
octahedron o = octahedron(vPens=vPens,fPens=new pen[] {p,w,w,p,b,r,r,b});
draw(o);