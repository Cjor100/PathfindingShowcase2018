// Imports
import java.util.ArrayList;

//Arrays
ArrayList<grid> navgrid = new ArrayList<grid>();

//Variables
int start, end;
boolean finish=true;

void setup ()
{
  //Render settings
  size(1056, 800);
  frameRate(60);
  smooth();
  thread("navgridetup");
}

void mouseReleased()
{
  if (finish)
  {
    thread("navgridetup");
    finish=false;
  }
}

void draw()
{ 
  clear();
  background(175);
  //Display navgrid
  for (int a=0; a<=navgrid.size()-1; a++)
  {
    navgrid.get(a).draw();
    fill(255);
    textAlign(CENTER, CENTER);
    if (navgrid.get(a).state>1)
    {
      textSize(12);
      text(a, navgrid.get(a).x*32+32, navgrid.get(a).y*32+30);
      if (navgrid.get(a).parent!=-1)
      {
        textSize(8);
        text(navgrid.get(a).parent, navgrid.get(a).x*32+32, navgrid.get(a).y*32+40);
      }
    }
  }
}
