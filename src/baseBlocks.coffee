class Block
  constructor: (@x, @y, @rotation, @type, @i = stage.children.length) ->
    @s = new PIXI.Sprite PIXI.Texture.fromImage "../assets/textures/#{@type}.png"
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