ArrayList<Walker> walkers = new ArrayList<Walker>();

PVector acceleration = new PVector(0.2, 0);

void setup()
{
  size(1080, 720, P3D); // sets window size
  camera(0, 0, Window.eyeZ, 0, 0, 0, 0, -1, 0);

  resetWalkers();
}

void draw()
{
  background(255);

  for (Walker w : walkers) 
  {
    float mew = 0.01f;

    // changes value to 0.4 when goes beyond middle of screen
    if (w.position.x > 0) {
      mew = 0.4f;
    }

    float normal = 1;
    float frictionMagnitude = mew * normal;

    PVector friction = w.velocity.copy();
    friction.mult(-1);
    friction.normalize();
    friction.mult(frictionMagnitude);
   
    w.applyForce(friction);
    w.applyForce(acceleration);

    w.update();
    w.checkEdges();
    w.render();
  }
  stroke(0);
  strokeWeight(2);
  line(0, Window.top, 0, Window.bottom);
}

void mousePressed()
{
  resetWalkers();
}

void resetWalkers()
{
  walkers.clear();

  for (int i = 0; i < 8; i++) 
  {
    float posY = 2 * (Window.windowHeight / 8.0f) * (i - 4); 
    float posX = Window.left; 

    Walker w = new Walker();
    w.mass = i + 1;
    w.scale = w.mass * 15;
    w.position = new PVector(posX, posY);
    w.r = random(255);
    w.g = random(255);
    w.b = random(255);

    walkers.add(w);
  }
}
