# Create player
player = new Player Math.randomInt(0, size - 1), Math.randomInt(0, size - 1), 'player', 3
player.enableControl()
blocks.push player

# Create bots
bot = new Bot Math.randomInt(0, size - 1), Math.randomInt(0, size - 1), 'bot', 1
AI.enable(bot)
blocks.push bot

setTimeout ->
  console.log 'ok...'
  AI.disable bot
, 2500

setInterval ->
  render()
, 16