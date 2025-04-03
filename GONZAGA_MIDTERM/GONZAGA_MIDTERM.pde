ArrayList<Mover> matter = new ArrayList<Mover>();
Mover blackHole;

int frameReset = 400; 

void setup()
{
  size(1080, 720, P3D); // sets window size
  camera(0, 0, Window.eyeZ, 0, 0, 0, 0, -1, 0); 

  // spawing 100 matter using gaussian 
  for (int i = 0; i < 100; i++) 
  {
    float x = randomGaussian() * 200;
    float y = randomGaussian() * 200;
    PVector gaussian = new PVector(x, y);

    Mover mouse = new Mover(gaussian.x, gaussian.y);
    mouse.scale = random(5, 20);
    mouse.setColor(random(255), random(255), random(255), 255);

    matter.add(mouse);
  }

  // place black hole randomly
  float x = random(Window.left, Window.right);
  float y = random(Window.bottom, Window.top);

  blackHole = new Mover(x, y);
  blackHole.scale = 50;
  blackHole.setColor(255, 255, 255, 255);
}

void draw()
{
  background(0); 

  // make black hole follow mouse
  float mx = mouseX - Window.widthPx / 2.0;
  float my = -(mouseY - Window.heightPx / 2.0);
  blackHole.position = new PVector(mx, my);

  blackHole.render();

  for (Mover mouse : matter) 
  {
    PVector direction = PVector.sub(blackHole.position, mouse.position);
    direction.normalize();
    direction.mult(2);

    mouse.position.add(direction);
    mouse.render();
  }
  
  if (frameCount % frameReset == 0)
  
  {
    matter.clear();

    for (int i = 0; i < 100; i++) 
    {
      PVector gaussian = new PVector(
        randomGaussian() * 200,
        randomGaussian() * 200
      );

      Mover mouse = new Mover(gaussian.x, gaussian.y);
      mouse.scale = random(5, 20);
      mouse.setColor(random(255), random(255), random(255), 255);

      matter.add(mouse);
    }

    float x = random(Window.left, Window.right);
    float y = random(Window.bottom, Window.top);

    blackHole = new Mover(x, y);
    blackHole.scale = 50;
    blackHole.setColor(255, 255, 255, 255);
  }
}
