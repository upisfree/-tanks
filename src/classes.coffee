class Block
  constructor: (@v, @type) ->
    @i = blocks.length
    #blocks.push @

class Tank extends Block
  constructor: (@v, @type, @lives) ->
  move: (v) ->
    x = v.x
    y = v.y
    deg = v.deg

    @v.deg = deg if deg

    if @v.x + x < size and @v.x + x > -1 and
       @v.y + y < size and @v.y + y > -1
      @v.x += x
      @v.y += y
      blocks[@i] = @

      for i in blocks
        if @v.x is i.v.x and @v.y is i.v.y and i.type is 'hedgehog'
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
          player.move new Vector -1, 0, 270
        when KEY_CODE.ARROW.UP,    KEY_CODE.W
          player.move new Vector 0, -1, 0
        when KEY_CODE.ARROW.RIGHT, KEY_CODE.D
          player.move new Vector 1, 0, 90
        when KEY_CODE.ARROW.DOWN,  KEY_CODE.S
          player.move new Vector 0, 1, 180
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