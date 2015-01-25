# TODO: remove when Matter.js get update in Bower
Matter.RenderPixi.create = (options) ->
  defaults =
    controller: Matter.RenderPixi
    element: null
    canvas: null
    options:
      width: 800
      height: 600
      background: '#fafafa'
      wireframeBackground: '#222'
      enabled: true
      wireframes: true
      showSleeping: true
      showDebug: false
      showBroadphase: false
      showBounds: false
      showVelocity: false
      showCollisions: false
      showAxes: false
      showPositions: false
      showAngleIndicator: false
      showIds: false
      showShadows: false

  render = Matter.Common.extend defaults, options

  # init pixi
  render.context = new PIXI.WebGLRenderer render.options.width, render.options.height, render.canvas, false, true
  render.canvas = render.context.view
  render.stage = new PIXI.Stage()

  # caches
  render.textures = {}
  render.sprites = {}
  render.primitives = {}

  # use a sprite batch for performance
  render.spriteBatch = new PIXI.DisplayObjectContainer()
  render.stage.addChild render.spriteBatch

  # insert canvas
  if Matter.Common.isElement render.element
    render.element.appendChild render.canvas
  else
    Matter.Common.log 'No "render.element" passed, "render.canvas" was not inserted into document.', 'warn'

  # prevent menus on canvas
  render.canvas.oncontextmenu = render.canvas.onselectstart = ->
    return false

  return render

# Add map rendering
Matter.RenderPixi.world = (engine) ->
  render = engine.render
  world = engine.world
  map = engine.map
  context = render.context
  stage = render.stage
  options = render.options
  bodies = Matter.Composite.allBodies world
  constraints = Matter.Composite.allConstraints world

  for i in map
    render.spriteBatch.addChildAt i.sprite, 0

  for i in bodies
    Matter.RenderPixi.body engine, i

  for i in constraints
    Matter.RenderPixi.constraint engine, i

  context.render stage

# Add tank rendering
Matter.RenderPixi.body = (engine, body) -> # I hope we don't need primitives
  render = engine.render
  bodyRender = body.render
  spriteBatch = render.spriteBatch

  if not bodyRender.visible
    return

  if bodyRender.tank # TODO: universal render, because it's just for tanks
    # add to scene graph if not already there
    if spriteBatch.children.indexOf(bodyRender.tank) is -1
      spriteBatch.addChild bodyRender.tank

    # update body sprites
    for sprite in bodyRender.tank.children
      sprite.position.x = body.position.x
      sprite.position.y = body.position.y

    bodyRender.tank.children[0].rotation = body.angle

  if bodyRender.sprite and bodyRender.sprite.texture
    spriteId = 'b-' + body.id
    sprite = render.sprites[spriteId]
    
    # initialise body sprite if not existing
    if not sprite
      sprite = render.sprites[spriteId] = Matter.RenderPixi._createBodySprite render, body

    # add to scene graph if not already there
    if spriteBatch.children.indexOf(sprite) is -1
      spriteBatch.addChild sprite

    # update body sprite
    sprite.position.x = body.position.x
    sprite.position.y = body.position.y
    sprite.rotation = body.angle

Matter.RenderPixi._getTexture = (render, imagePath) ->
  texture = render.textures[imagePath]

  if not texture
    texture = render.textures[imagePath] = PIXI.Texture.fromImage imagePath

  return texture

Matter.RenderPixi._createBodySprite = (render, body) ->
  bodyRender = body.render
  texturePath = bodyRender.sprite.texture
  texture = Matter.RenderPixi._getTexture render, texturePath
  sprite = new PIXI.Sprite texture

  sprite.anchor.x = 0.5
  sprite.anchor.y = 0.5

  return sprite

# RenderPixi.clear()?