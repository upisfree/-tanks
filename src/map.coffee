for _x in [0..size - 1]
  for _y in [0..size - 1]
    blocks.push new Block _x, _y, 'ground'

    if Math.random() < 0.05
      blocks.push new Block _x, _y, 'hedgehog'