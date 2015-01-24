class Tank
  constructor: (x, y, @texture, @width = 25, @height = 23) -> # TODO: size to another place
    @body = Matter.Bodies.rectangle x, y, @width, @height,
      friction: 1
      frictionAir: 0.1
      mass: 10000
      render:
        tank: null

    @body.label = "tank-#{@body.id}"

    @body.render.tank = new PIXI.DisplayObjectContainer()

    base = new PIXI.Sprite PIXI.Texture.fromImage "assets/textures/tanks/#{@texture}/base.png"
    base.position = { x: x, y: y }
    base.anchor = { x: 0.5, y: 0.5 }

    turret = new PIXI.Sprite PIXI.Texture.fromImage "assets/textures/tanks/#{@texture}/turret.png"
    turret.position = { x: x, y: y }
    turret.anchor = { x: 0.5, y: 0.73 }

    @body.render.tank.addChild base
    @body.render.tank.addChild turret

    Matter.Composite.add engine.world, @body

    entities.tanks[@body.id] = @

  move: (force) ->
    Matter.Body.applyForce @body, { x: 0, y: 0 }, Vector.mult force, 10

  shoot: ->
    #if Date.now() - @_lastShoot >= 2000 # wait 2s 
    new Shell @
    @_lastShoot = Date.now()

  destroy: ->
    @_isAlive = false
    delete entities.tanks[@body.id]

    console.log @body.label + ' was destroyed!'

  lives: 100 # in %
  _isAlive: true
  _lastShoot: Date.now() # +new Date() — there's a new Date object, I don't want get it (oh, memory...)