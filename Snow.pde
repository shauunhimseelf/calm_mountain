class Snow {
  
  float x;
  float y;
  float z;
  
  float px;
  float py;
  
  float magnitude;
  float angle; 
  float mass;
  
  Snow( float _x, float _y) {
    x = random(_x);
    y = random(_y);
    z = 400;
  }
  
  void display() {
    z -= 1;
    
    pushMatrix();
    translate(x, y, z);
    sphere(5);
    popMatrix();
  }
  
  
}