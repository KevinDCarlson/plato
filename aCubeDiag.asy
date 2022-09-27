import solids;
size(200);
currentprojection=orthographic((.8,1,1.2));
pen[] diagPens = {rgb("004D40")+2bp,rgb("D81B60")+2bp,rgb("FFC107")+2bp,rgb("1E88E5")+2bp};
cube c = cube(dPens=diagPens);
path3[] diags = {c.vertices[0]--c.vertices[6],c.vertices[1]--c.vertices[7],c.vertices[2]--c.vertices[4],c.vertices[3]--c.vertices[5]};
c.S.diags = diags;

draw(c);

