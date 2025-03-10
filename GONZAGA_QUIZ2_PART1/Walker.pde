class Walker
{
  float x;
  float y;
  
  
  void render()
  {
    float r = random(255);
    float g = random(255);
    float b = random(255);
    float a = random(50, 100); 

    fill(r, g, b, a);
    circle(x, y, 30);
  }
  
  void randomWalk()
  {
    int rng = int(random(8));
    
   if (rng == 0)
   {
     y+=10;
   }
   else if (rng == 1)
   {
     y-=10;
   }
   else if (rng == 2)
   {
     x+=10;
   }
   else if (rng == 3)
   {
     x-=10;
   }
   else if (rng == 4) 
   {
     x+=10; y+=10; // down right corner
   }
   else if (rng == 5)
   {
     x-=10; y-=10; // up left corner
   }
   else if (rng == 6)
   {
     x+=10; y-=10; // up right corner
   }
   else if (rng == 7)
   {
     x-=10; y+=10; // down left corner
   }
  }
  
  void randomWalkBiased()
{
  float rng = random(1);
  
  if (rng < 0.50)
  {
    int diagonalDirection = int(random(4));
    
    if (diagonalDirection == 0)
    {
      x+=10; y+=10; // down right corner
    }
    else if (diagonalDirection == 1)
    {
      x-=10; y+=10; // down left corner
    }
    else if (diagonalDirection == 2)
    {
      x+=10; y-=10; // up right corner
    }
    else if (diagonalDirection == 3)
    {
      x-=10; y-=10; // up left corner
    }
  }
  else if (rng < 0.75) 
  {
    if (random(1) < 0.5)
    {
      x+=10; // move right
    }
    else
    {
      x-=10; // move left
    }
  }
  else
  {
    if (random(1) < 0.5)
    {
      y+=10; // move down
    }
    else
    {
      y-=10; // move up
    }
  }
}
  
}
