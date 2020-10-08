int[] numre = new int[31];
int taeller = 0;
int et = 0;
int to = 0;
int tre = 0;
int fire = 0;
int fem = 0;
int seks = 0;

void setup() {
  size(800, 800);
  background(0,0,0);
  textSize(25);
  text("TRYK på 'k' FOR AT KASTE / OG 's' FOR AT SLETTE", 50, 50);
  text("Gennemsnittelige Terningekast", 70, 750);
  text("KASTET BLEV:", 50, 75);
  
  for(int c=1;c<=6;c++) text(c, 20+50*c, 700);
  
  textSize(14);
  for(int b = 0; b<300; b+=50)text("0 styk",55+b,665);
}

void draw() {
}

void keyPressed() {
  clear();
  textSize(25);
  text("TRYK på 'k' FOR AT KASTE / OG 's' FOR AT SLETTE", 50, 50);

  if (key=='k' && taeller<30) {
    taeller++; 
    int kast = lavTerningeKast(1, 7);
    
    text("KASTET BLEV: " + kast, 50, 75);
  }

  if (key == 's' && taeller>0) {
    fjernSidsteKast();
  }
    
  tegnFordeling();
  udskrivKast();
}

int lavTerningeKast(int min, int max){
 int nytKast = int(random(min, max)); 
 numre[taeller] = nytKast;
 
 if(nytKast==1) et++;
 if(nytKast==2) to++; 
 if(nytKast==3) tre++;
 if(nytKast==4) fire++;
 if(nytKast==5) fem++;
 if(nytKast==6) seks++;
 
 return nytKast;
}

void fjernSidsteKast(){
  
  if(numre[taeller] == 1) et--;
  if(numre[taeller] == 2) to--;
  if(numre[taeller] == 3) tre--;
  if(numre[taeller] == 4) fire--;
  if(numre[taeller] == 5) fem--;
  if(numre[taeller] == 6) seks--;
  
  taeller--;
}

void udskrivKast(){
 for(int b=1;b<=taeller;b++){
  text("Kast " +b+ ": "+numre[b],600,50+20*b);
 }
}

void tegnFordeling(){
  text("Gennemsnittelige Terningekast", 70, 750);
 for(int c=1;c<=6;c++){
  text(c, 20+50*c, 700); 
 }
 
 textSize(14);
 rect(55, 670, 45,et*-20);      text(et +   " styk", 55, 665 + et*-20);  
 rect(105, 670, 45,to*-20);     text(to +   " styk", 105, 665 + to*-20);
 rect(155, 670, 45,tre*-20);    text(tre +  " styk", 155, 665 + tre*-20);
 rect(205, 670, 45,fire*-20);   text(fire + " styk", 205, 665 + fire*-20);
 rect(255, 670, 45,fem*-20);    text(fem +  " styk", 255, 665 + fem*-20);
 rect(305, 670, 45,seks*-20);   text(seks + " styk", 305, 665 + seks*-20);
 textSize(20);
}
