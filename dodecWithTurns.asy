import solids;
size(300);

pen[] fPens=array(12,gray+opacity(0.3));
dodecahedron d = dodecahedron(fPens=fPens);

triple[] tVs = {d.S.vertices[0],d.S.vertices[5],d.S.vertices[6],d.S.vertices[3]};
pen p = pink+opacity(0.7);
pen[] tfPs = {p,p,p,p};
tetrahedron t = tetrahedron(vertices = tVs, fPens = tfPs);
draw(d); draw(t);
void drawArrow(triple t,triple v,bool left){
  path3 thearrow = left ? t--t+v : t--t-v;
  draw(thearrow,orange,Arrow3);
}
triple v = (1,0,0)+0.6*dir(d.S.vertices[6]-d.S.vertices[0]);

drawArrow(d.S.vertices[0],v,false);
drawArrow(d.S.vertices[8],v,true);
drawArrow(d.S.vertices[10],v,false);

currentprojection=
  orthographic(camera=(4.46541420458879,4.38998075128772,0.923472107992902),
               up=(-0.00127518653104703,-0.00241633925431883,0.0176528546159444),
               target=(0,4.44089209850063e-16,-8.88178419700125e-16),
               zoom=1);

