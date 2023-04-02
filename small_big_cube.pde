import java.util.ArrayList;
  
class RunningCube
{
  float _radian;
  float _deltaRadian;
  color _color;
  float _size;
  PVector _pos;
  
  RunningCube(float dr, color c, float size, PVector pos)
  {
    _radian = 0;
    _deltaRadian = dr;
    _color = c;
    _size = size;
    _pos = pos;
  }
  
  void move()
  {
    _radian += _deltaRadian;
    if (_radian >= PI / 2)
    {
      _radian = 0;
      _pos.x -= _size;
    }
  }
  
  void draw()
  {
    fill(_color);
    stroke(0);
    
    pushMatrix();
    
    translate(_pos.x, _pos.y, _pos.z);
    rotateZ(-_radian);
    translate(_size / 2, -_size / 2, 0);
    
    box(_size);
    
    popMatrix();
  }
}

ArrayList<RunningCube> cubes;

void setup()
{
  size(1024, 512, P3D);
  perspective(PI / 2, float(width) / float(height), 0.1, 1000000);
  
  cubes = new ArrayList<RunningCube>();
  
  float size = 20;
  float z = 800;
  for (int i = 0; i < 100; ++i)
  {
    float dr = 0.1 / (i + 1);
    color c = color(random(255), random(255), random(255));
    size += 2 * size;
    PVector pos = new PVector(0, 0, z);
    z -= size * 5;
    cubes.add(new RunningCube(dr, c, size, pos));
  }
}

void draw()
{
  camera(-1000, -100, 1000, -1000, 0, 0, 0, 1, 0);
  lights();
  directionalLight(255, 255, 255, 1, 1, -1);
  background(0);
  
  // 地面
  {
    fill(255);
    noStroke();
    
    pushMatrix();
    
    float boxHeight = 1;
    translate(0, boxHeight / 2, 0);  
    box(100000, boxHeight, 100000);
    
    popMatrix();
  }
  
  for (RunningCube cube : cubes)
  {
    cube.move();
    cube.draw();
  }
  
  //saveFrame("######.png");
}
