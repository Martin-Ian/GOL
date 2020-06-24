Cell[][] grid;
int CELLSIZE = 5;

void setup()
{
  size(600, 600);
  grid = new Cell[width / CELLSIZE][height / CELLSIZE];

  for (int i = 0; i < grid.length; i++)
  {
    for (int j = 0; j < grid[i].length; j++)
    {
      grid[i][j] = new Cell(i, j);
    }
  }
  frameRate(10);
}

void draw()
{
  background(0);

  for (int i = 0; i < grid.length; i++)
  {
    for (int j = 0; j < grid[i].length; j++)
    {
      grid[i][j].show();
    }
  }

  nextGen();
}

void nextGen()
{
  boolean[][] next = new boolean[grid.length][grid[0].length];

  for (int i = 0; i < grid.length; i++)
  {
    for (int j = 0; j < grid[i].length; j++)
    {
      grid[i][j].getNeighbors();
      if (grid[i][j].alive == false && grid[i][j].neighbors == 3)
      {
        next[i][j] = true;
      } else if (grid[i][j].alive == true && grid[i][j].neighbors >= 2 && grid[i][j].neighbors <= 3)
      {
        next[i][j] = true;
      } else 
      {
        next[i][j] = false;
      }
    }
  }


  for (int i = 0; i < grid.length; i++)
  {
    for (int j = 0; j < grid[i].length; j++)
    {
      grid[i][j].alive = next[i][j];
    }
  }
}
