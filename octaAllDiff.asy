import solids;
currentprojection=
  orthographic(camera=(-0.993676320618562,-0.968834141359866,3.53178685633574),
               up=(-0.00803670627829623,-0.000436403116004352,-0.00238085912449836));
pen[] fPens = {red,orange,yellow,green,cyan,purple,magenta,black};
pen[] vPens = array(8,black);
vPens[0]=green;
currentlight=nolight;
draw(octahedron(vPens=vPens,fPens=fPens));