# Create player
player = new Player new Vector(Math.randomInt(0, size - 1), Math.randomInt(0, size - 1), 0), 'player', 3
player.enableControl()
blocks.push player

# Create bots
for i in [0..9]
  bot = new Bot new Vector(Math.randomInt(0, size - 1), Math.randomInt(0, size - 1), 0), 'bot', 1
  AI.enable bot
  blocks.push bot

setInterval ->
  render()
, 16