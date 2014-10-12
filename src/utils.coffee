Math.randomInt = (min, max) ->
  Math.floor Math.random() * (max - min + 1) + min

drawTexture = (x, y, type, deg) ->
  img = new Image()
  img.src = "../textures/#{type}.png"
  img.onload = ->
    context.save()

    if deg?
      a = Math.PI / 180 * deg
    
      context.translate x + step / 2, y + step / 2
      context.rotate a
      context.drawImage img, -img.width / 2, -img.height / 2, img.width, img.height
    else
      context.drawImage img, x, y

    context.restore()

render = ->
  for i in blocks
    drawTexture i.x * step, i.y * step, i.type, (i.deg if i.deg)