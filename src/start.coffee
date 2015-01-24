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
player = new Player screen.x / 2, screen.y / 2

# Can't understand what does do this code :(
Map.generate()



Matter.Events.on engine, 'tick', (e) ->
  # Kill static shells
  bodies = Matter.Composite.allBodies engine.world # make it with sleeping?

  for body in bodies
    if body.label.contains('shell') and body.isSleeping
      Matter.Composite.remove engine.world, body

  # Camera
  engine.render.context.offset = new PIXI.Point window.innerWidth / 2 - player.body.position.x, window.innerHeight / 2 - player.body.position.y

  # debug
  if config.debug
    window.engine = engine
  