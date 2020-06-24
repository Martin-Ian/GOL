class Cell
{
  PVector pos;
  boolean alive;
  int neighbors;

  Cell(int x, int y)
  {
    pos = new PVector(x, y);
    alive = random(1) < 0.5;
  }

  void getNeighbors()
  {
    neighbors = 0;

    for (int i = int(pos.x - 1); i <= int(pos.x + 1); i++)
    {
      for (int j = int(pos.y - 1); j <= int(pos.y + 1); j++)
      {
        if (i >= 0 && j >= 0 && i < grid.length && j < grid[i].length && grid[i][j].alive && !(i == pos.x && j == pos.y))
        {
          neighbors++;
        }
      }
    }
  }

  void show()
  {
    if (alive)
    {
      fill(255);
      rect(pos.x * CELLSIZE, pos.y * CELLSIZE, CELLSIZE, CELLSIZE);
    }
  }
}
