/**
  Calm Mountain 
  Shaun McWhinnie - 27/3/2016
**/

Mountain m;
int count;

void setup() {  
  size(800, 800, P3D);
  m = new Mountain( 400, 400, 10 );
  count = 0;

  frameRate(30);
}


void draw () {
  background(calculateAmbient(count));
  frame.setTitle(int(frameRate) + " fps");
    
  if(count < 360){
    count++;
  } else {
    count = 1;
  }
  
  m.display( count );
  
  }

color calculateAmbient(int index) {
  color color1 = color(33, 38, 61);
  color color2 = color(141, 217, 214);
  color color3 = color(172, 237, 246);
  color color4 = color(231, 144, 144);
  color color5 = color(52, 51, 104);

  
  color interpColor, colA, colB;
  int boundLower, boundHigher;
  
  float interpAmt;
  
  if( index < 72 )
  {
    colA = color1;
    colB = color2;
    boundLower = 0;
    boundHigher = 72;
  } else if ( index < 144 ) {
    colA = color2;
    colB = color3;
    boundLower = 73;
    boundHigher = 144;
  } else if ( index < 216 ) {
    colA = color3;
    colB = color4;
    boundLower = 145;
    boundHigher = 216;
  } else if ( index < 288 ) {
    colA = color4;
    colB = color5;
    boundLower = 217;
    boundHigher = 288;
  } else {
    colA = color5;
    colB = color1; 
    boundLower = 289;
    boundHigher = 360;
  }
  
  interpColor = lerpColor(colA, colB, map(index, boundLower, boundHigher, 0, 1));  
  
  return interpColor;
}