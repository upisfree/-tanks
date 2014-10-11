for _x in [0..size - 1]
  for _y in [0..size - 1]
    blocks.push new Block _x, _y, 'ground'

    r = Math.randomInt 0, 100

    if r < 10
      blocks.push new Block _x, _y, 'ground2'
    if r > 10 and r < 20
      blocks.push new Block _x, _y, 'ground3'
    if r > 20 and r < 30
      blocks.push new Block _x, _y, 'ground4'
    if r is 90
      blocks.push new Block _x, _y, 'puddle'
    if r > 95
      blocks.push new Block _x, _y, 'hedgehog'