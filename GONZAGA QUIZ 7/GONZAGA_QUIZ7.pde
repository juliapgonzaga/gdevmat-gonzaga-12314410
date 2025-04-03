ArrayList<Walker> walkers = new ArrayList<Walker>();

void setup()
{
  size(1080, 720, P3D); // sets window size
  camera(0, 0, Window.eyeZ, 0, 0, 0, 0, -1, 0); 
  
// makes 100 walkers with random positions and sizes
for (int i = 0; i < 100; i++) 
  {
    Walker w = new Walker();
    w.position = new PVector(
      random(Window.left, Window.right),     
      random(Window.bottom, Window.top)       
    );
    
    w.scale = random(5, 20);                  
    walkers.add(w);
  }
}


void draw()
{
  background(0);
  
for (Walker w : walkers) {
    w.update();
    w.render();
    w.checkEdges();
  }
}
