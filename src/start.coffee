# Start

# Filters
#filter =
#  pixel: new PIXI.PixelateFilter()
#filter.pixel.size.x = filter.pixel.size.y = 3

#container.filters = [filter.pixel]

Matter.Engine.run engine

for i in [0..100]
  new Tank Math.randomInt(0, screen.x), Math.randomInt(0, screen.y), 'bot'

new Player screen.x / 2, screen.y / 2

Map.generate()

setInterval ->
  bodies = Matter.Composite.allBodies engine.world

  for i in bodies
    Matter.Body.applyForce i, { x: 0, y: 0 }, { x: Math.randomInt(-10, 10), y: Math.randomInt(-10, 10) }
, 1000


setInterval ->
  bodies = Matter.Composite.allBodies engine.world

  for i in bodies
    i.render.tank.children[0].rotation = Math.randomInt 0, Math.PI
, 100

# Camera
Matter.Events.on engine, 'tick', (e) ->
  #engine.render.context.offset = new PIXI.Point window.w / 2 - player.body.position.x, window.h / 2 - player.body.position.y