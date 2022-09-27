import solids;
import animation2;

currentprojection=
  orthographic(camera=(-1.84020682073158,3.2506561738245,-3.63131408017046),
               up=(0.00185153840112773,0.0128241011566408,0.0105415089851401));
animation a;
pen op = opacity(1);
pen[] facePens = {mediumblue+op,lightcyan+op,purple+op,lightgreen+op};
tetrahedron tet = tetrahedron(fPens=facePens);
triple[] axisPts= {(0,0,-2),(0,0,2)};
currentlight=nolight;

animateRotation(tet,180,axisPts);



