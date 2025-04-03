void setup()
{
  size(1080, 720, P3D); // sets window size
  camera(0, 0, Window.eyeZ, 0, 0, 0, 0, -1, 0);
}

PVector mousePos()
{
  // Code from the lecture would not correctly display 0, 0 in center position
  // Changed it to use full window size (widthPx and heightPx) to properly center
  float x = mouseX - Window.widthPx / 2.0;
  float y = -(mouseY - Window.heightPx / 2.0);
  return new PVector(x, y);
}

void draw()
{
  background(130);

  PVector mouse = mousePos();

  // red glow
  strokeWeight(30);
  stroke(255, 0, 0, 100); 
  line(0, 0, mouse.x, mouse.y);
  line(0, 0, -mouse.x, -mouse.y); 

  // white glow
  strokeWeight(10);
  stroke(255); 
  line(0, 0, mouse.x, mouse.y);
  line(0, 0, -mouse.x, -mouse.y);

  // black handle 
  float handleX = mouse.x * 0.05;
  float handleY = mouse.y * 0.05;
  strokeWeight(25);
  stroke(0);
  line(-handleX, -handleY, handleX, handleY);
  

  println(" " + mouse.mag());
}
