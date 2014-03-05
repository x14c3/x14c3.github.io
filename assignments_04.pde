// Introduction to Computational Arts: Processing
// Bringing it All Together (Project 3, Final Project)
// No artistic intent/goal. Just Processing functions. :-)
// Ladislav Hagara, 2014-03-05

/*
Press 0 to erase / show logo.
Press 1 - 9 to set the size / the numbers of the squares.
Press w or W to set the color to white.
Press e or E to set the color blue.
Press r or R to set the color random colors.
Press s or S to save screenshot.png.

Press mouse button to change rotation of the square and enable or disable color 
according to color setting, w/W or e/E or r/R.
*/

/* @pjs preload="logo.png"; */

int SIZE;
int NO;
float [][] ROTATE;
int SIZEX;
int COLOR; 
PImage logo;



void setup(){
 size(720, 720);
 SIZE = 720;
 ROTATE = new float [9][9];
 NO = 1;
 smooth();
 strokeWeight(0);
 logo = loadImage("logo.png");
 startlogo();
}

// initial logo

void startlogo() {
 // background(#255, #255, #255);
  COLOR = 1;
  squares(NO);
  rect(238, 291, 244, 139);
  image(logo, 240, 293);  
}

// creates i * i squares

void squares(int i){
   SIZEX = SIZE / i;
   for(int x=0; x<i; x++) {
      for(int y=0; y<i; y++) {
         ROTATE[x][y] = 0.1+int(random(2))*0.8;
         square(x*SIZEX, y*SIZEX, x*SIZEX+SIZEX, y*SIZEX, x*SIZEX+SIZEX, y*SIZEX+SIZEX, x*SIZEX, y*SIZEX+SIZEX, ROTATE[x][y]);
      }
   }
}

// create square

void square(float AX, float AY, float BX, float BY, float CX, float CY, float DX, float DY, float RATIO) {
  for(int i=1; i<33; i++){
  switch(COLOR){
    case 0:
      fill(255);
      break;   
    case 1:
      colorMode(HSB);
      fill(150, i*7, 255);   
      break;
    case 2:
      colorMode(RGB);
      fill(int(random(256)), int(random(256)), int(random(255)));
      break;
    }    
    quad(AX, AY, BX, BY, CX, CY, DX, DY);
    float XX = AX;
    float XY = AY;
    AX = AX+(BX-AX)*RATIO;
    AY = AY+(BY-AY)*RATIO;
    BX = BX+(CX-BX)*RATIO;
    BY = BY+(CY-BY)*RATIO;
    CX = CX+(DX-CX)*RATIO;
    CY = CY+(DY-CY)*RATIO;
    DX = DX+(XX-DX)*RATIO;
    DY = DY+(XY-DY)*RATIO;  
  }
}

void draw(){
}

// Press mouse button to change rotation of the square and enable or disable color 
// according to color setting, w/W or e/E or r/R.

void mousePressed() {
  int mx=int(mouseX/SIZEX);
  int my=int(mouseY/SIZEX);

  if (ROTATE[mx][my] == 0.1) {
    ROTATE[mx][my] = 0.9;
  } else {
    ROTATE[mx][my] = 0.1;
  }
   
  square(mx*SIZEX, my*SIZEX, mx*SIZEX+SIZEX, my*SIZEX, mx*SIZEX+SIZEX, my*SIZEX+SIZEX, mx*SIZEX, my*SIZEX+SIZEX, ROTATE[mx][my]);  
}

void keyPressed() {
  if (key=='s' || key=='S') saveFrame("screenshot.png");
  if (key=='w' || key=='W') COLOR = 0;
  if (key=='e' || key=='E') COLOR = 1;
  if (key=='r' || key=='R') COLOR = 2;

  switch(key){
  case '0':
    startlogo();
    break;   
  case '1':
    squares(1);
    break;
  case '2':
    squares(2);
    break;
  case '3':
    squares(3);
    break;
  case '4':
    squares(4);
    break;
  case '5':
    squares(5);
    break;
  case '6':
    squares(6);
    break;
   case '7':
    squares(7);
    break;
  case '8':
    squares(8);
    break;
  case '9':
    squares(9);
    break;    
    }    
}

