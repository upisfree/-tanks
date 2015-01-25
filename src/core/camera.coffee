Camera =
  set: (point) ->
    Engine.render.context.offset = new PIXI.Point point.x, point.y
  followPlayer: (player) ->
    Matter.Events.on Engine, 'tick', (e) ->
      Camera.set { x: Screen.size.x / 2 - player.body.position.x, y: Screen.size.y / 2 - player.body.position.y }