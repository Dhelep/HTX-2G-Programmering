float x1,y1,xsp=6.1,ysp=4.89;
void setup()
{
  size (640,360);
  
}
void draw()
{
  background(33);
  x1 = x1+xsp;
  y1=y1+ysp;
  if(x1>width || x1<0){xsp = xsp*-1;}
  if(y1>height || y1<0) {ysp = ysp*-1;}
  ellipse(x1,y1,25,25);
} 
