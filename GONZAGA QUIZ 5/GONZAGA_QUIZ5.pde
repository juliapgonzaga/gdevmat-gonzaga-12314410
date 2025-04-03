void setup()
{
  size(1280, 720, P3D); // sets window size to 1280 x 720
  camera (0, 0, Window.eyeZ, 0, 0, 0, 0, -1, 0);
}

Walker walker = new Walker();

void draw()
{
  background(255); // clear the screen
  walker.render();
  walker.moveAndBounce(); // simulate bouncing
}
