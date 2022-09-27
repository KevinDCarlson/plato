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

//dotting vertices
pen p1=yellow;
pen p2=pink;
pen p3=rgb(66/255,189/255,66/255);
pen p4=mediumgray;
pen p5=black;
pen p6=red;
pen p7=white;
pen p8=rgb(185,115,0);
pen p9=purple;
pen p10=cyan;
pen v=linewidth(6);
pen e=linewidth(2);

triple[] A = new triple[4];
A.cyclic = true;
void drawTet(triple[] B,pen p){
	//B should be cyclic!
	draw(B[0]--B[1]--B[2]--B[3]--B[1]--B[2]--B[0]--B[3],p);
	
	for(int i = 0; i < B.length; ++i){
	path3 face = B[i]--B[i+1]--B[i+2]--cycle;
	draw(surface(face),p+opacity(.3));
	}
	
}

A[0] = P[10];
A[1] = P[18];
A[2] = P[14];
A[3] = P[7];
//drawTet(A,p1+e);
for(triple k:A){dot(k,p1+v);}


A[0] = P[0];
A[1] = P[5];
A[2] = P[6];
A[3] = P[3];
drawTet(A,p2+e);
for(triple k:A){dot(k,p2+v);}

A[0] = P[1];
A[1] = P[17];
A[2] = P[15];
A[3] = P[8];
//drawTet(A,p3+e);
for(triple k:A){dot(k,p3+v);}

A[0] = P[9];
A[1] = P[12];
A[2] = P[4];
A[3] = P[19];
//drawTet(A,p8+e);
for(triple k:A){dot(k,p8+v);}

A[0] = P[2];
A[1] = P[13];
A[2] = P[16];
A[3] = P[11];
//drawTet(A,p10+e);
for(triple k:A){dot(k,p10+v);}