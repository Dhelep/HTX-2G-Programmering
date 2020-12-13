class bilKrop {

  int x = 100;
  int y = 250;
  int L = 200;
  int H = 60;

  int x2 = 150;
  int y2 = 200;
  int L2 = 90;
  int H2 = 50;

  bilKrop() {
  }
  void display() {
      fill(0,0,255);
    rect(x, y, L, H);
    fill(255,255,255);
    rect(x2, y2, L2, H2);
   
  }
}
