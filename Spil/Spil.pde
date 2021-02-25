Card[] cards;//Array of the cards
PImage[] icons;//Array of PImages -- icons are the faces of the cards
 
int clickCounter = 0;//counter that counts the clicks
 
//simply referring to the images, can easily take out the http.
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
//loading in the backing image.
PImage backing = loadImage( http + "i.imgur.com/zHNyDLX.jpg");
 
//setting values for the boolean and indicator variables.
boolean one_showing = false;
boolean two_showing = false;
int first_card=-1, second_card=-1;
 
void setup() {
  size(490, 620);
  cards = new Card[16];//setting the amount of items that are going to be in the cards array
  icons = new PImage[8];//setting the amount of items in the PImage array. Which are the 8 cards
 
  //assigning values to each card in the grid
  int[] values = new int[16];
  for (int i=0; i<icons.length; i++) {
    icons[i] = loadImage(filenames[i]);
    values[2*i] = i;
    values[2*i+1] = i;
  }
 
  //scrambling the deck of cards
  for (int i=0; i<values.length; i++) {
    int r = int(random(values.length));
    int t = values[i];
    values[i] = values[r];
    values[r] = t;
  }
 
  //adding all the cards into the array, but it isn't being drawn yet.
  int counter = 0;
  for (int i=0; i<4; i++) {
    for (int j=0; j<4; j++) {
      cards[counter] = new Card (20+115*j, 20+140*i, 105, 130, values[counter], counter++);
    }
  }
  noStroke();
}
 
void draw() {
  background(#e5e5e5);
  for (int t=0; t<cards.length; cards[t++].draw ());
  fill(0);
  text("Clicks: " + clickCounter, 20, 600);
}
 
void mouseClicked() {
  if (two_showing) {
    if ( cards[first_card].v == cards[second_card].v ) {
      cards[first_card].hide = true;
      cards[second_card].hide = true;
      println("matched");
    }
 
    for (int t=0; t<cards.length; cards[t++].face_up = false);
    one_showing = false;
    two_showing = false;
    println("not matching");
    return;
  }
 
  for (int t=0; t<cards.length; cards[t++].click ());
  clickCounter++;
 
}
 
class Card {
 
  //variable to store all the x,y positions and the width and height.
  float x, y, w, h;
 
  //variable to keep track of the card value in the array.
  int v, i;
 
  boolean face_up, hide; 
 
  //constructor for the card class. It takes the x,y position with the width and height,
  //and the place of the card in the array, and the counter
  Card(float ix, float iy, float iw, float ih, int iv, int ii) {
    x=ix;
    y=iy;
    w=iw;
    h=ih;
    v=iv;
    i=ii;
    face_up=false;
    hide=false;
  }
 
  void draw() {
    if (!hide) {
      if (!face_up) {
        image(backing, x, y);
      } else {
        image(icons[v], x, y);
      }
      noFill();
      stroke(#353535);
      if (mouseOverCard())
      {
        stroke(#08B3FF);
        rect(x, y, w, h);
      }
    }
  }
 
  boolean mouseOverCard() {
    return(!hide && mouseX >= x && mouseX < x+w && mouseY >= y && mouseY < y+h);
  }
 
  void click() {
    if (!hide && mouseOverCard()) {
      face_up = !face_up;
      if (!one_showing) {
        first_card = i;
        one_showing = true;
        return;
      }
      if (!two_showing && first_card != i) {
        second_card = i;
        two_showing = true;
        return;
      }
    }
  }
}
