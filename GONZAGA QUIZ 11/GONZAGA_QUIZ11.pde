ArrayList<Walker> walkers = new ArrayList<Walker>();

void setup()
{
  size(1080, 720, P3D); // sets window size
  camera(0, 0, Window.eyeZ, 0, 0, 0, 0, -1, 0);

  for (int i = 0; i < 10; i++) 
  {
    Walker w = new Walker();
    w.mass = random(5, 20);
    w.scale = w.mass * 5;
    w.position = new PVector(random(Window.left, Window.right), random(Window.bottom, Window.top));
    w.r = random(255);
    w.g = random(255);
    w.b = random(255);
    
    walkers.add(w);
  }
}

void draw()
{
  background(255);

  for (int i = 0; i < walkers.size(); i++) 
  {
    Walker mover = walkers.get(i); // the one being pulled by others 

    for (int j = 0; j < walkers.size(); j++) 
    {
      if (i != j) 
      {
        Walker attractor = walkers.get(j); // the one pulling 
        PVector force = attractor.calculateAttraction(mover);
        mover.applyForce(force);
      }
    }

    mover.update();
    mover.render();
  }
}
