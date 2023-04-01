import java.util.ArrayList;

class RunningCube
{
  void move()
  {
  }
  
  void draw()
  {
  }
}

ArrayList<RunningCube> cubes;

void setup()
{
  size(512, 512, P3D);
  
  cubes = new ArrayList<RunningCube>();
}

void draw()
{
  lights();
  background(0);
  camera(-50, -10, 100, 0, 0, 0, 0, 1, 0);
  perspective(PI / 2, float(width) / float(height), 0.1, 1000);
  
  // 地面
  pushMatrix();
  float boxHeight = 1;
  translate(0, boxHeight / 2, 0);
  box(500, boxHeight, 500);
  popMatrix();
  
  for (RunningCube cube : cubes)
  {
    cube.move();
    cube.draw();
  }
  
  //saveFrame("######.png");
}
