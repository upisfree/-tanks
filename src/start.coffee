# Create player
player = new Player Math.randomInt(0, size - 1), Math.randomInt(0, size - 1), 0

# Create bots
for i in [0..9]
  new Bot Math.randomInt(0, size - 1), Math.randomInt(0, size - 1), 0

# Render
animate = ->
  requestAnimFrame animate

  moveShells()

  renderer.render stage

# Turn on
requestAnimFrame animate