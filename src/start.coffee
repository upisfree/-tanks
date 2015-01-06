# Start

# Generate map
#generateMap()

# Create player
#player = new Player Math.randomInt(0, size.x - 1), Math.randomInt(0, size.y - 1), 0

# Create bots
#for i in [0..9]
#  new Bot Math.randomInt(0, size.x - 1), Math.randomInt(0, size.y - 1), 0

# Filters
#filter =
#  pixel: new PIXI.PixelateFilter()
#filter.pixel.size.x = filter.pixel.size.y = 3

#container.filters = [filter.pixel]

Matter.Engine.run engine

console.log engine

Map.generate()

# Camera
Matter.Events.on engine, 'tick', (e) ->
  #shell.moveAll()
  #engine.render.context.offset = new PIXI.Point window.w / 2 - player.body.position.x, window.h / 2 - player.body.position.y