AI =
  enable: (bot) ->
    bot._ai = setInterval ->
      bot.move Math.randomInt(-1, 1), Math.randomInt(-1, 1)
    , 100
  disable: (bot) ->
    clearInterval bot._ai