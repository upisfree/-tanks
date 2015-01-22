# Start
Matter.Engine.run engine

# Filters
if config.debug is false
  filter =
    pixel: new PIXI.PixelateFilter()
  filter.pixel.size = { x: 3, y: 3 }

  engine.render.spriteBatch.filters = [filter.pixel]

# Spawn bots
for i in [0..100]
  new Tank Math.randomInt(0, screen.x), Math.randomInt(0, screen.y), 'bot'

# Spawn player
new Player screen.x / 2, screen.y / 2

# Can't understand what does do this code :(
Map.generate()

###
setInterval ->
  bodies = Matter.Composite.allBodies engine.world

  for i in bodies
    Matter.Body.applyForce i, { x: 0, y: 0 }, { x: Math.randomInt(-10, 10), y: Math.randomInt(-10, 10) }
, 1000
###

# Camera
Matter.Events.on engine, 'tick', (e) ->
  # Kill static shells
  #bodies = Matter.Composite.allBodies engine.world # make it with sleeping?

  #for body in bodies
  #  if body.label.match /shell/ and body.isSleeping # почему не работает?
  #    console.log body
      #Matter.Composite.remove bodies, body


  #if config.debug
  window.engine = engine
  #engine.render.context.offset = new PIXI.Point window.w / 2 - player.body.position.x, window.h / 2 - player.body.position.y