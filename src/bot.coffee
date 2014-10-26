AI =
  enable: (bot) ->
    bot._ai = setInterval ->
      ax = +(player.x - bot.x)
      ay = +(player.y - bot.y)

      if ax < ay # 11 if, 7 else
        axis = 'x'

        if player.x > bot.x
          direction = 'right'
        else if player.x < bot.x
          direction = 'left'
        else if player.x is bot.x
          if player.y > bot.y
            bot.move 0, 0, 180
          else if player.y < bot.y
            bot.move 0, 0, 0

          console.log 'Catch you on x axis'
      else
        axis = 'y'

        if player.y > bot.y
          direction = 'down'
        else if player.y < bot.y
          direction = 'up'
        else if player.y is bot.y
          if player.x > bot.x
            bot.move 0, 0, 90
          else if player.x < bot.x
            bot.move 0, 0, 270

          console.log 'Catch you on y axis!'
      
      switch direction
        when 'up'
          bot.move 0, -1, 0
        when 'right'
          bot.move 1, 0, 90
        when 'down'
          bot.move 0, 1, 180
        when 'left'
          bot.move -1, 0, 270
    , 500
  disable: (bot) ->
    clearInterval bot._ai
  random: (bot) ->
    bot._ai = setInterval ->
      direction = Math.randomInt 0, 3

      switch direction
        when 0 # up
          bot.move 0, -1, 0
        when 1 # right
          bot.move 1, 0, 90
        when 2 # down
          bot.move 0, 1, 180
        when 3 # left
          bot.move -1, 0, 270
    , 1000