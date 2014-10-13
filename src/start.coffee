# Create player
player = new Player Math.randomInt(0, size - 1), Math.randomInt(0, size - 1), 'player', 3
player.enableControl()
blocks.push player

# Create bots
for i in [0..9]
  bot = new Bot Math.randomInt(0, size - 1), Math.randomInt(0, size - 1), 'bot', 1
  AI.enable bot
  blocks.push bot

setInterval ->
  render()
, 16