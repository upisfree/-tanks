class Player extends Tank
  constructor: (x, y) ->
    super x, y, 'player'

    @enable.keyboard @ # :D
    @enable.mouse @

  enable:
    keyboard: (player) ->
      # Moving
      Mousetrap.bind ['w', 'up'], ->
        player.move Vector.fromAngle player.body.angle

      Mousetrap.bind ['s', 'down'], ->
        player.move Vector.neg Vector.fromAngle player.body.angle

      # Rotating
      Mousetrap.bind ['a', 'left'], ->
        Matter.Body.rotate player.body, Math.degreesToRadians -2

      Mousetrap.bind ['d', 'right'], ->
        Matter.Body.rotate player.body, Math.degreesToRadians 2 # 2?

    mouse: (player) ->
      window.onmousemove = (e) ->
        Mouse.position =
          x: e.x
          y: e.y

        player.body.render.tank.children[1].rotation = player.body.turretRotation = Math.atan2(player.body.position.y - e.y, player.body.position.x - e.x) - Math.PI / 2

      window.onclick = (e) ->
        player.shoot()

  disable:
    keyboard: ->
      Mousetrap.unbind ['w', 'up', 's', 'down', 'a', 'left', 'd', 'right']

    mouse: (player) ->
      window.onmousemove = window.onclick = null # temporarily

  destroy: ->
    @disable.keyboard()
    @disable.mouse()

    super