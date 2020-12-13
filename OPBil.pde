bilKrop b;
hjul h;
Lygter l;

void setup(){
  size(400,400);
  b= new bilKrop();
  h= new hjul();
  l= new Lygter();
}
void draw(){
  b.display();
  h.display();
  l.display();
  
}
