class Block
  constructor: (@x, @y, @texture, @i = blocks.length) ->
  move: (x, y) ->
    if @x + x < size and @x + x > -1 and
       @y + y < size and @y + y > -1
      @x += x
      @y += y
      blocks[@i] = this