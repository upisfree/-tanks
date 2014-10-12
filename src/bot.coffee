AI =
  enable: (bot) ->
    bot._ai = setInterval ->
      state = Math.randomInt(0, 3)

      switch state
        when 0
          x = 0
          y = -1
          deg = 360
        when 1
          x = 1
          y = 0
          deg = 90
        when 2
          x = 0
          y = 1
          deg = 180
        when 3
          x = -1
          y = 0
          deg = 270
      
      bot.move x, y, deg
    , 500
  disable: (bot) ->
    clearInterval bot._ai