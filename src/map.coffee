Map =
  Cell: class
    constructor: (@x, @y, @rotation, @type) ->
      @s = new PIXI.Sprite PIXI.Texture.fromImage "../assets/textures/#{@type}.png"
      @s.position.x = @x * step + step / 2
      @s.position.y = @y * step + step / 2
      @s.rotation   = Math.degreesToRadians @rotation
      @s.anchor.x = 0.5
      @s.anchor.y = 0.5

      #console.log engine.render.stage

      #engine.render.container = new PIXI.DisplayObjectContainer()

      ##container.addChild @s
      #engine.render.stage = new PIXI.Stage()
      console.log engine.render.Stage
      engine.render.stage.addChild(render.container)

      #engine.render.textures += @s
  generate: ->
    for x in [0..size.x]
      for y in [0..size.y]
        new Map.Cell x, y, 0, BLOCK.GROUND

        r = Math.randomInt 0, 100

        if r < 10
          new Map.Cell x, y, 0, BLOCK.GRAVEL
        if r > 10 and r < 20
          new Map.Cell x, y, 0, BLOCK.DIRT
        if r > 20 and r < 30
          new Map.Cell x, y, 0, BLOCK.GRASS
        if r is 90
          new Map.Cell x, y, 0, BLOCK.PUDDLE
        #if r > 95
        #  new Body x, y, 0, BLOCK.HEDGEHOD