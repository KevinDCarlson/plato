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


pen p1=black+6bp;
pen p2=black+6bp;
pen p3=green+6bp;
pen p4=mediumgray+6bp;
pen p5=black+6bp;
pen p6=black+6bp;
pen p7=black+6bp;
pen p8=black+6bp;

dot("$A$",P[8],p5); dot("$B$",P[11],p5);
dot(P[0],p3); dot(P[4],p3); dot(P[10],p3);
dot(P[18],p1); dot(P[6],p1); dot(P[12],p1); dot(P[2],p1); dot(P[13],p1); dot(P[16],p1);
dot(P[1],p8); dot(P[17],p8); dot(P[15],p8); dot(P[14],p8); dot(P[5],p8); dot(P[19],p8);
dot(P[7],p6); dot(P[3],p6); dot(P[9],p6);




currentprojection=orthographic((2,-2.2,2));