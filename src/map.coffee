for _x in [0..size - 1]
  for _y in [0..size - 1]
    blocks.push new Block new Vector(_x, _y, 0), 'ground'

    r = Math.randomInt 0, 100

    if r < 10
      blocks.push new Block new Vector(_x, _y, 0), 'ground2'
    if r > 10 and r < 20
      blocks.push new Block new Vector(_x, _y, 0), 'ground3'
    if r > 20 and r < 30
      blocks.push new Block new Vector(_x, _y, 0), 'ground4'
    if r is 90
      blocks.push new Block new Vector(_x, _y, 0), 'puddle'
    if r > 95
      blocks.push new Block new Vector(_x, _y, 0), 'hedgehog'