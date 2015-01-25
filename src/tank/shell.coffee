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

    @body.label = "shell-#{@tank.body.id}" # it's to know the name of the murder

    Matter.Composite.add Engine.world, @body

    # Move shell
    Matter.Body.applyForce @body, { x: 0, y: 0 }, Vector.mult _v, 200
    
    # Move tank
    Matter.Body.applyForce @tank.body, { x: 0, y: 0 }, Vector.neg Vector.mult _v, 50

    Matter.Events.on Engine, 'collisionStart', (event) ->
      pairs = event.pairs

      for pair in pairs
        if pair.bodyA.label.contains('tank') and pair.bodyB.label.contains('shell')
          Matter.Composite.remove Engine.world, pair.bodyB

          tank = Entities.tanks[pair.bodyA.label.replace /tank-/, '']

          if not tank
            break

          damage = Math.round pair.separation * 100 # ???

          tank.lives -= damage

          if tank.lives <= 0
            tank.destroy()
        else if pair.bodyA.label.contains('shell') and pair.bodyB.label.contains('shell')
          Matter.Composite.remove Engine.world, [pair.bodyA, pair.bodyA]