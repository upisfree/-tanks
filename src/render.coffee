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
  i = 0

  for i in map
    if i.isRendered is false
      render.spriteBatch.addChild i.sprite
      i.isRendered = true

  for i in bodies
    Matter.RenderPixi.body engine, i

  for i in constraints
    Matter.RenderPixi.constraint engine, i

  context.render stage

# RenderPixi.clear()?