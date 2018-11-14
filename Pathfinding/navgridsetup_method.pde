void navgridetup()
{
  navgrid.clear();
  open.clear();
  closed.clear();
  path.clear();
  start=-1;
  end=-1;
  //Grid Setup
  for (int a=0; a<24; a++)
  {
    for (int s=0; s<32; s++)
    {
      navgrid.add(new grid(s, a));
    }
  }
  redraw();
  //Blockade Placement
  int random;
  for (int a=0; a<=round(random(100, 400)); a++) 
  {
    redraw();
    random=round(random(0, navgrid.size()-1));
    if (navgrid.get(random).state==0)
    {
      navgrid.get(random).state=1;
      delay(10);
    }
  }
  //Start Placement
  while (start==-1)
  {
    random=round(random(0, navgrid.size()-1));
    if (navgrid.get(random).state==0)
    {
      navgrid.get(random).state=2;
      start=random;
    }
  }
  delay(10);
  //End Placement
  while (end==-1)
  {
    random=round(random(0, navgrid.size()-1));
    if (navgrid.get(random).state==0)
    {
      navgrid.get(random).state=3;
      end=random;
    }
  }
  delay(10);
  pathfind();
  //Update Grid
  for (int a=0; a<=navgrid.size()-1; a++)
  {
    if (path.contains(a) && navgrid.get(a).state==4)
    {
      navgrid.get(a).state=5;
      delay(10);
    }
  }
}
