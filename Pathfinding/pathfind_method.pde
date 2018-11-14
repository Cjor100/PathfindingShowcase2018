//Variables //<>//
ArrayList<Integer> open = new ArrayList<Integer>();
ArrayList<Integer> closed = new ArrayList<Integer>();
ArrayList<Integer> path = new ArrayList<Integer>();

void pathfind()
{
  //Variables
  Integer[] adjacent = new Integer[4];
  int current=0;

  //Calculate h
  for (int a=0; a<=navgrid.size()-1; a++)
  {
    navgrid.get(a).h=int((dist(navgrid.get(a).x, 0, navgrid.get(end).x, 0) + dist(0, navgrid.get(a).y, 0, navgrid.get(end).y)));
  }

  //Pathfinding start
  open.add(start);
  while (open.size()!=0)
  {
    //Find the lowest F of tiles   
    int temp;
    for (int i=open.size()-1; i>0; i--)
    {
      int first=0;
      for (int j=1; j<=i; j++)
      {
        if (navgrid.get(open.get(j)).f > navgrid.get(open.get(first)).f)
          first=j;
      }
      temp = open.get(first);
      open.set(first, open.get(i));
      open.set(i, temp);
    }
    current=open.get(0);
    open.remove(0);
    closed.add(current);

    //Assign adjacent navgrid
    if ((current+1)<=navgrid.size()-1 && (navgrid.get(current).x+1==navgrid.get(current+1).x))
      adjacent[0]=current+1; //right
    else
      adjacent[0]=-1;
    if ((current-1)>=0 && (navgrid.get(current).x-1==navgrid.get(current-1).x))
      adjacent[1]=current-1; //left
    else
      adjacent[1]=-1;
    if ((current+32)<=navgrid.size()-1 && (navgrid.get(current).y+1==navgrid.get(current+32).y))
      adjacent[2]=current+32; //up
    else
      adjacent[2]=-1;
    if ((current-32)>=0 && (navgrid.get(current).y-1==navgrid.get(current-32).y))
      adjacent[3]=current-32; //down
    else
      adjacent[3]=-1;

    if (current==end)
    {
      for (int a=0; a<=3; a++)
      {
        if (adjacent[a]!=-1)
        {
          if (navgrid.get(adjacent[a]).parent==current)
          {
            navgrid.get(current).parent=adjacent[a];
          }
        }
      }
      break;
    }

    for (int a=0; a<=3; a++)
    {
      if (adjacent[a]!=-1)
      {
        if ((navgrid.get(adjacent[a]).state==1) || (closed.contains(adjacent[a])))
        {
          continue;
        }
        if (navgrid.get(adjacent[a]).g!=0 && navgrid.get(current).g+1<navgrid.get(adjacent[a]).g || !open.contains(adjacent[a]))
        {
          navgrid.get(adjacent[a]).g=(navgrid.get(current).g+1);
          navgrid.get(adjacent[a]).f=(navgrid.get(adjacent[a]).g+navgrid.get(adjacent[a]).h);
          navgrid.get(adjacent[a]).parent=current;
          if (!open.contains(adjacent[a]))
          {
            open.add(adjacent[a]);
          }
        }
      }
    }

    //Update navgrid
    for (int a=0; a<=navgrid.size()-1; a++)
    {
      if (closed.contains(a) && navgrid.get(a).state==0)
      {
        navgrid.get(a).state=4;
        delay(10);
      }
    }
  }

  //Find the path
  current=end;
  while (navgrid.get(current).parent!=-1)
  {
    //Assign adjacent navgrid
    if ((current+1)<=navgrid.size()-1 && (navgrid.get(current).x+1==navgrid.get(current+1).x))
      adjacent[0]=current+1; //right
    else
      adjacent[0]=-1;
    if ((current-1)>=0 && (navgrid.get(current).x-1==navgrid.get(current-1).x))
      adjacent[1]=current-1; //left
    else
      adjacent[1]=-1;
    if ((current+32)<=navgrid.size()-1 && (navgrid.get(current).y+1==navgrid.get(current+32).y))
      adjacent[2]=current+32; //up
    else
      adjacent[2]=-1;
    if ((current-32)>=0 && (navgrid.get(current).y-1==navgrid.get(current-32).y))
      adjacent[3]=current-32; //down
    else
      adjacent[3]=-1;

    for (int a=0; a<=3; a++)
    {
      if (adjacent[a]!=-1)
      {
        if (navgrid.get(current).parent==adjacent[a])
        {
          path.add(adjacent[a]);
          current=adjacent[a];
        }
        if (adjacent[a]==start)
        {
          break;
        }
      }
    }
  }
  finish=true;
}
