class Block
  constructor: (@x, @y, @texture, @i = blocks.length) ->
  move: (x, y) ->
    @x += x
    @y += y
    blocks[@i] = this