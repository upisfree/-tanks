AI =
  enable: (bot) ->
    bot._ai = setInterval ->
      ax = +(player.x - bot.x)
      ay = +(player.y - bot.y)

      if ax < ay
        axis = 'x'

        if player.x > bot.x
          direction = 'right'
        else if player.x < bot.x
          direction = 'left'
        else if player.x is bot.x
          console.log 'Catch you on x axis'
      else
        axis = 'y'

        if player.y > bot.y
          direction = 'down'
        else if player.y < bot.y
          direction = 'up'
        else if player.y is bot.y
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