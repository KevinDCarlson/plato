size(300);
import three; real phi = (1+5^.5)/2; pen d=linewidth(0.7),l=linetype("2 6"); triple P[];

for(int i = 0; i < 8; ++i)
P.push(( (-1)^( floor(i/4) ), (-1)^( ( floor(i/2) ) % 2), (-1)^(i%2) ));
for(int i = 0; i < 4; ++i)
P.push(( 0, (-1)^( floor(i/2) ) / phi, (-1)^(i%2) * phi ));
for(int i = 0; i < 4; ++i)
P.push(( (-1)^(i%2) * phi, 0, (-1)^( floor(i/2) ) / phi ));
for(int i = 0; i < 4; ++i)
P.push(( (-1)^( floor(i/2) ) / phi, (-1)^(i%2) * phi, 0 ));


void drawFace(path3 p) {
	draw(surface(p),lightgray+opacity(.2));
	draw(p,black+2bp);
}
path3 makeFace(int[] x) {
	path3 p;
	for(int i = 0; i < x.length; ++i){
	p = p--P[x[i]];
	}
	p = p--cycle;
	return p;
}

path3[] facePaths = new path3[];

int faces[][] = {{7,11,3,17,19},{6,10,2,17,19},{14,12,2,17,3},{8,10,2,12,0},{14,12,0,16,1},{6,10,8,4,13},{4,8,0,16,18},{9,1,14,3,11},{13,4,18,5,15},{18,5,9,1,16},{5,9,11,7,15}};

for(int i = 0; i < faces.length; ++i){
	facePaths.push(makeFace(faces[i]));
}

for(int j = 0; j < faces.length; ++j) drawFace(facePaths[j]);


pen p1=blue+6bp;
pen p2=pink+6bp;
pen p3=green+6bp;
pen p4=mediumgray+6bp;
pen p5=black+6bp;
pen p6=red+6bp;
pen p7=white+6bp;

draw(surface(P[0]--P[4]--P[10]--cycle),rgb(50,50,250)+opacity(.5));
draw(surface(P[18]--P[6]--P[12]--cycle),rgb(50,130,170)+opacity(.5));
draw(surface(P[2]--P[13]--P[16]--cycle),rgb(30,210,150)+opacity(.5));
draw(surface(P[1]--P[17]--P[15]--cycle),rgb(150,210,30)+opacity(.5));
draw(surface(P[14]--P[5]--P[19]--cycle),rgb(170,130,50)+opacity(.5));
draw(surface(P[7]--P[3]--P[9]--cycle),rgb(250,50,50)+opacity(.5));


draw(P[8]--P[11],mediumgray+3bp);


currentprojection=orthographic((2,-2.2,2));