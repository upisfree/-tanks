class Shell
  constructor: (@tank) ->
    _v = Vector.fromAngle @tank.body.turretRotation
    x = @tank.body.position.x + _v.x * 20
    y = @tank.body.position.y + _v.y * 20

    @body = Matter.Bodies.rectangle x, y, 7, 14,
      angle: @tank.body.turretRotation
      friction: 1
      frictionAir: 0.1
      mass: 1000
      render:
        sprite:
          texture: "assets/textures/tanks/shell.png"

    Matter.Composite.add engine.world, @body

    # Move shell
    Matter.Body.applyForce @body, { x: 0, y: 0 }, Vector.mult _v, 200
    
    # Move tank
    Matter.Body.applyForce @tank.body, { x: 0, y: 0 }, Vector.neg Vector.mult _v, 50

class Shell2 extends Body
  constructor: (@x, @y, @rotation) ->
    switch @rotation
      when 0 then --@y
      when 90 then ++@x
      when 180 then ++@y
      when 270 then --@x

    super @x, @y, @rotation, BLOCK.SHELL

shell =
  speed: 2 # pixels per frame
  remove: (s) ->
    entities.shells.remove s
    container.children.splice s.i, 1 # container.children.removeChild doesn't remove shell from screen
  moveAll: -> # new Pixi.SpriteBatch() for render shells
    for a in entities.shells
      switch a.rotation
        when 0   then a.s.position.y -= shell.speed
        when 90  then a.s.position.x += shell.speed
        when 180 then a.s.position.y += shell.speed
        when 270 then a.s.position.x -= shell.speed  

      # if don't see shell — remove
      if a.s.position.x > screen.x or a.s.position.x < 0 or
         a.s.position.y > screen.y or a.s.position.y < 0
        shell.remove a

      for b in entities.bots
        if isCollision(a.s.position.x, a.s.position.y, b.s.position.x, b.s.position.y) is true and b._isAlive is true
          shell.remove a
          b.applyDamage 1

      for b in entities.players # in one loop with bots?
        if isCollision(a.s.position.x, a.s.position.y, b.s.position.x, b.s.position.y) is true and b._isAlive is true
          shell.remove a
          b.applyDamage 1