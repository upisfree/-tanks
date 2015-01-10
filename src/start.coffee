# Start

# Filters
#filter =
#  pixel: new PIXI.PixelateFilter()
#filter.pixel.size.x = filter.pixel.size.y = 3

#container.filters = [filter.pixel]

Matter.Engine.run engine

player = new Player Math.randomInt(0, screen.x), Math.randomInt(0, screen.y)

Map.generate()

# Camera
Matter.Events.on engine, 'tick', (e) ->
  #engine.render.context.offset = new PIXI.Point window.w / 2 - player.body.position.x, window.h / 2 - player.body.position.y