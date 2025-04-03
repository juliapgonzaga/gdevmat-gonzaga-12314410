void setup()
{
  size(1280, 720, P3D); // sets window size to 1280 x 720
  camera (0, 0, -(height/2.0) / tan(PI*30.0 / 180.0), 0, 0, 0, 0, -1, 0);
  background(255);
}


void draw ()
{

  if (frameCount % 300 == 0){
    background(255);
  }

  float gaussian = randomGaussian();
  float standardDeviation = 200; // how scattered the values are 
  float mean = 0; // center of the screen 
  float x = standardDeviation * gaussian + mean;

  float y = random(-height / 2, height / 2); 

  float sizeGaussian = randomGaussian();
  float sizeSD = 10;
  float sizeMean = 20;
  float diameter = sizeSD * sizeGaussian + sizeMean;

  float r = random(255);
  float g = random(255);
  float b = random(255);
  float alpha = random(10, 100);

  noStroke();
  fill(r, g, b, alpha);
  circle(x, y, diameter);
}
