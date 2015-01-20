Map =
  Cell: class
    constructor: (@x, @y, @rotation, @type) ->
      @sprite = new PIXI.Sprite PIXI.Texture.fromImage "assets/textures/ground/#{@type}.png"
      @sprite.position.x = @x * step + step / 2
      @sprite.position.y = @y * step + step / 2
      @sprite.rotation = Math.degreesToRadians @rotation
      @sprite.anchor.x = 0.5
      @sprite.anchor.y = 0.5

      @isRendered = false

      engine.map.push @
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