# Math
Math.randomInt = (min, max) ->
  Math.floor Math.random() * (max - min + 1) + min

Math.radiansToDegrees = (r) ->
  r * (180 / Math.PI)

Math.degreesToRadians = (d) ->
  d = 360 if d is 0 # remove?
  d * (Math.PI / 180)

Vector = Matter.Vector
Vector.fromAngle = (a) ->
  a -= Math.PI / 2 # ???
  { x: Math.cos(a), y: Math.sin(a) }

# System methods
Array::remove = (obj) ->
  for key, value of @
    if value.i == obj.i
      @.splice key, 1