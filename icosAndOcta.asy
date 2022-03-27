import three; real phi = (1+5^.5)/2; currentprojection=orthographic(2,-1.5,1.5);
size(300);
triple P[] = {(0,1,phi),(0,-1,phi),(0,-1,-phi),(0,1,-phi),(1,phi,0),(-1,phi,0),(-1,-phi,0),(1,-phi,0),(phi,0,1),(phi,0,-1),(-phi,0,-1),(-phi,0,1)};
void drawFrontFace(int x, int y, int z){ draw(P[x] -- P[y] -- P[z] -- cycle, linewidth(0.7)); }
void drawBackFace(int x, int y, int z){ draw(P[x] -- P[y] -- P[z] -- cycle, linetype("2 6")); }

drawFrontFace(6,10,11);drawFrontFace(5,10,11);drawFrontFace(5,0,11);drawFrontFace(6,10,2);drawFrontFace(3,10,2);drawFrontFace(5,10,3);drawFrontFace(5,0,4);drawFrontFace(5,4,3);drawFrontFace(9,2,3);drawFrontFace(9,4,3);
drawBackFace(11,1,6);drawBackFace(7,1,8);drawBackFace(8,1,0);drawBackFace(0,4,8);drawBackFace(8,4,9);drawBackFace(7,8,9);drawBackFace(7,2,6);

triple Q[] = {(1,0,0),(0,1,0),(0,0,1),(-1,0,0),(0,-1,0),(0,0,-1)};
triple shiftOver(triple t){
  triple shift = cross((2,-1.5,1.5),Z);
  return t + 2*shift;
}
Q = map(shiftOver,Q);

path3 faces[]={Q[0]--Q[1]--Q[2]--cycle,Q[0]--Q[1]--Q[5]--cycle,Q[0]--Q[4]--Q[2]--cycle,Q[0]--Q[4]--Q[5]--cycle,
                           Q[1]--Q[2]--Q[3]--cycle,Q[1]--Q[3]--Q[5]--cycle,Q[2]--Q[3]--Q[4]--cycle,Q[3]--Q[4]--Q[5]--cycle};

for(path3 pth : faces) draw(pth);
for(int i = 0; i < Q.length;++i) dot(string(i),Q[i]);