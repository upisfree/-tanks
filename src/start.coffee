# Start
Matter.Engine.run Engine

# Filters
if Config.debug is false
  filter =
    pixel: new PIXI.PixelateFilter()
  filter.pixel.size = { x: 3, y: 3 }

  Engine.render.spriteBatch.filters = [filter.pixel]

# Can't understand what does do this code :(
Map.generate()

# Spawn bots
for i in [0..100]
  new Tank Math.randomInt(0, Screen.size.x), Math.randomInt(0, Screen.size.y), 'bot'

# Spawn player
player = new Player Screen.size.x / 2, Screen.size.y / 2
Camera.followPlayer player

Matter.Events.on Engine, 'tick', (e) ->
  # Kill static shells
  bodies = Matter.Composite.allBodies Engine.world # make it in sleep class?

  for body in bodies
    if body.label.contains('shell') and body.isSleeping
      Matter.Composite.remove Engine.world, body

  # debug
  if Config.debug
    window.engine = Engine