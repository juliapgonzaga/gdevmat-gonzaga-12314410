class Walker
{
  PVector position;
  PVector speed;

  Walker()
  {
    position = new PVector(0, 0);
    speed = new PVector(5, 8);
  }

  void render()
  {
    fill(182, 52, 100);
    noStroke();
    circle(position.x, position.y, 50);
  }

  void moveAndBounce()
  {

    position.add(speed);

    if (position.x > Window.right || position.x < Window.left) {
      speed.x *= -1;
    }

    if (position.y > Window.top || position.y < Window.bottom) {
      speed.y *= -1;
    }
  }
}
