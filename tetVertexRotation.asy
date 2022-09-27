import solids;
import animation2;

currentprojection=
  orthographic(camera=(-1.84020682073158,3.2506561738245,-3.63131408017046),
               up=(0.00185153840112773,0.0128241011566408,0.0105415089851401));
animation a;
pen op = opacity(0.3);
pen[] facePens = {mediumblue+op,lightcyan+op,purple+op,lightgreen+op};
tetrahedron tet = tetrahedron(fPens=facePens);
triple[] axisPts= {tet.S.vertices[0]};
path3[] diags = {1.5*axisPts[0]--(-1)*axisPts[0]};
pen[] diagPens = {gray+2bp};
tet.S.diags = diags; tet.S.diagPens = diagPens;

animateRotation(tet,120,axisPts);