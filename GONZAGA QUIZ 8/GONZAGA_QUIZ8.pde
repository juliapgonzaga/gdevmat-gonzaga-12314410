ArrayList<Walker> walkers = new ArrayList<Walker>();

PVector wind = new PVector(0.15, 0);
PVector gravity = new PVector(0, -0.4);

void setup()
{
  size(1080, 720, P3D); // sets window size
  camera(0, 0, Window.eyeZ, 0, 0, 0, 0, -1, 0);

  for (int i = 0; i < 10; i++) 
  {
    Walker w = new Walker();
    w.mass = i + 1;
    w.scale = w.mass * 15;
    w.position = new PVector(-500, 200);
    w.r = random(255);
    w.g = random(255);
    w.b = random(255);

    walkers.add(w);
  }
}

void draw()
{
  background(255);

  for (Walker w : walkers) 
  {
    w.applyForce(wind);
    w.applyForce(gravity);
    w.update();
    w.checkEdges();
    w.render();
  }
}
