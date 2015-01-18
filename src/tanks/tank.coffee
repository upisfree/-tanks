class Tank
  constructor: (x, y, @texture, @width = 23, @height = 29) -> # TODO: size to another place
    @body = Matter.Bodies.rectangle x, y, @width, @height,
      render:
        sprite:
          texture: "assets/textures/#{@texture}.png"
      restitution: 0.5
      mass: 1000

    Matter.Composite.add engine.world, @body

  move: (force) ->
    Matter.Body.applyForce @body, { x: 0, y: 0 }, force

  applyDamage: (l) ->
    @lives -= l

    if @lives <= 0
      @destroy 'Tank was destroyed!'

  destroy: (message) ->
    @_isAlive = false
    console.log message

  _isAlive: true
  _lastShoot: Date.now() # +new Date() — there's a new Date object, I don't want get it (oh, memory...)