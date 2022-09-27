import solids;

pen h = red+4bp;
pen b = black+4bp;
pen[] vps = {h,h,h,h,b,b,b,b};
cube c = cube();
draw(c,vertexPens=vps);