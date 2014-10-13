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
            bot.move 0, 0, 360

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
          x = 0
          y = -1
          deg = 360
        when 'right'
          x = 1
          y = 0
          deg = 90
        when 'down'
          x = 0
          y = 1
          deg = 180
        when 'left'
          x = -1
          y = 0
          deg = 270

      bot.move x, y, deg
    , 500
  disable: (bot) ->
    clearInterval bot._ai