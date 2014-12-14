for x in [0..size.x]
  for y in [0..size.y]
    new Block x, y, 0, BLOCK.GROUND

    r = Math.randomInt 0, 100

    if r < 10
      new Block x, y, 0, BLOCK.GRAVEL
    if r > 10 and r < 20
      new Block x, y, 0, BLOCK.DIRT
    if r > 20 and r < 30
      new Block x, y, 0, BLOCK.GRASS
    if r is 90
      new Block x, y, 0, BLOCK.PUDDLE
    #if r > 95
    #  new Block x, y, 0, BLOCK.HEDGEHOD