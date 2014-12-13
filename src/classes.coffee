class Block
  constructor: (@x, @y, @rotation, @type, @i = stage.children.length) ->
    @s = new PIXI.Sprite PIXI.Texture.fromImage "../textures/#{@type}.png"
    @s.position.x = @x * step + step / 2
    @s.position.y = @y * step + step / 2
    @s.rotation   = Math.degreesToRadians @rotation
    @s.anchor.x = 0.5
    @s.anchor.y = 0.5
  
    stage.addChild @s

    switch @type
      when BLOCK.HEDGEHOD then entities.hedgehogs.push @
      when BLOCK.SHELL    then entities.shells.push @

class Tank extends Block
  constructor: (@x, @y, @rotation, @type, @lives) ->
    super @x, @y, @rotation, @type
  move: (x, y, r) ->
    rotation = Math.degreesToRadians r

    s = stage.children[@i]

    if s.rotation isnt rotation # turning on the spot
      @rotation = r
      s.rotation = rotation
      stage.children[@i] = s
      return

    if s.position.x + x * step < screenSize and s.position.x + x * step > -1 and
       s.position.y + y * step < screenSize and s.position.y + y * step > -1
      @x += x
      @y += y
      s.position.x += x * step
      s.position.y += y * step

      for a in entities.hedgehogs #.concat entities.bots
        if @x is a.x and @y is a.y
          @applyDamage 1

      stage.children[@i] = s

  applyDamage: (l) ->
    @lives -= l

    if @lives <= 0
      @destroy 'Tank was destroyed!'

  destroy: (message) ->
    @_isAlive = false
    console.log message

  shoot: ->
    new Shell @x, @y, @rotation

  _isAlive: true

class Player extends Tank
  constructor: (@x, @y, @rotation) ->
    super @x, @y, @rotation, BLOCK.PLAYER, 3
    @enableControl()

  enableControl: ->
    p = @
    window.onkeydown = (e) ->
      switch e.keyCode
        when KEY_CODE.ARROW.LEFT,  KEY_CODE.A
          p.move -1, 0, 270
        when KEY_CODE.ARROW.UP,    KEY_CODE.W
          p.move 0, -1, 0
        when KEY_CODE.ARROW.RIGHT, KEY_CODE.D
          p.move 1, 0, 90
        when KEY_CODE.ARROW.DOWN,  KEY_CODE.S
          p.move 0, 1, 180
        when KEY_CODE.SPACE
          p.shoot()

  disableControl: ->
    window.onkeydown = null

  destroy: ->
    @disableControl()

    for a in entities.bots
      if a._isAlive is true
        AI.disable a
        AI.random a

    super 'Bye, sir!'

class Bot extends Tank
  constructor: (@x, @y, @rotation) ->
    super @x, @y, @rotation, BLOCK.BOT, 2
    AI.enable @

    entities.bots.push @

  destroy: ->
    AI.disable @
    super 'Bye, bot!'
  _ai: null