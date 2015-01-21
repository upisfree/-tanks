Map =
  Cell: class
    constructor: (@x, @y, @type, @rotation = 0) ->
      @sprite = new PIXI.Sprite PIXI.Texture.fromImage "assets/textures/map/#{@type}.png"
      @sprite.position.x = @x * step + step / 2
      @sprite.position.y = @y * step + step / 2
      @sprite.rotation = Math.degreesToRadians @rotation
      @sprite.anchor.x = 0.5
      @sprite.anchor.y = 0.5

      engine.map.push @
  generate: ->
    for x in [0..size.x]
      for y in [0..size.y]
        r = Math.randomInt 0, 100

        if r < 10
          new Map.Cell x, y, BLOCK.GRAVEL
        else if r > 10 and r < 20
          new Map.Cell x, y, BLOCK.DIRT
        else if r > 20 and r < 30
          new Map.Cell x, y, BLOCK.GRASS
        else if r is 90
          new Map.Cell x, y, BLOCK.PUDDLE
        else
          new Map.Cell x, y, BLOCK.GROUND

        #if r > 95
        #  new Body x, y, 0, BLOCK.HEDGEHOD