# Math
Math.randomInt = (min, max) ->
  return Math.floor Math.random() * (max - min + 1) + min

Math.radiansToDegrees = (r) ->
  return r * (180 / Math.PI)

Math.degreesToRadians = (d) ->
  return d * (Math.PI / 180)

Vector = Matter.Vector
Vector.fromAngle = (a) ->
  a -= Math.PI / 2 # ???
  return { x: Math.cos(a), y: Math.sin(a) } # with “return” it's more readable

# System methods
Array::remove = (obj) ->
  for key, value of @
    if value.i == obj.i
      @.splice key, 1