class Mountain {
  
  int rows, cols;
  int w, h;
  int scl;
    
  float[][] terrain;
  
  RotationLight rl;
  Balloon[] balloons;
  
  Snow[] snowfall;
  
  Mountain( int _w, int _h, int _s) {
    w = _w;
    h = _h;
    scl = _s;
    cols = w / scl;
    rows = h/ scl;
    terrain = new float[cols][rows];
    
    rl = new RotationLight(w, h);
    balloons = new Balloon[5];
    
    snowfall = new Snow[10];

    
    for( int i = 0; i < balloons.length; i++)
    {
      Balloon b;

      b = new Balloon(w, h);
      balloons[i] = b;
    }
    
    for( int j = 0; j < snowfall.length; j++)
    {
      Snow s;
      
      s = new Snow(w, h);
      snowfall[j] = s;
    }
    
    float yoff = 0;
    for (int y = 0; y < rows; y++) {
      float xoff = 0;
      for (int x = 0; x < cols; x++) {
        float perlinRaw = noise(xoff, yoff);
        /* Factor based on distance from edge of mesh */
        float dist = sq(x)*sq(y);
        float maxDist = sq(cols)*sq(rows);
        terrain[x][y] = map(perlinRaw*dist, 0, 1*maxDist, -20, 400);
        xoff += 0.2;
      }
      yoff += 0.2;
    }
  }
  
  void display( int time ) {
    pushMatrix();
    translate(width/2, height/2+50);
    rotateX(PI/3);
    rotateZ(radians(-135));
    translate(-w/2, -h/2);
    
    rl.display( time );
    
    for(int i = 0; i < balloons.length ; i++)
    {
      balloons[i].display();
    }
    
    for(int j = 0; j < snowfall.length ; j++)
    {
      snowfall[j].display();
    }
    
    
    
    /* Draw Shape */
    noStroke();
    for (int y = 0; y < rows-1; y++) {
      beginShape(TRIANGLE_STRIP);
      for (int x = 0; x < cols; x++) {
        float alpha = map(terrain[x][y], -20, 100, 0, 255);
        fill(87,145,164, alpha);
        vertex(x*scl, y*scl, terrain[x][y]);
        vertex(x*scl, (y+1)*scl, terrain[x][y+1]);
      }
      endShape();
    }
    popMatrix();

  }
}