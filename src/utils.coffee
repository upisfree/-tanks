Math.randomInt = (min, max) ->
  Math.floor Math.random() * (max - min + 1) + min

class Vector
  constructor: (@x, @y, @deg) ->
    @deg = 360 if @deg is 0

drawTexture = (v, type) ->
  img = new Image()
  img.src = "../textures/#{type}.png"
  img.onload = ->
    context.save()

    if type is 'player' or type is 'bot'
      a = Math.PI / 180 * v.deg
    
      context.translate v.x + step / 2, v.y + step / 2
      context.rotate a
      context.drawImage img, -img.width / 2, -img.height / 2, img.width, img.height
    else
      context.drawImage img, v.x, v.y

    context.restore()

render = ->
  for i in blocks
    drawTexture new Vector(i.v.x * step, i.v.y * step, i.v.deg), i.type