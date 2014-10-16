# Create player
player = new Player new Vector Math.randomInt(0, size - 1), Math.randomInt(0, size - 1), 0

# Create bots
for i in [0..9]
  new Bot new Vector Math.randomInt(0, size - 1), Math.randomInt(0, size - 1), 0

# Turn on render
setInterval ->
  render()
, 16