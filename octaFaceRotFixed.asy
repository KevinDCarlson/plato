import solids;
currentprojection=
  orthographic(camera=(-0.993676320618562,-0.968834141359866,3.53178685633574),
               up=(-0.00803670627829623,-0.000436403116004352,-0.00238085912449836));
pen op = opacity(0.95);
pen[] fPens;
fPens[3] = white;
fPens[0] = red; fPens[5] = red; fPens[6] = red;
fPens[1] = blue; fPens[2] = blue; fPens[7] = blue;
fPens[4] = red;
pen[] vPens = array(8,black);
vPens[0]=green;

currentlight=nolight;
octahedron o = octahedron(vPens=vPens,fPens=fPens);
draw(o);