class RotationLight {
  
  float mx, my;
  int count = 0;
  
  RotationLight( float _max_x, float _max_y ) {
    mx = _max_x;
    my = _max_y;

  }
  
  void display( int time ) {
    counter();
    
    float lightX = mx + 400 * cos(radians(count));
    float lightY = my + 400 * sin(radians(count));

    color lightColor = calculatePoint( time );
    
    //Mark light source
    pushMatrix();
    translate(lightX, lightY, 200);
    fill(lightColor);
    sphere(10);
    popMatrix();
    
    pointLight(red(lightColor), blue(lightColor), green(lightColor), lightX, lightY, 400);

  }
  
  void counter() {
    count++;
    if( count > 360 ){
      count = 0;
    }
  }
  
  color calculatePoint(int index) {
    color color1 = color(255, 255, 255);
    color color2 = color(251, 148, 71);
    color color3 = color(120, 120, 120);
    
    color interpColor, colA, colB;
    int boundLower, boundHigher;
        
    if( index < 100 )
    {
      colA = color3;
      colB = color1;
      boundLower = 0;
      boundHigher = 100;
    } else if( index < 260){
      colA = color1;
      colB = color2;
      boundLower = 101;
      boundHigher = 260;
    } else {
      colA = color2;
      colB = color3;
      boundLower = 261;
      boundHigher = 360;
    }
    
    interpColor = lerpColor(colA, colB, map(index, boundLower, boundHigher, 0, 1));  
    
    return interpColor;
  }
  
}