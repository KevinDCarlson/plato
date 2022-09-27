import solids;

octahedron o = octahedron(fPens=array(8,red));
cube c = cube( fPens = array(6,blue+opacity(0.3)));
draw(o); draw(c);