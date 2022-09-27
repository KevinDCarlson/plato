import tetrahedron;
import settings;
//outformat = "pdf";
currentprojection = orthographic((.8,1.2,1));
picture p1 = snapshot(labelled=true);
picture p2 = snapshot(reflect(vertices[2],vertices[3],(0,0,0)),labelled=true);

add(p1.fit(),(0,0),W); add(p2.fit(),(0,0),E);