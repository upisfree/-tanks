AI =
  enable: (bot) ->
    bot._ai = setInterval ->
      ax = +(player.v.x - bot.v.x)
      ay = +(player.v.y - bot.v.y)

      if ax < ay # 11 if, 7 else
        axis = 'x'

        if player.v.x > bot.v.x
          direction = 'right'
        else if player.v.x < bot.v.x
          direction = 'left'
        else if player.v.x is bot.v.x
          if player.v.y > bot.v.y
            bot.move new Vector 0, 0, 180
          else if player.v.y < bot.v.y
            bot.move new Vector 0, 0, 0

          console.log 'Catch you on x axis'
      else
        axis = 'y'

        if player.v.y > bot.v.y
          direction = 'down'
        else if player.v.y < bot.v.y
          direction = 'up'
        else if player.v.y is bot.v.y
          if player.v.x > bot.v.x
            bot.move new Vector 0, 0, 90
          else if player.v.x < bot.v.x
            bot.move new Vector 0, 0, 270

          console.log 'Catch you on y axis!'
      
      switch direction
        when 'up'
          bot.move new Vector 0, -1, 0
        when 'right'
          bot.move new Vector 1, 0, 90
        when 'down'
          bot.move new Vector 0, 1, 180
        when 'left'
          bot.move new Vector -1, 0, 270
    , 500
  disable: (bot) ->
    clearInterval bot._ai
  random: (bot) ->
    bot._ai = setInterval ->
      direction = Math.randomInt 0, 3

      switch direction
        when 0 # up
          bot.move new Vector 0, -1, 0
        when 1 # right
          bot.move new Vector 1, 0, 90
        when 2 # down
          bot.move new Vector 0, 1, 180
        when 3 # left
          bot.move new Vector -1, 0, 270
    , 1000