import solids;

currentprojection=orthographic(camera=(1.75,2.19,2.63),
                                   up=(-0.008,-0.01,0.013));
string[] hexes = {"B0D0D3","3F4739","F7AF9D","7261A3","B3001B","255C99"};
pen[] fPens;
real op = 1;
for(int i = 0; i < hexes.length;++i){fPens[i]=rgb(hexes[i])+opacity(op);}
currentlight=nolight;
cube c = cube(lPen=black+fontsize(16pt),fPens=fPens);
triple [] ts = {(1,1,1)};
animateRotation(c, 120, ts);