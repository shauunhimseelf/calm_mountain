class Balloon {
    
  PShape balloon;
  
  float mx, my;
  float count2;
  
  float xoff;
  
  float speed;

  Balloon( float _max_x, float _max_y ) {
    mx = _max_x;
    my = _max_y;
    
    balloon = loadShape("dji-mavic.obj");
    balloon.rotateX(radians(90));
    balloon.scale(0.02);
    
    count2 = random(360);
    
    xoff = random(1000);
    speed = map(random(1), 0, 1, 0.1, 0.5);
  }
  
  void display() {
    counter();
    
    float balloonX = mx + 300 * cos(radians(count2));
    float balloonY = my + 300 * sin(radians(count2));
    
    xoff += 0.01;
    
    float balloonZ = map(noise(xoff), 0, 1, -200, -180);
    
    
    pushMatrix();
    translate(400, 400, balloonZ);
    shape(balloon, balloonX, balloonY);
    popMatrix();

  }
  
  void counter() {
    count2 -= speed;
    if( count2 < 0 ){
      count2 = 360;
    }
  }
  
}