class Block
  constructor: (@x, @y, @type) ->
    @i = blocks.length
    #blocks.push @

class Tank extends Block
  constructor: (@x, @y, @type, @lives, @deg) ->
  move: (x, y, deg) ->
    @deg = deg if deg

    if @x + x < size and @x + x > -1 and
       @y + y < size and @y + y > -1
      @x += x
      @y += y
      blocks[@i] = @

      for i in blocks
        if @x is i.x and @y is i.y and i.type is 'hedgehog'
          @applyDamage 1

  applyDamage: (l) ->
    @lives -= l

    if @lives <= 0
      @destroy 'Tank was destroyed!'

  destroy: (message) ->
    console.log message

class Player extends Tank
  enableControl: ->
    window.onkeydown = (e) ->
      switch e.keyCode
        when KEY_CODE.ARROW.LEFT,  KEY_CODE.A
          player.move -1, 0, 270
        when KEY_CODE.ARROW.UP,    KEY_CODE.W
          player.move 0, -1, 0
        when KEY_CODE.ARROW.RIGHT, KEY_CODE.D
          player.move 1, 0, 90
        when KEY_CODE.ARROW.DOWN,  KEY_CODE.S
          player.move 0, 1, 180
  disableControl: ->
    window.onkeydown = null
  destroy: ->
    @disableControl()
    super 'Bye, sir!'

class Bot extends Tank
  _ai: null
  destroy: ->
    AI.disable @
    super 'Bye, bot!'