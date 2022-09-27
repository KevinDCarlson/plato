import solids;
currentprojection=orthographic(camera=(1.75,2.19,2.63),
                                   up=(-0.008,-0.01,0.013));
pen[] diagPens = {rgb("004D40")+2bp,rgb("D81B60")+2bp,rgb("FFC107")+2bp,rgb("1E88E5")+2bp};
pen[] fPens= array(6,blue+opacity(0.1));
pen[] ePens=array(12,black+1.5bp);
cube c = cube(fPens=fPens,ePens=ePens,dPens=diagPens,lPen=fontsize(16pt));
path3[] diags = {c.vertices[0]--c.vertices[6],c.vertices[1]--c.vertices[7],c.vertices[2]--c.vertices[4],c.vertices[3]--c.vertices[5]};
c.S.diags = diags;
triple [] ts = {Z};
currentlight=nolight;
animateRotation(c,-90, ts);
