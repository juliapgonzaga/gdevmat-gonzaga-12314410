ArrayList<Walker> walkers = new ArrayList<Walker>();
Liquid ocean = new Liquid(0, -100, Window.right, Window.bottom, 0.1f);
PVector wind = new PVector(0.1, 0);

void setup()
{
  size(1080, 720, P3D); // sets window size
  camera(0, 0, Window.eyeZ, 0, 0, 0, 0, -1, 0);

  for (int i = 0; i < 10; i++) 
  {
    float posX = Window.left + i * 100;  
    float posY = Window.top;

    Walker w = new Walker();
   // w.mass = random(1, 5);   
    w.mass = 10 - i; // i don't know if i should randomize it or not because the sample shown during the module lector displayed the matter from biggest to smallest so i just put both hehe
    w.scale = w.mass * 10;            
    w.position = new PVector(posX, posY);
    w.r = random(255);
    w.g = random(255);
    w.b = random(255);

    walkers.add(w);
  }
}

void draw()
{
  background(255); 

  ocean.render(); 

  for (Walker w : walkers) 
  {
    PVector gravity = new PVector(0, -0.15 * w.mass);

    w.applyForce(wind);
    w.applyForce(gravity);

    if (ocean.isCollidingWith(w)) 
    {
      PVector drag = ocean.calculateDragForce(w);
      w.applyForce(drag);
    }

    w.update();
    w.render();

    if (w.position.y <= Window.bottom)
    {
      w.position.y = Window.bottom;
      w.velocity.y *= -1;
    }
  }
}
