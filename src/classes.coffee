class Block
  constructor: (@x, @y, @texture, @i = blocks.length) ->
    #blocks.push @

class Tank extends Block
  constructor: (@x, @y, @texture, @lives) ->
  move: (x, y) ->
    if @x + x < size and @x + x > -1 and
       @y + y < size and @y + y > -1
      @x += x
      @y += y
      blocks[@i] = this
  applyDamage: (l) ->
    @lives -= l

    if @lives <= 0
      console.log 'Tank was destroyed'

class Bot extends Tank
  _ai: null

class Player extends Tank
  enableControl: () ->
    window.onkeydown = (e) ->
      switch e.keyCode
        when KEY_CODE.ARROW.LEFT,  KEY_CODE.A
          player.move -1, 0
        when KEY_CODE.ARROW.UP,    KEY_CODE.W
          player.move 0, -1
        when KEY_CODE.ARROW.RIGHT, KEY_CODE.D
          player.move 1, 0
        when KEY_CODE.ARROW.DOWN,  KEY_CODE.S
          player.move 0, 1
