import solids;
size(300);
currentprojection=orthographic((1.64809472303088,2.13434311988349,2.50295210802451));
animation a;
int frames = 20;
octahedron o = octahedron();

transform3 t = rotate(1/frames * 120,(1,1,1));
transform3 tm1 = inverse(t);

for(int i = 0; i < frames; ++i){
  draw(unitsphere,invisible);
  draw(o);
  a.add();erase();
  o.S = t*o;
}

for(int i = 0; i < frames; ++i){
  draw(unitsphere,invisible);
  draw(o);
  a.add();erase();
  o.S = tm1*o;
}

a.movie(delays=a.makeDelays());