import animation2;

animation a;
int step = 20;

transform t1=reflect((0,-1),(0,1));
transform t2=reflect((-1,-1),(1,1));
pair[] verts = {(-1,-1),(1,-1),(1,1),(-1,1)};
pen[] pens = {red+2bp,green+2bp,blue+2bp,purple+2bp};
picture pic;
pic.size(200);

typedef pair pairer(pair xy);
pairer interpolate(transform t, int step, int i){
return new pair (pair xy) {return (step-i)/step*xy+i/step*(t*xy);};
}

void drawCycle(pair[] vertTemp,picture pic,pen[] pens){
  vertTemp.cyclic = true;
      for(int j = 0; j < vertTemp.length;++j){
      draw(pic,vertTemp[j]--vertTemp[j+1],pens[j]);
      dot(pic,string(j+1),vertTemp[j],align=-vertTemp[j]);
      }
}

void animateInterpolation(transform t, int step,pair[] verts,pen[] pens){
  transform s = scale(1.5);
  draw(pic,s*verts[0]--s*verts[1]--s*verts[2]--s*verts[3]--cycle,invisible);
  for(int i = 0; i < step+1;++i){
    pair[] vertTemp = map(interpolate(t,step,i),verts);
    drawCycle(vertTemp,pic,pens);  
    a.add(pic);
    pic.erase();
  }
}



animateInterpolation(t1,step,verts,pens);
animateInterpolation(t2,step,map(new pair (pair xy) {return t1*xy;},verts),pens);



for(int i = 0; i < step+1; ++i){
  pair[] vertTemp = map(new pair(pair xy){return rotate(90*i/step)*xy;},map(interpolate(t2,1,1),map(interpolate(t1,1,1),verts)));
  drawCycle(vertTemp,pic,pens);
  a.add(pic); pic.erase();
}

a.movie(delay=50,firstDelay=500,lastDelay=500);
