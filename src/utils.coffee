Math.randomInt = (min, max) ->
  Math.floor Math.random() * (max - min + 1) + min

drawTexture = (x, y, type) ->
  img = new Image()
  img.src = "../textures/#{type}.png"
  img.onload = ->
    context.drawImage img, x, y

render = ->
  for i in blocks
    drawTexture i.x * step, i.y * step, i.type