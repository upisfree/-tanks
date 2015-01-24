Camera =
  set: (point) ->
    engine.render.context.offset = new PIXI.Point point.x, point.y
  followPlayer: (player) ->
    Matter.Events.on engine, 'tick', (e) ->
      Camera.set { x: screen.x / 2 - player.body.position.x, y: screen.y / 2 - player.body.position.y }