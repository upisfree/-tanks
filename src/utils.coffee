Math.randomInt = (min, max) ->
  Math.floor Math.random() * (max - min + 1) + min

drawTexture = (x, y, type) ->
  img = new Image()
  img.src = "../textures/#{type}.png"
  img.onload = ->
    context.drawImage img, x, y

drawTexture2 = (x, y, type, deg) ->
  img = new Image()
  img.src = "../textures/#{type}.png"
  img.onload = ->
    context.save()

    #context.translate canvas.width, canvas.height
    #context.rotate deg * 2 + Math.PI / 180
    #context.translate -canvas.width, -canvas.height

    a = Math.PI / 180
    a *= deg if deg isnt 0
    
    context.translate x, y
    context.rotate a
    context.drawImage img, -img.width / 2, -img.height / 2

    #context.drawImage img, x, y
    context.restore()


render = ->
  for i in blocks
    #if i.deg
    #  drawTexture2 i.x * step, i.y * step, i.type, i.deg
    #else
    drawTexture i.x * step, i.y * step, i.type