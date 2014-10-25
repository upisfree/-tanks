class Block
  constructor: (@v, @type) ->
    @i = objects.all.length

    if @type isnt BLOCK.PLAYER or @type isnt BLOCK.BOT
      objects.all.push @

    if @type is BLOCK.HEDGEHOD
      objects.hedgehogs.push @
    

class Tank extends Block
  constructor: (@v, @type, @lives) ->
  move: (v) ->
    x = v.x
    y = v.y

    if @v.deg isnt v.deg # turning on the spot
      @v.deg = v.deg
      return  

    if @v.x + x < size and @v.x + x > -1 and
       @v.y + y < size and @v.y + y > -1
      @v.x += x
      @v.y += y
      objects.all[@i] = @

      for i in objects.all
        if @v.x is i.v.x and @v.y is i.v.y and i.type is BLOCK.HEDGEHOD
          @applyDamage 1

  applyDamage: (l) ->
    @lives -= l

    if @lives <= 0
      @destroy 'Tank was destroyed!'

  destroy: (message) ->
    console.log message

class Player extends Tank
  constructor: (@v) ->
    super @v, BLOCK.PLAYER, 3
    @.enableControl()

    objects.all.push @

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

    for i in objects.bots
      AI.disable i
      AI.random i

    super 'Bye, sir!'

class Bot extends Tank
  constructor: (@v) ->
    super @v, BLOCK.BOT, 2
    AI.enable @

    objects.all.push @
    objects.bots.push @

  destroy: ->
    AI.disable @
    super 'Bye, bot!'
  _ai: null