import solids;
size(200);
currentprojection=orthographic((.8,1,1.2));
string[] hexes = {"B0D0D3","3F4739","F7AF9D","7261A3","B3001B","255C99"};
pen[] fPens;
real op = 0.7;
for(int i = 0; i < hexes.length;++i){fPens[i]=rgb(hexes[i])+opacity(op);}

draw(cube(lPen=black,fPens=fPens));
