import solids;
size(300);
pen[] fPens={rgb("CEE7E6"),rgb("BFC0C0"),rgb("648767"),rgb("7DC95E"),rgb("30343F"),rgb("FAFAFF"),rgb("E4D9FF"),rgb("273469")};
octahedron o = octahedron(fPens=fPens);
currentprojection=orthographic((1.64809472303088,2.13434311988349,2.50295210802451));

currentlight=nolight;
fPens.cyclic=true;
o.S.edgePens[11] = red+2bp;
animateRotation(o,180,new triple[] {(0,1,1),(0,0,0)});