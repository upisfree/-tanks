Map =
  Cell: class
    constructor: (@x, @y, @type, @rotation = 0) ->
      @sprite = new PIXI.Sprite PIXI.Texture.fromImage "assets/textures/map/#{@type}.png"
      @sprite.position.x = @x * Screen.step + Screen.step / 2
      @sprite.position.y = @y * Screen.step + Screen.step / 2
      @sprite.rotation = Math.degreesToRadians @rotation
      @sprite.anchor.x = 0.5
      @sprite.anchor.y = 0.5

      Engine.map.push @
  generate: ->
    for x in [0..Screen.sizeByStep.x]
      for y in [0..Screen.sizeByStep.y]
        r = Math.randomInt 0, 100

        if r < 10
          new Map.Cell x, y, 'gravel'
        else if r > 10 and r < 20
          new Map.Cell x, y, 'dirt'
        else if r > 20 and r < 30
          new Map.Cell x, y, 'grass'
        else if r is 90
          new Map.Cell x, y, 'puddle'
        else
          new Map.Cell x, y, 'ground'

        #if r > 95
        #  new Body x, y, 0, 'hedgehod'