class Shell
  constructor: (@parent) -> # @tank?
    # ...
  


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