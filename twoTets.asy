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

//Drawing two tetrahedra and their faces
path3 tet1 = P[8]--P[1]--P[17]--P[15]--P[8]--P[17]--P[15]--P[1]--cycle;
path3 tet2 = P[8]--P[14]--P[5]--P[19]--P[8]--P[5]--P[19]--P[14]--cycle;

draw(tet1,pink+2bp);
draw(tet2,purple+2bp);
draw(surface(P[8]--P[1]--P[17]--cycle),pink+opacity(.4));
draw(surface(P[15]--P[1]--P[17]--cycle),pink+opacity(.4));
draw(surface(P[8]--P[17]--P[15]--cycle),pink+opacity(.4));
draw(surface(P[8]--P[1]--P[15]--cycle),pink+opacity(.4));

draw(surface(P[8]--P[14]--P[5]--cycle),purple+opacity(.4));
draw(surface(P[8]--P[14]--P[19]--cycle),purple+opacity(.4));
draw(surface(P[8]--P[5]--P[19]--cycle),purple+opacity(.4));
draw(surface(P[14]--P[5]--P[19]--cycle),purple+opacity(.4));


//dotting vertices
pen p1=blue+6bp;
pen p2=pink+6bp;
pen p3=green+6bp;
pen p4=mediumgray+6bp;
pen p5=black+6bp;
pen p6=red+6bp;
pen p7=white+6bp;
pen p8=orange+6bp;
pen p9=purple+6bp;

dot("$A$",P[8],p5); 
dot(P[1],p2); dot(P[17],p2); dot(P[15],p2); 
dot(P[14],p9); dot(P[5],p9); dot(P[19],p9);




currentprojection=orthographic((2,-2.2,2));