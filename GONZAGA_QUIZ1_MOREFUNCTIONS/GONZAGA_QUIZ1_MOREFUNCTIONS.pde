float amplitude = 50;
float frequency = 0.010;
float timeOffset = 0;

void setup() {
  size(1280, 720, P3D);
  camera(0, 0, -(height/2.0) / tan(PI*30.0/180.0), 0, 0, 0, 0, -1, 0);
}

void draw() {
  drawCartesianPlane();
  drawLinearFunction();
  drawQuadraticFunction();
  drawSineWave();
  
  timeOffset += 0.05;

  
}
void drawCartesianPlane()
{
  background(0);
  
  strokeWeight(1);
  color white = color (255, 255, 255);
  fill (white);
  stroke (white);
  line(300, 0, -300, 0); 
  line(0, -300, 0, 300); 
  

  for (int i = -300; i <= 300; i+= 10)
  {
    line(i, -2, i, 2);
    line(-2, i, 2, i);
  }
}

  void drawLinearFunction() 
  {
    color purple = color (154, 5, 255);
    fill (purple);
    noStroke ();
   
    for (float x = -300; x <= 300; x += 0.1f) 
    {
      float y = (-5 * x) + 30;
      circle(x * 10, y, 2);
    }
}
   void drawQuadraticFunction()
   {
     color yellow = color (255, 243, 0);
     fill (yellow);
     stroke (yellow);
     
     for (float x = -300; x <= 300; x += 0.1f)
    {
       float y = (x * x) - (15 * x) - 3;
       circle(x * 10, y, 2);
    }
}
  void drawSineWave() {
  color blue = color(0, 0, 255);
  fill(blue);
  noStroke();
  
  for (float x = -300; x <= 300; x += 0.1f) 
   {
    float y = 50 + amplitude * sin(frequency * x + timeOffset);
    circle(x * 10, y, 2);
  }
}

  void keyPressed() 
  {
    if (keyCode == UP) 
    {
      amplitude += 10;
  } 
    else if (keyCode == DOWN) 
    {
      amplitude -= 10;
  }
  
    if (keyCode == RIGHT) 
    {
      frequency += 0.010;
  } 
    else if (keyCode == LEFT) 
    {
      frequency -= 0.010;
  }
}
