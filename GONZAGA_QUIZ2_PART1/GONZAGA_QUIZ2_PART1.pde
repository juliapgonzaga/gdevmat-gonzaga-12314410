void setup()
{
  size(1280, 720, P3D); // sets window size to 1280 x 720
  camera (0, 0, -(height/2.0) / tan(PI*30.0 / 180.0), 0, 0, 0, 0, -1, 0);
}

Walker myWalker = new Walker(); 

void draw ()
{
  
 myWalker.randomWalk();
 myWalker.render();
 
 myWalker.randomWalkBiased();
 myWalker.render();

}
