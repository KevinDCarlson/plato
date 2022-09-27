import solids;
import math;
size(200);
pen[] fPens = array(12,red);
dodecahedron d = dodecahedron(fPens=fPens);
icosahedron i = icosahedron(lPen=black);
triple cent = 1/3*(i.S.vertices[11]+i.S.vertices[0]+i.S.vertices[5]);
triple cent2 = 1/3*(i.S.vertices[10]+i.S.vertices[5]+i.S.vertices[11]);
real scaledown = length(cent)/length(d.S.vertices[4]);
d.S = scale3(scaledown)*d.S;

transform3 rotateTo(triple frm, triple to, triple axisPoint){
  triple fromProj = planeproject(axisPoint)*frm;
  triple toProj = planeproject(axisPoint)*to;
  int sign = orient(frm,to,axisPoint,O) > 0 ? 1 : -1;
  real degs = sign*aCos(dot(fromProj,toProj)/(length(fromProj)*length(toProj)));
  return rotate(degs,axisPoint);
}

transform3 t = rotateTo(d.S.vertices[13],cent2,d.S.vertices[4]);
d.S = t*d.S;

draw(icosahedron());
draw(d);
