class grid
{
  int x, y;
  int h = 0;
  int g = 0;
  int f = 0;
  int parent = -1;
  //h is distance from end
  //g is path length
  //f is g+h
  int state=0;
  //0 is free
  //1 is block which which is black
  //2 is start which which is red
  //3 is end which which is blue
  //4 is considered paths which is green
  //5 is correct path which is orange
  grid(int xpos, int ypos)
  {
    x=xpos;
    y=ypos;
  }
  void draw()
  {
    //Block display
    if (state==1)
    {
      fill(0);
      noStroke();
      rect((x*32)+16, (y*32)+16, 32, 32);
    } else if (state==2)
    {
      fill(175, 0, 0);
      noStroke();
      rect((x*32)+16, (y*32)+16, 32, 32);
    } else if (state==3)
    {
      fill(0, 0, 175);
      noStroke();
      rect((x*32)+16, (y*32)+16, 32, 32);
    } else if (state==4)
    {
      fill(0, 125, 0);
      noStroke();
      rect((x*32)+16, (y*32)+16, 32, 32);
    } else if (state==5)
    {
      fill(255, 100, 0);
      noStroke();
      rect((x*32)+16, (y*32)+16, 32, 32);
    }
      noFill();
      stroke(150);
      rect((x*32)+16, (y*32)+16, 32, 32);
  }
}