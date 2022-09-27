import solids;
currentprojection=(orthographic(.8,1,1.2));
size(200);
tetrahedron t = tetrahedron();
pen h = red+4bp;
pen b = black+4bp;

draw(cube());
draw(t,vertexPens=array(t.S.edges.length,red+4bp),
       edgePens=array(t.S.edges.length,deepred+2bp),
       facePens = array(t.S.faces.length,deepred));



