Kort[] kort;//Array af kortene
PImage[] ikoner;//Array af billederne
 
int Kliktaeller = 0;//Tæller hvor mange klik brugeren bruger på at færdiggøre spillet
 
//Her hentes alle de forskellige billeder
String http = "http://";
String [] filenames = {
  http + "i.imgur.com/sBpAcV1.jpg", 
  http + "i.imgur.com/9u6E450.jpg", 
  http + "i.imgur.com/OKjcLB2.jpg", 
  http + "i.imgur.com/vMUYopP.jpg", 
  http + "i.imgur.com/77xBlCt.jpg", 
  http + "i.imgur.com/ahIdoML.jpg", 
  http + "i.imgur.com/5kv1t6X.jpg", 
  http + "i.imgur.com/BOxnGwO.jpg"
};
//loader baggrundsbillede
PImage backing = loadImage( http + "i.imgur.com/zHNyDLX.jpg");
 
//Her sættes det som false at vi har vist nogle kort.
boolean Forste_viste = false;
boolean Andet_viste = false;
int Forste_kort=-1, Andet_kort=-1;
 
void setup() {
  size(490, 620);
  kort = new Kort[16];//Her bestemmes hvor mange kort der er.
  ikoner = new PImage[8];//Her er symbolerne som er 8.
 
  //Her sættes en value sammen med hvert kort.
  int[] values = new int[16];
  for (int i=0; i<ikoner.length; i++) {
    ikoner[i] = loadImage(filenames[i]);
    values[2*i] = i;
    values[2*i+1] = i;
  }
 
  //her randomizes kortenes placering
  for (int i=0; i<values.length; i++) {
    int r = int(random(values.length));
    int t = values[i];
    values[i] = values[r];
    values[r] = t;
  }
 
  //Her laves et array med alle kortene.
  int counter = 0;
  for (int i=0; i<4; i++) {
    for (int j=0; j<4; j++) {
      kort[counter] = new Kort (20+115*j, 20+140*i, 105, 130, values[counter], counter++);
    }
  }
  noStroke();
}
 
void draw() {
  background(#e5e5e5);
  for (int t=0; t<kort.length; kort[t++].draw ());
  fill(0);
  text("Clicks: " + Kliktaeller, 20, 600);
}
 
void mouseClicked() {
  if (Andet_viste) {
    if ( kort[Forste_kort].v == kort[Andet_kort].v ) {
      kort[Forste_kort].Kort_ned = true;
      kort[Andet_kort].Kort_ned = true;
      println("matched");
    }
 
    for (int t=0; t<kort.length; kort[t++].Kort_op = false);
    Forste_viste = false;
    Andet_viste = false;
    println("not matching");
    return;
  }
 
  for (int t=0; t<kort.length; kort[t++].klik ());
  Kliktaeller++;
 
}
 
class Kort {
 
  //Variabler til størrelsen og placering af kort
  float x, y, w, h;
 
  //Variabler til at track hvert enkelt kort
  int v, i;
 
  boolean Kort_op, Kort_ned; 
  //Her laves kortene
  //Med x og y værdier, samt størrelsen width og height
  Kort(float ix, float iy, float iw, float ih, int iv, int ii) {
    x=ix;
    y=iy;
    w=iw;
    h=ih;
    v=iv;
    i=ii;
    Kort_op=false;
    Kort_ned=false;
  }
 
  void draw() {
    if (!Kort_ned) {
      if (!Kort_op) {
        image(backing, x, y);
      } else {
        image(ikoner[v], x, y);
      }
      noFill();
      stroke(#353535);
      if (musOverKort())
      {
        stroke(#08B3FF);
        rect(x, y, w, h);
      }
    }
  }
 
  boolean musOverKort() {
    return(!Kort_ned && mouseX >= x && mouseX < x+w && mouseY >= y && mouseY < y+h);
  }
 
  void klik() {
    if (!Kort_ned && musOverKort()) {
      Kort_op = !Kort_op;
      if (!Forste_viste) {
        Forste_kort = i;
        Forste_viste = true;
        return;
      }
      if (!Andet_viste && Forste_kort != i) {
        Andet_kort = i;
        Andet_viste = true;
        return;
      }
    }
  }
}
