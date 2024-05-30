int x,y = 0;
color green = color(0,255,0);
color white = color(255);
int points = 5;
int res = 2;
boolean found = false;
int pointsx[] = new int [900000]; 
int pointsy[] = new int [900000]; 
int counter = 0;
int counter2 = 0;
int found_pices = 0;

void setup()
{
  size(200,200);
  frameRate(500);
  background(0,0,200);
  strokeWeight(1);
  stroke(0);
  clear_gradient();
  fill(255);
  circle(width/2,height/2,width - 2);
  int x1,y1 = width/2;

  for(int i =0; i < points; i++)
  {
    y1 = int(random(0,height));
    x1 = width/2;
    float dir = random(-1,1);
    if(dir <= 0) dir = -1;
    else dir = 1;
    while(get(y1,x1) == color(255))
    {
      x1 += dir;
      println(x1 + " " + y1);
    }
    pointsx[i] = x1;
    pointsy[i] = y1;
  }
  for(int i =0; i < points; i++)
  {
    for(int j =0; j < points; j++)
    {
      line(pointsx[i],pointsy[i],pointsx[j],pointsy[j]);
    }
  }
  clear_gradient();
  x = 0;
  y = 0;
}

void draw ()
{
  
  if(found)
  {
    int temp_x = pointsx[counter];
    int temp_y = pointsy[counter];
    if(get(temp_x, temp_y + 1) == white)
    {
      counter2++;
      set(temp_x,temp_y + 1,green);
      pointsx[counter2] = temp_x;
      pointsy[counter2] = temp_y + 1;
    }
    if(get(temp_x, temp_y - 1) == white)
    {
      counter2++;
      set(temp_x,temp_y - 1,green);
      pointsx[counter2] = temp_x;
      pointsy[counter2] = temp_y - 1;
    }
    if(get(temp_x + 1, temp_y) == white)
    {
      counter2++;
      set(temp_x + 1,temp_y,green);
      pointsx[counter2] = temp_x + 1;
      pointsy[counter2] = temp_y;
    }
    if(get(temp_x - 1, temp_y) == white)
    {
      counter2++;
      set(temp_x - 1,temp_y,green);
      pointsx[counter2] = temp_x - 1;
      pointsy[counter2] = temp_y;
    }
    if(counter2 == counter)
    {
      if(counter < 7)found_pices--;
      found = false;
    }
    else counter++;
  }
  else
  {
    if(y == height)
    {
      print(found_pices);
      while(true);
    }
    if(x == width)
    {
      println(y);
      x = 0;
      y++;
    }
    else
    {
      x++;
    }
    if(get(x, y) == white)
    {
      counter = 0;
      counter2 = 0;
      pointsx[counter] = x;
      pointsy[counter] = y;
      set(x,y,green);
      found = true;
      found_pices++;
      
    }
  }
}


void clear_gradient()
{
  x = 0;
  y = 0;
  do
  {
    if(green(get(x, y))>120)
    set(x,y,color(255));
    if(x == width)
    {
      x = 0;
      y++;
    }
    else
    {
      x++;
    }

  }while(y <= height);
}
