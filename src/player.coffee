class Player
  constructor: (@x, @y) ->
    @body = Matter.Bodies.rectangle @x, @y, 23, 29,
      render:
        sprite:
          texture: 'assets/textures/player.png'
      restitution: 0.5

    Matter.Composite.add engine.world, @body

  move: (x, y) ->
    @body.position.x += x
    @body.position.y += y
    @x = @body.position.x
    @y = @body.position.y

  enableControl: ->
    window.onkeyup = (e) ->
      switch e.keyboard.sourceEvents.keyup.keyCode
        when KEY_CODE.ARROW.LEFT,  KEY_CODE.A then player.move -5, null
        when KEY_CODE.ARROW.UP,    KEY_CODE.W then player.move null, -10
        when KEY_CODE.ARROW.RIGHT, KEY_CODE.D then player.move 5, null
        when KEY_CODE.ARROW.DOWN,  KEY_CODE.S then player.move null, 10

class Player2 extends Tank
  constructor: (@x, @y, @rotation) ->
    super @x, @y, @rotation, BLOCK.PLAYER, 3
    @enableControl()

    entities.players.push @

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

setCamera = ->
  window.container = container