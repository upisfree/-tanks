# Create player
player = new Player Math.randomInt(0, size.x - 1), Math.randomInt(0, size.y - 1), 0

# Create bots
for i in [0..9]
  new Bot Math.randomInt(0, size.x - 1), Math.randomInt(0, size.y - 1), 0

# Render
animate = ->
  requestAnimFrame animate

  shell.moveAll()
  setCamera()

  renderer.render stage

# Turn on
requestAnimFrame animate